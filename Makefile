include Makefile.in

Assembly = src/Receiver/.assembly src/Forend/.assembly
Components = Frame Receiver Stock Lower FCG

Minuteman = $(foreach Component,$(Components),$(wildcard src/Receiver/$(STL_DIR)/$(Component)/Prints/*.stl)) \
                $(foreach Component,$(Components),$(wildcard src/Receiver/$(STL_DIR)/$(Component)/Fixtures/*.stl)) \
                $(foreach Component,$(Components),$(wildcard src/Receiver/$(STL_DIR)/$(Component)/Projections/))

Forends = $(filter-out src/Forend/Assembly/%, \
            $(shell find src/Forend/ -ipath '*_*/Prints/*.stl' ) \
	    $(shell find src/Forend/ -ipath '*_*/Fixtures/*.stl' ) \
	    $(shell find src/Forend/ -ipath '*_*/Projections/*.dxf'))

ZIP_TARGETS:=changelog.txt .build/Liberator12k-source/
DIST:=dist/Liberator12k.zip dist/Liberator12k-source.zip dist/Liberator12k-assembly.zip
TARGETS:=$(ZIP_TARGETS) $(DIST)

.build/Liberator12k-source/: .git
	rm -rf $@ && \
	git clone --depth=1 "file://$(CURDIR)" $@ && \
	cd $@ && \
	git remote set-url origin https://github.com/JeffreyRodriguez/Liberator12k.git

dist/Liberator12k.zip: $(SUBDIRS) $(ZIP_TARGETS)
	zip -9r $@ $(ZIP_TARGETS) $(Minuteman) $(Forends)

dist/Liberator12k-source.zip: .build/Liberator12k-source/
	zip -9r $@ $^

dist/Liberator12k-assembly.zip: $(SUBDIRS)
	zip -9r $@ $(Assembly)

$(DIST): dist/
dist/:
	mkdir -p $@

.views: Views.mk
	mkdir -p $@
	$(MAKE) -f Views.mk all

clean-dir:
	rm -rf $(ASSEMBLY_DIR) $(BUILD_DIR) $(EXPORT_DIR) $(VIEWS_DIR)
	rm -rf $(TARGETS) changelog.txt .build/Liberator12k-source/ dist/
clean-dir:

all: $(SUBDIRS) $(TARGETS)

TAGS = dev

.PHONY: $(TAGS)

dev:
	cd $@ && docker build -t dehy/symfony2:$@ .

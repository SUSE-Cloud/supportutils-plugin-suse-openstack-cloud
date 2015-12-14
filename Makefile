SCRIPTS=suse_openstack_cloud $(wildcard *.sh)

test: bash-check tabs-check bashate unit-tests

bash-check:
	@for f in $(SCRIPTS); do \
	    echo "bash -n $$f"; \
	    bash -n $$f || exit; \
	done

tabs-check:
	@for f in $(SCRIPTS); do \
	    echo "Checking $$f for tabs"; \
	    ! grep -P '\t' $$f || exit; \
	done

bashate:
	@for f in $(SCRIPTS); do \
	    echo "bashate $$f"; \
	    bashate --ignore=E006 $$f || exit; \
	done

unit-tests:
	SUSECLOUD_PLUGIN_TEST=y ./suse_openstack_cloud

suseinstall:
	sudo zypper install python-bashate


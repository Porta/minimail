C8 = ./node_modules/.bin/component
SRC = $(wildcard lib/*/*.js)
APP = /tmp/minimail.nw

run: build
	@rm -f $(APP)
	zip -rq $(APP) *
	open -n -a node-webkit $(APP)

build: node_modules components $(SRC)
	@$(C8) build --standalone minimail

components:
	@$(C8) install

node_modules: package.json
	@npm install

clean:
	rm -fr build

distclean: clean
	rm -fr components

.PHONY: clean distclean run

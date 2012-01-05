
ADDON = build/default/canvas.node

$(ADDON): src/*.cc
	node-waf configure build

test: $(ADDON)
	@./node_modules/.bin/mocha \
		--ui exports \
		--require should \
		test/*.test.js

test-server: $(ADDON)
	@node test/server.js

benchmark:
	@node benchmarks/run.js

clean:
	node-waf distclean

.PHONY: test test-server benchmark clean
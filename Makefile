KEYMAP_SRC = config/eyelash_sofle.keymap
YAML_OUT = config/eyelash_sofle.yaml
SVG_OUT = config/eyelash_sofle.svg
BOARD = eyelash_sofle

.PHONY: all draw build clean

all: draw build

draw:
	keymap parse -z $(KEYMAP_SRC) > $(YAML_OUT)
	keymap draw --layout eyelash_sofle $(YAML_OUT) > $(SVG_OUT)

build:
	@rm -rf build
	@mkdir -p build
	cp -rL $$(nix build . --no-link --print-out-paths)/* build/

clean:
	rm -rf build result $(YAML_OUT) $(SVG_OUT)


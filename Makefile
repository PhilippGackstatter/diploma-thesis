src_files := $(shell find figures/drawio/ -name '*.drawio')

transpiled_files := $(patsubst figures/drawio/%.drawio,figures/%.pdf,$(src_files))

# all: $(transpiled_files)

figures/%.pdf: figures/drawio/%.drawio
	drawio --crop -x -o $@ $<

all: thesis.tex $(transpiled_files)
	docker exec -w /workspace -u root latex bash build_thesis.sh

clean:
	docker exec -w /workspace -u root latex latexmk -c
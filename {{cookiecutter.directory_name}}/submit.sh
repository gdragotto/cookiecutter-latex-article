# Delete previous submission folder
rm -rf submission && mkdir submission
# Flatten file and remove comments
latexpand --empty-comments {{cookiecutter.file_name}}.tex > {{cookiecutter.file_name}}_arXiv.tex
# Move into submission folder
mv {{cookiecutter.file_name}}_arXiv.tex ./submission/{{cookiecutter.file_name}}_arXiv.tex
cp data ./submission/data
cp bibliography.bib ./submission/bibliography.bib
# Compile and generate bbl
cd submission
pdflatex {{cookiecutter.file_name}}_arXiv && bibtex {{cookiecutter.file_name}}_arXiv
pdflatex {{cookiecutter.file_name}}_arXiv && pdflatex {{cookiecutter.file_name}}_arXiv
tar czvf arxiv.tar.gz ./*
mv arxiv.tar.gz ../arxiv.tar.gz
rm -rf submission
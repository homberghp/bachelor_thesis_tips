![CI](https://github.com/sebivenlo/tex-thesis-skeleton/workflows/CI/badge.svg)

# tex-thesis-skeleton
A more simplified TEX thesis template that compiles without problems. This could be used for students for their bachelor/master thesis.

Many thanks to [Jurian Janssen](https://github.com/Woeler) for setting this up.

## Get it running automatically via CI on github

Although possible github actions, has the following drawbacks:

* It increases your waiting time when doing edit compile verify, which is quite normal when working with source code.
* It is more wasteful, energy wise. Uploading to the remote machine, have the server compile and get the result back costs cpu cycles in the whole chain. It may also cost you your credits on the server infra structure.
* It will eat up you github free tokens. This even more serious when you are using shared tokens.

If you stil insist, you can use your github repository as automated build system. It can also build your PDF file automatically.

- If you now click on "Actions" tab
- then on on a finished build
- then on **pdf**
- a pdf will be downloaded which is the result of the automated build

See how to do it.

### Fork the repository

You can fork the repository, then you immediatly have the github action file working for you and producing the pdf. See above how you
then can access the pdf which will be created automatically on each push to master.

I you want to have a **private** repository, you can't just fork it, as a public repository can't be made into a private one.
Easiest is to create your own repository, download the code from this one as a zip and the selectively put the files from the zip into that repository. 

Remember, if you do that, please keep a link in your README.md to this one for crediting. Thanks!

### Use this as a template repository

Another option is to use this as template repository, just click on **use htis template** button.

<img width="136" alt="image" src="https://user-images.githubusercontent.com/764295/78676875-54943900-78e7-11ea-9e5d-a23cab84ef24.png">


## Get it running manually on your machine

This manual building can be done also if you forked it, or created an own repository.
The prerequisties to build it on your own machine is a LaTeX installation. We recommend TexLive, because that brings 
most rquired programs and it also plays nicely with git and git-bash. 
As editor you can use visual studio code or texstudio. To build the document we have a Makefile ready
which depends on GNU-Make. 

To simply run the latex processor once type `pdflatex main.tex`.

### Build on mac/linux with make
```
make
```
On Linux, Mac or Windows install texlive and you are good to go. Using it in combination with git-bash and GNU Make allows you to use make.

## Get it running on windows
- Install TexLive  https://tug.org/texlive/ follow the instructions there
- Install Perl     http://strawberryperl.com/ for texcount
- Then build it.

### Build without latex installation.

In the repo https://github.com/sebivenlo/xelatexd, we created a Dockerfile to create a docker image which
creates a full texlive latex installation. It also provides two scripts that start the docker container and run
you latex commands inside the container. The Makefile in this directory shows how to use it. 

### Buildingt on overleaf.

https://www.overleaf.com provides a well engineered and very complete LaTeX build service. It also has excellent documentation.
It can be used for free, but is then limited to the number and size of your builds. For a reasonable fee, you use their standard features, which may be advisable. To build on overleaf, simply upload the zip file (or the trimmed down zipfile) to overleaf.
To make the best of the build budget, use the `\includeonly` facility of latex wisely. It will also speed up your builds when you are working on one or two chapters.

## Optional configuration
You may enable line numbering by creating an empty file in the root directory named `linenumberingOn.tex`.

You can find the resulting [main.pdf](docs/main.pdf) in the docs directory.


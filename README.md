[![Travis CI](https://img.shields.io/travis/urdh/skrapport/master.svg)](http://travis-ci.org/urdh/skrapport)
[![CTAN: Version](https://img.shields.io/ctan/v/skrapport.svg)](http://www.ctan.org/pkg/skrapport)
[![CTAN: License](https://img.shields.io/ctan/l/skrapport.svg)](http://www.ctan.org/pkg/skrapport)
```
%% skrapport Skånings rapportklass
%%
%% Copyright (C) 2012-2016 by Simon Sigurdhsson <sigurdhsson@gmail.com>
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Simon Sigurdhsson.
%%
%% This work consists of the file skrapport.tex and the derived files:
%%  * skrapport.cls
%%  * skrapport-colortheme-default.sty
%%  * skrapport-colortheme-unscathed.sty
%%  * skrapport-colortheme-violet.sty
%%  * skrapport-colortheme-cruelwater.sty
%%  * skrapport-colortheme-skdoc.sty
%%  * skrapport-size-common.sty
%%  * skrapport-size10pt.clo
%%  * skrapport-size11pt.clo
%%  * skrapport-size12pt.clo

This is version 0.12f of the skrapport document class, intended for simple
reports submitted by the author at Chalmers University of Technology.

The following files are enclosed.

  README        - This file
  Makefile      - GNU Makefile for making the package and documentation
  skrapport.tex - LaTeX source code of the class and documentation
  skrapport.pdf - PDF version of the documentation

Installation notes:
The easiest way to install this package, assuming you have obtained the
source code from Github or CTAN, is to simply run `make install`. This
will generate package code and documentation, install it into TEXMFHOME
and run `mktexlsr`. If you wish to compile the package but not install
it, run `make all` instead. If you insist on doing it manually, remember
that you must use `pdflatex` (not `tex` or `latex`).
```

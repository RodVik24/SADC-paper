%  customization for PANDA STT Technical Design Report

\def\fileversion{1.04}
\def\filedate{2005/01/13}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{panda_book}
              [\filedate\space v\fileversion\ Panda Technical Documents]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\PassOptionsToClass{pdftex,a4paper,10pt,twoside,twocolumn}{report}
\ProcessOptions
\LoadClass{report}
\RequirePackage{graphicx,epsfig,rotating}
\PassOptionsToClass{pdftex}{graphicx}
\ProcessOptions
\RequirePackage{acronym}
\RequirePackage{epstopdf}
\RequirePackage{hyperref}
\PassOptionsToClass{pdftex,bookmarks}{hyperref}
\ProcessOptions
%\RequirePackage{subfigure}
%\RequirePackage[latin1]{inputenc}
\RequirePackage[config]{subfig}
%\RequirePackage{here}
\RequirePackage{float}
\RequirePackage{amssymb}
\RequirePackage{makeidx}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{fix2col}
\RequirePackage{fixltx2e}
\RequirePackage{multirow}
\@mparswitchtrue
% typeset caption contents in small

\long\def\@makecaption#1#2{%
   \vskip 10\p@
   \setbox\@tempboxa\hbox{#1: {\small #2}}%
   \ifdim \wd\@tempboxa >\hsize
       #1: {\small #2}\par
     \else
       \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
   \fi}
 
\def\@makechapterhead#1{%
   \twocolumn[%
       \begin{minipage}{\textwidth}%
                 \raggedright
                \huge \bfseries \sffamily  \thechapter\quad #1\par
            \vspace*{-3mm}%
            \rule{\textwidth}{0.8pt}%
            \vspace*{+8mm}%
       \end{minipage}%
   ]%
}
 
\def\@makeschapterhead#1{%
   \twocolumn[%
       \begin{minipage}{\textwidth}%
                 \raggedright
                \huge \bfseries \sffamily  #1\par
            \vspace*{-3mm}%
            \rule{\textwidth}{0.8pt}%
            \vspace*{+8mm}%
       \end{minipage}%
   ]%
}
 
\def\chapter{\thispagestyle{plain}\secdef\@chapter\@schapter}
 
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \typeout{\@chapapp\space\thechapter.}%
        \addcontentsline{toc}{chapter}{\protect
        \numberline{\thechapter}#1}\else
      \addcontentsline{toc}{chapter}{#1}\fi
   \chaptermark{#1}%
   \addtocontents{lof}%
       {\protect\addvspace{10\p@}}
   \addtocontents{lot}%
       {\protect\addvspace{10\p@}}
   \@makechapterhead{#1}
}
\def\@schapter#1{\@makeschapterhead{#1}}
 
\def\section{\@startsection {section}{1}{\z@}{-3.5ex plus-1ex minus
    -.2ex}{2.3ex plus.2ex}{\reset@font\Large\raggedright \bfseries \sffamily}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus-1ex
    minus-.2ex}{1.5ex plus.2ex}{\reset@font\large\raggedright \bfseries \sffamily}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
    -1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize
    \raggedright \bfseries \sffamily}}
\def\paragraph{\@startsection
    {paragraph}{4}{\z@}{3.25ex plus1ex minus.2ex}{-1em}{\reset@font
    \normalsize \bfseries \sffamily}}
\def\subparagraph{\@startsection
     {subparagraph}{4}{\parindent}{3.25ex plus1ex minus
     .2ex}{-1em}{\reset@font\normalsize \bfseries \sffamily}}
 
\setcounter{secnumdepth}{4}
% allows 4 levels of sections, e.g. '5.3.2.1 The Blablabla'
% sequence: \section \subsection \subsubsection \paragraph
%
 
\def\ps@headings{\let\@mkboth\markboth
  \def\@oddfoot{}\def\@evenfoot{}%       No feet.
  \def\@evenhead{\rm \thepage\hfil \sl \leftmark}%        Left heading.
  \def\@oddhead{{\sl \rightmark}\hfil \rm\thepage}% Right heading.
  \def\chaptermark##1{\markboth {\uppercase{%
    \thechapter\hskip 1em\relax ##1}}{}}%
  \def\sectionmark##1{\markright {%
          \thesection\hskip 1em\relax ##1}}}
\def\ps@plain{\let\@mkboth\markboth
  \def\@oddfoot{}\def\@evenfoot{}%       No feet.
  \def\@evenhead{\rm \thepage\hfill}%                     Left heading.
  \def\@oddhead{\hfill \rm\thepage}% Right heading.
  \def\chaptermark##1{\markboth {\uppercase{%
    \thechapter\hskip 1em\relax ##1}}{}}%
  \def\sectionmark##1{\markright {%
          \thesection\hskip 1em\relax ##1}}}
 
 
% choose page style and dimensions
 
\pagestyle{headings}
%\ps@headings
\pagenumbering{arabic}
 
\setlength{\oddsidemargin}{15mm}
\setlength{\evensidemargin}{10mm}
\setlength{\textwidth}{165mm}
\setlength{\textheight}{235mm}
 
\def\bibname{References}
 
\newenvironment{newthebibliography}[1]
%\def\thebibliography#1
{\section*{\bibname\@mkboth{\bibname}{\bibname}}%
      \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
%            \if@openbib
%              \advance\leftmargin\bibindent
%              \itemindent -\bibindent
%              \listparindent \itemindent
%              \parsep \z@
%            \fi
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand{\theenumiv}{\arabic{enumiv}}}%
%      \if@openbib
%        \renewcommand{\newblock}{\par}
%      \else
        \renewcommand{\newblock}{\hskip .11em \@plus.33em \@minus.07em}%
%      \fi
      \sloppy\clubpenalty4000\widowpenalty4000%
      }
     % \sfcode`\.=\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `thebibliography' environment}}%
%      \endlist}

% adjust indent for table of content
\renewcommand{\l@section}{\@dottedtocline{1}{0.6em}{2.9em}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{1.2em}{3.8em}}
\renewcommand{\l@subsubsection}{\@dottedtocline{3}{2.5em}{4.0em}}
\renewcommand{\l@paragraph}{\@dottedtocline{4}{3.5em}{4.5em}}
\renewcommand{\l@subparagraph}{\@dottedtocline{5}{4.5em}{5.0em}}
 
% adjust spacing between rows in tables
\renewcommand{\arraystretch}{1.05}
%
\setlength{\parskip}{1.5mm}
\setlength{\parsep}{0mm}
\setlength{\itemsep}{\parsep}
\setlength{\parindent}{0mm}
\setlength{\listparindent}{\parindent}
\setlength{\textwidth}{16cm}
\setlength{\textheight}{23.4cm}
\setlength{\topmargin}{-1.5cm}
\setlength{\oddsidemargin}{0.5cm}
\setlength{\evensidemargin}{-0.5cm}
\renewcommand{\textfraction}{0.00}
\renewcommand{\topfraction}{1.00}
\renewcommand{\bottomfraction}{0.50}
\renewcommand{\floatpagefraction}{1.00}
\renewcommand{\dbltopfraction}{1.00}
\renewcommand{\dblfloatpagefraction}{1.00}
\setcounter{topnumber}{10}
\setcounter{dbltopnumber}{10}
\setcounter{bottomnumber}{10}
\setcounter{totalnumber}{99}
% float width
\newlength{\hwidth}%
\newlength{\swidth}%
\newlength{\dwidth}%
\setlength{\hwidth}{3.5cm}%
\setlength{\swidth}{\columnwidth}%
\setlength{\dwidth}{\textwidth}%
\addtolength{\swidth}{-1em}%
\addtolength{\dwidth}{-1em}%
% 
\usepackage{bm}%
\usepackage{./sty/cuted}%
%
\usepackage{eurosym}%
\usepackage{ftnright}%
\usepackage[sectionbib]{chapterbib}%
%
\setlength{\doublerulesep}{\arrayrulewidth}%
%
% Style and Symbols
%
\input{./sty/panda_commands}
\input{./sty/panda_symbols}
\input{./sty/panda_detector}
%
%
\pagestyle{myheadings}
%
\clubpenalty = 1000
\widowpenalty = 1000
\displaywidowpenalty = 1000
%\looseness=1
%\pretolerance=2000
\tolerance=5000
%\sloppy
%
% footnote with line separator 
%
\renewcommand{\footnoterule}{\rule{0.8\swidth}{0.1mm}\vspace{2mm}}
%
\usepackage{units} % from TW: to be able to use non-separeted number+units in the text
\usepackage{mathcomp} %from TW: to use a nicer -non-itailic- \tcmu instead of italic \mu in the text!
%\usepackage{url} %% from TW: URL links

% for first draft of  delivered MVD volume: make the overall tracking intro chapter '0'
%\setcounter{chapter}{-1}

\endinput

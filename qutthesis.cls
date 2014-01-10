% ----------------------------------------------------------------------------
%
% QUT THESIS
% A PhD thesis document class for the Queensland University of Technology
%
% file:   qutthesis.cls
% author: Hilton Bristow
% date:   2014/01/01
%
% ----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qutthesis/qutthesis}[2014/01/01 QUT PhD Thesis Class]

% ----------------------------------------------------------------------------
% EXTEND THE BOOK CLASS
% ----------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass{book}

% ----------------------------------------------------------------------------
% REQUIRED PACKAGES
% ----------------------------------------------------------------------------
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{ifthen}
\RequirePackage{wallpaper}
\RequirePackage{xspace}
\RequirePackage{xparse}
\RequirePackage{xstring}
\RequirePackage{datatool}
\RequirePackage{graphicx}
\RequirePackage{import}
\RequirePackage[margin=1.25in,bindingoffset=0.5in]{geometry}
\RequirePackage{setspace}
\RequirePackage[ocgcolorlinks,pagebackref=true,bookmarks=true]{hyperref}
\hypersetup {
  bookmarksopen=true,
  pdffitwindow=true,
	linkcolor=RoyalBlue,
	citecolor=RedViolet,
	urlcolor=RoyalBlue
}

% ----------------------------------------------------------------------------
% AUTHOR DOCUMENT PREAMBLE
% ----------------------------------------------------------------------------
\makeatletter
\newcommand\subtitle[1]{\renewcommand\@subtitle{#1\xspace}}
\newcommand\@subtitle{}
\newcommand\email[1]{\renewcommand\@email{\href{mailto:#1}{#1}\xspace}}
\newcommand\@email{}
\newcommand\phone[1]{\renewcommand\@phone{#1\xspace}}
\newcommand\@phone{}
\newcommand\university[1]{\renewcommand\@university{#1\xspace}}
\newcommand\@university{}
\newcommand\department[1]{\renewcommand\@department{#1\xspace}}
\newcommand\@department{}
\newcommand\address[1]{\renewcommand\@address{#1\xspace}}
\newcommand\@address{}
\newcommand\logo[1]{\renewcommand\@logo{#1}}
\newcommand\@logo{}
\newcommand\degree[1]{\renewcommand\@degree{#1\xspace}}
\newcommand\@degree{}
\newcommand\supervisor[1]{\renewcommand\@supervisor{#1\xspace}}
\newcommand\@supervisor{}
\newcommand\hod[1]{\renewcommand\@hod{#1\xspace}}
\newcommand\@hod{}
\newcommand\keywords[1]{\renewcommand\@keywords{#1}}
\newcommand\@keywords{}

% write document preamble into pdf meta
\AtBeginDocument{
  \hypersetup{
    pdftitle=\@title: \@subtitle,
    pdfauthor=\@author,
    pdfsubject=\@university \@degree Thesis,
    pdfkeywords=\@keywords
  }
}

% ----------------------------------------------------------------------------
% FRONT MATTER
% ----------------------------------------------------------------------------

% TITLE
\renewcommand{\maketitle}{

  \begin{titlepage}
    \centering
    \makebackground
    \vspace*{2in}
    \Huge\bf\@title\\
    \Large\@subtitle\\
    \vspace{0.5in}
    \large\sl
    by\\
    \bf\@author
    \medskip\\
    \rm
    \@department\\
    \@university\\
    \vspace{3in}
    A thesis submitted for the\\
    \@degree\\
    \smallskip
    \normalsize
    \@date
  \end{titlepage}

  \clearpage

  \vspace*{\fill}
  \begin{center}
  {\bf Keywords:} \@keywords.
  \end{center}

  \clearpage
}

% LOGO
\newcommand{\makelogo}{
\put(-100,350){
\parbox[b][\paperheight]{\paperwidth}{
\vfill
\centering
\includegraphics[width=0.6\textwidth]{qutthesis/logo}
\vfill
}}}

% BACKGROUND
\newcommand{\makebackground}{
\ThisCenterWallPaper{1}{qutthesis/background}
\AddToShipoutPicture*{\makelogo}
}

% COVER LETTER
\newcommand{\coverletter}{
  \input{qutthesis/coverletter}
}


% ------------------------------------------------------------------------------------------
% CUSTOM SECTION TYPES
% ------------------------------------------------------------------------------------------

% DEDICATION
\newcommand{\dedication}[1]{
\topskip0pt
\vspace*{0.4\textheight}
\begin{center}
\emph{#1}
\end{center}
%\cleardoublepage
}

% ABSTRACT
\newenvironment{abstract}
{\chapter*{\centering \huge Abstract}
\vspace*{-0.25in}
\begin{quote}}
{\end{quote}}

% ACKNOWLEDGEMENTS
\newenvironment{acknowledge}
{\chapter*{\centering \huge Acknowledgements}
\vspace*{-0.25in}
\begin{quote}}
{\end{quote}}


% ------------------------------------------------------------------------------------------
% CUSTOM COMMANDS
% ------------------------------------------------------------------------------------------

% Chapter
% Chapter with a subtitle
\newcounter{subcounter}[chapter]
\newcommand{\Chapter}[2]{\chapter[#1]{#1\ifx&#2&\else:\\[1ex]\Large#2\fi}\setcounter{subcounter}{2}}

% RomanSubsection
% A subsection with roman numerals
\newcommand{\RomanSubsection}{\subsection*{\centering\Roman{subcounter}}\addtocounter{subcounter}{1}}

\def\signed #1{{\leavevmode\unskip\nobreak\hfil\penalty50\hskip2em
  \hbox{}\nobreak\hfil#1%
  \parfillskip=0pt \finalhyphendemerits=0 \endgraf}}

% authorquote
% A quote with author information/citation
\newsavebox\mybox
\newenvironment{authorquote}[1]
  {\savebox\mybox{\textsc{-- #1}}\begin{quote}}
  {\signed{\usebox\mybox}\end{quote}}

% rightquote
% A right-aligned quote
\newenvironment{rightquote}
  {\list{}{\rightmargin=0\leftmargin}\raggedleft\item\relax}
  {\endlist}
 
% chapterquote
% chapter-beginning quote
\newcommand{\chapterquote}[2]{
\begin{rightquote}
\emph{``#1''}\\
\textsc{-- #2}
\end{rightquote}}

QUT Thesis
=========
A LaTeX thesis class for PhD students at the Queensland University of Technology (QUT)

Introduction
------------
This set of files provides the `qutthesis` LaTeX class, which defines a set of styles and preamble specific to QUT's submission guidelines for a PhD dissertation.

Usage
-----
This repo is designed to be placed either within your working tree, or in your `texmf` folder. Ie.

    -- Thesis/
        -- thesis.tex
        -- abstract.tex
        -- chapter1.tex
        -- chapter2.tex
        -- chapter3.tex
        -- acknowledgements.tex
        -- citations.bib
        -- qutthesis/  <-- this repo
            -- qutthesis.cls   // main class declarations
            -- background.png  // background image for title page
            -- logo.pdf        // logo for title page
            -- coverletter.tex // auto-gen cover letter template

The beginning of your thesis.tex can then be declared as follows:

	% ------------------------------------------------------------------
	% QUT THESIS
	% ------------------------------------------------------------------
	\documentclass[10pt,a4paper]{qutthesis/qutthesis}
	
	% ------------------------------------------------------------------
	% PREAMBLE
	% ------------------------------------------------------------------
	\title{A \LaTeX Template}
	\subtitle{For QUT Doctorate of Philosophy Theses}
	\keywords{latex, template, QUT, PhD, thesis}
	\author{Hilton Bristow}
	\supervisor{Dr Who}
	\email{hilton.bristow@gmail.com}
	\phone{(+61) 123 456 789}
	\university{The Queensland University of Technology}
	\department{School of Electrical Engineering and Computer Science}
	\hod{Professor Martin Betts}
	\address{Brisbane City 4000, Australia}
	\degree{Doctorate of Philosophy}
	\date{\today}
	
	% ------------------------------------------------------------------
	% FRONT MATTER
	% ------------------------------------------------------------------
	\begin{document}
	\frontmatter
	\maketitle
	\coverletter
	\dedication{To those who seek knowledge for the satisfaction of the mind}
	\input{abstract}
	\input{acknowledgements}
	\tableofcontents
	
	% ------------------------------------------------------------------
	% MAIN MATTER
	% ------------------------------------------------------------------
	\mainmatter
	\input{chapter1}
  \input{chapter2}
	\end{document}

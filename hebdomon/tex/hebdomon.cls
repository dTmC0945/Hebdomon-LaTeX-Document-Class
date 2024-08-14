% Hebdomon document class for use in report and assessment writing
% Written by D. T. McGuiness: dtm@mci4me.at

% v0.1 - Angry Avocado [WS2024]

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{hebdomon}[2024/08/08 v0.1 Report and Documentation standard]

% This document is based on the excellent KOMA Script scrreprt class
% The following options are declared beforehand.

\RequirePackage{ifthen} % require an if-else loop to
% choose depending on the field

% Allows students to choose which package for code printing.

\newboolean{mnt} % set bool operator for minted
\newboolean{lst} % set bool operator for lstlisting
\newboolean{drw} % set bool operator for PGF/TikZ

%-OPTION: set option to choose minted code printing package
\DeclareOption{minted}{
	\setboolean{mnt}{true}
}

%-OPTION: set option to choose lstlisting code printing package
\DeclareOption{lstlisting}{
	\setboolean{lst}{true}
}

%-OPTION: set option to choose PGF/TikZ plotting packages
\DeclareOption{draw}{
	\setboolean{drw}{true}
}

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{scrreprt}
}
\ExecuteOptions{}
\ProcessOptions \relax

% Load the base class to create the custom template
\LoadClass[
	bibliography  = totoc,
	headings      = big,
	captions      = tableheading,
	chapterprefix = true,
]{scrreprt}

% Page Geometry -----------------------------------------------------------
% Define the default page geometry
\RequirePackage[
	left   = 3.0cm,
	right  = 2.0cm,
	top    = 2.5cm,
	bottom = 2.5cm]{geometry}

% Required Packages -------------------------------------------------------
\RequirePackage{nicematrix} % For modern table design
\RequirePackage{booktabs}   % To access \midrule \toprule \bottomrule

% For use in referencing purposes
\RequirePackage[
	backend=bibtex]{biblatex}

\RequirePackage{graphicx}   % To enable image insertion
\RequirePackage{environ}    % To allow new environments with Environ


\RequirePackage{lmodern}
\RequirePackage[sfdefault]{FiraSans}

\RequirePackage{minitoc}
\RequirePackage{setspace}

\RequirePackage{hyperref}  % Allow the use of hyperlink within document

\RequirePackage{enumitem}

\RequirePackage{amsmath}

\usepackage[labelfont=bf]{caption} % Set the caption style to bold

\RequirePackage{titlesec}

% %%%%% ----- Colour Definitions ------ %%%%%
\RequirePackage{xcolor}

% Define the MCI colours.
\definecolor{mciRed}{HTML}{821131}
\definecolor{mciBlue}{HTML}{004983}
\definecolor{mciOrange}{HTML}{fe640b}
\definecolor{quoteColour}{HTML}{CBA6F7}
\definecolor{nord7}{HTML}{81a1c1}
\definecolor{norda}{HTML}{bf616a}
\definecolor{nord9}{HTML}{5e81ac}
\definecolor{nord13}{HTML}{ebcb8b}
\definecolor{nord14}{HTML}{a3be8c}

% %%%%% ----- Code Presentation ----- %%%%%
% To make this class more compatible and avoid questions about pygments,
% the author has decided to use listings for code presentation, instead of
% minted.
\RequirePackage{listings}

\lstset{
	aboveskip={1.3\baselineskip},
	basicstyle=\small\ttfamily\linespread{4},
	breaklines=false,
	backgroundcolor = \color[HTML]{eff1f5},
	columns=flexible,
	commentstyle=\color[HTML]{6c6f85}\ttfamily,
	escapechar=@,
	extendedchars=true,
	identifierstyle=\color{black},
	inputencoding=latin1,
	keywordstyle=\color[HTML]{fe640b},
	language=Python,
	ndkeywordstyle=\color[HTML]{228B22},
	numbers=left,
	numberstyle=\tiny,
	prebreak = \raisebox{0ex}[0ex][0ex]{\ensuremath{\hookleftarrow}},
	showstringspaces=false,
	stringstyle=\color[HTML]{40a02b}\ttfamily,
	upquote=true,
	emph={None},
	emphstyle={\color[HTML]{FE640B}},
	%	keywordstyle=[1]{\color[HTML]{8839ef}},
	%	morekeywords={(,)},
	keywordstyle=[2]\color[HTML]{D20F39},
	keywordstyle={[3]\color[HTML]{8839ef}},
	keywords=[3]{x},
}

% \lstset{style=mystyle}

% New Environment Definitions ---------------------------------------------
% To create environments tcolorbox package is required to make them
% aesthetically pleasing.
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable, minted, skins,theorems, hooks, most}

% %%%%% ----- tcolorbox Templates ----- %%%%%

% Define the excerpt environment style.
\tcbset{%
	quoteTemplate/.style={%
			enhanced,
			breakable,
			arc=0pt,
			outer arc=0pt,
			toprule=0pt,
			rightrule=0pt,
			bottomrule=0pt,
			leftrule=1mm,
			colback=white,
			colframe=mciRed,
			detach title
		}%
}%

\tcbset{%
	blockTemplate/.style={%
			enhanced,
			breakable,
			arc=0pt,
			outer arc=0pt,
			toprule=0pt,
			rightrule=0pt,
			bottomrule=0pt,
			leftrule=1mm,
			colback=#1!25,
			colframe=#1,
			coltitle=black,
			detach title
		}%
}%

% %%%%% --------------------------------%%%%%

% Environment used to insert quotations.
\NewEnviron{excerpt}[1][]{%
	\begin{tcolorbox}[blockTemplate=nord7]
		\BODY
	\end{tcolorbox}
}%

\NewEnviron{example}[1][]{%
	\begin{tcolorbox}[blockTemplate=nord14]
		\BODY
	\end{tcolorbox}
}%

\NewEnviron{highlight}[1][]{%
	\begin{tcolorbox}[blockTemplate=nord13]
		\BODY
	\end{tcolorbox}
}%

\NewEnviron{theory}[1][]{%
	\begin{tcolorbox}[blockTemplate=black]
		\BODY
	\end{tcolorbox}
}%

\NewEnviron{warning}[1][]{%
	\begin{tcolorbox}[blockTemplate=norda]
		\BODY
	\end{tcolorbox}
}%

\NewEnviron{hgitemize}[1][]{%
	\begin{itemize}[leftmargin=!,labelindent=-29.2pt]
		\BODY
	\end{itemize}
}%





% KOMA-Script Configuration -----------------------------------------------

\addtokomafont{chapterprefix}{\raggedleft}
\addtokomafont{chapter}{\fontsize{30}{38}\selectfont}
\addtokomafont{section}{\huge}
\addtokomafont{subsection}{\Large}
\addtokomafont{subsubsection}{\large}

% Set the fontstyle of minitoc to that of the document
\renewcommand{\mtifont}{\large\sffamily}
\renewcommand{\mtcfont}{\small\sffamily}
\renewcommand{\mtcSfont}{\small\sffamily}
\renewcommand{\mtcSSfont}{\small\sffamily}
\renewcommand{\mtcSSSfont}{\small\sffamily}

\newcommand{\StudentName}[1]{\author{#1}}

% Set the depth of TOC
\setcounter{secnumdepth}{3} % number subsubsections
\setcounter{tocdepth}{3} % list subsubsections

% Configure the document titles
\newcommand{\Chapter}[1]{\chapter{\textcolor{mciBlue}{#1}}\minitoc}
\newcommand{\Section}[1]{\section{\textcolor{mciBlue}{#1}}}
\newcommand{\Subsection}[1]{\subsection{\textcolor{mciBlue}{#1}}}
\newcommand{\Subsubsection}[1]{\subsubsection{\textcolor{mciBlue}{#1}}}

\newcommand{\hlight}[1]{\textcolor{mciOrange}{#1}}


% Configure the baseline of the document
\renewcommand{\baselinestretch}{1.2}

\renewcommand*{\chapterformat}{%
	\mbox{\scalebox{1.5}{\chapappifchapterprefix{\nobreakspace}}%
		\scalebox{4}{\color{mciRed}\thechapter\autodot}\enskip}}

\newcommand{\heading}[1]{\subsubsection*{$\blacksquare$ #1}}
\newcommand{\marginsecnumber}[1]{%
	\makebox[0pt][r]{#1\hspace{6pt}}%
}

\titleformat{\section} {\normalfont\Large\bfseries}
{\marginsecnumber\thesection} {0pt} {}
\titleformat{\subsection} {\normalfont\large\bfseries}
{\marginsecnumber\thesubsection} {0pt} {}
\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries}
{\marginsecnumber\thesubsubsection}
{0pt} {}
\titleformat{\paragraph}[runin]
{\normalfont\normalsize\bfseries}
{\marginsecnumber\theparagraph}
{0pt} {}
\titleformat{\subparagraph}[runin]
{\normalfont\normalsize\bfseries}
{\marginsecnumber\thesubparagraph}
{0pt}
{}

\titlespacing*{\subsection}{0pt}{*3.25}{*1.5}%

\setlength\parindent{0pt} % set no indent for the entire file

\ifthenelse{\boolean{mnt}}{%
	\RequirePackage{minted}

	\newcommand{\pcode}[1]{%
		{%
				\colorbox{gray!10}{%
					\mintinline[fontsize=\small]{text}{#1}%
				}%
			}%
	}%

	%\usemintedstyle{catppuccin-latte}

	\definecolor{catback}{HTML}{585b70}
	\definecolor{catground}{HTML}{eff1f5}

	% Set box and font rules for inputminted command for paper
	\newtcbinputlisting{\codeinputpaper}[4][]{%
		listing file={#3},
		minted language=#2,
		minted options={
				fontsize=\small,
				tabsize=4,
				xleftmargin=-2.25mm,
				numbersep=5mm,
				breaklines=true,
				highlightcolor=orange!50,
				%formatcom=orange!50
			},% <-- put other minted options inside the brackets
		overlay unbroken and first={%
				\begin{tcbclipinterior}
					\fill[catback] (frame.south west) rectangle
					([xshift=1mm]frame.north west);
					\fill[catback] (frame.north east) rectangle
					([xshift=-4mm, yshift=-10mm]frame.north east);
					\fill[catback]
					([xshift=-4mm, yshift=-10mm]frame.north east) --
					([xshift=0mm, yshift=-10mm]frame.north east) --
					([xshift=0mm, yshift=-12mm]frame.north east);
				\end{tcbclipinterior}
				\node[rotate=-90, minimum width=1cm, anchor=north,
					font=\bfseries] at ([xshift=0mm, yshift=-4mm]frame.north
				east) {\tiny \textcolor{white}{#2}}; },
		sharp corners,
		leftrule=1mm,
		toprule=0pt,
		rightrule=0pt,
		bottomrule=0pt,
		colback=catground,
		colframe=black,
		breakable,
		enhanced,% <-- put other tcolorbox options here
		arc=0mm,
		boxrule=0pt,
		frame hidden,
		listing only,
		minted options app={#1}}

	\RequirePackage{xpatch}

	\newenvironment{code}[1]
	{%
		\VerbatimEnvironment
		\begin{minted}{#1}%
}
{%
  \end{minted}%
	}
	%
	\xpatchcmd{\mintinline}{\begingroup}{\begingroup\let\itshape\relax}{}{}
	\xpatchcmd{\minted}{\VerbatimEnvironment}{\VerbatimEnvironment\let\itshape\relax}{}{}
	\xpatchcmd{\inputminted}{\begingroup}{\begingroup\let\itshape\relax}{}{}
}{}

\ifthenelse{\boolean{lst}}{%
	\RequirePackage{listings}%
	\RequirePackage{xparse}

	\NewDocumentCommand{\pcode}{v}{%
		#1%
	}

	\newenvironment{code}[1]
	{%
		\VerbatimEnvironment
		\begin{lstlisting}{language=#1}%
}
{%
  \end{lstlisting}%
	}
}{}


\ifthenelse{\boolean{drw}}{%
	\RequirePackage{pgfplots}   % Enable to draw plots in the documents
	\usepackage{tikz}           % Enable Tikz and its libraries
	\pgfplotsset{compat=1.18}   % Set the pgf compatibility.
	%
	\usepgfplotslibrary{polar}  % To access polarplot
	%
	\pgfplotsset{
		hebdomon/.style={
				minor grid style={dotted, gray!50},
				major grid style={dotted, gray!50},
				%
				grid = both,
				minor tick num=2,
				ytick align=outside,
				xtick align=outside,
				axis line style={draw=none},
				axis lines = left,
				%
				line width=2pt,
				%
				legend style = {
						line width=0.5pt
					},
				%
				every non boxed x axis/.append style={x axis line style=-},
				every non boxed y axis/.append style={y axis line style=-},
				%
			},
	}
}{}


\endinput

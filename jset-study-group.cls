\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jset-study-group}
  [2016/09/03 Yoshiki Sato]

\LoadClass[a4j, twocolumn, 11pt, uplatex, dvipdfmx]{jsarticle}

\usepackage[uplatex,jis2004]{otf}

% 古いコマンドやパッケージを警告
% nag - Detecting and warning about obsolete LaTeX commands
% http://www.ctan.org/tex-archive/macros/latex/contrib/nag
\RequirePackage[l2tabu, orthodox]{nag}

% amsmath が提供しない数式環境を使用した場合に警告
% onlyamsmath
% http://www.ctan.org/tex-archive/macros/latex/contrib/onlyamsmath
\usepackage[all, warning]{onlyamsmath}

% コメントアウト
\usepackage{comment}

% 日本語のしおり文字化け対策
\ifx\kanjiskip\undefined\else
  \usepackage{atbegshi}
  \ifx\ucs\undefined
	\ifnum 42146=\euc"A4A2
	  \AtBeginShipoutFirst{\special{pdf:tounicode EUC-UCS2}}
	\else
	  \AtBeginShipoutFirst{\special{pdf:tounicode 90ms-RKSJ-UCS2}}
	\fi
  \else
	\AtBeginShipoutFirst{\special{pdf:tounicode UTF8-UCS2}}
  \fi
	\usepackage[dvipdfmx,colorlinks=false]{hyperref}
\fi


\usepackage[top=30truemm,bottom=25truemm,left=30truemm,right=30truemm]{geometry}

%\renewcommand{\baselinestretch}{1.0} % 行送りを倍率で設定
%\setlength{\baselineskip}{9pt}       % 行送りを値で設定
\pagestyle{empty}

\begin{comment}
% ######## measure #########
% # mm = 1mm = 2.85pt      #
% # cm = 10mm = 28.5pt     #
% # in = 25.4mm = 72.27pt  #
% # pt = 0.35mm = 1pt      #
% # em = width of [M]      #
% # ex = height of [x]     #
% # zw = width of [Kanji]  #
% # zh = height of [Kanji] #
% ##########################
% ##################### Portrait Setting #########################
% # TOP = 1inch + \voffset + \topmargin + \headheight + \headsep #
% #     = 1inch + 0pt + 4pt + 20pt + 18pt (default)              #
% # BOTTOM = \paperheight - TOP -\textheight                     #
% ################################################################
\setlength{\textheight}{\paperheight}  % 紙面縦幅を本文領域にする（BOTTOM=-TOP）
\setlength{\textheight}{50\baselineskip}   % 紙面縦幅を50行にする
\setlength{\topmargin}{4.6truemm}       % 上の余白を30mm（=1inch+4.6mm）に
\addtolength{\topmargin}{-\headheight}  % 
\addtolength{\topmargin}{-\headsep}     % ヘッダの分だけ本文領域を移動させる
\addtolength{\textheight}{-40truemm}    % 下の余白は25mm（BOTTOM=-TOPだから+TOP+25mm）
% #################### Landscape Setting #######################
% # LEFT = 1inch + \hoffset + \oddsidemargin (\evensidemargin) #
% #      = 1inch + 0pt + 0pt                                   #
% # RIGHT = \paperwidth - LEFT - \textwidth                    #
% ##############################################################
\setlength{\textwidth}{\paperwidth}     % 紙面横幅を本文領域にする（RIGHT=-LEFT）

\setlength{\oddsidemargin}{4.6truemm}  % 左の余白を30mm(=1inch+4.6mm)に
\setlength{\evensidemargin}{4.6truemm} % 
\addtolength{\textwidth}{-60truemm}     % 右の余白も30mm（RIGHT=-LEFT）

%\setlength{\textheight}{\paperheight}  % 紙面縦幅を本文領域にする（BOTTOM=-TOP）
\setlength{\textheight}{45\baselineskip}   % 紙面縦幅を45行にする
\setlength{\topmargin}{4.6truemm}       % 上の余白を30mm（=1inch+4.6mm）に
\addtolength{\topmargin}{-\headheight}  % 
\addtolength{\topmargin}{-\headsep}     % ヘッダの分だけ本文領域を移動させる
%\addtolength{\textheight}{-55truemm}    % 下の余白は25mm（BOTTOM=-TOPだから+TOP+25mm）
\end{comment}

\setlength{\fullwidth}{43zw}     % 紙面横幅を43zw（20.5zw + 2zw + 20.5zw)
\setlength{\textwidth}{\fullwidth}
\setlength{\columnsep}{2zw}

\let\@etitle\@empty
\newcommand{\etitle}[1]{\gdef\@etitle{#1}}
\let\@subtitle\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\let\@esubtitle\@empty
\newcommand{\esubtitle}[1]{\gdef\@esubtitle{#1}}

\let\@abstract\@empty
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\let\@keyword\@empty
\newcommand{\keyword}[1]{\gdef\@keyword{#1}}

\let\@author\@empty
\renewcommand{\author}[1]{\gdef\@author{#1}}
\let\@eauthor\@empty
\newcommand{\eauthor}[1]{\gdef\@eauthor{#1}}

\let\@affiliation\@empty
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\let\@eaffiliation\@empty
\newcommand{\eaffiliation}[1]{\gdef\@eaffiliation{#1}}

\def\@maketitle{%
	\newpage\null
	\begin{minipage}[c]{42zw}
		\setlength{\textheight}{50\baselineskip}   % 紙面縦幅を50行にする
		\begin{center}
		\let\footnote\thanks
		\hspace{0.32cm}{\fontsize{16.06pt}{24.090pt}\selectfont\textbf{\@title} \par}%
		{\fontsize{11.041pt}{16.562pt}\@etitle\par}%
		\vspace{11.041pt}

		\if\relax\@subtitle\relax%
			\else
			{\fontsize{12.045pt}{18.067pt}\selectfont－\@subtitle－\par}%
			\if\relax\@esubtitle\relax%
				\else
				{\fontsize{10.038pt}{15.056pt}-\hspace{2mm}\@esubtitle\hspace{2mm}-\par}%
			\fi%
			\vspace{10.038pt}
		\fi%
		{\fontsize{12.045pt}{15.056pt}\selectfont\@author\par}%
		{\fontsize{10.038pt}{15.056pt}\selectfont\@eauthor\par}%
		\vspace{10.038pt}
		{\fontsize{12.045pt}{18.067pt}\selectfont\@affiliation\par}%
		{\fontsize{10.038pt}{10.038pt}\selectfont\@eaffiliation\par}%
		\vspace{5pt}
		\end{center}

		\hspace{0.36cm}
		\begin{tabularx}{42zw}{X}
		{\setlength{\baselineskip}{15.056pt}
		＜あらまし＞\hspace{1zw}\@abstract\par}
		\end{tabularx}

		\hspace{0.36cm}
		\begin{tabularx}{41zw}{p{7zw}p{32zw}}
		＜キーワード＞\hspace{1zw} & {\setlength{\baselineskip}{10.539pt}\@keyword\par}
		\end{tabularx}
		\vspace{-12pt}
	\end{minipage}

}

\renewcommand{\section}{%
	\@startsection{section}{1}{\z@}%
	{1.0\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\fontsize{10.539pt}{10.539pt}\selectfont\headfont\raggedright}}

\renewcommand{\subsection}{%
	\@startsection{subsection}{1}{\z@}%
	{1.0\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\fontsize{10.038pt}{10.038pt}\selectfont\headfont\raggedright}}

\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{1}{\z@}%
	{1.0\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\fontsize{10.038pt}{10.038pt}\selectfont\headfont\raggedright}}

\usepackage{secdot}
\sectiondot{subsection}
\sectiondot{subsubsection}

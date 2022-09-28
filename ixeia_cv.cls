% CV design by Ixeia Sanchez Periz.
% Inspired by Murat Can Karacabey and Michael Pollind's Awesome CV.

\author{Ixeia Sanchez Periz}
\RequirePackage[dvipsnames]{xcolor} 
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ixeia_cv}[2022/06/30 Ixeia CV Class]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[left=0.75in,top=0.3in,right=0.75in,bottom=0.6in]{geometry} % Document margins
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\usepackage{enumitem}
\pagestyle{empty}
%\defaultfontfeatures{Ligatures=TeX}


%Setup

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[3]{\def\@positionA{#1}\def\@positionB{#2}\def\@positionC{#3}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setgraycolor}[1]{\def\@graycolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}


\setmainfont{Asap}[
    Path=./asap/,
    Scale=0.9,
    Extension = .ttf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-Italic,
    BoldItalicFont=*-BoldItalic
    ]
    
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}


\hypersetup{
    colorlinks=true,
    urlcolor=NavyBlue,
}

% View commands
% Header

\newcommand\headerview{
\begin{minipage}{0.6\linewidth}
    \center \name \\[0.05cm] 
    \position \\[0.05cm]
    \contact % address \ mobile \\ mail
\end{minipage}
\hfill
\begin{minipage}{0.25\linewidth}
    \profpic{0.30}{images/CV.jpg}
\end{minipage}% 
}

% Profile picture

\newsavebox{\picbox}
\newcommand{\profpic}[2]{%
    \savebox{\picbox}{%
    \includegraphics[scale=#1]{#2}}% 
    \tikz\node [draw, circle,%
    line width=4pt, color=white,% 
    minimum width=\wd\picbox,minimum height=\ht\picbox,%
    path picture={ \node at (path picture bounding box.center)% 
    {\usebox{\picbox}};}]% 
    {};}
    
%contactsubviews 
    
\newcommand{\emailview}{\href{mailto:\@mail}{{\faEnvelope \space \footnozesize Mail}}}   
\newcommand{\mobileview}{ {\color{\@themecolor} \faMobile} \space \footnozesize {\color{\@themecolor} \@mobile} }
\newcommand{\githubview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize LinkedIn}}
\newcommand{\linkedinview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize GitHub}}

\newcommand{\name}{%
    {\Huge \bfseries \bodyfontlight  \@firstname \ \@lastname}}
\newcommand{\position}{%
    {\footnotesize \color{\@themecolor} \scshape \bodyfontlight \@positionA \ \coloredbullet \ \@positionB \ \coloredbullet \ \@positionC}}
\newcommand{\contact}{%
        { {\small  \bodyfontlight \@address} \vspace{1mm}
        \\%
        {\small  \bodyfontlight \mobileview \cps \emailview \cps \linkedinview \cps \githubview \\} } % 
}


% Helper commands

\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

%colorfulpipeseperator

\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

% Edit section styles

\titleformat{\section}      % Customise the \section command 
  {\large\bfseries\scshape\raggedright\color{\@themecolor} \bodyfontlight} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {\ruleafter}                           % Can be used to insert code before the heading

\titlespacing*{\section}{-1pt}{0pt}{0pt}

% Textview commands

\newcommand{\experience}[2]{%
  \mbox { \hspace{1em}  \bodyfontlight \scshape \textbf{#1}}%
}

\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black!60!\@themecolor} #1 } 
}

\newcommand{\placetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{\@themecolor} #1 }
}

%\newcommand{\datedexperience}[3]{%
%  \begin{small} \mbox { \hspace{1em} \scshape \textbf{#1} } \end{small} \noindent\hspace{1.0in}\datetext{#2}  \noindent\hspace{2.0in}\placetext{#3}\\[0.02cm] %
%}

\newcommand{\datedexperience}[3]{%
  \bodyfontlight \begin{small} \mbox { \hspace{1em} \scshape \textbf{#1} } \end{small} \hfill \begin{tabular}{>{\raggedleft}m{0.2\textwidth} >{\centering}m{0.05\textwidth} >{\raggedleft}m{0.18\textwidth}}  \datetext{#2} & \cps &\placetext{#3} \end{tabular} \\[0.02cm] %
}

% {r{0.4\textwidth}m{0.3\textwidth}r{0.3\textwidth}}  

\newcommand{\explanation}[1]{%
    \mbox { \bfseries \color{\@graycolor}  \hspace{1.2em} \small #1}\\[0.15cm]
}

\newcommand{\explanationdetail}[1]{%
    \indent \begin{minipage}{0.96\linewidth} \small #1 \end{minipage} \\[0.1cm]
}

\newcommand{\itemwithtext}[1]{%
    \begin{minipage}{\linewidth} \footnotesize \item #1 \end{minipage}
}

\newcommand{\addblocktext}[2]{%
  \section{#1} 
  \indent \explanationdetail{\hspace{4ex} #2}
}

\newcommand\createskill[2]{%
    \textsc{\textbf{#1}} & #2
}

\newcommand\createtablecontent[1]{%
    \foreach \x [count=\xi] in {#1} {\ifthenelse{\xi=1}{\x}{\\ \x}}
}

\newcommand\createskillsanothertry[1]{%not used
  \begin{tabular}{r|l}
      \createtablecontent{#1}
        \end{tabular}
}

\newcommand\createskills[1]{%
\explanationdetail{
  \begin{tabular}{rl}
    \makeatletter
    \@for\thisitem:=#1\do{\thisitem\\[0.1cm]}
    \makeatother
    \end{tabular}
}
}

\newcommand\createbullets[1]{%
    \renewcommand{\labelitemi}{\coloredbullet}
  \begin{itemize}
    \makeatletter
    \@for\thisitem:=#1\do{\itemwithtext{\thisitem}}
    \makeatother
  \end{itemize}
}

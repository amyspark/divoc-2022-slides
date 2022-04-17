\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{divoc}[2022/03/28 v1.0 DiVOC 2022]

\LoadClassWithOptions{amysparkSlides}

\usecolortheme{divoc}

\RequirePackage{tikz}
\usetikzlibrary{backgrounds, positioning, scopes}

%%%%%%%%%%%%%%%%%%%%%
% FUENTES
%%%%%%%%%%%%%%%%%%%%%

\setmainfont[Scale=1]{Atkinson Hyperlegible}
\setsansfont[Scale=1.33]{Genos}
\setmonofont[Scale=MatchUppercase]{Cascadia Code}
\setmathfont{TeX Gyre Schola Math}

%%%%%%%%%%%%%%%%%%%%%
% TEMPLATE
%%%%%%%%%%%%%%%%%%%%%
% Override slide titles: insert logo, overlay text
\setbeamertemplate{frametitle}{%
  \nointerlineskip%
  \begin{beamercolorbox}[%
      wd=\paperwidth,%
      sep=0pt,%
      leftskip=\metropolis@frametitle@padding,%
      rightskip=\metropolis@frametitle@padding,%
    ]{frametitle}%
  \metropolis@frametitlestrut@start%
    \begin{tikzpicture}[outer sep=0pt, inner sep=0pt]
      {
        [local bounding box=title]
        \node[anchor=north west, align=flush left] at (current page.north west) [text width=\dimexpr\paperwidth-2\metropolis@frametitle@padding\relax, minimum height=2\baselineskip] {\insertframetitle};
      }
    \begin{pgfinterruptboundingbox}
    \scoped[on background layer]\node[semitransparent, anchor=north east, yshift=-.5\metropolis@frametitle@padding, xshift=.5\metropolis@frametitle@padding] at (title.north east) {\includegraphics[height=3em,keepaspectratio]{frontmatter/logo}};
    \end{pgfinterruptboundingbox}
  \end{tikzpicture}
  \nolinebreak%
  \metropolis@frametitlestrut@end%
  \end{beamercolorbox}%
}

%%%%%%%%%%%%%%%%%%%%
% BARRAS DE PROGRESO
%%%%%%%%%%%%%%%%%%%%

\definecolor{nb0}{HTML}{ffee22}
\definecolor{nb1}{HTML}{ffffff}
\definecolor{nb2}{HTML}{9b59d0}
\definecolor{nb3}{HTML}{2d2d2d}
\pgfdeclarehorizontalshading{nb}{5cm}{color(0cm)=(nb0); color(1cm)=(nb1); color(2cm)=(nb2); color(3cm)=(nb3)}

\setlength{\metropolis@progressonsectionpage@linewidth}{1pt}
\setbeamertemplate{progress bar in section page}{
  \setlength{\metropolis@progressonsectionpage}{%
    \textwidth * \ratio{\insertframenumber pt}{\inserttotalframenumber pt}%
  }%
  \begin{tikzpicture}
    \fill[shading=nb] (0,0) rectangle (\metropolis@progressonsectionpage, \metropolis@progressonsectionpage@linewidth);
    \fill[bg] (\metropolis@progressonsectionpage,0) rectangle (\textwidth, \metropolis@progressonsectionpage@linewidth);
  \end{tikzpicture}%
}
% \addtobeamertemplate{background canvas}{}{\transfade[duration=0.2]}
\ProcessOptions\relax

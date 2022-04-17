\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amysparkSlides}[2021/04/25 v4.0 Amyspark Beamer slides]

\RequirePackage{ifluatex}
\ifluatex
\else
  \ClassError{amysparkSlides}{This class requires LuaLaTeX.}
\fi

%%% CARGA DE PAQUETES Y OPCIONES DE FORMATO %%%
\PassOptionsToClass{usepdftitle=false}{beamer}

% -------------------------------------------------------------------
% COLORES Y ENLACES DE HIPERTEXTO.
% -------------------------------------------------------------------
% Forzamos que cada una de las secciones aparezca numerada en la
% tabla de contenidos que generan los visores de PDF.
\PassOptionsToPackage{bookmarksnumbered,pdfencoding=auto}{hyperref}
\PassOptionsToPackage{svgnames,x11names}{xcolor}
\LoadClassWithOptions{beamer}

% -------------------------------------------------------------------
% FUENTES TIPOGRÁFICAS.
% -------------------------------------------------------------------
\RequirePackage{fontspec}

\urlstyle{same}
\useinnertheme{metropolis}
\useoutertheme{metropolis}
\usefonttheme[stillsansserifsmall,stillsansseriflarge]{serif}
\usefonttheme[onlylarge]{structurebold}
\usefonttheme{professionalfonts}
% \setbeamertemplate{headline}{\insertnavigation{\pagewidth}}

% \setbeamertemplate{footline}
% {%
%   \hbox{%
%     \hbox{\insertslidenavigationsymbol}
%     \hbox{\insertframenavigationsymbol}
%     \hbox{\insertsubsectionnavigationsymbol}
%     \hbox{\insertsectionnavigationsymbol}
%     \hbox{\insertdocnavigationsymbol}
%     \hbox{\insertbackfindforwardnavigationsymbol}%
%   }%
% }

\setbeamertemplate{title}{
  \ifx\inserttitle\@empty\else%
  \raggedright%
  \inserttitle%
  \par%
  \vspace*{0.5em}%
  \fi
}
\setbeamertemplate{subtitle}{
  \ifx\insertsubtitle\@empty\else%
  \raggedright%
  \insertsubtitle%
  \par%
  \vspace*{0.5em}%
  \fi
}
\setbeamertemplate{author}{
  \ifx\insertauthor\@empty\else%
  \insertauthor%
  \par%
  \vspace*{0.25em}
  \fi
}
\setbeamertemplate{frametitle continuation}{(\insertcontinuationcountroman)}

\setmainfont[Ligatures={Common, TeX}, Scale=1]{TeX Gyre Termes}
\setsansfont[Scale=1]{Fira Sans}
\setmonofont[Scale=MatchUppercase]{Source Code Pro}

\setbeamerfont{caption}{size=\footnotesize}

% https://github.com/matze/mtheme/issues/233
\@ifundefined{metroset}{
  \newcommand{\metroset}[1]{\pgfkeys{/metropolis/.cd,#1}}
}{}

\metroset{inner/subsectionpage=progressbar}

% https://tex.stackexchange.com/questions/591505/disable-hyphenation-in-metropolis-frametitles/591523#591523
\defbeamertemplate*{frametitle}{newplain2}{%
  \nointerlineskip%
  \begin{beamercolorbox}[%
      wd=\paperwidth,%
      sep=0pt,%
      leftskip=\metropolis@frametitle@padding,%
      rightskip=\the\glueexpr \metropolis@frametitle@padding plus 1fill\relax,%
    ]{frametitle}%
  \metropolis@frametitlestrut@start%
  \insertframetitle%
  \nolinebreak%
  \metropolis@frametitlestrut@end%
  \end{beamercolorbox}%
}
% Remove ugly bar
\setbeamertemplate{title separator}{}

% Perfección tipográfica.
\RequirePackage{microtype}

% -------------------------------------------------------------------
% SISTEMA MATEMÁTICO.
% -------------------------------------------------------------------
% El paquete 'amsmath' tuneado.
\RequirePackage{mathtools}
% Fuentes tipográficas para símbolos matemáticos.
\RequirePackage{amssymb}
% Uniformizar con la fuente del documento.
\RequirePackage{unicode-math}
\setmathfont{TeX Gyre Termes Math}

% -------------------------------------------------------------------
% LOCALIZACIÓN.
% -------------------------------------------------------------------
\RequirePackage{csquotes}
\RequirePackage{polyglossia}

% -------------------------------------------------------------------
% BIBLIOGRAFÍA.
% -------------------------------------------------------------------
\RequirePackage[uniquename=false, giveninits,
  maxnames=2, uniquelist=false,
  sortcites, style=authoryear]{biblatex}
\DefineBibliographyStrings{spanish}{
  andothers        = {\emph{et\addabbrvspace al\adddot}},
  mathesis         = {Tesis de maestría},
  phdthesis        = {Tesis doctoral},
  techreport       = {Informe técnico}
}
\DefineBibliographyStrings{english}{
  mathesis         = {Master's thesis},
  phdthesis        = {PhD thesis},
  techreport       = {Technical report}
}
\setlength\bibitemsep{\itemsep}
\setcounter{biburlucpenalty}{100}
\setcounter{biburlnumpenalty}{100} % usar si es necesario

\def\oaitourl#1:#2{https://#1/#2}
\DeclareFieldFormat{eprint:oai}{%
  \mkbibacro{oai}\addcolon\space
  \ifhyperref
  {\href{\oaitourl#1}{\nolinkurl{#1}}}
  {\nolinkurl{#1}}}

% -------------------------------------------------------------------
% CARGA DE ENTORNOS.
% -------------------------------------------------------------------

\DeclareOption{final}{
  \AtEndEnvironment{document}{
    % https://tex.stackexchange.com/questions/30461/beamer-nonumber-equivalent-for-slides
    \begin{frame}[plain,noframenumbering,allowframebreaks]{\bibname}
      \printbibliography[heading=none]
    \end{frame}
  }
}

\ProcessOptions\relax

%%% FIN CARGA DE PAQUETES Y OPCIONES DE FORMATO %%%

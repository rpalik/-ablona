%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% KI Thesis Class.
%%
%% Class for writing bachelor/master/phd thesis at Computer Science department
%% at Faculty of Electrotechnics and Informatics and Technical University
%% of Košice.
%%
%% department homepage: http://kpi.fei.tuke.sk
%% project homepage: https://git.kpi.fei.tuke.sk/tuke/thesis.in.latex
%%
%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kithesis}[2017/04/25 KI Thesis Class, v2017.5]

\typeout{}
\typeout{***********************************************}
\typeout{***********************************************}
\typeout{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Using article class as base.
%%
%%%%%
\PassOptionsToClass{a4paper,12pt,oneside}{report}
\LoadClass{report}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Additional packages, and their options.
%%
%%%%%

\RequirePackage{pdfpages}

% titlesec for modification of chapters and sections
\RequirePackage{titlesec}
\titleformat{\chapter}
    {\huge}{\textbf\thechapter}{20pt}{\huge\textbf}[{\titlerule[0.8pt]}]

% sets the document geometry
\RequirePackage[
    a4paper,
    width=150mm,
    top=35mm,
    bottom=35mm,
    bindingoffset=6mm
]{geometry}

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg,.eps}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage[
    figure,
    table]{totalcount}

%% Numeric citations and sorting by year (descending), name and title
%\RequirePackage{csquotes}
\RequirePackage[
    style=numeric,
    sorting=none, %ydnt,
    isbn=true,
    backend=biber]{biblatex}
%\DefineBibliographyStrings{slovak}{
    %bibliography = {Literatúra}
%}

\RequirePackage[
   unicode,
   %backref,
   pdfusetitle,
   %pdfusekeywords,
   pdftoolbar=true,
   pdfmenubar=true,
   pdfwindowui=true,
   bookmarksopenlevel={0},
   bookmarksnumbered,
   bookmarksopen,
   pdfhighlight={/P},
   colorlinks=false, % TODO draft vs publish ready?
   citecolor=magenta,
   bookmarksnumbered,
   %pdfkeywords = {\LaTeX},
   %pdfcreator = {\LaTeX\ with package hyperref},
   %pdftitle={Odporúčania pre písanie záverečných prác},
   %pdfauthor={Mr. Manager},
   %pdfkeywords={},
   %pdfsubject={Záverečná práca},
   baseurl={http://www.tuke.sk}
]{hyperref}

% popisky ku obrazkom a tabulkam
\RequirePackage[small]{caption}
\setlength{\captionmargin}{25pt}

\def\figurename{Obrázok}
\def\tabname{Tabuľka}
\def\refname{Zoznam použitej literatúry}
\def\acrlistname{Zoznam skratiek}

%% Vlastná hlavička
\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}

% nastavenie hlavičky pre hlavnú časť práce
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{
    \markboth{\ifnum\value{chapter}>0 \chaptername\ \thechapter.\ \fi #1}{}
}
\fancyhf{}
\rhead{\slshape \nouppercase{\leftmark}}
\rfoot{\thepage}


% štýl pre prvú stranu kapitoly (plain s číslom strany v päte zarovnaný vpravo)
\fancypagestyle{chapterpage}{
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    \rfoot{\thepage}
}

% zmena štýlu prvej stránke kapitoly
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{chapterpage}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\renewcommand{\headrulewidth}{0.7pt}


% slovnik terminov a skratiek
\RequirePackage[
    nomain,
    toc,
    acronym,
    nonumberlist,
    noredefwarn
]{glossaries}
\makeglossaries % prikaz na vytvorenie suboru .glo


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Variable definitions and default values: these variables should be defined by
%% the user (somewhere in the preamble). For example, to put the abstract into
%% the thesis, the thesis writer should type the following somewhere in the
%% preamble (before the `\begin{document}` or `\frontmatter` commands are
%% called):
%%
%%      \abstract{This is my abstract.}
%%
%% See below (in the comments starting with 'DOCVAR: ') for a list of all
% variables
%% the thesis writer is expected to use.
%%
%%%%%

\def\br{\\}

% DOCVAR: thesisspec (The list of thesis specifications)
\newcommand{\@thesisspec}{
    \thispagestyle{empty}
    \vspace*{\fill}
    \begin{center}
        Tu vložte zadávací list pomocou príkazu\\
        {\tt{\textbackslash{}thesisspec\{cesta/k/suboru/so/zadavacim.listom\}}}\\
        v preambule dokumentu.
    \end{center}
    \vspace*{\fill}
    \newpage
}
\newcommand{\thesisspec}[1]{
    \renewcommand{\@thesisspec}{
        \includepdf[pages={-}]{#1}
    }
}


% DOCVAR: college (The name of the thesis writer's college)
\newcommand{\@college@sk}{Technická univerzita v Košiciach}
\newcommand{\@college@en}{Technical University of Košice}
\newcommand{\college}[2]{
    \renewcommand{\@college@en}{#1}
    \renewcommand{\@college@sk}{#2}
}

\newcommand{\@college@city}{Košice}

% DOCVAR: faculty (The name of the thesis writer's faculty)
\newcommand{\@faculty@en}{Faculty of Electrical Engineering and informatics}
\newcommand{\@faculty@sk}{Fakulta elektrotechniky a informatiky}
\newcommand{\faculty}[2]{
    \renewcommand{\@faculty@en}{#1}
    \renewcommand{\@faculty@sk}{#2}
}


% DOCVAR: department (name of the thesis writer's department)
\newcommand{\@department@sk}{Katedra počítačov a informatiky}
\newcommand{\@department@en}{Department of Computers and Informatics}
\newcommand{\department}[2]{
    \renewcommand{\@department@en}{#1}
    \renewcommand{\@department@sk}{#2}
}

% DOCVAR: department's shortcut
\newcommand{\@departmentacr@sk}{KPI}
\newcommand{\@departmentacr@en}{DCI}
\newcommand{\departmentacr}[2]{
    \renewcommand{\@departmentacr@en}{#1}
    \renewcommand{\@departmentacr@sk}{#2}
}


% DOCVAR: supervisor (name of the thesis writer's supervisor)
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}

% DOCVAR: consultant (name of the thesis writer's consultant)
\newcommand{\@consultant}{}
\newcommand{\consultant}[1]{\renewcommand{\@consultant}{#1}}

% DOCVAR: field of study
\newcommand{\@fieldofstudy}{9.2.1. Informatika}
\newcommand{\fieldofstudy}[1]{\renewcommand{\@fieldofstudy}{#1}}

% DOCVAR: study programme
\newcommand{\@studyprogramme}{Informatika}
\newcommand{\studyprogramme}[1]{\renewcommand{\@studyprogramme}{#1}}

% DOCVAR: thesis (type of the thesis)
\newcommand{\@thesis@en}{Bachelor thesis}
\newcommand{\@thesis@sk}{Bakalárska práca}
\newcommand{\thesis}[2]{
    \renewcommand{\@thesis@en}{#1}
    \renewcommand{\@thesis@sk}{#2}
}

% DOCVAR: declaration text
\newcommand{\@declaration}{Vyhlasujem, že som záverečnú prácu vypracoval(a) samostatne s~použitím uvedenej odbornej literatúry.}
\newcommand{\declaration}[1]{\renewcommand{\@declaration}{#1}}

% DOCVAR: date (declaration date)
\newcommand{\@submissiondate}{}
\newcommand{\submissiondate}[3]{
    \newcommand{\@submissionday}{#1}
    \newcommand{\@submissionmonth}{#2}
    \newcommand{\@submissionyear}{#3}
}

% DOCVAR: abstract of the thesis
\newcommand{\@abstract}{}
\renewcommand{\abstract}[2]{%
    \newcommand{\@abstract@en}{#1}%
    \newcommand{\@abstract@sk}{#2}%
}

% DOCVAR: thesis keywords
\newcommand{\@keywords}{}
\newcommand{\keywords}[2]{%
    \newcommand{\@keywords@en}{#1}%
    \newcommand{\@keywords@sk}{#2}%
}

% DOCVAR: thesis title
\renewcommand{\title}[2]{%
    \newcommand{\@title@en}{#1}%
    \newcommand{\@title@sk}{#2}%
}


% DOCVAR: thesis (type of the thesis)
\newcommand{\@acknowledgment}{Na tomto mieste by som sa rád poďakoval svojmu vedúcemu záverečnej práce za pripomienky a~odbornú pomoc.}
\newcommand{\acknowledgment}[1]{\renewcommand{\@acknowledgment}{#1}}

% right page number aligment from 2nd page in table of content
\fancypagestyle{plain}{%
    \renewcommand{\footrulewidth}{0pt}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Front matter
%%
%% - outside and inside front cover
%% - title leaf
%% Do not include the date of make!
%% Institution + department.
%% Names of referees. (optional)
%% Degree.
%% Date of submission and defense. (optional)
%% Place and date of publication and publishers (and other info by them).
%
\newcommand{\frontmatter}{
    \pagenumbering{roman}
    \frontpage
    \titlepage
    \abstractpage

    % thesis detail specification
    \@thesisspec

    \declarationpage
    \acknowledgmentpage

    \pagestyle{plain}
    \tableofcontents
    \newpage

    % show list of figures only if there are some
    \iftotalfigures%
        \listoffigures%
        \newpage%
    \fi

    % show list of tables only if there are some
    \iftotaltables%
        \listoftables%
        \newpage%
    \fi

    \pagenumbering{arabic}
    \pagestyle{fancy}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Front page component
%%
%%%%%
\newcommand{\frontpage}{

    \thispagestyle{empty}

    \begin{center}
        {\Large \textbf{\@college@sk}}

        {\Large \textbf{\@faculty@sk}}

        \vfill

        {\LARGE \textbf{\@title@sk} \par}

        \bigskip

        {\large \textbf{\@thesis@sk}}
    \end{center}

    \vfill

    \begin{center}
        {\Large \textbf{\@submissionyear}} \hfill {\Large \textbf{\@author}}
    \end{center}

    \newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Abstract component
%%
%%%%%

\newcommand{\abstractpage}{
    \def\br{}

    \thispagestyle{empty}
    \noindent
    \begin{tabular}{@{}p{.2\textwidth}p{.75\textwidth}}
        Názov práce:    & \@title@sk \\ \\
        Pracovisko:     & \@department@sk, \@college@sk \\
        Autor:          & \@author\\
        Školiteľ:       & \@supervisor \\
        Konzultant:     & \@consultant \\
        Dátum:          & \@submissionday. \@submissionmonth. \@submissionyear\\
        Kľúčové slová:  & \@keywords@sk \\ \\
        \abstractname:       & \@abstract@sk\\
    \end{tabular}

    \newpage

    \begin{otherlanguage}{english}
    \thispagestyle{empty}
    \noindent
    \begin{tabular}{@{}p{.2\textwidth}p{.75\textwidth}}
        Thesis title:   & \@title@en \\ \\
        Department:     & \@department@en, \@college@en \\
        Author:         & \@author\\
        Supervisor:     & \@supervisor \\
        Tutor:          & \@consultant \\
        Date:           & \@submissionday. \@submissionmonth. \@submissionyear\\
        Keywords:       & \@keywords@en \\ \\
        \abstractname:       & \@abstract@en\\
    \end{tabular}
    \end{otherlanguage}

    \newpage

    \def\br{\\}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Declaration component
%%
%%%%%
\newcommand\declarationpage{
    \thispagestyle{empty}

    \vglue0pt
    \vfill
    \noindent\textbf{Čestné vyhlásenie}

    \bigskip

    \noindent\@declaration

    \bigskip

    \noindent \@college@city,~\@submissionday.\@submissionmonth.\@submissionyear \hfill
    \begin{tabular}[t]{c}
        \hbox to 50mm {\dotfill} \\ \textit{\small Vlastnoručný podpis}
    \end{tabular}
    \newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Declaration component
%%
%%%%%
\newcommand\acknowledgmentpage{%
    \thispagestyle{empty}%
    \vglue0pt\vfill%

    \noindent\textbf{Poďakovanie}%

    \bigskip

    \@acknowledgment

    \newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Title page component
%%
%%%%%
\renewcommand{\titlepage}{
    \thispagestyle{empty}

    \begin{center}
        {\Large \textbf{\@college@sk}}

        {\Large \textbf{\@faculty@sk}}

        \vfill

        {\LARGE \textbf{\@title@sk} \par}

        \bigskip

        {\large \textbf{\@thesis@sk}}
    \end{center}

    \vfill

    \noindent
    \begin{tabular}{@{}p{.25\textwidth}p{.7\textwidth}}
        Študijný program:& \@studyprogramme \\
        Študijný odbor:& \@fieldofstudy \\
        Školiace pracovisko:& \@department@sk~(\@departmentacr@sk) \\
        Školiteľ:& \@supervisor \\
        Konzultant:& \@consultant \\
    \end{tabular}

    \vspace{2\baselineskip}

    \begin{center}
        \centering
        {\Large \textbf{\@college@city{} \@submissionyear}} \hfill {\Large \textbf{\@author}}
    \end{center}

    \newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Fonts
%%
%%%%%

% Font for some math characters to work with TeX Gyre Pagella font

\RequirePackage{textcomp}

% Font used for thesis is TeX Gyre Pagella.
% Note: You might need to install it first.

\RequirePackage{tgpagella}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Line spacing and paragraph indentation
%%
%%%%%

\linespread{1.3}
\setlength{\parindent}{1.5em}

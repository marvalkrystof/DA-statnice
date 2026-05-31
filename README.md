# Příprava ke státnicím

Workspace slouží pro tvorbu přípravy ke státnicím z bakalářského studia. Finální materiály budou připravované ve formátu XeLaTeX.

## Stav témat

Zaškrtnutí znamená, že je téma zpracované do použitelné podoby pro opakování.

- [x] 1. Transakční data. Zdroje a typy podnikových transakčních dat, úložiště a datové pumpy.
- [x] 2. Metodika výběrových šetření. Fáze dotazování, sestavení dotazníku, metody vážení.
- [x] 3. Externí datové a informační zdroje. Sekundární zdroje dat a informací, role competitive intelligence, přístup k externím zdrojům.
- [x] 4. Etika a regulace při sběru a uchovávání dat.
- [x] 5. Databáze. Relační databázové systémy, jazyk SQL, návrh obsahu datové základny.
- [ ] 6. Metody a nástroje pro vizualizaci dat.
- [ ] 7. Deskriptivní statistická analýza. Popis, agregace a komparace ekonomických dat.
- [ ] 8. Exploratorní analýza. Redukce rozměru dat, hlavní komponenty, faktorová, korespondenční a diskriminační analýza.
- [ ] 9. Lineární regrese. Užití v deskriptivních, kauzálních a prediktivních úlohách, volba modelu, vlastnosti odhadů.
- [ ] 10. Zobecněné lineární regresní modely. Modely pro binární, multinomickou a čítací závisle proměnnou.
- [ ] 11. Ekonometrické modely pro časové řady a panelová data.
- [ ] 12. Strojové učení. Druhy úloh strojového učení, klasifikace algoritmů, dostupné nástroje.
- [ ] 13. Shlukové a klasifikační úlohy strojového učení. Rozhodovací stromy, shlukovací algoritmy, asociační pravidla.
- [ ] 14. Ensemblové modelování v regresních a klasifikačních úlohách. Bagging a boosting.
- [ ] 15. Mělké neuronové sítě. Architektura, trénování a optimalizace.
- [ ] 16. Vícevrstvé neuronové sítě a hluboké učení. Koncepce, aplikace, technologie.
- [ ] 17. Nestrukturovaná a částečně strukturovaná data. Porovnávání vzorů, indexování a vyhledávání dokumentů, extrakce informací a web scraping.
- [ ] 18. Zpracování textových dat. Lingvistické zpracování přirozeného jazyka, jazykové modely, analytické metody, existující nástroje.
- [ ] 19. Big data. Charakteristika velkých dat, metody a nástroje pro jejich zpracování.
- [ ] 20. Business intelligence. Principy, technologické komponenty, nástroje.
- [ ] 21. Řízení datového projektu. Životní cyklus, metodiky a standardy, organizace projektu a nástroje pro podporu řízení.
- [ ] 22. Optimalizační modely pro podporu ekonomického rozhodování. Příklady typických úloh LP a MILP, heuristické optimalizační algoritmy.

## Co je potřeba ke kompilaci

Projekt se kompiluje přes XeLaTeX. Pro běžné použití stačí:

- `make`
- `latexmk`
- `xelatex`
- TeX balíčky používané v `preamble.tex`, hlavně `fontspec`, `polyglossia`,
  `microtype`, `enumitem`, `titlesec`, `tocloft`, `fancyhdr`, `hyperref`,
  `graphicx` a `amsmath`
- fonty TeX Gyre, konkrétně `TeX Gyre Pagella` a `TeX Gyre Heros`

Na Linuxu s Debian/Ubuntu balíčky lze prostředí připravit například takto:

```sh
sudo apt update
sudo apt install make latexmk texlive-xetex texlive-latex-extra texlive-lang-czechslovak texlive-fonts-recommended fonts-texgyre
```

Na macOS je nejjednodušší nainstalovat MacTeX. Pokud používáš Homebrew:

```sh
brew install --cask mactex
```

Na Windows použij TeX Live nebo MiKTeX a ujisti se, že jsou příkazy `latexmk`
a `xelatex` dostupné v `PATH`.

Instalaci lze rychle ověřit:

```sh
make --version
latexmk -v
xelatex --version
```

## Struktura dokumentu

Hlavní vstupní soubor je `main.tex`. Globální nastavení, balíčky a makra jsou
v `preamble.tex`. Jednotlivé státnicové otázky jsou uložené samostatně v adresáři
`topics/` a do hlavního dokumentu se skládají přes `\input`.

## Kompilace a spuštění projektu

Výchozí dokument je `main.tex`. Z kořenové složky projektu spusť:

```sh
make
```

Výsledné PDF vznikne v:

```sh
build/priprava.pdf
```

Pokud chceš zkompilovat jiný vstupní soubor, použij:

```sh
make TEX=soubor.tex
```

Název výsledného souboru lze změnit přes `JOBNAME`:

```sh
make JOBNAME=statnice
```

PDF pak vznikne jako `build/statnice.pdf`.

Pomocné soubory smažeš příkazem:

```sh
make clean
```

Pokud na systému není dostupný `make`, lze spustit stejnou kompilaci přímo:

```sh
mkdir -p build
latexmk -xelatex -jobname=priprava -interaction=nonstopmode -halt-on-error -outdir=build main.tex
```

Po úspěšné kompilaci stačí otevřít soubor `build/priprava.pdf` v libovolném
PDF prohlížeči.

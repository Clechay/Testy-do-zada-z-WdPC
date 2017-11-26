# Testy do zadań 

1. pobierz paczkę
2. wypakuj
3. obok pliku `test.sh` umieść swój skompilowany program
4. nazwijj swój program `bin`
5. wykonaj './test.sh' żeby przetestować program

Jeżeli nie masz uprawnień do uruchomienia skryptu `./test.sh`, wykonaj `chmod +x test.sh`

Aby usunąć jeden z testów, usuń jego plik `*.in`

Aby wygenerować test, zapisz w katalogu testy wejście dla programu z rozszerzeniem `.in` i uruchom `./gen_test.sh`. Alternatywnie, ręcznie wykonaj `./bin_correct < tests/nazwa_testu.in > tests/nazwa_testu.out_correct`

Folder `tests_automated` jeżeli istnieje zawiera testy wygenerowane losowo (w tym wszystkie duże testy)

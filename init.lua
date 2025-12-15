#include <iostream>
using namespace std;

int main() {
    double fiyatsade = 10;
    double fiyatkepekli = 12.5;
    double fiyatbugdayli = 15;

    int adetsade, adetkepekli, adetbugdayli;
    double toplamfiyat;

    cout << "Sade ekmek adedi: ";
    cin >> adetsade;

    cout << "Kepekli ekmek adedi: ";
    cin >> adetkepekli;

    cout << "Tam bugdayli ekmek adedi: ";
    cin >> adetbugdayli;

    toplamfiyat = (adetsade * fiyatsade) +
                  (adetkepekli * fiyatkepekli) +
                  (adetbugdayli * fiyatbugdayli);

    if (toplamfiyat > 100) {
        double indirim = toplamfiyat * 0.15;
        toplamfiyat = toplamfiyat - indirim;
        cout << " %15 indirim uygulandi!\n";
    }

    cout << "Odenecek toplam tutar: " << toplamfiyat << " TL" << endl;

    return 0;
}
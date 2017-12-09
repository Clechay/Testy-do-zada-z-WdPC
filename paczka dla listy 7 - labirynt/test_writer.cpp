// Łukasz Kleczaj, 300576
#include <string>
#include <iostream>
using namespace std;
int main(int argc,  char** argv){
    int w = stoi(argv[1]);
    int h = stoi(argv[2]);
    char m[3] = {'#','-'};
    cout<<h<<" "<<w<<endl;
    char t = getchar();
    srand(t);
    t = getchar();
    int sx = rand() % w;
    int sy = rand() % h;
    for (int y = 0; y < h; ++y) {
        for (int x = 0; x < w; ++x) {
            if(x==sx && y==sy){
                cout<<"!";
                continue;
            }
            t = getchar();
            cout<<m[ abs((int)t%2) ];
        }
        cout << endl;
    }
    return 0;
}
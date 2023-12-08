#include <cmath>
#include <iostream>
#include <fstream>

using namespace std;
using ld = long double;
using ll = long long;

const ld delta_t = 0.1;

// Реальные данные
// const ld GM = 7.35 * 6.674 * pow(10, 11);
// const ld MR = 1737.1 * 1000;

// Данные из KSP
const ld GM = 65138397520;
const ld MR = 200000; // Радиус луны

int main() {
    const char* filename = "../data/data.txt";
    ofstream outputFile(filename);

    ld speed, height, time, acceleration;
    cout << "Начальное значение скорости = ";
    cin >> speed;
    // speed = 356
    cout << "Начальное значение высоты = ";
    cin >> height;
    // height = 1990000
    time = 0;

    outputFile << "Высоты, Вертикальная скорость, Время" << endl;
    outputFile.precision(20);
    outputFile << fixed;
    outputFile << height << ", " << speed << ", " << time << endl;

    while (height > 20000) {
        acceleration = GM / pow(MR + height, 2);
        height -= speed * delta_t;
        speed += acceleration * delta_t;
        time += delta_t;
        outputFile << height << ", " << speed << ", " << time << endl;
    }
}
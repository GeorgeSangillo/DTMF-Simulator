[numb,denb]=butter(10,0.1);
[nume,dene]=ellip(10,1,50,0.1);
figure(1)
freqz(numb,denb) % Plot 1
figure(2)
freqz(nume,dene) % Plot 2
figure(3)
zplane(numb,denb) % Plot 3
figure(4)
zplane(nume,dene) % Plot 4


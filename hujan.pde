Hujan h[]; //objek baru untuk hujan
Rumah r; //objek baru rumah
color bg, lampu; //deklarasi nama warna
int tekan = 0; //deklarsi nilai tekan
import processing.sound.*; //mengimpor perpustakaan sound untuk musik
SoundFile file; //objek baru untuk file
String musik; //nama file musik

void setup(){
  size(600,400);
  smooth();
  h=new Hujan[1000];
  for (int i=0; i<h.length;i++){
    h[i]=new Hujan();
  }
  r = new Rumah();  
  musik="hujan.mp3";
  file = new SoundFile(this, musik);
  file.loop();
  noCursor();
}

void draw(){
  background(bg);
  r.tampil();
  
  if(tekan%2==0){
    bg =  color(28, 50, 69);
    lampu = color(255, 221, 0);
    fill(bg,100);
    rect(0,0,width,height);
    for (int i=0; i<h.length;i++){
    noStroke();
      if(h[i].y>h[i].posAkhir){
        h[i].akhir();
      }else{
        h[i].tampil();
      }
    }
  }
  fill(240, 52, 14);
  text("Klik untuk ubah cuaca", 10, 20);
  text("Wahyudi | 011180205", 470, 20);
}

void mousePressed(){
  bg = color(199, 255, 249);
  lampu = color(106, 118, 133);
  tekan++;
}

class Hujan{
  float ellipseX, ellipseY, posAkhir;
  float x,y,kecepatan;
  color c;
  
  Hujan(){
   insialisasi();
  }
  void insialisasi(){
    x=random(width);
    y=random(-300,0);
    kecepatan=random(2,7);
    c=color(147, 157, 191);
    ellipseX=0;
    ellipseY=0;
    posAkhir=height+260-(random(300));
  }
  void perbarui(){
    y+=kecepatan;
  }
  void tampil(){
    fill(c);
    //noStroke();
    rect(x,y,1,random(3,8));
    perbarui();
  }
  void akhir(){
    stroke(c);
    noFill();
    strokeWeight(1);
    ellipse(x,y,ellipseX,ellipseY);
    ellipseY+=kecepatan * 0.08;
    ellipseX+=kecepatan * 0.4;
    if (ellipseX>45){
      insialisasi();
     }
  }
}


class Rumah{
  void tampil(){  
  noStroke();  
  //cat tembok
  fill(191, 146, 50);
  beginShape(POLYGON);
  vertex(135,185);
  vertex(465,185);
  vertex(465,335);
  vertex(135,335);
  endShape(CLOSE);
   //pintu
  fill(110, 61, 12);
  beginShape(POLYGON);
  vertex(230,185);
  vertex(370,185);
  vertex(370,335);
  vertex(230,335);
  endShape(CLOSE);
  //dasar pondasi 1
  fill(193,185,139);
  beginShape(POLYGON);
  vertex(100,335);
  vertex(500,335);
  vertex(500,350);
  vertex(100,350);
  endShape(CLOSE);
  //dasar pondasi 2
  fill(124,76,12);
  beginShape(POLYGON);
  vertex(135,320);
  vertex(465,320);
  vertex(465,335);
  vertex(135,335);
  endShape(CLOSE);
  //dasar pondasi 3 
  fill(118,80,30);
  beginShape(POLYGON);
  vertex(170,305);
  vertex(430,305);
  vertex(430,320);
  vertex(170,320);
  endShape(CLOSE);
  //dasar pondasi 4
  fill(167,132,85);
  beginShape(POLYGON);
  vertex(200,290);
  vertex(400,290);
  vertex(400,305);
  vertex(200,305);
  endShape(CLOSE);
  //tiang kiri luar
  fill(166, 78, 13);
  beginShape(POLYGON);
  vertex(135,335);
  vertex(145,335);
  vertex(145,185);
  vertex(135,185);
  endShape(CLOSE);
   //tiang kiri dalam
  fill(194, 92, 17);
  beginShape(POLYGON);
  vertex(140,335);
  vertex(150,335);
  vertex(150,185);
  vertex(140,185);
  endShape(CLOSE);
  //tiang kanan luar
  fill(166, 78, 13);
  beginShape(POLYGON);
  vertex(455,335);
  vertex(465,335);
  vertex(465,185);
  vertex(455,185);
  endShape(CLOSE);
  //tiang kanan dalam
  fill(194, 92, 17);
  beginShape(POLYGON);
  vertex(450,335);
  vertex(460,335);
  vertex(460,185);
  vertex(450,185);
  endShape(CLOSE);
  //list genteng 
  fill(235, 190, 9);
  beginShape(POLYGON);
  vertex(500,185);
  vertex(100,185);
  vertex(100,180);
  vertex(500,180);
  endShape(CLOSE);
  //genteng bawah 
  smooth();
  fill(179, 47, 7);
  beginShape(POLYGON);
  vertex(100,180);
  vertex(500,180);
  vertex(100,180);
  vertex(225,135);
  vertex(375,135);
  vertex(500,180);
  endShape();
  //genteng atas 
  fill(199, 58, 2);
  beginShape(POLYGON);
  vertex(225,135);
  vertex(250,65);
  vertex(350,65);
  vertex(375,135);
  endShape();
  noFill();
  //tiang pintu kiri 
  fill(131,116,28);
  beginShape(POLYGON);
  vertex(230,290);
  vertex(230,185);
  vertex(235,185);
  vertex(235,290);
  endShape();
  //tiang pintu kanan
  beginShape(POLYGON);
  vertex(370,290);
  vertex(370,185);
  vertex(365,185);
  vertex(365,290);
  endShape();
  //tiang pintu tengah 
  beginShape(POLYGON);
  vertex(298,290);
  vertex(298,185);
  vertex(302,185);
  vertex(302,290);
  endShape();
  //pengangan pintu
  fill(0);
  ellipse(310,237.5,7,7);
  ellipse(290,237.5,7,7)
  //pagar kiri
  stroke(0);
  strokeWeight(3);
  line(145,260,230,260);
  line(145,275,230,275);
  line(145,290,200,290);
  line(145,305,170,305);
  //pagar kanan  
  line(370,260,455,260);
  line(370,275,455,275);
  line(400,290,455,290);
  line(430,305,455,305);
  endShape();
  //lampu taman kiri
  strokeWeight(1);
  noStroke();
  fill(196,209,205);
  arc(50,350,30,30,(180*PI)/180,(360*PI)/180);
  fill(lampu);
  noStroke();
  ellipse(50,285,30,30);
  ellipse(50,285,30,6);
  endShape();
  //lampu taman kanan
  noStroke();
  fill(196,209,205);
  arc(550,350,30,30,(180*PI)/180,(360*PI)/180);
  fill(lampu);
  noStroke();
  ellipse(550,285,30,30);
  ellipse(550,285,30,6);
  stroke(0);
  strokeWeight(3);
  line(50,302,50,335);
  line(550,302,550,335);
  noStroke();
  endShape();
  //jendela kanan
  noStroke(); 
  fill(lampu);
  beginShape(POLYGON);
  vertex(390,210);
  vertex(390,240);
  vertex(435,240);
  vertex(435,210);
  vertex(390,210);
  endShape();
  //jendela kiri
  fill(lampu);
  beginShape(POLYGON);
  vertex(210,210);
  vertex(210,240);
  vertex(165,240);
  vertex(165,210);
  vertex(210,210);
  endShape();
  //tanah 
  fill(87, 59, 26);
  beginShape(POLYGON);
  vertex(0,350);
  vertex(0,400);
  vertex(600,400);
  vertex(600,350);
  endShape();
  //jalan
  fill(94, 87, 79);
  beginShape(POLYGON);
  vertex(50,600);
  vertex(218,350);
  vertex(378,350);
  vertex(546,600);
  endShape();
  noFill();
  //rumput kiri 
  beginShape(TRIANGLES);
  fill(75,149,6);
  vertex(0,350);
  vertex(6,325);
  vertex(12,350);
  vertex(12,350);
  vertex(18,325);
  vertex(24,350);
  vertex(24,350);
  vertex(30,330);
  vertex(35,350);
  vertex(66,350);
  vertex(71,330);
  vertex(77,350);
  vertex(77,350);
  vertex(83,325);
  vertex(89,350);
  vertex(89,350);
  vertex(95,325);
  vertex(100,350);
  endShape();
  //rumput kanan 
  beginShape(TRIANGLES);
  fill(75,149,6);
  vertex(500,350);
  vertex(506,325);
  vertex(512,350);
  vertex(512,350);
  vertex(518,325);
  vertex(524,350);
  vertex(524,350);
  vertex(530,330);
  vertex(535,350);
  vertex(566,350);
  vertex(571,330);
  vertex(577,350);
  vertex(577,350);
  vertex(583,325);
  vertex(589,350);
  vertex(589,350);
  vertex(595,325);
  vertex(600,350);
  endShape();
  }
}

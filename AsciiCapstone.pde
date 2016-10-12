
import java.io.BufferedWriter;
import java.io.FileWriter;

char[] chars = {
  //'▒', 'X', '7', 'S', 'P', 'O', 'F', '%', '$', '@', '&'
  //'#','$','A','X','W','F','S','D','x','r','f'//lacswfd:;`,. 
  //'0','1'
  '@','G','C','L','f','t','l','i',';',':',',','.'
};
//'█','█','▓','▒','░','#','≡','%','$','@','&'}
//"#$AXWFSDDFxrflacswfd:;`,. "
//String loadPath = "shoe.png";
PImage picture;
PFont font;

int counter = 0;
int pass = 139;
//String destination = "" + pass + ".txt";


PImage[] images = new PImage[40];


//PrintWriter output;

void setup() {
  //output = createWriter("sdif.txt");
  size(352, 288);
  frameRate(10);

  font = loadFont("ArialMT-10.vlw");

  //Writing to a file:
  /*try{
   //setting the second parameter in the FileWriter to true
   //appends the text to what is already there. Otherwise it 
   //will overwrite the file.
   BufferedWriter out = new BufferedWriter(new FileWriter("???.txt",true));
   out.write("Hello again, ");
   out.close();
   } catch(IOException e) {
   e.printStackTrace();
   }*/



  /*String files[] = loadStrings("???.txt");
   output = createWriter("???.txt");
   for (int i = 0; i < images.length; i++) {
   //output.image(files[i]);
   }
   
   output.flush();
   output.close();*/



  for ( int i = 0; i< images.length; i++ ) {
    images[i] = loadImage((i + (pass * images.length + 1)) + ".jpeg" );
  }


  for (int i=0; i  < images.length; i ++)
  {
    images[i].resize(352, 288);
  }

  noLoop();
}
//end of setup

void draw() {
  String s = "";

  //for (PImage picture : images) {
  for (int a = 0; a < images.length; a++) { 
    background(255);
    textFont(font);
    for (int i = 0; i < 80; i++) {//70 and 60 originally
      for (int j = 0; j < 80; j++) { // every width and height pixel by pixel
        //color filler = picture.get(int(j), int(i)); 
        color filler = images[a].get(j*width/80, i*height/80);
        // fill(filler); /* miles did this */
        // textAlign(CENTER);
        //gets char depending on brightness
        float value = brightness(filler);
        char charac = chars[int(value/25.5)];//original 25.5// value the less characters the higher you divide by
        //text(charac, (j), (i)); 
        print(charac);
        s += charac;
      }
      println();
      s += '\n';
    }
    println("NEW PICTURE " + a);
    s += '\n';
  }
  //image(images[counter], 0, 0);
  //counter++;

  //String words = "Whatever I Want";
  String[] wordList = split(s, '\n');
  saveStrings(pass + ".txt", wordList);
}//end of draw


/*

 void setup(){
 size(352, 288);
 
 noLoop();
 }
 void draw(){
 String files[] = loadStrings("0.txt");
 for (int i = 0 ; i < files.length; i++) {
 println(files[i]);
 //text(files[i], width/2, height/2);
 }
 }//end of draw
 
 */

//ArrayList reader;
BufferedReader reader;
String [] lines;
PFont font;

int currentFile = 0;
int totalFiles = 140;

void setup() {
  font = loadFont("ArialMT-10.vlw");
  background(255,255,255);
  
  
  //reader = new ArrayList();
  reader = createReader(currentFile + ".txt");
  lines = new String[80];//list of lines
  size(displayWidth, displayHeight);
  frameRate(10);
}//end of setup

void draw() {
  

  for (int i = 0; i < lines.length; i++) {
    //lines[i] = reader.readLine(); if it doesnt work one time it keeps going to the next
    try {
      lines[i] = reader.readLine();
    }
    catch(IOException e) {
      e.printStackTrace();
      lines[i] = null;
    }
  }

  if (lines[0] == null) {
    if (currentFile < totalFiles - 1) {
      currentFile++;
      reader = createReader(currentFile + ".txt");
    } //keep going to the next file
    else {
      // Stop reading because of an error or file is empty
      noLoop();
    }
  }
  else {
    background(255,255,255);
    for (int i = 0; i < lines.length; i++) {
      if (lines[i] != null) {
        fill(128,  128,  128);  
        //text(lines[i], 10, 10 * (i + 1), 352, 288);
        text(lines[i], 10, 10 * (i + 1));
      }//draw the file
      // text(lines[i],10, 10 * (i + 1), 342, 278);
    }
  }
  try {
    reader.readLine(); // burn line
  }
  catch(IOException e) {
    // oops
  }
}



/*
  
 try {
 for (int i = 0; i < lines.length; i++) {
 lines[i] = reader.readLine();
 if(lines[i].equals("") || lines[i].equals(" ")){
 lines[i] = reader.readLine();
 }
 }
 } 
 catch (IOException e) {
 e.printStackTrace();
 lines[0] = null;
 }
 if (lines[0] == null) {
 if(currentFile < totalFiles - 1) {
 currentFile++;
 reader = createReader(currentFile + ".txt");    
 } else {
 noLoop();
 }  
 } else {
 for (int i = 0; i < lines.length; i++) {
 text(lines[i], 10, 10 * (i + 1), 352, 288);
 }
 }
 }
 */
//end of draw




/*

 BufferedReader reader;
 PFont font;
 int currentFile = 0;
 int totalFiles = 60;
 
 void setup() {
 font = loadFont("ArialMT-10.vlw");
 background(0);
 size(352, 288);
 // Open 1.txt
 reader = createReader(currentFile + ".txt");    
 }
 
 void draw() {
 String line;
 try {
 line = reader.readLine();
 } catch (IOException e) {
 e.printStackTrace();
 line = null;
 }
 if (line == null) {
 if(currentFile < totalFiles - 1) {
 currentFile++;
 reader = createReader(currentFile + ".txt");    
 } 
 } else {
 text(line, 10, 10, 352, 288);
 }
 } 
 
 */

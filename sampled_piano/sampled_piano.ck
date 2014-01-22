// Piano Sound Sampler with samples from Freesound
// by CD

// the piano class
//class piano {
// soundbuffer array
    SndBuf2 piano_s[8*12];
// Note string array    
    ["C","DB","D","EB","E","F","GB","G","AB","A","BB","B"] @=> string note_s[];
// path to samples
    me.dir()+"/audio/piano/PIANO_LOUD_" => string path;    
// sound chain
    for(0=> int i; i<piano_s.cap();i++) {
      piano_s[i] => dac;   
    }    

// pre-load all sound files at the beginning
    int note_nr;
    int octave_nr; 
    string sample_path;
    for(0 => int i; i<piano_s.cap();i++) {
       i % 12 => note_nr;
       i/12  => octave_nr;  
       path+note_s[note_nr]+octave_nr+".wav" => sample_path; 
       <<<sample_path>>>;  
       // load sample
       sample_path => piano_s[i].read; 
       // stop play sample 
       piano_s[i].samples() => piano_s[i].pos; 
    }    
    
    
// play our sound over and again in an infinite loop
   
//play all samples    
    for(0=> int i; i<piano_s.cap();i++) {
      0.5 => piano_s[i].gain;    
      0 => piano_s[i].pos; 
      500.0 :: ms => now;  
    }     


while (true) 
{

    
    
// pick a random number 
Math.random2(0,piano_s.cap()-1) => int which;
// play that sample
0.5 => piano_s[which].gain;    
0 => piano_s[which].pos;
// advance time so we can hear it
1000.0 :: ms => now;
}
   
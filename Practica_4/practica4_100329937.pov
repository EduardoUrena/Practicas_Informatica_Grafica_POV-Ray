#include "functions.inc"
#include "realskies.inc"
#include "colors.inc" 
#include "textures.inc"
#include "stones.inc"
#include "metals.inc"
#include "shapes3.inc"

global_settings {
  
  assumed_gamma 1.0
  
  radiosity {             // --- Settings 3 (high quality) ---
    pretrace_start 0.08
    pretrace_end   0.005
    count 400
    error_bound 0.05
    recursion_limit 2
  }   
}


// perspective (default) camera
camera {
  location  <0, 22, -100.0>
  look_at   <0, 23.9, 0.0>  
  angle 25
  right     x*image_width/image_height
}

// An area light (creates soft shadows)
// WARNING: This special light can significantly slow down rendering times!
light_source {
  <0,0,0>             // light's position (translated below)
  color rgb 1.0       // light's color
  area_light
  <8, 0, 0> <0, 8, 0> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light 
  translate <-95, 30, 20>   // <x y z> position of light
} 

// An area light (creates soft shadows)
// WARNING: This special light can significantly slow down rendering times!
light_source {
  <0,0,0>             // light's position (translated below)
  color rgb <1, 0.49, 0.35>       // light's color
  area_light
  <16, 0, 0> <0, 0, 16> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light
  translate <-70, 50, 85>   // <x y z> position of light 
}


sky_sphere { sky_realsky_05 scale<1.8,1.8,1.8> rotate<5.5,0,0>}

#declare pared = 
difference {

    box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
    
          texture { pigment{ color rgb<1, 1, 1>}  
                    finish { phong 0 ambient 1.5 diffuse 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <70,20,21> rotate<0,0,0> translate<0,3,0> 
        } // end of box --------------------------------------
        
    box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
    
          texture { pigment{ gradient y color_map {[0  color rgb<0.85, 0.95, 1> ] [3 color rgb<0.4, 0.9, 1>]}}  
                    finish { phong 0 ambient 1.5 diffuse 1.2 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <80,60,18> rotate<0,0,0> translate<0,-3,-12> 
        } // end of box --------------------------------------
        
        
    box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
    
          texture { pigment{ gradient y color_map {[ -1 color rgb<0.8, 1, 1>] [1 color rgb<0.95, 1, 1>]} }  
                    finish { phong 0 ambient 1.5 diffuse 1.0 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <8.56,17,30> rotate<0,0,0> translate<-10.85,-8,0> 
        } // end of box --------------------------------------  
        
    box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
    
          texture { pigment{ color rgb<1, 1, 1>}  
                    finish { phong 0 ambient 1.5 diffuse 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <8.56,17,30> rotate<0,0,0> translate<10.85,-8,0> 
        } // end of box --------------------------------------
        
    cylinder { <0,0,0>,<0,2.00,0>, 0.30
    
          texture { pigment{ color rgb<0.95, 1, 1>}  
                    finish { phong 0 ambient 1.5 diffuse 1.0 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <28.55,15,28.5> rotate<-90,0,0> translate<-10.85,26.5,30>
         } // end of cylinder -------------------------------------
         
    cylinder { <0,0,0>,<0,2.00,0>, 0.30
    
          texture { pigment{ color rgb<0.95, 1, 1>}  
                    finish { phong 0 ambient 1.5 diffuse 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <28.55,15,28.5> rotate<-90,0,0> translate<10.85,26.5,30>
         } // end of cylinder -------------------------------------
         
    box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
    
          texture { pigment{ color rgb<1, 1, 1>}  
                    finish { phong 0 ambient 1.5 diffuse 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <70,40,18> rotate<90,0,0> translate<0,-13,-12> 
        } // end of box --------------------------------------
        
    
        
} 

object{pared translate<0,12.5,0>} 

 
    box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
    
          texture { pigment{ color rgb<1, 1, 1>}  
                    finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} } 
                  } // end of texture   
    
          scale <3.8,12.0,4.5> rotate<0,10,0> translate<-26,3,24> 
        } // end of box --------------------------------------
  

#declare suelo = 
difference {

 union{

     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>  //suelo
        
              texture{ pigment{ color rgb<0.32, 0.27, 0.24>}    
                normal { agate 0.20 scale 0.15 rotate<0,0,0> }
                finish { phong 0 ambient 15 diffuse 3 } 
                rotate<0,0,0> scale <0.014,0.016,0.03> translate<0,0,0>
              } // end of texture // end of texture
        
              scale <50,64,20.5> rotate<90,0,0> translate<0,-3,-92> 
            } // end of box -------------------------------------- 
            
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>  //borde lejano 
        
                  texture { pigment{ image_map{ png "azulejos.png" map_type 0 }}
                    
                        finish { phong 1 ambient 8 diffuse 3.5 reflection{ 0.00 metallic 0.00} }
                        
                    scale<0.13,0.5,1> rotate<0.0000000001307,0,0> translate<-1.004,0,0>   
                      } // end of texture
        
              scale <50,1.4,20.5> rotate<90,0,0> translate<0,-2.84,-7.6> 
            } // end of box -------------------------------------- 
            
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>  //borde cercano 
        
              texture { pigment{ image_map{ png "azulejos.png" map_type 0 }}
                    
                        finish { phong 1 ambient 8 diffuse 3.5 reflection{ 0.00 metallic 0.00} } 
                        
                     scale<0.11,3.1,1> rotate<25.5,0,0> translate<-1.072,0,0> 
                      } // end of texture
        
              scale <50,0.5,20.5> rotate<90,0,0> translate<0,-2.86,-69.0> 
            } // end of box --------------------------------------
 }
        
 box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //hueco  
    
          texture { pigment{ image_map{ png "azulejos.png" map_type 0 }}
                    
                        finish { phong 1 ambient 8 diffuse 3.5 reflection{ 0.00 metallic 0.00} } 
                        
                     scale<0.37,0.4,1> rotate<0.0000000005,0,0> translate<-1.003,0,0> 
                      } // end of texture
    
          scale <45,30,2> rotate<90,0,0> translate<0,17,-68> 
        } // end of box -------------------------------------- 
        
}

object{suelo}


box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //agua  
  
         material {
            texture{
               pigment{color rgbf <0.26, 0.367, 0.557, 0.9>}
               finish {
                   specular 0
                   roughness 0
                   ambient 0
                   diffuse 0 
                   brilliance 0    
                   phong 0 
                   reflection {<0.6, 0.7, 0.7> metallic exponent 0.5 falloff 5}
                    
               }
                
               normal { 
                   granite 1 scale <0.6,0.4,0.4> translate <1,0,0>
               }
               finish {
                   specular 0
                   ambient 2
                   diffuse 1
                   roughness 0.0
                   phong 0
                   brilliance 0
               }
           } // end of texture
           
           interior {
                ior 1.05
           }
            
         } 
    
         scale <45,40,2> rotate<90,0,0> translate<0,14.6,-68> 
       } // end of box -------------------------------------- 
        
        
sphere { <0,0,0>, 0.5 //pelota

       texture { pigment{ color rgb<0.87, 0.43, 0.5>}
                 finish { phong 0.3 ambient 2.5 diffuse 1.5 roughness 0.8 reflection 0.00}
               } // end of texture

         scale<4.68,4.68,4.68>  rotate<0,0,0>  translate<6.75,18.85,-39.0>  
       }  // end of sphere -----------------------------------
        
                         

#declare escalera =
union {

    cylinder { <0,0,0>,<0,2.00,0>, 0.30
        
              texture { pigment{ color rgb<0.0, 0.0, 0.0>}  
                        finish { phong 6 ambient 1 diffuse 10 metallic roughness 0.0 reflection 0.8 brilliance 6 } 
                      } // end of texture 
    
              scale <0.20,2.26,0.20> rotate<0,0,0> translate<-4.81,15,-68.18>
             } // end of cylinder ------------------------------------- 
            
    cylinder { <0,0,0>,<0,2.00,0>, 0.30
        
              texture { pigment{ color rgb<0.0, 0.0, 0.0>}  
                        finish { phong 6 ambient 1 diffuse 10 metallic roughness 0.0 reflection 0.8 brilliance 6 } 
                      } // end of texture 
    
              scale <0.17,0.28,0.17> rotate<0,0,0> translate<-4.81,17.99,-67.68>
             } // end of cylinder -------------------------------------
            
    cylinder { <0,0,0>,<0,2.00,0>, 0.30
        
              texture { pigment{ color rgb<0.0, 0.0, 0.001>}  
                        finish { phong 6 ambient 1 diffuse 20 metallic roughness 0.0 reflection 0.6 brilliance 6 } 
                      } // end of texture 
    
              scale <0.16,1.35,0.16> rotate<-55,0,0> translate<-4.82,17.1,-65.55>
             } // end of cylinder ------------------------------------- 
            
    cylinder { <0,0,0>,<0,2.00,0>, 0.30
        
              texture { pigment{ color rgb<0.0, 0.0, 0.001>}  
                        finish { phong 6 ambient 1 diffuse 20 metallic roughness 0.0 reflection 0.6 brilliance 6 } 
                      } // end of texture 
    
              scale <0.13,0.8,0.13> rotate<-55,0,0> translate<-4.82,17.1,-66.25>
             } // end of cylinder -------------------------------------        
            
    cylinder { <0,0,0>,<0,2.00,0>, 0.30
        
              texture { pigment{ color rgb<0.0, 0.0, 0.001>}  
                        finish { phong 6 ambient 1 diffuse 20 metallic roughness 0.0 reflection 0.6 brilliance 6 } 
                      } // end of texture 
    
              scale <0.20,2.5,0.20> rotate<-55,0,0> translate<-4.85,16.9,-63.0>
             } // end of cylinder -------------------------------------
    
    difference {
     
        object{ Round_Conic_Torus( 1.00, // >0, vertical center distance of the upper and lower torii
                                   0.80, // >0, upper radius up by <0,C_distance,0>
                                   0.41, // >0,  lower radius on zero !!!
                                   0.06, // border radius, // max. = min(lower radius, upper radius)
                                   0 // Merge_On
                                 ) // ------------------------------------------------
        
              texture { pigment{ color rgb<0.0, 0.0, 0.0>}  
                        finish { phong 6 ambient 1 diffuse 10 metallic roughness 0.0 reflection 0.8 brilliance 6 } 
                      } // end of texture 
    
              scale<2,1.2,1>  rotate<0,92.7,-178>  translate<-4.817,19.45,-67.6>
               }   
     
        cylinder { <0,0,0>,<0,2.00,0>, 0.30
        
              texture { pigment{ color rgb<0.0, 0.0, 0.0>}  
                        finish { phong 6 ambient 1 diffuse 10 metallic roughness 0.0 reflection 0.8 brilliance 6 } 
                      } // end of texture 
    
              scale <8,2.26,8> rotate<0,0,0> translate<-4.81,15,-67.18>
                 } // end of cylinder -------------------------------------
                 
        cylinder { <0,0,0>,<0,2.00,0>, 0.30
        
              texture { pigment{ color rgb<0.0, 0.0, 0.0>}  
                        finish { phong 6 ambient 1 diffuse 10 metallic roughness 0.0 reflection 0.8 brilliance 6 } 
                      } // end of texture 
    
              scale <0.30,2.5,0.30> rotate<-55,0,0> translate<-4.85,16.9,-63.0>
            } // end of cylinder ------------------------------------- 
     
    }
    
texture { pigment{ color rgb<0.0, 0.0, 0.0>}  
                        finish { phong 6 ambient 1 diffuse 20 metallic roughness 0.0 reflection 0.8 brilliance 6 } 
                      } // end of texture           

}

object{escalera}

object{escalera translate<2.79,0,0>}

                  

#include "functions.inc"
#include "colors.inc" 
#include "textures.inc"
#include "stones.inc"
#include "metals.inc"
#include "shapes3.inc"
#include "Column_2_N030811_POV_geom.inc" //Geometry
#include "MAGNETO_CAPA_POV_geom.inc" //Geometry 
#include "fuego.pov"
#include "escudo_POV_geom.inc" //Geometry

global_settings {
  
  assumed_gamma 1.0
  
  radiosity {             
    pretrace_start 0.08
    pretrace_end   0.005
    count 400
    error_bound 0.05
    recursion_limit 3
  }   
}

// perspective (default) camera
camera {
  location  <0, 25, -210.0>
  look_at   <0, 30, 0.0>  
  angle 25
  right     x*image_width/image_height
} 


/*// perspective (default) camera
camera {
  location  <0, 22, -260.0>
  look_at   <0, 40, 0.0>  
  angle 25
  right     x*image_width/image_height
}*/ 

// perspective (default) camera
/*camera {
  location  <0, 25, -500>
  look_at   <0, 65, 0.0>  
  angle 25
  right     x*image_width/image_height
} */

// perspective (default) camera
/*camera {
  location  <-600, 800, -800.0>
  look_at   <0, 40, 0.0>  
  angle 25
  right     x*image_width/image_height
}*/ 

// An area light (creates soft shadows)
// WARNING: This special light can significantly slow down rendering times!
light_source {
  <0,0,0>             // light's position (translated below)
  color rgb <0.1,0.1,0.1>       // light's color
  area_light
  <8, 0, 0> <0, 8, 0> // lights spread out across this distance (x * z)
  8, 8                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light 
  translate <-0, 210, -400>   // <x y z> position of light
} 

// An area light (creates soft shadows)
// WARNING: This special light can significantly slow down rendering times!
/*light_source {
  <0,0,0>             // light's position (translated below)
  color rgb <1, 0.49, 0.35>       // light's color
  area_light
  <16, 0, 0> <0, 0, 16> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light
  translate <-0, 50, 50>   // <x y z> position of light 
} */


//sky_sphere { sky_realsky_05 scale<1.8,1.8,1.8> rotate<5.5,0,0>}
 

#declare pared =
difference{

    union{    
        
        box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //pared_fondo
        
              texture { pigment{ image_map{ jpeg "pared_ladrillo_piedra3.jpg" map_type 0}}  
                        finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} }
                        scale <0.1, 0.1, 0.3> 
                      } // end of texture   
        
              scale <70,30,2> rotate<0,0,0> translate<0,14.55,50> 
            } // end of box -------------------------------------- 
            
            
        box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //pared_derecha
        
              texture { pigment{ image_map{ jpeg "pared_ladrillo_piedra3.jpg" map_type 0}}
                        normal { agate 0.25 scale 0.15 rotate<0,0,0> }  
                        finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} }
                        scale <0.1, 0.1, 0.2> 
                      } // end of texture   
        
              scale <150,30,2> rotate<0,90,0> translate<30,14.55,-90> 
            } // end of box --------------------------------------
                                                                   
                                                                   
        box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //pared_izquierda
        
              texture { pigment{ image_map{ jpeg "pared_ladrillo_piedra3.jpg" map_type 0}}  
                        finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} }
                        scale <0.1, 0.1, 0.2> 
                      } // end of texture   
        
              scale <150,30,2> rotate<0,90,0> translate<-30,14.55,-90> 
            } // end of box -------------------------------------- 
            
        difference {
                
            box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //pared_entrada
            
                  texture { pigment{ image_map{ jpeg "pared_ladrillo_piedra3.jpg" map_type 0}}  
                            finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} }
                            scale <0.1, 0.1, 0.2> 
                          } // end of texture   
            
                  scale <40,30,3> rotate<0,0,0> translate<0,14.55,-228> 
                } // end of box --------------------------------------
                
            box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //hueco_pared_entrada
            
                  texture { pigment{ image_map{ jpeg "pared_ladrillo_piedra3.jpg" map_type 0}} 
                            finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} }
                            scale <0.1, 0.1, 0.2> 
                          } // end of texture   
            
                  scale <11,30,4> rotate<0,0,0> translate<0,14.65,-228> 
                } // end of box --------------------------------------
            
        } 
        
    }

}

object{pared}
  


    box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>  //suelo
        
          texture{ T_Stone21   
                normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                finish { phong 1 reflection 0.2 brilliance 4} 
                rotate<0,0,0> scale 0.1 translate<0,0,0>
          } // end of texture 

              scale <50,200,20.5> rotate<90,0,0> translate<0,-3,-290> 
        } // end of box --------------------------------------
        

#declare techo =
difference{
    
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //techo
    
          texture { pigment{ image_map{ jpeg "pared_ladrillo_piedra3.jpg" map_type 0}}  
                    finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} }
                    scale <0.1, 0.1, 0.2> 
                  } // end of texture   
    
          scale <40,150,2> rotate<90,0,0> translate<0,68,-235> 
        } // end of box --------------------------------------
            
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> //hueco_techo
    
          texture { pigment{ image_map{ jpeg "pared_ladrillo_piedra3.jpg" map_type 0}}  
                    finish { phong 0 ambient 1 diffuse 1 reflection{ 0.00 metallic 0.00} }
                    scale <0.1, 0.1, 0.2> 
                  } // end of texture   
    
          scale <10,107.5,3> rotate<90,0,0> translate<0,68,-210> 
        } // end of box --------------------------------------
        

}

object{techo}
        
      
            
 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-10>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-10>}

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-40>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-40>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-70>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-70>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-100>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-100>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-130>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-130>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-160>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-160>}

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-190>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-190>}

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,29.4,-220>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,29.4,-220>}


object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-10>}

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-10>}

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-40>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-40>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-70>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-70>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-100>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-100>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-130>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-130>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-160>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-160>}

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-190>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-190>}

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<-15,57.0,-220>} 

object{Column_2_N030811_ scale<0.01,0.01,0.01> rotate<0,90,0> translate<15,57.0,-220>}  



object{
      MAGNETO_CAPA_ translate<-45,110,-20> scale 0.18 rotate<0,180,0>           

      }  
      
                  
 box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>  //base
        
                   texture { T_Grnt11
                   //normal { agate 0.15 scale 0.15}
                   finish { phong 0.5 } 
                   scale 1 
                 } // end of texture 
 

              scale <12,25,2> rotate<90,0,0> translate<0,20,-10> 
        } // end of box -------------------------------------- 
        
 box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>  //base_inferior
        
                   texture { T_Grnt11
                   //normal { agate 0.15 scale 0.15}
                   finish { phong 0.5 } 
                   scale 1 
                 } // end of texture 
 

              scale <12.1,25.1,0.4> rotate<90,0,0> translate<0,17.9,-15> 
        } // end of box -------------------------------------- 
        
        
 box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>  //base_superior
        
                   texture { T_Grnt11
                   //normal { agate 0.15 scale 0.15}
                   finish { phong 0.5 } 
                   scale 1 
                 } // end of texture 
 

              scale <12.1,25.1,0.4> rotate<90,0,0> translate<0,22,-15> 
        } // end of box --------------------------------------


#declare repisa_derecha =
union{
                 
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> 
           
                  texture{ T_Stone1    
                    normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                  } // end of texture 
    
                  scale <150,3,0.25> rotate<90,90,0> translate<12.05,41.77,-120> 
         } // end of box --------------------------------------
         
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> 
           
                  texture{ T_Stone1    
                    normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                  } // end of texture 
    
                  scale <150,2.3,0.25> rotate<90,90,0> translate<12.5,44.0,-120> 
         } // end of box --------------------------------------
         
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> 
           
                   texture{ T_Stone1    
                     normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                     finish { phong 1 } 
                     rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                   } // end of texture 
    
                  scale <150,2.8,0.45> rotate<90,90,0> translate<12.05,44.5,-120> 
         } // end of box --------------------------------------
         
     
      box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> 
           
                  texture{ T_Stone1    
                    normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                  } // end of texture 
    
                  scale <150,0.75,1.5> rotate<90,90,0> translate<14.5,43.48,-120> 
         } // end of box --------------------------------------   
}


#declare repisa_izquierda =
union{        
 
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
            
                   texture{ T_Stone1    
                    normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                  } // end of texture 
     
    
                  scale <150,3,0.25> rotate<90,90,0> translate<-18.05,41.77,-120> 
            } // end of box --------------------------------------
            
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
            
                   texture{ T_Stone1    
                    normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                  } // end of texture 
     
    
                  scale <150,2.3,0.25> rotate<90,90,0> translate<-17.0,44.0,-120> 
            } // end of box --------------------------------------
               
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>
            
                   texture{ T_Stone1    
                    normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                  } // end of texture 
     
    
                  scale <150,2.8,0.45> rotate<90,90,0> translate<-17.6,44.5,-120> 
            } // end of box --------------------------------------
            
     box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00> 
           
                  texture{ T_Stone1    
                    normal { agate 0.25 scale 0.15 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale <0.01,0.5,0.5> translate<0,0,0>
                  } // end of texture 
    
                  scale <150,0.75,1.5> rotate<90,90,0> translate<-16.0,43.48,-120> 
         } // end of box --------------------------------------
            
}


object{repisa_derecha translate<0,-0.21,0>}

object{repisa_izquierda translate<0,-0.21,0>}

object{soporte_fuego1 scale <2,2,2> translate<-9.5,22.4,-10>} 

object{soporte_fuego2 scale <2,2,2> translate<9.5,22.4,-10>}

object{soporte_fuego2 scale <1.7,1.7,1.7> rotate<0,-20,0> translate<-12,17.5,-235>}

object{soporte_fuego1 scale <1.7,1.7,1.7> rotate<0,-50,0> translate<12,17.5,-235>}

object{soporte_fuego2 scale <1.7,1.7,1.7> rotate<0,-30,0> translate<-12,17.5,-175>}

object{soporte_fuego1 scale <1.7,1.7,1.7> rotate<0,-50,0> translate<12,17.5,-175>}

object{soporte_fuego2 scale <1.7,1.7,1.7> rotate<0,-50,0> translate<-12,17.5,-85>}

object{soporte_fuego1 scale <1.7,1.7,1.7> rotate<0,-40,0> translate<12,17.5,-85>}   

object{escudo_ scale 0.012 rotate<-73,0,0> translate<-10,17.48,-16.4>}
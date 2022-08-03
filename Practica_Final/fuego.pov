#include "metals.inc"
#include "colors.inc" 
#include "textures.inc"
#include "functions.inc"

#declare petale_tripod =
intersection
 {
  box{ <-0.125,-1,0> <+0.125,1,1.2> }
  difference
   {
    difference
     {
      sphere { <0,0,0> 1.1 }     
      sphere { <0,0,0> 1 }
     }
    box { <-1.1,-0.5,-1.1> <1.1,1.1,1.1> }
   }
 }

#declare egypta_tripod_leg =
 union
  {
   difference
    {
     difference
      {
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.2 }
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.1 }       
      }
     box { <-0.3,0,-0.25> <+0.3,+0.25,+0.25> }
    }
   box { <-0.10,0,-0.2> <+0.10,1.8,-0.1> } 
  }

#declare egypta_tripod_burner =
union
 {
  union // petales
   {
    object { petale_tripod rotate <0, 00 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 01 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 02 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 03 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 04 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 05 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 06 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 07 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 08 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 09 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 10 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 11 * 30,0> translate <0,1,0> }
    translate <0,2,0>
   }
  object // cup
   {
    difference
     {
      difference 
       {
        sphere { <0,0,0> 1 }
        sphere { <0,0,0> 0.95 }
       }
      box { <-1,-0.45,-1> <1,1,1> }
     }
    translate <0,3,0>
   }
   
  union // pattes
   {
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 0*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 1*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 2*120, 0>  }
   } 
  cylinder { <0,1,0> <0,1.25,0> 0.5 open }
 }
 
#declare tripod_smoke_and_flame =
cone
 {
  <0,0,0> 1 <0,2,0> 0 
  
 }   
 
 
 //example scene file:

#include "metals.inc"
camera{location <0,3.5,-6> look_at<0,1.5,0>}
light_source{<10,10,-30> color rgb 2}
//object{tripod_smoke_and_flame pigment{rgb<1,0,0>}}


// flame (MegaPov needed, as is)
#declare FlameMedia1=
 sphere {0,1.1
   pigment {rgbf 1}
        interior {
                media {
                method 2 intervals 2 samples 3,3  // megapov, or increase intervals and samples
                absorption <.33,.5,.67>*2 emission <.33,.5,.67>*1.67
                scattering {2,<.75,.67,.5>*2 extinction .133}
                density {spherical turbulence <.55,.17,.30>*1.5
                        density_map {
                        [0 rgb 0]
												[.15 rgb <1.5,1,.5>*3]
												[.5 rgb <1.25,.5,.75>*2]
												[.7 rgb<0,.05,.5>*6]
                        } scale <.85,.9,.85> translate -.25*y}
                }
                media {
                method 2 intervals 2 samples 3,3  // megapov, or increase intervals and samples
                absorption <.36,.33,.167>*3 emission <.25,.5,.75>*1.133
                scattering {1,<.25,.33,.75>*3 extinction .67}
                density {spherical turbulence <.1,.2,.15>*.5
                        density_map {
                        [0 rgb 0][.3 rgb <0,.05,1.15>*6]
                        } scale <.7,.3,.7> translate -.9*y}
                }
       }
  scale <.9,3,.9>*.25 rotate 45*y translate .225*y
 hollow
 }
 
// flame (MegaPov needed, as is)
#declare FlameMedia2=
 sphere {0,1.1
   pigment {rgbf 1}
        interior {
                media {
                method 2 intervals 2 samples 3,3  // megapov, or increase intervals and samples
                absorption <.33,.5,.67>*2 emission <.33,.5,.67>*1.67
                scattering {2,<.75,.67,.5>*2 extinction .133}
                density {spherical turbulence <.60,.13,.40>*1.5
                        density_map {
                        [0 rgb 0]
												[.15 rgb <1.5,1,.5>*3]
												[.5 rgb <1.25,.5,.75>*2]
												[.7 rgb<0,.05,.5>*6]
                        } scale <.85,.9,.85> translate -.25*y}
                }
                media {
                method 2 intervals 2 samples 3,3  // megapov, or increase intervals and samples
                absorption <.36,.33,.167>*3 emission <.25,.5,.75>*1.133
                scattering {1,<.25,.33,.75>*3 extinction .67}
                density {spherical turbulence <.1,.2,.15>*.5
                        density_map {
                        [0 rgb 0][.3 rgb <0,.05,1.15>*6]
                        } scale <.7,.3,.7> translate -.9*y}
                }
       }
  scale <.9,3,.9>*.25 rotate 45*y translate .225*y
 hollow
 }

#declare SmallFlame1=
 light_source { .5*y, <1,.57,.2>
       area_light <.5,0,0>,<0,1,0>,3,3 jitter adaptive 1
    orient circular  // megapov only
  looks_like {FlameMedia1}
   media_interaction on media_attenuation on
   fade_distance 6 fade_power 2
  translate 1.075*y
 }
 
#declare SmallFlame2=
 light_source { .5*y, <.75,.5,.25>
       area_light <.5,0,0>,<0,1,0>,3,3 jitter adaptive 1
    orient circular  // megapov only
  looks_like {FlameMedia2}
   media_interaction on media_attenuation on
   fade_distance 6 fade_power 2
  translate 1.075*y
 } 


#declare soporte_fuego1=
union{

    object{egypta_tripod_burner texture { pigment{ image_map{ jpeg "bronce.jpg" map_type 2 }} 
                                finish { phong 0 /*ambient 1 diffuse 10*/ metallic reflection 0.05 brilliance 6 }} rotate<0,-14,0>}
    
    object{SmallFlame1 scale <3.2,1.8,3.2> translate <0,0.25,0>}
    
}

#declare soporte_fuego2=
union{

    object{egypta_tripod_burner texture{T_Copper_1A} rotate<0,12,0>}
    
    object{SmallFlame2 scale <3.2,1.8,3.2> rotate<0,-20,0> translate <0,0.25,0>}
    
} 

object{soporte_fuego1 translate <0,0,0>}
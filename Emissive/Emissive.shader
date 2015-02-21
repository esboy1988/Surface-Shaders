﻿Shader "Optimised/Emissive/Emissive" {
	Properties {
		_MainTex ("Diffuse (RGB)", 2D) = "white" {}
		_Emission ("Emission (RGB)", 2D) = "Black" {}
		_Color ("Main Color (RGB)", Color) = (1,1,1,1)
	}
	SubShader {
		Tags { "Queue"="Geometry" "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf LambertMobile addshadow fullforwardshadows
		#include "../MobileLighting.cginc"
		//#pragma target 3.0 //Uncomment this when too many parameters cause compile to fail, Shader Model 3.0+ only

		sampler2D _MainTex;
		sampler2D _Emission;
        fixed3 _Color;
                
		struct Input {
			fixed2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
		
		  o.Albedo = (tex2D(_MainTex, IN.uv_MainTex)).rgb * _Color.rgb;
          o.Emission = (tex2D(_Emission, IN.uv_MainTex)).rgb;
          
		}
		ENDCG
	} 
	//FallBack "Diffuse"
}

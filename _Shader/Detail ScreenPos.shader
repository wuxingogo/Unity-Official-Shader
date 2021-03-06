﻿Shader "Custom/Detail ScreenPos" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Detail ("Detail", 2D) = "gray" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _Detail;

		struct Input {
			float2 uv_MainTex;
			float4 screenPos;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D( _MainTex, IN.uv_MainTex );
			float2 screenUV = IN.screenPos.xy / IN.screenPos.w;
			screenUV *= float2( 8, 6 );
			o.Albedo *= tex2D( _Detail, screenUV ).rgb * 2;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

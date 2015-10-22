Shader "Custom/Cubemap Reflection" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Cube ("Cubemap", CUBE) = "" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		samplerCUBE _Cube;

		struct Input {
			float3 worldRefl;
			float2 uv_MainTex;
		};
		

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D( _MainTex, IN.uv_MainTex ).rgb * 0.5;
			o.Emission = texCUBE( _Cube, IN.worldRefl ).rgb;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

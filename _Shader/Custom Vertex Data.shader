Shader "Custom/Custom Vertex Data" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert

		sampler2D _MainTex;

		struct Input {
			float3 customColor;
			float2 uv_MainTex;
		};
		void vert( inout appdata_full v, out Input o ){
			UNITY_INITIALIZE_OUTPUT(Input, o);
			o.customColor = abs(v.normal);
		}

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D( _MainTex, IN.uv_MainTex ).rgb;
			o.Albedo *= IN.customColor;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

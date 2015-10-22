Shader "Custom/Diffuse Texture" {
	Properties {
		 _MainTex ("Texture", 2D) = "white" {}
		 // _Ramp ("Ramp", 2D) = "white" {}

	}
	SubShader {
		Tags { "RenderType"="Opaque" }

		CGPROGRAM
		// #pragma surface surf Lambert
		// 
		// This is a custom light model.
		// #pragma surface surf SimpleLambert

		// half4 LightingSimpleLambert( SurfaceOutput  s, half3 lightDir, half atten ){
		// 	half NdotL = dot( s.Normal, lightDir );
		// 	half4 c;
		// 	c.rgb = s.Albedo * _LightColor0.rgb * ( NdotL * atten * 2 );
		// 	c.a = s.Alpha;
		// 	return  c; 
		// }

		// Diffuse Wrap
		// #pragma surface surf WrapLambert

  //   	half4 LightingWrapLambert (SurfaceOutput s, half3 lightDir, half atten) {
	 //        half NdotL = dot (s.Normal, lightDir);
	 //        half diff = NdotL * 0.5 + 0.5;
	 //        half4 c;
	 //        c.rgb = s.Albedo * _LightColor0.rgb * (diff * atten * 2);
	 //        c.a = s.Alpha;
	 //        return c;
  //   	}
    	
    	// #pragma surface surf WrapLambert

    	// half4 LightingWrapLambert (SurfaceOutput s, half3 lightDir, half atten) {
	    //     half NdotL = dot (s.Normal, lightDir);
	    //     half diff = NdotL * 0.5 + 0.5;
	    //     half4 c;
	    //     c.rgb = s.Albedo * _LightColor0.rgb * (diff * atten * 2);
	    //     c.a = s.Alpha;
	    //     return c;
    	// }

    	//Toon Ramp
    	// #pragma surface surf Ramp

   		// sampler2D _Ramp;

    	// half4 LightingRamp (SurfaceOutput s, half3 lightDir, half atten) {
	    //     half NdotL = dot (s.Normal, lightDir);
	    //     half diff = NdotL * 0.5 + 0.5;
	    //     half3 ramp = tex2D (_Ramp, float2(diff)).rgb;
	    //     half4 c;
	    //     c.rgb = s.Albedo * _LightColor0.rgb * ramp * (atten * 2);
	    //     c.a = s.Alpha;
	    //     return c;
   		// }
   		
   		// Simple Specular
   		#pragma surface surf SimpleSpecular

	    half4 LightingSimpleSpecular (SurfaceOutput s, half3 lightDir, half3 viewDir, half atten) {
	        half3 h = normalize (lightDir + viewDir);

	        half diff = max (0, dot (s.Normal, lightDir));

	        float nh = max (0, dot (s.Normal, h));
	        float spec = pow (nh, 48.0);

	        half4 c;
	        c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * spec) * (atten * 2);
	        c.a = s.Alpha;
	        return c;
	    }



		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

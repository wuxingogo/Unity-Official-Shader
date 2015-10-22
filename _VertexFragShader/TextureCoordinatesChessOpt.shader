﻿Shader "Custom/TextureCoordinates/ChessOpt" {
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag 

			#include "UnityCG.cginc" 

			fixed4 frag(v2f_img i) : SV_Target {
				bool p = fmod(i.uv.x * 8.0, 2.0) < 1.0;
				bool q = fmod(i.uv.y * 8.0, 2.0) > 1.0;
				return fixed4(fixed3((p && q) || !(p || q)), 1.0);
			}

			ENDCG
		}
	}
}

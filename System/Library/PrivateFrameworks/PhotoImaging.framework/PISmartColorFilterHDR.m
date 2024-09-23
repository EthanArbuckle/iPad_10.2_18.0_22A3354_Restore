@implementation PISmartColorFilterHDR

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[7];
  _QWORD v19[7];
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  uint64_t v29;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v30[0] = *MEMORY[0x1E0C9DF38];
  v30[1] = v2;
  v3 = *MEMORY[0x1E0C9DEF8];
  v30[2] = *MEMORY[0x1E0C9DF30];
  v30[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v31[1] = CFSTR("inputVibrancy");
  v5 = *MEMORY[0x1E0C9DE60];
  v22[0] = *MEMORY[0x1E0C9DE50];
  v4 = v22[0];
  v22[1] = v5;
  v28[0] = &unk_1E5051C68;
  v28[1] = &unk_1E5051C68;
  v7 = *MEMORY[0x1E0C9DE48];
  v23 = *MEMORY[0x1E0C9DE58];
  v6 = v23;
  v24 = v7;
  v28[2] = &unk_1E5051C78;
  v28[3] = &unk_1E5051C88;
  v9 = *MEMORY[0x1E0C9DE40];
  v25 = *MEMORY[0x1E0C9DE10];
  v8 = v25;
  v26 = v9;
  v28[4] = &unk_1E5051C98;
  v28[5] = &unk_1E5051C98;
  v27 = *MEMORY[0x1E0C9DE68];
  v10 = v27;
  v29 = *MEMORY[0x1E0C9DED0];
  v11 = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v22, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v16;
  v31[2] = *MEMORY[0x1E0C9E1D0];
  v20[0] = v4;
  v20[1] = v5;
  v21[0] = &unk_1E5051C68;
  v21[1] = &unk_1E5051C68;
  v20[2] = v6;
  v20[3] = v7;
  v21[2] = &unk_1E5051C78;
  v21[3] = &unk_1E5051C88;
  v20[4] = v8;
  v20[5] = v9;
  v21[4] = &unk_1E5051C98;
  v21[5] = &unk_1E5051C98;
  v20[6] = v10;
  v21[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v12;
  v31[3] = CFSTR("inputCast");
  v18[0] = v4;
  v18[1] = v5;
  v19[0] = &unk_1E5051C68;
  v19[1] = &unk_1E5051C68;
  v18[2] = v6;
  v18[3] = v7;
  v19[2] = &unk_1E5051C78;
  v19[3] = &unk_1E5051C78;
  v18[4] = v8;
  v18[5] = v9;
  v19[4] = &unk_1E5051C98;
  v19[5] = &unk_1E5051C98;
  v18[6] = v10;
  v19[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL result;

  -[NSNumber doubleValue](self->inputVibrancy, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputContrast, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputCast, "doubleValue");
  result = 0;
  if (fabs(v4) < 1.0e-10 && fabs(v6) < 1.0e-10)
    return fabs(v7) < 1.0e-10;
  return result;
}

- (id)_kernelCPos
{
  if (_kernelCPos_once != -1)
    dispatch_once(&_kernelCPos_once, &__block_literal_global_6347);
  return (id)_kernelCPos_singleton;
}

- (id)_kernelCNeg
{
  if (_kernelCNeg_once != -1)
    dispatch_once(&_kernelCNeg_once, &__block_literal_global_22);
  return (id)_kernelCNeg_singleton;
}

- (id)_kernelV_gt1
{
  if (_kernelV_gt1_once != -1)
    dispatch_once(&_kernelV_gt1_once, &__block_literal_global_25_6342);
  return (id)_kernelV_gt1_singleton;
}

- (id)_kernelV_lt1
{
  if (_kernelV_lt1_once != -1)
    dispatch_once(&_kernelV_lt1_once, &__block_literal_global_28_6339);
  return (id)_kernelV_lt1_singleton;
}

- (id)_kernelCast
{
  if (_kernelCast_once != -1)
    dispatch_once(&_kernelCast_once, &__block_literal_global_31_6335);
  return (id)_kernelCast_singleton;
}

- (id)outputImage
{
  CIImage *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  CIImage *v10;
  __int128 v11;
  __int128 v12;
  int v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  CIImage *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float32x2_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float32x2_t v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v77;
  double v78;
  _QWORD v79[5];
  _QWORD v80[2];
  const __CFString *v81;
  void *v82;
  _QWORD v83[2];
  _QWORD v84[3];

  v84[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
  {
    v3 = 0;
    return v3;
  }
  if (!-[PISmartColorFilterHDR _isIdentity](self, "_isIdentity"))
  {
    -[NSNumber doubleValue](self->inputVibrancy, "doubleValue");
    v5 = fmin(fmax(v4, -1.0), 2.0);
    -[NSNumber doubleValue](self->inputContrast, "doubleValue");
    v7 = fmin(fmax(v6, -1.0), 2.0);
    -[NSNumber doubleValue](self->inputCast, "doubleValue");
    v9 = fmin(fmax(v8, -1.0), 1.0);
    v10 = self->inputImage;
    v3 = v10;
    if (fabs(v5) >= 1.0e-10)
    {
      if (v5 <= 0.0)
        v14 = v5 + 1.0;
      else
        v14 = v5 * 3.0 + 1.0;
      -[CIImage imageByUnpremultiplyingAlpha](v10, "imageByUnpremultiplyingAlpha");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 >= 1.0)
        -[PISmartColorFilterHDR _kernelV_gt1](self, "_kernelV_gt1");
      else
        -[PISmartColorFilterHDR _kernelV_lt1](self, "_kernelV_lt1");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "extent");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v84[0] = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "applyWithExtent:arguments:", v27, v19, v21, v23, v25);
      v3 = (CIImage *)objc_claimAutoreleasedReturnValue();

      if (fabs(v7) < 1.0e-10)
        goto LABEL_21;
    }
    else
    {
      if (fabs(v7) < 1.0e-10)
      {
        if (fabsf(v9) < 1.0e-10)
          return v3;
        v13 = 1;
        goto LABEL_23;
      }
      -[CIImage imageByUnpremultiplyingAlpha](v10, "imageByUnpremultiplyingAlpha");
      v16 = objc_claimAutoreleasedReturnValue();

      v3 = (CIImage *)v16;
    }
    v28 = v7 + v7;
    if (v7 + v7 <= 0.0)
    {
      v81 = CFSTR("inputAmount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v28 / 6.0, -0.4));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIImage imageByApplyingFilter:withInputParameters:](v3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIVibrance"), v42);
      v43 = (CIImage *)objc_claimAutoreleasedReturnValue();

      -[PISmartColorFilterHDR _kernelCNeg](self, "_kernelCNeg");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIImage extent](v43, "extent");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v80[0] = v43;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v28);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v80[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "applyWithExtent:arguments:", v39, v45, v47, v49, v51);
      v40 = objc_claimAutoreleasedReturnValue();
      v3 = v43;
    }
    else
    {
      -[PISmartColorFilterHDR _kernelCPos](self, "_kernelCPos");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIImage extent](v3, "extent");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v83[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 + v7);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v83[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "applyWithExtent:arguments:", v39, v31, v33, v35, v37);
      v40 = objc_claimAutoreleasedReturnValue();
    }

    v3 = (CIImage *)v40;
LABEL_21:
    if (fabsf(v9) < 1.0e-10)
    {
LABEL_35:
      -[CIImage imageByPremultiplyingAlpha](v3, "imageByPremultiplyingAlpha");
      v75 = objc_claimAutoreleasedReturnValue();

      v3 = (CIImage *)v75;
      return v3;
    }
    v13 = 0;
LABEL_23:
    if (v9 <= 0.0)
    {
      if (v9 > -0.5)
      {
        *(float *)&v11 = v9 * -2.0;
        v52 = (float32x2_t)0x3CA3D70ABD4CCCCDLL;
LABEL_28:
        *(float32x2_t *)&v11 = vmul_n_f32(v52, *(float *)&v11);
        v77 = v11;
        v53 = 0.3;
        if (!v13)
          goto LABEL_34;
        goto LABEL_33;
      }
      v54 = (float)(v9 + 0.5) * -2.0;
      v55 = 1.0;
      v56 = 1.0 - v54;
      *(float32x2_t *)&v12 = vmul_n_f32((float32x2_t)0xBCA3D70ABE0F5C29, v54);
      v57 = (float32x2_t)0x3CA3D70ABD4CCCCDLL;
    }
    else
    {
      if (v9 < 0.5)
      {
        *(float *)&v11 = v9 + v9;
        v52 = (float32x2_t)0xBD23D70A3DCCCCCDLL;
        goto LABEL_28;
      }
      v54 = (float)(v9 + -0.5) + (float)(v9 + -0.5);
      v55 = 1.0;
      v56 = 1.0 - v54;
      *(float32x2_t *)&v12 = vmul_n_f32((float32x2_t)0x3C23D70A3E3851ECLL, v54);
      v57 = (float32x2_t)0xBD23D70A3DCCCCCDLL;
    }
    *(float32x2_t *)&v12 = vmla_n_f32(*(float32x2_t *)&v12, v57, v56);
    v77 = v12;
    v53 = (float)(v55 + (float)(v54 * -0.6)) * 0.3;
    if (!v13)
    {
LABEL_34:
      -[PISmartColorFilterHDR _kernelCast](self, "_kernelCast", v77);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIImage extent](v3, "extent");
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;
      v79[0] = v3;
      v79[1] = &unk_1E5051C88;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v78);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v79[2] = v68;
      HIDWORD(v69) = HIDWORD(v78);
      LODWORD(v69) = HIDWORD(v78);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v79[3] = v70;
      *(float *)&v71 = v53;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v79[4] = v72;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 5);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "applyWithExtent:arguments:", v73, v61, v63, v65, v67);
      v74 = objc_claimAutoreleasedReturnValue();

      v3 = (CIImage *)v74;
      goto LABEL_35;
    }
LABEL_33:
    -[CIImage imageByUnpremultiplyingAlpha](v3, "imageByUnpremultiplyingAlpha", v77);
    v58 = objc_claimAutoreleasedReturnValue();

    v3 = (CIImage *)v58;
    goto LABEL_34;
  }
  v3 = self->inputImage;
  return v3;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->inputImage, a3);
}

- (NSNumber)inputVibrancy
{
  return self->inputVibrancy;
}

- (void)setInputVibrancy:(id)a3
{
  objc_storeStrong((id *)&self->inputVibrancy, a3);
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
  objc_storeStrong((id *)&self->inputContrast, a3);
}

- (NSNumber)inputCast
{
  return self->inputCast;
}

- (void)setInputCast:(id)a3
{
  objc_storeStrong((id *)&self->inputCast, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputCast, 0);
  objc_storeStrong((id *)&self->inputContrast, 0);
  objc_storeStrong((id *)&self->inputVibrancy, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

void __36__PISmartColorFilterHDR__kernelCast__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smartcolor_cast_HDR (__sample im, float lum, float grayI, float grayQ, float strength) \n { \n vec4 pix = clamp(im, 0.0, 1.0); \n pix.rgb = pow(pix.rgb, vec3(.25)); \n pix.rgb = pix.r * vec3(0.299, 0.595716, 0.211456) + \n pix.g * vec3(0.587, -0.274453, -0.522591) + \n pix.b * vec3(0.114, -0.321263, 0.311135); \n vec2 grayOffset = vec2(grayI, grayQ) ; \n vec3 result = pix.rgb; \n float newStrength = 1.0 + (strength-1.0)*(1.0-pix.r) ; \n result.gb = pix.gb + newStrength*grayOffset ; \n float damp = max(min(1.0, pix.r/(lum+0.00001)),0.0) ; \n result.rgb = mix(pix.rgb, result.rgb, damp) ; \n pix.rgb = result.r * vec3(1.0) + \n result.g * vec3(0.956296, -0.272122, -1.10699) + \n result.b * vec3(0.621024, -0.647381, 1.70461); \n pix.rgb = clamp(pix.rgb, 0.0, 1.0); \n pix.rgb *= pix.rgb*pix.rgb*pix.rgb; \n pix.rgb += min(im.rgb, 0.0) + max(im.rgb,1.0) -1.0; \n return pix; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelCast_singleton;
  _kernelCast_singleton = v0;

}

void __37__PISmartColorFilterHDR__kernelV_lt1__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smartcolor_vibrancy_lt1_HDR (__sample im, float amt) \n { \n float gray = dot(im.rgb, vec3(0.333333)); \n im.rgb = mix(vec3(gray), im.rgb, amt); \n return im; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelV_lt1_singleton;
  _kernelV_lt1_singleton = v0;

}

void __37__PISmartColorFilterHDR__kernelV_gt1__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smartcolor_vibrancy_gt1_HDR (__sample im, float amt) \n { \n float gray = dot(clamp(im.rgb, 0.0, 1.0), vec3(.3, .5, .2)); \n float y = dot(clamp(im.rgb, 0.0, 1.0), vec3(.4, .2, .1)); \n float damp = 1.0-4.0*y*(1.0-y); \n float s = 1.0/(im.r+im.g+im.b); \n float r = im.r*s; \n float b = im.b*s; \n float d = 1.0-.8*smoothstep(0.2, 0.4, r-b); \n damp *= d; \n damp = amt > 2.5 ? min(damp+(amt-2.5)/5.0, 1.0) : damp; \n float sat = min(amt, 3.0); \n vec4 result; \n result.rgb = (im.rgb - gray)*sat + gray; \n result.rgb = mix(im.rgb, result.rgb, damp); \n result.a = im.a; \n return result; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelV_gt1_singleton;
  _kernelV_gt1_singleton = v0;

}

void __36__PISmartColorFilterHDR__kernelCNeg__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smartcolor_contrast_darken_HDR (__sample im, float amt) \n { \n vec3 diff = im.rgb-dot(im.rgb, vec3(.0, .3, .5)); \n float dist = distance(diff, vec3(0.0)); \n dist = smoothstep(0.0, 1.0, dist); \n float strength = 5.0*dist*amt; \n vec3 pos = max(im.rgb, 1.0)-1.0 + min(im.rgb, 0.0); \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n strength *= (im.b-im.g); \n float gray = 1.0-min(dot(im.rgb, vec3(0.5, 0.7, -0.20)), 1.0); \n vec4 result; \n result.rgb = strength < 0.0 ? pow(im.rgb, vec3(1.0-strength*gray)) : im.rgb/(strength+1.0-(im.rgb*strength)); \n result.rgb += pos; result.a = im.a; \n return result; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelCNeg_singleton;
  _kernelCNeg_singleton = v0;

}

void __36__PISmartColorFilterHDR__kernelCPos__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smartcolor_contrast_HDR (__sample im, float amt) \n { \n vec3 diff = im.rgb-dot(im.rgb, vec3(.0, .3, .5)); \n float dist = distance(diff, vec3(0.0)); \n dist = smoothstep(0.0, 1.0, dist); \n float strength = 5.0*dist*amt; \n vec3 pos = max(im.rgb, 1.0)-1.0 + min(im.rgb, 0.0); \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n strength *= (im.b-im.g); \n strength = max(strength, -0.35); \n vec4 result; \n result.rgb = im.rgb/(strength + 1.0 - (im.rgb*strength)) + pos; \n result.a = im.a; \n return result; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelCPos_singleton;
  _kernelCPos_singleton = v0;

}

@end

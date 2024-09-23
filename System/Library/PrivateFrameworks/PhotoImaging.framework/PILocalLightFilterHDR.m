@implementation PILocalLightFilterHDR

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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[7];
  _QWORD v25[7];
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[8];
  _QWORD v34[2];
  _QWORD v35[5];
  _QWORD v36[7];

  v36[5] = *MEMORY[0x1E0C80C00];
  v35[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF30];
  v34[0] = *MEMORY[0x1E0C9DF00];
  v34[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  v35[1] = CFSTR("inputLocalLight");
  v4 = *MEMORY[0x1E0C9DE60];
  v26[0] = *MEMORY[0x1E0C9DE50];
  v3 = v26[0];
  v26[1] = v4;
  v33[0] = &unk_1E5051E98;
  v33[1] = &unk_1E5051E98;
  v6 = *MEMORY[0x1E0C9DE48];
  v27 = *MEMORY[0x1E0C9DE58];
  v5 = v27;
  v28 = v6;
  v33[2] = &unk_1E5051EA8;
  v33[3] = &unk_1E5051EB8;
  v8 = *MEMORY[0x1E0C9DE40];
  v29 = *MEMORY[0x1E0C9DE10];
  v7 = v29;
  v30 = v8;
  v33[4] = &unk_1E5051E88;
  v33[5] = &unk_1E5051E88;
  v10 = *MEMORY[0x1E0C9DED0];
  v11 = *MEMORY[0x1E0C9DE08];
  v31 = *MEMORY[0x1E0C9DE68];
  v9 = v31;
  v32 = v11;
  v33[6] = v10;
  v33[7] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v26, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v18;
  v35[2] = CFSTR("inputSmartShadows");
  v24[0] = v3;
  v24[1] = v4;
  v25[0] = &unk_1E5051EC8;
  v25[1] = &unk_1E5051EC8;
  v24[2] = v5;
  v24[3] = v6;
  v25[2] = &unk_1E5051EB8;
  v25[3] = &unk_1E5051EB8;
  v24[4] = v7;
  v24[5] = v8;
  v25[4] = &unk_1E5051E88;
  v25[5] = &unk_1E5051E88;
  v24[6] = v9;
  v25[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v12;
  v35[3] = CFSTR("inputLightMapWidth");
  v22[0] = v3;
  v22[1] = v7;
  v23[0] = &unk_1E5051E88;
  v23[1] = &unk_1E5051E88;
  v13 = *MEMORY[0x1E0C9DE90];
  v22[2] = v9;
  v22[3] = v11;
  v23[2] = v13;
  v23[3] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v14;
  v35[4] = CFSTR("inputLightMapHeight");
  v20[0] = v3;
  v20[1] = v7;
  v21[0] = &unk_1E5051E88;
  v21[1] = &unk_1E5051E88;
  v20[2] = v9;
  v20[3] = v11;
  v21[2] = v13;
  v21[3] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_shadowKernelHDR
{
  if (_shadowKernelHDR_once != -1)
    dispatch_once(&_shadowKernelHDR_once, &__block_literal_global_14167);
  return (id)_shadowKernelHDR_singleton;
}

- (id)_polyKernelHDR
{
  if (_polyKernelHDR_once != -1)
    dispatch_once(&_polyKernelHDR_once, &__block_literal_global_47);
  return (id)_polyKernelHDR_singleton;
}

- (id)outputImage
{
  double v3;
  double v4;
  CIImage *inputGuideImage;
  CIImage *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CIImage *inputLightMapImage;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CIImage *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  NSData *inputLightMap;
  NSNumber *inputLightMapWidth;
  NSNumber *inputLightMapHeight;
  CIImage *v62;
  void *v63;
  _QWORD v65[3];
  _QWORD v66[4];
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v66[3] = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    -[NSNumber doubleValue](self->inputLocalLight, "doubleValue");
    if (fabs(v3) >= 1.0e-10 || (-[NSNumber doubleValue](self->inputSmartShadows, "doubleValue"), fabs(v4) >= 1.0e-10))
    {
      if (self->inputLightMap || self->inputLightMapImage)
      {
        inputGuideImage = self->inputGuideImage;
        if (!inputGuideImage)
          inputGuideImage = self->inputImage;
        v6 = inputGuideImage;
        -[CIImage extent](v6, "extent");
        v8 = v7;
        v10 = v9;
        v12 = v11;
        v14 = v13;
        -[CIImage extent](self->inputImage, "extent");
        v69.origin.x = v15;
        v69.origin.y = v16;
        v69.size.width = v17;
        v69.size.height = v18;
        v67.origin.x = v8;
        v67.origin.y = v10;
        v67.size.width = v12;
        v67.size.height = v14;
        if (!CGRectEqualToRect(v67, v69))
          __assert_rtn("-[PILocalLightFilterHDR outputImage]", "PILocalLightHDR.m", 683, "CGRectEqualToRect([guideImage extent], [inputImage extent])");
        inputLightMapImage = self->inputLightMapImage;
        if (inputLightMapImage)
        {
          _scaledLightMapImage(inputLightMapImage, v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
LABEL_11:
            -[PILocalLightFilterHDR _polyKernelHDR](self, "_polyKernelHDR");
            v21 = objc_claimAutoreleasedReturnValue();
            if (!self->inputImage)
              __assert_rtn("-[PILocalLightFilterHDR outputImage]", "PILocalLightHDR.m", 699, "inputImage != nil");
            if (!v6)
              __assert_rtn("-[PILocalLightFilterHDR outputImage]", "PILocalLightHDR.m", 700, "guideImage != nil");
            if (!self->inputLocalLight)
              __assert_rtn("-[PILocalLightFilterHDR outputImage]", "PILocalLightHDR.m", 702, "inputLocalLight != nil");
            v22 = (void *)v21;
            objc_msgSend(v20, "extent");
            v24 = v23;
            v26 = v25;
            v28 = v27;
            v30 = v29;
            -[CIImage extent](self->inputImage, "extent");
            v70.origin.x = v31;
            v70.origin.y = v32;
            v70.size.width = v33;
            v70.size.height = v34;
            v68.origin.x = v24;
            v68.origin.y = v26;
            v68.size.width = v28;
            v68.size.height = v30;
            if (!CGRectEqualToRect(v68, v70))
              __assert_rtn("-[PILocalLightFilterHDR outputImage]", "PILocalLightHDR.m", 703, "CGRectEqualToRect([lightMapImage extent], [inputImage extent])");
            v35 = self->inputImage;
            -[NSNumber doubleValue](self->inputLocalLight, "doubleValue");
            if (fabs(v36) >= 1.0e-10)
            {
              -[CIImage extent](self->inputImage, "extent");
              v38 = v37;
              v40 = v39;
              v42 = v41;
              v44 = v43;
              v66[0] = v35;
              v66[1] = v20;
              v66[2] = self->inputLocalLight;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "applyWithExtent:arguments:", v45, v38, v40, v42, v44);
              v46 = objc_claimAutoreleasedReturnValue();

              v35 = (CIImage *)v46;
            }
            -[NSNumber doubleValue](self->inputSmartShadows, "doubleValue");
            if (fabs(v47) >= 1.0e-10)
            {
              -[PILocalLightFilterHDR _shadowKernelHDR](self, "_shadowKernelHDR");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[CIImage extent](self->inputImage, "extent");
              v50 = v49;
              v52 = v51;
              v54 = v53;
              v56 = v55;
              v65[0] = v35;
              v65[1] = v20;
              v65[2] = self->inputSmartShadows;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "applyWithExtent:arguments:", v57, v50, v52, v54, v56);
              v58 = objc_claimAutoreleasedReturnValue();

              v35 = (CIImage *)v58;
            }

            goto LABEL_24;
          }
        }
        else
        {
          inputLightMap = self->inputLightMap;
          inputLightMapWidth = self->inputLightMapWidth;
          inputLightMapHeight = self->inputLightMapHeight;
          v62 = v6;
          _lightMapImageFromData(inputLightMap, inputLightMapWidth, inputLightMapHeight);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          _scaledLightMapImage(v63, v62);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            goto LABEL_11;
        }
        v35 = self->inputImage;
LABEL_24:

        return v35;
      }
    }
    v35 = self->inputImage;
  }
  else
  {
    v35 = 0;
  }
  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputSmartShadows, 0);
  objc_storeStrong((id *)&self->inputLocalLight, 0);
  objc_storeStrong((id *)&self->inputLightMapHeight, 0);
  objc_storeStrong((id *)&self->inputLightMapWidth, 0);
  objc_storeStrong((id *)&self->inputLightMapImage, 0);
  objc_storeStrong((id *)&self->inputLightMap, 0);
  objc_storeStrong((id *)&self->inputGuideImage, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

void __39__PILocalLightFilterHDR__polyKernelHDR__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _polyKernelHDR(__sample im, __sample adj, float str) { adj.r = 3.4*adj.r-1.2; vec3 neg = min(im.rgb, 0.0); vec3 pos = max(im.rgb, 1.0)-1.0; im.rgb = clamp(im.rgb, 0.0, 1.0); vec4 orig = im; float y = sqrt(dot(im.rgb, vec3(.33333))); float s = mix(0.0, adj.r, str); vec3 gain = s > 0.0 ? vec3(1.5*s) : vec3(1.75*s, 1.75*s, 1.55*s); im.rgb = im.rgb*im.rgb*gain + im.rgb*(1.0-gain); im.rgb = (clamp(im.rgb, 0.0, 1.0)); float midAmt = min(str, .5); y = y*(1.0-y); im.rgb = sqrt(im.rgb); float pivot = max(adj.g, 0.5); float a = midAmt*y; float b = -pivot*a; vec3 pix = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); \n im.rgb = mix(im.rgb, vec3(pivot), -y*midAmt); im.rgb = mix(im.rgb, pix, 0.8); im.rgb = max(im.rgb, 0.0); im.rgb *= im.rgb; im.rgb = clamp(im.rgb, 0.0,1.0)+pos+neg; return im; }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_polyKernelHDR_singleton;
  _polyKernelHDR_singleton = v0;

}

void __41__PILocalLightFilterHDR__shadowKernelHDR__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _shadowKernelHDR(__sample im, __sample adj, float str) { adj.r = 3.4*adj.r-1.2; vec3 neg = min(im.rgb, 0.0); vec3 pos = max(im.rgb, 1.0)-1.0; im.rgb = clamp(im.rgb, 0.0, 1.0); vec4 orig = im; float y = sqrt(dot(im.rgb, vec3(.33333))); float s = mix(0.0, adj.r, str); vec3 gain = s > 0.0 ? vec3(0.0) : vec3(s*s) * vec3(-2.75, -2.75, -2.5); im.rgb = im.rgb*im.rgb*gain + im.rgb*(1.0-gain); float m = 1.0 + 1.85*s*(max(0.1-y, 0.0)) ; im.rgb = (clamp(m*im.rgb, 0.0, 1.0)); float midAmt = s < 0.0 ? min(s*s,1.0) : 0.0; y = y*(1.0-y); im.rgb = sqrt(im.rgb); float pivot = .4; float a = midAmt*y; float b = -pivot*a; vec3 pix = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); im.rgb = mix(im.rgb, vec3(pivot), -y*midAmt); im.rgb = mix(im.rgb, pix, 0.8); im.rgb = max(im.rgb, 0.0); im.rgb *= im.rgb; im.rgb = clamp(im.rgb, 0.0,1.0)+pos+neg; return im; }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_shadowKernelHDR_singleton;
  _shadowKernelHDR_singleton = v0;

}

@end

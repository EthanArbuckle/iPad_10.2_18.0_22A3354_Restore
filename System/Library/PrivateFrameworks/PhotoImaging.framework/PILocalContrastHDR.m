@implementation PILocalContrastHDR

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  uint64_t v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[5];

  v25[3] = *MEMORY[0x1E0C80C00];
  v24[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF30];
  v23[0] = *MEMORY[0x1E0C9DF00];
  v23[1] = v2;
  v23[2] = *MEMORY[0x1E0C9DEE8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v24[1] = CFSTR("inputStrength");
  v20[0] = *MEMORY[0x1E0C9DE08];
  v3 = v20[0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C9DE10];
  v21[0] = v5;
  v21[1] = &unk_1E5051958;
  v7 = *MEMORY[0x1E0C9DE50];
  v20[1] = v6;
  v20[2] = v7;
  v8 = *MEMORY[0x1E0C9DE48];
  v21[2] = &unk_1E5051968;
  v21[3] = &unk_1E5051978;
  v9 = *MEMORY[0x1E0C9DE68];
  v20[3] = v8;
  v20[4] = v9;
  v22 = *MEMORY[0x1E0C9DED0];
  v10 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  v24[2] = CFSTR("inputScale");
  v18[0] = v3;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = &unk_1E5051988;
  v18[1] = v6;
  v18[2] = v7;
  v19[2] = &unk_1E5051998;
  v19[3] = &unk_1E50519A8;
  v18[3] = v8;
  v18[4] = v9;
  v19[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_kernelLocalContrast
{
  if (_kernelLocalContrast_once != -1)
    dispatch_once(&_kernelLocalContrast_once, &__block_literal_global_511);
  return (id)_kernelLocalContrast_singleton;
}

- (id)outputImage
{
  CIImage *inputImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  float v32;
  void *v33;
  CIImage *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  NSNumber *inputStrength;
  void *v53;
  void *v54;
  CGAffineTransform v56;
  _QWORD v57[4];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[5];
  _QWORD v63[7];

  v63[5] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  v62[0] = CFSTR("inputRVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.333333, 0.333333, 0.333333, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v4;
  v62[1] = CFSTR("inputGVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.333333, 0.333333, 0.333333, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v5;
  v62[2] = CFSTR("inputBVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.333333, 0.333333, 0.333333, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v6;
  v62[3] = CFSTR("inputAVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v7;
  v62[4] = CFSTR("inputBiasVector");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D52108], "HLGOpticalScale");
  v12 = v11;
  v60[0] = CFSTR("inputMinComponents");
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = CFSTR("inputMaxComponents");
  v61[0] = v13;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v12, v12, v12, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorClamp"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSNumber floatValue](self->inputScale, "floatValue");
  v18 = v17;
  -[CIImage extent](self->inputImage, "extent");
  v20 = v19;
  v21 = v18 / v20;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v23 = v22;
  -[CIImage extent](self->inputImage, "extent");
  v25 = v24;
  v26 = v23 / v25;
  objc_msgSend(v16, "imageByClampingToExtent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeScale(&v56, v21, v26);
  objc_msgSend(v27, "imageByApplyingTransform:", &v56);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageByApplyingGaussianBlurWithSigma:", 5.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSNumber floatValue](self->inputScale, "floatValue");
  v31 = v30;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  objc_msgSend(v29, "imageByCroppingToRect:", 0.0, 0.0, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = self->inputImage;
  v59[0] = v33;
  v58[0] = CFSTR("inputSmallImage");
  v58[1] = CFSTR("inputSpatialSigma");
  LODWORD(v35) = 5.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v36;
  v58[2] = CFSTR("inputLumaSigma");
  LODWORD(v37) = 1041865114;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage imageByApplyingFilter:withInputParameters:](v34, "imageByApplyingFilter:withInputParameters:", CFSTR("CIEdgePreserveUpsampleFilter"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[CIImage extent](self->inputImage, "extent");
  objc_msgSend(v40, "imageByCroppingToRect:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[PILocalContrastHDR _kernelLocalContrast](self, "_kernelLocalContrast");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage extent](self->inputImage, "extent");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v57[0] = self->inputImage;
  v57[1] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  inputStrength = self->inputStrength;
  v57[2] = v51;
  v57[3] = inputStrength;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "applyWithExtent:arguments:", v53, v44, v46, v48, v50);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputScale, 0);
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

void __42__PILocalContrastHDR__kernelLocalContrast__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("vec3 localContrast(vec3 im, vec3 shc, float amt) { float midAmt = amt; vec3 neg = min(im, 0.0); vec3 pos = max(im, 1.0)-1.0; im = clamp(im, 0.0, 1.0); float y = dot(im, vec3(0.3333)); y = sqrt(y); y = y*(1.0-y); im = sqrt(im); float pivot = sqrt(shc.g); float a = midAmt*y; float b = -pivot*a; vec3 pix = im.r * vec3(0.299*a) + im.g * vec3(0.587*a) + im.b * vec3(0.114*a) + im + vec3(b); im = mix(im, vec3(pivot), -y*midAmt); im = mix(im, pix, 0.8); im = max(im, 0.0); im *= im; im = im + neg + pos; return im; } vec3 localContrastHLG(vec3 im, vec3 shc, float hlg_scale, float amt) { return localContrast(im.rgb/hlg_scale, shc.rgb/hlg_scale, amt).rgb * hlg_scale; } kernel vec4 _localContrastHDR(__sample im, __sample shc, float hlg_scale, float amt) { float max_comp = max(im.r,max(im.g,im.b)); float threshold = 0.75 * hlg_scale; if (max_comp <= 1.0) { im.rgb = localContrast(im.rgb, shc.rgb, amt); } else if (max_comp < threshold) { vec3 retSDR = localContrast(im.rgb, shc.rgb, amt); vec3 retHDR = localContrastHLG(im.rgb, shc.rgb, hlg_scale, amt); float lerp_t = (max_comp - 1.0) / (threshold - 1.0); im.rgb = mix(retSDR, retHDR, lerp_t); } else { im.rgb = localContrastHLG(im.rgb, shc.rgb, hlg_scale, amt); } return im; }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelLocalContrast_singleton;
  _kernelLocalContrast_singleton = v0;

}

@end

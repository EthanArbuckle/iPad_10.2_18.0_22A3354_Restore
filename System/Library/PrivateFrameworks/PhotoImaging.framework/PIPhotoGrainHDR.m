@implementation PIPhotoGrainHDR

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
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  _QWORD v28[7];
  _QWORD v29[4];
  _QWORD v30[6];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v28[0] = *MEMORY[0x1E0C9DF08];
  v28[1] = v2;
  v3 = *MEMORY[0x1E0C9DF28];
  v28[2] = *MEMORY[0x1E0C9DF20];
  v28[3] = v3;
  v4 = *MEMORY[0x1E0C9DEF8];
  v28[4] = *MEMORY[0x1E0C9DF30];
  v28[5] = v4;
  v28[6] = *MEMORY[0x1E0C9DEE8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  v29[1] = CFSTR("inputISO");
  v6 = *MEMORY[0x1E0C9DE60];
  v22[0] = *MEMORY[0x1E0C9DE50];
  v5 = v22[0];
  v22[1] = v6;
  v27[0] = &unk_1E50521F8;
  v27[1] = &unk_1E50521F8;
  v8 = *MEMORY[0x1E0C9DE10];
  v23 = *MEMORY[0x1E0C9DE58];
  v7 = v23;
  v24 = v8;
  v27[2] = &unk_1E5052208;
  v27[3] = &unk_1E50521F8;
  v10 = *MEMORY[0x1E0C9DE68];
  v25 = *MEMORY[0x1E0C9DE40];
  v9 = v25;
  v26 = v10;
  v11 = *MEMORY[0x1E0C9DED0];
  v27[4] = &unk_1E5052218;
  v27[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v22, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v16;
  v29[2] = CFSTR("inputAmount");
  v20[0] = v5;
  v20[1] = v6;
  v21[0] = &unk_1E5052218;
  v21[1] = &unk_1E5052218;
  v20[2] = v7;
  v20[3] = v8;
  v21[2] = &unk_1E5052228;
  v21[3] = &unk_1E5052228;
  v20[4] = v9;
  v20[5] = v10;
  v21[4] = &unk_1E5052218;
  v21[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v12;
  v29[3] = CFSTR("inputSeed");
  v18[0] = v5;
  v18[1] = v6;
  v19[0] = &unk_1E5052218;
  v19[1] = &unk_1E5052218;
  v18[2] = v7;
  v18[3] = v8;
  v19[2] = &unk_1E5052228;
  v19[3] = &unk_1E5052218;
  v18[4] = v10;
  v19[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_interpolateGrainKernel
{
  __CFString *v2;
  id v3;
  _QWORD block[4];
  const __CFString *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PIPhotoGrainHDR__interpolateGrainKernel__block_invoke;
  block[3] = &unk_1E50195F0;
  v6 = CFSTR("kernel vec4 _blendGrainsHDR(__sample isoImages, float log10iso)\n{\n  vec4 c = isoImages; \n  float mix10_50    = mix(c.r, c.g, log10iso*1.43067655809 \n                                           - 1.43067655809); \n  float mix50_400   = mix(c.g, c.b, log10iso*1.10730936496 \n                                           - 1.88128539659); \n  float mix400_3200 = mix(c.b, c.a, log10iso*1.10730936496 \n                                           - 2.88128539659); \n  float v = compare(log10iso - 1.69897000434,                     mix10_50,                     compare(log10iso - 2.60205999133,                             mix50_400,                             mix400_3200)); \n  return vec4(v,v,v,1.0);\n}");
  if (_interpolateGrainKernel_once == -1)
  {
    v2 = CFSTR("kernel vec4 _blendGrainsHDR(__sample isoImages, float log10iso)\n{\n  vec4 c = isoImages; \n  float mix10_50    = mix(c.r, c.g, log10iso*1.43067655809 \n                                           - 1.43067655809); \n  float mix50_400   = mix(c.g, c.b, log10iso*1.10730936496 \n                                           - 1.88128539659); \n  float mix400_3200 = mix(c.b, c.a, log10iso*1.10730936496 \n                                           - 2.88128539659); \n  float v = compare(log10iso - 1.69897000434,                     mix10_50,                     compare(log10iso - 2.60205999133,                             mix50_400,                             mix400_3200)); \n  return vec4(v,v,v,1.0);\n}");
  }
  else
  {
    dispatch_once(&_interpolateGrainKernel_once, block);
    v2 = (__CFString *)v6;
  }
  v3 = (id)_interpolateGrainKernel_singleton;

  return v3;
}

- (id)_grainBlendAndMixKernel
{
  if (_grainBlendAndMixKernel_once != -1)
    dispatch_once(&_grainBlendAndMixKernel_once, &__block_literal_global_19901);
  return (id)_grainBlendAndMixKernel_singleton;
}

- (id)_paddedTileKernel
{
  if (_paddedTileKernel_once != -1)
    dispatch_once(&_paddedTileKernel_once, &__block_literal_global_6_19897);
  return (id)_paddedTileKernel_singleton;
}

- (id)outputImage
{
  float v3;
  CIImage *v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  unsigned int v35;
  uint64_t v36;
  double v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  NSNumber *inputAmount;
  void *v52;
  void *v53;
  CGAffineTransform v55;
  _QWORD v56[2];
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  double __src;
  _QWORD v63[8];
  _QWORD v64[4];
  void *v65;
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    goto LABEL_10;
  -[NSNumber floatValue](self->inputAmount, "floatValue");
  if (v3 < 0.001)
  {
    v4 = self->inputImage;
    return v4;
  }
  -[NSNumber floatValue](self->inputISO, "floatValue");
  v6 = fminf(fmaxf(v5, 10.0), 3200.0);
  v7 = log10f(v6);
  if (outputImage_onceToken != -1)
    dispatch_once(&outputImage_onceToken, &__block_literal_global_19);
  if (!outputImage_inputGrain)
  {
LABEL_10:
    v4 = 0;
    return v4;
  }
  -[PIPhotoGrainHDR _interpolateGrainKernel](self, "_interpolateGrainKernel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)outputImage_inputGrain, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v66[0] = outputImage_inputGrain;
  *(float *)&v9 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyWithExtent:arguments:", v18, v10, v12, v14, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "extent");
  v21 = v20 + -2.0;
  objc_msgSend(v19, "extent");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PIPhotoGrainHDR _paddedTileKernel](self, "_paddedTileKernel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __30__PIPhotoGrainHDR_outputImage__block_invoke_2;
  v63[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v63[4] = v23;
  v63[5] = v25;
  v63[6] = v27;
  v63[7] = v29;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v21, v21, 1.0 / v21, 1.0 / v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applyWithExtent:roiCallback:inputImage:arguments:", v63, v19, v32, *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSNumber doubleValue](self->inputSeed, "doubleValue");
  __src = v34;
  if (v34 != 0.0)
  {
    v56[1] = 0;
    v58 = 0;
    v60 = 0u;
    v61 = 0u;
    v57 = xmmword_1A64DDE70;
    v59 = 0x61C8864E7A143579uLL;
    v56[0] = 0;
    XXH64_update((uint64_t)v56, (char *)&__src, 8uLL);
    v35 = XXH64_digest((uint64_t)v56);
    CGAffineTransformMakeTranslation(&v55, (double)(v35 & 0x1FF), (double)((v35 >> 9) & 0x1FF));
    objc_msgSend(v33, "imageByApplyingTransform:", &v55);
    v36 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v36;
  }
  *(float *)&v37 = grainParams(v6);
  v39 = v38;
  -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha", v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPhotoGrainHDR _grainBlendAndMixKernel](self, "_grainBlendAndMixKernel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "extent");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v64[0] = v40;
  v64[1] = v33;
  LODWORD(v42) = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  inputAmount = self->inputAmount;
  v64[2] = v50;
  v64[3] = inputAmount;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "applyWithExtent:arguments:", v52, v43, v45, v47, v49);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "imageByPremultiplyingAlpha");
  v4 = (CIImage *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->inputImage, a3);
}

- (NSNumber)inputISO
{
  return self->inputISO;
}

- (void)setInputISO:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputSeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputSeed, 0);
  objc_storeStrong((id *)&self->inputAmount, 0);
  objc_storeStrong((id *)&self->inputISO, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

double __30__PIPhotoGrainHDR_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

void __30__PIPhotoGrainHDR_outputImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _QWORD v28[4];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "1536 x 1536 noise grain image prov", 32);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C9E150];
  v29[0] = *MEMORY[0x1E0C9E148];
  v29[1] = v1;
  v30[0] = v0;
  v30[1] = CFSTR("PIPhotoGrainHDR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  v4 = (void *)objc_msgSend(v3, "initWithImageProvider:width:height:format:colorSpace:options:", &__block_literal_global_55, 1536, 1536, *MEMORY[0x1E0C9E070], 0, v2);
  applyGrainParams(v4, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  applyGrainParams(v4, 50.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  applyGrainParams(v4, 400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  applyGrainParams(v4, 3200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _grainGenCombineHDR (__sample r, __sample g, __sample b, __sample a)\n{ return vec4(r.x, g.x, b.x, a.x); }"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extent");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v28[0] = v5;
  v28[1] = v6;
  v28[2] = v7;
  v28[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyWithExtent:arguments:", v18, v11, v13, v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "imageByCroppingToRect:", 511.0, 511.0, 514.0, 514.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeTranslation(&v27, -511.0, -511.0);
  objc_msgSend(v20, "imageByApplyingTransform:", &v27);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)outputImage_inputGrain;
  outputImage_inputGrain = v21;

  v23 = (void *)outputImage_inputGrain;
  CGAffineTransformMakeTranslation(&v26, -1.0, -1.0);
  objc_msgSend(v23, "imageByApplyingTransform:", &v26);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)outputImage_inputGrain;
  outputImage_inputGrain = v24;

}

void __36__PIPhotoGrainHDR__paddedTileKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DE00], "kernelWithString:", CFSTR("kernel vec2 _paddedTile2(vec4 k) { return fract(destCoord() * k.zw) * k.xy + vec2(1.0); }\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_paddedTileKernel_singleton;
  _paddedTileKernel_singleton = v0;

}

uint64_t __42__PIPhotoGrainHDR__grainBlendAndMixKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _grainBlendAndMixHDR(__sample img, __sample grainImage, float contrast, float mixAmount)\n{\n  vec3 rgb = img.rgb;\n  float luminance = clamp(dot(rgb, vec3(.333333)), 0.0, 1.0); \n  float gamma = 4.01 - 2.0*luminance;\n  rgb = sign(rgb) * pow(abs(rgb), vec3(1.0/gamma));\n  float grain = grainImage.r - 0.5;\n  float mult = contrast * grain;\n  rgb += (max(luminance, 0.5) * mult * (1.0-luminance));\n  rgb = sign(rgb) * pow(abs(rgb), vec3(gamma));\n  rgb = min(rgb, 12.0);\n  return mix(img, vec4(rgb,img.a), mixAmount);\n}"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_grainBlendAndMixKernel_singleton;
  _grainBlendAndMixKernel_singleton = v0;

  return objc_msgSend((id)_grainBlendAndMixKernel_singleton, "setPerservesAlpha:", 1);
}

void __42__PIPhotoGrainHDR__interpolateGrainKernel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_interpolateGrainKernel_singleton;
  _interpolateGrainKernel_singleton = v1;

}

@end

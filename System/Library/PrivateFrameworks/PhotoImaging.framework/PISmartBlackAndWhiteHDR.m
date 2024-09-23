@implementation PISmartBlackAndWhiteHDR

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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[6];
  _QWORD v40[7];
  _QWORD v41[8];
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  v41[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v40[0] = *MEMORY[0x1E0C9DF08];
  v40[1] = v2;
  v3 = *MEMORY[0x1E0C9DF28];
  v40[2] = *MEMORY[0x1E0C9DF20];
  v40[3] = v3;
  v4 = *MEMORY[0x1E0C9DEF8];
  v40[4] = *MEMORY[0x1E0C9DF30];
  v40[5] = v4;
  v40[6] = *MEMORY[0x1E0C9DEE8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v21;
  v41[1] = CFSTR("inputStrength");
  v6 = *MEMORY[0x1E0C9DE60];
  v34[0] = *MEMORY[0x1E0C9DE50];
  v5 = v34[0];
  v34[1] = v6;
  v39[0] = &unk_1E5051ED8;
  v39[1] = &unk_1E5051ED8;
  v8 = *MEMORY[0x1E0C9DE48];
  v35 = *MEMORY[0x1E0C9DE58];
  v7 = v35;
  v36 = v8;
  v39[2] = &unk_1E5051EE8;
  v39[3] = &unk_1E5051EE8;
  v10 = *MEMORY[0x1E0C9DE68];
  v37 = *MEMORY[0x1E0C9DE10];
  v9 = v37;
  v38 = v10;
  v11 = *MEMORY[0x1E0C9DED0];
  v39[4] = &unk_1E5051EF8;
  v39[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v34, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v20;
  v41[2] = CFSTR("inputNeutralGamma");
  v32[0] = v5;
  v32[1] = v6;
  v33[0] = &unk_1E5051F08;
  v33[1] = &unk_1E5051F08;
  v32[2] = v7;
  v32[3] = v8;
  v33[2] = &unk_1E5051EE8;
  v33[3] = &unk_1E5051EE8;
  v32[4] = v9;
  v32[5] = v10;
  v33[4] = &unk_1E5051ED8;
  v33[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v19;
  v41[3] = CFSTR("inputTone");
  v30[0] = v5;
  v30[1] = v6;
  v31[0] = &unk_1E5051F08;
  v31[1] = &unk_1E5051F08;
  v30[2] = v7;
  v30[3] = v8;
  v31[2] = &unk_1E5051EE8;
  v31[3] = &unk_1E5051EE8;
  v30[4] = v9;
  v30[5] = v10;
  v31[4] = &unk_1E5051ED8;
  v31[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v18;
  v41[4] = CFSTR("inputHue");
  v28[0] = v5;
  v28[1] = v6;
  v29[0] = &unk_1E5051F08;
  v29[1] = &unk_1E5051F08;
  v28[2] = v7;
  v28[3] = v8;
  v29[2] = &unk_1E5051EE8;
  v29[3] = &unk_1E5051EE8;
  v28[4] = v9;
  v28[5] = v10;
  v29[4] = &unk_1E5051ED8;
  v29[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v17;
  v41[5] = CFSTR("inputGrain");
  v26[0] = v5;
  v26[1] = v6;
  v27[0] = &unk_1E5051ED8;
  v27[1] = &unk_1E5051ED8;
  v26[2] = v7;
  v26[3] = v8;
  v27[2] = &unk_1E5051EE8;
  v27[3] = &unk_1E5051EE8;
  v26[4] = v9;
  v26[5] = v10;
  v27[4] = &unk_1E5051ED8;
  v27[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v16;
  v41[6] = CFSTR("inputSeed");
  v24[0] = v5;
  v24[1] = v6;
  v25[0] = &unk_1E5051ED8;
  v25[1] = &unk_1E5051ED8;
  v24[2] = v7;
  v24[3] = v9;
  v25[2] = &unk_1E5051EE8;
  v25[3] = &unk_1E5051ED8;
  v24[4] = v10;
  v25[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v12;
  v41[7] = CFSTR("inputScaleFactor");
  v22[0] = v5;
  v22[1] = v8;
  v23[0] = &unk_1E5051ED8;
  v23[1] = &unk_1E5051EE8;
  v22[2] = v9;
  v22[3] = v10;
  v23[2] = &unk_1E5051EE8;
  v23[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)getNonNormalizedSettings:(id *)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float var2;
  float var1;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  float v18;
  float v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;

  a3->var0 = 1;
  -[NSNumber floatValue](self->inputHue, "floatValue");
  a3->var1 = v5;
  -[NSNumber floatValue](self->inputStrength, "floatValue");
  a3->var2 = v6;
  -[NSNumber floatValue](self->inputNeutralGamma, "floatValue");
  a3->var3 = v7;
  -[NSNumber floatValue](self->inputTone, "floatValue");
  v28 = v8;
  a3->var4 = v8;
  var1 = a3->var1;
  var2 = a3->var2;
  v11 = var2;
  v12 = var2 * cos((float)(0.60167 - var1) * 6.28318531) + 1.0;
  if (v12 <= 1.0)
    v13 = v12 * -2.0 + 3.0;
  else
    v13 = (v12 + -1.0) * -0.550000012 + 1.0;
  v14 = v13;
  v15 = powf(0.3, v14);
  v16 = v11 * cos((float)(0.8663 - var1) * 6.28318531) + 1.0;
  if (v16 <= 1.0)
    v17 = v16 * -2.0 + 3.0;
  else
    v17 = (v16 + -1.0) * -0.550000012 + 1.0;
  v18 = v17;
  v19 = powf(0.6, v18);
  v20 = v11 * cos((float)(0.22284 - var1) * 6.28318531) + 1.0;
  if (v20 <= 1.0)
    v21 = v20 * -2.0 + 3.0;
  else
    v21 = (v20 + -1.0) * -0.550000012 + 1.0;
  v22 = v21;
  v23 = powf(0.1, v22);
  v24 = v23 + (float)(v15 + v19);
  a3->var5[0] = v15 / v24;
  a3->var5[1] = v19 / v24;
  a3->var5[2] = v23 / v24;
  if (a3->var0)
  {
    a3->var0 = 0;
    v25 = (float)(var1 * 0.5) + 0.35;
    if (v25 < 0.0)
      v25 = v25 + 1.0;
    if (var2 <= 0.5)
      v26 = var2 * 0.8;
    else
      v26 = (float)((float)(var2 + -0.5) * 1.2) + 0.4;
    a3->var1 = v25;
    a3->var2 = v26;
    v27 = v28 + v28;
    if (v28 <= 0.0)
      v27 = v28;
    a3->var3 = a3->var3 + 1.0;
    a3->var4 = v27;
  }
}

- (float)createHueArray
{
  float *v2;
  uint64_t v3;
  int32x4_t v4;
  float32x4_t v11;
  float v12;
  float32x4_t v13;
  float v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  int32x4_t v26;
  float v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  _OWORD v31[2];

  memset(v31, 0, sizeof(v31));
  -[PISmartBlackAndWhiteHDR getNonNormalizedSettings:](self, "getNonNormalizedSettings:", v31);
  v2 = (float *)malloc_type_calloc(0x168uLL, 4uLL, 0x100004052888210uLL);
  v3 = 0;
  v4 = (int32x4_t)xmmword_1A64DDED0;
  v24 = (float32x4_t)vdupq_n_s32(0x40C90FDBu);
  v25 = (float32x4_t)vdupq_n_s32(0x43B38000u);
  v22 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)((char *)v31 + 4), 0);
  v23 = (float32x4_t)vdupq_n_s32(0x3EE66666u);
  __asm { FMOV            V0.4S, #1.0 }
  v20 = _Q0;
  v21 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)((char *)v31 + 8), 0);
  __asm { FMOV            V0.4S, #3.0 }
  v19 = _Q0;
  do
  {
    v26 = v4;
    v30 = vmulq_f32(vsubq_f32(vdivq_f32(vcvtq_f32_s32(v4), v25), v22), v24);
    v27 = cosf(v30.f32[1]);
    v11.f32[0] = cosf(v30.f32[0]);
    v11.f32[1] = v27;
    v28 = v11;
    v12 = cosf(v30.f32[2]);
    v13 = v28;
    v13.f32[2] = v12;
    v29 = v13;
    v14 = cosf(v30.f32[3]);
    v15 = v29;
    v15.f32[3] = v14;
    v16 = vmlaq_f32(v20, v15, v21);
    v17 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v23, v16), (int8x16_t)v23, (int8x16_t)v16);
    *(int8x16_t *)&v2[v3] = vbslq_s8((int8x16_t)vcgtq_f32(v17, v19), (int8x16_t)v19, (int8x16_t)v17);
    v17.i64[0] = 0x400000004;
    v17.i64[1] = 0x400000004;
    v4 = vaddq_s32(v26, (int32x4_t)v17);
    v3 += 4;
  }
  while (v3 != 360);
  return v2;
}

- (id)hueArrayImage:(float *)a3
{
  float *v4;
  void *v5;
  float v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v4 = -[PISmartBlackAndWhiteHDR createHueArray](self, "createHueArray");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 368);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *v4;
  for (i = 1; i != 360; ++i)
  {
    if (v6 <= v4[i])
      v6 = v4[i];
  }
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "mutableBytes");
  for (j = 0; j != 360; ++j)
    *(_BYTE *)(v9 + j) = (int)fmaxf(fminf((float)(v4[j] * 255.0) / v6, 255.0), 0.0);
  *a3 = v6;
  free(v4);
  v18[0] = *MEMORY[0x1E0C9E110];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C9E108];
  v18[1] = *MEMORY[0x1E0C9E120];
  v18[2] = v12;
  v19[0] = v11;
  v19[1] = MEMORY[0x1E0C9AAA0];
  v13 = *MEMORY[0x1E0C9E128];
  v19[2] = MEMORY[0x1E0C9AAB0];
  v19[3] = MEMORY[0x1E0C9AAA0];
  v14 = *MEMORY[0x1E0C9E0F8];
  v18[3] = v13;
  v18[4] = v14;
  v19[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithBitmapData:bytesPerRow:size:format:options:", v8, 368, *MEMORY[0x1E0C9DFF0], v15, 360.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)smartBlackWhiteKernel
{
  if (smartBlackWhiteKernel_once != -1)
    dispatch_once(&smartBlackWhiteKernel_once, &__block_literal_global_14661);
  return (id)smartBlackWhiteKernel_singleton;
}

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  NSNumber *inputSeed;
  void *v27;
  uint64_t v28;
  __int128 v30;
  float v31[5];
  float v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  if (self->inputImage && self->inputNeutralGamma && self->inputTone && self->inputStrength && self->inputScaleFactor)
  {
    v32 = 1.0;
    -[PISmartBlackAndWhiteHDR hueArrayImage:](self, "hueArrayImage:", &v32);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v30 = 0u;
      *(_OWORD *)v31 = 0u;
      -[PISmartBlackAndWhiteHDR getNonNormalizedSettings:](self, "getNonNormalizedSettings:", &v30);
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v31[1], v31[2], v31[3], v32);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.997222245, 0.00138888892, *((float *)&v30 + 3), v31[0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PISmartBlackAndWhiteHDR smartBlackWhiteKernel](self, "smartBlackWhiteKernel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIImage extent](self->inputImage, "extent");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v35[0] = v5;
      v35[1] = v3;
      v35[2] = v4;
      v35[3] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applyWithExtent:arguments:", v16, v9, v11, v13, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "imageByPremultiplyingAlpha");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSNumber floatValue](self->inputGrain, "floatValue");
      if (v19 > 0.0)
      {
        v20 = v19;
        -[NSNumber floatValue](self->inputScaleFactor, "floatValue");
        *(float *)&v22 = v21 * 100.0;
        v33[0] = CFSTR("inputISO");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v23;
        v33[1] = CFSTR("inputAmount");
        *(float *)&v24 = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = CFSTR("inputSeed");
        inputSeed = self->inputSeed;
        v34[1] = v25;
        v34[2] = inputSeed;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "imageByApplyingFilter:withInputParameters:", CFSTR("PIPhotoGrainHDR"), v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v28;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->inputImage, a3);
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputNeutralGamma
{
  return self->inputNeutralGamma;
}

- (void)setInputNeutralGamma:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputTone
{
  return self->inputTone;
}

- (void)setInputTone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputHue
{
  return self->inputHue;
}

- (void)setInputHue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputGrain
{
  return self->inputGrain;
}

- (void)setInputGrain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputSeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputScaleFactor, 0);
  objc_storeStrong((id *)&self->inputSeed, 0);
  objc_storeStrong((id *)&self->inputGrain, 0);
  objc_storeStrong((id *)&self->inputHue, 0);
  objc_storeStrong((id *)&self->inputTone, 0);
  objc_storeStrong((id *)&self->inputNeutralGamma, 0);
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

void __48__PISmartBlackAndWhiteHDR_smartBlackWhiteKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smartBlackAndWhiteHDR(__sample imageHDR, sampler2D hueImage, vec4 rgbWeights, vec4 normalizer) { float hueTableScaleFactor = rgbWeights.w; float hueImageWidth = normalizer.x; float huePixelCenter = normalizer.y; float neutralGamma = normalizer.z; float phototone = normalizer.w; float bw = dot(imageHDR.rgb / 12.0, rgbWeights.rgb); bw = clamp(bw, 0.0, 1.0); vec3 lms; lms.x = dot(imageHDR.rgb, vec3(0.3139902162, 0.6395129383, 0.0464975462)); lms.y = dot(imageHDR.rgb, vec3(0.155372406, 0.7578944616, 0.0867014186)); lms.z = dot(imageHDR.rgb, vec3(0.017752387, 0.109442094, 0.8725692246)); lms = pow(lms, vec3(0.43)); float i = dot(lms, vec3(0.4,0.4,0.2)); float p = dot(lms, vec3(4.4550,-4.8510,0.3960)); float t = dot(lms, vec3(0.8056,0.3572,-1.1628)); float chroma = sqrt(p*p+t*t); float hue = 0.5 + (atan(t, p) / 6.28318530718); vec2 huePt = vec2(hue * hueImageWidth + huePixelCenter, 0.5); float hueGamma = hueTableScaleFactor * texture2D(hueImage, huePt).a; float cd = 0.06 + 0.53 * abs(i-0.5); float lowSaturationDamp = smoothstep(0.0, 1.0, (chroma)/cd); float intensityDamp = smoothstep(0.0, 1.0, 1.0 - i); float lowLuminosityDamp = smoothstep(0.0, 1.0, 25.0 * i); float hWeight = lowSaturationDamp * intensityDamp * lowLuminosityDamp; hueGamma -= 1; hueGamma *= hWeight; hueGamma += 1; bw = pow(bw, hueGamma); float bwSDR = clamp(bw * 12.0, 0.0, 1.0); float midLumWeight = bwSDR*(1.0 - bwSDR); float grayWeight = 1.0 - smoothstep(0.0, 1.0, chroma * 10.0); float nWeight = midLumWeight * grayWeight; neutralGamma -= 1; neutralGamma *= nWeight; neutralGamma *= -2; neutralGamma += 1; bw = pow(bw, neutralGamma); bw = bw * 12.0; bw = clamp(bw, 0.0, 12.0); float df0 = 0.812379; float result; if (bw < df0) { result = 1.8031*bw*bw*bw - 2.1972*bw*bw + 1.3823*bw; } else { float scale = 12.0 - df0; float x = (bw - df0) / scale; result = 1.8031*x*x*x - 2.1972*x*x + 1.3823*x; result = result * scale + df0; result -= 0.158305860; } bw = mix(bw, result,-phototone); return vec4(bw,bw,bw,imageHDR.a); }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)smartBlackWhiteKernel_singleton;
  smartBlackWhiteKernel_singleton = v0;

}

@end

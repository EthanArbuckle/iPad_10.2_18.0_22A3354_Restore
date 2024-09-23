@implementation PIRAWFaceBalance

+ (id)faceBalanceKernels
{
  if (faceBalanceKernels_onceToken != -1)
    dispatch_once(&faceBalanceKernels_onceToken, &__block_literal_global_13125);
  return (id)faceBalanceKernels_faceBalanceKernels;
}

+ (CGColorSpace)newLinearWideGamutColorSpace
{
  void *v2;
  CGColorSpace *v3;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &newLinearWideGamutColorSpace_data, 529);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColorSpace *)MEMORY[0x1A85BF1E4]();

  return v3;
}

+ (CGColorSpace)linearWideGamutColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PIRAWFaceBalance_linearWideGamutColorSpace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (linearWideGamutColorSpace_onceToken != -1)
    dispatch_once(&linearWideGamutColorSpace_onceToken, block);
  return (CGColorSpace *)linearWideGamutColorSpace_s_linearWideGamutColorSpaceRef;
}

uint64_t __45__PIRAWFaceBalance_linearWideGamutColorSpace__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "newLinearWideGamutColorSpace");
  linearWideGamutColorSpace_s_linearWideGamutColorSpaceRef = result;
  return result;
}

void __38__PIRAWFaceBalance_faceBalanceKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", CFSTR("kernel vec4 facebalance(__sample src, vec2 gamma, vec3 matchMinusOrigStrength)\n{\nvec4 pix = src;\npix.rgb = pow(max(pix.rgb, 0.0), vec3(gamma.x));\npix.rgb = pix.r * vec3(0.299,  0.595716,  0.211456) +\npix.g * vec3(0.587, -0.274453, -0.522591) +\npix.b * vec3(0.114, -0.321263,  0.311135);\nvec4 orig = pix ;\nfloat chroma = min(1.0, 2.0*sqrt(pix.g*pix.g + pix.b*pix.b));\npix.gb +=  matchMinusOrigStrength.rg;\nfloat strength = matchMinusOrigStrength.z*pow(chroma, .4) ;\npix.gb = mix(orig.gb, pix.gb, strength) ;\npix.rgb = pix.rrr +\npix.g * vec3(0.956296, -0.272122, -1.10699) +\npix.b * vec3(0.621024, -0.647381, 1.70461);\npix.rgb = max(pix.rgb, vec3(0.0));\npix.rgb = pow(pix.rgb, vec3(gamma.y));\nreturn pix;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)faceBalanceKernels_faceBalanceKernels;
  faceBalanceKernels_faceBalanceKernels = v0;

}

- (id)outputImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  -[PIRAWFaceBalance inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIRAWFaceBalance inputWarmth](self, "inputWarmth");
  v5 = v4;
  -[PIRAWFaceBalance inputWarmth](self, "inputWarmth");
  v7 = (1.0 - v6) * 0.005 + v5 * 0.105;
  -[PIRAWFaceBalance inputWarmth](self, "inputWarmth");
  v9 = v8;
  -[PIRAWFaceBalance inputWarmth](self, "inputWarmth");
  v11 = (1.0 - v10) * 0.01 + v9 * -0.01;
  -[PIRAWFaceBalance inputOrigI](self, "inputOrigI");
  v13 = v12;
  -[PIRAWFaceBalance inputOrigQ](self, "inputOrigQ");
  if (vabdd_f64(v7, v13) + vabdd_f64(v11, v14) >= 0.00000001)
  {
    v16 = v7 - v13;
    v17 = v11 - v14;
    v18 = objc_msgSend((id)objc_opt_class(), "linearWideGamutColorSpace");
    objc_msgSend((id)objc_opt_class(), "faceBalanceKernels");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("facebalance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PIRAWFaceBalance inputImage](self, "inputImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageByColorMatchingWorkingSpaceToColorSpace:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "extent");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.25, 4.0, v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v31;
    v32 = (void *)MEMORY[0x1E0C9DDF8];
    -[PIRAWFaceBalance inputStrength](self, "inputStrength");
    objc_msgSend(v32, "vectorWithX:Y:Z:", v16, v17, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "applyWithExtent:arguments:", v35, v24, v26, v28, v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "imageByColorMatchingColorSpaceToWorkingSpace:", v18);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[PIRAWFaceBalance inputImage](self, "inputImage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "extent");
    objc_msgSend(v37, "imageByCroppingToRect:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v39;
  }
  else
  {
    v15 = v3;
  }

  return v15;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (double)inputOrigI
{
  return self->_inputOrigI;
}

- (void)setInputOrigI:(double)a3
{
  self->_inputOrigI = a3;
}

- (double)inputOrigQ
{
  return self->_inputOrigQ;
}

- (void)setInputOrigQ:(double)a3
{
  self->_inputOrigQ = a3;
}

- (double)inputStrength
{
  return self->_inputStrength;
}

- (void)setInputStrength:(double)a3
{
  self->_inputStrength = a3;
}

- (double)inputWarmth
{
  return self->_inputWarmth;
}

- (void)setInputWarmth:(double)a3
{
  self->_inputWarmth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end

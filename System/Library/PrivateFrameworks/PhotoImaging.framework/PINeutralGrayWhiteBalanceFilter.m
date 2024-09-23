@implementation PINeutralGrayWhiteBalanceFilter

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("strength");
  v3 = *MEMORY[0x1E0C9DE60];
  v15[0] = *MEMORY[0x1E0C9DE50];
  v2 = v15[0];
  v15[1] = v3;
  v20[0] = &unk_1E50521A8;
  v20[1] = &unk_1E50521A8;
  v5 = *MEMORY[0x1E0C9DE10];
  v16 = *MEMORY[0x1E0C9DE58];
  v4 = v16;
  v17 = v5;
  v20[2] = &unk_1E50521B8;
  v20[3] = &unk_1E50521C8;
  v7 = *MEMORY[0x1E0C9DE68];
  v18 = *MEMORY[0x1E0C9DE40];
  v6 = v18;
  v19 = v7;
  v8 = *MEMORY[0x1E0C9DED0];
  v20[4] = &unk_1E50521D8;
  v20[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v15, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("warmth");
  v22[0] = v9;
  v13[0] = v2;
  v13[1] = v3;
  v14[0] = &unk_1E50521A8;
  v14[1] = &unk_1E50521A8;
  v13[2] = v4;
  v13[3] = v5;
  v14[2] = &unk_1E50521C8;
  v14[3] = &unk_1E50521E8;
  v13[4] = v6;
  v13[5] = v7;
  v14[4] = &unk_1E50521D8;
  v14[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)colorBalanceKernels
{
  if (colorBalanceKernels_onceToken_19556 != -1)
    dispatch_once(&colorBalanceKernels_onceToken_19556, &__block_literal_global_11_19557);
  return (id)colorBalanceKernels_colorBalanceKernels_19558;
}

+ (id)RGBToYIQKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorBalanceKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("convertFromRGBToYIQ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)YIQToRGBKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorBalanceKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("convertFromYIQToRGB"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)gHDRtoPPKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorBalanceKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("gHDRtoPP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)PPtogHDRKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorBalanceKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PPtogHDR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)whiteBalanceKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorBalanceKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("whiteBalance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__PINeutralGrayWhiteBalanceFilter_colorBalanceKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", CFSTR("kernel vec4 convertFromRGBToYIQ(sampler src, float gamma)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(src, samplerCoord(src));\npix.rgb = sign(pix.rgb)*pow(abs(pix.rgb), vec3(1.0/gamma)) ;\npix2.rgb = pix.r * vec3(0.299,  0.595716,  0.211456) +\npix.g * vec3(0.587, -0.274453, -0.522591) +\npix.b * vec3(0.114, -0.321263,  0.311135);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 convertFromYIQToRGB(sampler src, float gamma)\n{\nvec4 color, pix;\npix = sample(src, samplerCoord(src));\ncolor.rgb = pix.rrr +\npix.g * vec3(0.956296, -0.272122, -1.10699) +\npix.b * vec3(0.621024, -0.647381, 1.70461);\ncolor.rgb = sign(color.rgb)*pow(abs(color.rgb), vec3(gamma, gamma, gamma));\ncolor.a = pix.a;\nreturn color;\n}\nkernel vec4 whiteBalance(sampler image, float grayY, float grayI, float grayQ, float strength)\n{\nvec4 im = sample(image, samplerCoord(image)) ;\nvec2 grayOffset = vec2(grayI, grayQ) ;\nvec4 result ;\nfloat newStrength = 1.0 + (strength-1.0)*(1.0-im.r) ;\nresult.r = im.r ;\nresult.gb = im.gb + newStrength*grayOffset ;\nfloat damp = max(min(1.0, im.r/(grayY+0.00001)),0.0) ;\nresult.rgb = mix(im.rgb, result.rgb, damp) ;\nresult.a = im.a ;\nreturn result ;\n}\nkernel vec4 gHDRtoPP(sampler image)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(0.615429622407401,   0.114831839141528,   0.011544126697221) +\npix.g * vec3(0.367479646665836,   0.797943554457996,   0.064077744191180) +\npix.b * vec3(  0.016956659608091,   0.087783443422360,   0.924405601458102);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 PPtogHDR(sampler image)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(1.777445503202045,  -0.255296595099306,  -0.004500433755654) +\npix.g * vec3( -0.822224875430495,   1.380948853784730,  -0.085456231694984) +\npix.b * vec3(0.045475917061484,  -0.126454737973025,   1.089973874037625);\nreturn vec4(pix2, pix.a);\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)colorBalanceKernels_colorBalanceKernels_19558;
  colorBalanceKernels_colorBalanceKernels_19558 = v0;

}

- (id)applyInputConversion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "gHDRtoPPKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_19626, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:", 4.0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "RGBToYIQKernel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extent");
  objc_msgSend(v10, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_19626, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)applyOutputConversion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:", 4.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "YIQToRGBKernel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  objc_msgSend(v6, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_19626, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "PPtogHDRKernel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extent");
  objc_msgSend(v10, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_19626, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isDefaultWarmth:(double)a3
{
  return fabs(a3 + -0.5) < 0.00001;
}

- (id)outputImage
{
  CIImage *inputImage;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  CIImage *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v35;
  void *v36;
  const void **v37;
  void *specific;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  inputImage = self->_inputImage;
  if (!inputImage)
  {
    NUAssertLogger_19614();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v36;
      _os_log_error_impl(&dword_1A6382000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_19614();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v40)
      {
        v43 = dispatch_get_specific(*v37);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v43;
        v51 = 2114;
        v52 = v47;
        _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v42;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PINeutralGrayWhiteBalanceFilter applyInputConversion:](self, "applyInputConversion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumber floatValue](self->_y, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->_i, "floatValue");
  v10 = v9;
  -[NSNumber floatValue](self->_q, "floatValue");
  v12 = v11;
  -[NSNumber floatValue](self->_warmth, "floatValue");
  v14 = v13;
  v15 = v13;
  if (v10 == 0.0 && v12 == 0.0 && -[PINeutralGrayWhiteBalanceFilter isDefaultWarmth:](self, "isDefaultWarmth:", v13))
  {
    v16 = self->_inputImage;
  }
  else
  {
    v17 = v8;
    v18 = (float)-v10;
    if (v14 >= 0.5)
    {
      v19 = v15 + -0.5 + v15 + -0.5;
      v20 = v18 + v19 * 0.100000001;
      v21 = -0.0399999991;
    }
    else
    {
      v19 = 0.5 - v15 + 0.5 - v15;
      v20 = v18 + v19 * -0.0500000007;
      v21 = 0.0199999996;
    }
    v22 = (float)-v12 + v19 * v21;
    v48[0] = v6;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v23;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v24;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v25;
    v26 = (void *)MEMORY[0x1E0C9DDF8];
    -[NSNumber floatValue](self->_strength, "floatValue");
    objc_msgSend(v26, "vectorWithX:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "whiteBalanceKernel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extent");
    objc_msgSend(v30, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_19626, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[PINeutralGrayWhiteBalanceFilter applyOutputConversion:](self, "applyOutputConversion:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CIImage extent](self->_inputImage, "extent");
    objc_msgSend(v32, "imageByCroppingToRect:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageByPremultiplyingAlpha");
    v16 = (CIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSNumber)strength
{
  return self->_strength;
}

- (void)setStrength:(id)a3
{
  objc_storeStrong((id *)&self->_strength, a3);
}

- (NSNumber)warmth
{
  return self->_warmth;
}

- (void)setWarmth:(id)a3
{
  objc_storeStrong((id *)&self->_warmth, a3);
}

- (NSNumber)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
  objc_storeStrong((id *)&self->_y, a3);
}

- (NSNumber)i
{
  return self->_i;
}

- (void)setI:(id)a3
{
  objc_storeStrong((id *)&self->_i, a3);
}

- (NSNumber)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
  objc_storeStrong((id *)&self->_q, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_i, 0);
  objc_storeStrong((id *)&self->_y, 0);
  objc_storeStrong((id *)&self->_warmth, 0);
  objc_storeStrong((id *)&self->_strength, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end

@implementation PIColorBalanceFilter

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
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[7];
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD v29[4];
  _QWORD v30[6];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("inputStrength");
  v3 = *MEMORY[0x1E0C9DE60];
  v23[0] = *MEMORY[0x1E0C9DE50];
  v2 = v23[0];
  v23[1] = v3;
  v28[0] = &unk_1E5051E08;
  v28[1] = &unk_1E5051E08;
  v5 = *MEMORY[0x1E0C9DE10];
  v24 = *MEMORY[0x1E0C9DE58];
  v4 = v24;
  v25 = v5;
  v28[2] = &unk_1E5051E18;
  v28[3] = &unk_1E5051E28;
  v7 = *MEMORY[0x1E0C9DE68];
  v26 = *MEMORY[0x1E0C9DE40];
  v6 = v26;
  v27 = v7;
  v8 = *MEMORY[0x1E0C9DED0];
  v28[4] = &unk_1E5051E08;
  v28[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v23, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  v29[1] = CFSTR("inputWarmTemp");
  v21[0] = v2;
  v21[1] = v3;
  v22[0] = &unk_1E5051E38;
  v22[1] = &unk_1E5051E48;
  v9 = *MEMORY[0x1E0C9DE48];
  v21[2] = v4;
  v21[3] = v9;
  v22[2] = &unk_1E5051E58;
  v22[3] = &unk_1E5051E18;
  v21[4] = v5;
  v21[5] = v6;
  v22[4] = &unk_1E5051E08;
  v22[5] = &unk_1E5051E08;
  v21[6] = v7;
  v22[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v10;
  v29[2] = CFSTR("inputWarmTint");
  v19[0] = v2;
  v19[1] = v3;
  v20[0] = &unk_1E5051E38;
  v20[1] = &unk_1E5051E68;
  v19[2] = v4;
  v19[3] = v9;
  v20[2] = &unk_1E5051E28;
  v20[3] = &unk_1E5051E18;
  v19[4] = v5;
  v19[5] = v6;
  v20[4] = &unk_1E5051E08;
  v20[5] = &unk_1E5051E08;
  v19[6] = v7;
  v20[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v11;
  v29[3] = CFSTR("inputHasFace");
  v17[0] = v5;
  v17[1] = v7;
  v12 = *MEMORY[0x1E0C9DE78];
  v18[0] = MEMORY[0x1E0C9AAA0];
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)colorBalanceKernels
{
  if (colorBalanceKernels_onceToken != -1)
    dispatch_once(&colorBalanceKernels_onceToken, &__block_literal_global_17_13301);
  return (id)colorBalanceKernels_colorBalanceKernels;
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

+ (id)colorBalanceKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "colorBalanceKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("colorBalance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __43__PIColorBalanceFilter_colorBalanceKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", CFSTR("kernel vec4 gHDRtoPP(sampler image)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(0.615429622407401,   0.114831839141528,   0.011544126697221) +\npix.g * vec3(0.367479646665836,   0.797943554457996,   0.064077744191180) +\npix.b * vec3(  0.016956659608091,   0.087783443422360,   0.924405601458102);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 PPtogHDR(sampler image)\n{\nvec4 pix ;\nvec3 pix2;\npix = sample(image, samplerCoord(image));\npix2 = pix.r * vec3(1.777445503202045,  -0.255296595099306,  -0.004500433755654) +\npix.g * vec3( -0.822224875430495,   1.380948853784730,  -0.085456231694984) +\npix.b * vec3(0.045475917061484,  -0.126454737973025,   1.089973874037625);\nreturn vec4(pix2, pix.a);\n}\nkernel vec4 colorBalance(__sample image, float colorI, float colorQ, float str, vec2 gamma)\n{\nvec4 pix = image;\nvec3 neg = min(pix.rgb, 0.0);\nvec3 pos = max(pix.rgb, 1.0) - 1.0;\npix.rgb = pow(clamp(pix.rgb, 0.0, 1.0), vec3(gamma.x));\npix.rgb = pix.r * vec3(0.299,  0.595716,  0.211456) +\npix.g * vec3(0.587, -0.274453, -0.522591) +\npix.b * vec3(0.114, -0.321263,  0.311135);\nvec4 orig = pix ;\nfloat chroma = min(1.0, 2.0*sqrt(pix.g*pix.g + pix.b*pix.b));\npix.gb += vec2(colorI,colorQ);\nfloat strength = str*pow(chroma, .4) ;\npix.gb = mix(orig.gb, pix.gb, strength) ;\npix.rgb = pix.rrr +\npix.g * vec3(0.956296, -0.272122, -1.10699) +\npix.b * vec3(0.621024, -0.647381, 1.70461);\npix.rgb = pow(max(pix.rgb, 0.0), vec3(gamma.y));\npix.rgb += pos + neg;\nreturn pix;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)colorBalanceKernels_colorBalanceKernels;
  colorBalanceKernels_colorBalanceKernels = v0;

}

- (id)applyInputConversion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "gHDRtoPPKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_13374, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)applyOutputConversion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "PPtogHDRKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_13374, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)outputImage
{
  float v3;
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;
  CIImage *inputImage;
  CIImage *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  NSNumber *inputStrength;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v28;
  void *v29;
  const void **v30;
  void *specific;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!self->_inputImage)
  {
    NUAssertLogger_13360();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputImage cannot be nil"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_13360();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        v44 = 2114;
        v45 = v40;
        _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v35;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NSNumber floatValue](self->_inputWarmTemp, "floatValue");
  v4 = v3 * 0.25;
  -[NSNumber floatValue](self->_inputWarmTint, "floatValue");
  v6 = v5 * 0.25;
  v7 = v6 * 0.0385 + v4 * 0.9615;
  v8 = v6 * 0.1923 + v4 * -0.1923;
  inputImage = self->_inputImage;
  if (fabs(v7) + fabs(v8) >= 0.00000001)
  {
    -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber BOOLValue](self->_inputHasFace, "BOOLValue"))
    {
      if (-[NSNumber BOOLValue](self->_inputIsRaw, "BOOLValue"))
      {
        objc_msgSend(v11, "imageByColorMatchingWorkingSpaceToColorSpace:", +[PIRAWFaceBalance linearWideGamutColorSpace](PIRAWFaceBalance, "linearWideGamutColorSpace"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[PIColorBalanceFilter applyInputConversion:](self, "applyInputConversion:", v11);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)v15;
    }
    v41[0] = v13;
    *(float *)&v14 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v16;
    *(float *)&v17 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    inputStrength = self->_inputStrength;
    v41[2] = v18;
    v41[3] = inputStrength;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.25, 4.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "colorBalanceKernel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extent");
    objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_13374, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSNumber BOOLValue](self->_inputHasFace, "BOOLValue"))
    {
      if (-[NSNumber BOOLValue](self->_inputIsRaw, "BOOLValue"))
      {
        objc_msgSend(v23, "imageByColorMatchingColorSpaceToWorkingSpace:", +[PIRAWFaceBalance linearWideGamutColorSpace](PIRAWFaceBalance, "linearWideGamutColorSpace"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = v23;
      }
    }
    else
    {
      -[PIColorBalanceFilter applyOutputConversion:](self, "applyOutputConversion:", v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    -[CIImage extent](self->_inputImage, "extent");
    objc_msgSend(v25, "imageByCroppingToRect:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageByPremultiplyingAlpha");
    v10 = (CIImage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = inputImage;
  }
  return v10;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSNumber)inputWarmTemp
{
  return self->_inputWarmTemp;
}

- (void)setInputWarmTemp:(id)a3
{
  objc_storeStrong((id *)&self->_inputWarmTemp, a3);
}

- (NSNumber)inputWarmTint
{
  return self->_inputWarmTint;
}

- (void)setInputWarmTint:(id)a3
{
  objc_storeStrong((id *)&self->_inputWarmTint, a3);
}

- (NSNumber)inputStrength
{
  return self->_inputStrength;
}

- (void)setInputStrength:(id)a3
{
  objc_storeStrong((id *)&self->_inputStrength, a3);
}

- (NSNumber)inputHasFace
{
  return self->_inputHasFace;
}

- (void)setInputHasFace:(id)a3
{
  objc_storeStrong((id *)&self->_inputHasFace, a3);
}

- (NSNumber)inputIsRaw
{
  return self->_inputIsRaw;
}

- (void)setInputIsRaw:(id)a3
{
  objc_storeStrong((id *)&self->_inputIsRaw, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputIsRaw, 0);
  objc_storeStrong((id *)&self->_inputHasFace, 0);
  objc_storeStrong((id *)&self->_inputStrength, 0);
  objc_storeStrong((id *)&self->_inputWarmTint, 0);
  objc_storeStrong((id *)&self->_inputWarmTemp, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end

@implementation PIHighKeyHDR

+ (id)customAttributes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v12[0] = *MEMORY[0x1E0C9DF00];
  v12[1] = v2;
  v12[2] = *MEMORY[0x1E0C9DF30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("inputStrength");
  v4 = *MEMORY[0x1E0C9DE48];
  v10[0] = *MEMORY[0x1E0C9DE10];
  v10[1] = v4;
  v11[0] = &unk_1E5051D08;
  v11[1] = &unk_1E5051D18;
  v5 = *MEMORY[0x1E0C9DE68];
  v10[2] = *MEMORY[0x1E0C9DE50];
  v10[3] = v5;
  v14[0] = v3;
  v6 = *MEMORY[0x1E0C9DED0];
  v11[2] = &unk_1E5051D28;
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_highKeyHDR
{
  if (_highKeyHDR_once != -1)
    dispatch_once(&_highKeyHDR_once, &__block_literal_global_8723);
  return (id)_highKeyHDR_singleton;
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSNumber *inputStrength;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (inputImage)
  {
    v4 = inputImage;
    -[PIHighKeyHDR _highKeyHDR](self, "_highKeyHDR");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CIImage extent](self->inputImage, "extent");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    inputStrength = self->inputStrength;
    v18[0] = v4;
    v18[1] = inputStrength;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
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
  objc_storeStrong((id *)&self->inputStrength, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

void __27__PIHighKeyHDR__highKeyHDR__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _highKeyHDR(__sample im, float str) \n { \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0) - 1.0; \n im = clamp(im, 0.0, 1.0); \n vec4 im2 = 1.0-((im-1.0)*(im-1.0)); \n im2 = sqrt(im2); \n float y = dot(im.rgb, vec3(.333333)); \n float y2 = sqrt(1.0-(y-1.0)*(y-1.0)); \n y2 = mix(y2, smoothstep(0.0, 1.0, y2), 0.5); \n vec4 im3 = (y>0) ? im*y2/y : vec4(0.0, 0.0, 0.0, 1.0) ; \n im3 = mix(im3, im2, .7*sqrt(y2)); \n im3 = mix(im, im3, sqrt(y)) ; \n im.rgb = mix(im.rgb, im3.rgb, str) + pos + neg; \n return im; } \n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_highKeyHDR_singleton;
  _highKeyHDR_singleton = v0;

}

@end

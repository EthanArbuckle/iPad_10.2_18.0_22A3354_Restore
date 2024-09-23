@implementation PIDefinitionFilter

+ (id)definitionKernel
{
  if (definitionKernel_onceToken != -1)
    dispatch_once(&definitionKernel_onceToken, &__block_literal_global_5558);
  return (id)definitionKernel_s_definitionKernel;
}

void __38__PIDefinitionFilter_definitionKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("vec4 meaningBlur(vec4 im, vec4 b)\n{\nvec4 result = im;\nfloat thresh = 0.1;\nfloat g1 = max(max(im.r, im.g), im.b);\nfloat g2 = dot(b.rgb, vec3(1.0/3.0));\nfloat diff = max(g2-g1, -1.0);\ndiff = smoothstep(0.1-thresh, 0.1+thresh, diff);\nresult.rgb = mix(im.rgb, b.rgb, diff+0.5);\nreturn result;\n}\nvec4 clarityNew(vec4 s, vec4 b, float intensity)\n{\nfloat sl = (s.r + s.g + s.b);\nfloat bl = (b.r + b.g + b.b);\nfloat dl = sl + (sl - bl) * intensity;\nfloat mult = dl / max(sl, 0.0001);\nmult = 1.571 * (mult - 1.0);\nmult = mult / (1.0 + abs(mult));\nmult += 1.0;\nmult = clamp(mult, 1.0 - 0.5 * abs(intensity), 1.0 + 1.0 * abs(intensity));\ns.rgb = s.rgb * mult;\nreturn s;\n}\nkernel vec4 definition(sampler image, sampler blur, float intensity)\n{\nvec4 imgSample = sample(image, samplerCoord(image));\nvec4 blurSample = sample(blur, samplerCoord(blur));\nvec4 meaning = meaningBlur(imgSample, blurSample);\nvec4 clarity = clarityNew(imgSample, meaning, intensity);\nreturn clarity;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)definitionKernel_s_definitionKernel;
  definitionKernel_s_definitionKernel = v0;

}

- (id)outputImage
{
  void *v3;
  void *v4;
  NSNumber *inputIntensity;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  -[CIImage imageByUnpremultiplyingAlpha](self->_inputImage, "imageByUnpremultiplyingAlpha");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage imageByUnpremultiplyingAlpha](self->_inputBlurImage, "imageByUnpremultiplyingAlpha", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  inputIntensity = self->_inputIntensity;
  v11[1] = v4;
  v11[2] = inputIntensity;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "definitionKernel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage extent](self->_inputImage, "extent");
  objc_msgSend(v7, "applyWithExtent:arguments:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageByPremultiplyingAlpha");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputBlurImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputIntensity
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputIntensity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputIntensity, 0);
  objc_storeStrong((id *)&self->_inputBlurImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end

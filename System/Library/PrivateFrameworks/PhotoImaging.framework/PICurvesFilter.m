@implementation PICurvesFilter

- (id)outputImage
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  -[PICurvesFilter inputImage](self, "inputImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PICurvesFilter inputTableImage](self, "inputTableImage");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, 2.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.998046875, 0.0009765625);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageByUnpremultiplyingAlpha");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PICurvesFilter curvesKernel](PICurvesFilter, "curvesKernel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extent");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v23[0] = v9;
    v23[1] = v5;
    v23[2] = v7;
    v23[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyWithExtent:arguments:", v19, v12, v14, v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "imageByPremultiplyingAlpha");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v21;
    v6 = v3;
  }

  return v6;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputTableImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputTableImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputTableImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

+ (id)curvesKernel
{
  if (+[PICurvesFilter curvesKernel]::onceToken != -1)
    dispatch_once(&+[PICurvesFilter curvesKernel]::onceToken, &__block_literal_global_13282);
  return (id)+[PICurvesFilter curvesKernel]::curvesKernel;
}

void __30__PICurvesFilter_curvesKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("vec4 curve_sample(float x, sampler2D table, vec2 domain, vec2 normalizer)\n{\nx = (x - domain.x) / (domain.y - domain.x);\nx = clamp(x, 0.0001, 0.9999);\nx = normalizer.x * x + normalizer.y;\nreturn texture2D(table, vec2(x, 0.5));\n}\nkernel vec4 curves_rgb_lum(__sample color, sampler2D table, vec2 domain, vec2 normalizer)\n{\nvec4 pixel = color;\npixel.r = curve_sample(pixel.r, table, domain, normalizer).r;\npixel.g = curve_sample(pixel.g, table, domain, normalizer).g;\npixel.b = curve_sample(pixel.b, table, domain, normalizer).b;\nfloat lum0 = dot(pixel.rgb, vec3(0.3, 0.59, 0.11));\nfloat lum1 = curve_sample(lum0, table, domain, normalizer).a;\nfloat lum1c = clamp(lum1, -8.0 * abs(lum0), 8.0 * abs(lum0));\nfloat lum_scale = (lum0 == 0.0 ? 0.0 : lum1c / lum0);\nfloat lum_offset = lum1 - lum1c;\npixel.rgb = lum_scale * pixel.rgb + lum_offset;\nreturn pixel;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[PICurvesFilter curvesKernel]::curvesKernel;
  +[PICurvesFilter curvesKernel]::curvesKernel = v0;

}

@end

@implementation PICurvesFilterHDR

- (id)curvesKernel
{
  if (curvesKernel_once != -1)
    dispatch_once(&curvesKernel_once, &__block_literal_global_10673);
  return (id)curvesKernel_singleton;
}

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
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  -[PICurvesFilterHDR inputImage](self, "inputImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PICurvesFilterHDR inputTableImage](self, "inputTableImage");
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

    objc_msgSend(MEMORY[0x1E0D52068], "itur2100HLGColorSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v10, "CGColorSpace"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PICurvesFilterHDR curvesKernel](self, "curvesKernel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extent");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v27[0] = v11;
    v27[1] = v5;
    v27[2] = v7;
    v27[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applyWithExtent:arguments:", v21, v14, v16, v18, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D52068], "itur2100HLGColorSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v23, "CGColorSpace"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "imageByPremultiplyingAlpha");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v25;
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

void __33__PICurvesFilterHDR_curvesKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("vec4 _curve_sample_HDR(float x, sampler2D table, vec2 domain, vec2 normalizer) { x = (x - domain.x) / (domain.y - domain.x); x = clamp(x, 0.0001, 0.9999); x = normalizer.x * x + normalizer.y; return texture2D(table, vec2(x, 0.5)); } kernel vec4 _curves_rgb_lum_HDR(__sample color, sampler2D table, vec2 domain, vec2 normalizer) { vec4 pixel = color; pixel.r = _curve_sample_HDR(pixel.r, table, domain, normalizer).r; pixel.g = _curve_sample_HDR(pixel.g, table, domain, normalizer).g; pixel.b = _curve_sample_HDR(pixel.b, table, domain, normalizer).b; float lum0 = dot(pixel.rgb, vec3(0.3, 0.59, 0.11)); float lum1 = _curve_sample_HDR(lum0, table, domain, normalizer).a; float lum1c = clamp(lum1, -8.0 * abs(lum0), 8.0 * abs(lum0)); float lum_scale = (lum0 == 0.0 ? 0.0 : lum1c / lum0); float lum_offset = lum1 - lum1c; pixel.rgb = lum_scale * pixel.rgb + lum_offset; pixel.rgb = min(pixel.rgb, 1.0); return pixel; }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)curvesKernel_singleton;
  curvesKernel_singleton = v0;

}

@end

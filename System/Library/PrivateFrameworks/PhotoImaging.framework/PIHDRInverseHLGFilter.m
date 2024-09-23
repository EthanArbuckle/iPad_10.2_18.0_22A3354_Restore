@implementation PIHDRInverseHLGFilter

+ (id)inverseHLGLumaBlendingKernel
{
  if (inverseHLGLumaBlendingKernel_once != -1)
    dispatch_once(&inverseHLGLumaBlendingKernel_once, &__block_literal_global_21673);
  return (id)inverseHLGLumaBlendingKernel_s_inverseLumaBlendingKernel;
}

void __53__PIHDRInverseHLGFilter_inverseHLGLumaBlendingKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 hlg_luma_blending_inv(__sample sdr, float scale) \n{ \n  const vec3 lum_weights = vec3(0.2627, 0.6780, 0.0593); \n  float Ys = dot(lum_weights, sdr.rgb); \n  float Ymax = max(sdr.r, max(sdr.g, sdr.b)); \n  float Yb = 0.5*(Ys+Ymax); \n  const float gamma1 = 0.845906630893; \n  float absY = max(abs(Yb), 0.00001); \n  float gainInv = scale * pow(absY, 1.0/gamma1 - 1.0); \n  float3 hdr = gainInv * sdr.rgb; \n  return vec4(hdr.rgb, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)inverseHLGLumaBlendingKernel_s_inverseLumaBlendingKernel;
  inverseHLGLumaBlendingKernel_s_inverseLumaBlendingKernel = v0;

}

- (id)outputImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[PIHDRInverseHLGFilter inputImage](self, "inputImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52068], "colorSpaceFromColorPrimaries:transferFunction:yccMatrix:", *MEMORY[0x1E0CA8D80], *MEMORY[0x1E0CA8EB8], *MEMORY[0x1E0CA8F00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v3, "CGColorSpace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inverseHLGLumaBlendingKernel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v19[0] = v4;
  LODWORD(v6) = 2.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyWithExtent:arguments:", v15, v7, v9, v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v3, "CGColorSpace"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end

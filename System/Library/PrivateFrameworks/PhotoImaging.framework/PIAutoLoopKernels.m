@implementation PIAutoLoopKernels

+ (id)alphaCompositingKernel
{
  if (alphaCompositingKernel_onceToken != -1)
    dispatch_once(&alphaCompositingKernel_onceToken, &__block_literal_global_9690);
  return (id)alphaCompositingKernel_kernel;
}

+ (id)dynamismMapKernel
{
  if (dynamismMapKernel_onceToken != -1)
    dispatch_once(&dynamismMapKernel_onceToken, &__block_literal_global_6_9687);
  return (id)dynamismMapKernel_kernel;
}

+ (id)longExposureFusionKernels
{
  if (longExposureFusionKernels_onceToken != -1)
    dispatch_once(&longExposureFusionKernels_onceToken, &__block_literal_global_8);
  return (id)longExposureFusionKernels_kernels;
}

+ (id)dynamismMapRefineKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("jointbilateralfilter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)rgbToLumaKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rgba_to_luma"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)homographyKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("warp_homography"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nccKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ncc_compute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nccCoarseKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ncc_coarse_compute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)blur7x7Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blur_image_compute_7x7"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)blur5x5Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blur_image_compute_5x5"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)blur3x3Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blur_image_compute_3x3"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fusionKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "longExposureFusionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fuse_image_compute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __46__PIAutoLoopKernels_longExposureFusionKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", &cfstr_KernelVec4Join);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)longExposureFusionKernels_kernels;
  longExposureFusionKernels_kernels = v0;

}

void __38__PIAutoLoopKernels_dynamismMapKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelWithString:", CFSTR("kernel vec4 dynamismMap(sampler imageMax, sampler imageMin, float logisticGain, float logisticMid) __attribute__((outputFormat(kCIFormatRGBAh)))\n{\nconst float MAX_VAL = 1.74;\nconst float THRESHOLD = 0.05;\nvec2 dc = destCoord();\nvec2 sc;\nsc = dc + vec2(-1,-1);\nvec4 pMax00 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin00 = sample(imageMin, samplerTransform(imageMin, sc));\nsc = dc + vec2(-1,0);\nvec4 pMax01 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin01 = sample(imageMin, samplerTransform(imageMin, sc));\nsc = dc + vec2(-1,1);\nvec4 pMax02 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin02 = sample(imageMin, samplerTransform(imageMin, sc));\nsc = dc + vec2(0,-1);\nvec4 pMax10 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin10 = sample(imageMin, samplerTransform(imageMin, sc));\nvec4 pMax11 = sample(imageMax, samplerTransform(imageMax, dc));\nvec4 pMin11 = sample(imageMin, samplerTransform(imageMin, dc));\nsc = dc + vec2(0,1);\nvec4 pMax12 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin12 = sample(imageMin, samplerTransform(imageMin, sc));\nsc = dc + vec2(1,-1);\nvec4 pMax20 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin20 = sample(imageMin, samplerTransform(imageMin, sc));\nsc = dc + vec2(1,0);\nvec4 pMax21 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin21 = sample(imageMin, samplerTransform(imageMin, sc));\nsc = dc + vec2(1,1);\nvec4 pMax22 = sample(imageMax, samplerTransform(imageMax, sc));\nvec4 pMin22 = sample(imageMin, samplerTransform(imageMin, sc));\nfloat minDevCMaxNMin = distance(pMax11, pMin00);\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin01));\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin02));\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin10));\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin11));\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin12));\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin20));\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin21));\nminDevCMaxNMin = min( minDevCMaxNMin , distance(pMax11, pMin22));\nfloat minDevCMinNMax = distance(pMin11, pMax00);\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax01));\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax02));\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax10));\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax11));\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax12));\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax20));\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax21));\nminDevCMinNMax = min( minDevCMinNMax , distance(pMin11, pMax22));\nfloat outVal = min(minDevCMaxNMin , minDevCMinNMax) / MAX_VAL;\noutVal = 1.0f / (1.0f + exp(-logisticGain*(outVal - logisticMid)));\nvec4 outPixel = vec4(outVal, outVal, outVal, 1.0);\nreturn outPixel;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dynamismMapKernel_kernel;
  dynamismMapKernel_kernel = v0;

}

void __43__PIAutoLoopKernels_alphaCompositingKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 alphaCompositing(__sample src, __sample dst, float a)\n{\nreturn mix(dst, src, a);\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)alphaCompositingKernel_kernel;
  alphaCompositingKernel_kernel = v0;

}

@end

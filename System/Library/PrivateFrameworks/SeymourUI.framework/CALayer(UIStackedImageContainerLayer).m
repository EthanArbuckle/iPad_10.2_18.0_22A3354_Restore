@implementation CALayer(UIStackedImageContainerLayer)

+ (double)smu_scaledSizeForSize:()UIStackedImageContainerLayer selectionStyle:
{
  void *v8;
  double v9;
  double v10;
  double v11;

  v8 = (void *)objc_msgSend(MEMORY[0x24BEBDD38], "newStandardConfiguration");
  objc_msgSend(v8, "scaleSizeIncrease");
  objc_msgSend((id)objc_opt_class(), "smu_scaledSizeForSize:focusSizeIncrease:selectionStyle:", a5, a1, a2, v9);
  v11 = v10;

  return v11;
}

+ (uint64_t)smu_scaledSizeForSize:()UIStackedImageContainerLayer focusSizeIncrease:selectionStyle:
{
  return objc_msgSend(MEMORY[0x24BEBDD40], "_scaledSizeForSize:focusSizeIncrease:selectionStyle:");
}

@end

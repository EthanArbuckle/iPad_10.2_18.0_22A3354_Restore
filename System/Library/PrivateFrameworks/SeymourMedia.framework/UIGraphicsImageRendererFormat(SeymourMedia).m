@implementation UIGraphicsImageRendererFormat(SeymourMedia)

+ (uint64_t)smu_canDecodeOnRenderThread
{
  return 1;
}

+ (id)smu_preferredRendererFormat
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BEBD620];
  objc_msgSend(v0, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formatForTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)smu_formatForImage:()SeymourMedia
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "smu_preferredRendererFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "smu_supportsDeepColor");

  if (v7)
  {
    objc_msgSend(v3, "imageRendererFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "scale");
    objc_msgSend(v8, "setScale:");
    v4 = v8;
  }

  return v4;
}

@end

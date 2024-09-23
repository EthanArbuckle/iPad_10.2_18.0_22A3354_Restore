@implementation UIFontDescriptor(TFCoreAdditions)

+ (id)tf_systemFontWithTextStyle:()TFCoreAdditions weight:forTraitCollection:
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

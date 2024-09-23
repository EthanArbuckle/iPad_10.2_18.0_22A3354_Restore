@implementation UIImage(TipsUI)

+ (id)tipsAppHomeScreenIcon
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEB7D20], "clientBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  objc_msgSend(v0, "_applicationIconImageForBundleIdentifier:format:scale:", v1, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

@implementation UIFont(WiFiKitUI)

+ (id)preferredFontForStyle:()WiFiKitUI weight:
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BEBB620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

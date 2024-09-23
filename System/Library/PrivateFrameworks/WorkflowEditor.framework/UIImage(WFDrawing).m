@implementation UIImage(WFDrawing)

+ (id)wf_disclosureImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  CGSize v12;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorWithSymbolicTraits:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v1, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("chevron.forward"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;
  v12.width = 11.0;
  v12.height = 14.5;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v8);

  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, 11.0, 14.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

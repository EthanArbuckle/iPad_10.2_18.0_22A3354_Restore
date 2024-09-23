@implementation UIImage(DBSAdditions)

+ (id)dbs_minSliderImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 22.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "configurationWithFont:scale:", v1, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("sun.min.fill"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.560000002, 0.560000002, 0.579999983, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:renderingMode:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dbs_maxSliderImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 22.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "configurationWithFont:scale:", v1, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("sun.max.fill"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.560000002, 0.560000002, 0.579999983, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:renderingMode:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

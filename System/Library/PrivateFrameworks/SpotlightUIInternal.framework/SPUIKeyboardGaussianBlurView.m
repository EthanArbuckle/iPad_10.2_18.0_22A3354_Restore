@implementation SPUIKeyboardGaussianBlurView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SPUIKeyboardGaussianBlurView)init
{
  SPUIKeyboardGaussianBlurView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)SPUIKeyboardGaussianBlurView;
  v2 = -[SPUIKeyboardGaussianBlurView init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", CFSTR("blur"));
    objc_msgSend(v3, "setValue:forKey:", &unk_24F9E07F8, *MEMORY[0x24BDE5B18]);
    objc_msgSend(v3, "setValue:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE5B00]);
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIKeyboardGaussianBlurView layer](v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v4);

    -[SPUIKeyboardGaussianBlurView layer](v2, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScale:", 0.125);

  }
  return v2;
}

@end

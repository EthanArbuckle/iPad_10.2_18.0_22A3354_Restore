@implementation PRXFeatureIcon

- (PRXFeatureIcon)initWithSystemImageNamed:(id)a3
{
  id v3;
  PRXFeatureIcon *v4;
  uint64_t v5;
  NSString *symbolName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRXFeatureIcon;
  v3 = a3;
  v4 = -[PRXFeatureIcon init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  symbolName = v4->_symbolName;
  v4->_symbolName = (NSString *)v5;

  return v4;
}

- (PRXFeatureIcon)initWithImage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PRXFeatureIcon *v7;

  v4 = (objc_class *)MEMORY[0x24BDF6AE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithImage:", v5);

  v7 = -[PRXFeatureIcon initWithImageView:](self, "initWithImageView:", v6);
  return v7;
}

- (PRXFeatureIcon)initWithImageView:(id)a3
{
  UIView *v4;
  PRXFeatureIcon *v5;
  UIView *imageView;
  objc_super v8;

  v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PRXFeatureIcon;
  v5 = -[PRXFeatureIcon init](&v8, sel_init);
  imageView = v5->_imageView;
  v5->_imageView = v4;

  return v5;
}

- (void)setPlatterColor:(id)a3
{
  objc_storeStrong((id *)&self->_platterColor, a3);
  if (a3)
  {
    -[PRXFeatureIcon setPlatterCornerRadius:](self, "setPlatterCornerRadius:", 9.0);
    -[PRXFeatureIcon setPlatterSize:](self, "setPlatterSize:", 40.0);
  }
}

- (id)makeImageView
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  -[PRXFeatureIcon imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PRXFeatureIcon imageView](self, "imageView");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", *MEMORY[0x24BDF7850]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDF6AC8];
    -[PRXFeatureIcon symbolName](self, "symbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemImageNamed:withConfiguration:", v6, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v19);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    objc_msgSend(v7, "setContentMode:", 4);
    objc_msgSend(v7, "setMaximumContentSizeCategory:", *MEMORY[0x24BDF76A0]);
    v9 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v9, "_setLayoutDebuggingIdentifier:", CFSTR("PRXFeaturePlatter"));
    -[PRXFeatureIcon platterColor](self, "platterColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    -[PRXFeatureIcon platterCornerRadius](self, "platterCornerRadius");
    objc_msgSend(v9, "_setContinuousCornerRadius:");
    objc_msgSend(v9, "addSubview:", v7);
    v11 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v9, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    objc_msgSend(v9, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v18);

    return v9;
  }
}

- (double)platterCornerRadius
{
  return self->_platterCornerRadius;
}

- (void)setPlatterCornerRadius:(double)a3
{
  self->_platterCornerRadius = a3;
}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (double)platterSize
{
  return self->_platterSize;
}

- (void)setPlatterSize:(double)a3
{
  self->_platterSize = a3;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
}

@end

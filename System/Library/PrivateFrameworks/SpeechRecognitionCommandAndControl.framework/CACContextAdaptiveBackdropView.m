@implementation CACContextAdaptiveBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CACContextAdaptiveBackdropView)initWithFrame:(CGRect)a3
{
  CACContextAdaptiveBackdropView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)CACContextAdaptiveBackdropView;
  v3 = -[CACContextAdaptiveBackdropView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", &unk_24F2CEC08, CFSTR("inputRadius"));
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B80]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACContextAdaptiveBackdropView traitCollection](v3, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("luminance"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v5, "setValue:forKey:", objc_msgSend(v10, "CGImage"), CFSTR("inputColorMap"));
    objc_msgSend(v5, "setValue:forKey:", &unk_24F2CEC18, CFSTR("inputAmount"));
    v25[0] = v4;
    v25[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACContextAdaptiveBackdropView layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v11);

    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACContextAdaptiveBackdropView layer](v3, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setGroupName:", v14);

    v16 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[CACContextAdaptiveBackdropView bounds](v3, "bounds");
    v17 = (void *)objc_msgSend(v16, "initWithFrame:");
    -[CACContextAdaptiveBackdropView setTintView:](v3, "setTintView:", v17);

    -[CACContextAdaptiveBackdropView tintView](v3, "tintView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.941176471, 0.77);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACContextAdaptiveBackdropView tintView](v3, "tintView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    -[CACContextAdaptiveBackdropView tintView](v3, "tintView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CACContextAdaptiveBackdropView tintView](v3, "tintView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACContextAdaptiveBackdropView addSubview:](v3, "addSubview:", v22);

  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CACContextAdaptiveBackdropView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", a3);

  -[CACContextAdaptiveBackdropView tintView](self, "tintView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", a3);

}

- (UIView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
  objc_storeStrong((id *)&self->_tintView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintView, 0);
}

@end

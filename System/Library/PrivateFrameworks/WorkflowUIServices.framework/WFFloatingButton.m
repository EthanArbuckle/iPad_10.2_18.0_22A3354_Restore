@implementation WFFloatingButton

- (WFFloatingButton)initWithConfiguration:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  WFFloatingButton *v10;
  WFFloatingButton *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WFFloatingButton *v17;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFFloatingButton;
  v10 = -[WFFloatingButton initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[WFFloatingButton setAdjustsImageWhenHighlighted:](v10, "setAdjustsImageWhenHighlighted:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFloatingButton setTintColor:](v11, "setTintColor:", v12);

    -[WFFloatingButton setContentEdgeInsets:](v11, "setContentEdgeInsets:", 0.0, 20.0, 0.0, 20.0);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFloatingButton titleLabel](v11, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v13);

    -[WFFloatingButton applyConfiguration:](v11, "applyConfiguration:", v9);
    -[WFFloatingButton layer](v11, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFloatingButton traitCollection](v11, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTraitCollection:", v16);

    v17 = v11;
  }

  return v11;
}

- (WFFloatingButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  WFFloatingButton *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_new();
  v9 = -[WFFloatingButton initWithConfiguration:frame:](self, "initWithConfiguration:frame:", v8, x, y, width, height);

  return v9;
}

- (WFFloatingButton)initWithConfiguration:(id)a3
{
  return -[WFFloatingButton initWithConfiguration:frame:](self, "initWithConfiguration:frame:", a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFFloatingButton;
  -[WFFloatingButton setHighlighted:](&v6, sel_setHighlighted_);
  -[WFFloatingButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPressed:", v3);

}

- (WFGradient)gradient
{
  void *v2;
  void *v3;

  -[WFFloatingButton layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFGradient *)v3;
}

- (void)setGradient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFFloatingButton layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGradient:", v4);

}

- (void)applyConfiguration:(id)a3
{
  double v4;
  double v5;
  int v6;
  int v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "titleFontSize");
  v5 = v4;
  v6 = objc_msgSend(v15, "boldTitle");
  if (v5 != 0.0 || v6 != 0)
  {
    v8 = v6;
    if (v5 == 0.0)
    {
      -[WFFloatingButton titleLabel](self, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pointSize");
      v5 = v11;

    }
    if (v8)
      objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", v5);
    else
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFloatingButton titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v12);

  }
  -[WFFloatingButton layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applyConfiguration:", v15);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)WFFloatingButton;
  -[WFFloatingButton intrinsicContentSize](&v4, sel_intrinsicContentSize);
  if (v3 < 36.0)
    v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFFloatingButton;
  -[WFFloatingButton traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[WFFloatingButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFloatingButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTraitCollection:", v5);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end

@implementation WFFloatingView

- (WFFloatingView)initWithConfiguration:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  WFFloatingView *v10;
  WFFloatingView *v11;
  void *v12;
  void *v13;
  WFFloatingView *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFFloatingView;
  v10 = -[WFFloatingView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[WFFloatingView applyConfiguration:](v10, "applyConfiguration:", v9);
    -[WFFloatingView layer](v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFloatingView traitCollection](v11, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTraitCollection:", v13);

    v14 = v11;
  }

  return v11;
}

- (WFFloatingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  WFFloatingView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_new();
  v9 = -[WFFloatingView initWithConfiguration:frame:](self, "initWithConfiguration:frame:", v8, x, y, width, height);

  return v9;
}

- (WFFloatingView)initWithConfiguration:(id)a3
{
  return -[WFFloatingView initWithConfiguration:frame:](self, "initWithConfiguration:frame:", a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (WFGradient)gradient
{
  void *v2;
  void *v3;

  -[WFFloatingView layer](self, "layer");
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
  -[WFFloatingView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGradient:", v4);

}

- (BOOL)isPressed
{
  void *v2;
  char v3;

  -[WFFloatingView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPressed");

  return v3;
}

- (void)setPressed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFFloatingView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPressed:", v3);

}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[WFFloatingView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPressed:animated:", v5, v4);

}

- (void)applyConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFFloatingView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyConfiguration:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFFloatingView;
  -[WFFloatingView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[WFFloatingView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFloatingView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTraitCollection:", v5);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end

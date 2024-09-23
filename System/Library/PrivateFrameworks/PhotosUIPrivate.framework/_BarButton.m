@implementation _BarButton

- (_BarButton)initWithTitle:(id)a3 titleColor:(id)a4 backgroundColor:(id)a5 target:(id)a6 action:(SEL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _BarButton *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_BarButton;
  v16 = -[_BarButton initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v12, 0);
    objc_msgSend(v17, "addTarget:action:forControlEvents:", v15, a7, 64);
    objc_msgSend(v17, "setTitleColor:forState:", v13, 0);
    PXFontWithTextStyleAndWeight();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    objc_msgSend(v17, "sizeToFit");
    objc_msgSend(v17, "setAutoresizingMask:", 18);
    objc_msgSend(v17, "frame");
    PXRectWithOriginAndSize();
    -[_BarButton setFrame:](v16, "setFrame:");
    -[_BarButton setBackgroundColor:](v16, "setBackgroundColor:", v14);
    v20 = *MEMORY[0x1E0CD2A68];
    -[_BarButton layer](v16, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerCurve:", v20);

    -[_BarButton addSubview:](v16, "addSubview:", v17);
    -[_BarButton bounds](v16, "bounds");
    PXRectGetCenter();
    objc_msgSend(v17, "frame");
    PXRectWithCenterAndSize();
    objc_msgSend(v17, "setFrame:");

  }
  return v16;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BarButton;
  -[_BarButton layoutSubviews](&v6, sel_layoutSubviews);
  -[_BarButton frame](self, "frame");
  v4 = v3 * 0.5;
  -[_BarButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

@end

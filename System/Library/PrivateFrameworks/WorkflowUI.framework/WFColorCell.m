@implementation WFColorCell

- (WFColorCell)initWithFrame:(CGRect)a3
{
  WFColorCell *v3;
  WFColorCell *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  WFFloatingView *floatingView;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WFColorCell *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  WFColorCell *v45;
  objc_super v46;
  _QWORD v47[10];

  v47[8] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)WFColorCell;
  v3 = -[WFColorCell initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFColorCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BEC54A0]);
    objc_msgSend(MEMORY[0x24BEC54A8], "paletteColorConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithConfiguration:", v7);

    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v45 = v4;
    floatingView = v4->_floatingView;
    v45->_floatingView = (WFFloatingView *)v8;
    v10 = v8;

    objc_msgSend(v5, "addSubview:", v10);
    v11 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v11, "setHidden:", 1);
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", 1.0);

    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    objc_msgSend(v11, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderColor:", v14);

    objc_msgSend(v10, "addSubview:", v11);
    objc_storeWeak((id *)&v45->_selectedRingView, v11);
    v32 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v10, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v42;
    objc_msgSend(v10, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v38;
    objc_msgSend(v10, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v5;
    objc_msgSend(v5, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v35;
    objc_msgSend(v10, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v31;
    objc_msgSend(v11, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 2.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v28;
    objc_msgSend(v11, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v16;
    objc_msgSend(v11, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -2.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[6] = v19;
    objc_msgSend(v11, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -2.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[7] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v23);

    v4 = v45;
    v24 = v45;

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFColorCell;
  -[WFColorCell layoutSubviews](&v9, sel_layoutSubviews);
  -[WFColorCell frame](self, "frame");
  v4 = (v3 + -4.0) * 0.5;
  -[WFColorCell selectedRingView](self, "selectedRingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v4);

  -[WFColorCell selectedRingView](self, "selectedRingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

}

- (WFGradient)gradient
{
  void *v2;
  void *v3;

  -[WFColorCell floatingView](self, "floatingView");
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
  -[WFColorCell floatingView](self, "floatingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGradient:", v4);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFColorCell;
  -[WFColorCell setSelected:](&v6, sel_setSelected_);
  -[WFColorCell selectedRingView](self, "selectedRingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v3);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFColorCell;
  -[WFColorCell setHighlighted:](&v6, sel_setHighlighted_);
  -[WFColorCell floatingView](self, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPressed:", v3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BEBDF00];
  v3 = -[WFColorCell isSelected](self, "isSelected");
  v4 = *MEMORY[0x24BEBDF30];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void)setColorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (WFFloatingView)floatingView
{
  return self->_floatingView;
}

- (UIView)selectedRingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_selectedRingView);
}

- (void)setSelectedRingView:(id)a3
{
  objc_storeWeak((id *)&self->_selectedRingView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedRingView);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

@end

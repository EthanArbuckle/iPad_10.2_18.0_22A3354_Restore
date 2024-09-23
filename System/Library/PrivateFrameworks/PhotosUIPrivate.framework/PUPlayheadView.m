@implementation PUPlayheadView

- (PUPlayheadView)initWithFrame:(CGRect)a3
{
  PUPlayheadView *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *line;
  void *v12;
  uint64_t v13;
  UIView *outline;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PUPlayheadView;
  v3 = -[PUPlayheadView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    line = v3->_line;
    v3->_line = (UIView *)v10;

    -[UIView layer](v3->_line, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 1.0);

    -[PUPlayheadView addSubview:](v3, "addSubview:", v3->_line);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    outline = v3->_outline;
    v3->_outline = (UIView *)v13;

    -[UIView layer](v3->_outline, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_outline, "setBackgroundColor:", v16);

    objc_msgSend(v4, "playheadOutlineColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[UIView layer](v3->_outline, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderColor:", v18);

    -[UIView layer](v3->_outline, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", 2.0);

    -[PUPlayheadView addSubview:](v3, "addSubview:", v3->_outline);
    -[PUPlayheadView _updateLineColor](v3, "_updateLineColor");
    objc_msgSend(v4, "playheadBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPlayheadView setBackgroundColor:](v3, "setBackgroundColor:", v21);

    -[PUPlayheadView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPlayheadView;
  -[PUPlayheadView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PUPlayheadView _updateLineColor](self, "_updateLineColor");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double MinY;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v24.receiver = self;
  v24.super_class = (Class)PUPlayheadView;
  -[PUPlayheadView layoutSubviews](&v24, sel_layoutSubviews);
  -[PUPlayheadView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUPlayheadView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v14 = (CGRectGetWidth(v25) + -2.0) * 0.5;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v15 = CGRectGetMinY(v26) + 1.0;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v16 = round(v13 * (v15 + CGRectGetHeight(v27) + -2.0)) / v13;
  v17 = round(v13 * v14) / v13;
  v18 = round(v13 * v15) / v13;
  -[UIView setFrame:](self->_line, "setFrame:", v17, v18, round(v13 * (v14 + 2.0)) / v13 - v17, v16 - v18);
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v19 = (CGRectGetWidth(v28) + -4.0) * 0.5;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  MinY = CGRectGetMinY(v29);
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v21 = round(v13 * (MinY + CGRectGetHeight(v30))) / v13;
  v22 = round(v13 * v19) / v13;
  v23 = round(v13 * MinY) / v13;
  -[UIView setFrame:](self->_outline, "setFrame:", v22, v23, round(v13 * (v19 + 4.0)) / v13 - v22, v21 - v23);
  -[PUPlayheadView _updateLineColor](self, "_updateLineColor");
}

- (void)setPreferredHighlightColor:(id)a3
{
  UIColor *v5;
  char v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = self->_preferredHighlightColor;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIColor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredHighlightColor, a3);
      -[PUPlayheadView _updateLineColor](self, "_updateLineColor");
    }
  }

}

- (void)_updateLineColor
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  -[PUPlayheadView preferredHighlightColor](self, "preferredHighlightColor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playheadColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v3 = (uint64_t)v5;
    if (!v5)
    {
      -[PUPlayheadView tintColor](self, "tintColor");
      v3 = objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = (id)v3;
  -[UIView setBackgroundColor:](self->_line, "setBackgroundColor:", v3);

}

- (UIColor)preferredHighlightColor
{
  return self->_preferredHighlightColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredHighlightColor, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

@end

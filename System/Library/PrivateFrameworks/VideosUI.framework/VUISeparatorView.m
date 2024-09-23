@implementation VUISeparatorView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat width;
  double lineHeight;
  double v7;
  CGSize result;

  width = a3.width;
  if (!a4)
  {
    -[VUISeparatorView bounds](self, "bounds", a3.width, a3.height);
    -[UIView setFrame:](self->_line, "setFrame:", 0.0, 0.0);
  }
  lineHeight = self->_lineHeight;
  v7 = width;
  result.height = lineHeight;
  result.width = v7;
  return result;
}

- (void)initializeVUISeparatorView
{
  void *v3;
  double v4;
  UIView *v5;
  UIView *line;
  UIColor *v7;
  UIColor *color;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "vui_main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_nativeScale");
  self->_lineHeight = 1.0 / v4;

  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  line = self->_line;
  self->_line = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_separatorColor");
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  color = self->_color;
  self->_color = v7;

  -[VUISeparatorView _updateLineColor](self, "_updateLineColor");
  -[VUISeparatorView addSubview:](self, "addSubview:", self->_line);
}

- (VUISeparatorView)initWithFrame:(CGRect)a3
{
  VUISeparatorView *v3;
  VUISeparatorView *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VUISeparatorView;
  v3 = -[VUISeparatorView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VUISeparatorView initializeVUISeparatorView](v3, "initializeVUISeparatorView");
    objc_initWeak(&location, v4);
    v11[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__VUISeparatorView_initWithFrame___block_invoke;
    v7[3] = &unk_1E9F99F98;
    objc_copyWeak(&v8, &location);
    -[VUISeparatorView vui_registerForTraitChanges:withHandler:](v4, "vui_registerForTraitChanges:withHandler:", v5, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)_updateLineColor
{
  void *v3;
  UIColor **p_color;
  UIColor *darkColor;

  -[VUISeparatorView vuiTraitCollection](self, "vuiTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") != 2)
  {

LABEL_5:
    p_color = &self->_color;
    goto LABEL_6;
  }
  p_color = &self->_darkColor;
  darkColor = self->_darkColor;

  if (!darkColor)
    goto LABEL_5;
LABEL_6:
  -[UIView setVuiBackgroundColor:](self->_line, "setVuiBackgroundColor:", *p_color);
}

void __34__VUISeparatorView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLineColor");

}

- (id)lineColor
{
  return (id)-[UIView vuiBackgroundColor](self->_line, "vuiBackgroundColor");
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    -[VUISeparatorView _updateLineColor](self, "_updateLineColor");
    v5 = v6;
  }

}

- (void)setDarkColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_darkColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_darkColor, a3);
    -[VUISeparatorView _updateLineColor](self, "_updateLineColor");
    v5 = v6;
  }

}

- (void)setLineHeight:(double)a3
{
  self->_lineHeight = a3;
  -[VUISeparatorView vui_setNeedsLayout](self, "vui_setNeedsLayout");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIView vui_sizeThatFits:](self, "vui_sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)darkColor
{
  return self->_darkColor;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (UIView)line
{
  return self->_line;
}

- (void)setLine:(id)a3
{
  objc_storeStrong((id *)&self->_line, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end

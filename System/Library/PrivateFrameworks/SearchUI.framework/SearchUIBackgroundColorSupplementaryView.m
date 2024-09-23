@implementation SearchUIBackgroundColorSupplementaryView

- (SearchUIBackgroundColorSupplementaryView)initWithFrame:(CGRect)a3
{
  SearchUIBackgroundColorSupplementaryView *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SearchUIBackgroundColorSupplementaryView;
  v3 = -[SearchUIBackgroundColorSupplementaryView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DBD9D0], "viewWithProminence:", +[SearchUIFocusStyleUtilities secondaryHaloProminence](SearchUIFocusStyleUtilities, "secondaryHaloProminence"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIBackgroundColorSupplementaryView setHighlightView:](v3, "setHighlightView:", v4);

    +[SearchUIAutoLayout selectionBorderWidth](SearchUIAutoLayout, "selectionBorderWidth");
    v6 = v5;
    -[SearchUIBackgroundColorSupplementaryView highlightView](v3, "highlightView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderWidth:", v6);

    v8 = -[SearchUIBackgroundColorSupplementaryView highlighted](v3, "highlighted") ^ 1;
    -[SearchUIBackgroundColorSupplementaryView highlightView](v3, "highlightView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v8);

    -[SearchUIBackgroundColorSupplementaryView highlightView](v3, "highlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIBackgroundColorSupplementaryView addSubview:](v3, "addSubview:", v10);

    -[SearchUIBackgroundColorSupplementaryView highlightView](v3, "highlightView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v11);

    v12 = (void *)objc_opt_new();
    -[SearchUIBackgroundColorSupplementaryView setColorView:](v3, "setColorView:", v12);

    -[SearchUIBackgroundColorSupplementaryView colorView](v3, "colorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIBackgroundColorSupplementaryView addSubview:](v3, "addSubview:", v13);

    -[SearchUIBackgroundColorSupplementaryView colorView](v3, "colorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v14);

  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double x;
  double y;
  double width;
  double height;
  id v12;
  CGRect v13;
  CGRect v14;

  self->_highlighted = a3;
  v4 = -[SearchUIBackgroundColorSupplementaryView highlighted](self, "highlighted") ^ 1;
  -[SearchUIBackgroundColorSupplementaryView highlightView](self, "highlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  +[SearchUIAutoLayout selectionBorderWidth](SearchUIAutoLayout, "selectionBorderWidth");
  v7 = -v6;
  -[SearchUIBackgroundColorSupplementaryView bounds](self, "bounds");
  v14 = CGRectInset(v13, v7, v7);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  -[SearchUIBackgroundColorSupplementaryView highlightView](self, "highlightView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", x, y, width, height);

}

- (void)tlks_setCornerRadius:(double)a3 withStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIBackgroundColorSupplementaryView;
  v6 = a4;
  -[SearchUIBackgroundColorSupplementaryView tlks_setCornerRadius:withStyle:](&v10, sel_tlks_setCornerRadius_withStyle_, v6, a3);
  -[SearchUIBackgroundColorSupplementaryView colorView](self, "colorView", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlks_setCornerRadius:withStyle:", v6, a3);

  -[SearchUIBackgroundColorSupplementaryView highlightView](self, "highlightView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAutoLayout selectionBorderWidth](SearchUIAutoLayout, "selectionBorderWidth");
  objc_msgSend(v8, "tlks_setCornerRadius:withStyle:", v6, v9 + a3);

}

- (void)setMaskedCorners:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_maskedCorners = a3;
  -[SearchUIBackgroundColorSupplementaryView colorView](self, "colorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", a3);

  -[SearchUIBackgroundColorSupplementaryView highlightView](self, "highlightView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", a3);

}

- (SearchUIBackgroundColorView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (TLKProminenceView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
}

@end

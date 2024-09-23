@implementation PUImportSectionBackgroundView

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUImportSectionBackgroundView;
  -[PUImportSectionBackgroundView applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportSectionBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v6);

    objc_msgSend(v5, "strokeWidth");
    -[PUImportSectionBackgroundView setStrokeWidth:](self, "setStrokeWidth:");
    objc_msgSend(v5, "bottomStrokeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUImportSectionBackgroundView setBottomStrokeColor:](self, "setBottomStrokeColor:", v7);
    -[PUImportSectionBackgroundView updateBottomStrokeViewIfNeeded](self, "updateBottomStrokeViewIfNeeded");
  }

}

- (void)setNeedsBottomStrokeViewUpdate
{
  -[PUImportSectionBackgroundView setNeedsBottomStrokeViewUpdate:](self, "setNeedsBottomStrokeViewUpdate:", 1);
}

- (void)updateBottomStrokeViewIfNeeded
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[PUImportSectionBackgroundView needsBottomStrokeViewUpdate](self, "needsBottomStrokeViewUpdate"))
  {
    -[PUImportSectionBackgroundView setNeedsBottomStrokeViewUpdate:](self, "setNeedsBottomStrokeViewUpdate:", 0);
    v3 = -[PUImportSectionBackgroundView needsStroke](self, "needsStroke");
    -[PUImportSectionBackgroundView bottomStrokeView](self, "bottomStrokeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    if (v3)
    {

      if (!v11)
      {
        v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
        v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        -[PUImportSectionBackgroundView setBottomStrokeView:](self, "setBottomStrokeView:", v6);

        -[PUImportSectionBackgroundView bottomStrokeView](self, "bottomStrokeView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAutoresizingMask:", 8);

      }
      -[PUImportSectionBackgroundView bottomStrokeView](self, "bottomStrokeView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportSectionBackgroundView addSubview:](self, "addSubview:", v8);

      -[PUImportSectionBackgroundView bottomStrokeColor](self, "bottomStrokeColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportSectionBackgroundView bottomStrokeView](self, "bottomStrokeView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);

      -[PUImportSectionBackgroundView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      objc_msgSend(v4, "removeFromSuperview");

    }
  }
}

- (BOOL)needsStroke
{
  void *v3;
  char v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v10;

  v10 = 0.0;
  -[PUImportSectionBackgroundView bottomStrokeColor](self, "bottomStrokeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getRed:green:blue:alpha:", 0, 0, 0, &v10);

  -[PUImportSectionBackgroundView strokeWidth](self, "strokeWidth");
  v4 = 1;
  if (v5 != 0.0 && v10 != 0.0)
  {
    -[PUImportSectionBackgroundView bottomStrokeColor](self, "bottomStrokeColor", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PUImportSectionBackgroundView bottomStrokeColor](self, "bottomStrokeColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  return v4 ^ 1;
}

- (void)setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    -[PUImportSectionBackgroundView setNeedsBottomStrokeViewUpdate](self, "setNeedsBottomStrokeViewUpdate");
  }
}

- (void)setBottomStrokeColor:(id)a3
{
  unint64_t v5;
  UIColor *bottomStrokeColor;
  char v7;
  unint64_t v8;

  v5 = (unint64_t)a3;
  bottomStrokeColor = self->_bottomStrokeColor;
  if (v5 | (unint64_t)bottomStrokeColor)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](bottomStrokeColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bottomStrokeColor, a3);
      -[PUImportSectionBackgroundView setNeedsBottomStrokeViewUpdate](self, "setNeedsBottomStrokeViewUpdate");
      v5 = v8;
    }
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double x;
  double width;
  double MaxY;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)PUImportSectionBackgroundView;
  -[PUImportSectionBackgroundView layoutSubviews](&v13, sel_layoutSubviews);
  -[PUImportSectionBackgroundView bottomStrokeView](self, "bottomStrokeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUImportSectionBackgroundView bounds](self, "bounds");
    v15 = CGRectIntegral(v14);
    x = v15.origin.x;
    width = v15.size.width;
    MaxY = CGRectGetMaxY(v15);
    -[PUImportSectionBackgroundView strokeWidth](self, "strokeWidth");
    v9 = MaxY - v8;
    -[PUImportSectionBackgroundView strokeWidth](self, "strokeWidth");
    v11 = v10;
    -[PUImportSectionBackgroundView bottomStrokeView](self, "bottomStrokeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", x, v9, width, v11);

  }
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (UIColor)bottomStrokeColor
{
  return self->_bottomStrokeColor;
}

- (UIView)bottomStrokeView
{
  return self->_bottomStrokeView;
}

- (void)setBottomStrokeView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStrokeView, a3);
}

- (BOOL)needsBottomStrokeViewUpdate
{
  return self->_needsBottomStrokeViewUpdate;
}

- (void)setNeedsBottomStrokeViewUpdate:(BOOL)a3
{
  self->_needsBottomStrokeViewUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomStrokeView, 0);
  objc_storeStrong((id *)&self->_bottomStrokeColor, 0);
}

@end

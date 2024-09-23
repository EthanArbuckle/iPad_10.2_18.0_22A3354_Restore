@implementation HairlineView

- (HairlineView)init
{
  HairlineView *v2;
  HairlineView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HairlineView;
  v2 = -[HairlineView initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
    -[HairlineView customInit](v2, "customInit");
  return v3;
}

- (HairlineView)initWithFrame:(CGRect)a3
{
  HairlineView *v3;
  HairlineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HairlineView;
  v3 = -[HairlineView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HairlineView customInit](v3, "customInit");
  return v4;
}

- (HairlineView)initWithCoder:(id)a3
{
  HairlineView *v3;
  HairlineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HairlineView;
  v3 = -[HairlineView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[HairlineView customInit](v3, "customInit");
  return v4;
}

- (void)customInit
{
  HairlineView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView window](v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView window](v2, "window"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screen"));
    objc_msgSend(v6, "nativeScale");
    v8 = v7;

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "nativeScale");
    v8 = v9;
  }

  if (v8 <= 0.0)
    v10 = 1.0;
  else
    v10 = 1.0 / v8;

  v2->_intrinsicThickness = v10;
  LODWORD(v11) = 1148846080;
  -[HairlineView setContentHuggingPriority:forAxis:](v2, "setContentHuggingPriority:forAxis:", 1, v11);
  LODWORD(v12) = 1148846080;
  -[HairlineView setContentCompressionResistancePriority:forAxis:](v2, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  v2->_autoUpdateTheme = 1;
  -[HairlineView infoCardThemeChanged](v2, "infoCardThemeChanged");
}

- (void)setLeadingMargin:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HairlineView leadingMarginConstraint](self, "leadingMarginConstraint"));
  objc_msgSend(v4, "setConstant:", a3);

}

- (double)leadingMargin
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingMarginConstraint](self, "leadingMarginConstraint"));
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setTrailingMargin:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HairlineView trailingMarginConstraint](self, "trailingMarginConstraint"));
  objc_msgSend(v4, "setConstant:", a3);

}

- (double)trailingMargin
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingMarginConstraint](self, "trailingMarginConstraint"));
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setVertical:(BOOL)a3
{
  double v3;
  float v5;
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;

  if (self->_vertical != a3)
  {
    self->_vertical = a3;
    if (a3)
      *(float *)&v3 = 1000.0;
    else
      *(float *)&v3 = 250.0;
    if (a3)
      v5 = 250.0;
    else
      v5 = 1000.0;
    if (a3)
      v6 = 1000.0;
    else
      v6 = 750.0;
    if (a3)
      v7 = 750.0;
    else
      v7 = 1000.0;
    -[HairlineView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v3);
    *(float *)&v8 = v5;
    -[HairlineView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v8);
    *(float *)&v9 = v6;
    -[HairlineView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    *(float *)&v10 = v7;
    -[HairlineView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  }
}

- (void)didMoveToWindow
{
  HairlineView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HairlineView;
  -[HairlineView didMoveToWindow](&v12, "didMoveToWindow");
  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView window](v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView window](v3, "window"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
    objc_msgSend(v7, "nativeScale");
    v9 = v8;

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));

    objc_msgSend(v6, "nativeScale");
    v9 = v10;
  }

  v11 = 1.0;
  if (v9 > 0.0)
    v11 = 1.0 / v9;
  if (v11 != v3->_intrinsicThickness)
  {
    v3->_intrinsicThickness = v11;
    -[HairlineView invalidateIntrinsicContentSize](v3, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  double *p_intrinsicThickness;
  double *v3;
  double v4;
  double v5;
  CGSize result;

  p_intrinsicThickness = &self->_intrinsicThickness;
  if (self->_vertical)
    v3 = &self->_intrinsicThickness;
  else
    v3 = (double *)&UIViewNoIntrinsicMetric;
  if (self->_vertical)
    p_intrinsicThickness = (double *)&UIViewNoIntrinsicMetric;
  v4 = *p_intrinsicThickness;
  v5 = *v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->_vertical)
    result.height = self->_intrinsicThickness;
  else
    result.width = self->_intrinsicThickness;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  HairlineView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HairlineView;
  v4 = a3;
  -[HairlineView traitCollectionDidChange:](&v19, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView traitCollection](self, "traitCollection", v19.receiver, v19.super_class));
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
  {
    v10 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView window](v10, "window"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "screen"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView window](v10, "window"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "screen"));
      objc_msgSend(v14, "nativeScale");
      v16 = v15;

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v13, "nativeScale");
      v16 = v17;
    }

    if (v16 <= 0.0)
      v18 = 1.0;
    else
      v18 = 1.0 / v16;

    v10->_intrinsicThickness = v18;
    -[HairlineView invalidateIntrinsicContentSize](v10, "invalidateIntrinsicContentSize");
  }
}

- (BOOL)autoUpdateTheme
{
  return self->_autoUpdateTheme;
}

- (void)setAutoUpdateTheme:(BOOL)a3
{
  self->_autoUpdateTheme = a3;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMarginConstraint, a3);
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
}

@end

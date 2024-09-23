@implementation CRLiOSInspectorCheckmark

+ (id)checkmark
{
  return -[CRLiOSInspectorCheckmark initWithFrame:]([CRLiOSInspectorCheckmark alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (CRLiOSInspectorCheckmark)initWithFrame:(CGRect)a3
{
  CRLiOSInspectorCheckmark *v3;
  CRLiOSInspectorCheckmark *v4;
  uint64_t v5;
  UIButton *checkmarkImageButton;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLiOSInspectorCheckmark;
  v3 = -[CRLiOSInspectorCheckmark initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    v5 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    checkmarkImageButton = v4->_checkmarkImageButton;
    v4->_checkmarkImageButton = (UIButton *)v5;

    -[UIButton setCrl_deprecatedAdjustsImageWhenHighlighted:](v4->_checkmarkImageButton, "setCrl_deprecatedAdjustsImageWhenHighlighted:", 1);
    -[UIButton setCrl_deprecatedAdjustsImageWhenDisabled:](v4->_checkmarkImageButton, "setCrl_deprecatedAdjustsImageWhenDisabled:", 1);
    -[UIButton setContentMode:](v4->_checkmarkImageButton, "setContentMode:", 4);
    -[CRLiOSInspectorCheckmark addSubview:](v4, "addSubview:", v4->_checkmarkImageButton);
    -[CRLiOSInspectorCheckmark setupDefaultCheckmarkImage](v4, "setupDefaultCheckmarkImage");
    -[CRLiOSInspectorCheckmark p_updateTintColor](v4, "p_updateTintColor");
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_checkmarkImageButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark crl_constraintsToAllSidesOfItem:](v4, "crl_constraintsToAllSidesOfItem:", v4->_checkmarkImageButton));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[CRLiOSInspectorCheckmark p_updateTintColor](self, "p_updateTintColor");
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (self->_usesCustomCheckmarkImage)
      -[UIButton setHighlighted:](self->_checkmarkImageButton, "setHighlighted:");
    else
      -[CRLiOSInspectorCheckmark p_updateTintColor](self, "p_updateTintColor");
  }
}

- (void)setUsesCustomCheckmarkImage:(BOOL)a3
{
  double v4;
  double v5;
  double v6;

  if (self->_usesCustomCheckmarkImage != a3)
  {
    if (a3)
    {
      -[UIButton setImage:forState:](self->_checkmarkImageButton, "setImage:forState:", self->_customCheckmarkImage, 0);
      -[UIButton setImage:forState:](self->_checkmarkImageButton, "setImage:forState:", self->_customHighlightedCheckmarkImage, 1);
      -[UIImage size](self->_customCheckmarkImage, "size");
      v5 = v4;
      -[UIImage size](self->_customCheckmarkImage, "size");
      -[UIButton setFrame:](self->_checkmarkImageButton, "setFrame:", 0.0, 0.0, v5, v6);
    }
    else
    {
      -[CRLiOSInspectorCheckmark setupDefaultCheckmarkImage](self, "setupDefaultCheckmarkImage");
      -[CRLiOSInspectorCheckmark p_updateTintColor](self, "p_updateTintColor");
    }
    -[CRLiOSInspectorCheckmark setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setupDefaultCheckmarkImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithWeight:](UIImageSymbolConfiguration, "configurationWithWeight:", 6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crl_imageWithAlpha:renderingMode:", 0, 0.400000006));
  -[UIButton setImage:forState:](self->_checkmarkImageButton, "setImage:forState:", v8, 0);
  -[UIButton setImage:forState:](self->_checkmarkImageButton, "setImage:forState:", v4, 1);
  objc_msgSend(v8, "size");
  v6 = v5;
  objc_msgSend(v8, "size");
  -[UIButton setFrame:](self->_checkmarkImageButton, "setFrame:", 0.0, 0.0, v6, v7);

}

- (void)setCustomCheckmarkImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_customCheckmarkImage != v5)
  {
    objc_storeStrong((id *)&self->_customCheckmarkImage, a3);
    -[CRLiOSInspectorCheckmark setUsesCustomCheckmarkImage:](self, "setUsesCustomCheckmarkImage:", v5 != 0);
    -[CRLiOSInspectorCheckmark setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setCustomHighlightedCheckmarkImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_customHighlightedCheckmarkImage != v5)
  {
    objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, a3);
    -[UIButton setImage:forState:](self->_checkmarkImageButton, "setImage:forState:", v5, 1);
    -[CRLiOSInspectorCheckmark setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)p_updateTintColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark tintColor](self, "tintColor"));
  if (self->_enabled)
  {
    if (!self->_highlighted)
      goto LABEL_6;
    v8 = v3;
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.8));
  }
  else
  {
    v8 = v3;
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v5 = (void *)v4;

  v3 = v5;
LABEL_6:
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v9 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorCheckmark checkmarkImageButton](self, "checkmarkImageButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageView"));
  objc_msgSend(v7, "setTintColor:", v9);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIButton intrinsicContentSize](self->_checkmarkImageButton, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSInspectorCheckmark;
  -[CRLiOSInspectorCheckmark tintColorDidChange](&v3, "tintColorDidChange");
  -[CRLiOSInspectorCheckmark p_updateTintColor](self, "p_updateTintColor");
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)usesCustomCheckmarkImage
{
  return self->_usesCustomCheckmarkImage;
}

- (UIImage)customCheckmarkImage
{
  return self->_customCheckmarkImage;
}

- (UIImage)customHighlightedCheckmarkImage
{
  return self->_customHighlightedCheckmarkImage;
}

- (UIButton)checkmarkImageButton
{
  return self->_checkmarkImageButton;
}

- (void)setCheckmarkImageButton:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageButton, 0);
  objc_storeStrong((id *)&self->_customHighlightedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_customCheckmarkImage, 0);
}

@end

@implementation UIButtonLabel

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonLabel;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setReverseShadow:(BOOL)a3
{
  double v4;
  double v5;
  objc_super v6;
  objc_super v7;

  if (self->_reverseShadow != a3)
  {
    self->_reverseShadow = a3;
    v7.receiver = self;
    v7.super_class = (Class)UIButtonLabel;
    -[UILabel shadowOffset](&v7, sel_shadowOffset);
    v6.receiver = self;
    v6.super_class = (Class)UIButtonLabel;
    -[UILabel setShadowOffset:](&v6, sel_setShadowOffset_, -v4, -v5);
  }
}

- (BOOL)_fontIsDefaultForIdiom
{
  return self->_fontIsDefaultForIdiom;
}

- (void)_contentDidChange:(int64_t)a3 fromContent:(id)a4
{
  id v6;
  NSLineBreakMode v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIButtonLabel;
  v6 = a4;
  -[UILabel _contentDidChange:fromContent:](&v12, sel__contentDidChange_fromContent_, a3, v6);
  v7 = -[UILabel lineBreakMode](self, "lineBreakMode", v12.receiver, v12.super_class);
  objc_msgSend(v6, "paragraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "lineBreakMode");
  if ((a3 & 0x8000) != 0 && v7 != v9)
    -[UIButtonLabel _internallySetNumberOfLines:](self, "_internallySetNumberOfLines:", (unint64_t)v7 > NSLineBreakByCharWrapping);
  v10 = dyld_program_sdk_at_least();
  if ((a3 & 0x4000) != 0 && v10)
  {
    -[UIView superview](self, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "_titleViewLabelMetricsChanged");

  }
}

- (void)_setFont:(id)a3 isDefaultForIdiom:(BOOL)a4
{
  objc_super v4;

  self->_fontIsDefaultForIdiom = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIButtonLabel;
  -[UILabel setFont:](&v4, sel_setFont_, a3);
}

- (void)setFont:(id)a3
{
  -[UIButtonLabel _setFont:isDefaultForIdiom:](self, "_setFont:isDefaultForIdiom:", a3, 0);
}

- (void)_setWantsAutolayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIButtonLabel;
  -[UIView _setWantsAutolayout](&v3, sel__setWantsAutolayout);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)setShadowOffset:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;

  v3 = -a3.width;
  v4 = -a3.height;
  if (self->_reverseShadow)
  {
    a3.width = -a3.width;
    a3.height = -a3.height;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIButtonLabel;
  -[UILabel setShadowOffset:](&v5, sel_setShadowOffset_, a3.width, a3.height, v3, v4);
}

- (id)_initWithFrame:(CGRect)a3 button:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIButtonLabel *v10;
  UIButtonLabel *v11;
  UIButtonLabel *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIButtonLabel;
  v10 = -[UILabel initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_button, v9);
    v12 = v11;
  }

  return v11;
}

- (void)setNumberOfLines:(int64_t)a3
{
  objc_super v3;

  self->_externallySetNumberOfLines = 1;
  v3.receiver = self;
  v3.super_class = (Class)UIButtonLabel;
  -[UILabel setNumberOfLines:](&v3, sel_setNumberOfLines_, a3);
}

- (void)_internallySetNumberOfLines:(int64_t)a3
{
  objc_super v3;

  if (!self->_externallySetNumberOfLines)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIButtonLabel;
    -[UILabel setNumberOfLines:](&v3, sel_setNumberOfLines_, a3);
  }
}

- (BOOL)_textColorFollowsTintColor
{
  UIButton **p_button;
  id WeakRetained;
  int v5;
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;
  char v17;

  p_button = &self->_button;
  WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  v5 = objc_msgSend(WeakRetained, "_isModernButton");

  if (v5)
  {
    v17 = 0;
    v6 = objc_loadWeakRetained((id *)p_button);
    v7 = (id)objc_msgSend(v6, "_titleColorForState:suppressTintColorFollowing:", objc_msgSend(v6, "state"), &v17);

    LOBYTE(v8) = 0;
    if (!v17)
    {
      v9 = objc_loadWeakRetained((id *)p_button);
      objc_msgSend(v9, "_contentForState:", objc_msgSend(v9, "state"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "titleColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        v12 = objc_loadWeakRetained((id *)p_button);
        objc_msgSend(v12, "_contentForState:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "titleColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = v14 == 0;

      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIButtonLabel;
    return -[UILabel _textColorFollowsTintColor](&v16, sel__textColorFollowsTintColor);
  }
  return v8;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)UIButtonLabel;
  -[UILabel intrinsicContentSize](&v14, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[UILabel text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    -[UILabel font](self, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      +[UILabel defaultFont](UILabel, "defaultFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(CFSTR("X"), "_legacy_sizeWithFont:forWidth:lineBreakMode:", v10, -[UILabel lineBreakMode](self, "lineBreakMode"), 3.40282347e38);
    v6 = v11;
    if (!v9)

    v4 = 0.0;
  }
  v12 = v4;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_button);
}

- (CGSize)shadowOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)UIButtonLabel;
  -[UILabel shadowOffset](&v5, sel_shadowOffset);
  if (self->_reverseShadow)
  {
    v4 = -v4;
    v3 = -v3;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_paddingForBaselineSpacingFromEdge:(int)a3 toNeighborEdge:(int)a4
{
  double result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIButtonLabel;
  -[UIView _paddingForBaselineSpacingFromEdge:toNeighborEdge:](&v5, sel__paddingForBaselineSpacingFromEdge_toNeighborEdge_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  return result;
}

@end

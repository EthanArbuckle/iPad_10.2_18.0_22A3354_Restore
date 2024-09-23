@implementation _SiriUINavigationContentView

- (_SiriUINavigationContentView)initWithFrame:(CGRect)a3
{
  _SiriUINavigationContentView *v3;
  _SiriUINavigationContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SiriUINavigationContentView;
  v3 = -[_SiriUINavigationContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_contentLayoutEnabled = 1;
    v3->_supportsSAE = AFDeviceSupportsSystemAssistantExperience();
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 IsPhone;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  double v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)_SiriUINavigationContentView;
  -[_SiriUINavigationContentView layoutSubviews](&v35, sel_layoutSubviews);
  if (self->_contentLayoutEnabled)
  {
    -[_SiriUINavigationContentView safeAreaInsets](self, "safeAreaInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[_SiriUINavigationContentView bounds](self, "bounds");
    v31 = v14;
    v33 = v13;
    v15 = v12 - (v4 + v8);
    if (self->_supportsSAE)
    {
      -[_SiriUINavigationContentView bounds](self, "bounds");
      v17 = v16;
      v19 = v18;
    }
    else
    {
      v17 = v11 - (v6 + v10);
      v19 = v12 - (v4 + v8);
    }
    -[_SiriUINavigationContentView contentView](self, "contentView", v31, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeThatFits:", v17, v15);
    v22 = v21;
    v24 = v23;

    if (self->_supportsSAE)
    {
      IsPhone = SiriUIDeviceIsPhone();
      v26 = v17 > v19;
      v27 = 0.0;
      v28 = v8;
      if (IsPhone && v26)
        v29 = v4;
      else
        v29 = 0.0;
      if (IsPhone && v26)
        v22 = v17 - v4 - v28;
      else
        v22 = v17;
    }
    else
    {
      v29 = v6 + v34;
      v27 = v4 + v32;
      if (v24 >= v15)
        v19 = v15;
      else
        v19 = v24;
    }
    -[_SiriUINavigationContentView contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v29, v27, v22, v19);

  }
}

- (void)setContentView:(id)a3
{
  UIView **p_contentView;
  void *v6;
  UIView *v7;

  p_contentView = &self->_contentView;
  v7 = (UIView *)a3;
  if (*p_contentView != v7)
  {
    -[_SiriUINavigationContentView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView recursive_setSemanticContentAttribute:](*p_contentView, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());
    -[_SiriUINavigationContentView addSubview:](self, "addSubview:", v7);

  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isContentLayoutEnabled
{
  return self->_contentLayoutEnabled;
}

- (void)setContentLayoutEnabled:(BOOL)a3
{
  self->_contentLayoutEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

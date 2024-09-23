@implementation UICompatibilityPredictiveViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return self->_customView != 0;
}

- (BOOL)hidesExpandableButton
{
  return 0;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  double result;

  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", a3);
  return result;
}

- (NSArray)displayedCandidates
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (void)setCustomView:(id)a3
{
  UIView *v5;
  UIView *customView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  customView = self->_customView;
  if (customView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](customView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customView, a3);
    v5 = v8;
    if (v8)
    {
      -[UIViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

      v5 = v8;
    }
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)UICompatibilityPredictiveViewController;
  -[UIViewController viewDidLayoutSubviews](&v23, sel_viewDidLayoutSubviews);
  -[UICompatibilityPredictiveViewController customView](self, "customView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;

    v11 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UICompatibilityPredictiveViewController customView](self, "customView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v11, v12, v8, 36.0);

    -[UICompatibilityPredictiveViewController customView](self, "customView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = round(v6 + (v10 - v19) * 0.5);
    -[UICompatibilityPredictiveViewController customView](self, "customView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v16, v21, v18, v20);

  }
}

- (UIView)customView
{
  return self->_customView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
}

@end

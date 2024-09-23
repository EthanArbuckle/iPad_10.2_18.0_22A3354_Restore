@implementation _UIEditMenuListSeparatorView

- (_UIEditMenuListSeparatorView)initWithFrame:(CGRect)a3
{
  _UIEditMenuListSeparatorView *v3;
  _UIEditMenuListSeparatorView *v4;
  void *v5;
  void *v6;
  UIVisualEffectView *v7;
  void *v8;
  UIVisualEffectView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIEditMenuListSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEditMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [UIVisualEffectView alloc];
    objc_msgSend(v6, "separatorEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIVisualEffectView initWithEffect:](v7, "initWithEffect:", v8);

    objc_msgSend(v6, "separatorEffectColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    -[UIVisualEffectView contentView](v9, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsEdgeAntialiasing:", 1);

    -[UIVisualEffectView contentView](v9, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClipsToBounds:", 0);

    -[UIView bounds](v4, "bounds");
    -[UIView setFrame:](v9, "setFrame:");
    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v4, "addSubview:", v9);

  }
  return v4;
}

@end

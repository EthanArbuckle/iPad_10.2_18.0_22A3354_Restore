@implementation _UIContextMenuGradientMaskSectionSeparatorView

- (_UIContextMenuGradientMaskSectionSeparatorView)initWithFrame:(CGRect)a3
{
  _UIContextMenuGradientMaskSectionSeparatorView *v3;
  _UIContextMenuGradientMaskSectionSeparatorView *v4;
  _UIContextMenuGradientMaskSectionSeparatorView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIContextMenuGradientMaskSectionSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = objc_alloc_init(UIView);
    -[UIView bounds](v5, "bounds");
    -[UIView setFrame:](v6, "setFrame:");
    -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v5, "addSubview:", v6);
    v7 = objc_alloc_init(UIView);
    -[UIView traitCollection](v5, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionSeparatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v10);
    -[UIView layer](v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompositingFilter:", *MEMORY[0x1E0CD2E98]);

    -[UIView bounds](v6, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v6, "addSubview:", v7);
    -[UIView layer](v5, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAllowsGroupBlending:", 0);
    -[UIView layer](v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

  }
  return v4;
}

@end

@implementation _UIPreviewQuickActionView

- (_UIPreviewQuickActionView)initWithCoder:(id)a3
{
  _UIPreviewQuickActionView *v3;
  _UIPreviewQuickActionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewQuickActionView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _UIPreviewQuickActionViewCommonInit(v3);
  return v4;
}

- (_UIPreviewQuickActionView)initWithFrame:(CGRect)a3
{
  _UIPreviewQuickActionView *v3;
  _UIPreviewQuickActionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewQuickActionView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _UIPreviewQuickActionViewCommonInit(v3);
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewQuickActionView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIPreviewQuickActionView _updateCircleBackgroundImage](self, "_updateCircleBackgroundImage");
}

- (id)centerYAnchor
{
  void *v2;
  void *v3;

  -[_UIPreviewQuickActionView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setQuickAction:(id)a3
{
  UIPreviewAction *v5;
  UIPreviewAction *v6;

  v5 = (UIPreviewAction *)a3;
  if (self->_quickAction != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_quickAction, a3);
    -[_UIPreviewQuickActionView updateFromQuickAction](self, "updateFromQuickAction");
    v5 = v6;
  }

}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[_UIPreviewQuickActionView updateFromQuickAction](self, "updateFromQuickAction");
  }
}

- (void)updateFromQuickAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[_UIPreviewQuickActionView quickAction](self, "quickAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewQuickActionView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[_UIPreviewQuickActionView quickAction](self, "quickAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewQuickActionView imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  -[_UIPreviewQuickActionView quickAction](self, "quickAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewQuickActionView label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v11);

  if (-[_UIPreviewQuickActionView selected](self, "selected"))
  {
    -[_UIPreviewQuickActionView quickAction](self, "quickAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewQuickActionView backgroundViewImage](self, "backgroundViewImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintColor:", v14);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewQuickActionView imageView](self, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v16);
  }
  else
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewQuickActionView backgroundViewImage](self, "backgroundViewImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTintColor:", v18);

    -[_UIPreviewQuickActionView quickAction](self, "quickAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewQuickActionView imageView](self, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTintColor:", v17);

  }
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateCircleBackgroundImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[_UIPreviewQuickActionView backgroundViewImage](self, "backgroundViewImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v5, v7, v9, v11);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  _UIGraphicsBeginImageContextWithOptions(0, 0, v9, v11, 0.0);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFill");

  objc_msgSend(v16, "fill");
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithRenderingMode:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewQuickActionView backgroundViewImage](self, "backgroundViewImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v14);

  UIGraphicsEndImageContext();
}

- (UIPreviewAction)quickAction
{
  return self->_quickAction;
}

- (BOOL)selected
{
  return self->_selected;
}

- (UIImageView)backgroundViewImage
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_backgroundViewImage);
}

- (void)setBackgroundViewImage:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundViewImage, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_backgroundViewImage);
  objc_storeStrong((id *)&self->_quickAction, 0);
}

@end

@implementation _SBUISystemApertureAspectFittingView

- (id)initWithContentView:(id *)a1
{
  id v4;
  void *v5;
  id *v6;
  objc_super v8;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    objc_msgSend(v4, "bounds");
    v8.receiver = a1;
    v8.super_class = (Class)_SBUISystemApertureAspectFittingView;
    v6 = (id *)objc_msgSendSuper2(&v8, sel_initWithFrame_);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 52, a2);
      objc_msgSend(a1, "addSubview:", v5);
    }
  }

  return a1;
}

- (id)setContentContainer:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 53, a2);
  return result;
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
  UIView *contentView;
  UIView *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SBUISystemApertureAspectFittingView;
  -[_SBUISystemApertureAspectFittingView layoutSubviews](&v13, sel_layoutSubviews);
  -[_SBUISystemApertureAspectFittingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self)
    contentView = self->_contentView;
  else
    contentView = 0;
  v12 = contentView;
  -[UIView setBounds:](v12, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  -[UIView setCenter:](v12, "setCenter:");

}

- (uint64_t)contentView
{
  if (result)
    return *(_QWORD *)(result + 416);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *contentView;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a3.width != 0.0 && a3.height != 0.0)
  {
    -[_SBUISystemApertureAspectFittingView explicitIntrinsicSize](self, "explicitIntrinsicSize");
    v8 = v7;
    v9 = v6;
    if (v7 == 0.0 && v6 == 0.0)
    {
      if (self)
        contentView = self->_contentView;
      else
        contentView = 0;
      -[UIView sizeThatFits:](contentView, "sizeThatFits:", width, height);
      v8 = v11;
      v9 = v12;
    }
    if (!BSSizeLessThanSize() || v8 == 0.0 && v9 == 0.0)
    {
      height = v9;
      width = v8;
    }
    else
    {
      v13 = v8 / width;
      if (v8 / width < v9 / height)
        v13 = v9 / height;
      v14 = 1.0 / v13;
      width = v8 * v14;
      height = v9 * v14;
    }
  }
  v15 = width;
  v16 = height;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  UIView *contentView;
  CGSize result;

  -[_SBUISystemApertureAspectFittingView explicitIntrinsicSize](self, "explicitIntrinsicSize");
  if (v3 == 0.0 && v4 == 0.0)
  {
    if (self)
      contentView = self->_contentView;
    else
      contentView = 0;
    -[UIView intrinsicContentSize](contentView, "intrinsicContentSize");
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)explicitIntrinsicSize
{
  double width;
  double height;
  CGSize result;

  width = self->_explicitIntrinsicSize.width;
  height = self->_explicitIntrinsicSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExplicitIntrinsicSize:(CGSize)a3
{
  self->_explicitIntrinsicSize = a3;
}

- (id)contentContainer
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 53);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

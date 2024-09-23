@implementation TransitApertureElementWrapperView

- (TransitApertureElementWrapperView)initWithWrappedView:(id)a3 isDetached:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  TransitApertureElementWrapperView *v7;
  TransitApertureElementWrapperView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[3];

  v4 = a4;
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TransitApertureElementWrapperView;
  v7 = -[TransitApertureElementWrapperView initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    -[TransitApertureElementWrapperView setIsDetached:](v7, "setIsDetached:", v4);
    -[TransitApertureElementWrapperView setWrappedView:](v8, "setWrappedView:", v6);
    -[TransitApertureElementWrapperView addSubview:](v8, "addSubview:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", 20.0));
    v19[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 20.0));
    v19[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitApertureElementWrapperView centerXAnchor](v8, "centerXAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v19[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v8;
}

- (CGSize)intrinsicContentSize
{
  unsigned int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[TransitApertureElementWrapperView isDetached](self, "isDetached");
  v3 = 45.0;
  v4 = 20.0;
  if (!v2)
    v3 = 20.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isDetached
{
  return self->_isDetached;
}

- (void)setIsDetached:(BOOL)a3
{
  self->_isDetached = a3;
}

- (UIView)wrappedView
{
  return self->_wrappedView;
}

- (void)setWrappedView:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end

@implementation AutolayoutImageView

- (AutolayoutImageView)initWithImage:(id)a3
{
  AutolayoutImageView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AutolayoutImageView;
  result = -[AutolayoutImageView initWithImage:](&v4, "initWithImage:", a3);
  if (result)
    result->_aspectRatioConstraintPriority = 1000.0;
  return result;
}

- (AutolayoutImageView)initWithFrame:(CGRect)a3
{
  AutolayoutImageView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AutolayoutImageView;
  result = -[AutolayoutImageView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_aspectRatioConstraintPriority = 1000.0;
  return result;
}

- (AutolayoutImageView)initWithCoder:(id)a3
{
  AutolayoutImageView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AutolayoutImageView;
  result = -[AutolayoutImageView initWithCoder:](&v4, "initWithCoder:", a3);
  if (result)
    result->_aspectRatioConstraintPriority = 1000.0;
  return result;
}

- (void)setImage:(id)a3
{
  id v4;
  NSLayoutConstraint *aspectConstraint;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  objc_super v16;

  v4 = a3;
  if (self->_aspectConstraint)
  {
    -[AutolayoutImageView removeConstraint:](self, "removeConstraint:");
    aspectConstraint = self->_aspectConstraint;
    self->_aspectConstraint = 0;

  }
  v16.receiver = self;
  v16.super_class = (Class)AutolayoutImageView;
  -[AutolayoutImageView setImage:](&v16, "setImage:", v4);
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutolayoutImageView heightAnchor](self, "heightAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutolayoutImageView widthAnchor](self, "widthAnchor"));
    objc_msgSend(v4, "size");
    v9 = v8;
    objc_msgSend(v4, "size");
    v11 = v9 / v10;
    -[AutolayoutImageView aspectRatioConstraintPriority](self, "aspectRatioConstraintPriority");
    LODWORD(v13) = v12;
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:multiplier:priority:", v7, v11, v13));
    v15 = self->_aspectConstraint;
    self->_aspectConstraint = v14;

    -[AutolayoutImageView addConstraint:](self, "addConstraint:", self->_aspectConstraint);
  }

}

- (void)setAspectRatioConstraintPriority:(float)a3
{
  id v4;

  if (self->_aspectRatioConstraintPriority != a3)
  {
    self->_aspectRatioConstraintPriority = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[AutolayoutImageView image](self, "image"));
    -[AutolayoutImageView setImage:](self, "setImage:", v4);

  }
}

- (float)aspectRatioConstraintPriority
{
  return self->_aspectRatioConstraintPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectConstraint, 0);
}

@end

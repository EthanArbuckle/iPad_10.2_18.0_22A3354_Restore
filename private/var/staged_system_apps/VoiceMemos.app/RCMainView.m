@implementation RCMainView

- (void)setBrowseFoldersView:(id)a3
{
  UIView *v4;
  UIView *browseFoldersView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_browseFoldersView, "removeFromSuperview");
  browseFoldersView = self->_browseFoldersView;
  self->_browseFoldersView = v4;
  v6 = v4;

  -[RCMainView addSubview:](self, "addSubview:", v6);
  -[RCMainView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (RCMainView)initWithFrame:(CGRect)a3
{
  RCMainView *v3;
  RCMainView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCMainView;
  v3 = -[RCMainView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCMainView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v8.receiver = self;
  v8.super_class = (Class)RCMainView;
  -[RCMainView updateConstraints](&v8, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainView browseFoldersView](self, "browseFoldersView"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "alignCenterTopToCenterTopOfView:padding:", self, 0.0);
    objc_msgSend(v4, "constrainWidthWithView:padding:", self, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, self, 9, 1.0, 0.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 4, 0, self, 4, 1.0, 0.0));
    v9[0] = v5;
    v9[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
    -[RCMainView addConstraints:](self, "addConstraints:", v7);

  }
}

- (UIView)browseFoldersView
{
  return self->_browseFoldersView;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_browseFoldersView, 0);
}

@end

@implementation MapsProgressButton

- (MapsProgressButton)initWithFrame:(CGRect)a3
{
  MapsProgressButton *v3;
  MapsProgressButton *v4;
  MapsProgressButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsProgressButton;
  v3 = -[MapsProgressButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MapsProgressButton _customInit](v3, "_customInit");
    v5 = v4;
  }

  return v4;
}

- (void)_customInit
{
  MapsProgressBarView *v3;
  MapsProgressBarView *progressBarView;

  v3 = -[MapsProgressBarView initWithFrame:]([MapsProgressBarView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  progressBarView = self->_progressBarView;
  self->_progressBarView = v3;

  -[MapsProgressBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsProgressBarView setUserInteractionEnabled:](self->_progressBarView, "setUserInteractionEnabled:", 0);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsProgressButton;
  -[MapsThemeButton didMoveToWindow](&v3, "didMoveToWindow");
  -[MapsProgressButton _insertProgressBarViewIfNecessary](self, "_insertProgressBarViewIfNecessary");
}

- (void)_insertProgressBarViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *progressHeightConstraint;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *progressBottomConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  void *v19;
  _QWORD v20[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView superview](self->_progressBarView, "superview"));

  if (!v3)
  {
    -[MapsProgressButton addSubview:](self, "addSubview:", self->_progressBarView);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressButton titleLabel](self, "titleLabel"));
    -[MapsProgressButton bringSubviewToFront:](self, "bringSubviewToFront:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView heightAnchor](self->_progressBarView, "heightAnchor"));
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", 0.0));
    progressHeightConstraint = self->_progressHeightConstraint;
    self->_progressHeightConstraint = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView bottomAnchor](self->_progressBarView, "bottomAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressButton bottomAnchor](self, "bottomAnchor"));
    v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 0.0));
    progressBottomConstraint = self->_progressBottomConstraint;
    self->_progressBottomConstraint = v10;

    -[MapsProgressButton _updateProgressConstraints](self, "_updateProgressConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView leadingAnchor](self->_progressBarView, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressButton leadingAnchor](self, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 8.0));
    v20[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarView trailingAnchor](self->_progressBarView, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressButton trailingAnchor](self, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -8.0));
    v18 = self->_progressBottomConstraint;
    v20[1] = v17;
    v20[2] = v18;
    v20[3] = self->_progressHeightConstraint;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
}

- (void)_updateProgressConstraints
{
  int64_t v3;
  double v4;
  double v5;

  v3 = -[MapsProgressButton progressStyle](self, "progressStyle");
  if (v3)
  {
    if (v3 != 1)
      return;
    v4 = -8.0;
    v5 = 4.0;
  }
  else
  {
    v4 = -4.0;
    v5 = 8.0;
  }
  -[NSLayoutConstraint setConstant:](self->_progressHeightConstraint, "setConstant:", v5);
  -[NSLayoutConstraint setConstant:](self->_progressBottomConstraint, "setConstant:", v4);
}

- (void)setProgressStyle:(int64_t)a3
{
  if (self->_progressStyle != a3)
  {
    self->_progressStyle = a3;
    -[MapsProgressButton _updateProgressConstraints](self, "_updateProgressConstraints");
  }
}

- (double)progress
{
  double result;

  -[MapsProgressBarView progress](self->_progressBarView, "progress");
  return result;
}

- (void)setProgress:(double)a3
{
  -[MapsProgressBarView setProgress:](self->_progressBarView, "setProgress:", a3);
}

- (unint64_t)fillStyle
{
  return -[MapsProgressBarView fillStyle](self->_progressBarView, "fillStyle");
}

- (void)setFillStyle:(unint64_t)a3
{
  -[MapsProgressBarView setFillStyle:](self->_progressBarView, "setFillStyle:", a3);
}

- (BOOL)progressBarHidden
{
  return -[MapsProgressBarView isHidden](self->_progressBarView, "isHidden");
}

- (void)setProgressBarHidden:(BOOL)a3
{
  -[MapsProgressBarView setHidden:](self->_progressBarView, "setHidden:", a3);
}

- (int64_t)progressStyle
{
  return self->_progressStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBottomConstraint, 0);
  objc_storeStrong((id *)&self->_progressHeightConstraint, 0);
  objc_storeStrong((id *)&self->_progressBarView, 0);
}

@end

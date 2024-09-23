@implementation RCPlatterCheckmarkView

- (RCPlatterCheckmarkView)initWithFrame:(CGRect)a3
{
  RCPlatterCheckmarkView *v3;
  RCPlatterCheckmarkView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPlatterCheckmarkView;
  v3 = -[RCPlatterCheckmarkView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCPlatterCheckmarkView _setupViews](v3, "_setupViews");
  return v4;
}

- (void)_setupViews
{
  RCPlatterStopButton *v3;
  RCPlatterStopButton *stopButton;
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
  _QWORD v18[4];

  v3 = -[RCPlatterStopButton initWithFrame:]([RCPlatterStopButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  stopButton = self->_stopButton;
  self->_stopButton = v3;

  -[RCPlatterCheckmarkView addSubview:](self, "addSubview:", self->_stopButton);
  -[RCPlatterStopButton setTranslatesAutoresizingMaskIntoConstraints:](self->_stopButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton centerYAnchor](self->_stopButton, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterCheckmarkView centerYAnchor](self, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v18[0] = v15;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton centerXAnchor](self->_stopButton, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterCheckmarkView centerXAnchor](self, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v18[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton heightAnchor](self->_stopButton, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterCheckmarkView heightAnchor](self, "heightAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v18[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterStopButton widthAnchor](self->_stopButton, "widthAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterCheckmarkView heightAnchor](self, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v18[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RCPlatterCheckmarkView;
  -[RCPlatterCheckmarkView layoutSubviews](&v9, "layoutSubviews");
  -[RCPlatterCheckmarkView bounds](self, "bounds");
  if (v3 != 0.0)
  {
    -[RCPlatterCheckmarkView bounds](self, "bounds");
    if (v4 != 0.0 && (id)-[RCPlatterStopButton state](self->_stopButton, "state") != (id)2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v5, "platterEmptyViewToCheckmarkTransitionDuration");
      v7 = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterCheckmarkView stopButton](self, "stopButton"));
      objc_msgSend(v8, "transitionToState:viaState:transitionDuration:", 2, 0, v7);

    }
  }
}

- (RCPlatterStopButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
  objc_storeStrong((id *)&self->_stopButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButton, 0);
}

@end

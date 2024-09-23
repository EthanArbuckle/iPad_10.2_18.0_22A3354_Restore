@implementation FlyoverStatusView

- (void)sv_commonInit
{
  double v3;
  double v4;
  FlyoverStatusDebouncer *v5;
  FlyoverStatusDebouncer *debouncer;

  +[FlyoverStatusToastView preferredSize](FlyoverStatusToastView, "preferredSize");
  -[FlyoverStatusView setBounds:](self, "setBounds:", 0.0, 0.0, v3, v4);
  -[FlyoverStatusView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[FlyoverStatusView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("FlyoverStatusView"));
  v5 = objc_alloc_init(FlyoverStatusDebouncer);
  debouncer = self->_debouncer;
  self->_debouncer = v5;

  -[FlyoverStatusDebouncer setDelegate:](self->_debouncer, "setDelegate:", self);
}

- (FlyoverStatusView)initWithCoder:(id)a3
{
  FlyoverStatusView *v3;
  FlyoverStatusView *v4;
  FlyoverStatusView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FlyoverStatusView;
  v3 = -[FlyoverStatusView initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[FlyoverStatusView sv_commonInit](v3, "sv_commonInit");
    v5 = v4;
  }

  return v4;
}

- (FlyoverStatusView)initWithFrame:(CGRect)a3
{
  FlyoverStatusView *v3;
  FlyoverStatusView *v4;
  FlyoverStatusView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FlyoverStatusView;
  v3 = -[FlyoverStatusView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FlyoverStatusView sv_commonInit](v3, "sv_commonInit");
    v5 = v4;
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  +[FlyoverStatusToastView preferredSize](FlyoverStatusToastView, "preferredSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)statusDebouncerOutputDidChange:(id)a3
{
  -[FlyoverStatusView setDebouncedTrackingStateReason:](self, "setDebouncedTrackingStateReason:", objc_msgSend(a3, "output"));
}

- (void)setTrackingStateReason:(unint64_t)a3
{
  self->_trackingStateReason = a3;
  -[FlyoverStatusDebouncer setInput:](self->_debouncer, "setInput:");
}

- (void)setDebouncedTrackingStateReason:(unint64_t)a3
{
  FlyoverStatusToastView *toastView;
  FlyoverStatusToastView *v5;
  _QWORD v6[5];

  if (self->_debouncedTrackingStateReason != a3)
  {
    self->_debouncedTrackingStateReason = a3;
    toastView = self->_toastView;
    if (toastView)
    {
      if (!-[FlyoverStatusToastView didDismiss](toastView, "didDismiss"))
      {
        v5 = self->_toastView;
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_100317D84;
        v6[3] = &unk_1011AC860;
        v6[4] = self;
        -[FlyoverStatusToastView dismissWithCompletionHandler:](v5, "dismissWithCompletionHandler:", v6);
      }
    }
    else
    {
      -[FlyoverStatusView presentNewToastIfNecessary](self, "presentNewToastIfNecessary");
    }
  }
}

- (void)presentNewToastIfNecessary
{
  FlyoverStatusToastView *v3;
  FlyoverStatusToastView *toastView;
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

  if (self->_debouncedTrackingStateReason - 2 <= 2)
  {
    v3 = -[FlyoverStatusToastView initWithTrackingStateReason:]([FlyoverStatusToastView alloc], "initWithTrackingStateReason:", self->_debouncedTrackingStateReason);
    toastView = self->_toastView;
    self->_toastView = v3;

    -[FlyoverStatusToastView setTranslatesAutoresizingMaskIntoConstraints:](self->_toastView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FlyoverStatusView addSubview:](self, "addSubview:", self->_toastView);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView topAnchor](self->_toastView, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusView topAnchor](self, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
    v18[0] = v15;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView leftAnchor](self->_toastView, "leftAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusView leftAnchor](self, "leftAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
    v18[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView bottomAnchor](self->_toastView, "bottomAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusView bottomAnchor](self, "bottomAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    v18[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView rightAnchor](self->_toastView, "rightAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusView rightAnchor](self, "rightAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    v18[3] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    -[FlyoverStatusView layoutIfNeeded](self, "layoutIfNeeded");
    -[FlyoverStatusToastView present](self->_toastView, "present");
  }
}

- (unint64_t)trackingStateReason
{
  return self->_trackingStateReason;
}

- (unint64_t)debouncedTrackingStateReason
{
  return self->_debouncedTrackingStateReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toastView, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
}

@end

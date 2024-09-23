@implementation RCRecordingCardView

- (RCRecordingCardView)initWithCoder:(id)a3
{
  RCRecordingCardView *v3;
  RCRecordingCardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCRecordingCardView;
  v3 = -[RCRecordingCardView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RCRecordingCardView _commonInit](v3, "_commonInit");
  return v4;
}

- (RCRecordingCardView)initWithFrame:(CGRect)a3
{
  RCRecordingCardView *v3;
  RCRecordingCardView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCRecordingCardView;
  v3 = -[RCRecordingCardView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCRecordingCardView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_styleView
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingCardBackgroundColor"));
  -[RCRecordingCardView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCRecordingCardView;
  -[RCRecordingCardView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardView hostedView](self, "hostedView"));
  -[RCRecordingCardView frame](self, "frame");
  objc_msgSend(v3, "setHostViewHeight:", v4);
  objc_msgSend(v3, "layoutSubviews");

}

- (void)setHostedView:(id)a3
{
  RCRecordingCardViewHostedViewProtocol **p_hostedView;
  id v5;
  id WeakRetained;
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
  id v19;

  p_hostedView = &self->_hostedView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_hostedView);
  objc_msgSend(WeakRetained, "removeFromSuperview");

  objc_storeWeak((id *)p_hostedView, v5);
  -[RCRecordingCardView addSubview:](self, "addSubview:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardView bottomAnchor](self, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  objc_msgSend(v9, "setActive:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  objc_msgSend(v13, "setActive:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardView leadingAnchor](self, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  objc_msgSend(v16, "setActive:", 1);

  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCardView trailingAnchor](self, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

}

- (int64_t)_commonOrientationForOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return qword_100186D18[a3 - 1];
}

- (RCRecordingCardViewHostedViewProtocol)hostedView
{
  return (RCRecordingCardViewHostedViewProtocol *)objc_loadWeakRetained((id *)&self->_hostedView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostedView);
}

@end

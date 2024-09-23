@implementation MapsProgressBarModalView

- (MapsProgressBarModalView)initWithFrame:(CGRect)a3
{
  MapsProgressBarModalView *v3;
  MapsProgressBarModalView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsProgressBarModalView;
  v3 = -[MapsProgressBarModalView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MapsProgressBarModalView _commonInit](v3, "_commonInit");
  return v4;
}

- (MapsProgressBarModalView)initWithCoder:(id)a3
{
  MapsProgressBarModalView *v3;
  MapsProgressBarModalView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsProgressBarModalView;
  v3 = -[MapsProgressBarModalView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[MapsProgressBarModalView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  UIView *v9;
  UIView *contentView;
  UIProgressView *v11;
  UIProgressView *progressView;
  UILabel *v13;
  UILabel *progressLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[13];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.95));
  -[MapsProgressBarModalView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (UIView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentView = self->_contentView;
  self->_contentView = v9;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (UIProgressView *)objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 1);
  progressView = self->_progressView;
  self->_progressView = v11;

  -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  progressLabel = self->_progressLabel;
  self->_progressLabel = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_progressLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_progressLabel, "setTextAlignment:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_progressLabel, "setTextColor:", v15);

  -[MapsProgressBarModalView addSubview:](self, "addSubview:", self->_contentView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_progressLabel);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_progressView);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_progressLabel, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v56[0] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_progressLabel, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView topAnchor](self->_progressView, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v56[1] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView bottomAnchor](self->_progressView, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v56[2] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_progressLabel, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v56[3] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_progressLabel, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v56[4] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView leadingAnchor](self->_progressView, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v56[5] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView trailingAnchor](self->_progressView, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v56[6] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_contentView, "centerYAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarModalView centerYAnchor](self, "centerYAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v56[7] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarModalView topAnchor](self, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v30));
  v56[8] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarModalView bottomAnchor](self, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v27));
  v56[9] = v26;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_contentView, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarModalView centerXAnchor](self, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v56[10] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarModalView leadingAnchor](self, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 8.0));
  v56[11] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsProgressBarModalView trailingAnchor](self, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -8.0));
  v56[12] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 13));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

}

- (void)setProgressTitle:(id)a3
{
  -[UILabel setText:](self->_progressLabel, "setText:", a3);
}

- (NSString)progressTitle
{
  return -[UILabel text](self->_progressLabel, "text");
}

- (void)setProgress:(float)a3
{
  -[UIProgressView setProgress:](self->_progressView, "setProgress:");
}

- (float)progress
{
  float result;

  -[UIProgressView progress](self->_progressView, "progress");
  return result;
}

- (void)setObservedProgress:(id)a3
{
  -[UIProgressView setObservedProgress:](self->_progressView, "setObservedProgress:", a3);
}

- (NSProgress)observedProgress
{
  return -[UIProgressView observedProgress](self->_progressView, "observedProgress");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

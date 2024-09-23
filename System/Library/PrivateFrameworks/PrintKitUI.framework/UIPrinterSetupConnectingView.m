@implementation UIPrinterSetupConnectingView

- (UIPrinterSetupConnectingView)initWithFrame:(CGRect)a3
{
  UIPrinterSetupConnectingView *v3;
  void *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIActivityIndicatorView *activityIndicator;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)UIPrinterSetupConnectingView;
  v3 = -[UIPrinterSetupConnectingView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterSetupConnectingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[UIPrinterSetupConnectingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIPrinterSetupConnectingView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v5;

    objc_msgSend(MEMORY[0x1E0DC37E8], "boldSystemFontOfSize:", 20.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v8);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[UILabel setShadowOffset:](v3->_label, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v3->_label, "setShadowColor:", v9);

    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](v3->_label, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[UILabel setPreferredMaxLayoutWidth:](v3->_label, "setPreferredMaxLayoutWidth:", 0.0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v10;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPrinterSetupConnectingView addSubview:](v3, "addSubview:", v3->_label);
    -[UIPrinterSetupConnectingView addSubview:](v3, "addSubview:", v3->_activityIndicator);
    v12 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPrinterSetupConnectingView addSubview:](v3, "addSubview:", v12);
    v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPrinterSetupConnectingView addSubview:](v3, "addSubview:", v13);
    v20[0] = CFSTR("label");
    v21[0] = v3->_label;
    v20[1] = CFSTR("activityIndicator");
    v21[1] = v3->_activityIndicator;
    v21[2] = v12;
    v20[2] = CFSTR("spacer1");
    v20[3] = CFSTR("spacer2");
    v21[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[label]-|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterSetupConnectingView addConstraints:](v3, "addConstraints:", v15);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[activityIndicator]-|"), 0, 0, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterSetupConnectingView addConstraints:](v3, "addConstraints:", v16);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[spacer1][label]-20-[activityIndicator][spacer2(==spacer1)]|"), 0, 0, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterSetupConnectingView addConstraints:](v3, "addConstraints:", v17);

    -[UIActivityIndicatorView startAnimating](v3->_activityIndicator, "startAnimating");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;
  objc_super v5;

  -[UILabel setPreferredMaxLayoutWidth:](self->_label, "setPreferredMaxLayoutWidth:", 0.0);
  v5.receiver = self;
  v5.super_class = (Class)UIPrinterSetupConnectingView;
  -[UIPrinterSetupConnectingView layoutSubviews](&v5, sel_layoutSubviews);
  -[UILabel bounds](self->_label, "bounds");
  -[UILabel setPreferredMaxLayoutWidth:](self->_label, "setPreferredMaxLayoutWidth:", v3);
  v4.receiver = self;
  v4.super_class = (Class)UIPrinterSetupConnectingView;
  -[UIPrinterSetupConnectingView layoutSubviews](&v4, sel_layoutSubviews);
}

- (void)presentView
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_presentationTime = v3;
  -[UIPrinterSetupConnectingView setHidden:](self, "setHidden:", 0);
}

- (void)willMoveToSuperview:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIPrinterSetupConnectingView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || !v4)
  {
    -[UIPrinterSetupConnectingView superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && !v7)
    {
      objc_msgSend(v8, "setUserInteractionEnabled:", 0);
      -[UIPrinterSetupConnectingView setHidden:](self, "setHidden:", 1);
      -[UIPrinterSetupConnectingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_presentView, 0, 0.5);
    }
  }
  else
  {
    objc_msgSend(0, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_presentView, 0);
    if ((-[UIPrinterSetupConnectingView isHidden](self, "isHidden") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v6 = v5 - self->_presentationTime;
      if (v6 < 1.0)
        usleep(((1.0 - v6) * 1000000.0));
    }
  }

}

- (void)setMessage:(id)a3 active:(BOOL)a4
{
  double v6;
  UIActivityIndicatorView *activityIndicator;
  id v8;

  if (a4)
    v6 = 1.0;
  else
    v6 = 0.0;
  activityIndicator = self->_activityIndicator;
  v8 = a3;
  -[UIActivityIndicatorView setAlpha:](activityIndicator, "setAlpha:", v6);
  -[UILabel setText:](self->_label, "setText:", v8);

  if (!a4)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_presentView, 0);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (double)presentationTime
{
  return self->_presentationTime;
}

- (void)setPresentationTime:(double)a3
{
  self->_presentationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

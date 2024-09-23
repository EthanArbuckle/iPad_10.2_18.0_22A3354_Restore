@implementation VUILoadingView

- (void)startTimer
{
  UIActivityIndicatorView *indicatorView;
  double v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  indicatorView = self->_indicatorView;
  -[VUILoadingView delay](self, "delay");
  -[UIActivityIndicatorView performSelector:withObject:afterDelay:](indicatorView, "performSelector:withObject:afterDelay:", sel_startAnimating, 0);
  objc_initWeak(&location, self);
  -[VUILoadingView delay](self, "delay");
  v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__VUILoadingView_startTimer__block_invoke;
  v6[3] = &unk_1E9F99C98;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidX;
  double v18;
  double v19;
  double MidY;
  double v21;
  double v22;
  double v23;
  double v24;
  VUILabel *loadingLabel;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  VUILabel *loadingMessageLabel;
  double MaxY;
  double v36;
  VUILabel *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[VUILoadingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIActivityIndicatorView sizeToFit](self->_indicatorView, "sizeToFit");
  v11 = 0.0;
  if (objc_msgSend(MEMORY[0x1E0DC69E0], "isUniquelyiPadEnabled"))
  {
    -[VUILoadingView safeAreaInsets](self, "safeAreaInsets");
    v13 = v12;
    v15 = v14;
    if (-[VUILoadingView vuiIsRTL](self, "vuiIsRTL"))
      v16 = v15;
    else
      v16 = v13;
    v11 = v16 * 0.5;
  }
  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  MidX = CGRectGetMidX(v44);
  -[UIActivityIndicatorView bounds](self->_indicatorView, "bounds");
  v19 = v11 + MidX + v18 * -0.5;
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  MidY = CGRectGetMidY(v45);
  -[UIActivityIndicatorView bounds](self->_indicatorView, "bounds");
  v22 = MidY - (v21 + 4.5);
  -[UIActivityIndicatorView bounds](self->_indicatorView, "bounds");
  v24 = v23;
  -[UIActivityIndicatorView bounds](self->_indicatorView, "bounds");
  -[UIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", v19, v22, v24);
  loadingLabel = self->_loadingLabel;
  v43 = v11;
  if (loadingLabel)
  {
    -[VUILabel sizeToFit](loadingLabel, "sizeToFit");
    v46.origin.x = v4;
    v46.origin.y = v6;
    v46.size.width = v8;
    v46.size.height = v10;
    v26 = CGRectGetMidX(v46);
    -[VUILabel bounds](self->_loadingLabel, "bounds");
    v28 = v11 + v26 + v27 * -0.5;
    v47.origin.x = v4;
    v47.origin.y = v6;
    v47.size.width = v8;
    v47.size.height = v10;
    v29 = CGRectGetMidY(v47) + 4.5;
    -[VUILabel bounds](self->_loadingLabel, "bounds");
    v31 = v30;
    -[VUILabel bounds](self->_loadingLabel, "bounds");
    v33 = v32;
    -[VUILabel setFrame:](self->_loadingLabel, "setFrame:", v28, v29, v31);
  }
  else
  {
    v28 = *MEMORY[0x1E0C9D648];
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  loadingMessageLabel = self->_loadingMessageLabel;
  if (loadingMessageLabel)
  {
    -[VUILabel sizeToFit](loadingMessageLabel, "sizeToFit");
    v48.origin.x = v28;
    v48.origin.y = v29;
    v48.size.width = v31;
    v48.size.height = v33;
    MaxY = CGRectGetMaxY(v48);
    v49.origin.x = v4;
    v49.origin.y = v6;
    v49.size.width = v8;
    v49.size.height = v10;
    v36 = CGRectGetMidY(v49);
    if (MaxY < v36)
      MaxY = v36;
    v37 = self->_loadingMessageLabel;
    v50.origin.x = v4;
    v50.origin.y = v6;
    v50.size.width = v8;
    v50.size.height = v10;
    v38 = CGRectGetMidX(v50);
    -[VUILabel bounds](self->_loadingMessageLabel, "bounds");
    v40 = v43 + v38 + v39 * -0.5;
    -[VUILabel bounds](self->_loadingMessageLabel, "bounds");
    v42 = v41;
    -[VUILabel bounds](self->_loadingMessageLabel, "bounds");
    -[VUILabel setFrame:](v37, "setFrame:", v40, MaxY + 4.5, v42);
  }
}

- (VUILoadingView)initWithFrame:(CGRect)a3 loadingTitle:(id)a4 loadingMessage:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  VUILoadingView *v13;
  VUILoadingView *v14;
  void *v15;
  uint64_t v16;
  UIActivityIndicatorView *indicatorView;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VUILoadingView;
  v13 = -[VUILoadingView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_delay = 1.5;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUILoadingView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    indicatorView = v14->_indicatorView;
    v14->_indicatorView = (UIActivityIndicatorView *)v16;

    -[VUILoadingView _setupLabels:message:](v14, "_setupLabels:message:", v11, v12);
    -[VUILoadingView addSubview:](v14, "addSubview:", v14->_indicatorView);
  }

  return v14;
}

- (double)delay
{
  return self->_delay;
}

- (void)configureTitleTextLayout:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setTextStyle:", 2);
  objc_msgSend(v3, "setFontWeight:", 10);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

}

- (void)configureMessageTextLayout:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setTextStyle:", 14);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

}

- (void)_setupLabels:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  VUITextLayout *v11;
  VUILabel *v12;
  VUILabel *loadingLabel;
  VUITextLayout *v14;
  VUILabel *v15;
  VUILabel *loadingMessageLabel;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v17)
  {
    v7 = v17;
    v8 = v6;
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", CFSTR("LOADING"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v6;
    if (!v7)
      goto LABEL_5;
  }
  v11 = objc_alloc_init(VUITextLayout);
  -[VUILoadingView configureTitleTextLayout:](self, "configureTitleTextLayout:", v11);
  objc_storeStrong((id *)&self->_loadingTitle, v7);
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", self->_loadingTitle, v11, 0);
  v12 = (VUILabel *)objc_claimAutoreleasedReturnValue();
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v12;

  -[VUILabel setHidden:](self->_loadingLabel, "setHidden:", 1);
  -[VUILoadingView addSubview:](self, "addSubview:", self->_loadingLabel);

LABEL_5:
  if (v6)
  {
    v14 = objc_alloc_init(VUITextLayout);
    -[VUILoadingView configureMessageTextLayout:](self, "configureMessageTextLayout:", v14);
    objc_storeStrong((id *)&self->_loadingMessage, a4);
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", self->_loadingMessage, v14, 0);
    v15 = (VUILabel *)objc_claimAutoreleasedReturnValue();
    loadingMessageLabel = self->_loadingMessageLabel;
    self->_loadingMessageLabel = v15;

    -[VUILabel setHidden:](self->_loadingMessageLabel, "setHidden:", 1);
    -[VUILoadingView addSubview:](self, "addSubview:", self->_loadingMessageLabel);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingMessage, 0);
  objc_storeStrong((id *)&self->_loadingMessageLabel, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingTitle, 0);
  objc_storeStrong((id *)&self->_messageTextLayout, 0);
  objc_storeStrong((id *)&self->_titleTextLayout, 0);
}

- (VUILoadingView)initWithFrame:(CGRect)a3 loadingTitle:(id)a4
{
  return -[VUILoadingView initWithFrame:loadingTitle:loadingMessage:](self, "initWithFrame:loadingTitle:loadingMessage:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setTitleTextLayout:(id)a3
{
  void *v5;
  VUILabel *v6;
  VUILabel *loadingLabel;
  VUITextLayout *v8;

  v8 = (VUITextLayout *)a3;
  if (self->_titleTextLayout != v8)
  {
    objc_storeStrong((id *)&self->_titleTextLayout, a3);
    -[VUILoadingView loadingTitle](self, "loadingTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v5, v8, self->_loadingLabel);
    v6 = (VUILabel *)objc_claimAutoreleasedReturnValue();
    loadingLabel = self->_loadingLabel;
    self->_loadingLabel = v6;

    -[VUILabel setNeedsDisplay](self->_loadingLabel, "setNeedsDisplay");
  }

}

- (void)setMessageTextLayout:(id)a3
{
  void *v5;
  VUILabel *v6;
  VUILabel *loadingMessageLabel;
  VUITextLayout *v8;

  v8 = (VUITextLayout *)a3;
  if (self->_messageTextLayout != v8)
  {
    objc_storeStrong((id *)&self->_messageTextLayout, a3);
    -[VUILoadingView loadingMessage](self, "loadingMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v5, v8, self->_loadingMessageLabel);
    v6 = (VUILabel *)objc_claimAutoreleasedReturnValue();
    loadingMessageLabel = self->_loadingMessageLabel;
    self->_loadingMessageLabel = v6;

    -[VUILabel setNeedsDisplay](self->_loadingMessageLabel, "setNeedsDisplay");
  }

}

void __28__VUILoadingView_startTimer__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loadingLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "loadingLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidden:", 0);

  }
  objc_msgSend(WeakRetained, "loadingMessageLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "loadingMessageLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

  }
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (VUITextLayout)titleTextLayout
{
  return self->_titleTextLayout;
}

- (VUITextLayout)messageTextLayout
{
  return self->_messageTextLayout;
}

- (NSString)loadingTitle
{
  return self->_loadingTitle;
}

- (void)setLoadingTitle:(id)a3
{
  objc_storeStrong((id *)&self->_loadingTitle, a3);
}

- (VUILabel)loadingLabel
{
  return self->_loadingLabel;
}

- (void)setLoadingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_loadingLabel, a3);
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorView, a3);
}

- (VUILabel)loadingMessageLabel
{
  return self->_loadingMessageLabel;
}

- (void)setLoadingMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_loadingMessageLabel, a3);
}

- (NSString)loadingMessage
{
  return self->_loadingMessage;
}

- (void)setLoadingMessage:(id)a3
{
  objc_storeStrong((id *)&self->_loadingMessage, a3);
}

@end

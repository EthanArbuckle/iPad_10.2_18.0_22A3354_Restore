@implementation ICQCloudStorageMeteredBarButtonView

+ (id)barButtonItemWithString:(id)a3 andPercentUsed:(double)a4
{
  id v5;
  ICQCloudStorageMeteredBarButtonView *v6;
  void *v7;

  v5 = a3;
  v6 = -[ICQCloudStorageMeteredBarButtonView initWithString:andPercentUsed:]([ICQCloudStorageMeteredBarButtonView alloc], "initWithString:andPercentUsed:", v5, a4);

  -[ICQCloudStorageMeteredBarButtonView setNeedsLayout](v6, "setNeedsLayout");
  -[ICQCloudStorageMeteredBarButtonView layoutIfNeeded](v6, "layoutIfNeeded");
  -[ICQCloudStorageMeteredBarButtonView sizeToFit](v6, "sizeToFit");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v6);

  return v7;
}

- (ICQCloudStorageMeteredBarButtonView)initWithString:(id)a3 andPercentUsed:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  ICQCloudStorageMeteredBarButtonView *v11;
  uint64_t v12;
  UILabel *storageString;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIProgressView *progressBar;
  UIProgressView *v19;
  void *v20;
  double v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICQCloudStorageMeteredBarButtonView;
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v11 = -[ICQCloudStorageMeteredBarButtonView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x24BDBF090], v8, v9, v10);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v7, v8, v9, v10);
    storageString = v11->_storageString;
    v11->_storageString = (UILabel *)v12;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11->_storageString, "setFont:", v14);

    PSToolbarLabelsTextColor();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11->_storageString, "setTextColor:", v15);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11->_storageString, "setBackgroundColor:", v16);

    -[UILabel setTextAlignment:](v11->_storageString, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v11->_storageString, "setLineBreakMode:", 4);
    -[UILabel setText:](v11->_storageString, "setText:", v6);
    -[UILabel sizeToFit](v11->_storageString, "sizeToFit");
    -[ICQCloudStorageMeteredBarButtonView addSubview:](v11, "addSubview:", v11->_storageString);
    v11->_percentUsed = fmin(a4, 1.0);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD8A0]), "initWithProgressViewStyle:", 1);
    progressBar = v11->_progressBar;
    v11->_progressBar = (UIProgressView *)v17;

    v19 = v11->_progressBar;
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView setTrackTintColor:](v19, "setTrackTintColor:", v20);

    *(float *)&v21 = a4;
    -[UIProgressView setProgress:](v11->_progressBar, "setProgress:", v21);
    if (v11->_percentUsed >= 0.949999988)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIProgressView setProgressTintColor:](v11->_progressBar, "setProgressTintColor:", v22);

    }
    -[ICQCloudStorageMeteredBarButtonView addSubview:](v11, "addSubview:", v11->_progressBar);
  }

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;

  -[ICQCloudStorageMeteredBarButtonView bounds](self, "bounds");
  v4 = v3;
  -[UILabel frame](self->_storageString, "frame");
  v6 = v5;
  v7 = v4;
  v8 = ceilf(v7);
  v9 = v8;
  v10 = floor((282.0 - v8) * 0.5);
  if (v8 >= 282.0)
    v11 = 0.0;
  else
    v11 = v10;
  v12 = floor((v9 + -282.0) * 0.5);
  if (v8 >= 282.0)
    v13 = v12;
  else
    v13 = 0.0;
  -[UILabel setFrame:](self->_storageString, "setFrame:", v11, 0.0, v9, v5);
  -[UIProgressView frame](self->_progressBar, "frame");
  v15 = v14;
  v16.origin.y = 0.0;
  v16.origin.x = v11;
  v16.size.width = v9;
  v16.size.height = v6;
  -[UIProgressView setFrame:](self->_progressBar, "setFrame:", v13, CGRectGetMaxY(v16) + 4.0, 282.0, v15);
}

- (void)sizeToFit
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[UIProgressView frame](self->_progressBar, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel frame](self->_storageString, "frame");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v16 = CGRectUnion(v15, v17);
  -[ICQCloudStorageMeteredBarButtonView setBounds:](self, "setBounds:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_storageString, 0);
}

@end

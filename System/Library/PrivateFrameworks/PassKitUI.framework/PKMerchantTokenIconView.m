@implementation PKMerchantTokenIconView

- (PKMerchantTokenIconView)initWithFrame:(CGRect)a3
{
  PKMerchantTokenIconView *v3;
  PKMerchantTokenIconView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenIconView;
  v3 = -[PKMerchantTokenIconView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKMerchantTokenIconView _setUpViews](v3, "_setUpViews");
    -[PKMerchantTokenIconView _setUpConstraints](v4, "_setUpConstraints");
  }
  return v4;
}

- (void)updateWithImage:(id)a3 cornerRadius:(double)a4
{
  UIImage *v6;
  UIImage *image;

  v6 = (UIImage *)a3;
  -[PKMerchantTokenIconView _cancelImageDownload](self, "_cancelImageDownload");
  image = self->_image;
  self->_image = v6;

  self->_cornerRadius = a4;
  -[PKMerchantTokenIconView _updateIconImage](self, "_updateIconImage");
}

- (void)updateWithImageURL:(id)a3 monogramText:(id)a4 cornerRadius:(double)a5
{
  id v8;
  UIImage *image;
  id v10;

  v8 = a4;
  v10 = a3;
  -[PKMerchantTokenIconView _cancelImageDownload](self, "_cancelImageDownload");
  image = self->_image;
  self->_image = 0;

  self->_cornerRadius = a5;
  -[PKMerchantTokenIconView _updateMonogramLabelWithText:](self, "_updateMonogramLabelWithText:", v8);

  -[PKMerchantTokenIconView _updateIconImage](self, "_updateIconImage");
  -[PKMerchantTokenIconView _downloadImageFromURL:](self, "_downloadImageFromURL:", v10);

}

- (void)_setUpViews
{
  -[PKMerchantTokenIconView _setUpSelf](self, "_setUpSelf");
  -[PKMerchantTokenIconView _setUpMonogramLabel](self, "_setUpMonogramLabel");
}

- (void)_setUpSelf
{
  id v3;
  id v4;

  -[PKMerchantTokenIconView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[PKMerchantTokenIconView setContentMode:](self, "setContentMode:", 2);
  -[PKMerchantTokenIconView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v3, "CGColor"));

}

- (void)_setUpMonogramLabel
{
  id v3;
  UILabel *v4;
  UILabel *monogramLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  monogramLabel = self->_monogramLabel;
  self->_monogramLabel = v4;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_monogramLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = self->_monogramLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v6, "setTextColor:", v7);

  -[UILabel setTextAlignment:](self->_monogramLabel, "setTextAlignment:", 1);
  v8 = self->_monogramLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 100.0, *MEMORY[0x1E0DC1438]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_monogramLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->_monogramLabel, "setMinimumScaleFactor:", 0.01);
  -[PKMerchantTokenIconView addSubview:](self, "addSubview:", self->_monogramLabel);
}

- (void)_setUpConstraints
{
  void *v3;
  void *v4;
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
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel centerYAnchor](self->_monogramLabel, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenIconView centerYAnchor](self, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  -[UILabel heightAnchor](self->_monogramLabel, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenIconView heightAnchor](self, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:multiplier:", v4, 0.715);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  -[UILabel leadingAnchor](self->_monogramLabel, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenIconView leadingAnchor](self, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  -[UILabel trailingAnchor](self->_monogramLabel, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMerchantTokenIconView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)_updateMonogramLabelWithText:(id)a3
{
  uint64_t v4;
  UILabel *monogramLabel;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  monogramLabel = self->_monogramLabel;
  if (v4)
  {
    objc_msgSend(v7, "substringWithRange:", 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](monogramLabel, "setText:", v6);

  }
  else
  {
    -[UILabel setText:](monogramLabel, "setText:", &stru_1E3E7D690);
  }

}

- (void)_updateIconImage
{
  UIImage *image;
  void *v4;
  void *v5;
  UIImage *v6;
  void *v7;
  void *v8;

  image = self->_image;
  if (image)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchantTokenIconView setBackgroundColor:](self, "setBackgroundColor:", v4);

    -[PKMerchantTokenIconView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[PKMerchantTokenIconView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderWidth:", PKUIPixelLength());

    v6 = self->_image;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMerchantTokenIconView setBackgroundColor:](self, "setBackgroundColor:", v7);

    -[PKMerchantTokenIconView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[PKMerchantTokenIconView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderWidth:", PKUIPixelLength());

    v6 = 0;
  }
  -[PKMerchantTokenIconView setImage:](self, "setImage:", v6);
  -[UILabel setHidden:](self->_monogramLabel, "setHidden:", image != 0);
}

- (void)_downloadImageFromURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__62;
  v14 = __Block_byref_object_dispose__62;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke;
  v8[3] = &unk_1E3E79068;
  objc_copyWeak(&v9, &location);
  v8[4] = &v10;
  objc_msgSend(v5, "dataTaskWithURL:completionHandler:", v4, v8);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v11[5];
  v11[5] = v6;

  objc_storeStrong((id *)&self->_imageDownloadTask, (id)v11[5]);
  objc_msgSend((id)v11[5], "resume");
  objc_destroyWeak(&v9);
  _Block_object_dispose(&v10, 8);

  objc_destroyWeak(&location);
}

void __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  if (!a4 && objc_msgSend(a3, "statusCode") == 200)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke_2;
    block[3] = &unk_1E3E6D160;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v10 = *(_QWORD *)(a1 + 32);
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v11);
  }

}

void __49__PKMerchantTokenIconView__downloadImageFromURL___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[67] == *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = WeakRetained;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", *(_QWORD *)(a1 + 32));
    if (v3)
    {
      objc_storeStrong(v4 + 65, v3);
      objc_msgSend(v4, "_updateIconImage");
    }

    WeakRetained = v4;
  }

}

- (void)_cancelImageDownload
{
  NSURLSessionDataTask *imageDownloadTask;

  -[NSURLSessionDataTask cancel](self->_imageDownloadTask, "cancel");
  imageDownloadTask = self->_imageDownloadTask;
  self->_imageDownloadTask = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloadTask, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);
}

@end

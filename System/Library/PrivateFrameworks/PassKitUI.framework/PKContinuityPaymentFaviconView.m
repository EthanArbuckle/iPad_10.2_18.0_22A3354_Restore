@implementation PKContinuityPaymentFaviconView

- (PKContinuityPaymentFaviconView)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));

  return 0;
}

- (PKContinuityPaymentFaviconView)initWithFrame:(CGRect)a3
{
  return -[PKContinuityPaymentFaviconView initWithFrame:URL:modelIdentifier:merchantName:](self, "initWithFrame:URL:modelIdentifier:merchantName:", 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKContinuityPaymentFaviconView)initWithFrame:(CGRect)a3 URL:(id)a4 modelIdentifier:(id)a5 merchantName:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  PKContinuityPaymentFaviconView *v16;
  uint64_t v17;
  NSString *merchantName;
  uint64_t v19;
  NSString *modelIdentifier;
  uint64_t v21;
  NSURLSession *urlSession;
  PKShapeView *v23;
  PKShapeView *maskView;
  uint64_t v25;
  UIImageView *macImageView;
  void *v27;
  void *v28;
  uint64_t v29;
  UIView *imageShadowView;
  void *v31;
  id v32;
  double v33;
  uint64_t v34;
  UIImageView *imageView;
  void *v36;
  void *v37;
  uint64_t v38;
  UIView *monogramView;
  void *v40;
  NSURLSession *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *, void *, void *);
  void *v47;
  id v48;
  PKContinuityPaymentFaviconView *v49;
  id v50;
  id location;
  objc_super v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v52.receiver = self;
  v52.super_class = (Class)PKContinuityPaymentFaviconView;
  v16 = -[PKContinuityPaymentFaviconView initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    merchantName = v16->_merchantName;
    v16->_merchantName = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    modelIdentifier = v16->_modelIdentifier;
    v16->_modelIdentifier = (NSString *)v19;

    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v21 = objc_claimAutoreleasedReturnValue();
    urlSession = v16->_urlSession;
    v16->_urlSession = (NSURLSession *)v21;

    v23 = objc_alloc_init(PKShapeView);
    maskView = v16->_maskView;
    v16->_maskView = v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    macImageView = v16->_macImageView;
    v16->_macImageView = (UIImageView *)v25;

    -[UIImageView setContentMode:](v16->_macImageView, "setContentMode:", 1);
    -[PKContinuityPaymentFaviconView _loadMacImage](v16, "_loadMacImage");
    -[PKContinuityPaymentFaviconView layer](v16, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAllowsGroupOpacity:", 0);

    -[PKContinuityPaymentFaviconView layer](v16, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsGroupBlending:", 0);

    -[PKContinuityPaymentFaviconView addSubview:](v16, "addSubview:", v16->_macImageView);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    imageShadowView = v16->_imageShadowView;
    v16->_imageShadowView = (UIView *)v29;

    -[PKContinuityPaymentFaviconView addSubview:](v16, "addSubview:", v16->_imageShadowView);
    -[UIView layer](v16->_imageShadowView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v31, "setShadowColor:", objc_msgSend(v32, "CGColor"));

    LODWORD(v33) = 1050253722;
    objc_msgSend(v31, "setShadowOpacity:", v33);
    objc_msgSend(v31, "setShadowRadius:", 1.0);
    objc_msgSend(v31, "setMasksToBounds:", 0);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    imageView = v16->_imageView;
    v16->_imageView = (UIImageView *)v34;

    -[UIImageView setContentMode:](v16->_imageView, "setContentMode:", 2);
    -[UIImageView layer](v16->_imageView, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMasksToBounds:", 1);

    -[UIImageView layer](v16->_imageView, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCornerRadius:", 5.0);

    -[PKContinuityPaymentFaviconView addSubview:](v16, "addSubview:", v16->_imageView);
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    monogramView = v16->_monogramView;
    v16->_monogramView = (UIView *)v38;

    -[UIView layer](v16->_monogramView, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCornerRadius:", 5.0);

    if (v13)
    {
      objc_initWeak(&location, v16->_imageView);
      v41 = v16->_urlSession;
      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke;
      v47 = &unk_1E3E67620;
      objc_copyWeak(&v50, &location);
      v48 = v13;
      v49 = v16;
      -[NSURLSession dataTaskWithURL:completionHandler:](v41, "dataTaskWithURL:completionHandler:", v48, &v44);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "resume", v44, v45, v46, v47);

      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PKContinuityPaymentFaviconView _setupMonogram](v16, "_setupMonogram");
    }

  }
  return v16;
}

void __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 || objc_msgSend(v8, "statusCode") != 200)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't load favicon: %@", buf, 0xCu);
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Error: %@", buf, 0xCu);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_8;
    v14[3] = &unk_1E3E612E8;
    v10 = &v15;
    v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v14);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_2;
    block[3] = &unk_1E3E612C0;
    v10 = &v17;
    v17 = v7;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v18);
  }

}

void __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", *(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_3;
    v5[3] = &unk_1E3E61B68;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6 = v2;
    objc_msgSend(v3, "transitionWithView:duration:options:animations:completion:", WeakRetained, 5242880, v5, 0, 0.3);

    objc_destroyWeak(&v7);
  }

}

void __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setImage:", *(_QWORD *)(a1 + 32));

}

uint64_t __81__PKContinuityPaymentFaviconView_initWithFrame_URL_modelIdentifier_merchantName___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupMonogram");
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentFaviconView;
  -[PKContinuityPaymentFaviconView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  UIImageView *macImageView;
  double v4;
  void *v5;
  id v6;
  uint64_t v7;
  double MidX;
  double MidY;
  double v10;
  UIView *imageShadowView;
  void *v12;
  UIView *monogramView;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)PKContinuityPaymentFaviconView;
  -[PKContinuityPaymentFaviconView layoutSubviews](&v14, sel_layoutSubviews);
  macImageView = self->_macImageView;
  -[PKContinuityPaymentFaviconView bounds](self, "bounds");
  -[UIImageView setFrame:](macImageView, "setFrame:");
  if (-[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("iMac")))
    v4 = 50.0;
  else
    v4 = 60.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v4, v4);
  v5 = (void *)MEMORY[0x1E0DC3508];
  -[UIImageView bounds](self->_imageView, "bounds");
  objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGPath");

  -[UIImageView frame](self->_macImageView, "frame");
  MidX = CGRectGetMidX(v15);
  -[UIImageView frame](self->_macImageView, "frame");
  MidY = CGRectGetMidY(v16);
  -[PKContinuityPaymentFaviconView _iconVerticalOffset](self, "_iconVerticalOffset");
  -[UIImageView setCenter:](self->_imageView, "setCenter:", MidX, MidY + v10);
  imageShadowView = self->_imageShadowView;
  -[UIImageView frame](self->_imageView, "frame");
  -[UIView setFrame:](imageShadowView, "setFrame:");
  -[UIView layer](self->_imageShadowView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowPath:", v7);

  monogramView = self->_monogramView;
  -[UIImageView frame](self->_imageView, "frame");
  -[UIView setFrame:](monogramView, "setFrame:");
}

- (void)_setupMonogram
{
  UIView *monogramView;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  monogramView = self->_monogramView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](monogramView, "setBackgroundColor:", v4);

  -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  v5 = objc_alloc(MEMORY[0x1E0DC3990]);
  -[UIView bounds](self->_monogramView, "bounds");
  v9 = (id)objc_msgSend(v5, "initWithFrame:");
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 38.0, *MEMORY[0x1E0DC1440]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

  objc_msgSend(v9, "setTextAlignment:", 1);
  if (-[NSString length](self->_merchantName, "length"))
  {
    -[NSString substringWithRange:](self->_merchantName, "substringWithRange:", 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
  -[UIView addSubview:](self->_monogramView, "addSubview:", v9);
  -[PKContinuityPaymentFaviconView addSubview:](self, "addSubview:", self->_monogramView);
  -[PKContinuityPaymentFaviconView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_loadMacImage
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("MacBookPro"))
    || -[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("MacBookAir"))
    || -[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("MacBook")))
  {
    v3 = CFSTR("laptopcomputer");
  }
  else if (-[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("iMac")))
  {
    v3 = CFSTR("desktopcomputer");
  }
  else
  {
    v3 = CFSTR("display");
  }
  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_configurationWithHierarchicalColors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageByApplyingSymbolConfiguration:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageByApplyingSymbolConfiguration:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_macImageView, "setImage:", v11);
}

- (double)_iconVerticalOffset
{
  double v3;

  v3 = 0.0;
  if (!-[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("MacBookPro"))
    && !-[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("MacBookAir"))
    && !-[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("MacBook")))
  {
    if (-[NSString containsString:](self->_modelIdentifier, "containsString:", CFSTR("iMac")))
      return -22.0;
    else
      return -11.0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_imageShadowView, 0);
  objc_storeStrong((id *)&self->_monogramView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_macImageView, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end

@implementation ICQLegacyBannerView

- (ICQLegacyBannerView)initWithFrame:(CGRect)a3
{
  ICQLegacyBannerView *v3;
  ICQLegacyBannerView *v4;
  void *v5;

  v3 = -[ICQLegacyBannerView _initWithFrame:offer:](self, "_initWithFrame:offer:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ICQLegacyBannerView _getOffer](v3, "_getOffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLegacyBannerView setOffer:](v4, "setOffer:", v5);

  }
  return v4;
}

- (ICQLegacyBannerView)initWithOffer:(id)a3
{
  id v4;
  ICQLegacyBannerView *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  UIColor *titleColor;
  uint64_t v15;
  UIColor *detailMessageColor;
  uint64_t v17;
  UIColor *linkTextColor;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UIFont *titleFont;
  void *v29;
  uint64_t v30;
  UIFont *detailMessageFont;
  void *v32;
  uint64_t v33;
  UIFont *linkMessageFont;
  NSObject *v40;
  _QWORD block[4];
  ICQLegacyBannerView *v43;
  uint8_t buf[8];
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ICQLegacyBannerView _initWithFrame:offer:](self, "_initWithFrame:offer:", v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "initializing Freshmint Banner View", buf, 2u);
    }

    -[ICQLegacyBannerView setOffer:](v5, "setOffer:", v4);
    -[ICQLegacyBannerView offer](v5, "offer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bannerSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isDetailBannerInfoAvailable"))
    {
      -[ICQLegacyBannerView offer](v5, "offer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

      if (v11)
      {
        -[ICQLegacyBannerView layer](v5, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCornerRadius:", 14.0);

        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v13 = objc_claimAutoreleasedReturnValue();
        titleColor = v5->_titleColor;
        v5->_titleColor = (UIColor *)v13;

        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v15 = objc_claimAutoreleasedReturnValue();
        detailMessageColor = v5->_detailMessageColor;
        v5->_detailMessageColor = (UIColor *)v15;

        objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
        v17 = objc_claimAutoreleasedReturnValue();
        linkTextColor = v5->_linkTextColor;
        v5->_linkTextColor = (UIColor *)v17;

        objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE220]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *MEMORY[0x24BEBB590];
        v45 = *MEMORY[0x24BEBB620];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB610]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "fontDescriptorByAddingAttributes:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v19, 0.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v23, 0.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "scaledFontForFont:", v25);
        v27 = objc_claimAutoreleasedReturnValue();
        titleFont = v5->_titleFont;
        v5->_titleFont = (UIFont *)v27;

        objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "scaledFontForFont:", v24);
        v30 = objc_claimAutoreleasedReturnValue();
        detailMessageFont = v5->_detailMessageFont;
        v5->_detailMessageFont = (UIFont *)v30;

        objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "scaledFontForFont:", v24);
        v33 = objc_claimAutoreleasedReturnValue();
        linkMessageFont = v5->_linkMessageFont;
        v5->_linkMessageFont = (UIFont *)v33;

        v5->_textLineSpacing = 2.0;
        __asm { FMOV            V0.2D, #12.0 }
        *(_OWORD *)&v5->_textMargins.top = _Q0;
        *(_OWORD *)&v5->_textMargins.bottom = _Q0;
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          -[ICQLegacyBannerView updateBannerView](v5, "updateBannerView");
        }
        else
        {
          _ICQGetLogSystem();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[ICQLegacyBannerView initWithOffer:].cold.1(v40);

          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __37__ICQLegacyBannerView_initWithOffer___block_invoke;
          block[3] = &unk_24E3F3610;
          v43 = v5;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

        }
      }
    }

  }
  return v5;
}

uint64_t __37__ICQLegacyBannerView_initWithOffer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBannerView");
}

- (id)_initWithFrame:(CGRect)a3 offer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  ICQLegacyBannerView *v10;
  void *v11;
  double v12;
  uint64_t v13;
  UIFont *font;
  void *v15;
  void *v16;
  uint64_t v17;
  UIFont *titleFont;
  void *v19;
  void *v20;
  uint64_t v21;
  UIFont *detailMessageFont;
  void *v23;
  void *v24;
  uint64_t v25;
  UIFont *linkMessageFont;
  uint64_t v27;
  UIColor *titleColor;
  uint64_t v29;
  UIColor *detailMessageColor;
  uint64_t v31;
  UIColor *linkMessageColor;
  uint64_t v33;
  UIColor *textColor;
  void *v35;
  int v36;
  double v37;
  double v38;
  _ICQTextView *v39;
  uint64_t v40;
  _ICQTextView *textView;
  void *v42;
  objc_super v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v44.receiver = self;
  v44.super_class = (Class)ICQLegacyBannerView;
  v10 = -[ICQLegacyBannerView initWithFrame:](&v44, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLegacyBannerView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = *MEMORY[0x24BEBB608];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BEBB608]);
    v13 = objc_claimAutoreleasedReturnValue();
    font = v10->_font;
    v10->_font = (UIFont *)v13;

    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BEBB600]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scaledFontForFont:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    titleFont = v10->_titleFont;
    v10->_titleFont = (UIFont *)v17;

    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scaledFontForFont:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    detailMessageFont = v10->_detailMessageFont;
    v10->_detailMessageFont = (UIFont *)v21;

    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scaledFontForFont:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    linkMessageFont = v10->_linkMessageFont;
    v10->_linkMessageFont = (UIFont *)v25;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v27 = objc_claimAutoreleasedReturnValue();
    titleColor = v10->_titleColor;
    v10->_titleColor = (UIColor *)v27;

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v29 = objc_claimAutoreleasedReturnValue();
    detailMessageColor = v10->_detailMessageColor;
    v10->_detailMessageColor = (UIColor *)v29;

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v31 = objc_claimAutoreleasedReturnValue();
    linkMessageColor = v10->_linkMessageColor;
    v10->_linkMessageColor = (UIColor *)v31;

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v33 = objc_claimAutoreleasedReturnValue();
    textColor = v10->_textColor;
    v10->_textColor = (UIColor *)v33;

    v10->_textAlignment = 1;
    v10->_textLineSpacing = 1.5;
    objc_msgSend(v9, "bundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

    v37 = 10.0;
    if (v36)
      v37 = 12.0;
    v38 = 5.0;
    if (v36)
      v38 = 12.0;
    v10->_textMargins.top = v38;
    v10->_textMargins.leading = 25.0;
    v10->_textMargins.bottom = v37;
    v10->_textMargins.trailing = 25.0;
    v39 = [_ICQTextView alloc];
    v40 = -[_ICQTextView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textView = v10->_textView;
    v10->_textView = (_ICQTextView *)v40;

    -[_ICQTextView setTranslatesAutoresizingMaskIntoConstraints:](v10->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQTextView setBackgroundColor:](v10->_textView, "setBackgroundColor:", v42);

    -[_ICQTextView setTextContainerInset:](v10->_textView, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
    -[_ICQTextView setDelegate:](v10->_textView, "setDelegate:", v10);
    -[ICQLegacyBannerView addSubview:](v10, "addSubview:", v10->_textView);
    -[ICQLegacyBannerView _updateBannerViewConstraints](v10, "_updateBannerViewConstraints");
  }

  return v10;
}

- (id)_getOffer
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)semanticContentAttribute
{
  void *v2;
  int64_t v3;

  -[ICQLegacyBannerView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "semanticContentAttribute");

  return v3;
}

- (int64_t)userInterfaceLayoutDirection
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_opt_class();
  -[ICQLegacyBannerView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v4, "semanticContentAttribute"));

  return v5;
}

- (void)updateConstraints
{
  objc_super v3;

  -[ICQLegacyBannerView _updateBannerViewConstraints](self, "_updateBannerViewConstraints");
  v3.receiver = self;
  v3.super_class = (Class)ICQLegacyBannerView;
  -[ICQLegacyBannerView updateConstraints](&v3, sel_updateConstraints);
}

- (void)_updateBannerViewConstraints
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
  NSArray *v15;
  NSArray *activeConstraints;
  id v17;

  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_activeConstraints);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView topAnchor](self->_textView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLegacyBannerView topAnchor](self, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, self->_textMargins.top);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v5);

  -[_ICQTextView leadingAnchor](self->_textView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLegacyBannerView leadingAnchor](self, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, self->_textMargins.leading);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v8);

  -[_ICQTextView trailingAnchor](self->_textView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLegacyBannerView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -self->_textMargins.trailing);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v11);

  -[ICQLegacyBannerView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView bottomAnchor](self->_textView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, self->_textMargins.bottom);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v14);

  v15 = (NSArray *)objc_msgSend(v17, "copy");
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v15;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_activeConstraints);
}

- (id)textParagraphStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setAlignment:", -[ICQLegacyBannerView textAlignment](self, "textAlignment"));
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("th"));

  if (v8)
  {
    objc_msgSend(v4, "setLineHeightMultiple:", 1.2);
  }
  else
  {
    -[ICQLegacyBannerView textLineSpacing](self, "textLineSpacing");
    objc_msgSend(v4, "setLineSpacing:");
  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (id)textParagraphStyleAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BEBB3A8];
  -[ICQLegacyBannerView textParagraphStyle](self, "textParagraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BEBB360];
  -[ICQLegacyBannerView font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x24BEBB368];
  -[ICQLegacyBannerView textColor](self, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)titleAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BEBB360];
  -[ICQLegacyBannerView titleFont](self, "titleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x24BEBB368];
  -[ICQLegacyBannerView titleColor](self, "titleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)detailMessageAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BEBB360];
  -[ICQLegacyBannerView detailMessageFont](self, "detailMessageFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x24BEBB368];
  -[ICQLegacyBannerView detailMessageColor](self, "detailMessageColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)linkAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BEBB360];
  -[ICQLegacyBannerView linkMessageFont](self, "linkMessageFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x24BEBB368];
  -[ICQLegacyBannerView linkMessageFont](self, "linkMessageFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_applyTextParagraphAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_ICQTextView textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginEditing");

  -[_ICQTextView textStorage](self->_textView, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLegacyBannerView textParagraphStyleAttributes](self, "textParagraphStyleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView textStorage](self->_textView, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttributes:range:", v5, 0, objc_msgSend(v6, "length"));

  -[_ICQTextView textStorage](self->_textView, "textStorage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endEditing");

}

- (void)_applyTextStorageAttributes
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[ICQLegacyBannerView offer](self, "offer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDetailBannerInfoAvailable");

  if ((v5 & 1) == 0)
  {
    -[_ICQTextView textStorage](self->_textView, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginEditing");

    -[_ICQTextView textStorage](self->_textView, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    -[_ICQTextView textStorage](self->_textView, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLegacyBannerView messageAttributes](self, "messageAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttributes:range:", v10, 0, v8);

    -[ICQLegacyBannerView linkTextFont](self, "linkTextFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v20 = *MEMORY[0x24BEBB360];
      -[ICQLegacyBannerView linkTextFont](self, "linkTextFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ICQTextView textStorage](self->_textView, "textStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BEBB388];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __50__ICQLegacyBannerView__applyTextStorageAttributes__block_invoke;
      v18[3] = &unk_24E3F4D58;
      v18[4] = self;
      v19 = v13;
      v16 = v13;
      objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v8, 0, v18);

    }
    -[_ICQTextView textStorage](self->_textView, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endEditing");

  }
}

void __50__ICQLegacyBannerView__applyTextStorageAttributes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "textStorage");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttributes:range:", *(_QWORD *)(a1 + 40), a3, a4);

  }
}

- (id)attributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  uint8_t *v18;
  void *v19;
  uint64_t v21;
  uint8_t buf[2];

  v3 = (void *)objc_opt_new();
  -[ICQLegacyBannerView offer](self, "offer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bannerSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "linksFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    -[ICQLegacyBannerView offer](self, "offer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "level");

    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(v21) = 0;
        v17 = "Banner view is missing banner specification";
        v18 = (uint8_t *)&v21;
LABEL_8:
        _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
      }
    }
    else if (v16)
    {
      *(_WORD *)buf = 0;
      v17 = "Banner view should not be shown if level is sufficient";
      v18 = buf;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  v8 = (void *)MEMORY[0x24BDD1458];
  objc_msgSend(v5, "linksFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLegacyBannerView messageAttributes](self, "messageAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "links");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedStringWithFormat:attributes:links:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendAttributedString:", v12);
LABEL_10:
  v19 = (void *)objc_msgSend(v3, "copy", v21);

  return v19;
}

+ (id)replaceWordsIn:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v12, v13);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)detailAttributedText
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
  void *v17;
  void *v18;
  void *v19;
  int v20;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  uint8_t *v44;
  void *v46;
  void *v47;
  void *v48;
  __int16 v49;
  uint8_t buf[2];

  v3 = (void *)objc_opt_new();
  -[ICQLegacyBannerView offer](self, "offer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bannerSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isDetailBannerInfoAvailable") & 1) != 0)
  {
    -[ICQLegacyBannerView offer](self, "offer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleWithKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageWithKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      v12 = (void *)objc_opt_class();
      objc_msgSend(v7, "wordsToReplace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replaceWordsIn:with:", v9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x24BDD1458];
      -[ICQLegacyBannerView titleAttributes](self, "titleAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attributedStringWithFormat:attributes:links:", v9, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICQLegacyBannerView offer](self, "offer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

      if (v20)
      {
        objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE220]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle"), v48);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "imageWithTintColor:", v21);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4B8]), "initWithData:ofType:", 0, 0);
        objc_msgSend(v22, "setImage:", v46);
        objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendAttributedString:", v23);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
        objc_msgSend(v3, "appendAttributedString:", v24);

      }
      objc_msgSend(v3, "appendAttributedString:", v17);

    }
    if (objc_msgSend(v11, "length"))
    {
      v25 = (void *)objc_opt_class();
      objc_msgSend(v7, "wordsToReplace");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "replaceWordsIn:with:", v11, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n"), v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x24BDD1458];
      -[ICQLegacyBannerView detailMessageAttributes](self, "detailMessageAttributes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "attributedStringWithFormat:attributes:links:", v11, v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendAttributedString:", v30);
    }
    objc_msgSend(v5, "linksFormat");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (v32)
    {
      v33 = (void *)MEMORY[0x24BDD1458];
      objc_msgSend(v5, "linksFormat");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLegacyBannerView linkAttributes](self, "linkAttributes");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "links");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "attributedStringWithFormat:attributes:links:", v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendAttributedString:", v37);
LABEL_18:
      v38 = (void *)objc_msgSend(v3, "copy");

      goto LABEL_19;
    }
    -[ICQLegacyBannerView offer](self, "offer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "level");

    _ICQGetLogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (v40)
    {
      if (v42)
      {
        v49 = 0;
        v43 = "Banner view is missing banner specification";
        v44 = (uint8_t *)&v49;
LABEL_16:
        _os_log_impl(&dword_21F2CC000, v41, OS_LOG_TYPE_DEFAULT, v43, v44, 2u);
      }
    }
    else if (v42)
    {
      *(_WORD *)buf = 0;
      v43 = "Banner view should not be shown if level is sufficient";
      v44 = buf;
      goto LABEL_16;
    }

    goto LABEL_18;
  }
  -[ICQLegacyBannerView attributedText](self, "attributedText");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v38;
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_offer, a3);
  -[ICQLegacyBannerView detailAttributedText](self, "detailAttributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView setAttributedText:](self->_textView, "setAttributedText:", v5);
  -[ICQLegacyBannerView _applyTextStorageAttributes](self, "_applyTextStorageAttributes");
  -[ICQLegacyBannerView _applyTextParagraphAttributes](self, "_applyTextParagraphAttributes");
  if (v5)
  {
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[_ICQTextView setIsAccessibilityElement:](self->_textView, "setIsAccessibilityElement:", 1);
      v8 = objc_alloc_init(MEMORY[0x24BDD1458]);
      -[_ICQTextView setAccessibilityAttributedLabel:](self->_textView, "setAccessibilityAttributedLabel:", v8);

    }
  }

}

- (void)setFont:(id)a3
{
  UIFont *v4;
  UIFont *v5;

  v4 = (UIFont *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BEBB608]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_font != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_font, v4);
    -[ICQLegacyBannerView _applyTextStorageAttributes](self, "_applyTextStorageAttributes");
    v4 = v5;
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;

  v4 = (UIColor *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_textColor != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_textColor, v4);
    -[ICQLegacyBannerView _applyTextStorageAttributes](self, "_applyTextStorageAttributes");
    v4 = v5;
  }

}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[ICQLegacyBannerView _applyTextParagraphAttributes](self, "_applyTextParagraphAttributes");
  }
}

- (void)setTextLineSpacing:(double)a3
{
  if (self->_textLineSpacing != a3)
  {
    self->_textLineSpacing = a3;
    -[ICQLegacyBannerView _applyTextParagraphAttributes](self, "_applyTextParagraphAttributes");
  }
}

- (void)setTextMargins:(NSDirectionalEdgeInsets)a3
{
  if (self->_textMargins.leading != a3.leading
    || self->_textMargins.top != a3.top
    || self->_textMargins.trailing != a3.trailing
    || self->_textMargins.bottom != a3.bottom)
  {
    self->_textMargins = a3;
    -[ICQLegacyBannerView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setLinkTextFont:(id)a3
{
  UIFont *v4;
  UIFont *linkTextFont;
  char v6;
  UIFont *v7;
  UIFont *v8;
  UIFont *v9;

  v4 = (UIFont *)a3;
  linkTextFont = self->_linkTextFont;
  if (linkTextFont != v4)
  {
    v9 = v4;
    v6 = -[UIFont isEqual:](linkTextFont, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (UIFont *)-[UIFont copy](v9, "copy");
      v8 = self->_linkTextFont;
      self->_linkTextFont = v7;

      -[ICQLegacyBannerView _applyTextStorageAttributes](self, "_applyTextStorageAttributes");
      v4 = v9;
    }
  }

}

- (void)setLinkTextColor:(id)a3
{
  UIColor *v4;
  void *v5;
  void *v6;
  char v7;
  UIColor *linkTextColor;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = (UIColor *)a3;
  -[ICQLegacyBannerView offer](self, "offer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDetailBannerInfoAvailable");

  if ((v7 & 1) == 0)
  {
    linkTextColor = self->_linkTextColor;
    if (linkTextColor != v4 && (-[UIColor isEqual:](linkTextColor, "isEqual:", v4) & 1) == 0)
    {
      v9 = (UIColor *)-[UIColor copy](v4, "copy");
      v10 = self->_linkTextColor;
      self->_linkTextColor = v9;

      v11 = self->_linkTextColor;
      if (v11)
      {
        v13 = *MEMORY[0x24BEBB368];
        v14[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ICQTextView setLinkTextAttributes:](self->_textView, "setLinkTextAttributes:", v12);

      }
      else
      {
        -[_ICQTextView setLinkTextAttributes:](self->_textView, "setLinkTextAttributes:", MEMORY[0x24BDBD1B8]);
      }
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  NSDirectionalEdgeInsets *p_textMargins;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  p_textMargins = &self->_textMargins;
  -[_ICQTextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width - self->_textMargins.leading - self->_textMargins.trailing, 1.79769313e308);
  v6 = v5 + p_textMargins->top + p_textMargins->bottom;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "link", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "icqIndex");
  if (v7 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v8 = v7;
    -[ICQLegacyBannerView offer](self, "offer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bannerSpecification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "links");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v8 < v12)
    {
      -[ICQLegacyBannerView offer](self, "offer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bannerSpecification");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "links");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[ICQLegacyBannerView _performActionWithICQLink:](self, "_performActionWithICQLink:", v16))
      {
        _ICQGetLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "action");
          _ICQStringForAction();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v18;
          v23 = 2114;
          v24 = (id)objc_opt_class();
          v19 = v24;
          _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "ICQBanner: action %{public}@ not handled by delegate nor %{public}@", (uint8_t *)&v21, 0x16u);

        }
      }

    }
  }

  return 0;
}

- (void)textViewDidChangeSelection:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "selectedRange");
  if (v3 | v4)
    objc_msgSend(v5, "setSelectedRange:", 0, 0);

}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  return 0;
}

- (void)_configureManageStorageButtonWithICQLink:(id)a3
{
  id v4;
  void *v5;
  UIButton **p_manageStorageButton;
  UIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  ICQLegacyBannerView *v16;
  id v17;

  v4 = a3;
  v5 = v4;
  p_manageStorageButton = &self->_manageStorageButton;
  if (v4 && (v7 = *p_manageStorageButton) != 0)
  {
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    v9 = (void *)MEMORY[0x24BEBD388];
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __64__ICQLegacyBannerView__configureManageStorageButtonWithICQLink___block_invoke;
    v15 = &unk_24E3F4D80;
    v16 = self;
    v17 = v5;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", &stru_24E400750, 0, CFSTR("MANAGE_STORAGE"), &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](*p_manageStorageButton, "addAction:forControlEvents:", v10, 64, v12, v13, v14, v15, v16);

  }
  else
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICQLegacyBannerView _configureManageStorageButtonWithICQLink:].cold.1((uint64_t *)p_manageStorageButton, (uint64_t)v5, v11);

  }
}

void __64__ICQLegacyBannerView__configureManageStorageButtonWithICQLink___block_invoke(uint64_t a1)
{
  int v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(a1 + 32), "_performActionWithICQLink:", *(_QWORD *)(a1 + 40));
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = v1;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "ICQLink action completed with result: %d", (uint8_t *)v3, 8u);
  }

}

- (BOOL)_performActionWithICQLink:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Performing banner view action with icqLink: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "performActionWith:", v4);

  return v7;
}

- (void)updateBannerView
{
  void *v3;
  _ICQTextView *textView;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEBD4B8], "quaternarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLegacyBannerView setBackgroundColor:](self, "setBackgroundColor:", v3);

  textView = self->_textView;
  -[ICQLegacyBannerView detailAttributedText](self, "detailAttributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQTextView setAttributedText:](textView, "setAttributedText:", v5);

  -[ICQLegacyBannerView _applyTextStorageAttributes](self, "_applyTextStorageAttributes");
  -[ICQLegacyBannerView _applyTextParagraphAttributes](self, "_applyTextParagraphAttributes");
  -[ICQLegacyBannerView sizeToFit](self, "sizeToFit");
  -[ICQLegacyBannerView superview](self, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[ICQLegacyBannerView superview](self, "superview");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

}

- (ICQLegacyBannerViewDelegate)delegate
{
  return (ICQLegacyBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)detailMessageFont
{
  return self->_detailMessageFont;
}

- (void)setDetailMessageFont:(id)a3
{
  objc_storeStrong((id *)&self->_detailMessageFont, a3);
}

- (UIFont)linkMessageFont
{
  return self->_linkMessageFont;
}

- (void)setLinkMessageFont:(id)a3
{
  objc_storeStrong((id *)&self->_linkMessageFont, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (UIColor)detailMessageColor
{
  return self->_detailMessageColor;
}

- (void)setDetailMessageColor:(id)a3
{
  objc_storeStrong((id *)&self->_detailMessageColor, a3);
}

- (UIColor)linkMessageColor
{
  return self->_linkMessageColor;
}

- (void)setLinkMessageColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkMessageColor, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSDirectionalEdgeInsets)textMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_textMargins.top;
  leading = self->_textMargins.leading;
  bottom = self->_textMargins.bottom;
  trailing = self->_textMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)textLineSpacing
{
  return self->_textLineSpacing;
}

- (UIFont)linkTextFont
{
  return self->_linkTextFont;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setFlowOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (_ICQTextView)textView
{
  return self->_textView;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_linkTextFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_linkMessageColor, 0);
  objc_storeStrong((id *)&self->_detailMessageColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_linkMessageFont, 0);
  objc_storeStrong((id *)&self->_detailMessageFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manageStorageButton, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)initWithOffer:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "ERROR:ICQBannerView:initWithOffer should be call from main thread", v1, 2u);
}

- (void)_configureManageStorageButtonWithICQLink:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Manage storage button (%@) and icqLink (%@) must not be nil.", (uint8_t *)&v4, 0x16u);
}

@end

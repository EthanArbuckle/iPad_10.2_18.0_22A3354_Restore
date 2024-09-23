@implementation PKEnhancedMerchantCollectionViewListCell

- (PKEnhancedMerchantCollectionViewListCell)init
{
  return -[PKEnhancedMerchantCollectionViewListCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKEnhancedMerchantCollectionViewListCell)initWithFrame:(CGRect)a3
{
  PKEnhancedMerchantCollectionViewListCell *v3;
  PKEnhancedMerchantCollectionViewListCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  v3 = -[PKEnhancedMerchantCollectionViewListCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKEnhancedMerchantCollectionViewListCell _commonInit](v3, "_commonInit");
  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)updateWithAccountEnhancedMerchant:(id)a3
{
  id v5;
  void *v6;
  PKLinkedApplication *v7;
  void *v8;
  PKLinkedApplication *v9;
  PKLinkedApplication *linkedApplication;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_enhancedMerchant, a3);
  -[PKAccountEnhancedMerchant adamID](self->_enhancedMerchant, "adamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [PKLinkedApplication alloc];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:](v7, "initWithStoreIDs:defaultLaunchURL:", v8, 0);
    linkedApplication = self->_linkedApplication;
    self->_linkedApplication = v9;

    -[PKLinkedApplication addObserver:](self->_linkedApplication, "addObserver:", self);
    -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
  }

}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void)dealloc
{
  objc_super v3;

  -[PKLinkedApplication removeObserver:](self->_linkedApplication, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  -[PKEnhancedMerchantCollectionViewListCell dealloc](&v3, sel_dealloc);
}

- (void)_initializeViewsIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  UIListContentView *v6;
  UIListContentView *listContentView;
  UIImageView *v8;
  UIImageView *imageView;
  UIImageView *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *detailedDescriptionLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIButton *v41;
  UIButton *appStoreButton;
  UIButton *v43;
  UIButton *websiteButton;
  UIButton *v45;
  UIButton *mapsButton;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  id location[2];

  if (!self->_listContentView)
  {
    -[PKEnhancedMerchantCollectionViewListCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0DC39B0]);
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIListContentView *)objc_msgSend(v4, "initWithConfiguration:", v5);
    listContentView = self->_listContentView;
    self->_listContentView = v6;

    objc_msgSend(v3, "addSubview:", self->_listContentView);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = self->_imageView;
    self->_imageView = v8;

    v10 = self->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[UIImageView layer](self->_imageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 10.0);
    objc_msgSend(v12, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v12, "setBorderWidth:", PKUIPixelLength());
    v52 = v12;
    objc_msgSend(v12, "setMasksToBounds:", 1);
    -[PKEnhancedMerchantCollectionViewListCell _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
    objc_msgSend(v3, "addSubview:", self->_imageView);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailedDescriptionLabel = self->_detailedDescriptionLabel;
    self->_detailedDescriptionLabel = v13;

    -[UILabel setNumberOfLines:](self->_detailedDescriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_detailedDescriptionLabel, "setLineBreakMode:", 0);
    -[UILabel setLineBreakStrategy:](self->_detailedDescriptionLabel, "setLineBreakStrategy:", 1);
    -[UILabel setTextAlignment:](self->_detailedDescriptionLabel, "setTextAlignment:", 0);
    v15 = self->_detailedDescriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = self->_detailedDescriptionLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], 0, 0, *MEMORY[0x1E0DC1440]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_detailedDescriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v55 = v3;
    objc_msgSend(v3, "addSubview:", self->_detailedDescriptionLabel);
    objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKRewardsHubGrayButtonColor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBaseBackgroundColor:", v20);

    -[PKEnhancedMerchantCollectionViewListCell _buttonFont](self, "_buttonFont");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerStyle:", 4);
    v51 = (void *)v21;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPreferredSymbolConfigurationForImage:", v22);

    objc_msgSend(v19, "setContentInsets:", 5.0, 8.0, 5.0, 12.0);
    objc_msgSend(v19, "setImagePadding:", 4.0);
    PKLocalizedFeatureString();
    v23 = objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v25 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v23;
    -[PKEnhancedMerchantCollectionViewListCell _buttonAttributedStringForString:](self, "_buttonAttributedStringForString:", v23);
    v26 = objc_claimAutoreleasedReturnValue();
    -[PKEnhancedMerchantCollectionViewListCell _buttonAttributedStringForString:](self, "_buttonAttributedStringForString:", v24);
    v27 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v25;
    -[PKEnhancedMerchantCollectionViewListCell _buttonAttributedStringForString:](self, "_buttonAttributedStringForString:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v19, "copy");
    v48 = (void *)v26;
    objc_msgSend(v29, "setAttributedTitle:", v26);
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("appstore"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:", v30);

    objc_msgSend(v29, "setShowsActivityIndicator:", 1);
    v31 = (void *)objc_msgSend(v19, "copy");
    v47 = (void *)v27;
    objc_msgSend(v31, "setAttributedTitle:", v27);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("safari.fill"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setImage:", v32);

    v33 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v33, "setAttributedTitle:", v28);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setImage:", v34);

    objc_initWeak(location, self);
    v35 = (void *)MEMORY[0x1E0DC3428];
    v36 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke;
    v60[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v61, location);
    objc_msgSend(v35, "actionWithHandler:", v60);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0DC3428];
    v58[0] = v36;
    v58[1] = 3221225472;
    v58[2] = __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_2;
    v58[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v59, location);
    objc_msgSend(v37, "actionWithHandler:", v58);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0DC3428];
    v56[0] = v36;
    v56[1] = 3221225472;
    v56[2] = __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_3;
    v56[3] = &unk_1E3E62BD0;
    objc_copyWeak(&v57, location);
    objc_msgSend(v38, "actionWithHandler:", v56);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v29, v54);
    v41 = (UIButton *)objc_claimAutoreleasedReturnValue();
    appStoreButton = self->_appStoreButton;
    self->_appStoreButton = v41;

    -[UIButton setTintColor:](self->_appStoreButton, "setTintColor:", v40);
    objc_msgSend(v55, "addSubview:", self->_appStoreButton);
    -[UIButton setEnabled:](self->_appStoreButton, "setEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v31, v53);
    v43 = (UIButton *)objc_claimAutoreleasedReturnValue();
    websiteButton = self->_websiteButton;
    self->_websiteButton = v43;

    -[UIButton setTintColor:](self->_websiteButton, "setTintColor:", v40);
    objc_msgSend(v55, "addSubview:", self->_websiteButton);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v33, v39);
    v45 = (UIButton *)objc_claimAutoreleasedReturnValue();
    mapsButton = self->_mapsButton;
    self->_mapsButton = v45;

    -[UIButton setTintColor:](self->_mapsButton, "setTintColor:", v40);
    objc_msgSend(v55, "addSubview:", self->_mapsButton);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);

    objc_destroyWeak(&v61);
    objc_destroyWeak(location);

  }
}

void __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dispatchActionToDelegate:", 0);

}

void __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dispatchActionToDelegate:", 1);

}

void __71__PKEnhancedMerchantCollectionViewListCell__initializeViewsIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dispatchActionToDelegate:", 2);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  _BOOL4 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = a3.width + -32.0;
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", a3.width + -32.0 + -48.0 + -10.0, a3.height);
  v8 = 16.0;
  v9 = fmax(v7, 48.0) + 16.0 + 16.0;
  v39 = height;
  -[UILabel sizeThatFits:](self->_detailedDescriptionLabel, "sizeThatFits:", v6, height);
  v11 = v9 + v10;
  -[PKEnhancedMerchantCollectionViewListCell _visibleButtons](self, "_visibleButtons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = v13;
    v15 = v11 + 16.0;
    if (v13 < 1)
    {
      v21 = 0.0;
    }
    else
    {
      v38 = width;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v20 = *MEMORY[0x1E0C9D820];
      v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v21 = 0.0;
      v22 = v19;
      v23 = *MEMORY[0x1E0C9D820];
      v24 = v6;
      do
      {
        v25 = v18;
        objc_msgSend(v12, "objectAtIndexedSubscript:", v16, *(_QWORD *)&v38);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (++v16 >= v14)
        {
          v26 = 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v23 == v20 && v22 == v19)
        {
          objc_msgSend(v18, "sizeThatFits:", v6, v39);
          if (v27 >= v6)
            v23 = v6;
          else
            v23 = v27;
          v22 = fmax(v28, 28.0);
        }
        v29 = v20;
        v30 = v19;
        if (v26)
        {
          objc_msgSend(v26, "sizeThatFits:", v6, v39);
          if (v29 >= v6)
            v29 = v6;
          v30 = fmax(v31, 28.0);
        }
        v32 = v26 != 0;
        if (v21 <= v22)
          v33 = v22;
        else
          v33 = v21;
        v34 = v29 > v24 - (v23 + 8.0);
        v35 = v33 + 16.0;
        if (!v32 || !v34)
          v35 = -0.0;
        v15 = v15 + v35;
        if (v32 && v34)
          v24 = v6;
        else
          v24 = v24 - (v23 + 8.0);
        if (v32 && v34)
          v21 = 0.0;
        else
          v21 = v33;
        v22 = v30;
        v23 = v29;
        v17 = v26;
      }
      while (v14 != v16);

      width = v38;
      v8 = 16.0;
    }
    v11 = v15 + v21;
  }

  v36 = width;
  v37 = v11 + v8;
  result.height = v37;
  result.width = v36;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRectEdge v13;
  double v14;
  CGFloat v15;
  UIImageView *imageView;
  UIListContentView *listContentView;
  UILabel *detailedDescriptionLabel;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double Width;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGSize v39;
  CGPoint v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect remainder;
  CGRect slice;
  objc_super v46;
  CGRect v47;
  CGRect v48;

  v46.receiver = self;
  v46.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  -[PKEnhancedMerchantCollectionViewListCell layoutSubviews](&v46, sel_layoutSubviews);
  -[PKEnhancedMerchantCollectionViewListCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");

  -[PKEnhancedMerchantCollectionViewListCell bounds](self, "bounds");
  v6 = v5 + 16.0;
  v8 = v7 + -32.0;
  v10 = v9 + -32.0;
  memset(&slice, 0, sizeof(slice));
  v12 = v11 + 16.0;
  remainder.origin.x = v5 + 16.0;
  remainder.origin.y = v11 + 16.0;
  remainder.size.width = v7 + -32.0;
  remainder.size.height = v9 + -32.0;
  if (v4)
    v13 = CGRectMaxXEdge;
  else
    v13 = CGRectMinXEdge;
  PKContentAlignmentMake();
  PKContentAlignmentMake();
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", v8 + -48.0 + -10.0, v10);
  v15 = fmax(v14, 48.0);
  v47.origin.x = v6;
  v47.origin.y = v12;
  v47.size.width = v8;
  v47.size.height = v10;
  CGRectDivide(v47, &slice, &remainder, v15, CGRectMinYEdge);
  memset(&v43, 0, sizeof(v43));
  v42 = slice;
  CGRectDivide(slice, &v43, &v42, 58.0, v13);
  imageView = self->_imageView;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](imageView, "setFrame:");
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", v42.size.width, v42.size.height);
  listContentView = self->_listContentView;
  PKSizeAlignedInRect();
  -[UIListContentView setFrame:](listContentView, "setFrame:");
  remainder.origin = (CGPoint)vaddq_f64((float64x2_t)remainder.origin, (float64x2_t)xmmword_19DEF67E0);
  remainder.size.height = remainder.size.height + -16.0;
  -[UILabel sizeThatFits:](self->_detailedDescriptionLabel, "sizeThatFits:", remainder.size.width);
  v48 = remainder;
  CGRectDivide(remainder, &slice, &remainder, v48.origin.y + 16.0, CGRectMinYEdge);
  detailedDescriptionLabel = self->_detailedDescriptionLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](detailedDescriptionLabel, "setFrame:");
  -[PKEnhancedMerchantCollectionViewListCell _visibleButtons](self, "_visibleButtons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");
  if (v20)
  {
    v21 = v20;
    v39 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v40 = (CGPoint)*MEMORY[0x1E0C9D628];
    v41.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v41.size = v39;
    Width = CGRectGetWidth(remainder);
    if (v21 >= 1)
    {
      v23 = Width;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = *MEMORY[0x1E0C9D820];
      v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v29 = v28;
      v30 = *MEMORY[0x1E0C9D820];
      do
      {
        v31 = v26;
        v32 = v25;
        objc_msgSend(v19, "objectAtIndexedSubscript:", v24, v39, v40);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (++v24 >= v21)
        {
          v25 = 0;
        }
        else
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v30 == v27)
        {
          v33 = v30;
          v34 = v29;
          if (v29 == v28)
          {
            objc_msgSend(v26, "sizeThatFits:", v23, 1.79769313e308);
            if (v35 >= v23)
              v33 = v23;
            else
              v33 = v35;
            v34 = fmax(v36, 28.0);
          }
        }
        else
        {
          v33 = v30;
          v34 = v29;
        }
        v30 = v27;
        v29 = v28;
        if (v25)
        {
          objc_msgSend(v25, "sizeThatFits:", v23, 1.79769313e308);
          if (v37 >= v23)
            v30 = v23;
          else
            v30 = v37;
          v29 = fmax(v38, 28.0);
        }
        if (CGRectIsNull(v41))
          CGRectDivide(remainder, &v41, &remainder, v34, CGRectMinYEdge);
        CGRectDivide(v41, &slice, &v41, v33, v13);
        PKSizeAlignedInRect();
        objc_msgSend(v26, "setFrame:");
        if (v25)
        {
          if (v30 + 8.0 <= CGRectGetWidth(v41))
          {
            CGRectDivide(v41, &slice, &v41, 8.0, v13);
          }
          else
          {
            remainder.origin = (CGPoint)vaddq_f64((float64x2_t)remainder.origin, (float64x2_t)xmmword_19DEF67E0);
            remainder.size.height = remainder.size.height + -16.0;
            v41.origin = v40;
            v41.size = v39;
          }
        }
      }
      while (v21 != v24);

    }
  }

}

- (void)_dispatchActionToDelegate:(int64_t)a3
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKEnhancedMerchantCollectionViewListCell enhancedMerchant](self, "enhancedMerchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "performAction:forEnhancedMerchant:sender:", a3, v5, self);

  }
}

- (id)_buttonFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4938], *MEMORY[0x1E0DC1438]);
}

- (id)_buttonAttributedStringForString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3498];
  v5 = a3;
  -[PKEnhancedMerchantCollectionViewListCell _buttonFont](self, "_buttonFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_attriutedStringWithString:font:paragraphStyle:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateAppStoreButtonBasedOnLinkedApplicationState
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[PKLinkedApplication isInstalled](self->_linkedApplication, "isInstalled");
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnhancedMerchantCollectionViewListCell _buttonAttributedStringForString:](self, "_buttonAttributedStringForString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__PKEnhancedMerchantCollectionViewListCell__updateAppStoreButtonBasedOnLinkedApplicationState__block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __94__PKEnhancedMerchantCollectionViewListCell__updateAppStoreButtonBasedOnLinkedApplicationState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "appStoreButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAttributedTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setShowsActivityIndicator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "appStoreButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfiguration:", v4);
  objc_msgSend(v3, "setEnabled:", 1);

}

- (void)_updateImageViewDynamicColors
{
  void *v3;
  _QWORD v4[5];

  -[PKEnhancedMerchantCollectionViewListCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__PKEnhancedMerchantCollectionViewListCell__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __73__PKEnhancedMerchantCollectionViewListCell__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 896), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantCollectionViewListCell;
  -[PKEnhancedMerchantCollectionViewListCell _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKEnhancedMerchantCollectionViewListCell _updateImageViewDynamicColors](self, "_updateImageViewDynamicColors");
}

- (id)_visibleButtons
{
  UIButton *websiteButton;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  websiteButton = self->_websiteButton;
  v6[0] = self->_appStoreButton;
  v6[1] = websiteButton;
  v6[2] = self->_mapsButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __59__PKEnhancedMerchantCollectionViewListCell__visibleButtons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (PKAccountEnhancedMerchant)enhancedMerchant
{
  return self->_enhancedMerchant;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
  objc_storeStrong((id *)&self->_listContentView, a3);
}

- (UILabel)detailedDescriptionLabel
{
  return self->_detailedDescriptionLabel;
}

- (void)setDetailedDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailedDescriptionLabel, a3);
}

- (UIButton)appStoreButton
{
  return self->_appStoreButton;
}

- (void)setAppStoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreButton, a3);
}

- (UIButton)websiteButton
{
  return self->_websiteButton;
}

- (void)setWebsiteButton:(id)a3
{
  objc_storeStrong((id *)&self->_websiteButton, a3);
}

- (UIButton)mapsButton
{
  return self->_mapsButton;
}

- (void)setMapsButton:(id)a3
{
  objc_storeStrong((id *)&self->_mapsButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsButton, 0);
  objc_storeStrong((id *)&self->_websiteButton, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_detailedDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_enhancedMerchant, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

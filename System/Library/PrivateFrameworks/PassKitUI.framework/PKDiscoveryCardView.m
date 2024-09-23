@implementation PKDiscoveryCardView

+ (double)expandedWidth
{
  unint64_t v2;
  double *v3;

  v2 = PKUIGetMinScreenType();
  v3 = (double *)((char *)&unk_19DF17558 + 8 * v2);
  if (v2 >= 0x12)
    v3 = (double *)MEMORY[0x1E0C9D820];
  return *v3;
}

+ (double)expandedHeight
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 0.0;
  if (v2 <= 0xC)
    return dbl_19DF175E8[v2];
  return result;
}

+ (CGSize)expandedSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a1, "expandedWidth");
  v4 = v3;
  objc_msgSend(a1, "expandedHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (double)compressedWidth
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 0.0;
  if (v2 <= 0xC)
    return dbl_19DF17650[v2];
  return result;
}

+ (double)compressedHeight
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 0.0;
  if (v2 <= 0xC)
    return dbl_19DF176B8[v2];
  return result;
}

+ (CGSize)compressedSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a1, "compressedWidth");
  v4 = v3;
  objc_msgSend(a1, "compressedHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (CGSize)miniCompressedSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "compressedWidth");
  v3 = 120.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)cornerRadius
{
  return 14.0;
}

- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5
{
  return -[PKDiscoveryCardView initWithArticleLayout:dismissImage:cardTemplateInformation:callToActionTappedOverride:isWelcomeCard:](self, "initWithArticleLayout:dismissImage:cardTemplateInformation:callToActionTappedOverride:isWelcomeCard:", a3, a4, a5, 0, 0);
}

- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5 isWelcomeCard:(BOOL)a6
{
  return -[PKDiscoveryCardView initWithArticleLayout:dismissImage:cardTemplateInformation:callToActionTappedOverride:isWelcomeCard:](self, "initWithArticleLayout:dismissImage:cardTemplateInformation:callToActionTappedOverride:isWelcomeCard:", a3, a4, a5, 0, a6);
}

- (PKDiscoveryCardView)initWithArticleLayout:(id)a3 dismissImage:(id)a4 cardTemplateInformation:(id)a5 callToActionTappedOverride:(id)a6 isWelcomeCard:(BOOL)a7
{
  double v13;
  double v14;
  double v15;
  double v16;
  PKDiscoveryCardView *v17;
  PKDiscoveryCardView *v18;
  uint64_t v19;
  PKDiscoveryCard *card;
  uint64_t v21;
  PKMiniDiscoveryCard *miniCard;
  uint64_t v23;
  PKDiscoveryMedia *largeCardMedia;
  uint64_t v25;
  PKDiscoveryMedia *miniCardMedia;
  uint64_t v27;
  PKDiscoveryCardViewTemplateInformation *cardTemplateInformation;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  UIView *miniCardBackgroundColorView;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  UIImageView *backgroundImageView;
  uint64_t v44;
  UILabel *headingLabel;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  void *v49;
  uint64_t v50;
  UILabel *titleLabel;
  UILabel *v52;
  void *v53;
  UILabel *v54;
  void *v55;
  void *v56;
  PKDiscoveryCallToActionFooterView *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  PKDiscoveryCallToActionFooterView *ctaFooterView;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  PKContinuousButton *v66;
  PKContinuousButton *dismissButton;
  PKContinuousButton *v68;
  void *v69;
  uint64_t v70;
  UITapGestureRecognizer *tapRecognizer;
  void *v72;
  id v73;
  id *p_articleLayout;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id location;
  _QWORD v87[2];
  __int128 v88;
  uint64_t v89;
  objc_super v90;
  _QWORD v91[4];

  v91[2] = *MEMORY[0x1E0C80C00];
  v83 = a3;
  v78 = a4;
  v82 = a5;
  v79 = a6;
  v90.receiver = self;
  v90.super_class = (Class)PKDiscoveryCardView;
  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = -[PKDiscoveryCardView initWithFrame:](&v90, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v14, v15, v16);
  v18 = v17;
  if (v17)
  {
    p_articleLayout = (id *)&v17->_articleLayout;
    objc_storeStrong((id *)&v17->_articleLayout, a3);
    v18->_priority = -[PKDiscoveryArticleLayout priority](v18->_articleLayout, "priority");
    v18->_isWelcomeCard = a7;
    objc_msgSend(v83, "card");
    v19 = objc_claimAutoreleasedReturnValue();
    card = v18->_card;
    v18->_card = (PKDiscoveryCard *)v19;

    objc_msgSend(v83, "miniCard");
    v21 = objc_claimAutoreleasedReturnValue();
    miniCard = v18->_miniCard;
    v18->_miniCard = (PKMiniDiscoveryCard *)v21;

    -[PKDiscoveryCard backgroundMedia](v18->_card, "backgroundMedia");
    v23 = objc_claimAutoreleasedReturnValue();
    largeCardMedia = v18->_largeCardMedia;
    v18->_largeCardMedia = (PKDiscoveryMedia *)v23;

    -[PKMiniDiscoveryCard backgroundMedia](v18->_miniCard, "backgroundMedia");
    v25 = objc_claimAutoreleasedReturnValue();
    miniCardMedia = v18->_miniCardMedia;
    v18->_miniCardMedia = (PKDiscoveryMedia *)v25;

    v27 = objc_msgSend(v82, "copy");
    cardTemplateInformation = v18->_cardTemplateInformation;
    v18->_cardTemplateInformation = (PKDiscoveryCardViewTemplateInformation *)v27;

    v18->_displayType = -[PKDiscoveryCardViewTemplateInformation displayType](v18->_cardTemplateInformation, "displayType");
    v18->_largeCardTemplate = -[PKDiscoveryCard largeCardTemplateType](v18->_card, "largeCardTemplateType");
    v18->_miniCardTemplate = -[PKMiniDiscoveryCard miniCardTemplateType](v18->_miniCard, "miniCardTemplateType");
    v29 = -[PKDiscoveryCardViewTemplateInformation cardSize](v18->_cardTemplateInformation, "cardSize");
    v18->_currentCardSize = v29;
    v18->_shouldDisplayAsLarge = v29 == 0;
    v30 = (void *)MEMORY[0x1E0DC3658];
    -[PKDiscoveryCard backgroundColor](v18->_card, "backgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "pkui_colorWithPKColor:", v31);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0DC3658];
    -[PKMiniDiscoveryCard backgroundColor](v18->_miniCard, "backgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pkui_colorWithPKColor:", v33);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v76;
    if (!v76)
      v34 = v77;
    if (v18->_shouldDisplayAsLarge)
      v35 = v77;
    else
      v35 = v34;
    objc_storeStrong((id *)&v18->_backgroundColor, v35);
    -[PKDiscoveryCardView layer](v18, "layer");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(v81, "setMasksToBounds:", 1);
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v13, v14, v15, v16);
    miniCardBackgroundColorView = v18->_miniCardBackgroundColorView;
    v18->_miniCardBackgroundColorView = (UIView *)v36;

    -[UIView setContentMode:](v18->_miniCardBackgroundColorView, "setContentMode:", 2);
    -[UIView setBackgroundColor:](v18->_miniCardBackgroundColorView, "setBackgroundColor:", v18->_backgroundColor);
    -[PKDiscoveryCardView addSubview:](v18, "addSubview:", v18->_miniCardBackgroundColorView);
    if (v18->_shouldDisplayAsLarge)
    {
      -[PKDiscoveryCard title](v18->_card, "title");
      v80 = (id)objc_claimAutoreleasedReturnValue();
      -[PKDiscoveryCard heading](v18->_card, "heading");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setHidden:](v18->_miniCardBackgroundColorView, "setHidden:", 1);
    }
    else
    {
      -[PKMiniDiscoveryCard title](v18->_miniCard, "title");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMiniDiscoveryCard heading](v18->_miniCard, "heading");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "length"))
      {
        v80 = v39;
      }
      else
      {
        -[PKDiscoveryCard title](v18->_card, "title");
        v80 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v40, "length"))
      {
        v41 = v40;
      }
      else
      {
        -[PKDiscoveryCard heading](v18->_card, "heading");
        v41 = (id)objc_claimAutoreleasedReturnValue();
      }
      v38 = v41;

    }
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v13, v14, v15, v16);
    backgroundImageView = v18->_backgroundImageView;
    v18->_backgroundImageView = (UIImageView *)v42;

    -[UIImageView setContentMode:](v18->_backgroundImageView, "setContentMode:", 2);
    -[UIImageView setBackgroundColor:](v18->_backgroundImageView, "setBackgroundColor:", v18->_backgroundColor);
    if (!v18->_shouldDisplayAsLarge && !v18->_displayType && !v18->_miniCardTemplate)
      -[UIImageView _setContinuousCornerRadius:](v18->_backgroundImageView, "_setContinuousCornerRadius:", 14.0);
    -[PKDiscoveryCardView addSubview:](v18, "addSubview:", v18->_backgroundImageView);
    if (v38 && objc_msgSend(v38, "length"))
    {
      v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v13, v14, v15, v16);
      headingLabel = v18->_headingLabel;
      v18->_headingLabel = (UILabel *)v44;

      -[UILabel setText:](v18->_headingLabel, "setText:", v38);
      v46 = v18->_headingLabel;
      -[PKDiscoveryCardView _headingLabelFont](v18, "_headingLabelFont");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v46, "setFont:", v47);

      v48 = v18->_headingLabel;
      -[PKDiscoveryCardView _headingLabelTextColor](v18, "_headingLabelTextColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v48, "setTextColor:", v49);

      -[UILabel setNumberOfLines:](v18->_headingLabel, "setNumberOfLines:", 1);
      -[UILabel setAccessibilityIdentifier:](v18->_headingLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);
      -[PKDiscoveryCardView addSubview:](v18, "addSubview:", v18->_headingLabel);
    }
    if (v80)
    {
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v13, v14, v15, v16);
      titleLabel = v18->_titleLabel;
      v18->_titleLabel = (UILabel *)v50;

      -[UILabel setText:](v18->_titleLabel, "setText:", v80);
      v52 = v18->_titleLabel;
      -[PKDiscoveryCardView _titleLabelFont](v18, "_titleLabelFont");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v52, "setFont:", v53);

      v54 = v18->_titleLabel;
      -[PKDiscoveryCardView _titleLabelTextColor](v18, "_titleLabelTextColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v54, "setTextColor:", v55);

      -[UILabel setNumberOfLines:](v18->_titleLabel, "setNumberOfLines:", -[PKDiscoveryCardView _titleLabelNumberOfLines](v18, "_titleLabelNumberOfLines"));
      -[UILabel setAccessibilityIdentifier:](v18->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
      -[PKDiscoveryCardView addSubview:](v18, "addSubview:", v18->_titleLabel);
    }
    -[PKDiscoveryCard callToAction](v18->_card, "callToAction");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [PKDiscoveryCallToActionFooterView alloc];
      -[PKDiscoveryCard callToAction](v18->_card, "callToAction");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_articleLayout, "itemIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[PKDiscoveryCallToActionFooterView initWithCallToAction:displayType:itemIdentifier:](v57, "initWithCallToAction:displayType:itemIdentifier:", v58, 0, v59);
      ctaFooterView = v18->_ctaFooterView;
      v18->_ctaFooterView = (PKDiscoveryCallToActionFooterView *)v60;

      -[PKDiscoveryCardView addSubview:](v18, "addSubview:", v18->_ctaFooterView);
      if (!v18->_shouldDisplayAsLarge)
        -[PKDiscoveryCallToActionFooterView setHidden:](v18->_ctaFooterView, "setHidden:", 1);
    }
    v62 = (void *)MEMORY[0x1E0DC3888];
    PKDefaultSystemFontOfSizeAndWeight(17.0, *MEMORY[0x1E0DC1448]);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "configurationWithFont:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = 0;
    v87[1] = 0;
    v88 = xmmword_19DF16E30;
    v89 = 2;
    v66 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", v87);
    dismissButton = v18->_dismissButton;
    v18->_dismissButton = v66;

    v68 = v18->_dismissButton;
    -[PKDiscoveryCardView _dismissButtonColor](v18, "_dismissButtonColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTintColor:](v68, "setTintColor:", v69);

    -[PKContinuousButton setImage:forState:](v18->_dismissButton, "setImage:forState:", v65, 0);
    -[PKContinuousButton addTarget:action:forControlEvents:](v18->_dismissButton, "addTarget:action:forControlEvents:", v18, sel__dismissButtonPressed, 64);
    -[PKContinuousButton _setTouchInsets:](v18->_dismissButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[PKContinuousButton sizeToFit](v18->_dismissButton, "sizeToFit");
    -[PKContinuousButton setAccessibilityIdentifier:](v18->_dismissButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    -[PKDiscoveryCardView addSubview:](v18, "addSubview:", v18->_dismissButton);
    v70 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v18, sel_tapGestureRecognized_);
    tapRecognizer = v18->_tapRecognizer;
    v18->_tapRecognizer = (UITapGestureRecognizer *)v70;

    -[PKDiscoveryCardView addGestureRecognizer:](v18, "addGestureRecognizer:", v18->_tapRecognizer);
    -[PKDiscoveryCardView _updateForDisplayType](v18, "_updateForDisplayType");
    objc_initWeak(&location, v18);
    v91[0] = objc_opt_class();
    v91[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __123__PKDiscoveryCardView_initWithArticleLayout_dismissImage_cardTemplateInformation_callToActionTappedOverride_isWelcomeCard___block_invoke;
    v84[3] = &unk_1E3E6F878;
    objc_copyWeak(&v85, &location);
    v73 = (id)-[PKDiscoveryCardView registerForTraitChanges:withHandler:](v18, "registerForTraitChanges:withHandler:", v72, v84);

    -[PKDiscoveryCardView setAccessibilityIgnoresInvertColors:](v18, "setAccessibilityIgnoresInvertColors:", 1);
    objc_destroyWeak(&v85);
    objc_destroyWeak(&location);

  }
  return v18;
}

void __123__PKDiscoveryCardView_initWithArticleLayout_dismissImage_cardTemplateInformation_callToActionTappedOverride_isWelcomeCard___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id *WeakRetained;
  id *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v5 = a2;
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "legibilityWeight");
  objc_msgSend(v18, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v7)
  {
    v11 = objc_msgSend(v18, "legibilityWeight");

    if (v11 == v9)
      goto LABEL_7;
  }
  else
  {

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained[59];
    objc_msgSend(WeakRetained, "_headingLabelFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    objc_msgSend(v13[60], "setNumberOfLines:", objc_msgSend(v13, "_titleLabelNumberOfLines"));
    v16 = v13[60];
    objc_msgSend(v13, "_titleLabelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v17);

    objc_msgSend(v13, "setNeedsLayout");
  }

LABEL_7:
}

- (void)setDisplayType:(int64_t)a3
{
  if (self->_displayType != a3)
  {
    -[PKDiscoveryCardViewTemplateInformation setDisplayType:](self->_cardTemplateInformation, "setDisplayType:");
    self->_displayType = a3;
    -[PKDiscoveryCardView _updateForDisplayType](self, "_updateForDisplayType");
    -[PKDiscoveryCardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCardSize:(int64_t)a3
{
  if (self->_currentCardSize != a3)
  {
    -[PKDiscoveryCardViewTemplateInformation updateCardSize:](self->_cardTemplateInformation, "updateCardSize:");
    self->_currentCardSize = a3;
    self->_shouldDisplayAsLarge = a3 == 0;
    -[PKDiscoveryCardView _updateForDisplayType](self, "_updateForDisplayType");
    -[PKDiscoveryCardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDelegate:(id)a3
{
  PKDiscoveryCardViewDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[PKDiscoveryCallToActionFooterView setDelegate:](self->_ctaFooterView, "setDelegate:", v5);

}

- (void)setCallToActionTappedOverride:(id)a3
{
  void *v4;
  id callToActionTappedOverride;
  PKDiscoveryCallToActionFooterView *ctaFooterView;
  id v7;

  v7 = a3;
  v4 = _Block_copy(v7);
  callToActionTappedOverride = self->_callToActionTappedOverride;
  self->_callToActionTappedOverride = v4;

  ctaFooterView = self->_ctaFooterView;
  if (ctaFooterView)
    -[PKDiscoveryCallToActionFooterView setCallToActionTappedOverride:](ctaFooterView, "setCallToActionTappedOverride:", v7);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int v19;
  id v20;
  UILabel *v21;
  UILabel *headingLabel;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UILabel *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  UILabel *titleLabel;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  uint64_t v73;
  int64_t miniCardTemplate;
  int64_t v75;
  double v76;
  double v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  uint64_t v84;
  CGFloat v85;
  double v86;
  double v87;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  UILabel *v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  UIView *miniCardBackgroundColorView;
  double v99;
  double v100;
  CGFloat v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  uint64_t v133;
  double v134;
  double rect;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  CGFloat v140;
  CGFloat v141;
  double v142;
  double v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  double v147;
  uint64_t v148;
  _QWORD v149[5];
  CGRect v150;
  CGRect remainder;
  CGRect slice;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  _QWORD v158[3];
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;

  v158[1] = *MEMORY[0x1E0C80C00];
  -[PKDiscoveryCardView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKDiscoveryCardView _currentContentInsets](self, "_currentContentInsets");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v138 = v15;
  v139 = v11;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  v19 = -[PKDiscoveryCardView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v144 = v14;
  v146 = v12;
  remainder.origin.x = v12;
  remainder.origin.y = v14;
  v140 = v18;
  v141 = v16;
  remainder.size.width = v16;
  remainder.size.height = v18;
  if (!self->_headingLabel && self->_miniCardTemplate == 2 && !self->_shouldDisplayAsLarge)
  {
    v20 = objc_alloc(MEMORY[0x1E0DC3990]);
    v21 = (UILabel *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    headingLabel = self->_headingLabel;
    self->_headingLabel = v21;

    v23 = self->_headingLabel;
    -[PKDiscoveryCardView _headingLabelFont](self, "_headingLabelFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    v25 = self->_headingLabel;
    -[UILabel text](self->_titleLabel, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v25, "setText:", v26);

    v27 = self->_headingLabel;
    -[PKDiscoveryCardView _headingLabelTextColor](self, "_headingLabelTextColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    -[UILabel setNumberOfLines:](self->_headingLabel, "setNumberOfLines:", 1);
    -[PKDiscoveryCardView addSubview:](self, "addSubview:", self->_headingLabel);
  }
  -[UILabel text](self->_titleLabel, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_headingLabel, "text");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "isEqual:", v30);

  -[UILabel setHidden:](self->_titleLabel, "setHidden:", v31);
  rect = v10;
  v136 = v6;
  v137 = v8;
  *(double *)v149 = v4;
  if (!self->_shouldDisplayAsLarge && self->_displayType != 1)
  {
    -[PKDiscoveryCallToActionFooterView setHidden:](self->_ctaFooterView, "setHidden:", 1);
    -[UIView setHidden:](self->_miniCardBackgroundColorView, "setHidden:", 0);
    -[PKDiscoveryCardView _miniCardImageSize](self, "_miniCardImageSize");
    +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
    PKFloatRoundToPixel();
    v72 = v71;
    PKFloatRoundToPixel();
    v133 = v73;
    miniCardTemplate = self->_miniCardTemplate;
    if (miniCardTemplate == 2 || miniCardTemplate == 1)
    {
      PKContentAlignmentMake();
    }
    else
    {
      v40 = 0.0;
      v38 = 0.0;
      v35 = 0.0;
      v33 = 0.0;
      if (miniCardTemplate)
      {
LABEL_41:
        miniCardBackgroundColorView = self->_miniCardBackgroundColorView;
        +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth", v133);
        -[UIView setFrame:](miniCardBackgroundColorView, "setFrame:", v72, v134, v99, 120.0);
        -[UIView setClipsToBounds:](self->_miniCardBackgroundColorView, "setClipsToBounds:", 1);
        v36 = v136;
        goto LABEL_8;
      }
      v161.origin.x = v4;
      v161.origin.y = v136;
      v161.size.width = v8;
      v161.size.height = v10;
      CGRectInset(v161, 16.0, 0.0);
      PKContentAlignmentMake();
    }
    PKSizeAlignedInRect();
    v33 = v94;
    v35 = v95;
    v38 = v96;
    v40 = v97;
    goto LABEL_41;
  }
  -[PKDiscoveryCallToActionFooterView setHidden:](self->_ctaFooterView, "setHidden:", 0);
  -[UIView setHidden:](self->_miniCardBackgroundColorView, "setHidden:", 1);
  +[PKDiscoveryCardView expandedWidth](PKDiscoveryCardView, "expandedWidth");
  +[PKDiscoveryCardView expandedHeight](PKDiscoveryCardView, "expandedHeight");
  PKFloatRoundToPixel();
  v33 = v32;
  PKFloatRoundToPixel();
  v35 = v34;
  +[PKDiscoveryCardView expandedWidth](PKDiscoveryCardView, "expandedWidth");
  v36 = v6;
  v38 = v37;
  +[PKDiscoveryCardView expandedHeight](PKDiscoveryCardView, "expandedHeight");
  v40 = v39;
LABEL_8:
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v33, v35, v38, v40, *(_QWORD *)&v38);
  -[UIImageView setClipsToBounds:](self->_backgroundImageView, "setClipsToBounds:", 1);
  -[PKContinuousButton sizeToFit](self->_dismissButton, "sizeToFit");
  v159.origin.x = v4;
  v159.origin.y = v36;
  v159.size.width = v8;
  v159.size.height = v10;
  CGRectInset(v159, 13.0, 12.0);
  PKSizeAlignedInRect();
  -[PKContinuousButton setFrame:](self->_dismissButton, "setFrame:");
  +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
  PKFloatRoundToPixel();
  if (self->_shouldDisplayAsLarge || self->_displayType == 1)
    +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
  v42 = v41 - v139 - v138;
  v43 = v42 + -32.0;
  v44 = self->_headingLabel;
  if (v44)
  {
    -[UILabel sizeThatFits:](v44, "sizeThatFits:", v42 + -32.0, v10);
    v46 = v45;
  }
  else
  {
    v46 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  memset(&slice, 0, sizeof(slice));
  -[PKDiscoveryCardView _yOffsetToHeadingLabel](self, "_yOffsetToHeadingLabel");
  v48 = v47;
  v160.origin.y = v144;
  v160.origin.x = v146;
  v160.size.height = v140;
  v160.size.width = v141;
  CGRectDivide(v160, &slice, &remainder, v48, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v46, CGRectMinYEdge);
  PKContentAlignmentMake();
  v145 = v46;
  PKSizeAlignedInRect();
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v43, remainder.size.height);
    v59 = v58;
  }
  else
  {
    v59 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_headingLabel)
    CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v59, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v61 = v60;
  v147 = v62;
  v64 = v63;
  v66 = v65;
  -[UILabel text](self->_titleLabel, "text");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "length");

  if (v19)
    v69 = 2;
  else
    v69 = 0;
  -[UILabel setTextAlignment:](self->_headingLabel, "setTextAlignment:", v69);
  if (!self->_shouldDisplayAsLarge && !self->_displayType)
  {
    v75 = self->_miniCardTemplate;
    if (v75 == 2)
    {
      -[UILabel setHidden:](self->_titleLabel, "setHidden:", 1);
      -[UILabel setTextAlignment:](self->_headingLabel, "setTextAlignment:", 1);
      -[PKDiscoveryCardView _miniCardImageSize](self, "_miniCardImageSize");
      PKFloatRoundToPixel();
      v101 = v100;
      *(_QWORD *)&v163.origin.x = v149[0];
      v163.origin.y = v136;
      v163.size.width = v137;
      v163.size.height = rect;
      CGRectInset(v163, 0.0, v101);
      PKContentAlignmentMake();
    }
    else
    {
      if (v75 != 1)
      {
        if (v75)
          goto LABEL_24;
        v142 = v61;
        PKFloatRoundToPixel();
        v77 = v76;
        if (v68)
        {
          v78 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
          objc_msgSend(v78, "setMaximumNumberOfLines:", 3);
          -[UILabel text](self->_titleLabel, "text");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v148 = *MEMORY[0x1E0DC1138];
          v157 = *MEMORY[0x1E0DC1138];
          -[PKDiscoveryCardView _titleLabelFont](self, "_titleLabelFont");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v158[0] = v80;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, &v157, 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "boundingRectWithSize:options:attributes:context:", 1, v81, v78, v77, 3.40282347e38);
          v83 = v82;

          v84 = v149[0];
          v85 = v136;
          if (v83 <= 62.0 - v145)
          {
            v114 = v137;
            v115 = rect;
            v166 = CGRectInset(*(CGRect *)&v84, 46.0, 29.0);
            x = v166.origin.x;
            y = v166.origin.y;
            width = v166.size.width;
            height = v166.size.height;
            objc_msgSend(v78, "setMaximumNumberOfLines:", 2);
            -[UILabel text](self->_titleLabel, "text");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = v148;
            -[PKDiscoveryCardView _titleLabelFont](self, "_titleLabelFont");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = v117;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "boundingRectWithSize:options:attributes:context:", 1, v118, v78, v77, 3.40282347e38);
            v83 = v119;

            objc_msgSend(v78, "setMaximumNumberOfLines:", 1);
            -[UILabel text](self->_titleLabel, "text");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v153 = v148;
            -[PKDiscoveryCardView _titleLabelFont](self, "_titleLabelFont");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v154 = v121;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "boundingRectWithSize:options:attributes:context:", 1, v122, v78, v77, 3.40282347e38);
            v124 = v123;

            v92 = self->_titleLabel;
            if (v83 <= v124)
            {
              -[UILabel setNumberOfLines:](v92, "setNumberOfLines:", 1);
              v83 = v124;
              goto LABEL_53;
            }
            v93 = 2;
          }
          else
          {
            v86 = v137;
            v87 = rect;
            v162 = CGRectInset(*(CGRect *)&v84, 46.0, 19.0);
            x = v162.origin.x;
            y = v162.origin.y;
            width = v162.size.width;
            height = v162.size.height;
            v92 = self->_titleLabel;
            v93 = 3;
          }
          -[UILabel setNumberOfLines:](v92, "setNumberOfLines:", v93);
LABEL_53:
          memset(&v150, 0, sizeof(v150));
          memset(&v149[1], 0, 32);
          v167.origin.x = x;
          v167.origin.y = y;
          v167.size.width = width;
          v167.size.height = height;
          CGRectDivide(v167, (CGRect *)&v149[1], &v150, v83 + (height - v83 - v145) * 0.5, CGRectMaxYEdge);
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v50 = v125;
          v52 = v126;
          v54 = v127;
          v56 = v128;
          PKContentAlignmentMake();
          PKSizeAlignedInRect();
          v61 = v129;
          v147 = v130;
          v64 = v131;
          v66 = v132;

          goto LABEL_24;
        }
        *(_QWORD *)&v165.origin.x = v149[0];
        v165.size.height = rect;
        v165.origin.y = v136;
        v165.size.width = v137;
        CGRectInset(v165, 46.0, 29.0);
        PKContentAlignmentMake();
LABEL_48:
        PKSizeAlignedInRect();
        v50 = v110;
        v52 = v111;
        v54 = v112;
        v56 = v113;
        v61 = v142;
        goto LABEL_24;
      }
      v142 = v61;
      PKFloatRoundToPixel();
      *(_QWORD *)&v164.origin.x = v149[0];
      v164.size.height = rect;
      v164.origin.y = v136;
      v164.size.width = v137;
      CGRectInset(v164, 16.0, 29.0);
      if (!v68)
      {
        PKContentAlignmentMake();
        goto LABEL_48;
      }
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v143 = v102;
      v147 = v103;
      v64 = v104;
      v66 = v105;
      PKContentAlignmentMake();
      v61 = v143;
    }
    PKSizeAlignedInRect();
    v50 = v106;
    v52 = v107;
    v54 = v108;
    v56 = v109;
  }
LABEL_24:
  -[UILabel setFrame:](self->_headingLabel, "setFrame:", v50, v52, v54, v56);
  if (v68)
  {
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v69);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v61, v147, v64, v66);
  }
  -[PKDiscoveryCard callToAction](self->_card, "callToAction");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[PKDiscoveryCallToActionFooterView sizeThatFits:](self->_ctaFooterView, "sizeThatFits:", v137, rect);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[PKDiscoveryCallToActionFooterView setFrame:](self->_ctaFooterView, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (self->_displayType)
  {
    +[PKDiscoveryCardView expandedSize](PKDiscoveryCardView, "expandedSize", a3.width, a3.height);
  }
  else if (self->_shouldDisplayAsLarge)
  {
    +[PKDiscoveryCardView compressedSize](PKDiscoveryCardView, "compressedSize", a3.width, a3.height);
  }
  else
  {
    +[PKDiscoveryCardView miniCompressedSize](PKDiscoveryCardView, "miniCompressedSize", a3.width, a3.height);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setDismissAction:(id)a3
{
  void *v4;
  id dismissAction;

  if (self->_dismissAction != a3)
  {
    v4 = _Block_copy(a3);
    dismissAction = self->_dismissAction;
    self->_dismissAction = v4;

    -[PKDiscoveryCardView _updateForDisplayType](self, "_updateForDisplayType");
    -[PKDiscoveryCardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCardTemplateInformation:(id)a3
{
  PKDiscoveryCardViewTemplateInformation *v4;
  PKDiscoveryCardViewTemplateInformation *cardTemplateInformation;
  int64_t displayType;
  int64_t v7;
  int64_t currentCardSize;
  int64_t v9;

  v4 = (PKDiscoveryCardViewTemplateInformation *)objc_msgSend(a3, "copy");
  cardTemplateInformation = self->_cardTemplateInformation;
  self->_cardTemplateInformation = v4;

  displayType = self->_displayType;
  v7 = -[PKDiscoveryCardViewTemplateInformation displayType](self->_cardTemplateInformation, "displayType");
  if (displayType != v7)
    self->_displayType = -[PKDiscoveryCardViewTemplateInformation displayType](self->_cardTemplateInformation, "displayType");
  currentCardSize = self->_currentCardSize;
  if (currentCardSize != -[PKDiscoveryCardViewTemplateInformation cardSize](self->_cardTemplateInformation, "cardSize"))
  {
    v9 = -[PKDiscoveryCardViewTemplateInformation cardSize](self->_cardTemplateInformation, "cardSize");
    self->_currentCardSize = v9;
    self->_shouldDisplayAsLarge = v9 == 0;
    goto LABEL_7;
  }
  if (displayType != v7)
  {
LABEL_7:
    -[PKDiscoveryCardView _updateForDisplayType](self, "_updateForDisplayType");
    -[PKDiscoveryCardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_headingLabelFont
{
  void *v2;

  if (self->_shouldDisplayAsLarge || self->_displayType == 1)
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48F8], *MEMORY[0x1E0DC1440]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D8], 2, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_titleLabelFont
{
  void *v2;

  if (self->_shouldDisplayAsLarge || self->_displayType == 1)
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B50], (NSString *)*MEMORY[0x1E0DC48F8], *MEMORY[0x1E0DC1420]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D8], 0x8000, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unint64_t)_titleLabelNumberOfLines
{
  unint64_t v2;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  UILabel *titleLabel;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (self->_displayType == 1)
    return 0;
  if (!self->_shouldDisplayAsLarge)
    return 3;
  -[PKDiscoveryCardView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (self->_isWelcomeCard && !UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    v2 = 3;
  }
  else
  {
    -[PKDiscoveryCardView _titleLabelFont](self, "_titleLabelFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel text](self->_titleLabel, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryCardView _currentContentInsets](self, "_currentContentInsets");
    v9 = v8;
    v11 = v10;
    +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
    v13 = v12 - v9 - v11 + -20.0 + 12.0;
    v14 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    objc_msgSend(v14, "setMaximumNumberOfLines:", 2);
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v13, 1.79769313e308);
      v17 = v16;
    }
    else
    {
      v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    v18 = *MEMORY[0x1E0DC1138];
    v28 = *MEMORY[0x1E0DC1138];
    v29[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v19, v14, v13, 1.79769313e308);
    v21 = v20;

    if (v21 >= v17)
      goto LABEL_13;
    v2 = 1;
    objc_msgSend(v14, "setMaximumNumberOfLines:", 1);
    v26 = v18;
    v27 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v22, v14, v13, 1.79769313e308);
    v24 = v23;

    if (v21 > v24)
LABEL_13:
      v2 = 2;

  }
  return v2;
}

- (void)_dismissButtonPressed
{
  id WeakRetained;
  void *v4;
  char v5;
  id v6;
  id v7;

  -[PKContinuousButton setEnabled:](self->_dismissButton, "setEnabled:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v7;
    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "discoveryCardViewRemoveTapped:", self);

      v4 = v7;
    }
  }

}

- (void)tapGestureRecognized:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "discoveryCardViewTapped:", self);
      v5 = v7;
    }
  }

}

- (UIEdgeInsets)_currentContentInsets
{
  void *v3;
  void *v4;
  double v5;
  double top;
  double v7;
  double left;
  double v9;
  double bottom;
  double v11;
  double right;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  if (self->_displayType == 1)
  {
    -[PKDiscoveryCardView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PKDiscoveryCardView superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safeAreaInsets");
      top = v5;
      left = v7;
      bottom = v9;
      right = v11;

    }
    else
    {
      -[PKDiscoveryCardView safeAreaInsets](self, "safeAreaInsets");
      top = v17;
      left = v18;
      bottom = v19;
      right = v20;
    }

    if (self->_hasSafeAreaInsetOverride)
    {
      top = self->_safeAreaOverrideInsets.top;
      left = self->_safeAreaOverrideInsets.left;
      bottom = self->_safeAreaOverrideInsets.bottom;
      right = self->_safeAreaOverrideInsets.right;
    }
    v14 = fmax(top, 45.0);
    v13 = fmax(left, 20.0);
    v15 = fmax(bottom, 0.0);
    v16 = fmax(right, 20.0);
  }
  else
  {
    v13 = 20.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 20.0;
  }
  result.right = v16;
  result.bottom = v15;
  result.left = v13;
  result.top = v14;
  return result;
}

- (double)_yOffsetToHeadingLabel
{
  double result;

  result = 20.0;
  if (self->_displayType == 1)
    return 0.0;
  return result;
}

- (void)loadAndUploadImageData
{
  PKDiscoveryMedia **p_largeCardMedia;
  PKDiscoveryMedia *v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(void *, void *);
  id v20;
  id location;
  _QWORD aBlock[5];

  if (self->_shouldDisplayAsLarge
    || self->_displayType == 1
    || (p_largeCardMedia = &self->_miniCardMedia, !-[PKDiscoveryMedia type](self->_miniCardMedia, "type")))
  {
    p_largeCardMedia = &self->_largeCardMedia;
  }
  v4 = *p_largeCardMedia;
  v5 = -[PKDiscoveryMedia type](v4, "type");
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke;
  aBlock[3] = &unk_1E3E75630;
  aBlock[4] = self;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v5 == 4)
  {
    -[PKDiscoveryMedia localAssetURL](v4, "localAssetURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageWithContentsOfFile:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      v7[2](v7, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v17);
    }
  }
  else
  {
    if (v5 != 3)
    {
      v15 = PKUIScreenScale();
      -[PKDiscoveryMedia imageDataFromCacheWithScale:](v4, "imageDataFromCacheWithScale:");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_initWeak(&location, self);
        v18[0] = v6;
        v18[1] = 3221225472;
        v18[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_3;
        v18[3] = &unk_1E3E75658;
        objc_copyWeak(&v20, &location);
        v19 = v7;
        -[PKDiscoveryMedia downloadImageDataWithScale:shouldWriteData:completion:](v4, "downloadImageDataWithScale:shouldWriteData:completion:", 1, v18, v15);

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
        v9 = 0;
        goto LABEL_15;
      }
      v9 = (void *)v16;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v16);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    -[PKDiscoveryMedia passKitUIImageName](v4, "passKitUIImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      PKUIImageNamed(v8);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v14 = (void *)v10;
      goto LABEL_14;
    }
  }
LABEL_15:

}

id __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  double v14;
  double v15;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 528) && !*(_QWORD *)(v4 + 536))
  {
    objc_msgSend((id)v4, "_miniCardImageSize");
    objc_msgSend(v3, "size");
    objc_msgSend(v3, "size");
    PKFloatRoundToPixel();
    v6 = v5;
    PKFloatRoundToPixel();
    v8 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v7, v6);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_2;
    v12[3] = &unk_1E3E741E0;
    v14 = v8;
    v15 = v6;
    v13 = v3;
    v10 = v3;
    objc_msgSend(v9, "imageWithActions:", v12);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_4;
  v7[3] = &unk_1E3E687B0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v8 = v5;
  v11 = a3;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v10);
}

void __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(unsigned __int8 *)(a1 + 56);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(WeakRetained[56], "setImage:", v5);
    }
    else
    {
      v6 = WeakRetained[56];
      v7 = (void *)MEMORY[0x1E0DC3F10];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_5;
      v8[3] = &unk_1E3E61388;
      v8[4] = WeakRetained;
      v9 = v5;
      objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v8, 0, 0.300000012);

    }
  }

}

uint64_t __45__PKDiscoveryCardView_loadAndUploadImageData__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setImage:", *(_QWORD *)(a1 + 40));
}

- (CGSize)_miniCardImageSize
{
  int64_t miniCardTemplate;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  CGSize result;

  miniCardTemplate = self->_miniCardTemplate;
  if (miniCardTemplate == 2)
  {
    v4 = 343.0;
    v5 = 0x4053000000000000;
LABEL_10:
    v3 = *(double *)&v5;
    goto LABEL_11;
  }
  if (miniCardTemplate == 1)
  {
    +[PKDiscoveryCardView compressedWidth](PKDiscoveryCardView, "compressedWidth");
    if (v6 <= 335.0)
      v4 = 132.0;
    else
      v4 = 152.0;
    v5 = 0x405E000000000000;
    goto LABEL_10;
  }
  v3 = 0.0;
  v4 = 0.0;
  if (!miniCardTemplate)
  {
    v3 = 88.0;
    v4 = 88.0;
  }
LABEL_11:
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_updateForDisplayType
{
  uint64_t v2;
  _BOOL4 shouldDisplayAsLarge;
  UILabel *titleLabel;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *headingLabel;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  UIColor *v19;
  UIColor **p_backgroundColor;
  UIColor *backgroundColor;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *v28;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  UILabel *v33;
  void *v34;
  UILabel *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PKDiscoveryCallToActionFooterView *ctaFooterView;
  double v43;
  UIImageView *shadowView;
  PKContinuousButton *dismissButton;
  _BOOL8 v46;
  double v47;
  uint64_t v48;
  id v49;

  shouldDisplayAsLarge = self->_shouldDisplayAsLarge;
  if (self->_shouldDisplayAsLarge)
  {
    titleLabel = self->_titleLabel;
    -[PKDiscoveryCard title](self->_card, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](titleLabel, "setText:", v6);

    v7 = self->_titleLabel;
    -[PKDiscoveryCardView _titleLabelFont](self, "_titleLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_titleLabel;
    -[PKDiscoveryCardView _titleLabelTextColor](self, "_titleLabelTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", -[PKDiscoveryCardView _titleLabelNumberOfLines](self, "_titleLabelNumberOfLines"));
    headingLabel = self->_headingLabel;
    -[PKDiscoveryCard heading](self->_card, "heading");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](headingLabel, "setText:", v12);

    v13 = self->_headingLabel;
    -[PKDiscoveryCardView _headingLabelFont](self, "_headingLabelFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    v15 = self->_headingLabel;
    -[PKDiscoveryCardView _headingLabelTextColor](self, "_headingLabelTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[PKDiscoveryCallToActionFooterView setHidden:](self->_ctaFooterView, "setHidden:", 0);
    v17 = (void *)MEMORY[0x1E0DC3658];
    -[PKDiscoveryCard backgroundColor](self->_card, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pkui_colorWithPKColor:", v18);
    v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    p_backgroundColor = &self->_backgroundColor;
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v19;

    -[UIImageView setBackgroundColor:](self->_backgroundImageView, "setBackgroundColor:", self->_backgroundColor);
  }
  else
  {
    v48 = 536;
    if (self->_displayType)
    {
      v22 = self->_titleLabel;
      v2 = 416;
      -[PKDiscoveryCard title](self->_card, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v22, "setText:", v23);

      v24 = self->_headingLabel;
      -[PKDiscoveryCard heading](self->_card, "heading");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v24, "setText:", v25);
    }
    else
    {
      -[PKMiniDiscoveryCard title](self->_miniCard, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMiniDiscoveryCard heading](self->_miniCard, "heading");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = self->_titleLabel;
      if (objc_msgSend(v25, "length"))
      {
        -[UILabel setText:](v27, "setText:", v25);
      }
      else
      {
        -[PKDiscoveryCard title](self->_card, "title");
        v2 = objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v27, "setText:", v2);

      }
      v28 = self->_headingLabel;
      if (objc_msgSend(v26, "length", 536))
      {
        -[UILabel setText:](v28, "setText:", v26);
      }
      else
      {
        -[PKDiscoveryCard heading](self->_card, "heading");
        v2 = objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v28, "setText:", v2);

      }
    }

    v29 = self->_titleLabel;
    -[PKDiscoveryCardView _titleLabelFont](self, "_titleLabelFont");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v29, "setFont:", v30);

    v31 = self->_titleLabel;
    -[PKDiscoveryCardView _titleLabelTextColor](self, "_titleLabelTextColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v31, "setTextColor:", v32);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", -[PKDiscoveryCardView _titleLabelNumberOfLines](self, "_titleLabelNumberOfLines"));
    v33 = self->_headingLabel;
    -[PKDiscoveryCardView _headingLabelFont](self, "_headingLabelFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v33, "setFont:", v34);

    v35 = self->_headingLabel;
    -[PKDiscoveryCardView _headingLabelTextColor](self, "_headingLabelTextColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v35, "setTextColor:", v36);

    -[PKDiscoveryCallToActionFooterView setHidden:](self->_ctaFooterView, "setHidden:", 1);
    v37 = (void *)MEMORY[0x1E0DC3658];
    -[PKMiniDiscoveryCard backgroundColor](self->_miniCard, "backgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pkui_colorWithPKColor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39)
    {
      v41 = (void *)MEMORY[0x1E0DC3658];
      -[PKDiscoveryCard backgroundColor](self->_card, "backgroundColor");
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "pkui_colorWithPKColor:", v2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    p_backgroundColor = &self->_backgroundColor;
    objc_storeStrong((id *)&self->_backgroundColor, v40);
    if (!v39)
    {

    }
    -[UIImageView setBackgroundColor:](self->_backgroundImageView, "setBackgroundColor:", *p_backgroundColor);
    if (!*(Class *)((char *)&self->super.super.super.isa + v48) && !self->_miniCardTemplate)
      -[UIImageView _setContinuousCornerRadius:](self->_backgroundImageView, "_setContinuousCornerRadius:", 14.0);
  }
  -[UIView setBackgroundColor:](self->_miniCardBackgroundColorView, "setBackgroundColor:", *p_backgroundColor);
  -[UIView setHidden:](self->_miniCardBackgroundColorView, "setHidden:", shouldDisplayAsLarge);
  -[PKDiscoveryCardView loadAndUploadImageData](self, "loadAndUploadImageData");
  -[PKDiscoveryCardView setNeedsLayout](self, "setNeedsLayout");
  ctaFooterView = self->_ctaFooterView;
  if (self->_displayType)
  {
    -[PKDiscoveryCallToActionFooterView setDisplayType:](ctaFooterView, "setDisplayType:", 1);
    v43 = 0.0;
    -[UIImageView _setContinuousCornerRadius:](self->_backgroundImageView, "_setContinuousCornerRadius:", 0.0);
    -[UIImageView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    -[PKDiscoveryCardView setMaskView:](self, "setMaskView:", 0);
    -[PKDiscoveryCardView setBackgroundColor:](self, "setBackgroundColor:", self->_backgroundColor);
    dismissButton = self->_dismissButton;
    v46 = 1;
  }
  else
  {
    -[PKDiscoveryCallToActionFooterView setDisplayType:](ctaFooterView, "setDisplayType:", 0);
    +[PKDiscoveryCardView cornerRadius](PKDiscoveryCardView, "cornerRadius");
    v43 = v47;
    if (!self->_shouldDisplayAsLarge && !self->_displayType && !self->_miniCardTemplate)
      -[UIImageView _setContinuousCornerRadius:](self->_backgroundImageView, "_setContinuousCornerRadius:", 14.0);
    dismissButton = self->_dismissButton;
    v46 = self->_dismissAction == 0;
  }
  -[PKContinuousButton setHidden:](dismissButton, "setHidden:", v46, v48);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", -[PKDiscoveryCardView _titleLabelNumberOfLines](self, "_titleLabelNumberOfLines"));
  -[PKDiscoveryCardView layer](self, "layer");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setCornerRadius:", v43);
  objc_msgSend(v49, "setMaskedCorners:", 15);

}

- (id)_dismissButtonColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldDisplayAsLarge
    || (v4 = -[PKMiniDiscoveryCard foregroundContentMode](self->_miniCard, "foregroundContentMode")) == 0)
  {
    v4 = -[PKDiscoveryCard foregroundContentMode](self->_card, "foregroundContentMode");
  }
  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v5;

    v3 = v6;
  }
  return v3;
}

- (id)_titleLabelTextColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldDisplayAsLarge
    || (v4 = -[PKMiniDiscoveryCard foregroundContentMode](self->_miniCard, "foregroundContentMode")) == 0)
  {
    v4 = -[PKDiscoveryCard foregroundContentMode](self->_card, "foregroundContentMode");
  }
  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v5;

    v3 = v6;
  }
  return v3;
}

- (id)_headingLabelTextColor
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->_shouldDisplayAsLarge
    || (v3 = -[PKMiniDiscoveryCard foregroundContentMode](self->_miniCard, "foregroundContentMode")) == 0)
  {
    v3 = -[PKDiscoveryCard foregroundContentMode](self->_card, "foregroundContentMode");
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (PKDiscoveryArticleLayout)articleLayout
{
  return self->_articleLayout;
}

- (void)setArticleLayout:(id)a3
{
  objc_storeStrong((id *)&self->_articleLayout, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (PKDiscoveryCardViewDelegate)delegate
{
  return (PKDiscoveryCardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isRemoving
{
  return self->_removing;
}

- (void)setRemoving:(BOOL)a3
{
  self->_removing = a3;
}

- (PKDiscoveryCardViewTemplateInformation)cardTemplateInformation
{
  return self->_cardTemplateInformation;
}

- (BOOL)hasSafeAreaInsetOverride
{
  return self->_hasSafeAreaInsetOverride;
}

- (void)setHasSafeAreaInsetOverride:(BOOL)a3
{
  self->_hasSafeAreaInsetOverride = a3;
}

- (UIEdgeInsets)safeAreaOverrideInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaOverrideInsets.top;
  left = self->_safeAreaOverrideInsets.left;
  bottom = self->_safeAreaOverrideInsets.bottom;
  right = self->_safeAreaOverrideInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSafeAreaOverrideInsets:(UIEdgeInsets)a3
{
  self->_safeAreaOverrideInsets = a3;
}

- (id)callToActionTappedOverride
{
  return self->_callToActionTappedOverride;
}

- (id)dismissAction
{
  return self->_dismissAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissAction, 0);
  objc_storeStrong(&self->_callToActionTappedOverride, 0);
  objc_storeStrong((id *)&self->_cardTemplateInformation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_articleLayout, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_ctaFooterView, 0);
  objc_storeStrong((id *)&self->_maskImageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_miniCardBackgroundColorView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_miniCardMedia, 0);
  objc_storeStrong((id *)&self->_largeCardMedia, 0);
  objc_storeStrong((id *)&self->_miniCard, 0);
  objc_storeStrong((id *)&self->_card, 0);
}

@end

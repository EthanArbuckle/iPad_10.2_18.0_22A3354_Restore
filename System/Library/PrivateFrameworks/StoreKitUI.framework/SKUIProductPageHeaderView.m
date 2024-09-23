@implementation SKUIProductPageHeaderView

- (SKUIProductPageHeaderView)initWithClientContext:(id)a3
{
  id v5;
  SKUIProductPageHeaderView *v6;
  SKUIProductPageHeaderView *v7;
  void *v8;
  UIButton *v9;
  UIButton *shareButton;
  double v11;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageHeaderView initWithClientContext:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIProductPageHeaderView;
  v6 = -[SKUIProductPageHeaderView init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    if (SKUIUserInterfaceIdiom(v7->_clientContext) == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UIButtonBarAction"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
      shareButton = v7->_shareButton;
      v7->_shareButton = v9;

      LODWORD(v11) = -1.0;
      -[UIButton setCharge:](v7->_shareButton, "setCharge:", v11);
      v12 = v7->_shareButton;
      -[SKUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
      {
        -[SKUIProductPageHeaderView tintColor](v7, "tintColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "_flatImageWithColor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v12, "setImage:forState:", v15, 0);

      if (!v13)
      -[SKUIProductPageHeaderView addSubview:](v7, "addSubview:", v7->_shareButton);

    }
  }

  return v7;
}

- (void)dealloc
{
  SKUIContentRatingArtworkResourceLoader *contentRatingArtworkLoader;
  objc_super v4;

  -[SKUIItemOfferButton removeTarget:action:forControlEvents:](self->_itemOfferButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[SKUIItemOfferButton setDelegate:](self->_itemOfferButton, "setDelegate:", 0);
  contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
  if (contentRatingArtworkLoader)
    -[SKUIContentRatingArtworkResourceLoader removeObserver:](contentRatingArtworkLoader, "removeObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPageHeaderView;
  -[SKUIProductPageHeaderView dealloc](&v4, sel_dealloc);
}

- (NSString)ageBandString
{
  return -[UILabel text](self->_ageBandLabel, "text");
}

- (NSString)artistName
{
  return -[UIButton titleForState:](self->_artistButton, "titleForState:", 0);
}

- (id)contentRatingName
{
  return -[SKUIItemContentRating contentRatingName](self->_contentRating, "contentRatingName");
}

- (NSString)editorialBadge
{
  return (NSString *)-[SKUIBadgeLabel text](self->_editorialBadgeLabel, "text");
}

- (UIImage)headerImage
{
  return -[UIImageView image](self->_headerImageView, "image");
}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_iconImageView, "image");
}

- (NSString)inAppPurchasesString
{
  return -[UILabel text](self->_inAppPurchasesLabel, "text");
}

- (NSString)itemOfferExplanationText
{
  return -[UILabel text](self->_itemOfferExplanationLabel, "text");
}

- (NSString)itemOfferExplanationTitle
{
  return -[UILabel text](self->_itemOfferExplanationTitleLabel, "text");
}

- (void)setAgeBandString:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *ageBandLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[SKUIProductPageHeaderView ageBandString](self, "ageBandString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v18, "isEqualToString:", v4);

  v6 = v18;
  if ((v5 & 1) == 0)
  {
    ageBandLabel = self->_ageBandLabel;
    if (v18)
    {
      if (!ageBandLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_ageBandLabel;
        self->_ageBandLabel = v8;

        v10 = self->_ageBandLabel;
        -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

        v12 = self->_ageBandLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v12, "setFont:", v13);

        v14 = self->_ageBandLabel;
        -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[UILabel setTextColor:](v14, "setTextColor:", v15);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.400000006);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v14, "setTextColor:", v17);

        }
        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_ageBandLabel);
        ageBandLabel = self->_ageBandLabel;
        v6 = v18;
      }
      -[UILabel setText:](ageBandLabel, "setText:", v6);
      -[UILabel sizeToFit](self->_ageBandLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](ageBandLabel, "removeFromSuperview");
      v16 = self->_ageBandLabel;
      self->_ageBandLabel = 0;

    }
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
    v6 = v18;
  }

}

- (void)setArtistName:(id)a3
{
  id v4;
  UIButton *artistButton;
  SKUILinkButton *v6;
  UIButton *v7;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[SKUIProductPageHeaderView artistName](self, "artistName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v19 && (objc_msgSend(v4, "isEqualToString:", v19) & 1) == 0)
  {
    artistButton = self->_artistButton;
    if (v19)
    {
      if (!artistButton)
      {
        v6 = -[SKUILinkButton initWithArrowStyle:]([SKUILinkButton alloc], "initWithArrowStyle:", 1);
        v7 = self->_artistButton;
        self->_artistButton = &v6->super;

        v8 = self->_artistButton;
        if (self->_headerImageHeight == 0.0)
          -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setBackgroundColor:](v8, "setBackgroundColor:", v10);

        -[UIButton titleLabel](self->_artistButton, "titleLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFont:", v12);

        v13 = self->_artistButton;
        -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.800000012);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v15, 0);

        }
        v16 = self->_artistButton;
        -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[UIButton setTitleColor:forState:](v16, "setTitleColor:forState:", v17, 1);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIButton setTitleColor:forState:](v16, "setTitleColor:forState:", v18, 1);

        }
        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_artistButton);
        artistButton = self->_artistButton;
      }
      -[UIButton setTitle:forState:](artistButton, "setTitle:forState:");
      -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_artistButton);
    }
    else
    {
      -[UIButton removeFromSuperview](artistButton, "removeFromSuperview");
      v9 = self->_artistButton;
      self->_artistButton = 0;

    }
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setContentRatingArtworkLoader:(id)a3
{
  SKUIContentRatingArtworkResourceLoader *v5;
  SKUIContentRatingArtworkResourceLoader *contentRatingArtworkLoader;
  SKUIContentRatingArtworkResourceLoader *v7;

  v5 = (SKUIContentRatingArtworkResourceLoader *)a3;
  contentRatingArtworkLoader = self->_contentRatingArtworkLoader;
  if (contentRatingArtworkLoader != v5)
  {
    v7 = v5;
    -[SKUIContentRatingArtworkResourceLoader removeObserver:](contentRatingArtworkLoader, "removeObserver:", self);
    objc_storeStrong((id *)&self->_contentRatingArtworkLoader, a3);
    -[SKUIContentRatingArtworkResourceLoader addObserver:](self->_contentRatingArtworkLoader, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v5;
  SKUIColorScheme **p_colorScheme;
  void *v7;
  UIButton *artistButton;
  void *v9;
  void *v10;
  UILabel *inAppPurchasesLabel;
  void *v12;
  void *v13;
  UILabel *ageBandLabel;
  void *v15;
  void *v16;
  SKUIProductPageHeaderLabel *titleLabel;
  void *v18;
  void *v19;
  UILabel *userRatingLabel;
  void *v21;
  void *v22;
  SKUIBadgeLabel *editorialBadgeLabel;
  void *v24;
  void *v25;
  void *v26;
  UIButton *shareButton;
  void *v28;
  void *v29;
  void *v30;
  SKUIColorScheme *v31;

  v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v31 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageHeaderView setBackgroundColor:](self, "setBackgroundColor:", v7);

    artistButton = self->_artistButton;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UIButton setTitleColor:forState:](artistButton, "setTitleColor:forState:", v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.800000012);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](artistButton, "setTitleColor:forState:", v10, 0);

    }
    inAppPurchasesLabel = self->_inAppPurchasesLabel;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[UILabel setTextColor:](inAppPurchasesLabel, "setTextColor:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.400000006);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](inAppPurchasesLabel, "setTextColor:", v13);

    }
    ageBandLabel = self->_ageBandLabel;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[UILabel setTextColor:](ageBandLabel, "setTextColor:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.400000006);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](ageBandLabel, "setTextColor:", v16);

    }
    titleLabel = self->_titleLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[SKUIProductPageHeaderLabel setTextColor:](titleLabel, "setTextColor:", v18);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPageHeaderLabel setTextColor:](titleLabel, "setTextColor:", v19);

    }
    userRatingLabel = self->_userRatingLabel;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[UILabel setTextColor:](userRatingLabel, "setTextColor:", v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](userRatingLabel, "setTextColor:", v22);

    }
    editorialBadgeLabel = self->_editorialBadgeLabel;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[SKUIBadgeLabel setBackgroundColor:](editorialBadgeLabel, "setBackgroundColor:", v24);
    }
    else
    {
      +[SKUIBadgeLabel defaultBackgroundColor](SKUIBadgeLabel, "defaultBackgroundColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIBadgeLabel setBackgroundColor:](editorialBadgeLabel, "setBackgroundColor:", v25);

    }
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UIButtonBarAction"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    shareButton = self->_shareButton;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28)
    {
      -[SKUIProductPageHeaderView tintColor](self, "tintColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "_flatImageWithColor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](shareButton, "setImage:forState:", v30, 0);

    if (!v28)
    v5 = v31;
  }

}

- (void)setContentRating:(id)a3
{
  SKUIItemContentRating *v5;
  SKUIProductPageHeaderLabel *titleLabel;
  void *v7;
  SKUIItemContentRating *v8;

  v5 = (SKUIItemContentRating *)a3;
  if (self->_contentRating != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_contentRating, a3);
    titleLabel = self->_titleLabel;
    -[SKUIItemContentRating contentRatingName](self->_contentRating, "contentRatingName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageHeaderLabel setContentRating:](titleLabel, "setContentRating:", v7);

    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setEditorialBadge:(id)a3
{
  id v4;
  SKUIBadgeLabel *editorialBadgeLabel;
  SKUIBadgeLabel *v6;
  SKUIBadgeLabel *v7;
  SKUIBadgeLabel *v8;
  void *v9;
  SKUIBadgeLabel *v10;
  void *v11;
  SKUIBadgeLabel *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SKUIBadgeLabel text](self->_editorialBadgeLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v4, "isEqualToString:", v15) & 1) == 0)
  {
    editorialBadgeLabel = self->_editorialBadgeLabel;
    if (v15)
    {
      if (!editorialBadgeLabel)
      {
        v6 = objc_alloc_init(SKUIBadgeLabel);
        v7 = self->_editorialBadgeLabel;
        self->_editorialBadgeLabel = v6;

        v8 = self->_editorialBadgeLabel;
        -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SKUIBadgeLabel setTextColor:](v8, "setTextColor:", v9);
        }
        else
        {
          +[SKUIBadgeLabel defaultTextColor](SKUIBadgeLabel, "defaultTextColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIBadgeLabel setTextColor:](v8, "setTextColor:", v11);

        }
        v12 = self->_editorialBadgeLabel;
        -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[SKUIBadgeLabel setBackgroundColor:](v12, "setBackgroundColor:", v13);
        }
        else
        {
          +[SKUIBadgeLabel defaultBackgroundColor](SKUIBadgeLabel, "defaultBackgroundColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIBadgeLabel setBackgroundColor:](v12, "setBackgroundColor:", v14);

        }
        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_editorialBadgeLabel);
        editorialBadgeLabel = self->_editorialBadgeLabel;
      }
      -[SKUIBadgeLabel setText:](editorialBadgeLabel, "setText:");
    }
    else
    {
      -[SKUIBadgeLabel removeFromSuperview](editorialBadgeLabel, "removeFromSuperview");
      v10 = self->_editorialBadgeLabel;
      self->_editorialBadgeLabel = 0;

    }
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setHeaderImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *headerImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_headerImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    headerImageView = self->_headerImageView;
    if (v12)
    {
      if (!headerImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v8 = self->_headerImageView;
        self->_headerImageView = v7;

        v9 = self->_headerImageView;
        -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_headerImageView);
        headerImageView = self->_headerImageView;
      }
      -[UIImageView setImage:](headerImageView, "setImage:");
      -[UIImageView sizeToFit](self->_headerImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](headerImageView, "removeFromSuperview");
      v11 = self->_headerImageView;
      self->_headerImageView = 0;

    }
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)setHeaderImageHeight:(double)a3
{
  if (self->_headerImageHeight != a3)
  {
    self->_headerImageHeight = a3;
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIconImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *iconImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_iconImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    iconImageView = self->_iconImageView;
    if (v12)
    {
      if (!iconImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v8 = self->_iconImageView;
        self->_iconImageView = v7;

        v9 = self->_iconImageView;
        if (self->_headerImageHeight == 0.0)
          -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v11);

        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_iconImageView);
        iconImageView = self->_iconImageView;
      }
      -[UIImageView setImage:](iconImageView, "setImage:");
      -[UIImageView sizeToFit](self->_iconImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](iconImageView, "removeFromSuperview");
      v10 = self->_iconImageView;
      self->_iconImageView = 0;

    }
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (void)setInAppPurchasesString:(id)a3
{
  id v4;
  UILabel *inAppPurchasesLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_inAppPurchasesLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v4, "isEqualToString:", v16) & 1) == 0)
  {
    inAppPurchasesLabel = self->_inAppPurchasesLabel;
    if (v16)
    {
      if (!inAppPurchasesLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_inAppPurchasesLabel;
        self->_inAppPurchasesLabel = v6;

        v8 = self->_inAppPurchasesLabel;
        -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_inAppPurchasesLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_inAppPurchasesLabel;
        -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[UILabel setTextColor:](v12, "setTextColor:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.400000006);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v15);

        }
        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_inAppPurchasesLabel);
        inAppPurchasesLabel = self->_inAppPurchasesLabel;
      }
      -[UILabel setText:](inAppPurchasesLabel, "setText:");
      -[UILabel sizeToFit](self->_inAppPurchasesLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](inAppPurchasesLabel, "removeFromSuperview");
      v14 = self->_inAppPurchasesLabel;
      self->_inAppPurchasesLabel = 0;

    }
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setItemOffer:(id)a3
{
  SKUIItemOffer *v5;
  SKUIItemOffer *v6;

  v5 = (SKUIItemOffer *)a3;
  if (self->_itemOffer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_itemOffer, a3);
    -[SKUIProductPageHeaderView _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
    v5 = v6;
  }

}

- (void)setItemOfferExplanationText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *itemOfferExplanationLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  id v17;

  v17 = a3;
  -[UILabel text](self->_itemOfferExplanationLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v17);

  v6 = v17;
  if ((v5 & 1) == 0)
  {
    itemOfferExplanationLabel = self->_itemOfferExplanationLabel;
    if (v17)
    {
      if (!itemOfferExplanationLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_itemOfferExplanationLabel;
        self->_itemOfferExplanationLabel = v8;

        v10 = self->_itemOfferExplanationLabel;
        -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

        v12 = self->_itemOfferExplanationLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v12, "setFont:", v13);

        v14 = self->_itemOfferExplanationLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v15);

        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_itemOfferExplanationLabel);
        itemOfferExplanationLabel = self->_itemOfferExplanationLabel;
      }
      -[UILabel setText:](itemOfferExplanationLabel, "setText:", v17);
      -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel removeFromSuperview](itemOfferExplanationLabel, "removeFromSuperview");
      v16 = self->_itemOfferExplanationLabel;
      self->_itemOfferExplanationLabel = 0;

    }
    v6 = v17;
  }

}

- (void)setItemOfferExplanationTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  UILabel *itemOfferExplanationTitleLabel;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  id v17;

  v17 = a3;
  -[UILabel text](self->_itemOfferExplanationTitleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v17);

  v6 = v17;
  if ((v5 & 1) == 0)
  {
    itemOfferExplanationTitleLabel = self->_itemOfferExplanationTitleLabel;
    if (v17)
    {
      if (!itemOfferExplanationTitleLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v9 = self->_itemOfferExplanationTitleLabel;
        self->_itemOfferExplanationTitleLabel = v8;

        v10 = self->_itemOfferExplanationTitleLabel;
        -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

        v12 = self->_itemOfferExplanationTitleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v12, "setFont:", v13);

        v14 = self->_itemOfferExplanationTitleLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v15);

        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_itemOfferExplanationTitleLabel);
        itemOfferExplanationTitleLabel = self->_itemOfferExplanationTitleLabel;
      }
      -[UILabel setText:](itemOfferExplanationTitleLabel, "setText:", v17);
      -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel removeFromSuperview](itemOfferExplanationTitleLabel, "removeFromSuperview");
      v16 = self->_itemOfferExplanationTitleLabel;
      self->_itemOfferExplanationTitleLabel = 0;

    }
    v6 = v17;
  }

}

- (void)setItemState:(id)a3
{
  -[SKUIProductPageHeaderView setItemState:animated:](self, "setItemState:animated:", a3, 0);
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SKUIItemState *v6;
  SKUIItemState *itemState;

  if (self->_itemState != a3)
  {
    v4 = a4;
    v6 = (SKUIItemState *)objc_msgSend(a3, "copy");
    itemState = self->_itemState;
    self->_itemState = v6;

    -[SKUIProductPageHeaderView _reloadItemOfferButton:](self, "_reloadItemOfferButton:", v4);
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  id v4;
  UILabel *userRatingLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  SKUIClientContext *clientContext;

  if (self->_numberOfUserRatings != a3 || !self->_userRatingLabel)
  {
    self->_numberOfUserRatings = a3;
    if (self->_userRatingLabel)
    {
      if (a3)
      {
LABEL_5:
        v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
        objc_msgSend(v4, "setNumberStyle:", 1);
        userRatingLabel = self->_userRatingLabel;
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfUserRatings);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringFromNumber:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@)"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](userRatingLabel, "setText:", v9);

LABEL_14:
        -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
        return;
      }
    }
    else
    {
      v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v11 = self->_userRatingLabel;
      self->_userRatingLabel = v10;

      v12 = self->_userRatingLabel;
      -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

      v14 = self->_userRatingLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v14, "setFont:", v15);

      v16 = self->_userRatingLabel;
      -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[UILabel setTextColor:](v16, "setTextColor:", v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.600000024);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v16, "setTextColor:", v18);

      }
      -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_userRatingLabel);
      if (self->_numberOfUserRatings)
        goto LABEL_5;
    }
    v19 = self->_userRatingLabel;
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("NO_RATINGS"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NO_RATINGS"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v19, "setText:", v4);
    goto LABEL_14;
  }
}

- (void)setRestricted:(BOOL)a3
{
  if (self->_restricted != a3)
  {
    self->_restricted = a3;
    -[SKUIProductPageHeaderView _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
  }
}

- (void)setTitle:(id)a3
{
  id v4;
  SKUIProductPageHeaderLabel *titleLabel;
  SKUIProductPageHeaderLabel *v6;
  SKUIProductPageHeaderLabel *v7;
  SKUIProductPageHeaderLabel *v8;
  void *v9;
  void *v10;
  SKUIProductPageHeaderLabel *v11;
  void *v12;
  void *v13;
  SKUIProductPageHeaderLabel *v14;
  void *v15;
  void *v16;
  SKUIProductPageHeaderLabel *v17;
  id v18;

  v18 = a3;
  -[SKUIProductPageHeaderLabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v18 && (objc_msgSend(v4, "isEqualToString:", v18) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v18)
    {
      if (!titleLabel)
      {
        v6 = objc_alloc_init(SKUIProductPageHeaderLabel);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        -[SKUIProductPageHeaderLabel setIsPad:](self->_titleLabel, "setIsPad:", SKUIUserInterfaceIdiom(self->_clientContext) == 1);
        v8 = self->_titleLabel;
        if (self->_headerImageHeight == 0.0)
          -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIProductPageHeaderLabel setBackgroundColor:](v8, "setBackgroundColor:", v10);

        v11 = self->_titleLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[SKUIProductPageHeaderLabel setRatingColor:](v11, "setRatingColor:", v12);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.62745098, 1.0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIProductPageHeaderLabel setRatingColor:](v11, "setRatingColor:", v13);

        }
        v14 = self->_titleLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[SKUIProductPageHeaderLabel setTextColor:](v14, "setTextColor:", v15);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIProductPageHeaderLabel setTextColor:](v14, "setTextColor:", v16);

        }
        -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[SKUIProductPageHeaderLabel setText:](titleLabel, "setText:");
      v17 = self->_titleLabel;
      -[SKUIProductPageHeaderView contentRatingName](self, "contentRatingName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIProductPageHeaderLabel setContentRating:](v17, "setContentRating:", v9);
    }
    else
    {
      -[SKUIProductPageHeaderLabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v9 = self->_titleLabel;
      self->_titleLabel = 0;
    }

    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSecondaryContentRating:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  SKUIProductPageHeaderLabel *titleLabel;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIContentRatingArtworkResourceLoader cachedImageForContentRating:withClientContext:](self->_contentRatingArtworkLoader, "cachedImageForContentRating:withClientContext:", v4, self->_clientContext);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    titleLabel = self->_titleLabel;
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIProductPageHeaderLabel setSecondaryContentRatingImages:](titleLabel, "setSecondaryContentRatingImages:", v8);

    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[SKUIContentRatingArtworkResourceLoader loadImageForContentRating:clientContent:reason:](self->_contentRatingArtworkLoader, "loadImageForContentRating:clientContent:reason:", v4, self->_clientContext, 1);
  }

}

- (void)setUserRating:(double)a3
{
  UIImageView *v4;
  UIImageView *userRatingStarsView;
  UIImageView *v6;
  void *v7;
  UIImageView *v8;
  void *v9;
  id v10;

  if (self->_userRating != a3 || !self->_userRatingStarsView)
  {
    self->_userRating = a3;
    if (!self->_userRatingStarsView)
    {
      v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      userRatingStarsView = self->_userRatingStarsView;
      self->_userRatingStarsView = v4;

      v6 = self->_userRatingStarsView;
      -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v6, "setBackgroundColor:", v7);

      -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_userRatingStarsView);
    }
    +[SKUIRatingStarsCache cacheWithProperties:](SKUIRatingStarsCache, "cacheWithProperties:", 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = self->_userRatingStarsView;
    objc_msgSend(v10, "ratingStarsImageForRating:", self->_userRating);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v8, "setImage:", v9);

    -[UIImageView sizeToFit](self->_userRatingStarsView, "sizeToFit");
  }
}

- (NSString)title
{
  return -[SKUIProductPageHeaderLabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double headerImageHeight;
  double v10;
  double v11;
  UIImageView *iconImageView;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  UIButton *shareButton;
  uint64_t v19;
  double MinX;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  SKUIProductPageHeaderLabel *titleLabel;
  UIButton *artistButton;
  SKUIBadgeLabel *editorialBadgeLabel;
  UILabel *inAppPurchasesLabel;
  double v31;
  UILabel *ageBandLabel;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  UIImageView *userRatingStarsView;
  double v46;
  char v47;
  double v48;
  SKUIItemOfferButton *itemOfferButton;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  UILabel *itemOfferExplanationTitleLabel;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  SKUIItemOfferButton *v66;
  float v67;
  double v68;
  double v69;
  UILabel *userRatingLabel;
  double x;
  double y;
  double height;
  double v74;
  double v75;
  CGFloat rect;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  __int128 *v82;
  _OWORD *v83;
  _OWORD v84[2];
  uint64_t v85;
  _OWORD v86[3];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  double v92;
  _OWORD v93[3];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v106 = *MEMORY[0x1E0C80C00];
  -[SKUIItemOfferButton layer](self->_itemOfferButton, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    self->_needsLayoutAfterButtonAnimation = 1;
    return;
  }
  -[SKUIProductPageHeaderView bounds](self, "bounds");
  v7 = v6;
  v8 = SKUIUserInterfaceIdiom(self->_clientContext) == 1;
  if (self->_headerImageView)
  {
    -[SKUIProductPageHeaderView sendSubviewToBack:](self, "sendSubviewToBack:");
    -[UIImageView sizeToFit](self->_headerImageView, "sizeToFit");
    -[UIImageView frame](self->_headerImageView, "frame");
    -[UIImageView setFrame:](self->_headerImageView, "setFrame:", 0.0, 0.0);
  }
  headerImageHeight = self->_headerImageHeight;
  v10 = 0.0;
  v11 = headerImageHeight + 0.0 + 15.0;
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    -[UIImageView frame](iconImageView, "frame");
    v14 = v13;
    v16 = v15;
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:", 15.0, headerImageHeight + 0.0 + 15.0);
    v107.origin.x = 15.0;
    v107.origin.y = headerImageHeight + 0.0 + 15.0;
    v107.size.width = v14;
    v107.size.height = v16;
    v10 = CGRectGetMaxX(v107) + 15.0;
  }
  v17 = v7 + -15.0;
  shareButton = self->_shareButton;
  v19 = MEMORY[0x1E0C9D5E0];
  MinX = v7 + -15.0;
  if (shareButton)
  {
    -[UIButton frame](shareButton, "frame", MinX);
    -[UIButton sizeThatFits:](self->_shareButton, "sizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
    v22 = v21;
    v24 = v23;
    v25 = v17 - v21;
    -[UIButton setFrame:](self->_shareButton, "setFrame:", v17 - v21, headerImageHeight + 0.0 + 15.0, v21, v23);
    v108.origin.x = v25;
    v108.origin.y = headerImageHeight + 0.0 + 15.0;
    v108.size.width = v22;
    v108.size.height = v24;
    MinX = CGRectGetMinX(v108);
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  memset(v93, 0, sizeof(v93));
  v83 = v93;
  v92 = 0.0;
  v90 = 0u;
  v91 = 0u;
  v81 = 0.0;
  v82 = &v90;
  v26 = MinX - v10;
  -[SKUIProductPageHeaderView _getTopLayoutProperties:origins:height:forWidth:](self, "_getTopLayoutProperties:origins:height:forWidth:", &v83, &v82, &v81, MinX - v10);
  titleLabel = self->_titleLabel;
  if (titleLabel)
    -[SKUIProductPageHeaderLabel setFrame:](titleLabel, "setFrame:", v10, v11 + *(double *)&v90, v93[0]);
  artistButton = self->_artistButton;
  if (artistButton)
    -[UIButton setFrame:](artistButton, "setFrame:", v10, v11 + *((double *)&v90 + 1), v94);
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (editorialBadgeLabel)
    -[SKUIBadgeLabel setFrame:](editorialBadgeLabel, "setFrame:", v10, v11 + *(double *)&v91, v97);
  inAppPurchasesLabel = self->_inAppPurchasesLabel;
  if (inAppPurchasesLabel)
    -[UILabel setFrame:](inAppPurchasesLabel, "setFrame:", v10, v11 + *((double *)&v91 + 1), v100);
  v31 = dbl_1BBED1EA0[v8];
  ageBandLabel = self->_ageBandLabel;
  if (ageBandLabel)
    -[UILabel setFrame:](ageBandLabel, "setFrame:", v10, v11 + v92, v103);
  v33 = v31 + headerImageHeight;
  v88 = 0u;
  v89 = 0u;
  v87 = 0u;
  memset(v86, 0, sizeof(v86));
  v83 = v86;
  v85 = 0;
  memset(v84, 0, sizeof(v84));
  v82 = v84;
  v80 = 0.0;
  -[SKUIProductPageHeaderView _getBottomLayoutProperties:origins:height:forWidth:](self, "_getBottomLayoutProperties:origins:height:forWidth:", &v83, &v82, &v80, v26);
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    v34 = v11 + v81;
    v35 = SKUIUserInterfaceIdiom(self->_clientContext);
    v36 = 7.0;
    if (v35 == 1)
      v36 = 11.0;
    goto LABEL_37;
  }
  v37 = v81 + v80;
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
    v38 = 11.0;
  else
    v38 = 7.0;
  v39 = v37 + v38;
  v40 = SKUIUserInterfaceIdiom(self->_clientContext);
  v41 = 100.0;
  if (v40 == 1)
    v41 = 170.0;
  if (v39 >= v41)
  {
    v43 = v11 + v81;
    if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
      v44 = 11.0;
    else
      v44 = 7.0;
    v33 = v80 + v43 + v44;
    v34 = v11 + v81;
    if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
      v36 = 11.0;
    else
      v36 = 7.0;
LABEL_37:
    v42 = v34 + v36;
    goto LABEL_38;
  }
  v42 = v33 - v80;
LABEL_38:
  if (self->_userRatingLabel)
  {
    userRatingStarsView = self->_userRatingStarsView;
    v46 = v10;
    if (userRatingStarsView)
    {
      v47 = -[UIImageView isHidden](userRatingStarsView, "isHidden", v10);
      v46 = v10;
      if ((v47 & 1) == 0)
      {
        -[UIImageView frame](self->_userRatingStarsView, "frame", v10);
        -[UIImageView setFrame:](self->_userRatingStarsView, "setFrame:", v10, v42 + *((double *)v84 + 1) + 2.0);
        -[UIImageView frame](self->_userRatingStarsView, "frame");
        v46 = v10 + v48 + 3.0;
      }
    }
    -[UILabel setFrame:](self->_userRatingLabel, "setFrame:", v46, v42 + *((double *)v84 + 1), v87);
  }
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton)
  {
    -[SKUIItemOfferButton frame](itemOfferButton, "frame");
    v51 = v50;
    v53 = v52;
    v54 = v33 - v52;
    if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
      v55 = v10;
    else
      v55 = v7 - v51 + -15.0;
  }
  else
  {
    v55 = *MEMORY[0x1E0C9D648];
    v54 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v51 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v53 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  itemOfferExplanationTitleLabel = self->_itemOfferExplanationTitleLabel;
  if (itemOfferExplanationTitleLabel && self->_itemOfferExplanationLabel)
  {
    v78 = v33;
    v79 = v17;
    v57 = *(double *)(v19 + 16);
    v58 = *(double *)(v19 + 24);
    -[UILabel sizeThatFits:](itemOfferExplanationTitleLabel, "sizeThatFits:", v57, v58);
    rect = v59;
    v61 = v60;
    -[UILabel sizeThatFits:](self->_itemOfferExplanationLabel, "sizeThatFits:", v57, v58);
    v77 = v62;
    v63 = v61 + v62;
    if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
    {
      if (self->_itemOfferButton)
      {
        v109.origin.x = v55;
        v109.origin.y = v54;
        v109.size.width = v51;
        v109.size.height = v53;
        v10 = CGRectGetMaxX(v109) + 8.0;
      }
      v64 = v78 - v63;
      v65 = v79;
    }
    else
    {
      v10 = 15.0;
      v64 = v78 + 15.0;
      v66 = self->_itemOfferButton;
      v67 = (v63 - v53) * 0.5;
      v68 = v78 + 15.0 + floorf(v67);
      if (v66)
        v54 = v68;
      v65 = v79;
      if (v66)
        v65 = v55 + -8.0;
    }
    v110.origin.x = v10;
    v110.origin.y = v64;
    v110.size.width = rect;
    v110.size.height = v61;
    v69 = v65 - v10;
    -[UILabel setFrame:](self->_itemOfferExplanationLabel, "setFrame:", v10, CGRectGetMaxY(v110), v69, v77);
    -[UILabel setFrame:](self->_itemOfferExplanationTitleLabel, "setFrame:", v10, v64, v69, v61);
  }
  -[SKUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v55, v54, v51, v53);
  userRatingLabel = self->_userRatingLabel;
  if (userRatingLabel)
  {
    -[UILabel frame](userRatingLabel, "frame");
    x = v111.origin.x;
    y = v111.origin.y;
    height = v111.size.height;
    v113.origin.x = v55;
    v113.origin.y = v54;
    v113.size.width = v51;
    v113.size.height = v53;
    if (CGRectIntersectsRect(v111, v113))
    {
      -[SKUIItemOfferButton layoutSizeThatFits:](self->_itemOfferButton, "layoutSizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
      v75 = v74;
      v112.origin.x = v55;
      v112.origin.y = v54;
      v112.size.width = v51;
      v112.size.height = v53;
      -[UILabel setFrame:](self->_userRatingLabel, "setFrame:", x, y, CGRectGetMaxX(v112) - v75 + -5.0 - x, height);
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  UIButton *artistButton;
  void *v6;
  UIImageView *iconImageView;
  void *v8;
  SKUIProductPageHeaderLabel *titleLabel;
  void *v10;
  SKUIBadgeLabel *editorialBadgeLabel;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageHeaderView;
  -[SKUIProductPageHeaderView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);
  artistButton = self->_artistButton;
  if (self->_headerImageHeight == 0.0)
    -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](artistButton, "setBackgroundColor:", v6);

  iconImageView = self->_iconImageView;
  if (self->_headerImageHeight == 0.0)
    -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](iconImageView, "setBackgroundColor:", v8);

  titleLabel = self->_titleLabel;
  if (self->_headerImageHeight == 0.0)
    -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageHeaderLabel setBackgroundColor:](titleLabel, "setBackgroundColor:", v10);

  -[UILabel setBackgroundColor:](self->_ageBandLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_inAppPurchasesLabel, "setBackgroundColor:", v4);
  -[SKUIItemOfferButton setBackgroundColor:](self->_itemOfferButton, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_itemOfferExplanationLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_itemOfferExplanationTitleLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_userRatingLabel, "setBackgroundColor:", v4);
  -[UIImageView setBackgroundColor:](self->_userRatingStarsView, "setBackgroundColor:", v4);
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (v4)
  {
    -[SKUIBadgeLabel setTextColor:](editorialBadgeLabel, "setTextColor:", v4);
  }
  else
  {
    +[SKUIBadgeLabel defaultTextColor](SKUIBadgeLabel, "defaultTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBadgeLabel setTextColor:](editorialBadgeLabel, "setTextColor:", v12);

  }
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIImageView *iconImageView;
  double v11;
  UIButton *shareButton;
  double v13;
  double headerImageHeight;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  SKUIItemOfferButton *itemOfferButton;
  double v28;
  double v29;
  double v30;
  _OWORD *v31;
  _OWORD *v32;
  _OWORD v33[2];
  uint64_t v34;
  _OWORD v35[6];
  _OWORD v36[2];
  uint64_t v37;
  _OWORD v38[15];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[SKUIProductPageHeaderView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v7 + -30.0;
  iconImageView = self->_iconImageView;
  if (iconImageView)
  {
    -[UIImageView frame](iconImageView, "frame");
    v9 = v9 - (v11 + 15.0);
  }
  shareButton = self->_shareButton;
  if (shareButton)
  {
    -[UIButton sizeThatFits:](shareButton, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v9 = v9 - v13;
  }
  memset(v38, 0, sizeof(v38));
  v32 = v38;
  v37 = 0;
  memset(v36, 0, sizeof(v36));
  v30 = 0.0;
  v31 = v36;
  -[SKUIProductPageHeaderView _getTopLayoutProperties:origins:height:forWidth:](self, "_getTopLayoutProperties:origins:height:forWidth:", &v32, &v31, &v30, v9);
  memset(v35, 0, sizeof(v35));
  v32 = v35;
  v34 = 0;
  memset(v33, 0, sizeof(v33));
  v31 = v33;
  v29 = 0.0;
  -[SKUIProductPageHeaderView _getBottomLayoutProperties:origins:height:forWidth:](self, "_getBottomLayoutProperties:origins:height:forWidth:", &v32, &v31, &v29, v9);
  headerImageHeight = self->_headerImageHeight;
  v15 = v30 + 7.0 + v29;
  v16 = SKUIUserInterfaceIdiom(self->_clientContext);
  v17 = 100.0;
  if (v16 == 1)
    v17 = 170.0;
  if (v15 >= v17)
  {
    v19 = v29 + v30 + 15.0 + 7.0 + 5.0;
  }
  else
  {
    v18 = SKUIUserInterfaceIdiom(self->_clientContext);
    v19 = 120.0;
    if (v18 == 1)
      v19 = 190.0;
  }
  v20 = headerImageHeight + v19;
  if (self->_itemOfferExplanationLabel
    && self->_itemOfferExplanationTitleLabel
    && SKUIUserInterfaceIdiom(self->_clientContext) != 1)
  {
    v21 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    -[UILabel sizeThatFits:](self->_itemOfferExplanationTitleLabel, "sizeThatFits:", v21, v22);
    v24 = v23 + 0.0;
    -[UILabel sizeThatFits:](self->_itemOfferExplanationLabel, "sizeThatFits:", v21, v22);
    v26 = v24 + v25;
    itemOfferButton = self->_itemOfferButton;
    if (itemOfferButton)
    {
      -[SKUIItemOfferButton frame](itemOfferButton, "frame");
      if (v26 < v28)
        v26 = v28;
    }
    v20 = v20 + v26 + 15.0;
  }
  -[SKUIProductPageHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v20);
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;

  -[SKUIItemOfferButton frame](self->_itemOfferButton, "frame", a3);
  v5 = v4;
  v7 = v6;
  -[SKUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v9 = v8;
  v11 = v10;
  if (SKUIUserInterfaceIdiom(self->_clientContext))
  {
    if (self->_itemOfferExplanationLabel && self->_itemOfferExplanationTitleLabel)
    {
      -[SKUIProductPageHeaderView bounds](self, "bounds");
      v13 = v12;
      -[UILabel frame](self->_itemOfferExplanationLabel, "frame");
      v15 = v14;
      v17 = v16;
      v31 = v18;
      v32.origin.x = v5;
      v32.origin.y = v7;
      v32.size.width = v9;
      v32.size.height = v11;
      v19 = CGRectGetMaxX(v32) + 8.0;
      v20 = v13 + -15.0;
      if (v13 + -15.0 - v19 >= v17)
        v21 = v17;
      else
        v21 = v13 + -15.0 - v19;
      -[UILabel setFrame:](self->_itemOfferExplanationLabel, "setFrame:", v19, v15, v21, v31);
      -[UILabel frame](self->_itemOfferExplanationTitleLabel, "frame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v33.origin.x = v5;
      v33.origin.y = v7;
      v33.size.width = v9;
      v33.size.height = v11;
      v28 = CGRectGetMaxX(v33) + 8.0;
      if (v20 - v28 >= v25)
        v29 = v25;
      else
        v29 = v20 - v28;
      -[UILabel setFrame:](self->_itemOfferExplanationTitleLabel, "setFrame:", v28, v23, v29, v27);
    }
  }
  else
  {
    -[SKUIProductPageHeaderView bounds](self, "bounds");
    v5 = v30 - v9 + -15.0;
  }
  -[SKUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v5, v7, v9, v11);
  -[SKUIProductPageHeaderView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__finishButtonAnimation, 0, 1.0);
}

- (void)contentRatingArtworkLoader:(id)a3 didLoadImage:(id)a4 forContentRating:(id)a5
{
  SKUIProductPageHeaderLabel *titleLabel;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  titleLabel = self->_titleLabel;
  v10 = a4;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  objc_msgSend(v7, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPageHeaderLabel setSecondaryContentRatingImages:](titleLabel, "setSecondaryContentRatingImages:", v9, v10, v11);

  -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_cancelConfirmationAction:(id)a3
{
  -[SKUIProductPageHeaderView bringSubviewToFront:](self, "bringSubviewToFront:", self->_itemOfferButton);
  -[SKUIItemOfferButton setShowingConfirmation:animated:](self->_itemOfferButton, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_showConfirmationAction:(id)a3
{
  -[SKUIProductPageHeaderView bringSubviewToFront:](self, "bringSubviewToFront:", self->_itemOfferButton);
  -[SKUIItemOfferButton setShowingConfirmation:animated:](self->_itemOfferButton, "setShowingConfirmation:animated:", 1, 1);
}

- (void)_finishButtonAnimation
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  if (self->_needsLayoutAfterButtonAnimation)
  {
    self->_needsLayoutAfterButtonAnimation = 0;
    -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_reloadItemOfferButton:(BOOL)a3
{
  _BOOL8 v4;
  SKUIItemOfferButton *v5;
  SKUIItemOfferButton *itemOfferButton;
  SKUIItemOfferButton *v7;
  SKUIItemOfferButton *v8;
  SKUIItemOfferButton *v9;
  void *v10;
  double v11;

  if (self->_itemOffer && (v4 = a3, !-[SKUIProductPageHeaderView isRestricted](self, "isRestricted")))
  {
    itemOfferButton = self->_itemOfferButton;
    if (!itemOfferButton)
    {
      +[SKUIItemOfferButton itemOfferButtonWithAppearance:](SKUIItemOfferButton, "itemOfferButtonWithAppearance:", 0);
      v7 = (SKUIItemOfferButton *)objc_claimAutoreleasedReturnValue();
      v8 = self->_itemOfferButton;
      self->_itemOfferButton = v7;

      -[SKUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__cancelConfirmationAction_, 0x10000);
      -[SKUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__showConfirmationAction_, 0x40000);
      v9 = self->_itemOfferButton;
      -[SKUIProductPageHeaderView backgroundColor](self, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton setBackgroundColor:](v9, "setBackgroundColor:", v10);

      LODWORD(v11) = -1.0;
      -[SKUIItemOfferButton setCharge:](self->_itemOfferButton, "setCharge:", v11);
      -[SKUIItemOfferButton setDelegate:](self->_itemOfferButton, "setDelegate:", self);
      -[SKUIProductPageHeaderView addSubview:](self, "addSubview:", self->_itemOfferButton);
      itemOfferButton = self->_itemOfferButton;
    }
    if (-[SKUIItemOfferButton setValuesUsingItemOffer:itemState:clientContext:animated:](itemOfferButton, "setValuesUsingItemOffer:itemState:clientContext:animated:", self->_itemOffer, self->_itemState, self->_clientContext, v4))
    {
      -[SKUIItemOfferButton sizeToFit](self->_itemOfferButton, "sizeToFit");
      -[SKUIProductPageHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    -[SKUIItemOfferButton setDelegate:](self->_itemOfferButton, "setDelegate:", 0);
    -[SKUIItemOfferButton removeTarget:action:forControlEvents:](self->_itemOfferButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
    -[SKUIItemOfferButton removeFromSuperview](self->_itemOfferButton, "removeFromSuperview");
    v5 = self->_itemOfferButton;
    self->_itemOfferButton = 0;

  }
}

- (void)_getTopLayoutProperties:(id *)a3 origins:(double *)a4 height:(double *)a5 forWidth:(double)a6
{
  SKUIProductPageHeaderLabel *titleLabel;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  uint64_t v13;
  uint64_t v14;
  UIButton *artistButton;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  uint64_t v17;
  uint64_t v18;
  SKUIBadgeLabel *editorialBadgeLabel;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  uint64_t v21;
  uint64_t v22;
  UILabel *inAppPurchasesLabel;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v29;
  uint64_t v30;
  uint64_t v31;
  UILabel *ageBandLabel;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  __int128 v40;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    v12 = *a3;
    -[SKUIProductPageHeaderLabel sizeThatFits:](titleLabel, "sizeThatFits:", a6, 1.79769313e308);
    *(_QWORD *)v12 = v13;
    *((_QWORD *)v12 + 1) = v14;
    *((_OWORD *)v12 + 1) = xmmword_1BBED1EB0;
    *((_QWORD *)v12 + 4) = 0x4022000000000000;
    *((_BYTE *)v12 + 40) = 1;
  }
  artistButton = self->_artistButton;
  if (artistButton)
  {
    v16 = *a3;
    -[UIButton sizeThatFits:](artistButton, "sizeThatFits:", a6, 1.79769313e308);
    *((_QWORD *)v16 + 6) = v17;
    *((_QWORD *)v16 + 7) = v18;
    *((_OWORD *)v16 + 4) = xmmword_1BBED1EC0;
    *((_QWORD *)v16 + 10) = 0x401C000000000000;
    *((_BYTE *)v16 + 88) = 1;
  }
  editorialBadgeLabel = self->_editorialBadgeLabel;
  if (editorialBadgeLabel)
  {
    v20 = *a3;
    -[SKUIBadgeLabel sizeThatFits:](editorialBadgeLabel, "sizeThatFits:", a6, 1.79769313e308);
    *((_QWORD *)v20 + 12) = v21;
    *((_QWORD *)v20 + 13) = v22;
    *((_QWORD *)v20 + 14) = 0;
    *((_QWORD *)v20 + 15) = 0;
    *((_QWORD *)v20 + 16) = 0x401C000000000000;
    *((_BYTE *)v20 + 136) = 1;
  }
  inAppPurchasesLabel = self->_inAppPurchasesLabel;
  __asm { FMOV            V0.2D, #3.0 }
  v40 = _Q0;
  if (inAppPurchasesLabel)
  {
    v29 = *a3;
    -[UILabel sizeThatFits:](inAppPurchasesLabel, "sizeThatFits:", a6, 1.79769313e308);
    *((_QWORD *)v29 + 18) = v30;
    *((_QWORD *)v29 + 19) = v31;
    *((_OWORD *)v29 + 10) = v40;
    *((_QWORD *)v29 + 22) = 0x401C000000000000;
    *((_BYTE *)v29 + 184) = 1;
  }
  ageBandLabel = self->_ageBandLabel;
  if (ageBandLabel)
  {
    v33 = *a3;
    -[UILabel sizeThatFits:](ageBandLabel, "sizeThatFits:", a6, 1.79769313e308);
    v35 = v34;
    v37 = v36;
    v38 = SKUIUserInterfaceIdiom(self->_clientContext);
    v39 = 7.0;
    *((_QWORD *)v33 + 24) = v35;
    *((_QWORD *)v33 + 25) = v37;
    if (v38 == 1)
      v39 = 11.0;
    *((_OWORD *)v33 + 13) = v40;
    *((double *)v33 + 28) = v39;
    *((_BYTE *)v33 + 232) = 0;
  }
  SKUIGetLayoutProperties((uint64_t)*a3, 5, a4, a5);
}

- (void)_getBottomLayoutProperties:(id *)a3 origins:(double *)a4 height:(double *)a5 forWidth:(double)a6
{
  int64_t numberOfUserRatings;
  UIImageView *userRatingStarsView;
  double v13;
  double v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  double v16;
  double v17;
  uint64_t v18;

  if (self->_userRatingLabel)
  {
    numberOfUserRatings = self->_numberOfUserRatings;
    userRatingStarsView = self->_userRatingStarsView;
    if (numberOfUserRatings)
    {
      -[UIImageView setHidden:](userRatingStarsView, "setHidden:", 0);
      -[UIImageView frame](self->_userRatingStarsView, "frame");
      v14 = v13 + 3.0;
    }
    else
    {
      -[UIImageView setHidden:](userRatingStarsView, "setHidden:", 1);
      v14 = 0.0;
    }
    v16 = a6 - v14;
    -[UILabel sizeThatFits:](self->_userRatingLabel, "sizeThatFits:", v16, 1.79769313e308);
    v15 = *a3;
    if (v16 < v17)
      v17 = v16;
    *((double *)v15 + 6) = v17;
    *((_QWORD *)v15 + 7) = v18;
    *((_QWORD *)v15 + 8) = 0x4000000000000000;
    *((_QWORD *)v15 + 9) = 0;
    *((_QWORD *)v15 + 10) = 0;
    *((_BYTE *)v15 + 88) = 1;
  }
  else
  {
    v15 = *a3;
  }
  SKUIGetLayoutProperties((uint64_t)v15, 5, a4, a5);
}

- (UIControl)artistButton
{
  return &self->_artistButton->super;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SKUIItemContentRating)contentRating
{
  return self->_contentRating;
}

- (SKUIContentRatingArtworkResourceLoader)contentRatingArtworkLoader
{
  return self->_contentRatingArtworkLoader;
}

- (double)headerImageHeight
{
  return self->_headerImageHeight;
}

- (SKUIItemOffer)itemOffer
{
  return self->_itemOffer;
}

- (SKUIItemOfferButton)itemOfferButton
{
  return self->_itemOfferButton;
}

- (SKUIItemState)itemState
{
  return self->_itemState;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (SKUIItemContentRating)secondaryContentRating
{
  return self->_secondaryContentRating;
}

- (double)userRating
{
  return self->_userRating;
}

- (UIControl)shareButton
{
  return &self->_shareButton->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingStarsView, 0);
  objc_storeStrong((id *)&self->_userRatingLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_secondaryContentRating, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferExplanationTitleLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferExplanationLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_inAppPurchasesLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_contentRatingArtworkLoader, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_editorialBadgeLabel, 0);
  objc_storeStrong((id *)&self->_artistButton, 0);
  objc_storeStrong((id *)&self->_ageBandLabel, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageHeaderView initWithClientContext:]";
}

@end

@implementation SKUIReviewsFacebookView

- (SKUIReviewsFacebookView)initWithClientContext:(id)a3
{
  id v5;
  SKUIReviewsFacebookView *v6;
  SKUIReviewsFacebookView *v7;
  UILabel *v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *friendsLabel;
  UILabel *v19;
  void *v20;
  UIButton *v21;
  UIButton *likeButton;
  UIButton *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UIImageView *logoImageView;
  UIView *v34;
  UIView *separatorView;
  UIView *v36;
  void *v37;
  void *v38;
  objc_super v40;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewsFacebookView initWithClientContext:].cold.1();
  }
  v40.receiver = self;
  v40.super_class = (Class)SKUIReviewsFacebookView;
  v6 = -[SKUIReviewsFacebookView init](&v40, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = v8;

    v10 = v7->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v7->_titleLabel;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_TITLE"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_TITLE"), 0, CFSTR("ProductPage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v12, "setText:", v13);

    v14 = v7->_titleLabel;
    -[SKUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[UILabel setTextColor:](v14, "setTextColor:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v14, "setTextColor:", v16);

    }
    -[SKUIReviewsFacebookView addSubview:](v7, "addSubview:", v7->_titleLabel);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    friendsLabel = v7->_friendsLabel;
    v7->_friendsLabel = v17;

    -[UILabel setNumberOfLines:](v7->_friendsLabel, "setNumberOfLines:", 5);
    v19 = v7->_friendsLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[SKUIReviewsFacebookView addSubview:](v7, "addSubview:", v7->_friendsLabel);
    -[SKUIReviewsFacebookView _reloadFriendNamesLabel](v7, "_reloadFriendNamesLabel");
    v21 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    likeButton = v7->_likeButton;
    v7->_likeButton = v21;

    v23 = v7->_likeButton;
    -[SKUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[UIButton setTitleColor:forState:](v23, "setTitleColor:forState:", v24, 0);
    }
    else
    {
      -[SKUIReviewsFacebookView tintColor](v7, "tintColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v23, "setTitleColor:forState:", v25, 0);

    }
    -[UIButton setShowsTouchWhenHighlighted:](v7->_likeButton, "setShowsTouchWhenHighlighted:", 1);
    -[UIButton titleLabel](v7->_likeButton, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v27);

    -[SKUIReviewsFacebookView addSubview:](v7, "addSubview:", v7->_likeButton);
    -[SKUIReviewsFacebookView _reloadLikeButtonState](v7, "_reloadLikeButtonState");
    v28 = objc_alloc(MEMORY[0x1E0DC3890]);
    v29 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "imageNamed:inBundle:", CFSTR("ProductViewReviewsFacebookIcon"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v28, "initWithImage:", v31);
    logoImageView = v7->_logoImageView;
    v7->_logoImageView = (UIImageView *)v32;

    -[SKUIReviewsFacebookView addSubview:](v7, "addSubview:", v7->_logoImageView);
    v34 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v34;

    v36 = v7->_separatorView;
    -[SKUIColorScheme primaryTextColor](v7->_colorScheme, "primaryTextColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      -[UIView setBackgroundColor:](v36, "setBackgroundColor:", v37);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v36, "setBackgroundColor:", v38);

    }
    -[SKUIReviewsFacebookView addSubview:](v7, "addSubview:", v7->_separatorView);
  }

  return v7;
}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v5;
  SKUIColorScheme **p_colorScheme;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  UIView *separatorView;
  void *v11;
  void *v12;
  UIButton *likeButton;
  void *v14;
  void *v15;
  SKUIColorScheme *v16;

  v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    titleLabel = self->_titleLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v9);

    }
    separatorView = self->_separatorView;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v12);

    }
    likeButton = self->_likeButton;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[UIButton setTitleColor:forState:](likeButton, "setTitleColor:forState:", v14, 0);
    }
    else
    {
      -[SKUIReviewsFacebookView tintColor](self, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](likeButton, "setTitleColor:forState:", v15, 0);

    }
    -[SKUIReviewsFacebookView _reloadFriendNamesLabel](self, "_reloadFriendNamesLabel");
    v5 = v16;
  }

}

- (void)setFriendNames:(id)a3
{
  NSArray *v4;
  NSArray *friendNames;

  if (self->_friendNames != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    friendNames = self->_friendNames;
    self->_friendNames = v4;

    -[SKUIReviewsFacebookView _reloadFriendNamesLabel](self, "_reloadFriendNamesLabel");
  }
}

- (void)setUserLiked:(BOOL)a3
{
  if (self->_userLiked != a3)
  {
    self->_userLiked = a3;
    -[SKUIReviewsFacebookView _reloadLikeButtonState](self, "_reloadLikeButtonState");
    -[SKUIReviewsFacebookView _reloadFriendNamesLabel](self, "_reloadFriendNamesLabel");
    -[SKUIReviewsFacebookView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  UILabel *titleLabel;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  UILabel *v16;
  UIImageView *logoImageView;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  UIImageView *v22;
  double v23;
  UIButton *likeButton;
  double v25;
  void *v26;
  CGFloat v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  float v35;
  CGFloat v36;
  UIButton *v37;
  UILabel *friendsLabel;
  CGFloat v39;
  UIView *separatorView;
  void *v41;
  double v42;
  CGFloat v43;
  UIView *v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  -[SKUIReviewsFacebookView bounds](self, "bounds");
  v47 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[UIImageView frame](self->_logoImageView, "frame");
  v45 = v10;
  titleLabel = self->_titleLabel;
  v12 = 15.0;
  v13 = 15.0;
  if (titleLabel)
  {
    -[UILabel sizeToFit](titleLabel, "sizeToFit");
    -[UILabel frame](self->_titleLabel, "frame");
    v15 = v14;
    v16 = self->_titleLabel;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, 11.0, v7 + -30.0, v14, v47, v5, v7, v9);
    -[UILabel setFrame:](v16, "setFrame:");
    v48.origin.x = 15.0;
    v48.origin.y = 11.0;
    v48.size.width = v7 + -30.0;
    v48.size.height = v15;
    v13 = CGRectGetMaxY(v48) + -4.0 + 10.0;
  }
  logoImageView = self->_logoImageView;
  if (logoImageView)
  {
    -[UIImageView frame](logoImageView, "frame");
    v19 = v18;
    v21 = v20;
    v22 = self->_logoImageView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, v13, v18, v20, v47, v5, v7, v9);
    -[UIImageView setFrame:](v22, "setFrame:");
    v49.origin.x = 15.0;
    v49.origin.y = v13;
    v49.size.width = v19;
    v49.size.height = v21;
    v12 = CGRectGetMaxX(v49) + 10.0;
  }
  v23 = v7 + -15.0;
  likeButton = self->_likeButton;
  v25 = v7 + -15.0;
  if (likeButton)
  {
    -[UIButton imageForState:](likeButton, "imageForState:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton sizeToFit](self->_likeButton, "sizeToFit");
    -[UIButton frame](self->_likeButton, "frame");
    v46 = v9;
    v27 = v5;
    v29 = v28;
    -[UIButton titleLabel](self->_likeButton, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v32 = v31;
    objc_msgSend(v26, "size");
    v34 = v32 + v33 + 6.0;

    v35 = (v45 - v29) * 0.5;
    v36 = v13 + roundf(v35);
    v37 = self->_likeButton;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v23 - v34, v36, v34, v29, v47, v27, v7, v46);
    -[UIButton setFrame:](v37, "setFrame:");
    v50.origin.x = v23 - v34;
    v50.origin.y = v36;
    v50.size.width = v34;
    v50.size.height = v29;
    v5 = v27;
    v9 = v46;
    v25 = CGRectGetMinX(v50) + -7.0;

  }
  if (self->_friendsLabel)
  {
    -[SKUIReviewsFacebookView bringSubviewToFront:](self, "bringSubviewToFront:");
    -[UILabel frame](self->_friendsLabel, "frame");
    -[UILabel sizeThatFits:](self->_friendsLabel, "sizeThatFits:", v25 - v12, 1.79769313e308);
    friendsLabel = self->_friendsLabel;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v12, v13 + -5.0, v39, v9 - v13 + -15.0 + 5.0 + 3.0, v47, v5, v7, v9);
    -[UILabel setFrame:](friendsLabel, "setFrame:");
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[UIView frame](separatorView, "frame");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "scale");
    v43 = 1.0 / v42;

    v44 = self->_separatorView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(15.0, v9 - v43, v23, v43, v47, v5, v7, v9);
    -[UIView setFrame:](v44, "setFrame:");
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIButton *likeButton;
  id v5;
  objc_super v6;

  likeButton = self->_likeButton;
  v5 = a3;
  -[UIButton setBackgroundColor:](likeButton, "setBackgroundColor:", v5);
  -[UIImageView setBackgroundColor:](self->_logoImageView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIReviewsFacebookView;
  -[SKUIReviewsFacebookView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  UILabel *titleLabel;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *logoImageView;
  double v12;
  double v13;
  double v14;
  double v15;
  UIButton *likeButton;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  UILabel *friendsLabel;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", a3.width, a3.height);
    v8 = v7 + -4.0 + -4.0 + 10.0 + 30.0;
  }
  else
  {
    v8 = 30.0;
  }
  v10 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  logoImageView = self->_logoImageView;
  v12 = v9;
  v13 = *MEMORY[0x1E0C9D820];
  if (logoImageView)
  {
    -[UIImageView frame](logoImageView, "frame");
    v13 = v14;
    v12 = v15 + 2.0;
  }
  likeButton = self->_likeButton;
  if (likeButton)
  {
    -[UIButton titleLabel](likeButton, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v19 = v18;
    v9 = v20;

    -[UIButton imageForState:](self->_likeButton, "imageForState:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v10 = v19 + v22 + 6.0;

  }
  friendsLabel = self->_friendsLabel;
  if (friendsLabel)
  {
    -[UILabel sizeThatFits:](friendsLabel, "sizeThatFits:", width + -30.0 - v13 + -10.0 + -7.0 - v10, height);
    v25 = v24 + -5.0 + -3.0;
  }
  else
  {
    v25 = 0.0;
  }
  if (v12 >= v25)
    v25 = v12;
  if (v25 < v9)
    v25 = v9;
  v26 = v8 + v25;
  v27 = width;
  result.height = v26;
  result.width = v27;
  return result;
}

- (id)_composedStringForNames:(id)a3 userLiked:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  SKUIClientContext *clientContext;
  const __CFString *v10;
  uint64_t v11;
  SKUIClientContext *v12;
  SKUIClientContext *v13;
  id v14;
  void *v15;
  void *v16;
  SKUIClientContext *v17;
  void *v18;
  SKUIClientContext *v19;
  SKUIClientContext *v20;
  SKUIClientContext *v21;
  SKUIClientContext *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if (!v4)
  {
    switch(v7)
    {
      case 0:
        clientContext = self->_clientContext;
        if (clientContext)
        {
          v10 = CFSTR("REVIEWS_FACEBOOK_FIRST_LIKE");
          goto LABEL_10;
        }
        v23 = CFSTR("REVIEWS_FACEBOOK_FIRST_LIKE");
        break;
      case 1:
        v20 = self->_clientContext;
        if (v20)
          -[SKUIClientContext localizedStringForKey:inTable:](v20, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_ONE_FRIEND_LIKES"), CFSTR("ProductPage"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_ONE_FRIEND_LIKES"), 0, CFSTR("ProductPage"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "objectAtIndex:", 0);
        v27 = objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      case 2:
        v21 = self->_clientContext;
        if (v21)
          -[SKUIClientContext localizedStringForKey:inTable:](v21, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_TWO_FRIENDS_LIKE"), CFSTR("ProductPage"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_TWO_FRIENDS_LIKE"), 0, CFSTR("ProductPage"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "objectAtIndex:", 0);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
      case 3:
        v22 = self->_clientContext;
        if (v22)
          -[SKUIClientContext localizedStringForKey:inTable:](v22, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_THREE_FRIENDS_LIKE"), CFSTR("ProductPage"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_THREE_FRIENDS_LIKE"), 0, CFSTR("ProductPage"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "objectAtIndex:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@%@%@"), 0, v16, v28, v30);
        goto LABEL_45;
      default:
        v14 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
        objc_msgSend(v14, "setNumberStyle:", 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 - 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringFromNumber:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = self->_clientContext;
        if (v19)
          -[SKUIClientContext localizedStringForKey:inTable:](v19, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_MANY_FRIENDS_LIKE"), CFSTR("ProductPage"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_MANY_FRIENDS_LIKE"), 0, CFSTR("ProductPage"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "objectAtIndex:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithValidatedFormat:validFormatSpecifiers:error:", v28, CFSTR("%@%@%@"), 0, v30, v33, v16);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_46;
    }
    goto LABEL_33;
  }
  if (v7 == 2)
  {
    v12 = self->_clientContext;
    if (v12)
      -[SKUIClientContext localizedStringForKey:inTable:](v12, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_YOU_AND_TWO_FRIENDS_LIKE"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_YOU_AND_TWO_FRIENDS_LIKE"), 0, CFSTR("ProductPage"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "firstObject");
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_42:
    v16 = (void *)v25;
    objc_msgSend(v6, "objectAtIndex:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@%@"), 0, v16, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  if (v7 == 1)
  {
    v13 = self->_clientContext;
    if (v13)
      -[SKUIClientContext localizedStringForKey:inTable:](v13, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_YOU_AND_ONE_FRIEND_LIKE"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_YOU_AND_ONE_FRIEND_LIKE"), 0, CFSTR("ProductPage"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "firstObject");
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_39:
    v16 = (void *)v27;
    objc_msgSend(v26, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  if (v7)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v14, "setNumberStyle:", 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromNumber:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = self->_clientContext;
    if (v17)
      -[SKUIClientContext localizedStringForKey:inTable:](v17, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_YOU_AND_MANY_FRIENDS_LIKE"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_YOU_AND_MANY_FRIENDS_LIKE"), 0, CFSTR("ProductPage"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithValidatedFormat:validFormatSpecifiers:error:", v28, CFSTR("%@%@"), 0, v30, v16, v36);
LABEL_45:
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:

LABEL_47:
LABEL_48:

    goto LABEL_49;
  }
  clientContext = self->_clientContext;
  if (clientContext)
  {
    v10 = CFSTR("REVIEWS_FACEBOOK_YOU_LIKE");
LABEL_10:
    -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v10, CFSTR("ProductPage"));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v23 = CFSTR("REVIEWS_FACEBOOK_YOU_LIKE");
LABEL_33:
  +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v23, 0, CFSTR("ProductPage"));
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_34:
  v31 = (void *)v11;
LABEL_49:

  return v31;
}

- (void)_reloadFriendNamesLabel
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v3, "setMaximumLineHeight:", 16.0);
  objc_msgSend(v3, "setMinimumLineHeight:", 16.0);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  v13[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC1178];
  v14[0] = v4;
  v14[1] = v3;
  v6 = *MEMORY[0x1E0DC1140];
  v13[1] = v5;
  v13[2] = v6;
  -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.800000012);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[SKUIReviewsFacebookView _composedStringForNames:userLiked:](self, "_composedStringForNames:userLiked:", self->_friendNames, self->_userLiked);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v9);

  -[UILabel setAttributedText:](self->_friendsLabel, "setAttributedText:", v12);
  -[SKUIReviewsFacebookView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_reloadLikeButtonState
{
  UIButton *likeButton;
  UIButton *v4;
  SKUIClientContext *clientContext;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  SKUIClientContext *v10;
  void *v11;
  UIButton *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int ShouldReverseLayoutDirection;

  likeButton = self->_likeButton;
  if (self->_userLiked)
  {
    -[UIButton setImage:forState:](self->_likeButton, "setImage:forState:", 0, 0);
    v4 = self->_likeButton;
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_UNLIKE_BUTTON"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_UNLIKE_BUTTON"), 0, CFSTR("ProductPage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v4, "setTitle:forState:", v11, 0);

    v12 = self->_likeButton;
    v13 = *MEMORY[0x1E0DC49E8];
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v15 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("ProductViewReviewsFacebookLikeIcon"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](likeButton, "setImage:forState:", v8, 0);

    v9 = self->_likeButton;
    v10 = self->_clientContext;
    if (v10)
      -[SKUIClientContext localizedStringForKey:inTable:](v10, "localizedStringForKey:inTable:", CFSTR("REVIEWS_FACEBOOK_LIKE_BUTTON"), CFSTR("ProductPage"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_FACEBOOK_LIKE_BUTTON"), 0, CFSTR("ProductPage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v9, "setTitle:forState:", v17, 0);

    ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
    v15 = 0.0;
    if (ShouldReverseLayoutDirection)
      v14 = 0.0;
    else
      v14 = 6.0;
    if (ShouldReverseLayoutDirection)
      v16 = 6.0;
    else
      v16 = 0.0;
    v12 = self->_likeButton;
    v13 = 0.0;
  }
  -[UIButton setTitleEdgeInsets:](v12, "setTitleEdgeInsets:", v13, v14, v15, v16);
  -[SKUIReviewsFacebookView setNeedsLayout](self, "setNeedsLayout");
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSArray)friendNames
{
  return self->_friendNames;
}

- (UIControl)likeToggleButton
{
  return &self->_likeButton->super;
}

- (BOOL)isUserLiked
{
  return self->_userLiked;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_likeButton, 0);
  objc_storeStrong((id *)&self->_friendsLabel, 0);
  objc_storeStrong((id *)&self->_friendNames, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIReviewsFacebookView initWithClientContext:]";
}

@end

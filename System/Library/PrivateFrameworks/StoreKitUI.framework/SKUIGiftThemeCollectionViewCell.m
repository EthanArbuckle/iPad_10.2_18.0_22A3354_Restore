@implementation SKUIGiftThemeCollectionViewCell

- (UIImage)itemImage
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftThemeCollectionViewCell itemImage].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIGiftThemeCollectionViewCell _itemView](self, "_itemView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v12;
}

- (void)reloadThemeHeaderImage
{
  OUTLINED_FUNCTION_1();
}

- (void)setGift:(id)a3
{
  SKUIGift *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIGift **p_gift;
  void *v15;
  void *v16;
  void *v17;
  SKUIGiftItemView *itemView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = (SKUIGift *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIGiftThemeCollectionViewCell setGift:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_gift = &self->_gift;
  if (self->_gift != v5)
  {
    objc_storeStrong((id *)&self->_gift, a3);
    -[SKUIGift message](*p_gift, "message");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemeCollectionViewCell _setMessage:](self, "_setMessage:", v15);

    -[SKUIGift senderName](*p_gift, "senderName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemeCollectionViewCell _setSenderName:](self, "_setSenderName:", v16);

    -[SKUIGift item](*p_gift, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[SKUIGiftThemeCollectionViewCell _setPrice:](self, "_setPrice:", 0);
      -[SKUIGiftThemeCollectionViewCell _reloadItemView](self, "_reloadItemView");
    }
    else
    {
      -[SKUIGiftItemView removeFromSuperview](self->_itemView, "removeFromSuperview");
      itemView = self->_itemView;
      self->_itemView = 0;

      v19 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SKUIGift giftAmount](*p_gift, "giftAmount"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringFromNumber:numberStyle:", v20, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIGiftConfiguration currencySymbol](self->_giftConfiguration, "currencySymbol");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SKUIGiftConfiguration currencySymbolPosition](self->_giftConfiguration, "currencySymbolPosition") == 1)
      {
        v23 = v21;
        v24 = v22;
      }
      else
      {
        v23 = v22;
        v24 = v21;
      }
      objc_msgSend(v23, "stringByAppendingString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGiftThemeCollectionViewCell _setPrice:](self, "_setPrice:", v25);

    }
  }

}

- (void)setItemImage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGiftThemeCollectionViewCell setItemImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIGiftThemeCollectionViewCell _itemView](self, "_itemView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItemImage:", v4);

}

- (void)setTheme:(id)a3
{
  SKUIGiftTheme *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIGiftTheme **p_theme;
  void *v15;
  void *v16;
  void *v17;
  UILabel *priceLabel;
  void *v19;
  UILabel *messageLabel;
  void *v21;
  UILabel *senderNameLabel;
  void *v23;
  UILabel *senderNameLabelLabel;
  void *v25;
  void *v26;

  v5 = (SKUIGiftTheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIGiftThemeCollectionViewCell setTheme:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_theme = &self->_theme;
  if (self->_theme != v5)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    -[SKUIGiftTheme headerImage](*p_theme, "headerImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemeCollectionViewCell _setHeaderImage:](self, "_setHeaderImage:", v15);

    -[SKUIGiftTheme backgroundColor](*p_theme, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[UIImageView setBackgroundColor:](self->_headerImageView, "setBackgroundColor:", v16);
    -[SKUIGiftItemView setBackgroundColor:](self->_itemView, "setBackgroundColor:", v16);
    -[SKUIGiftItemView setTheme:](self->_itemView, "setTheme:", *p_theme);
    -[UILabel setBackgroundColor:](self->_priceLabel, "setBackgroundColor:", v16);
    priceLabel = self->_priceLabel;
    -[SKUIGiftTheme primaryTextColor](*p_theme, "primaryTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](priceLabel, "setTextColor:", v19);

    -[UILabel setBackgroundColor:](self->_messageLabel, "setBackgroundColor:", v16);
    messageLabel = self->_messageLabel;
    -[SKUIGiftTheme bodyTextColor](*p_theme, "bodyTextColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](messageLabel, "setTextColor:", v21);

    -[UILabel setBackgroundColor:](self->_senderNameLabel, "setBackgroundColor:", v16);
    senderNameLabel = self->_senderNameLabel;
    -[SKUIGiftTheme bodyTextColor](*p_theme, "bodyTextColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](senderNameLabel, "setTextColor:", v23);

    -[UILabel setBackgroundColor:](self->_senderNameLabelLabel, "setBackgroundColor:", v16);
    senderNameLabelLabel = self->_senderNameLabelLabel;
    -[SKUIGiftTheme primaryTextColor](*p_theme, "primaryTextColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](senderNameLabelLabel, "setTextColor:", v25);

    -[SKUIGiftTheme themeName](v5, "themeName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftThemeCollectionViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v26);

    -[SKUIGiftThemeCollectionViewCell setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
    -[SKUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIGiftThemeCollectionViewCell;
  -[SKUIGiftThemeCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, a3);
  -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (id)_itemView
{
  void *v3;
  SKUIGiftItemView *itemView;
  SKUIGiftItemView *v5;
  SKUIGiftItemView *v6;
  void *v7;
  SKUIGiftItemView *v8;

  -[SKUIGift item](self->_gift, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    itemView = self->_itemView;
    if (!itemView)
    {
      v5 = -[SKUIGiftItemView initWithStyle:item:clientContext:]([SKUIGiftItemView alloc], "initWithStyle:item:clientContext:", 1, v3, 0);
      v6 = self->_itemView;
      self->_itemView = v5;

      -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_itemView);

      itemView = self->_itemView;
    }
    v8 = itemView;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_reloadItemView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  id v12;

  -[SKUIGift item](self->_gift, "item");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftThemeCollectionViewCell _itemView](self, "_itemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "artistName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArtistName:", v4);

  -[SKUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v12, "categoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategoryName:", v6);

  objc_msgSend(v3, "setNumberOfUserRatings:", objc_msgSend(v12, "numberOfUserRatings"));
  objc_msgSend(v12, "primaryItemOffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrice:", v8);

  objc_msgSend(v3, "setTheme:", self->_theme);
  objc_msgSend(v12, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v9);

  objc_msgSend(v12, "userRating");
  *(float *)&v11 = v10 / 5.0;
  objc_msgSend(v3, "setUserRating:", v11);
  -[SKUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_setHeaderImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *headerImageView;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  id v11;

  v11 = a3;
  -[UIImageView image](self->_headerImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4 != v11)
  {
    headerImageView = self->_headerImageView;
    if (v11)
    {
      if (!headerImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v8 = self->_headerImageView;
        self->_headerImageView = v7;

        -[UIImageView setContentMode:](self->_headerImageView, "setContentMode:", 1);
        -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", self->_headerImageView);

        headerImageView = self->_headerImageView;
      }
      -[UIImageView setImage:](headerImageView, "setImage:");
      -[UIImageView sizeToFit](self->_headerImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](headerImageView, "removeFromSuperview");
      v10 = self->_headerImageView;
      self->_headerImageView = 0;

    }
    -[SKUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v11;
  }

}

- (void)_setMessage:(id)a3
{
  id v4;
  UILabel *messageLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_messageLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v16)
    {
      if (!messageLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_messageLabel;
        self->_messageLabel = v6;

        v8 = self->_messageLabel;
        -[SKUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_messageLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
        v12 = self->_messageLabel;
        -[SKUIGiftTheme bodyTextColor](self->_theme, "bodyTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_messageLabel);

        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](messageLabel, "removeFromSuperview");
      v15 = self->_messageLabel;
      self->_messageLabel = 0;

    }
    -[SKUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setPrice:(id)a3
{
  id v4;
  UILabel *priceLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_priceLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
  {
    priceLabel = self->_priceLabel;
    if (v16)
    {
      if (!priceLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_priceLabel;
        self->_priceLabel = v6;

        v8 = self->_priceLabel;
        -[SKUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_priceLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 35.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_priceLabel;
        -[SKUIGiftTheme primaryTextColor](self->_theme, "primaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_priceLabel);

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:");
      -[UILabel sizeToFit](self->_priceLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](priceLabel, "removeFromSuperview");
      v15 = self->_priceLabel;
      self->_priceLabel = 0;

    }
    -[SKUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setSenderName:(id)a3
{
  id v4;
  UILabel *senderNameLabel;
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
  void *v16;
  UILabel *v17;
  UILabel *senderNameLabelLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  -[UILabel text](self->_senderNameLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v33 && (objc_msgSend(v33, "isEqualToString:", v4) & 1) == 0)
  {
    senderNameLabel = self->_senderNameLabel;
    if (v33)
    {
      if (!senderNameLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_senderNameLabel;
        self->_senderNameLabel = v6;

        v8 = self->_senderNameLabel;
        -[SKUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_senderNameLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

        v12 = self->_senderNameLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v12, "setFont:", v13);

        v14 = self->_senderNameLabel;
        -[SKUIGiftTheme bodyTextColor](self->_theme, "bodyTextColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v15);

        -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", self->_senderNameLabel);

        senderNameLabel = self->_senderNameLabel;
      }
      -[UILabel setText:](senderNameLabel, "setText:");
      if (self->_senderNameLabelLabel)
        goto LABEL_13;
      v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      senderNameLabelLabel = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = v17;

      v19 = self->_senderNameLabelLabel;
      -[SKUIGiftTheme backgroundColor](self->_theme, "backgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

      v21 = self->_senderNameLabelLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v21, "setBackgroundColor:", v22);

      v23 = self->_senderNameLabelLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v23, "setFont:", v24);

      v25 = self->_senderNameLabelLabel;
      -[SKUIGiftTheme primaryTextColor](self->_theme, "primaryTextColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v25, "setTextColor:", v26);

      v27 = self->_senderNameLabelLabel;
      -[SKUIGiftConfiguration clientContext](self->_giftConfiguration, "clientContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        objc_msgSend(v28, "localizedStringForKey:inTable:", CFSTR("GIFTING_THEME_SENDER_LABEL"), CFSTR("Gifting"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_THEME_SENDER_LABEL"), 0, CFSTR("Gifting"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v27, "setText:", v32);

      -[UILabel sizeToFit](self->_senderNameLabelLabel, "sizeToFit");
      -[SKUIGiftThemeCollectionViewCell contentView](self, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", self->_senderNameLabelLabel);
    }
    else
    {
      -[UILabel removeFromSuperview](senderNameLabel, "removeFromSuperview");
      v30 = self->_senderNameLabel;
      self->_senderNameLabel = 0;

      -[UILabel removeFromSuperview](self->_senderNameLabelLabel, "removeFromSuperview");
      v31 = self->_senderNameLabelLabel;
      self->_senderNameLabelLabel = 0;
    }

LABEL_13:
    -[SKUIGiftThemeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (SKUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (void)setGiftConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_giftConfiguration, a3);
}

- (SKUIGift)gift
{
  return self->_gift;
}

- (SKUIGiftTheme)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_senderNameLabelLabel, 0);
  objc_storeStrong((id *)&self->_senderNameLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_gift, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
}

- (void)itemImage
{
  OUTLINED_FUNCTION_1();
}

- (void)setGift:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end

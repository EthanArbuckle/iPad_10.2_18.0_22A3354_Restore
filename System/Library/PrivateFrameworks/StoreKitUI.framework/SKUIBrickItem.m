@implementation SKUIBrickItem

- (SKUIBrickItem)initWithBannerRoomContext:(id)a3
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
  SKUIBrickItem *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *accessibilityLabel;
  void *v19;
  SKUIEditorialComponent *v20;
  SKUIEditorialComponent *editorial;
  void *v22;
  void *v23;
  SKUIArtwork *v24;
  SKUIArtwork *artwork;
  void *v26;
  objc_super v28;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickItem initWithBannerRoomContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUIBrickItem;
  v13 = -[SKUIBrickItem init](&v28, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("link"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SKUIBrickItem _setLinkInfoWithLinkDictionary:context:](v13, "_setLinkInfoWithLinkDictionary:context:", v15, v4);
    if (!v13->_accessibilityLabel)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("imageAltText"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "copy");
        accessibilityLabel = v13->_accessibilityLabel;
        v13->_accessibilityLabel = (NSString *)v17;

      }
    }
    objc_msgSend(v14, "objectForKey:", CFSTR("text"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[SKUIEditorialComponent initWithBrickRoomText:]([SKUIEditorialComponent alloc], "initWithBrickRoomText:", v19);
      editorial = v13->_editorial;
      v13->_editorial = v20;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("imageUrl"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v22);
      if (v23)
      {
        v24 = -[SKUIArtwork initWithURL:size:]([SKUIArtwork alloc], "initWithURL:size:", v23, SKUIBrickItemSize());
        artwork = v13->_artwork;
        v13->_artwork = v24;

      }
    }
    objc_msgSend(v14, "objectForKey:", CFSTR("adamId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13->_brickIdentifier = objc_msgSend(v26, "longLongValue");

  }
  return v13;
}

- (SKUIBrickItem)initWithComponentContext:(id)a3
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
  SKUIBrickItem *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *accessibilityLabel;
  void *v19;
  void *v20;
  SKUIEditorialComponent *v21;
  SKUIEditorialComponent *editorial;
  void *v23;
  double v24;
  id v25;
  SKUIArtwork *v26;
  SKUIArtwork *artwork;
  uint64_t v28;
  void *v29;
  void *v30;
  SKUICountdown *v31;
  SKUICountdown *countdown;
  void *v33;
  objc_super v35;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickItem initWithComponentContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)SKUIBrickItem;
  v13 = -[SKUIBrickItem init](&v35, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("link"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SKUIBrickItem _setLinkInfoWithLinkDictionary:context:](v13, "_setLinkInfoWithLinkDictionary:context:", v15, v4);
    if (!v13->_accessibilityLabel)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("designLabel"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "copy");
        accessibilityLabel = v13->_accessibilityLabel;
        v13->_accessibilityLabel = (NSString *)v17;

      }
    }
    objc_msgSend(v14, "objectForKey:", CFSTR("editorial"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v20, "setComponentDictionary:", v19);
      v21 = -[SKUIEditorialComponent initWithCustomPageContext:]([SKUIEditorialComponent alloc], "initWithCustomPageContext:", v20);
      editorial = v13->_editorial;
      v13->_editorial = v21;

    }
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0DAFAD0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = SKUIBrickItemSize();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v23;
      v26 = -[SKUIArtwork initWithArtworkDictionary:]([SKUIArtwork alloc], "initWithArtworkDictionary:", v25);

      artwork = v13->_artwork;
      v13->_artwork = v26;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_19:
        objc_msgSend(v14, "objectForKey:", CFSTR("fcKind"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("type"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v29, "integerValue") == 290
          || objc_msgSend(v30, "isEqualToString:", CFSTR("counter")))
        {
          v31 = -[SKUICountdown initWithCountdownDictionary:]([SKUICountdown alloc], "initWithCountdownDictionary:", v14);
          countdown = v13->_countdown;
          v13->_countdown = v31;

        }
        objc_msgSend(v14, "objectForKey:", CFSTR("adamId"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13->_brickIdentifier = objc_msgSend(v33, "longLongValue");

        goto LABEL_26;
      }
      +[SKUIArtworkList artworkForSize:artworkDictionaries:](SKUIArtworkList, "artworkForSize:artworkDictionaries:", (uint64_t)v24, v23);
      v28 = objc_claimAutoreleasedReturnValue();
      artwork = v13->_artwork;
      v13->_artwork = (SKUIArtwork *)v28;
    }

    goto LABEL_19;
  }
LABEL_26:

  return v13;
}

- (void)_setLinkItem:(id)a3
{
  -[SKUILink _setItem:](self->_link, "_setItem:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUIBrickItem;
  -[SKUIBrickItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: \"%@\", %@"), v4, self->_accessibilityLabel, self->_link);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setLinkInfoWithLinkDictionary:(id)a3 context:(id)a4
{
  id v6;
  SKUILink *v7;
  SKUILink *link;
  NSString *v9;
  NSString *accessibilityLabel;
  void *v11;
  NSString *v12;
  NSString *v13;
  id v14;

  v6 = a3;
  v14 = (id)objc_msgSend(a4, "copy");
  objc_msgSend(v14, "setComponentDictionary:", v6);

  v7 = -[SKUILink initWithComponentContext:]([SKUILink alloc], "initWithComponentContext:", v14);
  link = self->_link;
  self->_link = v7;

  -[SKUILink title](self->_link, "title");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  accessibilityLabel = self->_accessibilityLabel;
  self->_accessibilityLabel = v9;

  if (!self->_accessibilityLabel)
  {
    -[SKUILink item](self->_link, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_accessibilityLabel;
    self->_accessibilityLabel = v12;

  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SKUIArtwork)artwork
{
  return self->_artwork;
}

- (int64_t)brickIdentifier
{
  return self->_brickIdentifier;
}

- (SKUICountdown)countdown
{
  return self->_countdown;
}

- (SKUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SKUILink)link
{
  return self->_link;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)initWithBannerRoomContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithComponentContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end

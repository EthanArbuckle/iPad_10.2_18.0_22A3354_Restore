@implementation SKUIItemArtworkContext

+ (id)lockupContextWithSize:(int64_t)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIItemArtworkContext lockupContextWithSize:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init((Class)objc_opt_class());
  +[SKUIProductImageDataConsumer lockupConsumerWithSize:itemKind:](SKUIProductImageDataConsumer, "lockupConsumerWithSize:itemKind:", a3, 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGeneralConsumer:", v13);

  +[SKUIStyledImageDataConsumer lockupIconConsumerWithSize:](SKUIStyledImageDataConsumer, "lockupIconConsumerWithSize:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIconConsumer:", v14);

  +[SKUIStyledImageDataConsumer lockupProductImageConsumerWithSize:](SKUIStyledImageDataConsumer, "lockupProductImageConsumerWithSize:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNewsstandConsumer:", v15);

  return v12;
}

+ (id)roomContext
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIItemArtworkContext roomContext].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_alloc_init((Class)objc_opt_class());
  +[SKUIProductImageDataConsumer gridConsumer](SKUIProductImageDataConsumer, "gridConsumer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGeneralConsumer:", v11);

  +[SKUIStyledImageDataConsumer roomIconConsumer](SKUIStyledImageDataConsumer, "roomIconConsumer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIconConsumer:", v12);

  +[SKUIStyledImageDataConsumer roomProductImageConsumer](SKUIStyledImageDataConsumer, "roomProductImageConsumer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNewsstandConsumer:", v13);

  return v10;
}

+ (id)wishlistContext
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUIItemArtworkContext wishlistContext].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_alloc_init((Class)objc_opt_class());
  +[SKUIProductImageDataConsumer wishlistConsumer](SKUIProductImageDataConsumer, "wishlistConsumer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGeneralConsumer:", v11);

  +[SKUIStyledImageDataConsumer wishlistIconConsumer](SKUIStyledImageDataConsumer, "wishlistIconConsumer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIconConsumer:", v12);

  +[SKUIStyledImageDataConsumer wishlistProductImageConsumer](SKUIStyledImageDataConsumer, "wishlistProductImageConsumer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNewsstandConsumer:", v13);

  return v10;
}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *placeholders;

  v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIItemArtworkContext setColorScheme:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[SKUIProductImageDataConsumer setColorScheme:](self->_generalImageConsumer, "setColorScheme:", self->_colorScheme);
    -[SKUIProductImageDataConsumer setColorScheme:](self->_letterboxConsumer, "setColorScheme:", self->_colorScheme);
    -[SKUIProductImageDataConsumer setColorScheme:](self->_posterConsumer, "setColorScheme:", self->_colorScheme);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

  }
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *placeholders;

  v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIItemArtworkContext setBackgroundColor:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_backgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[SKUIProductImageDataConsumer setBackgroundColor:](self->_generalImageConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SKUIStyledImageDataConsumer setBackgroundColor:](self->_iconConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SKUIProductImageDataConsumer setBackgroundColor:](self->_letterboxConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SKUIStyledImageDataConsumer setBackgroundColor:](self->_newsstandConsumer, "setBackgroundColor:", self->_backgroundColor);
    -[SKUIProductImageDataConsumer setBackgroundColor:](self->_posterConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

  }
}

- (void)setGeneralConsumer:(id)a3
{
  SKUIProductImageDataConsumer *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *placeholders;

  v5 = (SKUIProductImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIItemArtworkContext setGeneralConsumer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_generalImageConsumer != v5)
  {
    objc_storeStrong((id *)&self->_generalImageConsumer, a3);
    -[SKUIProductImageDataConsumer setColorScheme:](self->_generalImageConsumer, "setColorScheme:", self->_colorScheme);
    -[SKUIProductImageDataConsumer setBackgroundColor:](self->_generalImageConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

  }
}

- (void)setIconConsumer:(id)a3
{
  SKUIStyledImageDataConsumer *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *placeholders;

  v5 = (SKUIStyledImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIItemArtworkContext setIconConsumer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_iconConsumer != v5)
  {
    objc_storeStrong((id *)&self->_iconConsumer, a3);
    -[SKUIStyledImageDataConsumer setBackgroundColor:](self->_iconConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

  }
}

- (void)setLetterboxConsumer:(id)a3
{
  SKUIProductImageDataConsumer *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *placeholders;

  v5 = (SKUIProductImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIItemArtworkContext setLetterboxConsumer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_letterboxConsumer != v5)
  {
    objc_storeStrong((id *)&self->_letterboxConsumer, a3);
    -[SKUIProductImageDataConsumer setColorScheme:](self->_letterboxConsumer, "setColorScheme:", self->_colorScheme);
    -[SKUIProductImageDataConsumer setBackgroundColor:](self->_letterboxConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

  }
}

- (void)setNewsstandConsumer:(id)a3
{
  SKUIStyledImageDataConsumer *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *placeholders;

  v5 = (SKUIStyledImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIItemArtworkContext setNewsstandConsumer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_newsstandConsumer != v5)
  {
    objc_storeStrong((id *)&self->_newsstandConsumer, a3);
    -[SKUIStyledImageDataConsumer setBackgroundColor:](self->_newsstandConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

  }
}

- (void)setPosterConsumer:(id)a3
{
  SKUIProductImageDataConsumer *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *placeholders;

  v5 = (SKUIProductImageDataConsumer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIItemArtworkContext setPosterConsumer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_posterConsumer != v5)
  {
    objc_storeStrong((id *)&self->_posterConsumer, a3);
    -[SKUIProductImageDataConsumer setColorScheme:](self->_posterConsumer, "setColorScheme:", self->_colorScheme);
    -[SKUIProductImageDataConsumer setBackgroundColor:](self->_posterConsumer, "setBackgroundColor:", self->_backgroundColor);
    placeholders = self->_placeholders;
    self->_placeholders = 0;

  }
}

- (id)dataConsumerForItem:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *generalImageConsumer;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemArtworkContext dataConsumerForItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_msgSend(v4, "itemKind");
  v14 = 64;
  switch(v13)
  {
    case 2:
    case 6:
      goto LABEL_16;
    case 3:
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
      goto LABEL_15;
    case 5:
    case 12:
      goto LABEL_8;
    case 8:
      v14 = 40;
      goto LABEL_16;
    default:
      if (v13 == 17)
      {
LABEL_8:
        if (objc_msgSend(v4, "isNewsstandApp")
          && (objc_msgSend(v4, "newsstandArtworks"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          v14 = 48;
        }
        else if (objc_msgSend(v4, "isHiddenFromSpringBoard")
               && (objc_msgSend(v4, "hasMessagesExtension") & 1) != 0)
        {
          v14 = 72;
        }
        else
        {
          v14 = 32;
        }
      }
      else
      {
LABEL_15:
        v14 = 24;
      }
LABEL_16:
      v16 = *(id *)((char *)&self->super.isa + v14);
      if (!v16)
      {
        generalImageConsumer = self->_generalImageConsumer;
        if (!generalImageConsumer)
          generalImageConsumer = self->_iconConsumer;
        v16 = generalImageConsumer;
      }

      return v16;
  }
}

- (CGSize)imageSizeForItem:(id)a3
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
  unint64_t v13;
  char v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SKUIProductImageDataConsumer *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  uint64_t i;
  double v34;
  double v35;
  SKUIStyledImageDataConsumer *v36;
  SKUIStyledImageDataConsumer *v37;
  SKUIProductImageDataConsumer *v38;
  SKUIProductImageDataConsumer *v39;
  SKUIProductImageDataConsumer *v40;
  uint64_t v41;
  CGSize result;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && (v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG)))
  {
    -[SKUIItemArtworkContext imageSizeForItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    if (v4)
    {
LABEL_5:
      v13 = objc_msgSend(v4, "itemKind");
      v14 = 0;
      if (v13 <= 0x11 && ((1 << v13) & 0x21020) != 0)
        v14 = objc_msgSend(v4, "isNewsstandApp") ^ 1;
      -[SKUIItemArtworkContext dataConsumerForItem:](self, "dataConsumerForItem:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageSize");
      v17 = v16;
      v19 = v18;

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v4, "artworksProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "bestArtworkForScaledSize:", v17, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "size");
          v24 = v23;
          v26 = v25;

          v27 = v17 / v24;
          if (v17 / v24 >= v19 / v26)
            v27 = v19 / v26;
          v17 = ceil(v24 * v27);
          v19 = ceil(v26 * v27);
        }

      }
      goto LABEL_24;
    }
  }
  else if (v4)
  {
    goto LABEL_5;
  }
  v17 = *MEMORY[0x1E0C9D820];
  v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v36 = self->_iconConsumer;
  v37 = self->_newsstandConsumer;
  v38 = self->_generalImageConsumer;
  v39 = self->_letterboxConsumer;
  v28 = self->_posterConsumer;
  v29 = 0;
  v40 = v28;
  do
  {
    v30 = *(SKUIStyledImageDataConsumer **)((char *)&v36 + v29);
    if (v30)
    {
      objc_msgSend(v30, "imageSize", v36, v37, v38, v39, v40, v41);
      if (v17 < v31)
        v17 = v31;
      if (v19 < v32)
        v19 = v32;
    }
    v29 += 8;
  }
  while (v29 != 40);
  for (i = 32; i != -8; i -= 8)

LABEL_24:
  v34 = v17;
  v35 = v19;
  result.height = v35;
  result.width = v34;
  return result;
}

- (CGSize)largestImageSizeForItems:(id)a3
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
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGSize result;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemArtworkContext largestImageSizeForItems:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          -[SKUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19), (_QWORD)v26);
          if (v14 < v21)
            v14 = v21;
          if (v13 < v20)
            v13 = v20;
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

  }
  else
  {
    -[SKUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", 0);
    v13 = v22;
    v14 = v23;
  }

  v24 = v13;
  v25 = v14;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)largestImageSizeForLockups:(id)a3
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
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGSize result;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemArtworkContext largestImageSizeForLockups:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v17 = v14;
  v18 = v13;
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v31;
    v17 = v14;
    v18 = v13;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v21), "item", (_QWORD)v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[SKUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", v22);
          if (v17 < v24)
            v17 = v24;
          if (v18 < v23)
            v18 = v23;
        }

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v19);
  }

  if (v18 == v13 && v17 == v14)
  {
    -[SKUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", 0);
    v18 = v26;
    v17 = v27;
  }

  v28 = v18;
  v29 = v17;
  result.height = v29;
  result.width = v28;
  return result;
}

- (id)placeholderImageForItem:(id)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  SKUIProductImageDataConsumer *v17;
  SKUIProductImageDataConsumer *letterboxConsumer;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  __CFString *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *placeholders;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  void *v29;
  CGSize v31;
  CGSize v32;
  CGSize v33;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIItemArtworkContext placeholderImageForItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIItemArtworkContext imageSizeForItem:](self, "imageSizeForItem:", v4);
  v14 = v13;
  v16 = v15;
  -[SKUIItemArtworkContext dataConsumerForItem:](self, "dataConsumerForItem:", v4);
  v17 = (SKUIProductImageDataConsumer *)objc_claimAutoreleasedReturnValue();

  if (v17 == (SKUIProductImageDataConsumer *)self->_iconConsumer)
  {
    v22 = 1;
    v23 = CFSTR("application");
  }
  else if (v17 == (SKUIProductImageDataConsumer *)self->_messagesIconConsumer)
  {
    v22 = 1;
    v23 = CFSTR("messages");
  }
  else
  {
    if (v17 == (SKUIProductImageDataConsumer *)self->_newsstandConsumer)
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      v32.width = v14;
      v32.height = v16;
      NSStringFromCGSize(v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("newsstand: %@"), v21);
    }
    else if (v17 == self->_posterConsumer)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      v33.width = v14;
      v33.height = v16;
      NSStringFromCGSize(v33);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("poster: %@"), v21);
    }
    else
    {
      letterboxConsumer = self->_letterboxConsumer;
      v19 = (void *)MEMORY[0x1E0CB3940];
      v31.width = v14;
      v31.height = v16;
      NSStringFromCGSize(v31);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v17 == letterboxConsumer)
        objc_msgSend(v19, "stringWithFormat:", CFSTR("letterbox: %@"), v20);
      else
        objc_msgSend(v19, "stringWithFormat:", CFSTR("general: %@"), v20);
    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
  }
  placeholders = self->_placeholders;
  if (!placeholders)
  {
    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = self->_placeholders;
    self->_placeholders = v27;

    placeholders = self->_placeholders;
  }
  -[NSMutableDictionary objectForKey:](placeholders, "objectForKey:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    if (v22)
      -[SKUIProductImageDataConsumer imageForColor:](v17, "imageForColor:", 0);
    else
      -[SKUIProductImageDataConsumer imageForColor:size:](v17, "imageForColor:size:", 0, v14, v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      -[NSMutableDictionary setObject:forKey:](self->_placeholders, "setObject:forKey:", v29, v23);
  }

  return v29;
}

- (id)URLForItem:(id)a3
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
  void *v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemArtworkContext URLForItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIItemArtworkContext artworkForItem:](self, "artworkForItem:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)artworkForItem:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemArtworkContext artworkForItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIItemArtworkContext dataConsumerForItem:](self, "dataConsumerForItem:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageSize");
  v15 = v14;
  v17 = v16;

  objc_msgSend(v4, "artworksProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "bestArtworkForScaledSize:", v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SKUIProductImageDataConsumer)generalConsumer
{
  return self->_generalImageConsumer;
}

- (SKUIStyledImageDataConsumer)iconConsumer
{
  return self->_iconConsumer;
}

- (SKUIProductImageDataConsumer)letterboxConsumer
{
  return self->_letterboxConsumer;
}

- (SKUIStyledImageDataConsumer)newsstandConsumer
{
  return self->_newsstandConsumer;
}

- (SKUIProductImageDataConsumer)posterConsumer
{
  return self->_posterConsumer;
}

- (SKUIStyledImageDataConsumer)messagesIconConsumer
{
  return self->_messagesIconConsumer;
}

- (void)setMessagesIconConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_messagesIconConsumer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesIconConsumer, 0);
  objc_storeStrong((id *)&self->_posterConsumer, 0);
  objc_storeStrong((id *)&self->_placeholders, 0);
  objc_storeStrong((id *)&self->_newsstandConsumer, 0);
  objc_storeStrong((id *)&self->_letterboxConsumer, 0);
  objc_storeStrong((id *)&self->_iconConsumer, 0);
  objc_storeStrong((id *)&self->_generalImageConsumer, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (void)lockupContextWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)roomContext
{
  OUTLINED_FUNCTION_1();
}

+ (void)wishlistContext
{
  OUTLINED_FUNCTION_1();
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setGeneralConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setIconConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setLetterboxConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setNewsstandConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPosterConsumer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)dataConsumerForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)imageSizeForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)largestImageSizeForItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)largestImageSizeForLockups:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)placeholderImageForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)URLForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)artworkForItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end

@implementation SKUITextActivityItemProvider

+ (id)placeholderItem
{
  return &stru_1E73A9FB0;
}

- (id)item
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITextActivityItemProvider item].cold.1();
  }
  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEB1C0]);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[SKUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artistName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length") && objc_msgSend(v9, "length"))
    {
      -[SKUIDeferredActivityItemProvider clientContext](self, "clientContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "localizedStringForKey:", CFSTR("SHARE_SHEET_ITEM_TITLE_FORMAT"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SHARE_SHEET_ITEM_TITLE_FORMAT"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@%@"), 0, v7, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)item
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITextActivityItemProvider item]";
}

@end

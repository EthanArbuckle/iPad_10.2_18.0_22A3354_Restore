@implementation UIControl(advertising)

- (id)adPrivacyData
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        -[UIControl(advertising) adPrivacyData].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_getAssociatedObject(a1, sel_adPrivacyData);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setAdPrivacyData:()advertising
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
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[UIControl(advertising) setAdPrivacyData:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(a1, "adPrivacyData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(a1, "removeTarget:action:forControlEvents:", 0, sel_skuiadvertising_adTransparencyButtonTapped_, 64);
  objc_setAssociatedObject(a1, sel_adPrivacyData, v4, (void *)3);
  if (v4)
    objc_msgSend(a1, "addTarget:action:forControlEvents:", 0, sel_skuiadvertising_adTransparencyButtonTapped_, 64);

}

- (void)adPrivacyData
{
}

- (void)setAdPrivacyData:()advertising .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end

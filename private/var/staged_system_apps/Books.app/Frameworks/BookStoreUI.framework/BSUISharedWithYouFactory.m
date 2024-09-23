@implementation BSUISharedWithYouFactory

- (id)viewController:(id)a3 hostedViewWithType:(id)a4 identifier:(id)a5 parameters:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BSInternalSharedWithYouContainer *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char isKindOfClass;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSUISharedWithYouController shared](_TtC11BookStoreUI27BSUISharedWithYouController, "shared"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createHighlightAttributionViewFor:viewController:", v10, v11));

  if (v13)
  {
    v14 = -[BSInternalSharedWithYouContainer initWithAttributionView:]([BSInternalSharedWithYouContainer alloc], "initWithAttributionView:", v13);
    v16 = objc_opt_class(NSDictionary, v15);
    if ((objc_opt_isKindOfClass(v9, v16) & 1) != 0
      && _os_feature_enabled_impl("Books", "unifiedProductPage"))
    {
      v18 = objc_opt_class(NSDictionary, v17);
      v19 = BUDynamicCast(v18, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("type")));
      v23 = objc_opt_class(NSString, v22);
      isKindOfClass = objc_opt_isKindOfClass(v21, v23);

      if ((isKindOfClass & 1) != 0)
      {
        v26 = objc_opt_class(NSString, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("type")));
        v28 = BUDynamicCast(v26, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

        -[BSUISharedWithYouFactory _attributionView:displayContext:](self, "_attributionView:displayContext:", v13, v29);
      }
      v30 = objc_opt_class(NSString, v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("userInterfaceStyle")));
      v32 = BUDynamicCast(v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

      if ((objc_msgSend(v33, "isEqualToString:", CFSTR("dark")) & 1) != 0)
      {
        v34 = 2;
      }
      else
      {
        if (!objc_msgSend(v33, "isEqualToString:", CFSTR("light")))
        {
LABEL_14:

          goto LABEL_15;
        }
        v34 = 1;
      }
      objc_msgSend(v13, "setOverrideUserInterfaceStyle:", v34);
      goto LABEL_14;
    }
    v35 = objc_opt_class(NSString, v17);
    if ((objc_opt_isKindOfClass(v9, v35) & 1) != 0)
    {
      v37 = objc_opt_class(NSString, v36);
      v38 = BUDynamicCast(v37, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v38);
      -[BSUISharedWithYouFactory _attributionView:displayContext:](self, "_attributionView:displayContext:", v13, v20);
LABEL_15:

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_attributionView:(id)a3 displayContext:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("summary")))
  {
    objc_msgSend(v6, "setDisplayContext:", 0);
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("detail")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("detailCompact")))
  {
    objc_msgSend(v6, "setDisplayContext:", 1);
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("detailCompact")))
      objc_msgSend(v6, "setHorizontalAlignment:", 2);
  }

}

- (unint64_t)hostedViewFlags
{
  return 14;
}

@end

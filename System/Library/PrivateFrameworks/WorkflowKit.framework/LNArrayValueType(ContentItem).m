@implementation LNArrayValueType(ContentItem)

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "memberValueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_contentItemClassWithAppBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "memberValueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_contentItemClassesWithAppBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  if (v9)
    v13 = v9;
  else
    v13 = v8;
  objc_msgSend(a1, "teamIdentifierForBundleIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D13EA8];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __113__LNArrayValueType_ContentItem__wf_contentCollectionFromLinkValue_appBundleIdentifier_displayedBundleIdentifier___block_invoke;
  v23[3] = &unk_1E7AED5A8;
  v24 = v8;
  v25 = v9;
  v26 = v14;
  v16 = v14;
  v17 = v9;
  v18 = v8;
  objc_msgSend(v12, "if_compactMap:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v19;
  else
    v20 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v15, "collectionWithItems:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)teamIdentifierForBundleIdentifier:()ContentItem
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CA5870];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

    objc_msgSend(v5, "teamIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end

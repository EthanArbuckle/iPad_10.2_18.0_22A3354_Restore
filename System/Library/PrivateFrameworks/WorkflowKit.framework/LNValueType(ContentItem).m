@implementation LNValueType(ContentItem)

- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  getWFAppIntentsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[LNValueType(ContentItem) wf_contentItemClassWithAppBundleIdentifier:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_FAULT, "%s -[%@ %@] must be overridden", (uint8_t *)&v8, 0x20u);

  }
  return 0;
}

- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem
{
  uint64_t v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:");
  if (v1)
  {
    v4[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (objc_class *)MEMORY[0x1E0CBD728];
  v13 = a6;
  v14 = a5;
  v15 = [v12 alloc];
  if (v14)
    v16 = v14;
  else
    v16 = v11;
  v17 = (void *)objc_msgSend(v15, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", 0, v16, 0, 0, v13, 0, 0, 0);

  objc_msgSend(v10, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  objc_msgSend(v20, "managedAccountIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "length"))
    objc_msgSend(MEMORY[0x1E0D13DD8], "locationWithAccountIdentifier:appDescriptor:", v21, v17);
  else
    objc_msgSend(MEMORY[0x1E0D13E00], "locationWithAppDescriptor:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wf_contentItemClassesWithAppBundleIdentifier:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && objc_msgSend(v23, "count"))
  {
    if ((unint64_t)objc_msgSend(v24, "count") < 2)
    {
      v31 = (void *)objc_msgSend(v24, "firstObject");
      objc_msgSend(v10, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13EC8], "configurationWithOrigin:disclosureLevel:", v22, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "itemWithObject:privacyConfiguration:", v32, v33);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    getWFAppIntentsLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[LNValueType(ContentItem) wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:]";
      v36 = 2112;
      v37 = v24;
      v38 = 2112;
      v39 = v11;
      v26 = "%s Can't handle ambiguous content item classes %@ for bundleIdentifier: %@";
      v27 = v25;
      v28 = 32;
LABEL_19:
      _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_FAULT, v26, buf, v28);
    }
  }
  else
  {
    getWFAppIntentsLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[LNValueType(ContentItem) wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:]";
      v36 = 2112;
      v37 = v11;
      v26 = "%s Couldn't find a Link content item class for bundleIdentifier: %@";
      v27 = v25;
      v28 = 22;
      goto LABEL_19;
    }
  }

  v29 = 0;
LABEL_21:

  return v29;
}

- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", a3, a4, a5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D13EA8];
  objc_msgSend(MEMORY[0x1E0C99D20], "if_arrayWithObjectIfNonNil:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v6, "collectionWithItems:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

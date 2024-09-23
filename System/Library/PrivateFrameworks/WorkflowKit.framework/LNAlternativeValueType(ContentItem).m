@implementation LNAlternativeValueType(ContentItem)

- (uint64_t)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWFAppIntentsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[LNAlternativeValueType(ContentItem) wf_contentItemClassWithAppBundleIdentifier:]";
    v9 = 2112;
    v10 = a1;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s -[%@ %@] should not be called; use wf_contentItemClasses...",
      (uint8_t *)&v7,
      0x20u);

  }
  return 0;
}

- (id)wf_contentItemClassesWithAppBundleIdentifier:()ContentItem
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "memberValueTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__LNAlternativeValueType_ContentItem__wf_contentItemClassesWithAppBundleIdentifier___block_invoke;
  v9[3] = &unk_1E7AF8F20;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wf_contentCollectionFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:
{
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWFAppIntentsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[LNAlternativeValueType(ContentItem) wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:]";
    v9 = 2112;
    v10 = a1;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s -[%@ %@] should not be reachable; there is no such thing as an LNAlternativeValue.",
      (uint8_t *)&v7,
      0x20u);

  }
  return (id)objc_opt_new();
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

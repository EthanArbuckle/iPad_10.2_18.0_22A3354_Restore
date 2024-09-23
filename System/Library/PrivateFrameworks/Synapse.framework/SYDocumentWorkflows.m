@implementation SYDocumentWorkflows

+ (BOOL)isSupportedContentType:(id)a3
{
  NSObject *v4;

  if (!a3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SYDocumentWorkflows isSupportedContentType:].cold.1(v4);

  }
  return a3 != 0;
}

+ (BOOL)isSupportedContentTypeTree:(id)a3
{
  return 1;
}

+ (id)localizedStringReply:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    _SYBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Reply to %@"), CFSTR("Reply to %@"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredFormattedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _SYBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Reply"), CFSTR("Reply"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)localizedStringShowInMail
{
  void *v2;
  void *v3;

  _SYBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Show in Mail"), CFSTR("Show in Mail"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedStringShowInAppWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;

  v5 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 1, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v6)
  {
    objc_msgSend(v6, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    _SYBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Show in %@"), CFSTR("Show in %@"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SYDocumentWorkflows localizedStringShowInAppWithBundleIdentifier:error:].cold.1((uint64_t)v5, (uint64_t)v7, v13);

    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v12;
}

+ (id)localizedStringRemove
{
  void *v2;
  void *v3;

  _SYBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Remove"), CFSTR("Remove"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)isSupportedContentType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

+ (void)localizedStringShowInAppWithBundleIdentifier:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Unable to find record for bundle identifier: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

@end

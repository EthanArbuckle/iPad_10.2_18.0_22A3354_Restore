@implementation NSURL(TUSanitizedCopying)

+ (id)tu_defaultAllowedSchemes
{
  if (tu_defaultAllowedSchemes_onceToken != -1)
    dispatch_once(&tu_defaultAllowedSchemes_onceToken, &__block_literal_global_40);
  return (id)tu_defaultAllowedSchemes_defaultAllowedSchemes;
}

- (id)sanitizedCopy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "tu_defaultAllowedSchemes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sanitizedCopyWithZone:allowedSchemes:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sanitizedCopyWithZone:()TUSanitizedCopying
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E98], "tu_defaultAllowedSchemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sanitizedCopyWithZone:allowedSchemes:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sanitizedCopyWithZone:()TUSanitizedCopying allowedSchemes:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = a1;
      v11 = "[WARN] URL does not contain a valid scheme: %@";
      v12 = v10;
      v13 = 12;
LABEL_8:
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "containsObject:", v8) & 1) == 0)
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = a1;
      v17 = 2112;
      v18 = v6;
      v11 = "[WARN] URL scheme is not in list of allowed schemes: %@ allowedSchemes: %@";
      v12 = v10;
      v13 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = (void *)objc_msgSend(a1, "copyWithZone:", a3);
LABEL_10:

  return v9;
}

@end

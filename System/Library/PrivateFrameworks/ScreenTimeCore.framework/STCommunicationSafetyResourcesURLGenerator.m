@implementation STCommunicationSafetyResourcesURLGenerator

+ (id)communicationSafetySupportedCountryLanguagePairs
{
  if (communicationSafetySupportedCountryLanguagePairs_onceToken != -1)
    dispatch_once(&communicationSafetySupportedCountryLanguagePairs_onceToken, &__block_literal_global_8);
  return (id)communicationSafetySupportedCountryLanguagePairs_communicationSafetySupportedCountryLanguagePairs;
}

void __94__STCommunicationSafetyResourcesURLGenerator_communicationSafetySupportedCountryLanguagePairs__block_invoke()
{
  void *v0;

  v0 = (void *)communicationSafetySupportedCountryLanguagePairs_communicationSafetySupportedCountryLanguagePairs;
  communicationSafetySupportedCountryLanguagePairs_communicationSafetySupportedCountryLanguagePairs = (uint64_t)&unk_1E938DEC0;

}

+ (id)resourcesURL
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[STLog communicationSafety](STLog, "communicationSafety");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[STCommunicationSafetyResourcesURLGenerator resourcesURL].cold.1(v5, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_7;
  }
  objc_msgSend(v2, "appleIDCountryCodeForAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[STLog communicationSafety](STLog, "communicationSafety");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[STCommunicationSafetyResourcesURLGenerator resourcesURL].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_7:

    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "languageCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "resourcesURLForCountryCode:languageCode:", v4, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)resourcesURLForCountryCode:(id)a3 languageCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "communicationSafetySupportedCountryLanguagePairs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v8, "containsObject:", v6);
      v10 = (void *)MEMORY[0x1E0CB3940];
      if (v9)
      {
        objc_msgSend(v5, "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v6, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v8, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v11, v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(CFSTR("https://www.apple.com/go/child-safety/rp/"), "stringByAppendingString:", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = CFSTR("https://www.apple.com/go/child-safety/rp/");
    }

  }
  else
  {
    v13 = CFSTR("https://www.apple.com/go/child-safety/rp/");
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)resourcesURL
{
  OUTLINED_FUNCTION_7_0(&dword_1D22E7000, a1, a3, "Unable to fetch country code to generate Communication Safety resources URL.", a5, a6, a7, a8, 0);
}

@end

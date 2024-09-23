@implementation TPSContentURLController

+ (id)contentRequestURLWithContentMapHash:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "contentRequestURLWithContentMapHash:variantIdentifiers:useLanguageDefault:", v3, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentRequestURLWithContentMapHash:(id)a3 variantIdentifiers:(id)a4 useLanguageDefault:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("contentMapHash"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("variantId"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  objc_msgSend(a1, "requestURLForAPI:additionalQueryItems:useLanguageDefault:apiVersion:", CFSTR("content/documents"), v10, v5, CFSTR("v2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSLogger default](TPSLogger, "default");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_19A906000, v14, OS_LOG_TYPE_DEFAULT, "Documents URL %@", (uint8_t *)&v16, 0xCu);
  }

  return v13;
}

+ (id)userGuideURLForIdentifier:(id)a3 version:(id)a4 platformIndependent:(BOOL)a5 subPath:(id)a6
{
  id v9;
  __CFString *v10;
  id v11;
  void *v12;
  __CFString *v13;
  _BOOL4 v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  _BOOL4 v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  void *v37;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__CFString *)MGCopyAnswer();
  v14 = +[TPSCommonDefines isPadUI](TPSCommonDefines, "isPadUI");
  v15 = CFSTR("ios");
  if (v14)
    v15 = CFSTR("ipados");
  v16 = v15;
  v37 = v11;
  if (objc_msgSend(v9, "containsString:", CFSTR("watch")))
  {

    v17 = v10;
    v16 = CFSTR("watchos");
    goto LABEL_8;
  }
  if ((objc_msgSend(v9, "hasPrefix:", CFSTR("iphone")) & 1) != 0
    || (objc_msgSend(v9, "hasPrefix:", CFSTR("ipad")) & 1) != 0)
  {
    v17 = v13;
LABEL_8:
    if (a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("-%@"), v11);
    v32 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v32;
  }
  if (!a5)
  {
    v33 = +[TPSCommonDefines isPadUI](TPSCommonDefines, "isPadUI");
    v34 = CFSTR("ipad");
    if (!v33)
      v34 = CFSTR("iphone");
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("-%@"), v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v35;
    v17 = v13;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("platform"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("pOSv"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v19);

    goto LABEL_10;
  }
  v17 = v13;
LABEL_10:
  v36 = v9;
  objc_msgSend((id)objc_opt_class(), "languageStringWithLanguageDefault:count:", 1, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("locale"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v21);
  if (v10)
    v22 = v10;
  else
    v22 = CFSTR("1000");
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("productVersion"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v23);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("product"), v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v24);
  v25 = objc_alloc(MEMORY[0x1E0CB3998]);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://cds.apple.com"));
  v26 = v10;
  v27 = v17;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v25, "initWithURL:resolvingAgainstBaseURL:", v28, 0);

  objc_msgSend(v29, "setPath:", CFSTR("/content/services/book"));
  objc_msgSend(v29, "setQueryItems:", v12);
  objc_msgSend(v29, "URL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)metaRequestURL
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "requestURLForAPI:additionalQueryItems:useLanguageDefault:apiVersion:", CFSTR("meta"), 0, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSLogger default](TPSLogger, "default");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "Meta URL %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

+ (id)languageStringWithLanguageDefault:(BOOL)a3 count:(unint64_t)a4
{
  unsigned int v5;
  void *v6;
  void *v7;
  int64_t v8;
  unsigned int v9;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "preferredLocalizationsWithCount:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v7, "count") - a4;
  if (v5)
    v5 = objc_msgSend(v7, "containsObject:", CFSTR("en")) ^ 1;
  if (v8 >= 0)
    v9 = v5;
  else
    v9 = 0;
  if (v8 > 0 || v9 != 0)
    objc_msgSend(v7, "removeObjectsInRange:", a4 - v9, v8 + v9);
  if (v5)
    objc_msgSend(v7, "addObject:", CFSTR("en"));
  objc_msgSend(v7, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)preferredLocalizationsWithCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[TPSDefaultsManager requestLanguage](TPSDefaultsManager, "requestLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v7, "insertObject:atIndex:", v8, 0);
  do
  {
    if (objc_msgSend(v4, "count") >= a3 || !objc_msgSend(v7, "count"))
      break;
    objc_msgSend(MEMORY[0x1E0C99DC8], "tps_userPreferredLocalizationsForLanguages:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v9);
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
    v10 = objc_msgSend(v4, "containsObject:", CFSTR("en"));

  }
  while (!v10);
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

void __46__TPSContentURLController__uiTestLocalBaseURL__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.tips"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (void *)MGCopyAnswer();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("UITestOfflineContent"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_uiTestLocalBaseURL_gOfflineContentURL;
  _uiTestLocalBaseURL_gOfflineContentURL = v2;

  objc_msgSend((id)_uiTestLocalBaseURL_gOfflineContentURL, "URLByAppendingPathComponent:isDirectory:", v1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_uiTestLocalBaseURL_gOfflineContentURL;
  _uiTestLocalBaseURL_gOfflineContentURL = v4;

}

+ (id)requestURLForAPI:(id)a3 additionalQueryItems:(id)a4 useLanguageDefault:(BOOL)a5 apiVersion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  __CFString *v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v7 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a6;
  +[TPSDefaultsManager requestURL](TPSDefaultsManager, "requestURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isAbsolutePath"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSLogger default](TPSLogger, "default");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v14;
      _os_log_impl(&dword_19A906000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to load content from: Path %@", buf, 0xCu);
    }

    objc_msgSend(a1, "_uiTestLocalURLForIdentifier:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v13)
      goto LABEL_9;
    v17 = v12;
    v18 = v10;
    objc_msgSend(v11, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("docId"));

    if (v21)
    {
      objc_msgSend(v11, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "value");
      v23 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v23;
    }
    objc_msgSend(v13, "stringByAppendingPathComponent:", v18);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)v24;
    v12 = v17;
    if (!v16)
    {
LABEL_9:
      objc_msgSend((id)objc_opt_class(), "effectiveHost");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("api"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v51 = v12;
      if (v12)
        v28 = v12;
      else
        v28 = CFSTR("v2");
      objc_msgSend(v26, "stringByAppendingPathComponent:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("tips"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "stringByAppendingPathComponent:", v10);
      v31 = objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v11);
      else
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "modelQueryItem");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
        objc_msgSend(v32, "addObject:", v33);
      v47 = v10;
      v48 = v11;
      objc_msgSend((id)objc_opt_class(), "platformQueryItem");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
        objc_msgSend(v32, "addObject:", v34);
      v49 = (void *)v34;
      v50 = (void *)v33;
      objc_msgSend((id)objc_opt_class(), "languageStringWithLanguageDefault:count:", v7, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("lang"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v36);
      +[TPSDefaultsManager requestVersion](TPSDefaultsManager, "requestVersion");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        v38 = v31;
        v39 = (void *)MGCopyAnswer();
        v40 = objc_msgSend(a1, "majorVersionForVersionString:", v39);
        if (v40 <= +[TPSCommonDefines maxRequestVersion](TPSCommonDefines, "maxRequestVersion"))
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.0-%@"), v40, v39);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.0"), +[TPSCommonDefines maxRequestVersion](TPSCommonDefines, "maxRequestVersion"), v46);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v38;
      }
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("osVersion"), v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v41);
      v42 = (void *)v25;
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v25, 0);
      objc_msgSend(v43, "setPath:", v31);
      objc_msgSend(v43, "setQueryItems:", v32);
      objc_msgSend(v43, "URL");
      v44 = (void *)v31;
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v51;
      v10 = v47;
      v11 = v48;
    }
  }

  return v16;
}

+ (id)assetPathFromAssetConfiguration:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identifierForType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[TPSDefaultsManager assetURL](TPSDefaultsManager, "assetURL");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v6, "cacheIdentifierForType:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("asset"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "assets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "baseURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[TPSDefaultsManager assetRequestHostURL](TPSDefaultsManager, "assetRequestHostURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
        v16 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v16;
      }
      +[TPSDefaultsManager requestURL](TPSDefaultsManager, "requestURL");
      v17 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isAbsolutePath](v17, "isAbsolutePath"))
      {
        objc_msgSend(a1, "_uiTestLocalBaseURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v7, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[TPSLogger default](TPSLogger, "default");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412290;
          v25 = v14;
          _os_log_impl(&dword_19A906000, v20, OS_LOG_TYPE_DEFAULT, "Generated loaded assets URL %@", (uint8_t *)&v24, 0xCu);
        }

        goto LABEL_15;
      }
      objc_msgSend(CFSTR("v2"), "stringByAppendingPathComponent:", CFSTR("tips"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", v7);
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "URLByAppendingPathComponent:", v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)v22;
    }

    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSLogger default](TPSLogger, "default");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v14;
      _os_log_impl(&dword_19A906000, v17, OS_LOG_TYPE_DEFAULT, "Generated asset URL %@", (uint8_t *)&v24, 0xCu);
    }
    v10 = v13;
LABEL_15:

    goto LABEL_16;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

+ (id)_uiTestLocalURLForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_uiTestLocalBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_uiTestLocalBaseURL
{
  if (_uiTestLocalBaseURL_predicate != -1)
    dispatch_once(&_uiTestLocalBaseURL_predicate, &__block_literal_global);
  return (id)_uiTestLocalBaseURL_gOfflineContentURL;
}

+ (id)preferredLocalizations
{
  return (id)objc_msgSend((id)objc_opt_class(), "preferredLocalizationsWithCount:", 3);
}

+ (id)defaultHostPath
{
  return CFSTR("https://ipcdn.apple.com/");
}

+ (int64_t)majorVersionForVersionString:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

+ (id)modelQueryItem
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)MGCopyAnswer();
  +[TPSDefaultsManager requestModel](TPSDefaultsManager, "requestModel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = v2;
  v6 = v5;

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("model"), v6),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = MGCopyAnswer();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("deviceClass"), v8),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          !v7))
    {
      v10 = (void *)MEMORY[0x1E0CB39D8];
      +[TPSCommonDefines deviceFamily](TPSCommonDefines, "deviceFamily");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "queryItemWithName:value:", CFSTR("deviceFamily"), v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

+ (id)platformQueryItem
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a1, "_platformString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSDefaultsManager requestPlatform](TPSDefaultsManager, "requestPlatform");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = v2;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("platform"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)defaultHost
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "defaultHostPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)effectiveHost
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  +[TPSDefaultsManager requestHostURL](TPSDefaultsManager, "requestHostURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "defaultHostPath");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_platformString
{
  void *v2;
  void *v3;
  __CFString *v4;

  +[TPSDefaultsManager platform](TPSDefaultsManager, "platform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("ios");

  return v4;
}

+ (id)_boardIDOrProductHash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "_boardID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "_productHash");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)_boardID
{
  return 0;
}

+ (id)_productHash
{
  id v2;
  unsigned __int8 *v3;
  uint64_t v4;
  void *i;
  unsigned int v6;

  v2 = objc_retainAutorelease((id)MGCopyAnswer());
  v3 = (unsigned __int8 *)objc_msgSend(v2, "bytes");
  if (v3)
  {
    v4 = objc_msgSend(v2, "length");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * v4);
    for (i = (void *)objc_claimAutoreleasedReturnValue(); v4; --v4)
    {
      v6 = *v3++;
      objc_msgSend(i, "appendFormat:", CFSTR("%02lx"), v6);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", i);
    v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end

@implementation SSRecentResultsManager

void __33__SSRecentResultsManager_preheat__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("cacheManagerUpdateQueue", v2);
  v1 = (void *)preheat_gCacheManagerQueue;
  preheat_gCacheManagerQueue = (uint64_t)v0;

}

+ (void)preheat
{
  id v2;
  id v3;
  id v4;
  id v5;

  +[SSApplicationManager sharedInstance](SSApplicationManager, "sharedInstance");

  if (preheat_onceToken != -1)
    dispatch_once(&preheat_onceToken, &__block_literal_global_59);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v2, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v2, "setUnderlyingQueue:", preheat_gCacheManagerQueue);
  v3 = (id)objc_msgSend(v5, "addObserverForName:object:suspensionBehavior:queue:usingBlock:", CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, 3, v2, &__block_literal_global_16_0);
  v4 = (id)objc_msgSend(v5, "addObserverForName:object:suspensionBehavior:queue:usingBlock:", CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, 3, v2, &__block_literal_global_16_0);

}

void __33__SSRecentResultsManager_preheat__block_invoke_2()
{
  void *v0;
  id v1;

  +[SSApplicationManager sharedInstance](SSApplicationManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentApplications");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA9BA8], "updateApplicationContexts:", v1);
}

+ (BOOL)isValidSearchString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "length") != 0;
  return (char)v4;
}

+ (void)cacheSearchString:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(a1, "isValidSearchString:"))
    objc_msgSend(MEMORY[0x1E0DA9BA8], "cacheSuggestion:type:score:searchString:", v4, 30, &unk_1E6E9A410, v4);

}

+ (void)cacheResult:(id)a3 searchString:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v58 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "isValidSearchString:", v6))
  {
    switch(objc_msgSend(v58, "type"))
    {
      case 1u:
        objc_msgSend(v58, "completedQuery");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          goto LABEL_28;
        objc_msgSend(v58, "completion");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          v33 = v31;
          goto LABEL_52;
        }
        objc_msgSend(v58, "title");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "text");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_53;
      case 2u:
      case 3u:
      case 4u:
      case 0x14u:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend(v58, "resultBundleId");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
          break;
        v8 = (id)v7;
        objc_msgSend(v58, "applicationBundleIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_49;
        v10 = (__CFString *)v9;
        objc_msgSend(v58, "sectionBundleIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_48;
        v12 = (void *)v11;
        objc_msgSend(v58, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          break;
        v8 = (id)*MEMORY[0x1E0CB2AC0];
        v10 = (__CFString *)v58;
        -[__CFString sectionBundleIdentifier](v10, "sectionBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.application"));

        if ((v15 & 1) == 0)
        {
          -[__CFString valueForAttribute:withType:](v10, "valueForAttribute:withType:", *MEMORY[0x1E0CA6870], objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");

          if ((v17 & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              -[__CFString protectionClass](v10, "protectionClass");
              v18 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v18 = 0;
            }

            v55 = (void *)MEMORY[0x1E0DA9BA8];
            -[__CFString identifier](v10, "identifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString resultBundleId](v10, "resultBundleId");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "cacheLocalResult:identifier:bundleIdentifier:protectionClass:searchString:", v10, v56, v57, v18, v6);

            v8 = (id)v18;
          }
        }
        goto LABEL_48;
      case 8u:
      case 0x18u:
      case 0x22u:
      case 0x23u:
        break;
      case 0xFu:
      case 0x10u:
      case 0x1Eu:
      case 0x1Fu:
        v8 = v58;
        objc_msgSend(v8, "completion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v10 = v19;
        }
        else
        {
          objc_msgSend(v8, "title");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "text");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        if (-[__CFString length](v10, "length"))
        {
          v26 = (void *)MEMORY[0x1E0DA9BA8];
          v27 = objc_msgSend(v8, "type");
          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "rankingScore");
          objc_msgSend(v28, "numberWithDouble:");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "cacheSuggestion:type:score:searchString:", v10, v27, v29, v6);

        }
        goto LABEL_48;
      case 0x11u:
      case 0x1Cu:
      case 0x1Du:
        v8 = v58;
        objc_msgSend(v8, "completion");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(v8, "title");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "text");
          v22 = objc_claimAutoreleasedReturnValue();

          if (v22)
            v10 = (__CFString *)v22;
          else
            v10 = &stru_1E6E549F0;
        }
        objc_msgSend(MEMORY[0x1E0DA9BA8], "cacheResult:title:searchString:", v8, v10, v6);
        goto LABEL_48;
      case 0x20u:
        v34 = v58;
        v8 = v34;
        goto LABEL_30;
      case 0x24u:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend(v58, "resultBundleId");
        v37 = objc_claimAutoreleasedReturnValue();
        if (!v37)
          break;
        v8 = (id)v37;
        objc_msgSend(v58, "applicationBundleIdentifier");
        v38 = objc_claimAutoreleasedReturnValue();
        if (!v38)
          goto LABEL_49;
        v10 = (__CFString *)v38;
        objc_msgSend(v58, "sectionBundleIdentifier");
        v39 = objc_claimAutoreleasedReturnValue();
        if (!v39)
          goto LABEL_48;
        v40 = (void *)v39;
        objc_msgSend(v58, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
          break;
        v8 = v58;
        objc_msgSend(v8, "sectionBundleIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));

        if ((v43 & 1) != 0)
          goto LABEL_49;
        v34 = v8;
LABEL_30:
        objc_msgSend(v34, "completion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
        {
          v10 = v35;
        }
        else
        {
          objc_msgSend(v8, "title");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "text");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v8, "contactIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString length](v10, "length") && objc_msgSend(v47, "length"))
        {
          v52 = (void *)MEMORY[0x1E0DA9BA8];
          v53 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "rankingScore");
          objc_msgSend(v53, "numberWithDouble:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "cacheContact:contactIdentifier:score:searchString:", v10, v47, v50, v6);
LABEL_46:

        }
LABEL_48:

LABEL_49:
        break;
      case 0x25u:
      case 0x26u:
        v8 = v58;
        objc_msgSend(v8, "completion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v10 = v23;
        }
        else
        {
          objc_msgSend(v8, "title");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "text");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        if (!-[__CFString length](v10, "length"))
          goto LABEL_48;
        objc_msgSend(v8, "personQueryIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "personIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPSearchContactEntity updatePersonQueryIdentifier:withPersonIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withPersonIdentifier:", v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = (void *)MEMORY[0x1E0DA9BA8];
        v49 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "rankingScore");
        objc_msgSend(v49, "numberWithDouble:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "cachePerson:personQueryIdentifier:score:searchString:", v10, v47, v50, v6);
        goto LABEL_46;
      default:
        objc_msgSend(v58, "completion");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
LABEL_28:
          v8 = v30;
        }
        else
        {
          objc_msgSend(v58, "title");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "text");
          v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:
          v8 = v33;
LABEL_53:

        }
        if (objc_msgSend(v8, "length"))
          objc_msgSend(MEMORY[0x1E0DA9BA8], "cacheResult:title:searchString:", v58, v8, v6);
        goto LABEL_49;
    }
  }

}

+ (void)deleteResult:(id)a3
{
  objc_msgSend(a1, "deleteResult:requiresRefresh:", a3, 1);
}

+ (void)deleteResult:(id)a3 requiresRefresh:(BOOL)a4
{
  _BOOL4 v4;
  char isKindOfClass;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  v4 = a4;
  v59 = a3;
  switch(objc_msgSend(v59, "type"))
  {
    case 2u:
    case 3u:
    case 4u:
    case 0x14u:
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v59, "resultBundleId");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (__CFString *)v7;
      if ((isKindOfClass & 1) == 0)
      {
        if (!v7)
          goto LABEL_54;
        objc_msgSend(v59, "sectionBundleIdentifier");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          objc_msgSend(v59, "sectionBundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.searchd.recent.results"));

          if (!v25)
            goto LABEL_54;
          objc_msgSend(v59, "resultBundleId");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsSeparatedByString:", CFSTR(":"));
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (-[__CFString count](v8, "count") == 2)
          {
            -[__CFString firstObject](v8, "firstObject");
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[__CFString lastObject](v8, "lastObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0DA9BA8];
            objc_msgSend(v59, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "deleteLocalResult:identifier:bundleIdentifier:protectionClass:", v59, v29, v27, v10);
            goto LABEL_50;
          }
        }
        goto LABEL_53;
      }
      if (!v7)
        goto LABEL_54;
      objc_msgSend(v59, "applicationBundleIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_53;
      v10 = (__CFString *)v9;
      objc_msgSend(v59, "sectionBundleIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_52;
      v12 = (void *)v11;
      objc_msgSend(v59, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = v59;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "protectionClass");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        v52 = (void *)MEMORY[0x1E0DA9BA8];
        objc_msgSend(v14, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resultBundleId");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "deleteLocalResult:identifier:bundleIdentifier:protectionClass:", v14, v53, v54, v15);

        goto LABEL_56;
      }
      goto LABEL_54;
    case 8u:
      v37 = (void *)MEMORY[0x1E0DA9BA8];
      objc_msgSend(v59, "completion");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v59, "type");
      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v59, "rankingScore");
      objc_msgSend(v39, "numberWithDouble:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "deleteSuggestion:type:score:", v8, v38, v40);

      goto LABEL_53;
    case 0xFu:
    case 0x10u:
    case 0x1Eu:
    case 0x1Fu:
      v8 = (__CFString *)v59;
      -[__CFString completion](v8, "completion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v10 = v16;
      }
      else
      {
        -[__CFString title](v8, "title");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "text");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      if (-[__CFString length](v10, "length"))
      {
        v31 = (void *)MEMORY[0x1E0DA9BA8];
        v32 = -[__CFString type](v8, "type");
        v33 = (void *)MEMORY[0x1E0CB37E8];
        -[__CFString rankingScore](v8, "rankingScore");
        objc_msgSend(v33, "numberWithDouble:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "deleteSuggestion:type:score:", v10, v32, v34);

      }
      goto LABEL_52;
    case 0x11u:
    case 0x1Cu:
    case 0x1Du:
      v8 = (__CFString *)v59;
      -[__CFString completion](v8, "completion");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        -[__CFString title](v8, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "text");
        v19 = objc_claimAutoreleasedReturnValue();

        if (v19)
          v10 = (__CFString *)v19;
        else
          v10 = &stru_1E6E549F0;
      }
      objc_msgSend(MEMORY[0x1E0DA9BA8], "deleteResult:title:", v8, v10);
      goto LABEL_52;
    case 0x20u:
      v8 = (__CFString *)v59;
      -[__CFString completion](v8, "completion");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v10 = v41;
      }
      else
      {
        -[__CFString title](v8, "title");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "text");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      -[__CFString contactIdentifier](v8, "contactIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v10, "length") || !objc_msgSend(v27, "length"))
        goto LABEL_51;
      goto LABEL_49;
    case 0x24u:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_54;
      v8 = (__CFString *)v59;
      -[__CFString contactIdentifier](v8, "contactIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
        goto LABEL_53;
      -[__CFString completion](v8, "completion");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
      {
        v10 = v44;
      }
      else
      {
        -[__CFString title](v8, "title");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "text");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      -[__CFString contactIdentifier](v8, "contactIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
      v56 = (void *)MEMORY[0x1E0DA9BA8];
      v57 = (void *)MEMORY[0x1E0CB37E8];
      -[__CFString rankingScore](v8, "rankingScore");
      objc_msgSend(v57, "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "deleteContact:contactIdentifier:score:", v10, v27, v29);
LABEL_50:

LABEL_51:
LABEL_52:

LABEL_53:
LABEL_54:
      v58 = v59;
      if (v4)
      {
        objc_msgSend(a1, "sendRefreshNotification");
LABEL_56:
        v58 = v59;
      }

      return;
    case 0x25u:
    case 0x26u:
      v8 = (__CFString *)v59;
      -[__CFString completion](v8, "completion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v10 = v20;
      }
      else
      {
        -[__CFString title](v8, "title");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "text");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      if (!-[__CFString length](v10, "length"))
        goto LABEL_52;
      -[__CFString personQueryIdentifier](v8, "personQueryIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString personIdentifier](v8, "personIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPSearchContactEntity updatePersonQueryIdentifier:withPersonIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withPersonIdentifier:", v47, v48);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = (void *)MEMORY[0x1E0DA9BA8];
      v50 = (void *)MEMORY[0x1E0CB37E8];
      -[__CFString rankingScore](v8, "rankingScore");
      objc_msgSend(v50, "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "deletePerson:personQueryIdentifier:score:", v10, v27, v29);
      goto LABEL_50;
    default:
      objc_msgSend(v59, "completion");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(v59, "title");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "text");
        v36 = objc_claimAutoreleasedReturnValue();

        if (v36)
          v8 = (__CFString *)v36;
        else
          v8 = &stru_1E6E549F0;
      }
      objc_msgSend(MEMORY[0x1E0DA9BA8], "deleteResult:title:", v59, v8);
      goto LABEL_53;
  }
}

+ (void)deleteAllRecents
{
  objc_msgSend(MEMORY[0x1E0DA9BA8], "deleteAllRecentResults");
}

+ (id)updateResult:(id)a3 topic:(id)a4 queryContext:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  intptr_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  NSObject *v47;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  NSObject *v61;
  __int128 *p_buf;
  _BYTE v63[24];
  void *v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v53 = a5;
  SSRecentResultsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "resultBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1B86C5000, v9, OS_LOG_TYPE_DEFAULT, "updateResult withResultBUndleId: %@", (uint8_t *)&buf, 0xCu);

  }
  SSRecentResultsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[SSRecentResultsManager updateResult:topic:queryContext:].cold.3((uint64_t)v8, v11, v12);

  objc_msgSend(v7, "sectionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.searchd.recent.results"));

  if (v14)
  {
    SSGeneralLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_DEFAULT, "recent result", (uint8_t *)&buf, 2u);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__12;
    v68 = __Block_byref_object_dispose__12;
    v69 = 0;
    objc_msgSend(v7, "resultBundleId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if ((unint64_t)objc_msgSend(v18, "count") >= 2)
    {
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectAtIndex:", 0);
      objc_msgSend(v18, "componentsJoinedByString:", &stru_1E6E549F0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((SSScreenTimeStatusForBundleIDWithCompletionHandler(v20, 0) & 1) == 0)
      {
        objc_msgSend(v7, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSResultBuilder fetchAttributes](SSResultBuilder, "fetchAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = dispatch_group_create();
        dispatch_group_enter(v23);
        objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke;
        v54[3] = &unk_1E6E545D8;
        v52 = v21;
        v55 = v52;
        v56 = v20;
        v57 = v19;
        v26 = v22;
        v58 = v26;
        v59 = v7;
        p_buf = &buf;
        v60 = v53;
        v27 = v23;
        v61 = v27;
        objc_msgSend(v24, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v26, v57, v56, v25, v54);

        v28 = dispatch_time(0, 750000000);
        v29 = dispatch_group_wait(v27, v28);
        SSRecentResultsLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSRecentResultsManager updateResult:topic:queryContext:].cold.1(v31, (uint64_t)v63, v30);
        }

      }
    }
    v32 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    goto LABEL_31;
  }
  objc_msgSend(v7, "sectionBundleIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.searchd.recent.dictionary"));

  if (v34)
  {
    SSRecentResultsLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B86C5000, v35, OS_LOG_TYPE_DEFAULT, "recent dictionary result", (uint8_t *)&buf, 2u);
    }

    +[SSResultBuilder resultBuilderWithResult:](SSResultBuilder, "resultBuilderWithResult:", v7);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "buildResult");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "compactCard");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "cardSections");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setShouldUseCompactDisplay:", 1);

    objc_msgSend(v32, "setShouldUseCompactDisplay:", 1);
    objc_msgSend(v32, "setUsesCompactDisplay:", 1);
    objc_msgSend(v32, "setInlineCard:", 0);

    goto LABEL_31;
  }
  objc_msgSend(v7, "sectionBundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("com.apple.searchd.recent.suggestions"));

  if (v41)
  {
    SSRecentResultsLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B86C5000, v42, OS_LOG_TYPE_DEFAULT, "recent suggestion", (uint8_t *)&buf, 2u);
    }

    +[SSSuggestionResultBuilder buildResultWithResult:queryContext:](SSSuggestionResultBuilder, "buildResultWithResult:queryContext:", v7, v53);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  objc_msgSend(v7, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {

LABEL_26:
    SSRecentResultsLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      +[SSRecentResultsManager updateResult:topic:queryContext:].cold.2(v47);

    objc_msgSend(v7, "setUsesCompactDisplay:", 1);
LABEL_29:
    v43 = v7;
LABEL_30:
    v32 = v43;
    goto LABEL_31;
  }
  objc_msgSend(v7, "sectionBundleIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45 == 0;

  if (!v46)
    goto LABEL_26;
  SSRecentResultsLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B86C5000, v49, OS_LOG_TYPE_DEFAULT, "fallback result from topic", (uint8_t *)&buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DA9BA8], "resultFromTopic:", v8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50)
    goto LABEL_29;
  SSGeneralLog();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B86C5000, v51, OS_LOG_TYPE_DEFAULT, "successfully created fallback search result", (uint8_t *)&buf, 2u);
  }

  +[SSSuggestionResultBuilder buildResultWithResult:queryContext:](SSSuggestionResultBuilder, "buildResultWithResult:queryContext:", v50, v53);
  v32 = (id)objc_claimAutoreleasedReturnValue();

LABEL_31:
  return v32;
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  SFSearchResult_SpotlightExtras *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SFSearchResult_SpotlightExtras *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSRecentResultsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_3(v5);

  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (SSFetchAttributeValueIsValid(v4), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = [SFSearchResult_SpotlightExtras alloc];
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SFSearchResult_SpotlightExtras initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:](v8, "initWithIdentifier:bundleIdentifier:protectionClass:attributeKeys:attributeValues:type:completion:", v9, v10, v11, v12, v13, objc_msgSend(*(id *)(a1 + 64), "type"), 0);

    SSRecentResultsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_2((uint64_t)v14, v15, v16);

    -[SFSearchResult_SpotlightExtras setShouldUseCompactDisplay:](v14, "setShouldUseCompactDisplay:", 1);
    if (-[SFSearchResult_SpotlightExtras type](v14, "type") == 36
      || -[SFSearchResult_SpotlightExtras type](v14, "type") == 32)
    {
      +[SSSuggestionResultBuilder buildResultWithResult:queryContext:](SSSuggestionResultBuilder, "buildResultWithResult:queryContext:", v14, *(_QWORD *)(a1 + 72));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
    }
    else
    {
      +[SSResultBuilder resultBuilderWithResult:](SSResultBuilder, "resultBuilderWithResult:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "buildResult");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "compactCard");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "cardSections");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setShouldUseCompactDisplay:", 1);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setShouldUseCompactDisplay:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setUsesCompactDisplay:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setInlineCard:", 0);
    }

  }
  else
  {
    SSRecentResultsLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_1(a1, v20, v21);

    +[SSRecentResultsManager deleteResult:requiresRefresh:](SSRecentResultsManager, "deleteResult:requiresRefresh:", *(_QWORD *)(a1 + 64), 0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));

}

+ (void)sendRefreshNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.spotlight.refreshZKW"), 0);

}

+ (void)updateResult:(void *)a1 topic:(uint64_t)a2 queryContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_9(&dword_1B86C5000, a3, (uint64_t)a3, "waited for group didFail: %@", (uint8_t *)a2);

}

+ (void)updateResult:(os_log_t)log topic:queryContext:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "couldn't update result", v1, 2u);
}

+ (void)updateResult:(uint64_t)a1 topic:(NSObject *)a2 queryContext:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_9(&dword_1B86C5000, a2, a3, "updateResult withTopic: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_9(&dword_1B86C5000, a2, a3, "fetchAttributes was not an array: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8();
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_9(&dword_1B86C5000, a2, a3, "got csResult: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

void __58__SSRecentResultsManager_updateResult_topic_queryContext___block_invoke_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B86C5000, log, OS_LOG_TYPE_DEBUG, "got fetchAttributes", v1, 2u);
}

@end

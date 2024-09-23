@implementation WBSSearchProvider

- (id)userVisibleQueryFromSearchURL:(id)a3 allowQueryThatLooksLikeURL:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a3;
  if (-[WBSSearchProvider urlIsValidSearch:](self, "urlIsValidSearch:", v6))
  {
    if (!self->_usesSearchTermsFromFragment
      || (objc_msgSend(v6, "fragment"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          valueForKeyInQuery(v7, self->_queryKey),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
      objc_msgSend(v6, "query");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      valueForKeyInQuery(v9, self->_queryKey);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "safari_stringDecodedFromURLQueryParameter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_stringByTrimmingWhitespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      goto LABEL_10;
    if (!a4)
    {
      objc_msgSend(v10, "safari_stringByReplacingHomoglyphForSpaceWithSpace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "safari_containsInteriorWhitespace") & 1) == 0
        && (objc_msgSend(v13, "safari_containsPeriodOrHomoglyphForPeriod") & 1) != 0)
      {

LABEL_10:
        v14 = 0;
LABEL_14:

        goto LABEL_15;
      }

    }
    v14 = v10;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (BOOL)urlIsValidSearch:(id)a3
{
  id v4;
  WBSURLSuffixChecker *suffixChecker;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "safari_isHTTPFamilyURL")
    && (suffixChecker = self->_suffixChecker,
        objc_msgSend(v4, "host"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(suffixChecker) = -[WBSURLSuffixChecker hasSuffix:](suffixChecker, "hasSuffix:", v6),
        v6,
        (_DWORD)suffixChecker))
  {
    if (-[NSArray count](self->_pathPrefixes, "count"))
    {
      objc_msgSend(v4, "safari_path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = self->_pathPrefixes;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v8);
            v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend(v7, "safari_hasPrefix:", v12, (_QWORD)v14) & 1) != 0)
            {
              LOBYTE(v9) = 1;
              goto LABEL_18;
            }
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_18:

    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (WBSSearchProvider)initWithDictionary:(id)a3 usingContext:(id)a4
{
  id v6;
  id v7;
  WBSSearchProvider *v8;
  void *v9;
  uint64_t v10;
  NSString *scriptName;
  void *v12;
  uint64_t v13;
  NSString *shortName;
  void *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *searchEngineIdentifier;
  void *v22;
  uint64_t v23;
  NSString *parsecSearchIdentifier;
  void *v25;
  uint64_t v26;
  NSString *parsecSearchSuggestionIdentifier;
  void *v28;
  uint64_t v29;
  NSArray *languages;
  void *v31;
  uint64_t v32;
  NSArray *userRegions;
  void *v34;
  uint64_t v35;
  NSArray *hostSuffixes;
  void *v37;
  uint64_t v38;
  NSArray *pathPrefixes;
  void *v40;
  void *v41;
  uint64_t v42;
  NSSet *homepageURLs;
  void *v44;
  uint64_t v45;
  NSDictionary *topLevelDomains;
  void *v47;
  uint64_t v48;
  NSString *groupIdentifierQueryStringKey;
  void *v50;
  uint64_t v51;
  NSString *v52;
  void *v53;
  uint64_t v54;
  NSString *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSString *carrierInfo;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  WBSOpenSearchURLTemplate *searchURLTemplate;
  void *v68;
  void *v69;
  uint64_t v70;
  WBSOpenSearchURLTemplate *suggestionsURLTemplate;
  uint64_t v72;
  NSDictionary *safeSearchURLQueryParameters;
  void *v74;
  WBSSearchProvider *v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  WBSOpenSearchURLTemplate *safeSearchURLTemplate;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSString *queryKey;
  uint64_t v88;
  WBSURLSuffixChecker *suffixChecker;
  objc_super v90;

  v6 = a3;
  v7 = a4;
  v90.receiver = self;
  v90.super_class = (Class)WBSSearchProvider;
  v8 = -[WBSSearchProvider init](&v90, sel_init);
  if (!v8)
    goto LABEL_15;
  objc_msgSend(v6, "safari_stringForKey:", CFSTR("ScriptingName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  scriptName = v8->_scriptName;
  v8->_scriptName = (NSString *)v10;

  if (!-[NSString length](v8->_scriptName, "length"))
    goto LABEL_15;
  objc_msgSend(v6, "safari_stringForKey:", CFSTR("ShortName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  shortName = v8->_shortName;
  v8->_shortName = (NSString *)v13;

  if (!-[NSString length](v8->_shortName, "length"))
    goto LABEL_15;
  objc_msgSend(v6, "safari_stringForKey:", CFSTR("LocalizedName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSString *)objc_msgSend(v15, "copy");
  v17 = v16;
  if (!v16)
    v17 = v8->_shortName;
  objc_storeStrong((id *)&v8->_displayName, v17);

  objc_msgSend(v6, "safari_numberForKey:", CFSTR("SearchEngineID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_searchID = objc_msgSend(v18, "integerValue");

  objc_msgSend(v6, "safari_stringForKey:", CFSTR("SearchEngineIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "copy");
  searchEngineIdentifier = v8->_searchEngineIdentifier;
  v8->_searchEngineIdentifier = (NSString *)v20;

  if (!v8->_searchID)
    goto LABEL_15;
  if (-[NSString length](v8->_searchEngineIdentifier, "length"))
  {
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("ParsecSearchIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    parsecSearchIdentifier = v8->_parsecSearchIdentifier;
    v8->_parsecSearchIdentifier = (NSString *)v23;

    objc_msgSend(v6, "safari_stringForKey:", CFSTR("ParsecSearchSuggestionIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    parsecSearchSuggestionIdentifier = v8->_parsecSearchSuggestionIdentifier;
    v8->_parsecSearchSuggestionIdentifier = (NSString *)v26;

    objc_msgSend(v6, "safari_arrayForKey:", CFSTR("Language"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    languages = v8->_languages;
    v8->_languages = (NSArray *)v29;

    objc_msgSend(v6, "safari_arrayForKey:", CFSTR("UserRegions"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    userRegions = v8->_userRegions;
    v8->_userRegions = (NSArray *)v32;

    objc_msgSend(v6, "safari_arrayForKey:", CFSTR("HostSuffixes"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "copy");
    hostSuffixes = v8->_hostSuffixes;
    v8->_hostSuffixes = (NSArray *)v35;

    objc_msgSend(v6, "safari_arrayForKey:", CFSTR("PathPrefixes"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "copy");
    pathPrefixes = v8->_pathPrefixes;
    v8->_pathPrefixes = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "safari_arrayForKey:", CFSTR("HomepageURLs"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41);
    v42 = objc_claimAutoreleasedReturnValue();
    homepageURLs = v8->_homepageURLs;
    v8->_homepageURLs = (NSSet *)v42;

    objc_msgSend(v6, "safari_dictionaryForKey:", CFSTR("TopLevelDomains"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "copy");
    topLevelDomains = v8->_topLevelDomains;
    v8->_topLevelDomains = (NSDictionary *)v45;

    v8->_usesSearchTermsFromFragment = objc_msgSend(v6, "safari_BOOLForKey:", CFSTR("UsesSearchTermsFromFragment"));
    objc_msgSend(v6, "safari_stringForKey:", CFSTR("GroupIdentifierQueryStringKey"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "copy");
    groupIdentifierQueryStringKey = v8->_groupIdentifierQueryStringKey;
    v8->_groupIdentifierQueryStringKey = (NSString *)v48;

    objc_msgSend(v6, "safari_stringForKey:", CFSTR("ParsecSearchIdentifier"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "copy");
    v52 = v8->_parsecSearchIdentifier;
    v8->_parsecSearchIdentifier = (NSString *)v51;

    objc_msgSend(v6, "safari_stringForKey:", CFSTR("ParsecSearchSuggestionIdentifier"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "copy");
    v55 = v8->_parsecSearchSuggestionIdentifier;
    v8->_parsecSearchSuggestionIdentifier = (NSString *)v54;

    v8->_parsecSearchEndpointType = -[WBSSearchProvider _parsecSearchEndpointTypeInDictionary:](v8, "_parsecSearchEndpointTypeInDictionary:", v6);
    v8->_parsecSearchResultType = -[WBSSearchProvider _parsecSearchResultTypeInDictionary:](v8, "_parsecSearchResultTypeInDictionary:", v6);
    v56 = objc_msgSend(v7, "deviceType");
    objc_msgSend(v6, "safari_arrayForKey:", CFSTR("CarrierInfoTemplate"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "copy");
    carrierInfo = v8->_carrierInfo;
    v8->_carrierInfo = (NSString *)v58;

    objc_msgSend(v7, "carrierTemplateParameterValues");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSearchProvider _substitutionValuesForTemplateURLUsingContext:](v8, "_substitutionValuesForTemplateURLUsingContext:", v7);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSearchProvider _searchURLTemplateStringInDictionary:usingContext:](v8, "_searchURLTemplateStringInDictionary:usingContext:", v6, v7);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v62;
    if (v8->_carrierInfo && v60)
    {
      objc_msgSend(v62, "stringByAppendingString:");
      v64 = objc_claimAutoreleasedReturnValue();

      v63 = (void *)v64;
    }
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A150]), "initWithString:", v63);
    objc_msgSend(v65, "templateBySubstitutingValues:", v61);
    v66 = objc_claimAutoreleasedReturnValue();
    searchURLTemplate = v8->_searchURLTemplate;
    v8->_searchURLTemplate = (WBSOpenSearchURLTemplate *)v66;

    if (v8->_searchURLTemplate)
    {
      -[WBSSearchProvider _suggestionsURLTemplateStringInDictionary:usingContext:](v8, "_suggestionsURLTemplateStringInDictionary:usingContext:", v6, v7);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A150]), "initWithString:", v68);
      objc_msgSend(v69, "templateBySubstitutingValues:", v61);
      v70 = objc_claimAutoreleasedReturnValue();
      suggestionsURLTemplate = v8->_suggestionsURLTemplate;
      v8->_suggestionsURLTemplate = (WBSOpenSearchURLTemplate *)v70;

      objc_msgSend(v6, "safari_dictionaryForKey:", CFSTR("SafeSearchURLQueryParameters"));
      v72 = objc_claimAutoreleasedReturnValue();
      safeSearchURLQueryParameters = v8->_safeSearchURLQueryParameters;
      v8->_safeSearchURLQueryParameters = (NSDictionary *)v72;

      if (v8->_safeSearchURLQueryParameters)
      {
        if ((v56 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          objc_msgSend(v6, "safari_stringForKey:", CFSTR("SafeSearchURLTemplateMac"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v6, "safari_stringForKey:", CFSTR("SafeSearchSuffix"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSOpenSearchURLTemplate templateString](v8->_searchURLTemplate, "templateString");
          v78 = v68;
          v79 = v60;
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringByAppendingString:", v77);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = v79;
          v68 = v78;

        }
        v81 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A150]), "initWithString:", v74);
        safeSearchURLTemplate = v8->_safeSearchURLTemplate;
        v8->_safeSearchURLTemplate = (WBSOpenSearchURLTemplate *)v81;

      }
      objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v63);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_usesSecureSearchURL = objc_msgSend(v83, "safari_isSecureURL");

      -[WBSOpenSearchURLTemplate templateString](v8->_searchURLTemplate, "templateString");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      queryKeyFromSearchTemplate(v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "copy");
      queryKey = v8->_queryKey;
      v8->_queryKey = (NSString *)v86;

      v88 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A218]), "initWithSuffixes:", v8->_hostSuffixes);
      suffixChecker = v8->_suffixChecker;
      v8->_suffixChecker = (WBSURLSuffixChecker *)v88;

      v75 = v8;
    }
    else
    {
      v75 = 0;
    }

  }
  else
  {
LABEL_15:
    v75 = 0;
  }

  return v75;
}

- (id)_suggestionsURLTemplateStringInDictionary:(id)a3 usingContext:(id)a4
{
  id v5;
  uint64_t v6;
  __CFString **v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "deviceType");
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7 = WBSSearchProviderDefinitionSuggestionsURLTemplateMacKey;
  }
  else
  {
    if (v6 != 1)
    {
LABEL_6:
      objc_msgSend(v5, "safari_stringForKey:", CFSTR("SuggestionsURLTemplate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = WBSSearchProviderDefinitionSuggestionsURLTemplateIPadKey;
  }
  objc_msgSend(v5, "safari_stringForKey:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v8;
}

- (id)_searchURLTemplateStringInDictionary:(id)a3 usingContext:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "deviceType");
  if (v7 > 3
    || (objc_msgSend(v5, "safari_stringForKey:", *off_1E54456E8[v7]),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!objc_msgSend(v6, "isChinaDevice")
      || (objc_msgSend(v5, "safari_stringForKey:", CFSTR("SearchURLTemplateChina")),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v5, "safari_stringForKey:", CFSTR("SearchURLTemplate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (int)_parsecSearchResultTypeInDictionary:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "safari_numberForKey:", CFSTR("ParsecSearchResultType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (unint64_t)_parsecSearchEndpointTypeInDictionary:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "safari_numberForKey:", CFSTR("ParsecSearchEndpointType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (id)_substitutionValuesForTemplateURLUsingContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "countryCode");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E5449658;
  v8 = v7;

  -[NSDictionary objectForKeyedSubscript:](self->_topLevelDomains, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_topLevelDomains, "objectForKeyedSubscript:", &stru_1E5449658);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_1E5449658;
    if (v11)
      v13 = (__CFString *)v11;
    v10 = v13;

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v10, CFSTR("topLevelDomain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateParameterValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v15);

  if (self->_carrierInfo)
  {
    objc_msgSend(v4, "carrierTemplateParameterValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "carrierTemplateParameterValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v17);

    }
  }
  v18 = (void *)objc_msgSend(v14, "copy");

  return v18;
}

- (BOOL)shouldDisplaySearchProviderInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  -[WBSSearchProvider languages](self, "languages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count")
    && (objc_msgSend(v4, "systemLanguage"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "containsObject:", v6),
        v6,
        !v7))
  {
    v11 = 0;
  }
  else
  {
    -[WBSSearchProvider userRegions](self, "userRegions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (!objc_msgSend(v8, "count")
        || (objc_msgSend(v4, "countryCode"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v8, "containsObject:", v9),
            v9,
            v10))
       && (!-[NSString isEqualToString:](self->_shortName, "isEqualToString:", CFSTR("Baidu"))
        || objc_msgSend(v4, "isSearchProviderEnabled:", 0))
       && (!-[NSString isEqualToString:](self->_shortName, "isEqualToString:", CFSTR("Qihoo"))
        || objc_msgSend(v4, "isSearchProviderEnabled:", 2))
       && (!-[NSString isEqualToString:](self->_shortName, "isEqualToString:", CFSTR("Sogou"))
        || objc_msgSend(v4, "isSearchProviderEnabled:", 1))
       && (!-[NSString isEqualToString:](self->_shortName, "isEqualToString:", CFSTR("Yandex"))
        || objc_msgSend(v4, "isSearchProviderEnabled:", 3));

  }
  return v11;
}

- (NSArray)languages
{
  return self->_languages;
}

- (NSArray)userRegions
{
  return self->_userRegions;
}

- (WBSSearchProvider)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *searchEngineIdentifier;
  NSString *v7;
  NSString *shortName;
  WBSOpenSearchURLTemplate *v9;
  WBSOpenSearchURLTemplate *searchURLTemplate;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *safeSearchURLQueryParameters;
  WBSOpenSearchURLTemplate *v16;
  WBSOpenSearchURLTemplate *safeSearchURLTemplate;
  WBSOpenSearchURLTemplate *v18;
  WBSOpenSearchURLTemplate *suggestionsURLTemplate;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *hostSuffixes;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *pathPrefixes;
  NSString *v30;
  NSString *groupIdentifierQueryStringKey;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *v37;
  NSString *queryKey;
  WBSURLSuffixChecker *v39;
  WBSURLSuffixChecker *suffixChecker;
  WBSSearchProvider *v41;
  objc_super v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding")
    && (v43.receiver = self,
        v43.super_class = (Class)WBSSearchProvider,
        (self = -[WBSSearchProvider init](&v43, sel_init)) != 0))
  {
    self->_searchID = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("searchID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchEngineIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    searchEngineIdentifier = self->_searchEngineIdentifier;
    self->_searchEngineIdentifier = v5;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortName"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    shortName = self->_shortName;
    self->_shortName = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchURLTemplate"));
    v9 = (WBSOpenSearchURLTemplate *)objc_claimAutoreleasedReturnValue();
    searchURLTemplate = self->_searchURLTemplate;
    self->_searchURLTemplate = v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v46[0] = objc_opt_class();
    v46[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("safeSearchURLQueryParameters"));
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    safeSearchURLQueryParameters = self->_safeSearchURLQueryParameters;
    self->_safeSearchURLQueryParameters = v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("safeSearchURLTemplate"));
    v16 = (WBSOpenSearchURLTemplate *)objc_claimAutoreleasedReturnValue();
    safeSearchURLTemplate = self->_safeSearchURLTemplate;
    self->_safeSearchURLTemplate = v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionsURLTemplate"));
    v18 = (WBSOpenSearchURLTemplate *)objc_claimAutoreleasedReturnValue();
    suggestionsURLTemplate = self->_suggestionsURLTemplate;
    self->_suggestionsURLTemplate = v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("hostSuffixes"));
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    hostSuffixes = self->_hostSuffixes;
    self->_hostSuffixes = v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("pathPrefixes"));
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    pathPrefixes = self->_pathPrefixes;
    self->_pathPrefixes = v28;

    self->_usesSearchTermsFromFragment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesSearchTermsFromFragment"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifierQueryStringKey"));
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    groupIdentifierQueryStringKey = self->_groupIdentifierQueryStringKey;
    self->_groupIdentifierQueryStringKey = v30;

    v32 = (void *)MEMORY[0x1E0C99E98];
    -[WBSOpenSearchURLTemplate templateString](self->_searchURLTemplate, "templateString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "safari_URLWithUserTypedString:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    self->_usesSecureSearchURL = objc_msgSend(v34, "safari_isSecureURL");

    -[WBSOpenSearchURLTemplate templateString](self->_searchURLTemplate, "templateString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    queryKeyFromSearchTemplate(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (NSString *)objc_msgSend(v36, "copy");
    queryKey = self->_queryKey;
    self->_queryKey = v37;

    v39 = (WBSURLSuffixChecker *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A218]), "initWithSuffixes:", self->_hostSuffixes);
    suffixChecker = self->_suffixChecker;
    self->_suffixChecker = v39;

    self = self;
    v41 = self;
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *shortName;
  WBSOpenSearchURLTemplate *searchURLTemplate;
  WBSOpenSearchURLTemplate *safeSearchURLTemplate;
  void *v7;
  WBSOpenSearchURLTemplate *suggestionsURLTemplate;
  NSArray *hostSuffixes;
  NSArray *pathPrefixes;
  NSDictionary *safeSearchURLQueryParameters;
  NSString *groupIdentifierQueryStringKey;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "allowsKeyedCoding"))
  {
    objc_msgSend(v13, "encodeInteger:forKey:", self->_searchID, CFSTR("searchID"));
    objc_msgSend(v13, "encodeObject:forKey:", self->_searchEngineIdentifier, CFSTR("searchEngineIdentifier"));
    shortName = self->_shortName;
    if (shortName)
      objc_msgSend(v13, "encodeObject:forKey:", shortName, CFSTR("shortName"));
    searchURLTemplate = self->_searchURLTemplate;
    if (searchURLTemplate)
      objc_msgSend(v13, "encodeObject:forKey:", searchURLTemplate, CFSTR("searchURLTemplate"));
    safeSearchURLTemplate = self->_safeSearchURLTemplate;
    v7 = v13;
    if (safeSearchURLTemplate)
    {
      objc_msgSend(v13, "encodeObject:forKey:", safeSearchURLTemplate, CFSTR("safeSearchURLTemplate"));
      v7 = v13;
    }
    suggestionsURLTemplate = self->_suggestionsURLTemplate;
    if (suggestionsURLTemplate)
    {
      objc_msgSend(v13, "encodeObject:forKey:", suggestionsURLTemplate, CFSTR("suggestionsURLTemplate"));
      v7 = v13;
    }
    hostSuffixes = self->_hostSuffixes;
    if (hostSuffixes)
    {
      objc_msgSend(v13, "encodeObject:forKey:", hostSuffixes, CFSTR("hostSuffixes"));
      v7 = v13;
    }
    pathPrefixes = self->_pathPrefixes;
    if (pathPrefixes)
    {
      objc_msgSend(v13, "encodeObject:forKey:", pathPrefixes, CFSTR("pathPrefixes"));
      v7 = v13;
    }
    safeSearchURLQueryParameters = self->_safeSearchURLQueryParameters;
    if (safeSearchURLQueryParameters)
    {
      objc_msgSend(v13, "encodeObject:forKey:", safeSearchURLQueryParameters, CFSTR("safeSearchURLQueryParameters"));
      v7 = v13;
    }
    groupIdentifierQueryStringKey = self->_groupIdentifierQueryStringKey;
    if (groupIdentifierQueryStringKey)
    {
      objc_msgSend(v13, "encodeObject:forKey:", groupIdentifierQueryStringKey, CFSTR("groupIdentifierQueryStringKey"));
      v7 = v13;
    }
    objc_msgSend(v7, "encodeBool:forKey:", self->_usesSearchTermsFromFragment, CFSTR("usesSearchTermsFromFragment"));
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)userVisibleQueryFromSearchURL:(id)a3
{
  return -[WBSSearchProvider userVisibleQueryFromSearchURL:allowQueryThatLooksLikeURL:](self, "userVisibleQueryFromSearchURL:allowQueryThatLooksLikeURL:", a3, 0);
}

+ (id)defaultProviderInUserVisibleProviders:(id)a3 usingSettings:(id)a4 forPrivateBrowsing:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v5)
    v10 = CFSTR("PrivateLocallySelectedBuiltInProviderShortName");
  else
    v10 = CFSTR("LocallySelectedBuiltInProviderShortName");
  objc_msgSend(v8, "safari_stringForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v12);
        if (!v15)
        {
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v18, "shortName", (_QWORD)v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "isEqualToString:", v19);

          if (v20)
            v15 = v18;
          else
            v15 = 0;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  v21 = v15;
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    objc_msgSend(v12, "firstObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  return v24;
}

+ (id)userVisibleProvidersInAllProviders:(id)a3 usingContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "shouldDisplaySearchProviderInContext:", v6, (_QWORD)v20))
        {
          objc_msgSend(v14, "shortName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(v14, "shortName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v17);

            objc_msgSend(v7, "addObject:", v14);
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(v7, "copy");
  return v18;
}

uint64_t __70__WBSSearchProvider_sortedSearchProvidersInArray_usingShortNameOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "shortName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "shortName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 < v11)
    return -1;
  else
    return 1;
}

- (NSString)shortName
{
  return self->_shortName;
}

+ (id)sortedSearchProvidersInArray:(id)a3 usingShortNameOrder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__WBSSearchProvider_sortedSearchProvidersInArray_usingShortNameOrder___block_invoke;
  v9[3] = &unk_1E5445678;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecSearchSuggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_parsecSearchIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifierQueryStringKey, 0);
  objc_storeStrong((id *)&self->_scriptName, 0);
  objc_storeStrong((id *)&self->_topLevelDomains, 0);
  objc_storeStrong((id *)&self->_userRegions, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_homepageURLs, 0);
  objc_storeStrong((id *)&self->_carrierInfo, 0);
  objc_storeStrong((id *)&self->_pathPrefixes, 0);
  objc_storeStrong((id *)&self->_hostSuffixes, 0);
  objc_storeStrong((id *)&self->_suggestionsURLTemplate, 0);
  objc_storeStrong((id *)&self->_safeSearchURLQueryParameters, 0);
  objc_storeStrong((id *)&self->_safeSearchURLTemplate, 0);
  objc_storeStrong((id *)&self->_searchURLTemplate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_searchEngineIdentifier, 0);
  objc_storeStrong((id *)&self->_queryKey, 0);
  objc_storeStrong((id *)&self->_suffixChecker, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSearchProvider shortName](self, "shortName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = \"%@\"; scriptingName = \"%@\">"),
    v5,
    self,
    v6,
    self->_scriptName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)safeSearchURLForSearchURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSDictionary *safeSearchURLQueryParameters;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  id obj;
  WBSSearchProvider *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = self;
  if (-[NSDictionary count](self->_safeSearchURLQueryParameters, "count"))
  {
    v23 = v4;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queryItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v26->_safeSearchURLQueryParameters, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v11, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if ((v15 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v12, v13);
              v16 = objc_claimAutoreleasedReturnValue();

              *((_BYTE *)v36 + 24) = 1;
              v11 = (id)v16;
            }
          }
          objc_msgSend(v7, "addObject:", v12);
          objc_msgSend(v6, "addObject:", v11);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v8);
    }

    safeSearchURLQueryParameters = v26->_safeSearchURLQueryParameters;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __47__WBSSearchProvider_safeSearchURLForSearchURL___block_invoke;
    v27[3] = &unk_1E54456A0;
    v18 = v7;
    v28 = v18;
    v30 = &v35;
    v19 = v6;
    v29 = v19;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](safeSearchURLQueryParameters, "enumerateKeysAndObjectsUsingBlock:", v27);
    if (*((_BYTE *)v36 + 24))
    {
      objc_msgSend(v24, "setQueryItems:", v19);
      objc_msgSend(v24, "URL");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = v23;
    }
    v21 = v20;

    _Block_object_dispose(&v35, 8);
    v4 = v23;
  }
  else
  {
    v21 = v4;
  }

  return v21;
}

void __47__WBSSearchProvider_safeSearchURLForSearchURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (BOOL)searchShouldUseSafeSearchTemplate
{
  return 0;
}

- (id)searchURLForUserTypedString:(id)a3
{
  id v4;
  WBSOpenSearchURLTemplate *v5;
  WBSOpenSearchURLTemplate *v6;
  void *v7;

  v4 = a3;
  v5 = self->_searchURLTemplate;
  if (self->_safeSearchURLTemplate
    && -[WBSSearchProvider searchShouldUseSafeSearchTemplate](self, "searchShouldUseSafeSearchTemplate"))
  {
    v6 = self->_safeSearchURLTemplate;

    v5 = v6;
  }
  -[WBSOpenSearchURLTemplate URLWithSearchTerms:](v5, "URLWithSearchTerms:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)suggestionsURLForUserTypedString:(id)a3
{
  return (id)-[WBSOpenSearchURLTemplate URLWithSearchTerms:](self->_suggestionsURLTemplate, "URLWithSearchTerms:", a3);
}

- (BOOL)urlIsHomepage:(id)a3
{
  return -[WBSSearchProvider urlIsHomepage:shouldUseCanonicalRepresentation:](self, "urlIsHomepage:shouldUseCanonicalRepresentation:", a3, 0);
}

- (BOOL)urlIsHomepage:(id)a3 shouldUseCanonicalRepresentation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_canonicalURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safari_originalDataAsString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v9, "length"))
      {
        v10 = 0;
        v6 = v9;
        goto LABEL_8;
      }
      v6 = v9;
    }
    v10 = -[NSSet containsObject:](self->_homepageURLs, "containsObject:", v6);
  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (id)_urlByEnsuringQueryItemInURL:(id)a3 percentEncodedQueryItemKey:(id)a4 percentEncodedQueryItemValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *, uint64_t);
  void *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "percentEncodedQueryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__17;
  v31 = __Block_byref_object_dispose__17;
  v32 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __106__WBSSearchProvider__urlByEnsuringQueryItemInURL_percentEncodedQueryItemKey_percentEncodedQueryItemValue___block_invoke;
  v22 = &unk_1E54456C8;
  v12 = v8;
  v23 = v12;
  v25 = &v27;
  v26 = &v33;
  v13 = v9;
  v24 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v19);
  if (*((_BYTE *)v34 + 24) && objc_msgSend((id)v28[5], "count", v19, v20, v21, v22, v23) == 1)
  {
    v14 = v7;
  }
  else
  {
    if (v11)
    {
      v15 = objc_msgSend(v11, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v12, v13);
    if (v28[5])
    {
      objc_msgSend(v16, "removeObjectsAtIndexes:");
      objc_msgSend(v16, "insertObject:atIndex:", v17, objc_msgSend((id)v28[5], "firstIndex"));
    }
    else
    {
      objc_msgSend(v16, "addObject:", v17);
    }
    objc_msgSend(v10, "setPercentEncodedQueryItems:", v16, v19, v20, v21, v22);
    objc_msgSend(v10, "URL");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v14;
}

void __106__WBSSearchProvider__urlByEnsuringQueryItemInURL_percentEncodedQueryItemKey_percentEncodedQueryItemValue___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;

  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isEqualToString:", a1[4]))
  {
    v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v9)
    {
      objc_msgSend(v9, "addIndex:", a3);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", a3);
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    v13 = *(_QWORD *)(a1[7] + 8);
    if (*(_BYTE *)(v13 + 24))
    {
      v14 = 1;
    }
    else
    {
      v14 = objc_msgSend(v8, "isEqualToString:", a1[5]);
      v13 = *(_QWORD *)(a1[7] + 8);
    }
    *(_BYTE *)(v13 + 24) = v14;
  }

}

- (id)urlAttributingToSafariIfValidSearchURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  if ((objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) != 0)
  {
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("www."));

    if ((v7 & 1) != 0 && (-[WBSURLSuffixChecker hasSuffix:](self->_suffixChecker, "hasSuffix:", v5) & 1) != 0)
    {
      -[WBSSearchProvider _urlByEnsuringQueryItemInURL:percentEncodedQueryItemKey:percentEncodedQueryItemValue:](self, "_urlByEnsuringQueryItemInURL:percentEncodedQueryItemKey:percentEncodedQueryItemValue:", v4, CFSTR("client"), CFSTR("safari"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v4;
    }
    v9 = v8;

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (id)urlByIncorporatingGroupIdentifier:(unint64_t)a3 ifIsValidSearchResultsURL:(id)a4
{
  id v6;
  NSString *groupIdentifierQueryStringKey;
  void *v8;
  id v9;

  v6 = a4;
  if (self->_groupIdentifierQueryStringKey && -[WBSSearchProvider urlIsValidSearch:](self, "urlIsValidSearch:", v6))
  {
    groupIdentifierQueryStringKey = self->_groupIdentifierQueryStringKey;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSearchProvider _urlByEnsuringQueryItemInURL:percentEncodedQueryItemKey:percentEncodedQueryItemValue:](self, "_urlByEnsuringQueryItemInURL:percentEncodedQueryItemKey:percentEncodedQueryItemValue:", v6, groupIdentifierQueryStringKey, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (int64_t)searchID
{
  return self->_searchID;
}

- (NSString)searchEngineIdentifier
{
  return self->_searchEngineIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (WBSOpenSearchURLTemplate)searchURLTemplate
{
  return self->_searchURLTemplate;
}

- (WBSOpenSearchURLTemplate)safeSearchURLTemplate
{
  return self->_safeSearchURLTemplate;
}

- (NSDictionary)safeSearchURLQueryParameters
{
  return self->_safeSearchURLQueryParameters;
}

- (WBSOpenSearchURLTemplate)suggestionsURLTemplate
{
  return self->_suggestionsURLTemplate;
}

- (NSArray)hostSuffixes
{
  return self->_hostSuffixes;
}

- (NSArray)pathPrefixes
{
  return self->_pathPrefixes;
}

- (NSString)carrierInfo
{
  return self->_carrierInfo;
}

- (NSSet)homepageURLs
{
  return self->_homepageURLs;
}

- (NSDictionary)topLevelDomains
{
  return self->_topLevelDomains;
}

- (NSString)scriptName
{
  return self->_scriptName;
}

- (BOOL)usesSearchTermsFromFragment
{
  return self->_usesSearchTermsFromFragment;
}

- (BOOL)usesSecureSearchURL
{
  return self->_usesSecureSearchURL;
}

- (NSString)groupIdentifierQueryStringKey
{
  return self->_groupIdentifierQueryStringKey;
}

- (NSString)parsecSearchIdentifier
{
  return self->_parsecSearchIdentifier;
}

- (NSString)parsecSearchSuggestionIdentifier
{
  return self->_parsecSearchSuggestionIdentifier;
}

- (unint64_t)parsecSearchEndpointType
{
  return self->_parsecSearchEndpointType;
}

- (int)parsecSearchResultType
{
  return self->_parsecSearchResultType;
}

@end

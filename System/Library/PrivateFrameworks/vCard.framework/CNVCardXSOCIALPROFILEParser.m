@implementation CNVCardXSOCIALPROFILEParser

+ (id)os_log
{
  if (os_log_cn_once_token_1_0 != -1)
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_4);
  return (id)os_log_cn_once_object_1_0;
}

void __37__CNVCardXSOCIALPROFILEParser_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.vcard", "socialprofile");
  v1 = (void *)os_log_cn_once_object_1_0;
  os_log_cn_once_object_1_0 = (uint64_t)v0;

}

+ (id)valueWithParser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "unparsedStringForCurrentProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unfold:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "propertyLooksLikeDOSAttackString:", v5) & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(a1, "typeForSocialProperty:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "urlSuffixForSocialProperty:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "second");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "profileFromURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "first");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "parametersForSocialProperty:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "adjust:withParameters:", v11, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "second");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleSpecialCaseUpdateForService:socialProfile:", v14, v11);

  }
  return v6;
}

+ (id)profileFromURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13B80], "parseSocialProfileURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v5, CFSTR("urlString"));

  objc_msgSend(v3, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v6, CFSTR("username"));

  objc_msgSend(v3, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v7, CFSTR("userIdentifier"));

  objc_msgSend(v3, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v8, CFSTR("service"));

  objc_msgSend(v3, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_setNonNilObject:forKey:", v9, CFSTR("displayname"));

  return v4;
}

+ (void)processExtensionValuesForLines:(id)a3 parser:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v21 = *(_QWORD *)v23;
    v9 = *MEMORY[0x1E0D13848];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v21)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "grouping");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstValueForKey:inExtensionGroup:", CFSTR("X-USERID"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "grouping");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstValueForKey:inExtensionGroup:", CFSTR("X-USER"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "grouping");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstValueForKey:inExtensionGroup:", CFSTR("X-DISPLAYNAME"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!(*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v13)
          || !(*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v15)
          || ((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v17) & 1) == 0)
        {
          objc_msgSend(v11, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "_cn_setNonNilObject:forKey:", v13, CFSTR("userIdentifier"));
          objc_msgSend(v19, "_cn_setNonNilObject:forKey:", v15, CFSTR("username"));
          objc_msgSend(v19, "_cn_setNonNilObject:forKey:", v17, CFSTR("displayname"));
          objc_msgSend(v11, "setValue:", v19);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

}

+ (id)urlSuffixForSocialProperty:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(X-SOCIALPROFILE[;:].*?)[:]*(http[s]*:.*?)$"),
    17,
    &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v3;
      v27 = 2114;
      v28 = v5;
      v9 = "Error: could not extract url suffix from %@: error %{public}@";
      v10 = v8;
      v11 = 22;
LABEL_4:
      _os_log_impl(&dword_1D3C07000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_5;
    }
    goto LABEL_5;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(X-SOCIALPROFILE[;:].*?)[:]*(x-apple:.*?)$"),
      17,
      &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v23;
    objc_msgSend(v20, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v3;
        v27 = 2114;
        v28 = v5;
        _os_log_impl(&dword_1D3C07000, v22, OS_LOG_TYPE_DEFAULT, "Error: could not extract url suffix from %@: error %{public}@", buf, 0x16u);
      }

    }
    else if (objc_msgSend(v21, "count"))
    {

      v7 = v21;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v21;
    goto LABEL_6;
  }
LABEL_8:
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfRanges") == 3)
  {
    v14 = objc_msgSend(v5, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v5, "rangeAtIndex:", 2);
    objc_msgSend(v3, "substringWithRange:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v16, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v3;
    v9 = "Error: could not extract url from %@: too few matched ranges";
    v10 = v8;
    v11 = 12;
    goto LABEL_4;
  }
LABEL_5:

  objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v12;
}

+ (id)typeForSocialProperty:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(X-SOCIALPROFILE[;:].*?)type=(\\w+)[:;](.*$)"),
    17,
    &v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v23;
  objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v3;
      v26 = 2114;
      v27 = v5;
      _os_log_impl(&dword_1D3C07000, v8, OS_LOG_TYPE_DEFAULT, "Error: could not extract type from %@: error %{public}@", buf, 0x16u);
    }

    goto LABEL_5;
  }
  if (!objc_msgSend(v6, "count"))
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "numberOfRanges") == 4)
  {
    v11 = objc_msgSend(v10, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "rangeAtIndex:", 2);
    objc_msgSend(v3, "substringWithRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "rangeAtIndex:", 3);
    objc_msgSend(v3, "substringWithRange:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v20, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl(&dword_1D3C07000, v21, OS_LOG_TYPE_DEFAULT, "Error: could not extract type from %@: too few matched ranges", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  return v9;
}

+ (void)handleSpecialCaseUpdateForService:(id)a3 socialProfile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("service"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((CNSocialProfileIsStandardServiceName() & 1) == 0)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("service"));

    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("service"));
    }
  }

}

+ (void)handleBundleIndentifiersAsList:(id)a3 socialProfile:(id)a4
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a4;
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bundleIdentifiers"));

  }
}

+ (id)adjust:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RAW"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1D3C07000, v9, OS_LOG_TYPE_DEFAULT, "Warning: falling back to extracting social profile from %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(a1, "profileFromURL:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v10);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("X-USER"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("username"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("X-DISPLAYNAME"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("displayname"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("X-USERID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("userIdentifier"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("X-BUNDLEIDENTIFIERS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "handleBundleIndentifiersAsList:socialProfile:", v14, v6);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("X-TEAMIDENTIFIER"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("teamIdentifier"));

  return v6;
}

+ (id)parametersForSocialProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a3;
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(X-SOCIALPROFILE[;:].*)(x-\\w+)=(.*?)[;]*$"),
    17,
    &v34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v34;
  objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(a1, "rawForSocialProperty:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (id)v10;
    goto LABEL_14;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "numberOfRanges") == 4)
  {
    v13 = objc_msgSend(v12, "rangeAtIndex:", 1);
    objc_msgSend(v4, "substringWithRange:", v13, v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "parametersForSocialProperty:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "rangeAtIndex:", 2);
    objc_msgSend(v4, "substringWithRange:", v15, v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uppercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v12, "rangeAtIndex:", 3);
    objc_msgSend(v4, "substringWithRange:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "unwrapDoubleQuotedProperty:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNVCardParameterDecoder decodeParameterValue:](CNVCardParameterDecoder, "decodeParameterValue:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v22, v17);
    v11 = v31;

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:].cold.1((uint64_t)v4, v23, v24, v25, v26, v27, v28, v29);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v11;
}

+ (id)rawForSocialProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v27;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(X-SOCIALPROFILE[;:])(.*?)[;]*$"),
    17,
    &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:].cold.2();

    goto LABEL_5;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_5:
    v11 = v5;
    goto LABEL_15;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "numberOfRanges") == 3)
  {
    v13 = objc_msgSend(v12, "rangeAtIndex:", 2);
    objc_msgSend(v4, "substringWithRange:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(a1, "unwrapDoubleQuotedProperty:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("RAW"));

    }
    v17 = v5;

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[CNVCardXSOCIALPROFILEParser parametersForSocialProperty:].cold.1((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);

    v25 = v5;
  }

LABEL_15:
  return v5;
}

+ (id)unwrapDoubleQuotedProperty:(id)a3
{
  __CFString *v3;
  const __CFString *v4;

  v3 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("\")) & 1) != 0
    || (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("\"\")) & 1) != 0)
  {
    v4 = &stru_1E95708D8;
LABEL_4:

    v3 = (__CFString *)v4;
    return v3;
  }
  if (-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("\"))
    && -[__CFString hasSuffix:](v3, "hasSuffix:", CFSTR("\")))
  {
    -[__CFString substringWithRange:](v3, "substringWithRange:", 1, -[__CFString length](v3, "length") - 2);
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  return v3;
}

+ (id)unfold:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r\n "), &stru_1E95708D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r\nt"), &stru_1E95708D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)propertyLooksLikeDOSAttackString:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "length") > 0x1046;
}

+ (void)parametersForSocialProperty:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D3C07000, a2, a3, "Error: could not extract parameters from %@: too few matched ranges", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)parametersForSocialProperty:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3C07000, v0, v1, "Error: could not extract parameters from %@: error %@");
  OUTLINED_FUNCTION_4();
}

@end

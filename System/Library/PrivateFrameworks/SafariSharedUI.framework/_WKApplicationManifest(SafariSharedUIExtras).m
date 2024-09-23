@implementation _WKApplicationManifest(SafariSharedUIExtras)

+ (id)safari_manifestWithName:()SafariSharedUIExtras URL:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  objc_msgSend(v6, "safari_originalDataAsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("start_url"));

  v10 = (void *)MEMORY[0x1E0CEF688];
  objc_msgSend(v8, "safari_jsonRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationManifestFromJSON:manifestURL:documentURL:", v11, 0, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)safari_manifestWithInfoDictionary:()SafariSharedUIExtras
{
  return objc_msgSend(a1, "_manifestWithInfoDictionary:withSynthesizedProperties:", a3, 1);
}

+ (id)_manifestWithInfoDictionary:()SafariSharedUIExtras withSynthesizedProperties:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;

  v5 = a3;
  objc_msgSend(v5, "safari_dictionaryForKey:", CFSTR("Manifest"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("start_url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    if (a4)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("display"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("fullscreen")) & 1) != 0)
      {
        v12 = 3;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("standalone")) & 1) != 0)
      {
        v12 = 2;
      }
      else
      {
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("minimal-ui"));
      }

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = resolvedDisplayModeForURL(v12, v13);

      if (v14 > 3)
        v15 = 0;
      else
        v15 = off_1E54490F0[v14 - 1];
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("display"));
    }

  }
  else
  {
    v9 = 0;
  }

  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WKManifestURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("start_url"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && objc_msgSend(v5, "safari_BOOLForKey:", CFSTR("WKManifestIsSynthesized")))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("scope"));
  v22 = (void *)MEMORY[0x1E0CEF688];
  objc_msgSend(v9, "safari_jsonRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "applicationManifestFromJSON:manifestURL:documentURL:", v23, v18, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v25 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[_WKApplicationManifest(SafariSharedUIExtras) _manifestWithInfoDictionary:withSynthesizedProperties:].cold.1(v25);
  }
  objc_msgSend(v5, "safari_stringForKey:", CFSTR("WKManifestIconKind"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safari_setIconKind:", v26);

  return v24;
}

- (id)safari_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "rawJSON");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_WKApplicationManifest(SafariSharedUIExtras) safari_dictionaryRepresentation].cold.1(v7, v5);
  }

  if (!v6)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_quirkedNameFrom:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

  objc_getAssociatedObject(a1, (const void *)safariNameKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("short_name"));
  }
  else
  {
    objc_msgSend(a1, "shortName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_safari_quirkedNameFrom:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("short_name"));

  }
  objc_msgSend(a1, "safari_startURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safari_originalDataAsString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("start_url"));

  objc_msgSend(v6, "safari_dictionaryByRemovingNullObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  return v16;
}

- (uint64_t)safari_respectsHasOpener
{
  void *v1;
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "startURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", CFSTR("pinterest."));

  return v4 ^ 1u;
}

- (BOOL)safari_isStandalone
{
  void *v2;
  char v3;

  objc_msgSend(a1, "startURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_isEligibleToShowNotSecureWarning");

  return (v3 & 1) == 0 && (objc_msgSend(a1, "safari_displayMode") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)safari_applicationCategoryType
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "categories");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  +[_WBSWKApplicationManifestExtrasUtilities applicationCategoryTypeForCategories:](_WBSWKApplicationManifestExtrasUtilities, "applicationCategoryTypeForCategories:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)safari_enforcedStartURLPrefix
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "safari_scope");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("/"));

  if (v4)
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("/"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_safari_quirkedNameFrom:()SafariSharedUIExtras
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("webhp"))
    && (objc_msgSend(a1, "startURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "safari_hasCaseInsensitivePrefix:", CFSTR("google.")),
        v6,
        v5,
        (v7 & 1) != 0)
    || (objc_msgSend(&unk_1E547C3D8, "containsObject:", v4) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (uint64_t)safari_displayMode
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "displayMode");
  objc_msgSend(a1, "safari_scope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = resolvedDisplayModeForURL(v2, v3);

  return v4;
}

- (id)safari_name
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_getAssociatedObject(a1, (const void *)safariNameKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "shortName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_safari_quirkedNameFrom:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      v3 = v5;
    }
    else
    {
      objc_msgSend(a1, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_safari_quirkedNameFrom:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
        v3 = v7;
      else
        v3 = 0;

    }
  }

  return v3;
}

- (void)safari_setName:()SafariSharedUIExtras
{
  void *v4;
  char v5;
  id value;

  value = a3;
  objc_msgSend(a1, "safari_name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(value, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
    objc_setAssociatedObject(a1, (const void *)safariNameKey, value, (void *)1);

}

- (id)safari_images
{
  return objc_getAssociatedObject(a1, (const void *)safariImagesKey);
}

- (void)safari_setStartURL:()SafariSharedUIExtras
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id value;

  value = a3;
  objc_msgSend(value, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "safari_startURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    objc_setAssociatedObject(a1, (const void *)safariStartURLKey, value, (void *)1);

}

- (id)safari_startURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_getAssociatedObject(a1, (const void *)safariStartURLKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "startURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)safari_setImages:()SafariSharedUIExtras
{
  objc_setAssociatedObject(a1, (const void *)safariImagesKey, a3, (void *)1);
}

- (void)safari_setIconKind:()SafariSharedUIExtras
{
  objc_setAssociatedObject(a1, (const void *)safariIconKindKey, a3, (void *)1);
}

- (id)safari_iconKind
{
  return objc_getAssociatedObject(a1, (const void *)safariIconKindKey);
}

- (id)safari_scope
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(a1, "isDefaultScope") & 1) != 0)
  {
    objc_getAssociatedObject(a1, (const void *)safariScopeKey);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "scope");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;
  if (!v2)
  {
    objc_msgSend(a1, "startURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_originalDataAsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v6, "count") <= 3)
      v7 = objc_msgSend(v6, "count");
    else
      v7 = 3;
    objc_msgSend(v6, "subarrayWithRange:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, (const void *)safariScopeKey, v3, (void *)1);

  }
  return v3;
}

+ (void)_manifestWithInfoDictionary:()SafariSharedUIExtras withSynthesizedProperties:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Unable to read manifest.", v1, 2u);
}

- (void)safari_dictionaryRepresentation
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Unable to serialize manifest with %{public}@", (uint8_t *)&v5, 0xCu);

}

@end

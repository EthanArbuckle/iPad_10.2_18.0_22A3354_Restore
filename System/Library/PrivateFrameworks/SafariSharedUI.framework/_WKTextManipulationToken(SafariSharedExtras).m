@implementation _WKTextManipulationToken(SafariSharedExtras)

+ (id)safari_tokenWithTranslationAlignmentRepresentation:()SafariSharedExtras
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (get_LTAlignmentClass())
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEF6F8]);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);

    objc_msgSend(v3, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContent:", v6);

    objc_msgSend(v4, "setExcluded:", objc_msgSend(v3, "shouldTranslate") ^ 1);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)safari_translationRangeRepresentation
{
  id v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc(get_LTTranslationRangeClass());
  objc_msgSend(a1, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E5449658;
  if (v3)
    v6 = (const __CFString *)v3;
  else
    v6 = &stru_1E5449658;
  objc_msgSend(a1, "content");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v5 = (const __CFString *)v7;
  v9 = (void *)objc_msgSend(v2, "initWithIdentifier:text:shouldTranslate:", v6, v5, objc_msgSend(a1, "isExcluded") ^ 1);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "safari_privacyPreservingMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMetaInfo:", v10);

  }
  return v9;
}

- (uint64_t)safari_isEqualToManipulationToken:()SafariSharedExtras includingContentEquality:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(a1, "isEqualToTextManipulationToken:includingContentEquality:", v6, a4);
  }
  else if (v6)
  {
    objc_msgSend(a1, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WBSIsEqual();

    LODWORD(v8) = objc_msgSend(a1, "isExcluded");
    v11 = v8 ^ objc_msgSend(v6, "isExcluded");
    if ((_DWORD)a4)
    {
      objc_msgSend(a1, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = WBSIsEqual();

    }
    else
    {
      v14 = 1;
    }
    v7 = v10 & ~v11 & v14;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)safari_debugDescription
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "debugDescription");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_safari_descriptionPreservingPrivacy:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)safari_privacyPreservingDescription
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "description");
  else
    objc_msgSend(a1, "_safari_descriptionPreservingPrivacy:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_safari_descriptionPreservingPrivacy:()SafariSharedExtras
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = objc_opt_class();
  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; isExcluded = %i"),
    v6,
    a1,
    v7,
    objc_msgSend(a1, "isExcluded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
    objc_msgSend(v8, "appendFormat:", CFSTR("; content length = %lu"), objc_msgSend(v9, "length"));
  else
    objc_msgSend(v8, "appendFormat:", CFSTR("; content = %@"), v9);

  objc_msgSend(v8, "appendString:", CFSTR(">"));
  v11 = (void *)objc_msgSend(v8, "copy");

  return v11;
}

- (id)safari_privacyPreservingMetadata
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return MEMORY[0x1E0C9AA70];
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("_WKTextManipulationTokenUserInfoTagNameKey");
  v12[1] = CFSTR("_WKTextManipulationTokenUserInfoRoleAttributeKey");
  v13[0] = CFSTR("tagName");
  v13[1] = CFSTR("roleAttribute");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80___WKTextManipulationToken_SafariSharedExtras__safari_privacyPreservingMetadata__block_invoke;
  v9[3] = &unk_1E5449390;
  v10 = v2;
  v11 = v4;
  v5 = v4;
  v6 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (id)safari_dictionaryRepresentation
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v16[0] = CFSTR("identifier");
  objc_msgSend(a1, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E5449658;
  v17[0] = v5;
  v16[1] = CFSTR("shouldTranslate");
  v6 = objc_msgSend(a1, "isExcluded");
  v7 = MEMORY[0x1E0C9AAB0];
  if (v6)
    v7 = MEMORY[0x1E0C9AAA0];
  v17[1] = v7;
  v16[2] = CFSTR("text");
  objc_msgSend(a1, "content");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E5449658;
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "safari_privacyPreservingMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("metadata"));
  v14 = (void *)objc_msgSend(v12, "copy");

  return v14;
}

- (__CFString)safari_jsonRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  __CFString *v6;
  NSObject *v7;
  id v9;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a1, "safari_dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v4)
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_WKTextManipulationItem(SafariSharedExtras) safari_jsonRepresentation].cold.1(v7, a1);
    v6 = &stru_1E5449658;
  }

  return v6;
}

@end

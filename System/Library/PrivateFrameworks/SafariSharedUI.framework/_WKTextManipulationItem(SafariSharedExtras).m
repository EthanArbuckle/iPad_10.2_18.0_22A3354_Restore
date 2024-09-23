@implementation _WKTextManipulationItem(SafariSharedExtras)

+ (id)safari_textManipulationItemWithTranslationResult:()SafariSharedExtras
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "alignments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_70);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0CEF6F0]);
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithIdentifier:tokens:", v7, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)safari_updateTranslationRequest:()SafariSharedExtras
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUniqueID:", v4);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "tokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79___WKTextManipulationItem_SafariSharedExtras__safari_updateTranslationRequest___block_invoke;
    v8[3] = &unk_1E54492A0;
    v8[4] = a1;
    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setRanges:", v6);
  }

}

- (uint64_t)safari_isEqualToManipulationItem:()SafariSharedExtras includingContentEquality:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(a1, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
      {
        objc_msgSend(a1, "tokens");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        objc_msgSend(v6, "tokens");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v11 == v13)
        {
          v19 = 0;
          v20 = &v19;
          v21 = 0x2020000000;
          v22 = 1;
          objc_msgSend(a1, "tokens");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "tokens");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __105___WKTextManipulationItem_SafariSharedExtras__safari_isEqualToManipulationItem_includingContentEquality___block_invoke;
          v17[3] = &unk_1E54492C8;
          v18 = a4;
          v17[4] = &v19;
          objc_msgSend(v14, "safari_enumerateZippedValuesWithArray:withBlock:", v15, v17);

          v7 = *((_BYTE *)v20 + 24) != 0;
          _Block_object_dispose(&v19, 8);
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    v7 = 0;
    goto LABEL_9;
  }
  v7 = objc_msgSend(a1, "isEqualToTextManipulationItem:includingContentEquality:", v6, a4);
LABEL_9:

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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  char v17;

  objc_msgSend(a1, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84___WKTextManipulationItem_SafariSharedExtras___safari_descriptionPreservingPrivacy___block_invoke;
  v16[3] = &__block_descriptor_33_e44___NSString_16__0___WKTextManipulationToken_8l;
  v17 = a3;
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[\n\t%@\n]"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37A0];
  v11 = objc_opt_class();
  objc_msgSend(a1, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@ tokens = %@>"), v11, a1, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v13, "copy");
  return v14;
}

- (id)safari_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "tokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_33_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E5449658;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("paragraphIdentifier"));

  if (v3)
    v8 = v3;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("tokens"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E0D8A6B8]);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isSubframe"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("isInSubframe"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isCrossSiteSubframe"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("isInCrossSiteSubframe"));

  }
  return v4;
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

- (void)safari_jsonRepresentation
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_opt_class();
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to generate JSON version of %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end

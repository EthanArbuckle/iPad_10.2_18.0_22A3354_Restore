@implementation PLSearchSuggestionCandidate

- (PLSearchSuggestionCandidate)initWithSearchSuggestionTemplate:(id)a3 firstGroup:(id)a4 secondGroup:(id)a5 assetIdsForDateFilter:(__CFArray *)a6 minAssetResultCountPerSuggestion:(unint64_t)a7 styleType:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  const char *v19;
  PLSearchSuggestionCandidate *v20;
  PLSearchSuggestionCandidate *v21;
  PLSearchSuggestionCandidate *v22;
  objc_super v24;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (a8 == 1)
  {
    if (!v15 || !v16)
    {
      PLSearchBackendInitialSuggestionsGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "Nil template and/or group provided for candidate initializer in non tier 0 locale, unable to initialize candidate";
        goto LABEL_16;
      }
LABEL_17:

      v22 = 0;
      goto LABEL_18;
    }
  }
  else if (!a8 && !v15)
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Nil template provided for candidate initializer in tier 0 locale, unable to initialize candidate";
LABEL_16:
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v24.receiver = self;
  v24.super_class = (Class)PLSearchSuggestionCandidate;
  v20 = -[PLSearchSuggestionCandidate init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_firstGroup, a4);
    objc_storeStrong((id *)&v21->_suggestionTemplate, a3);
    if (!a8)
    {
      objc_storeStrong((id *)&v21->_secondGroup, a5);
      if (a6)
        v21->_assetIdsForDateFilter = (__CFArray *)CFRetain(a6);
    }
    v21->_minAssetResultCountPerSuggestion = a7;
    v21->_rankingScore = 9.2234e18;
    v21->_intersectionCount = 0x7FFFFFFFFFFFFFFFLL;
    v21->_styleType = a8;
  }
  self = v21;
  v22 = self;
LABEL_18:

  return v22;
}

- (unint64_t)intersectionCount
{
  unint64_t result;
  void *v4;
  const __CFArray *v5;
  void *v6;
  uint64_t v7;
  __CFArray *v8;
  CFArrayRef Copy;
  CFArrayRef v10;
  _BOOL4 v11;
  CFTypeRef v12;
  CFTypeRef cf;

  result = self->_intersectionCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const __CFArray *)objc_msgSend(v4, "groupAssetIds");

    -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "groupAssetIds");

    v8 = -[PLSearchSuggestionCandidate assetIdsForDateFilter](self, "assetIdsForDateFilter");
    cf = 0;
    if (-[PLSearchSuggestionCandidate hasFirstCategory](self, "hasFirstCategory")
      && -[PLSearchSuggestionCandidate hasSecondCategory](self, "hasSecondCategory"))
    {
      Copy = 0;
      if (v5)
        Copy = CFArrayCreateCopy(0, v5);
      cf = Copy;
      +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &cf, v7, 500);
    }
    else if (-[PLSearchSuggestionCandidate hasFirstCategory](self, "hasFirstCategory"))
    {
      v10 = 0;
      if (v5)
        v10 = CFArrayCreateCopy(0, v5);
      cf = v10;
    }
    v11 = -[PLSearchSuggestionCandidate hasDateFilter](self, "hasDateFilter");
    result = (unint64_t)cf;
    if (v11)
    {
      if (cf)
      {
        +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &cf, v8, 500);
        result = (unint64_t)cf;
        goto LABEL_18;
      }
      if (v8)
      {
        result = (unint64_t)v8;
LABEL_18:
        result = CFArrayGetCount((CFArrayRef)result);
        v12 = cf;
        self->_intersectionCount = result;
        if (v12)
        {
          CFRelease(v12);
          return self->_intersectionCount;
        }
        return result;
      }
      result = 0;
    }
    else if (cf)
    {
      goto LABEL_18;
    }
    self->_intersectionCount = 0;
  }
  return result;
}

- (float)rankingScore
{
  float result;
  float v4;
  unint64_t v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  void *v15;
  char v16;
  double v17;

  result = self->_rankingScore;
  if (result == 9.2234e18)
  {
    v4 = (float)-[PLSearchSuggestionCandidate intersectionCount](self, "intersectionCount");
    v5 = -[PLSearchSuggestionCandidate minAssetResultCountPerSuggestion](self, "minAssetResultCountPerSuggestion");
    v6 = 1.0;
    if (v4 < (float)v5)
    {
      if (v5)
        v6 = (float)(v4 / (float)v5);
      else
        v6 = 0.0;
    }
    if (-[PLSearchSuggestionCandidate hasFirstCategory](self, "hasFirstCategory")
      && -[PLSearchSuggestionCandidate hasSecondCategory](self, "hasSecondCategory"))
    {
      -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rankingScore");
      v9 = v8 * 0.25 + v6 * 0.5;
      -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rankingScore");
      v12 = v9 + v11 * 0.25;
      self->_rankingScore = v12;

    }
    else
    {
      if (!-[PLSearchSuggestionCandidate hasFirstCategory](self, "hasFirstCategory"))
        goto LABEL_12;
      -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rankingScore");
      v14 = v13 * 0.5 + v6 * 0.5;
      self->_rankingScore = v14;
    }

LABEL_12:
    -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isDateOnlyTemplate");

    if ((v16 & 1) != 0)
    {
      +[PLScopedSearchSuggestionGeneration initialSuggestionScoreForIndexCategory:](PLScopedSearchSuggestionGeneration, "initialSuggestionScoreForIndexCategory:", 1102);
      result = v17;
      self->_rankingScore = result;
    }
    else
    {
      return self->_rankingScore;
    }
  }
  return result;
}

- (id)populatedTemplateQueryString
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v39;
  NSObject *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayString");
  v4 = objc_claimAutoreleasedReturnValue();

  -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayString");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = -[PLSearchSuggestionCandidate styleType](self, "styleType");
  v8 = CFSTR("SINGLE_ENTITY_KEY");
  if (v7 != 1)
    v8 = 0;
  v9 = v8;
  -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionTemplateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != 1 && !objc_msgSend(v12, "length"))
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "suggestionTemplateKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v27;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to locate template for key: %@.", buf, 0xCu);

LABEL_22:
    }
LABEL_23:
    v18 = 0;
    goto LABEL_48;
  }
  -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isDateOnlyTemplate");

  -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "isMeTemplate");

  if (v7 != 1)
  {
    if (-[PLSearchSuggestionCandidate hasFirstCategory](self, "hasFirstCategory")
      && -[PLSearchSuggestionCandidate hasSecondCategory](self, "hasSecondCategory"))
    {
      if ((_DWORD)v16)
      {
        -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isMePerson");

        if (v22)
        {
          v39 = v6;
        }
        else
        {
          -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isMePerson");

          if (!v32)
          {
            v17 = 0;
LABEL_41:
            if (-[NSObject length](v17, "length", v39, v40))
            {
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
              -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = -[NSObject rangeOfString:](v17, "rangeOfString:", v4);
              objc_msgSend(v18, "addAttribute:value:range:", CFSTR("PLSearchQueryRankedGroupAttribute"), v33, v34, v35);

              -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[NSObject rangeOfString:](v17, "rangeOfString:", v6);
              v25 = v18;
              goto LABEL_19;
            }
            goto LABEL_43;
          }
          v39 = v4;
        }
LABEL_40:
        PFStringWithValidatedFormat();
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      if (-[NSObject length](v4, "length") && -[NSObject length](v6, "length"))
      {
        v39 = v4;
        v40 = v6;
        goto LABEL_40;
      }
      PLSearchBackendInitialSuggestionsGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchSuggestionCandidate description](self, "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v26;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to populate template with mutliple categories: %@.", buf, 0xCu);
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (-[PLSearchSuggestionCandidate hasFirstCategory](self, "hasFirstCategory"))
    {
      if (-[NSObject length](v4, "length"))
      {
        PFStringWithValidatedFormat();
        v17 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject length](v17, "length", v4))
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
          -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v17;
          v20 = v4;
          goto LABEL_18;
        }
LABEL_43:
        v18 = 0;
        goto LABEL_44;
      }
      PLSearchBackendInitialSuggestionsGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchSuggestionCandidate description](self, "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        v30 = "Unable to populate template with single category: %@.";
        goto LABEL_31;
      }
    }
    else
    {
      if (v14)
      {
        v17 = v12;
        if (-[NSObject length](v17, "length"))
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      PLSearchBackendInitialSuggestionsGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchSuggestionCandidate description](self, "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        v30 = "Unable to populate invalid template: %@.";
LABEL_31:
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);

      }
    }

    v18 = 0;
    v17 = 0;
    goto LABEL_44;
  }
  v17 = v4;
  if (!-[NSObject length](v17, "length"))
    goto LABEL_43;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v17);
  if (-[PLSearchSuggestionCandidate hasFirstCategory](self, "hasFirstCategory"))
  {
    -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    v20 = v17;
LABEL_18:
    v24 = -[NSObject rangeOfString:](v19, "rangeOfString:", v20);
    v25 = v18;
LABEL_19:
    objc_msgSend(v25, "addAttribute:value:range:", CFSTR("PLSearchQueryRankedGroupAttribute"), v16, v24, v23);

  }
LABEL_44:
  v36 = -[__CFString length](v9, "length");
  v37 = v9;
  if (!v36)
  {
    -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "suggestionTemplateKey");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "addAttribute:value:range:", CFSTR("PLSearchQueryTemplateTypeAttribute"), v37, 0, objc_msgSend(v18, "length"));
  if (!v36)
  {

  }
LABEL_48:

  return v18;
}

- (BOOL)hasFirstCategory
{
  unint64_t v3;
  void *v4;
  char v5;

  v3 = -[PLSearchSuggestionCandidate styleType](self, "styleType");
  if (v3 != 1)
  {
    -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "templateType");

    LOBYTE(v3) = v5 & 1;
  }
  return v3;
}

- (BOOL)hasSecondCategory
{
  _BOOL8 v3;
  void *v4;
  unint64_t v5;

  if (-[PLSearchSuggestionCandidate styleType](self, "styleType") == 1)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "templateType");

    return (v5 >> 1) & 1;
  }
  return v3;
}

- (BOOL)hasDateFilter
{
  BOOL v3;
  void *v4;

  if (-[PLSearchSuggestionCandidate styleType](self, "styleType") == 1)
    return 0;
  -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "templateDateType") != 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PLSearchSuggestionCandidate *v4;
  PLSearchSuggestionCandidate *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;

  v4 = (PLSearchSuggestionCandidate *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PLSearchSuggestionCandidate styleType](self, "styleType");
      if (v6 != -[PLSearchSuggestionCandidate styleType](v5, "styleType"))
        goto LABEL_9;
      -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionCandidate suggestionTemplate](v5, "suggestionTemplate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (!v9)
        goto LABEL_9;
      -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "groupId");
      -[PLSearchSuggestionCandidate firstGroup](v5, "firstGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "groupId");

      if (v11 == v13)
      {
        -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "groupId");
        -[PLSearchSuggestionCandidate secondGroup](v5, "secondGroup");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15 == objc_msgSend(v16, "groupId");

      }
      else
      {
LABEL_9:
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "groupId") ^ v4;
  -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "groupId");
  v9 = v6 ^ v8 ^ -[PLSearchSuggestionCandidate styleType](self, "styleType");

  return v9;
}

- (PLSearchSuggestionCandidate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  PLSearchSuggestionCandidate *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionCandidatePropertySuggestionTemplate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionCandidatePropertyFirstGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionCandidatePropertySecondGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionCandidatePropertyTimeStamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PLSearchSuggestionCandidateStyleType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  v13 = -[PLSearchSuggestionCandidate initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:](self, "initWithSearchSuggestionTemplate:firstGroup:secondGroup:assetIdsForDateFilter:minAssetResultCountPerSuggestion:styleType:", v5, v6, v7, 0, 0, v12);
  -[PLSearchSuggestionCandidate setTimeSinceLastUsed:](v13, "setTimeSinceLastUsed:", v10);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  PLSearchSuggestionTemplate *suggestionTemplate;
  id v5;
  void *v6;
  id v7;

  suggestionTemplate = self->_suggestionTemplate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestionTemplate, CFSTR("PLSearchSuggestionCandidatePropertySuggestionTemplate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstGroup, CFSTR("PLSearchSuggestionCandidatePropertyFirstGroup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondGroup, CFSTR("PLSearchSuggestionCandidatePropertySecondGroup"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeSinceLastUsed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("PLSearchSuggestionCandidatePropertyTimeStamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_styleType);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("PLSearchSuggestionCandidateStyleType"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  PSIRankedGroupV2 *firstGroup;
  PSIRankedGroupV2 *secondGroup;
  float v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_timeSinceLastUsed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchSuggestionTemplate description](self->_suggestionTemplate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  firstGroup = self->_firstGroup;
  secondGroup = self->_secondGroup;
  -[PLSearchSuggestionCandidate rankingScore](self, "rankingScore");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("template: %@, first entity: %@, second entity: %@, ranking score: %f, intersection count: %tu, date last used: %@, style type: %tu"), v5, firstGroup, secondGroup, v8, self->_intersectionCount, v3, self->_styleType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)jsonDictionary
{
  void *v3;
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  -[PLSearchSuggestionCandidate populatedTemplateQueryString](self, "populatedTemplateQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  v26[0] = CFSTR("intersection_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLSearchSuggestionCandidate intersectionCount](self, "intersectionCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v26[1] = CFSTR("ranking_score");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PLSearchSuggestionCandidate rankingScore](self, "rankingScore");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v7;
  v26[2] = CFSTR("time_last_used");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PLSearchSuggestionCandidate timeSinceLastUsed](self, "timeSinceLastUsed");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  v26[3] = CFSTR("style_type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLSearchSuggestionCandidate styleType](self, "styleType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithDictionary:", v11);

  if (v3)
  {
    objc_msgSend(v3, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("query_string"));

  }
  -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "suggestionTemplateKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PLSearchSuggestionCandidate suggestionTemplate](self, "suggestionTemplate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "suggestionTemplateKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("suggestion_template"));

  }
  -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PLSearchSuggestionCandidate firstGroup](self, "firstGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "jsonDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("first_group"));

  }
  -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PLSearchSuggestionCandidate secondGroup](self, "secondGroup");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "jsonDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("second_group"));

  }
  v24 = (void *)objc_msgSend(v12, "copy");

  return v24;
}

- (void)dealloc
{
  __CFArray *assetIdsForDateFilter;
  objc_super v4;

  assetIdsForDateFilter = self->_assetIdsForDateFilter;
  if (assetIdsForDateFilter)
    CFRelease(assetIdsForDateFilter);
  v4.receiver = self;
  v4.super_class = (Class)PLSearchSuggestionCandidate;
  -[PLSearchSuggestionCandidate dealloc](&v4, sel_dealloc);
}

- (PLSearchSuggestionTemplate)suggestionTemplate
{
  return self->_suggestionTemplate;
}

- (PSIRankedGroupV2)firstGroup
{
  return self->_firstGroup;
}

- (PSIRankedGroupV2)secondGroup
{
  return self->_secondGroup;
}

- (void)setIntersectionCount:(unint64_t)a3
{
  self->_intersectionCount = a3;
}

- (void)setRankingScore:(float)a3
{
  self->_rankingScore = a3;
}

- (unint64_t)styleType
{
  return self->_styleType;
}

- (double)timeSinceLastUsed
{
  return self->_timeSinceLastUsed;
}

- (void)setTimeSinceLastUsed:(double)a3
{
  self->_timeSinceLastUsed = a3;
}

- (__CFArray)assetIdsForDateFilter
{
  return self->_assetIdsForDateFilter;
}

- (void)setAssetIdsForDateFilter:(__CFArray *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)minAssetResultCountPerSuggestion
{
  return self->_minAssetResultCountPerSuggestion;
}

- (void)setMinAssetResultCountPerSuggestion:(unint64_t)a3
{
  self->_minAssetResultCountPerSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondGroup, 0);
  objc_storeStrong((id *)&self->_firstGroup, 0);
  objc_storeStrong((id *)&self->_suggestionTemplate, 0);
}

+ (id)updateCandidates:(id)a3 withTimestampsFromPreviouslyStoredCandidates:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (!objc_msgSend(v5, "count"))
    {
      v19 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_26;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      obj = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                if (objc_msgSend(v12, "isEqual:", v18, v21))
                {
                  objc_msgSend(v18, "timeSinceLastUsed");
                  objc_msgSend(v12, "setTimeSinceLastUsed:");
                  goto LABEL_18;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v15)
                continue;
              break;
            }
          }
LABEL_18:

        }
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v5 = v21;
  }
  else if (v5)
  {
    v7 = v5;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }
  v19 = v7;
LABEL_26:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

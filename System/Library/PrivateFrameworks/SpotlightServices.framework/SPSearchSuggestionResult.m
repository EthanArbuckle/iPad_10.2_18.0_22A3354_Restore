@implementation SPSearchSuggestionResult

+ (void)updateRankingItemForSuggestionResult:(id)a3
{
  id v3;
  PRSRankingItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  const __CFString **v10;
  void *v11;
  void *v12;
  int IsLocalSuggestion;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "type") == 32 || objc_msgSend(v3, "type") == 38)
  {
    v4 = objc_alloc_init(PRSRankingItem);
    objc_msgSend(v3, "suggestionsFeedbackData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSRankingItem setLocalSuggestionsData:](v4, "setLocalSuggestionsData:", v5);

    objc_msgSend(v3, "rankingScore");
    -[PRSRankingItem setSuggestionScore:](v4, "setSuggestionScore:");
    v18 = CFSTR("suggestion score");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[PRSRankingItem suggestionScore](v4, "suggestionScore");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (void **)v19;
    v10 = &v18;
  }
  else
  {
    IsLocalSuggestion = SSResultTypeIsLocalSuggestion(objc_msgSend(v3, "type"));
    v4 = objc_alloc_init(PRSRankingItem);
    objc_msgSend(v3, "suggestionsFeedbackData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!IsLocalSuggestion)
    {
      -[PRSRankingItem setServerSuggestionsData:](v4, "setServerSuggestionsData:", v14);

      objc_msgSend(v3, "rankingScore");
      -[PRSRankingItem setSuggestionScore:](v4, "setSuggestionScore:");
      goto LABEL_5;
    }
    -[PRSRankingItem setLocalSuggestionsData:](v4, "setLocalSuggestionsData:", v14);

    objc_msgSend(v3, "rankingScore");
    -[PRSRankingItem setSuggestionScore:](v4, "setSuggestionScore:");
    v16 = CFSTR("suggestion score");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[PRSRankingItem suggestionScore](v4, "suggestionScore");
    objc_msgSend(v15, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v17;
    v10 = &v16;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalFeatures:", v11);

LABEL_5:
  -[PRSRankingItem setSuggestionBundleIDType](v4, "setSuggestionBundleIDType");
  objc_msgSend(v3, "sectionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItem setSectionBundleIdentifier:](v4, "setSectionBundleIdentifier:", v12);

  objc_msgSend(v3, "setRankingItem:", v4);
}

+ (id)searchSuggestionRankingResultWithResult:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  SPSearchSuggestionResult *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[SPSearchSuggestionResult initWithSearchResult:query:sectionBundleIdentifier:queryId:]([SPSearchSuggestionResult alloc], "initWithSearchResult:query:sectionBundleIdentifier:queryId:", v11, v10, v9, a6);

  objc_msgSend((id)objc_opt_class(), "updateRankingItemForSuggestionResult:", v12);
  return v12;
}

+ (id)searchSuggestionRankingResultWithSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  SPSearchSuggestionResult *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[SPSearchSuggestionResult initWithSearchSuggestion:query:sectionBundleIdentifier:queryId:]([SPSearchSuggestionResult alloc], "initWithSearchSuggestion:query:sectionBundleIdentifier:queryId:", v11, v10, v9, a6);

  objc_msgSend((id)objc_opt_class(), "updateRankingItemForSuggestionResult:", v12);
  return v12;
}

- (SPSearchSuggestionResult)initWithSearchResult:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  void *v6;
  id v9;
  id v10;
  char isKindOfClass;
  id v12;
  SPSearchSuggestionResult *v13;
  SPSearchSuggestionResult *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSArray *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  NSArray *searchEntities;
  NSArray *v71;
  SFSearchSuggestion *suggestion;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  objc_super v79;
  _QWORD v80[2];
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[2];

  v84[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  obj = a4;
  v10 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = v9;
  v79.receiver = self;
  v79.super_class = (Class)SPSearchSuggestionResult;
  v13 = -[SFSearchResult_SpotlightExtras initWithResult:groupId:](&v79, sel_initWithResult_groupId_, v12, 0);
  v14 = v13;
  if (v13)
  {
    -[SPSearchSuggestionResult resultBundleId](v13, "resultBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[SPSearchSuggestionResult setResultBundleId:](v14, "setResultBundleId:", v15);
    }
    else
    {
      -[SPSearchSuggestionResult applicationBundleIdentifier](v14, "applicationBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[SPSearchSuggestionResult setResultBundleId:](v14, "setResultBundleId:", v16);
      }
      else
      {
        -[SPSearchSuggestionResult sectionBundleIdentifier](v14, "sectionBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSearchSuggestionResult setResultBundleId:](v14, "setResultBundleId:", v17);

      }
    }

    objc_msgSend(v12, "rankingScore");
    -[SFSearchResult_SpotlightExtras setScore:](v14, "setScore:", (unsigned __int128)v18);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "personQueryIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchResult_SpotlightExtras setPersonQueryIdentifier:](v14, "setPersonQueryIdentifier:", v19);

      objc_msgSend(v12, "personIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchResult_SpotlightExtras setPersonIdentifier:](v14, "setPersonIdentifier:", v20);

    }
    else
    {
      -[SFSearchResult_SpotlightExtras setPersonQueryIdentifier:](v14, "setPersonQueryIdentifier:", 0);
      -[SFSearchResult_SpotlightExtras setPersonIdentifier:](v14, "setPersonIdentifier:", 0);
    }
    if (-[SPSearchSuggestionResult type](v14, "type") == 38
      || -[SPSearchSuggestionResult type](v14, "type") == 37)
    {
      -[SFSearchResult_SpotlightExtras personIdentifier](v14, "personIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {

      }
      else
      {
        -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[SPSearchSuggestionResult identifier](v14, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSearchResult_SpotlightExtras setPersonIdentifier:](v14, "setPersonIdentifier:", v23);

          -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSearchResult_SpotlightExtras setPersonQueryIdentifier:](v14, "setPersonQueryIdentifier:", v24);

          -[SPSearchSuggestionResult setContactIdentifier:](v14, "setContactIdentifier:", 0);
        }
      }
    }
    -[SFSearchResult_SpotlightExtras setProtectionClass:](v14, "setProtectionClass:", &stru_1E6E549F0);
    -[SFSearchResult_SpotlightExtras personQueryIdentifier](v14, "personQueryIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[SPSearchSuggestionResult title](v14, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "text");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult setCompletion:](v14, "setCompletion:", v27);

      -[SFSearchResult_SpotlightExtras personQueryIdentifier](v14, "personQueryIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPSearchContactEntity updatePersonQueryIdentifier:withContactIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withContactIdentifier:", v28, v30);
        v31 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v31;
      }
      -[SFSearchResult_SpotlightExtras personIdentifier](v14, "personIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[SFSearchResult_SpotlightExtras personIdentifier](v14, "personIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPSearchContactEntity updatePersonQueryIdentifier:withPersonIdentifier:](SPSearchContactEntity, "updatePersonQueryIdentifier:withPersonIdentifier:", v28, v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v34;
      }
      +[SPSearchEntity searchEntityWithPersonQueryIdentifier:personName:fromSuggestion:](SPSearchEntity, "searchEntityWithPersonQueryIdentifier:personName:fromSuggestion:", v28, 0, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        objc_msgSend(v35, "contactIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSearchSuggestionResult setContactIdentifier:](v14, "setContactIdentifier:", v37);

        objc_msgSend(v36, "personIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSearchResult_SpotlightExtras setPersonIdentifier:](v14, "setPersonIdentifier:", v38);

        objc_msgSend(v36, "personQueryIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSearchResult_SpotlightExtras setPersonQueryIdentifier:](v14, "setPersonQueryIdentifier:", v39);

        v84[0] = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
        v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
        -[SFSearchResult_SpotlightExtras personIdentifier](v14, "personIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          -[SPSearchSuggestionResult setIdentifier:](v14, "setIdentifier:", v6);
        }
        else
        {
          -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
          v45 = v10;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPSearchSuggestionResult setIdentifier:](v14, "setIdentifier:", v46);

          v10 = v45;
        }

      }
      else
      {
        v40 = 0;
      }
      -[SPSearchSuggestionResult setType:](v14, "setType:", 38);
      -[SPSearchSuggestionResult setResultBundleId:](v14, "setResultBundleId:", CFSTR("com.apple.spotlight.suggestionlist.contact.people"));
      goto LABEL_32;
    }
    -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[SPSearchSuggestionResult title](v14, "title");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "text");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult setCompletion:](v14, "setCompletion:", v43);

      -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPSearchEntity searchEntityWithContactIdentifier:fromSuggestion:](SPSearchEntity, "searchEntityWithContactIdentifier:fromSuggestion:", v44, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v83 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
        v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = 0;
      }
      -[SPSearchSuggestionResult setType:](v14, "setType:", 32);
      -[SPSearchSuggestionResult setResultBundleId:](v14, "setResultBundleId:", CFSTR("com.apple.spotlight.suggestionlist.contact.contact"));
      goto LABEL_39;
    }
    objc_msgSend(v12, "inlineCard");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "cardSections");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "command");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "resultBundleId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.spotlight.suggestionlist.parsec.entity"));

    if ((_DWORD)v48)
    {
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPSearchEntity searchEntityWithCommand:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithCommand:fromSuggestion:", v28, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
          v40 = (NSArray *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "searchString");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_70;
        }
      }
LABEL_72:
      v40 = 0;
LABEL_73:
      -[SPSearchSuggestionResult completion](v14, "completion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult setCompletion:](v14, "setCompletion:", v36);
LABEL_32:

LABEL_39:
      v51 = 0;
      goto LABEL_40;
    }
    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v28, "searchString");
        v74 = objc_claimAutoreleasedReturnValue();
LABEL_66:
        v51 = (void *)v74;
        goto LABEL_69;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v28, "utteranceText");
        v74 = objc_claimAutoreleasedReturnValue();
        goto LABEL_66;
      }
    }
    objc_msgSend(v12, "title");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "text");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v76)
      goto LABEL_72;
    objc_msgSend(v12, "title");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "text");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_69:
    v40 = 0;
LABEL_70:
    if (v51)
    {
      -[SPSearchSuggestionResult setCompletion:](v14, "setCompletion:", v51);
LABEL_40:

      -[SPSearchSuggestionResult completion](v14, "completion");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        if (v40)
          goto LABEL_50;
      }
      else
      {
        if (v51)
          v53 = v51;
        else
          v53 = v10;
        -[SPSearchSuggestionResult setCompletion:](v14, "setCompletion:", v53);
        if (v40)
        {
LABEL_50:
          -[SPSearchSuggestionResult contactIdentifier](v14, "contactIdentifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v60
            || (-[SFSearchResult_SpotlightExtras personIdentifier](v14, "personIdentifier"),
                (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[SPSearchSuggestionResult resultBundleId](v14, "resultBundleId");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPSearchSuggestionResult setIdentifier:](v14, "setIdentifier:", v61);

            if (v60)
            {
LABEL_59:

              -[SPSearchSuggestionResult suggestionsFeedbackData](v14, "suggestionsFeedbackData");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFSearchResult_SpotlightExtras setSuggestionsFeedbackData:](v14, "setSuggestionsFeedbackData:", v69);

              searchEntities = v14->_searchEntities;
              v14->_searchEntities = v40;
              v71 = v40;

              suggestion = v14->_suggestion;
              v14->_suggestion = 0;

              objc_storeStrong((id *)&v14->_query, obj);
              goto LABEL_60;
            }
          }
          else
          {
            -[SPSearchSuggestionResult resultBundleId](v14, "resultBundleId");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = v62;
            -[SPSearchSuggestionResult completion](v14, "completion");
            v63 = objc_claimAutoreleasedReturnValue();
            v64 = (void *)v63;
            if (v63)
              v65 = (const __CFString *)v63;
            else
              v65 = &stru_1E6E549F0;
            v80[1] = v65;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
            v66 = v10;
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "componentsJoinedByString:", CFSTR(":"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPSearchSuggestionResult setIdentifier:](v14, "setIdentifier:", v68);

            v10 = v66;
            v6 = 0;
          }

          goto LABEL_59;
        }
      }
      -[SPSearchSuggestionResult completion](v14, "completion");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        -[SPSearchSuggestionResult completion](v14, "completion");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        SSEscapedStringForSearchQuery(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        -[SPSearchSuggestionResult completion](v14, "completion");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@\"cwd || _kMDItemLaunchString=\"%@\"cwd"), v56, v56, obj);
        v57 = v10;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPSearchEntity searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:](SPSearchEntity, "searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:", v6, v58, 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
        v40 = (NSArray *)objc_claimAutoreleasedReturnValue();

        v10 = v57;
      }
      else
      {
        v40 = 0;
      }
      goto LABEL_50;
    }
    goto LABEL_73;
  }
LABEL_60:

  return v14;
}

+ (id)searchSuggestionRankingResultWithSpotlightSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  SPSearchSuggestionResult *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[SPSearchSuggestionResult initWithSpotlightSuggestion:query:sectionBundleIdentifier:queryId:]([SPSearchSuggestionResult alloc], "initWithSpotlightSuggestion:query:sectionBundleIdentifier:queryId:", v11, v10, v9, a6);

  objc_msgSend((id)objc_opt_class(), "updateRankingItemForSuggestionResult:", v12);
  return v12;
}

- (SPSearchSuggestionResult)initWithSpotlightSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SPSearchSuggestionResult *v14;
  SPSearchSuggestionResult *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  __CFString **v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v39;
  void *v40;
  id v41;
  id v42;
  objc_super v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v43.receiver = self;
  v43.super_class = (Class)SPSearchSuggestionResult;
  v14 = -[SFSearchResult_SpotlightExtras init](&v43, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_38;
  v39 = a6;
  objc_storeStrong((id *)&v14->_spotlightSuggestion, a3);
  -[SPSearchSuggestionResult localSuggestionFeatures](v15, "localSuggestionFeatures");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchSuggestionResult setLocalFeatures:](v15, "setLocalFeatures:", v16);

  -[SPSearchSuggestionResult suggestionsFeedbackData](v15, "suggestionsFeedbackData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchResult_SpotlightExtras setSuggestionsFeedbackData:](v15, "setSuggestionsFeedbackData:", v17);

  objc_msgSend(v11, "localizedAttributedSuggestion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "string");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v20 = CFSTR("com.apple.spotlight.suggestionlist.local");
  -[SPSearchSuggestionResult localFeatures](v15, "localFeatures");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v13;
  v42 = v12;
  v40 = v21;
  if (v21)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("completionType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = v22;
      v24 = objc_msgSend(v22, "intValue");
      if (v24 > 20)
      {
        if (v24 == 21)
        {
          v31 = SSResultBundleIdSuggestionLocalTopic;
        }
        else
        {
          if (v24 != 22)
          {
LABEL_19:
            +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_20;
          }
          v31 = SSResultBundleIdSuggestionLocalCategory;
        }
        v25 = *v31;

        +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 39;
        goto LABEL_25;
      }
      if (v24 != 5)
      {
        if (v24 == 6)
        {
          v25 = CFSTR("com.apple.spotlight.suggestionlist.photo");

          +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = 35;
LABEL_25:
          v20 = v25;
          goto LABEL_26;
        }
        goto LABEL_19;
      }
      +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      v27 = 34;
      goto LABEL_26;
    }
  }
  objc_msgSend(v11, "currentToken");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "tokenKind");

  switch(v29)
  {
    case 5:
      +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 17:
      v30 = CFSTR("com.apple.spotlight.suggestionlist.photo");

      +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 35;
      break;
    case 45:
      v30 = CFSTR("com.apple.spotlight.suggestionlist.local.topic");

      +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 39;
      break;
    default:
      +[SPSearchEntity searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:](SPSearchCommandEntity, "searchEntityWithSpotlightSuggestion:symbolName:fromSuggestion:", v11, CFSTR("magnifyingglass"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      v27 = 31;
      goto LABEL_26;
  }
  v20 = v30;
LABEL_26:
  -[SPSearchSuggestionResult setQueryId:](v15, "setQueryId:", v39);
  if (v20)
    v32 = v20;
  else
    v32 = &stru_1E6E549F0;
  if (v19)
    v33 = v19;
  else
    v33 = &stru_1E6E549F0;
  v45[0] = v32;
  v45[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "componentsJoinedByString:", CFSTR(": "));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchSuggestionResult setIdentifier:](v15, "setIdentifier:", v35);

  objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", v19);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchSuggestionResult setTitle:](v15, "setTitle:", v36);

  v13 = v41;
  -[SPSearchSuggestionResult setSectionBundleIdentifier:](v15, "setSectionBundleIdentifier:", v41);
  -[SPSearchSuggestionResult setType:](v15, "setType:", v27);
  -[SPSearchSuggestionResult setCompletion:](v15, "setCompletion:", v19);
  -[SPSearchSuggestionResult setResultBundleId:](v15, "setResultBundleId:", v20);
  -[SFSearchResult_SpotlightExtras setProtectionClass:](v15, "setProtectionClass:", &stru_1E6E549F0);
  if (v26)
  {
    v44 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  v12 = v42;
  objc_storeStrong((id *)&v15->_searchEntities, v37);
  if (v26)

  objc_storeStrong((id *)&v15->_query, a4);
LABEL_38:

  return v15;
}

- (SPSearchSuggestionResult)initWithSearchSuggestion:(id)a3 query:(id)a4 sectionBundleIdentifier:(id)a5 queryId:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SPSearchSuggestionResult *v14;
  __CFString *v15;
  NSArray *v16;
  void *v17;
  __CFString *v18;
  double v19;
  double v20;
  uint64_t v21;
  __CFString *v22;
  double v23;
  __CFString *v24;
  double v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSArray *searchEntities;
  NSArray *v40;
  uint64_t v42;
  id obj;
  id v44;
  id v45;
  void *v46;
  objc_super v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v47.receiver = self;
  v47.super_class = (Class)SPSearchSuggestionResult;
  v14 = -[SFSearchResult_SpotlightExtras init](&v47, sel_init);
  if (!v14)
    goto LABEL_35;
  v44 = a4;
  v46 = v13;
  if (v11)
  {
    objc_msgSend(v11, "suggestion");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "searchEntities");
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else
  {
    v15 = (__CFString *)v12;
  }
  v16 = 0;
LABEL_7:
  obj = a3;
  v45 = v12;
  -[NSArray lastObject](v16, "lastObject", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("com.apple.spotlight.suggestionlist.local");
  objc_msgSend(v11, "score");
  v20 = v19;
  v21 = 34;
  switch(objc_msgSend(v11, "type"))
  {
    case 1u:
      v22 = CFSTR("com.apple.spotlight.suggestionlist.parsec");

      v21 = 17;
      goto LABEL_27;
    case 2u:
      v22 = CFSTR("com.apple.spotlight.suggestionlist.proactive");

      objc_msgSend(v11, "score");
      v20 = v23 * 128.0 * 1024.0 * 1024.0;
      v21 = 15;
      goto LABEL_27;
    case 5u:
      v22 = CFSTR("com.apple.spotlight.suggestionlist.contact.contact");

      v21 = 32;
      goto LABEL_27;
    case 6u:
      v22 = CFSTR("com.apple.spotlight.suggestionlist.usertypedstring");

      v21 = 30;
      goto LABEL_27;
    case 7u:
      if (v17 && objc_msgSend(v17, "isPhotosEntitySearch"))
      {
        v24 = CFSTR("com.apple.spotlight.suggestionlist.photo");

        v21 = 35;
        v18 = v24;
      }
      else
      {
        v21 = 31;
      }
      objc_msgSend(v11, "score");
      v20 = v25 * 128.0 * 1024.0 * 1024.0;
      goto LABEL_28;
    case 0xBu:
      v22 = CFSTR("com.apple.spotlight.suggestionlist.siri");

      v21 = 27;
      goto LABEL_27;
    case 0xCu:
      v22 = CFSTR("com.apple.spotlight.websuggestionlist.parsec");

      v21 = 28;
      goto LABEL_27;
    case 0xEu:
      v22 = CFSTR("com.apple.spotlight.websuggestionlist.usertypedstring");

      v21 = 29;
      goto LABEL_27;
    case 0xFu:
      goto LABEL_28;
    default:
      if (v17 && objc_msgSend(v17, "isAppEntitySearch")
        || (objc_msgSend(v11, "bundleIdentifier"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.application")),
            v26,
            v27))
      {
        v22 = CFSTR("com.apple.application");

        v21 = 33;
LABEL_27:
        v18 = v22;
        goto LABEL_28;
      }
      if (objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.searchd.searchThroughSuggestions")))
      {
        objc_msgSend(v11, "bundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("."));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(CFSTR("com.apple.other:search_"), "stringByAppendingString:", v30);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v21 = 16;
        goto LABEL_27;
      }
      v21 = 16;
LABEL_28:
      -[SPSearchSuggestionResult setQueryId:](v14, "setQueryId:", v42);
      -[SFSearchResult_SpotlightExtras setScore:](v14, "setScore:", (unsigned __int128)v20);
      objc_msgSend(v11, "score");
      -[SPSearchSuggestionResult setRankingScore:](v14, "setRankingScore:");
      if (v18)
        v31 = v18;
      else
        v31 = &stru_1E6E549F0;
      if (v15)
        v32 = v15;
      else
        v32 = &stru_1E6E549F0;
      v48[0] = v31;
      v48[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR(": "));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult setIdentifier:](v14, "setIdentifier:", v34);

      objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult setTitle:](v14, "setTitle:", v35);

      objc_msgSend(v11, "fbr");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult setFbr:](v14, "setFbr:", v36);

      v13 = v46;
      -[SPSearchSuggestionResult setSectionBundleIdentifier:](v14, "setSectionBundleIdentifier:", v46);
      -[SPSearchSuggestionResult setType:](v14, "setType:", v21);
      -[SPSearchSuggestionResult setCompletion:](v14, "setCompletion:", v15);
      -[SPSearchSuggestionResult setResultBundleId:](v14, "setResultBundleId:", v18);
      objc_msgSend(v11, "serverFeatures");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchSuggestionResult setServerFeatures:](v14, "setServerFeatures:", v37);

      -[SPSearchSuggestionResult suggestionsFeedbackData](v14, "suggestionsFeedbackData");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchResult_SpotlightExtras setSuggestionsFeedbackData:](v14, "setSuggestionsFeedbackData:", v38);

      -[SFSearchResult_SpotlightExtras setProtectionClass:](v14, "setProtectionClass:", &stru_1E6E549F0);
      searchEntities = v14->_searchEntities;
      v14->_searchEntities = v16;
      v40 = v16;

      objc_storeStrong((id *)&v14->_suggestion, obj);
      objc_storeStrong((id *)&v14->_query, v44);

      v12 = v45;
      break;
  }
LABEL_35:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPSearchSuggestionResult;
  v4 = a3;
  -[SFSearchResult_SpotlightExtras encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, CFSTR("query"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestion, CFSTR("suggestion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_spotlightSuggestion, CFSTR("spotlightSuggestion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchEntities, CFSTR("searchEntities"));

}

- (SPSearchSuggestionResult)initWithCoder:(id)a3
{
  id v4;
  SPSearchSuggestionResult *v5;
  uint64_t v6;
  NSString *query;
  uint64_t v8;
  SFSearchSuggestion *suggestion;
  uint64_t v10;
  CSSuggestion *spotlightSuggestion;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *searchEntities;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SPSearchSuggestionResult;
  v5 = -[SFSearchResult_SpotlightExtras initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
    v6 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestion"));
    v8 = objc_claimAutoreleasedReturnValue();
    suggestion = v5->_suggestion;
    v5->_suggestion = (SFSearchSuggestion *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spotlightSuggestion"));
    v10 = objc_claimAutoreleasedReturnValue();
    spotlightSuggestion = v5->_spotlightSuggestion;
    v5->_spotlightSuggestion = (CSSuggestion *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("searchEntities"));
    v15 = objc_claimAutoreleasedReturnValue();
    searchEntities = v5->_searchEntities;
    v5->_searchEntities = (NSArray *)v15;

  }
  return v5;
}

- (int64_t)compareByRank:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v4 = a3;
  -[SPSearchSuggestionResult spotlightSuggestion](self, "spotlightSuggestion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "suggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -1;
      goto LABEL_25;
    }
  }
  -[SPSearchSuggestionResult suggestion](self, "suggestion");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v4, "spotlightSuggestion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v8 = 1;
      goto LABEL_25;
    }
  }
  -[SPSearchSuggestionResult suggestion](self, "suggestion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SPSearchSuggestionResult suggestion](self, "suggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v4, "suggestion"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      objc_msgSend(v4, "suggestion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[SPSearchSuggestionResult suggestion](self, "suggestion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "suggestion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "compare:", v20);
LABEL_21:
        v8 = v21;

        goto LABEL_25;
      }
    }
    else
    {

    }
  }
  -[SPSearchSuggestionResult suggestion](self, "suggestion");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22
    && (v23 = (void *)v22,
        objc_msgSend(v4, "suggestion"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        v24))
  {
    -[SPSearchSuggestionResult rankingScore](self, "rankingScore");
    v26 = v25;
    objc_msgSend(v4, "rankingScore");
    if (v26 <= v27)
      v8 = 1;
    else
      v8 = -1;
  }
  else
  {
    -[SPSearchSuggestionResult spotlightSuggestion](self, "spotlightSuggestion");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(v4, "spotlightSuggestion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[SPSearchSuggestionResult spotlightSuggestion](self, "spotlightSuggestion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "spotlightSuggestion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "compareByRank:", v20);
        goto LABEL_21;
      }
    }
    v31 = -[SFSearchResult_SpotlightExtras score](self, "score");
    v33 = v32;
    v34 = objc_msgSend(v4, "score");
    if (__PAIR128__(v35, v34) < __PAIR128__(v33, v31))
      v8 = -1;
    else
      v8 = 1;
  }
LABEL_25:

  return v8;
}

- (id)localSuggestionFeatures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  BOOL v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  id v64;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchSuggestionResult spotlightSuggestion](self, "spotlightSuggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SPSearchSuggestionResult spotlightSuggestion](self, "spotlightSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "features");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (localSuggestionFeatures_onceToken == -1)
    {
      if (v6)
      {
LABEL_4:
        v64 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", localSuggestionFeatures_sFeatureClasses, v6, &v64);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v64;
        if (!v8 && v7)
        {
          objc_msgSend(v3, "addEntriesFromDictionary:", v7);
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("score"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "doubleValue");
          -[SPSearchSuggestionResult setRankingScore:](self, "setRankingScore:");

          v8 = 0;
        }
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once(&localSuggestionFeatures_onceToken, &__block_literal_global_44);
      if (v6)
        goto LABEL_4;
    }
    v8 = 0;
    v7 = 0;
LABEL_26:

    return v3;
  }
  -[SPSearchSuggestionResult suggestion](self, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[SPSearchSuggestionResult suggestion](self, "suggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("stype"));

    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[SPSearchSuggestionResult suggestion](self, "suggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suggestion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("sslen"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[SPSearchSuggestionResult suggestion](self, "suggestion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "score");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("sscore"));

    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[SPSearchSuggestionResult suggestion](self, "suggestion");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v22, "score");
    objc_msgSend(v21, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v23, CFSTR("score"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("score"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    -[SPSearchSuggestionResult setRankingScore:](self, "setRankingScore:");

    -[SPSearchSuggestionResult suggestion](self, "suggestion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v22) = objc_opt_isKindOfClass();

    if ((v22 & 1) != 0)
    {
      -[SPSearchSuggestionResult suggestion](self, "suggestion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v26, "queryLen"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v27, CFSTR("queryLen"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v26, "queryFragmentCount"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v28, CFSTR("queryFragmentCount"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v26, "queryCompletionCount"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("queryCompletionCount"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v26, "fragments"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v30, CFSTR("fragments"));

      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "age");
      objc_msgSend(v31, "numberWithDouble:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v32, CFSTR("age"));

      v33 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "prob");
      objc_msgSend(v33, "numberWithDouble:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v34, CFSTR("prob"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v26, "maxscore"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v35, CFSTR("maxscore"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v26, "weight"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v36, CFSTR("weight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v26, "parentWeight"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v37, CFSTR("parentWeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v26, "rootWeight"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v38, CFSTR("rootWeight"));

      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "phraseScore");
      objc_msgSend(v39, "numberWithDouble:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v40, CFSTR("phraseScore"));

      v41 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "punishment");
      objc_msgSend(v41, "numberWithDouble:");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v42, CFSTR("punishment"));

      v43 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "compositeScore");
      v45 = v44 == 1.79769313e308;
      v46 = 0.0;
      if (!v45)
        objc_msgSend(v26, "compositeScore", 0.0);
      objc_msgSend(v43, "numberWithDouble:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v47, CFSTR("compositeScore"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v26, "completionType"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v48, CFSTR("completionType"));

      v49 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "fieldWeight");
      objc_msgSend(v49, "numberWithFloat:");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v50, CFSTR("fieldWeight"));

      v51 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v26, "isSingleThread"))
        v52 = 1.0;
      else
        v52 = 0.0;
      objc_msgSend(v51, "numberWithDouble:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v53, CFSTR("isSingleThread"));

      v54 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v26, "hasUsedDate"))
        v55 = 1.0;
      else
        v55 = 0.0;
      objc_msgSend(v54, "numberWithDouble:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v56, CFSTR("hasUsedDate"));

      v57 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v26, "isShortcut"))
        v58 = 1.0;
      else
        v58 = 0.0;
      objc_msgSend(v57, "numberWithDouble:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v59, CFSTR("isShortcut"));

      v60 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend(v26, "hasMultipleResults"))
        v61 = 1.0;
      else
        v61 = 0.0;
      objc_msgSend(v60, "numberWithDouble:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v62, CFSTR("hasMultipleResults"));

    }
  }
  return v3;
}

void __51__SPSearchSuggestionResult_localSuggestionFeatures__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)localSuggestionFeatures_sFeatureClasses;
  localSuggestionFeatures_sFeatureClasses = v2;

}

- (id)suggestionsFeedbackData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SSRoundDouble(4, (double)(int)-[SPSearchSuggestionResult type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("type"));

  -[SPSearchSuggestionResult query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSRoundDouble(4, (double)(unint64_t)objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("plen"));

  v7 = -[SFSearchResult_SpotlightExtras score](self, "score");
  SSRoundDouble(4, (double)*(unsigned __int128 *)&v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("score"));

  -[SPSearchSuggestionResult completion](self, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SSRoundDouble(4, (double)(unint64_t)objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("slen"));

  -[SPSearchSuggestionResult query](self, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  -[SPSearchSuggestionResult completion](self, "completion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSRoundDouble(4, (double)v12 / ((double)(unint64_t)objc_msgSend(v13, "length") + 1.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("ratio"));

  -[SPSearchSuggestionResult serverFeatures](self, "serverFeatures");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchSuggestionResult localFeatures](self, "localFeatures");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v112, "count"))
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    -[SPSearchSuggestionResult serverFeatures](self, "serverFeatures");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v115;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v115 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v18);
          -[SPSearchSuggestionResult serverFeatures](self, "serverFeatures");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          SSRoundDouble(4, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v23, v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
      }
      while (v16);
    }

  }
  else if (objc_msgSend(v113, "count"))
  {
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("stype"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("stype"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      SSRoundDouble(4, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("stype"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("sslen"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("sslen"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      SSRoundDouble(4, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v33, CFSTR("sslen"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("sscore"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("sscore"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      SSRoundDouble(4, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v37, CFSTR("sscore"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("queryLen"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("queryLen"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      SSRoundDouble(4, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v41, CFSTR("queryLen"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("queryFragmentCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("queryFragmentCount"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "doubleValue");
      SSRoundDouble(4, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v45, CFSTR("queryFragmentCount"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("queryCompletionCount"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("queryCompletionCount"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      SSRoundUInt64(objc_msgSend(v47, "unsignedLongValue"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v48, CFSTR("queryCompletionCount"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("fragments"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("fragments"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "doubleValue");
      SSRoundDouble(4, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v52, CFSTR("fragments"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("age"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("age"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "doubleValue");
      SSRoundDouble(4, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v56, CFSTR("age"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("prob"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("prob"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "doubleValue");
      SSRoundDouble(2, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v60, CFSTR("prob"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("maxscore"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("maxscore"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      SSRoundUInt64(objc_msgSend(v62, "unsignedLongValue"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v63, CFSTR("maxscore"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("weight"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("weight"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "doubleValue");
      SSRoundDouble(4, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v67, CFSTR("weight"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("parentWeight"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("parentWeight"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "doubleValue");
      SSRoundDouble(4, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v71, CFSTR("parentWeight"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("rootWeight"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("rootWeight"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "doubleValue");
      SSRoundDouble(4, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v75, CFSTR("rootWeight"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("phraseScore"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("phraseScore"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "doubleValue");
      SSRoundDouble(4, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v79, CFSTR("phraseScore"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("punishment"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("punishment"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "doubleValue");
      SSRoundDouble(4, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v83, CFSTR("punishment"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("compositeScore"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("compositeScore"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "doubleValue");
      SSRoundDouble(4, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v87, CFSTR("compositeScore"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("completionType"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("completionType"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "doubleValue");
      SSRoundDouble(4, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v91, CFSTR("completionType"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("fieldWeight"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("fieldWeight"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "doubleValue");
      SSRoundDouble(4, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v95, CFSTR("fieldWeight"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("isSingleThread"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("isSingleThread"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "doubleValue");
      SSRoundDouble(2, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v99, CFSTR("isSingleThread"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("hasUsedDate"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("hasUsedDate"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "doubleValue");
      SSRoundDouble(2, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v103, CFSTR("hasUsedDate"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("isShortcut"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("isShortcut"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "doubleValue");
      SSRoundDouble(2, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v107, CFSTR("isShortcut"));

    }
    objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("hasMultipleResults"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("hasMultipleResults"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "doubleValue");
      SSRoundDouble(2, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forKey:", v111, CFSTR("hasMultipleResults"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 2, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (SFSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (CSSuggestion)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (NSArray)searchEntities
{
  return self->_searchEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEntities, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end

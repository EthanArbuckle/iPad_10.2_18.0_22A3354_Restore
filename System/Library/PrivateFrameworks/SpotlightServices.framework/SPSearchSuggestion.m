@implementation SPSearchSuggestion

+ (id)suggestionsWithData:(id)a3 queryString:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  SPSearchSuggestion *v23;
  void *v24;
  void *v25;
  CFTypeRef cf;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "bytes");
  v28 = v7;
  objc_msgSend(v7, "length");
  cf = (CFTypeRef)_MDPlistBytesCreateTrusted();
  v8 = (void *)_MDPlistBytesCopyPlistAtIndex();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v15, "count", cf) == 23)
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            goto LABEL_14;
          objc_msgSend(v15, "objectAtIndexedSubscript:", 22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();

          if ((v19 & 1) == 0)
            goto LABEL_14;
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", 22);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[SPSearchSuggestion initWithSuggestion:query:scores:bundleIDs:]([SPSearchSuggestion alloc], "initWithSuggestion:query:scores:bundleIDs:", v20, v6, v22, v21);
          -[SPSearchSuggestion setQuery:](v23, "setQuery:", v6);
          if (v23)
            objc_msgSend(v9, "addObject:", v23);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }
LABEL_14:

  CFRelease(cf);
  objc_msgSend(v9, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortedArrayUsingSelector:", sel_compare_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)suggestionsWithNLPData:(id)a3 queryString:(id)a4
{
  id v5;
  id v6;
  SPSearchSuggestion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SPSearchSuggestion initWithNLPData:queryString:]([SPSearchSuggestion alloc], "initWithNLPData:queryString:", v6, v5);

  return v7;
}

- (SPSearchSuggestion)initWithSuggestion:(id)a3 query:(id)a4 scores:(id)a5 bundleIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
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
  uint64_t v40;
  SPSearchSuggestion *v41;
  SPSearchSuggestion *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  double *p_compositeScore;
  double v61;
  void *v62;
  float v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSDictionary *categories;
  SPSearchSuggestion *v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  objc_super v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  v15 = objc_msgSend(v12, "count");
  if (v15 != 21)
  {
    v18 = 0;
    v19 = 7;
    v20 = v14;
    goto LABEL_20;
  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", 14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  v18 = 0;
  v19 = 7;
  if (v17 <= 7)
  {
    if (v17 != 3)
    {
      v20 = v14;
      v15 = 21;
      if (v17 == 6)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PHOTOS_SUGGESTION"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = 21;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemContentTypeTree=\"public.image\" && **=\"%@*\"cwd)"), v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v37);
    v38 = v14;
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v36, v39);
    v40 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@\"cwd && **=\"%@\"cwd)"), v36, v39);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v38;
    v20 = (void *)v40;

LABEL_19:
    v15 = 21;
    goto LABEL_20;
  }
  if (v17 == 8)
  {
    v18 = 0;
    v19 = 2;
    v20 = v14;
    goto LABEL_19;
  }
  v20 = v14;
  v15 = 21;
  if (v17 == 22)
  {
    v73 = self;
    v76 = v11;
    objc_msgSend(v14, "lowercaseString");
    v77 = objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v75 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@\"cwd"), v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v24);

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v74 = v13;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v82 != v28)
            objc_enumerationMutation(v25);
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("*"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR("**=\"%@*\"cwd"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v32);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
      }
      while (v27);
    }

    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" || "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("(%@)"), v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 7;
    v11 = v76;
    v13 = v74;
    v14 = v75;
    v15 = 21;
    v20 = (void *)v77;
    self = v73;
  }
LABEL_20:
  v80.receiver = self;
  v80.super_class = (Class)SPSearchSuggestion;
  v41 = -[SPSearchSuggestion init](&v80, sel_init);
  v42 = v41;
  if (v41)
  {
    v78 = v20;
    if (v15 == 21)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_queryLen = objc_msgSend(v43, "integerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_queryFragmentCount = objc_msgSend(v44, "integerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_queryCompletionCount = objc_msgSend(v45, "longLongValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_fragments = objc_msgSend(v46, "integerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "doubleValue");
      v42->_age = v48;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 5);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      v42->_prob = v50;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 6);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_maxscore = (unint64_t)(double)objc_msgSend(v51, "longLongValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 7);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_weight = objc_msgSend(v52, "intValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 8);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_parentWeight = objc_msgSend(v53, "intValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 9);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_rootWeight = objc_msgSend(v54, "integerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 10);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "doubleValue");
      v42->_phraseScore = v56;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 11);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      v42->_punishment = v58;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 12);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "doubleValue");
      p_compositeScore = &v42->_compositeScore;
      v42->_compositeScore = v61;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 13);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "floatValue");
      v42->_fieldWeight = v63;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 14);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_completionType = objc_msgSend(v64, "integerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 15);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_prefixLen = objc_msgSend(v65, "integerValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 16);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_isSingleThread = objc_msgSend(v66, "integerValue") != 0;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 17);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_hasUsedDate = objc_msgSend(v67, "integerValue") != 0;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 18);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_isShortcut = objc_msgSend(v68, "integerValue") != 0;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 19);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v42->_hasMultipleResults = objc_msgSend(v69, "integerValue") != 0;

      v70 = (void *)objc_msgSend(v13, "copy");
    }
    else
    {
      v41->_queryLen = 0;
      v41->_queryFragmentCount = 0;
      v41->_queryCompletionCount = 0;
      v41->_fragments = 1;
      v41->_age = 1.0;
      v41->_prob = 0.0;
      v41->_maxscore = 0;
      v41->_weight = 0;
      v41->_parentWeight = 0;
      v41->_rootWeight = 0;
      v41->_phraseScore = 0.0;
      v41->_punishment = 0.0;
      p_compositeScore = &v41->_compositeScore;
      v41->_compositeScore = 1.0;
      v41->_fieldWeight = 0.0;
      v41->_completionType = 1;
      v41->_prefixLen = 0;
      v41->_isSingleThread = 0;
      v41->_hasUsedDate = 0;
      v41->_isShortcut = 0;
      v41->_hasMultipleResults = 0;
      v70 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_storeStrong((id *)&v42->_bundleIDs, v70);
    if (v15 == 21)

    objc_storeStrong((id *)&v42->_completion, a3);
    objc_storeStrong((id *)&v42->_spotlightQuery, v18);
    categories = v42->_categories;
    v42->_categories = 0;

    -[SPSearchSuggestion setScore:](v42, "setScore:", *p_compositeScore);
    v20 = v78;
    -[SPSearchSuggestion setSuggestion:](v42, "setSuggestion:", v78);
    -[SPSearchSuggestion setQuery:](v42, "setQuery:", v11);
    -[SPSearchSuggestion setType:](v42, "setType:", v19);
  }

  return v42;
}

- (SPSearchSuggestion)initWithNLPData:(id)a3 queryString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  SPSearchSuggestion *v25;
  NSArray *bundleIDs;
  NSString *completion;
  id obj;
  id v30;
  objc_super v31;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("query"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("tokenCount"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = &unk_1E6E97908;
  v13 = v12;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributeCount"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = &unk_1E6E97908;
  v17 = v16;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("categories"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x1E0C9AA70];
  if (v18)
    v21 = (void *)v18;
  else
    v21 = (void *)MEMORY[0x1E0C9AA70];
  obj = v21;
  v30 = v21;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("terms"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v23 = v22;
  else
    v23 = v20;
  v24 = v23;

  v31.receiver = self;
  v31.super_class = (Class)SPSearchSuggestion;
  v25 = -[SPSearchSuggestion init](&v31, sel_init);
  if (v25)
  {
    v25->_queryLen = objc_msgSend(v6, "length");
    v25->_queryFragmentCount = (int)objc_msgSend(v13, "intValue");
    v25->_queryCompletionCount = 20;
    v25->_fragments = objc_msgSend(v17, "integerValue");
    v25->_age = 0.0;
    v25->_prob = 0.0;
    v25->_maxscore = 0;
    v25->_weight = 0;
    v25->_parentWeight = 0;
    v25->_rootWeight = 0;
    v25->_phraseScore = 0.0;
    v25->_punishment = 0.0;
    v25->_compositeScore = 1.79769313e308;
    v25->_fieldWeight = 0.0;
    v25->_completionType = 5;
    v25->_prefixLen = 0;
    v25->_isSingleThread = 0;
    v25->_hasUsedDate = 0;
    v25->_isShortcut = 0;
    v25->_hasMultipleResults = 0;
    bundleIDs = v25->_bundleIDs;
    v25->_bundleIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    completion = v25->_completion;
    v25->_completion = 0;

    objc_storeStrong((id *)&v25->_categories, obj);
    objc_storeStrong((id *)&v25->_terms, v23);
    objc_storeStrong((id *)&v25->_spotlightQuery, v9);
    -[SPSearchSuggestion setSuggestion:](v25, "setSuggestion:", v8);
    -[SPSearchSuggestion setQuery:](v25, "setQuery:", v6);
    -[SPSearchSuggestion setType:](v25, "setType:", 15);
  }

  return v25;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  NSArray *bundleIDs;
  const __CFString *completion;
  const __CFString *spotlightQuery;
  NSDictionary *v9;
  NSDictionary *categories;
  NSDictionary *terms;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SPSearchSuggestion;
  v4 = a3;
  -[SPSearchSuggestion encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_queryLen), CFSTR("queryLen"), v12.receiver, v12.super_class);
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_queryFragmentCount), CFSTR("queryFragmentCount"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_queryCompletionCount, CFSTR("queryCompletionCount"));
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_fragments), CFSTR("fragments"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("age"), self->_age);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("prob"), self->_prob);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_maxscore, CFSTR("maxscore"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_weight, CFSTR("weight"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_parentWeight, CFSTR("parentWeight"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_rootWeight, CFSTR("rootWeight"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("phraseScore"), self->_phraseScore);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("punishment"), self->_punishment);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("compositeScore"), self->_compositeScore);
  objc_msgSend(v4, "encodeInt:forKey:", self->_completionType, CFSTR("completionType"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_prefixLen, CFSTR("prefixLen"));
  *(float *)&v5 = self->_fieldWeight;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("fieldWeight"), v5);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSingleThread, CFSTR("isSingleThread"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasUsedDate, CFSTR("hasUsedDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isShortcut, CFSTR("isShortcut"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasMultipleResults, CFSTR("hasMultipleResults"));
  if (self->_bundleIDs)
    bundleIDs = self->_bundleIDs;
  else
    bundleIDs = (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "encodeObject:forKey:", bundleIDs, CFSTR("bundleIDs"));
  if (self->_completion)
    completion = (const __CFString *)self->_completion;
  else
    completion = &stru_1E6E549F0;
  objc_msgSend(v4, "encodeObject:forKey:", completion, CFSTR("completion"));
  if (self->_spotlightQuery)
    spotlightQuery = (const __CFString *)self->_spotlightQuery;
  else
    spotlightQuery = &stru_1E6E549F0;
  objc_msgSend(v4, "encodeObject:forKey:", spotlightQuery, CFSTR("spotlightQuery"));
  v9 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  if (self->_categories)
    categories = self->_categories;
  else
    categories = (NSDictionary *)MEMORY[0x1E0C9AA70];
  objc_msgSend(v4, "encodeObject:forKey:", categories, CFSTR("categories"));
  if (self->_terms)
    terms = self->_terms;
  else
    terms = v9;
  objc_msgSend(v4, "encodeObject:forKey:", terms, CFSTR("terms"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SPSearchSuggestion suggestion](self, "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SPSearchSuggestion query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPSearchSuggestion suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchSuggestion suggestion](self, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> \"%@\" len:%ld fragments:%ld max_score:%llu age:%g weight:%d pweight:%d rweight:%d c_score:%g type:%d pfx_len:%d st:%d phrase_score:%g field_weight:%f hasUsed:%d isShortcut:%d"), v4, self, v5, objc_msgSend(v6, "length"), self->_fragments, self->_maxscore, *(_QWORD *)&self->_age, self->_weight, self->_parentWeight, self->_rootWeight, *(_QWORD *)&self->_compositeScore, self->_completionType, self->_prefixLen, self->_isSingleThread, *(_QWORD *)&self->_phraseScore, self->_fieldWeight,
    self->_hasUsedDate,
    self->_isShortcut);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;

  v4 = a3;
  if ((int)objc_msgSend(v4, "completionType") > self->_completionType)
    goto LABEL_2;
  if ((int)objc_msgSend(v4, "completionType") < self->_completionType
    || (objc_msgSend(v4, "compositeScore"), v6 > self->_compositeScore))
  {
LABEL_5:
    v5 = -1;
    goto LABEL_6;
  }
  objc_msgSend(v4, "compositeScore");
  if (v8 < self->_compositeScore)
    goto LABEL_2;
  if (objc_msgSend(v4, "isShortcut") && !self->_isShortcut)
    goto LABEL_5;
  if (self->_isShortcut > objc_msgSend(v4, "isShortcut"))
  {
LABEL_2:
    v5 = 1;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "hasUsedDate") & 1) == 0 && !self->_hasUsedDate)
  {
    objc_msgSend(v4, "age");
    if (v11 < self->_age)
      goto LABEL_5;
    objc_msgSend(v4, "age");
    if (v12 <= self->_age)
    {
      if (objc_msgSend(v4, "maxscore") > self->_maxscore)
        goto LABEL_5;
      if (objc_msgSend(v4, "maxscore") >= self->_maxscore)
      {
        if ((int)objc_msgSend(v4, "weight") < self->_weight)
          goto LABEL_5;
        if ((int)objc_msgSend(v4, "weight") <= self->_weight)
        {
          if (objc_msgSend(v4, "fragments") < self->_fragments)
            goto LABEL_5;
          if (objc_msgSend(v4, "fragments") <= self->_fragments)
          {
            objc_msgSend(v4, "suggestion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "length");
            -[SPSearchSuggestion suggestion](self, "suggestion");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "length");

            if (v14 >= v16)
            {
              objc_msgSend(v4, "suggestion");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "length");
              -[SPSearchSuggestion suggestion](self, "suggestion");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v18 > objc_msgSend(v19, "length");

              goto LABEL_6;
            }
            goto LABEL_5;
          }
        }
      }
    }
    goto LABEL_2;
  }
  if (objc_msgSend(v4, "hasUsedDate") && self->_hasUsedDate)
  {
    objc_msgSend(v4, "age");
    if (v9 >= self->_age)
    {
      objc_msgSend(v4, "age");
      v5 = v10 > self->_age;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "hasUsedDate"))
    v5 = -1;
  else
    v5 = 1;
LABEL_6:

  return v5;
}

- (id)suggestionsFeedbackData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
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
  _QWORD v39[22];
  _QWORD v40[24];

  v40[22] = *MEMORY[0x1E0C80C00];
  v39[0] = CFSTR("queryLen");
  SSRoundDouble(4, (double)-[SPSearchSuggestion queryLen](self, "queryLen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v3;
  v39[1] = CFSTR("queryFragmentCount");
  SSRoundDouble(4, (double)-[SPSearchSuggestion queryFragmentCount](self, "queryFragmentCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v4;
  v39[2] = CFSTR("queryCompletionCount");
  SSRoundUInt64(-[SPSearchSuggestion queryCompletionCount](self, "queryCompletionCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v5;
  v39[3] = CFSTR("len");
  -[SPSearchSuggestion suggestion](self, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSRoundDouble(4, (double)(unint64_t)objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v7;
  v39[4] = CFSTR("fragments");
  SSRoundDouble(4, (double)-[SPSearchSuggestion fragments](self, "fragments"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v8;
  v39[5] = CFSTR("age");
  -[SPSearchSuggestion age](self, "age");
  SSRoundDouble(4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v10;
  v39[6] = CFSTR("prob");
  -[SPSearchSuggestion prob](self, "prob");
  SSRoundDouble(2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v12;
  v39[7] = CFSTR("maxscore");
  SSRoundUInt64(-[SPSearchSuggestion maxscore](self, "maxscore"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v38;
  v39[8] = CFSTR("weight");
  SSRoundDouble(4, (double)-[SPSearchSuggestion weight](self, "weight"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v37;
  v39[9] = CFSTR("parentWeight");
  SSRoundDouble(4, (double)-[SPSearchSuggestion parentWeight](self, "parentWeight"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v36;
  v39[10] = CFSTR("rootWeight");
  SSRoundDouble(4, (double)-[SPSearchSuggestion rootWeight](self, "rootWeight"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v35;
  v39[11] = CFSTR("phraseScore");
  -[SPSearchSuggestion phraseScore](self, "phraseScore");
  SSRoundDouble(4, v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[11] = v34;
  v39[12] = CFSTR("punishment");
  -[SPSearchSuggestion punishment](self, "punishment");
  SSRoundDouble(4, v14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[12] = v33;
  v39[13] = CFSTR("compositeScore");
  -[SPSearchSuggestion compositeScore](self, "compositeScore");
  v16 = v15;
  v17 = 0.0;
  if (v16 != 1.79769313e308)
    -[SPSearchSuggestion compositeScore](self, "compositeScore", 0.0);
  SSRoundDouble(4, v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[13] = v32;
  v39[14] = CFSTR("completionType");
  SSRoundDouble(4, (double)-[SPSearchSuggestion completionType](self, "completionType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[14] = v31;
  v39[15] = CFSTR("prefixLen");
  SSRoundDouble(4, (double)-[SPSearchSuggestion prefixLen](self, "prefixLen"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[15] = v30;
  v39[16] = CFSTR("fieldWeight");
  -[SPSearchSuggestion fieldWeight](self, "fieldWeight");
  SSRoundDouble(4, v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[16] = v29;
  v39[17] = CFSTR("isSingleThread");
  if (-[SPSearchSuggestion isSingleThread](self, "isSingleThread"))
    v19 = &unk_1E6E97920;
  else
    v19 = &unk_1E6E97908;
  v40[17] = v19;
  v39[18] = CFSTR("hasUsedDate");
  if (-[SPSearchSuggestion hasUsedDate](self, "hasUsedDate"))
    v20 = &unk_1E6E97920;
  else
    v20 = &unk_1E6E97908;
  v40[18] = v20;
  v39[19] = CFSTR("isShortcut");
  if (-[SPSearchSuggestion isShortcut](self, "isShortcut"))
    v21 = &unk_1E6E97920;
  else
    v21 = &unk_1E6E97908;
  v40[19] = v21;
  v39[20] = CFSTR("hasMultipleResults");
  if (-[SPSearchSuggestion hasMultipleResults](self, "hasMultipleResults"))
    v22 = &unk_1E6E97920;
  else
    v22 = &unk_1E6E97908;
  v40[20] = v22;
  v39[21] = CFSTR("bundleIDs");
  -[SPSearchSuggestion bundleIDs](self, "bundleIDs");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = MEMORY[0x1E0C9AA60];
  if (v23)
    v25 = v23;
  v40[21] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v26, 2, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (NSArray)searchEntities
{
  void *v3;
  NSString *spotlightQuery;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (self->_spotlightQuery)
  {
    -[SPSearchSuggestion suggestion](self, "suggestion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    spotlightQuery = self->_spotlightQuery;
    -[SPSearchSuggestion bundleIDs](self, "bundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPSearchEntity searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:](SPSearchEntity, "searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:", v3, spotlightQuery, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SPSearchSuggestion suggestion](self, "suggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringFromIndex:", -[SPSearchSuggestion prefixLen](self, "prefixLen"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SSEscapedStringForSearchQuery(v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[SPSearchSuggestion suggestion](self, "suggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@\"cwd || _kMDItemLaunchString=\"%@\"cwd"), v3, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchSuggestion bundleIDs](self, "bundleIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPSearchEntity searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:](SPSearchEntity, "searchEntityWithSearchString:spotlightQueryString:preferredBundleIDs:", v5, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (unint64_t)queryLen
{
  return self->_queryLen;
}

- (void)setQueryLen:(unint64_t)a3
{
  self->_queryLen = a3;
}

- (unint64_t)queryFragmentCount
{
  return self->_queryFragmentCount;
}

- (void)setQueryFragmentCount:(unint64_t)a3
{
  self->_queryFragmentCount = a3;
}

- (unint64_t)queryCompletionCount
{
  return self->_queryCompletionCount;
}

- (void)setQueryCompletionCount:(unint64_t)a3
{
  self->_queryCompletionCount = a3;
}

- (unint64_t)fragments
{
  return self->_fragments;
}

- (void)setFragments:(unint64_t)a3
{
  self->_fragments = a3;
}

- (double)age
{
  return self->_age;
}

- (void)setAge:(double)a3
{
  self->_age = a3;
}

- (double)prob
{
  return self->_prob;
}

- (void)setProb:(double)a3
{
  self->_prob = a3;
}

- (unint64_t)maxscore
{
  return self->_maxscore;
}

- (void)setMaxscore:(unint64_t)a3
{
  self->_maxscore = a3;
}

- (int)weight
{
  return self->_weight;
}

- (void)setWeight:(int)a3
{
  self->_weight = a3;
}

- (int)parentWeight
{
  return self->_parentWeight;
}

- (void)setParentWeight:(int)a3
{
  self->_parentWeight = a3;
}

- (int)rootWeight
{
  return self->_rootWeight;
}

- (void)setRootWeight:(int)a3
{
  self->_rootWeight = a3;
}

- (double)phraseScore
{
  return self->_phraseScore;
}

- (void)setPhraseScore:(double)a3
{
  self->_phraseScore = a3;
}

- (double)punishment
{
  return self->_punishment;
}

- (void)setPunishment:(double)a3
{
  self->_punishment = a3;
}

- (double)compositeScore
{
  return self->_compositeScore;
}

- (void)setCompositeScore:(double)a3
{
  self->_compositeScore = a3;
}

- (int)completionType
{
  return self->_completionType;
}

- (void)setCompletionType:(int)a3
{
  self->_completionType = a3;
}

- (int)prefixLen
{
  return self->_prefixLen;
}

- (void)setPrefixLen:(int)a3
{
  self->_prefixLen = a3;
}

- (float)fieldWeight
{
  return self->_fieldWeight;
}

- (void)setFieldWeight:(float)a3
{
  self->_fieldWeight = a3;
}

- (BOOL)isSingleThread
{
  return self->_isSingleThread;
}

- (void)setIsSingleThread:(BOOL)a3
{
  self->_isSingleThread = a3;
}

- (BOOL)hasUsedDate
{
  return self->_hasUsedDate;
}

- (void)setHasUsedDate:(BOOL)a3
{
  self->_hasUsedDate = a3;
}

- (BOOL)isShortcut
{
  return self->_isShortcut;
}

- (void)setIsShortcut:(BOOL)a3
{
  self->_isShortcut = a3;
}

- (BOOL)hasMultipleResults
{
  return self->_hasMultipleResults;
}

- (void)setHasMultipleResults:(BOOL)a3
{
  self->_hasMultipleResults = a3;
}

- (NSArray)bundleIDs
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_terms, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_spotlightQuery, 0);
  objc_storeStrong((id *)&self->_completion, 0);
}

@end

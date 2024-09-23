@implementation TISceneTaxonomyGenerator

- (TISceneTaxonomyGenerator)init
{
  TISceneTaxonomyGenerator *v2;
  NSArray *notSupportingInputModes;
  NSArray *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)TISceneTaxonomyGenerator;
  v2 = -[TISceneTaxonomyGenerator init](&v13, sel_init);
  if (v2)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      notSupportingInputModes = v2->_notSupportingInputModes;
      v2->_notSupportingInputModes = (NSArray *)&unk_1EA1401C8;

      v4 = v2->_notSupportingInputModes;
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "languageCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = -[NSArray containsObject:](v4, "containsObject:", v6);

      if ((_DWORD)v4)
      {
        UnicodeScalar.__ivar_initializer();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "languageCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("%s The locale %@ is not supported. Sticker Suggestion would be disabled."), "-[TISceneTaxonomyGenerator init]", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v15 = v12;
          _os_log_error_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  return v2;
}

- (NLTagger)tagger
{
  NLTagger *tagger;
  id v4;
  void *v5;
  NLTagger *v6;
  NLTagger *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  tagger = self->_tagger;
  if (!tagger)
  {
    v4 = objc_alloc(MEMORY[0x1E0CCE168]);
    v9[0] = *MEMORY[0x1E0CCE0E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NLTagger *)objc_msgSend(v4, "initWithTagSchemes:", v5);
    v7 = self->_tagger;
    self->_tagger = v6;

    tagger = self->_tagger;
  }
  return tagger;
}

- (NSSet)taxonomyIdentifiers
{
  NSSet *taxonomyIdentifiers;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  taxonomyIdentifiers = self->_taxonomyIdentifiers;
  if (!taxonomyIdentifiers)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    TIGetStickerTaxonomyIdentifiers();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

    -[TISceneTaxonomyGenerator taxonomyIdentifiersAllowListSynonymExclusions](self, "taxonomyIdentifiersAllowListSynonymExclusions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v7);

    v8 = (NSSet *)objc_msgSend(v6, "copy");
    v9 = self->_taxonomyIdentifiers;
    self->_taxonomyIdentifiers = v8;

    taxonomyIdentifiers = self->_taxonomyIdentifiers;
    if (!taxonomyIdentifiers)
    {
      UnicodeScalar.__ivar_initializer();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s No taxonomy identifiers available"), "-[TISceneTaxonomyGenerator taxonomyIdentifiers]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      }
      taxonomyIdentifiers = self->_taxonomyIdentifiers;
    }
  }
  return taxonomyIdentifiers;
}

- (NSSet)taxonomyIdentifiersAllowListSynonymExclusions
{
  NSSet *taxonomyIdentifiersAllowListSynonymExclusions;
  id v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  taxonomyIdentifiersAllowListSynonymExclusions = self->_taxonomyIdentifiersAllowListSynonymExclusions;
  if (!taxonomyIdentifiersAllowListSynonymExclusions)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSSet *)objc_msgSend(v4, "initWithArray:", v5);
    v7 = self->_taxonomyIdentifiersAllowListSynonymExclusions;
    self->_taxonomyIdentifiersAllowListSynonymExclusions = v6;

    taxonomyIdentifiersAllowListSynonymExclusions = self->_taxonomyIdentifiersAllowListSynonymExclusions;
    if (!taxonomyIdentifiersAllowListSynonymExclusions)
    {
      UnicodeScalar.__ivar_initializer();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s StickerTaxonomyIdentifiersAllowListSynonymExclusions file does not have any identifiers. All the taxonomy should extend allow-list with their synonyms"), "-[TISceneTaxonomyGenerator taxonomyIdentifiersAllowListSynonymExclusions]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

      }
      taxonomyIdentifiersAllowListSynonymExclusions = self->_taxonomyIdentifiersAllowListSynonymExclusions;
    }
  }
  return taxonomyIdentifiersAllowListSynonymExclusions;
}

- (NSSet)phrases
{
  NSSet *phrases;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSSet *v29;
  NSSet *v30;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  phrases = self->_phrases;
  if (!phrases)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75250]), "initWithLatestTaxonomy");
    if (!v38)
    {

      return (NSSet *)0;
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[TISceneTaxonomyGenerator taxonomyIdentifiersAllowListSynonymExclusions](self, "taxonomyIdentifiersAllowListSynonymExclusions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v38, "nodeRefForSceneClassId:", objc_msgSend(v10, "unsignedIntValue"));
          PFSceneTaxonomyNodeLocalizedLabel();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[TISceneTaxonomyGenerator _generateTokens:](self, "_generateTokens:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v10, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v7);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[TISceneTaxonomyGenerator taxonomyIdentifiers](self, "taxonomyIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v38, "nodeRefForSceneClassId:", objc_msgSend(v15, "unsignedIntValue"));
          PFSceneTaxonomyNodeLocalizedLabel();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[TISceneTaxonomyGenerator _generateTokens:](self, "_generateTokens:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v15, v18);

          }
          PFSceneTaxonomyNodeLocalizedSynonyms();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "count"))
          {
            v36 = v16;
            v37 = j;
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            v35 = v19;
            v20 = v19;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v40;
              do
              {
                for (k = 0; k != v22; ++k)
                {
                  if (*(_QWORD *)v40 != v23)
                    objc_enumerationMutation(v20);
                  -[TISceneTaxonomyGenerator _generateTokens:](self, "_generateTokens:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "componentsJoinedByString:", CFSTR(" "));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKey:", v15, v26);

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
              }
              while (v22);
            }

            v16 = v36;
            j = v37;
            v19 = v35;
          }

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v34);
    }

    v27 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v30 = self->_phrases;
    self->_phrases = v29;

    phrases = self->_phrases;
  }
  return phrases;
}

- (id)generateSearchableQueriesForText:(id)a3 tokenize:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSArray *notSupportingInputModes;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "length"))
    goto LABEL_10;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    notSupportingInputModes = self->_notSupportingInputModes;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(notSupportingInputModes) = -[NSArray containsObject:](notSupportingInputModes, "containsObject:", v9);

    if ((_DWORD)notSupportingInputModes)
    {
      UnicodeScalar.__ivar_initializer();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "languageCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%s The locale %@ is not supported."), "-[TISceneTaxonomyGenerator generateSearchableQueriesForText:tokenize:]", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

LABEL_13:
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  -[TISceneTaxonomyGenerator phrases](self, "phrases");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    UnicodeScalar.__ivar_initializer();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Localized phrases haven't be set"), "-[TISceneTaxonomyGenerator generateSearchableQueriesForText:tokenize:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      goto LABEL_13;
    }
LABEL_9:

LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  -[TISceneTaxonomyGenerator _generateQueries:tokenize:](self, "_generateQueries:tokenize:", v6, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISceneTaxonomyGenerator _generateSearchableQueries:](self, "_generateSearchableQueries:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v17;
}

- (id)_generateQueryTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  -[TISceneTaxonomyGenerator tagger](self, "tagger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISceneTaxonomyGenerator tagger](self, "tagger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "length");
  v9 = *MEMORY[0x1E0CCE0E8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__TISceneTaxonomyGenerator__generateQueryTokens___block_invoke;
  v15[3] = &unk_1EA106CE8;
  v16 = v4;
  v10 = v6;
  v17 = v10;
  v11 = v4;
  objc_msgSend(v7, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v8, 0, v9, 6, v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

- (id)_generateTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  -[TISceneTaxonomyGenerator tagger](self, "tagger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISceneTaxonomyGenerator tagger](self, "tagger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "length");
  v9 = *MEMORY[0x1E0CCE0E8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__TISceneTaxonomyGenerator__generateTokens___block_invoke;
  v15[3] = &unk_1EA106CE8;
  v16 = v4;
  v10 = v6;
  v17 = v10;
  v11 = v4;
  objc_msgSend(v7, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v8, 0, v9, 6, v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

- (id)_extractTokensForStickerComputation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if ((unint64_t)objc_msgSend(v5, "count") >= 9)
    {
      objc_msgSend(v5, "subarrayWithRange:", objc_msgSend(v5, "count") - 8, 8);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v6;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_generateTokensFromInputString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TISceneTaxonomyGenerator phrases](self, "phrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TISceneTaxonomyGenerator _generateQueryTokens:](self, "_generateQueryTokens:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_generateQueries:(id)a3 tokenize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TIStickerQuery *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  TIStickerQuery *v19;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v4 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "_looksLikeEmailAddress") & 1) != 0 || (objc_msgSend(v9, "_looksLikeURL") & 1) != 0)
    {
      v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if (v4)
    {
      -[TISceneTaxonomyGenerator _generateTokensFromInputString:](self, "_generateTokensFromInputString:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "count"))
      {
        v10 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v22 = v9;
    }
    else
    {
      v22 = v9;
      v12 = -[TIStickerQuery initWithQueryString:]([TIStickerQuery alloc], "initWithQueryString:", v6);
      v23[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TISceneTaxonomyGenerator _extractTokensForStickerComputation:](self, "_extractTokensForStickerComputation:", v11, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      v15 = 0;
      do
      {
        objc_msgSend(v13, "subarrayWithRange:", v15, objc_msgSend(v13, "count") + v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "valueForKey:", CFSTR("queryString"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = -[TIStickerQuery initWithQueryString:]([TIStickerQuery alloc], "initWithQueryString:", v18);
        objc_msgSend(v10, "addObject:", v19);
        ++v15;

        --v14;
      }
      while (v15 < objc_msgSend(v13, "count"));
    }

    v11 = v21;
    v9 = v22;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (id)_generateSearchableQueries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__TISceneTaxonomyGenerator__generateSearchableQueries___block_invoke;
    v10[3] = &unk_1EA106D10;
    v10[4] = self;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)notSupportingInputModes
{
  return self->_notSupportingInputModes;
}

- (void)setNotSupportingInputModes:(id)a3
{
  objc_storeStrong((id *)&self->_notSupportingInputModes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notSupportingInputModes, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_taxonomyIdentifiersAllowListSynonymExclusions, 0);
  objc_storeStrong((id *)&self->_taxonomyIdentifiers, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
}

void __55__TISceneTaxonomyGenerator__generateSearchableQueries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "phrases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizedQueryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __44__TISceneTaxonomyGenerator__generateTokens___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedLowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decomposedStringWithCanonicalMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
}

void __49__TISceneTaxonomyGenerator__generateQueryTokens___block_invoke(uint64_t a1, uint64_t a2)
{
  TIStickerQuery *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[TIStickerQuery initWithQueryString:]([TIStickerQuery alloc], "initWithQueryString:", v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

@end

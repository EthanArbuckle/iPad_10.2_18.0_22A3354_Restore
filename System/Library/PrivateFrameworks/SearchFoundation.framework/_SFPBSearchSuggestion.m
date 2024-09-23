@implementation _SFPBSearchSuggestion

- (_SFPBSearchSuggestion)initWithFacade:(id)a3
{
  id v4;
  _SFPBSearchSuggestion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBGraphicalFloat *v12;
  _SFPBGraphicalFloat *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _SFPBSearchSuggestion *v21;
  void *v22;
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
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  _SFPBSearchSuggestion *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBSearchSuggestion init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "suggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "suggestion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setSuggestion:](v5, "setSuggestion:", v9);

    }
    objc_msgSend(v4, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "query");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setQuery:](v5, "setQuery:", v11);

    }
    if (objc_msgSend(v4, "hasScore"))
    {
      v12 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "score");
      v13 = -[_SFPBGraphicalFloat initWithCGFloat:](v12, "initWithCGFloat:");
      -[_SFPBSearchSuggestion setScore:](v5, "setScore:", v13);

    }
    if (objc_msgSend(v4, "hasType"))
      -[_SFPBSearchSuggestion setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "duplicateSuggestions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "duplicateSuggestions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBSearchSuggestion initWithFacade:]([_SFPBSearchSuggestion alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v18);
    }

    -[_SFPBSearchSuggestion setDuplicateSuggestions:](v5, "setDuplicateSuggestions:", v15);
    objc_msgSend(v4, "topicIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "topicIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setTopicIdentifier:](v5, "setTopicIdentifier:", v23);

    }
    objc_msgSend(v4, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setBundleIdentifier:](v5, "setBundleIdentifier:", v25);

    }
    if (objc_msgSend(v4, "hasPreviouslyEngaged"))
      -[_SFPBSearchSuggestion setPreviouslyEngaged:](v5, "setPreviouslyEngaged:", objc_msgSend(v4, "previouslyEngaged"));
    objc_msgSend(v4, "fbr");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "fbr");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setFbr:](v5, "setFbr:", v27);

    }
    objc_msgSend(v4, "scopedSearchApplicationBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "scopedSearchApplicationBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setScopedSearchApplicationBundleIdentifier:](v5, "setScopedSearchApplicationBundleIdentifier:", v29);

    }
    objc_msgSend(v4, "utteranceText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "utteranceText");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setUtteranceText:](v5, "setUtteranceText:", v31);

    }
    objc_msgSend(v4, "detailText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "detailText");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSearchSuggestion setDetailText:](v5, "setDetailText:", v33);

    }
    objc_msgSend(v4, "serverFeatures");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = 0;
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v37 = v35;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v47 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v37, "objectForKey:", v42, (_QWORD)v46);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
            objc_msgSend(v36, "setObject:forKey:", v43, v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v39);
    }

    -[_SFPBSearchSuggestion setServerFeatures:](v5, "setServerFeatures:", v36);
    v44 = v5;

  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)setSuggestion:(id)a3
{
  NSString *v4;
  NSString *suggestion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  suggestion = self->_suggestion;
  self->_suggestion = v4;

}

- (void)setQuery:(id)a3
{
  NSString *v4;
  NSString *query;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  query = self->_query;
  self->_query = v4;

}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setDuplicateSuggestions:(id)a3
{
  NSArray *v4;
  NSArray *duplicateSuggestions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  duplicateSuggestions = self->_duplicateSuggestions;
  self->_duplicateSuggestions = v4;

}

- (void)clearDuplicateSuggestions
{
  -[NSArray removeAllObjects](self->_duplicateSuggestions, "removeAllObjects");
}

- (void)addDuplicateSuggestions:(id)a3
{
  id v4;
  NSArray *duplicateSuggestions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  duplicateSuggestions = self->_duplicateSuggestions;
  v8 = v4;
  if (!duplicateSuggestions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_duplicateSuggestions;
    self->_duplicateSuggestions = v6;

    v4 = v8;
    duplicateSuggestions = self->_duplicateSuggestions;
  }
  -[NSArray addObject:](duplicateSuggestions, "addObject:", v4);

}

- (unint64_t)duplicateSuggestionsCount
{
  return -[NSArray count](self->_duplicateSuggestions, "count");
}

- (id)duplicateSuggestionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_duplicateSuggestions, "objectAtIndexedSubscript:", a3);
}

- (void)setTopicIdentifier:(id)a3
{
  NSString *v4;
  NSString *topicIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  topicIdentifier = self->_topicIdentifier;
  self->_topicIdentifier = v4;

}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (void)setPreviouslyEngaged:(BOOL)a3
{
  self->_previouslyEngaged = a3;
}

- (void)setFbr:(id)a3
{
  NSString *v4;
  NSString *fbr;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fbr = self->_fbr;
  self->_fbr = v4;

}

- (void)setScopedSearchApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *scopedSearchApplicationBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  scopedSearchApplicationBundleIdentifier = self->_scopedSearchApplicationBundleIdentifier;
  self->_scopedSearchApplicationBundleIdentifier = v4;

}

- (void)setUtteranceText:(id)a3
{
  NSString *v4;
  NSString *utteranceText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  utteranceText = self->_utteranceText;
  self->_utteranceText = v4;

}

- (void)setDetailText:(id)a3
{
  NSString *v4;
  NSString *detailText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  detailText = self->_detailText;
  self->_detailText = v4;

}

- (void)setServerFeatures:(id)a3
{
  NSDictionary *v4;
  NSDictionary *serverFeatures;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  serverFeatures = self->_serverFeatures;
  self->_serverFeatures = v4;

}

- (BOOL)getServerFeatures:(double *)a3 forKey:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[NSDictionary objectForKeyedSubscript:](self->_serverFeatures, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 && v5)
  {
    objc_msgSend(v5, "doubleValue");
    *(_QWORD *)a3 = v7;
  }

  return v6 != 0;
}

- (void)setServerFeatures:(double)a3 forKey:(id)a4
{
  NSDictionary *serverFeatures;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;
  id v10;

  v10 = a4;
  serverFeatures = self->_serverFeatures;
  if (!serverFeatures)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_serverFeatures;
    self->_serverFeatures = v7;

    serverFeatures = self->_serverFeatures;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKey:](serverFeatures, "setObject:forKey:", v9, v10);

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSearchSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBSearchSuggestion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion suggestion](self, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion score](self, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBSearchSuggestion type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  -[_SFPBSearchSuggestion topicIdentifier](self, "topicIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  if (-[_SFPBSearchSuggestion previouslyEngaged](self, "previouslyEngaged"))
    PBDataWriterWriteBOOLField();
  -[_SFPBSearchSuggestion fbr](self, "fbr");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion utteranceText](self, "utteranceText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion detailText](self, "detailText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteStringField();

  -[_SFPBSearchSuggestion serverFeatures](self, "serverFeatures");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = self->_serverFeatures;
  v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        PBDataWriterPlaceMark();
        PBDataWriterWriteStringField();
        objc_msgSend(v20, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        PBDataWriterWriteDoubleField();

        PBDataWriterRecallMark();
      }
      v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int type;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int previouslyEngaged;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  BOOL v69;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_64;
  -[_SFPBSearchSuggestion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSearchSuggestion identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion suggestion](self, "suggestion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBSearchSuggestion suggestion](self, "suggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion query](self, "query");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBSearchSuggestion query](self, "query");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion score](self, "score");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion score](self, "score");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBSearchSuggestion score](self, "score");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "score");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_64;
  }
  else
  {

  }
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_64;
  -[_SFPBSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duplicateSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duplicateSuggestions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion topicIdentifier](self, "topicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion topicIdentifier](self, "topicIdentifier");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBSearchSuggestion topicIdentifier](self, "topicIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topicIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_SFPBSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_64;
  }
  else
  {

  }
  previouslyEngaged = self->_previouslyEngaged;
  if (previouslyEngaged != objc_msgSend(v4, "previouslyEngaged"))
    goto LABEL_64;
  -[_SFPBSearchSuggestion fbr](self, "fbr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion fbr](self, "fbr");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[_SFPBSearchSuggestion fbr](self, "fbr");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fbr");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedSearchApplicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_SFPBSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopedSearchApplicationBundleIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion utteranceText](self, "utteranceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utteranceText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion utteranceText](self, "utteranceText");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[_SFPBSearchSuggestion utteranceText](self, "utteranceText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utteranceText");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion detailText](self, "detailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_63;
  -[_SFPBSearchSuggestion detailText](self, "detailText");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[_SFPBSearchSuggestion detailText](self, "detailText");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "detailText");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_64;
  }
  else
  {

  }
  -[_SFPBSearchSuggestion serverFeatures](self, "serverFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_63:

    goto LABEL_64;
  }
  -[_SFPBSearchSuggestion serverFeatures](self, "serverFeatures");
  v64 = objc_claimAutoreleasedReturnValue();
  if (!v64)
  {

LABEL_67:
    v69 = 1;
    goto LABEL_65;
  }
  v65 = (void *)v64;
  -[_SFPBSearchSuggestion serverFeatures](self, "serverFeatures");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverFeatures");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v66, "isEqual:", v67);

  if ((v68 & 1) != 0)
    goto LABEL_67;
LABEL_64:
  v69 = 0;
LABEL_65:

  return v69;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_suggestion, "hash");
  v5 = -[NSString hash](self->_query, "hash");
  v6 = -[_SFPBGraphicalFloat hash](self->_score, "hash");
  v7 = 2654435761 * self->_type;
  v8 = -[NSArray hash](self->_duplicateSuggestions, "hash");
  v9 = -[NSString hash](self->_topicIdentifier, "hash");
  v10 = -[NSString hash](self->_bundleIdentifier, "hash");
  if (self->_previouslyEngaged)
    v11 = 2654435761;
  else
    v11 = 0;
  v12 = v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
  v13 = v10 ^ v11 ^ -[NSString hash](self->_fbr, "hash");
  v14 = v13 ^ -[NSString hash](self->_scopedSearchApplicationBundleIdentifier, "hash");
  v15 = v12 ^ v14 ^ -[NSString hash](self->_utteranceText, "hash");
  v16 = -[NSString hash](self->_detailText, "hash");
  return v15 ^ v16 ^ -[NSDictionary hash](self->_serverFeatures, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleIdentifier)
  {
    -[_SFPBSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleIdentifier"));

  }
  if (self->_detailText)
  {
    -[_SFPBSearchSuggestion detailText](self, "detailText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("detailText"));

  }
  if (-[NSArray count](self->_duplicateSuggestions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v9 = self->_duplicateSuggestions;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v50 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("duplicateSuggestions"));
  }
  if (self->_fbr)
  {
    -[_SFPBSearchSuggestion fbr](self, "fbr");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("fbr"));

  }
  if (self->_identifier)
  {
    -[_SFPBSearchSuggestion identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("identifier"));

  }
  if (self->_previouslyEngaged)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBSearchSuggestion previouslyEngaged](self, "previouslyEngaged"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("previouslyEngaged"));

  }
  if (self->_query)
  {
    -[_SFPBSearchSuggestion query](self, "query");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("query"));

  }
  if (self->_scopedSearchApplicationBundleIdentifier)
  {
    -[_SFPBSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("scopedSearchApplicationBundleIdentifier"));

  }
  if (self->_score)
  {
    -[_SFPBSearchSuggestion score](self, "score");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("score"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("score"));

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v29 = self->_serverFeatures;
  v30 = -[NSDictionary countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        -[NSDictionary objectForKeyedSubscript:](self->_serverFeatures, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, v34);

      }
      v31 = -[NSDictionary countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v31);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("serverFeatures"));
  if (self->_suggestion)
  {
    -[_SFPBSearchSuggestion suggestion](self, "suggestion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("suggestion"));

  }
  if (self->_topicIdentifier)
  {
    -[_SFPBSearchSuggestion topicIdentifier](self, "topicIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("topicIdentifier"));

  }
  if (self->_type)
  {
    v40 = -[_SFPBSearchSuggestion type](self, "type");
    if (v40 >= 0x11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = *(&off_1E4041FF0 + v40);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("type"));

  }
  if (self->_utteranceText)
  {
    -[_SFPBSearchSuggestion utteranceText](self, "utteranceText");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("utteranceText"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSearchSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBSearchSuggestion)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSearchSuggestion *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBSearchSuggestion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSearchSuggestion)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSearchSuggestion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBGraphicalFloat *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  _SFPBSearchSuggestion *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSDictionary *serverFeatures;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  _SFPBSearchSuggestion *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)_SFPBSearchSuggestion;
  v5 = -[_SFPBSearchSuggestion init](&v73, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBSearchSuggestion setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBSearchSuggestion setSuggestion:](v5, "setSuggestion:", v9);

    }
    v58 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("query"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBSearchSuggestion setQuery:](v5, "setQuery:", v11);

    }
    v57 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v12);
      -[_SFPBSearchSuggestion setScore:](v5, "setScore:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSearchSuggestion setType:](v5, "setType:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duplicateSuggestions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v15;
    v56 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v70 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[_SFPBSearchSuggestion initWithDictionary:]([_SFPBSearchSuggestion alloc], "initWithDictionary:", v21);
              -[_SFPBSearchSuggestion addDuplicateSuggestions:](v5, "addDuplicateSuggestions:", v22);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        }
        while (v18);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topicIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(v23, "copy");
      -[_SFPBSearchSuggestion setTopicIdentifier:](v5, "setTopicIdentifier:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (void *)objc_msgSend(v25, "copy");
      -[_SFPBSearchSuggestion setBundleIdentifier:](v5, "setBundleIdentifier:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previouslyEngaged"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSearchSuggestion setPreviouslyEngaged:](v5, "setPreviouslyEngaged:", objc_msgSend(v27, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fbr"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v23;
      v30 = (void *)objc_msgSend(v61, "copy");
      -[_SFPBSearchSuggestion setFbr:](v5, "setFbr:", v30);

      v23 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scopedSearchApplicationBundleIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = (void *)v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v25;
      v33 = (void *)objc_msgSend(v60, "copy");
      -[_SFPBSearchSuggestion setScopedSearchApplicationBundleIdentifier:](v5, "setScopedSearchApplicationBundleIdentifier:", v33);

      v25 = v32;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceText"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = objc_msgSend(v34, "copy");
      v36 = v34;
      v37 = v27;
      v38 = (void *)v35;
      -[_SFPBSearchSuggestion setUtteranceText:](v5, "setUtteranceText:", v35);

      v27 = v37;
      v34 = v36;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detailText"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = (void *)objc_msgSend(v39, "copy");
      -[_SFPBSearchSuggestion setDetailText:](v5, "setDetailText:", v40);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverFeatures"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = v34;
      v54 = v27;
      v55 = v25;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v42 = objc_claimAutoreleasedReturnValue();
      serverFeatures = v5->_serverFeatures;
      v5->_serverFeatures = (NSDictionary *)v42;

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v44 = v41;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v46; ++j)
          {
            if (*(_QWORD *)v66 != v47)
              objc_enumerationMutation(v44);
            v49 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
            objc_msgSend(v44, "objectForKeyedSubscript:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKey:](v5->_serverFeatures, "setObject:forKey:", v50, v49);

          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        }
        while (v46);
      }

      v12 = v56;
      v27 = v54;
      v25 = v55;
      v34 = v53;
    }
    v51 = v5;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (NSString)query
{
  return self->_query;
}

- (_SFPBGraphicalFloat)score
{
  return self->_score;
}

- (int)type
{
  return self->_type;
}

- (NSArray)duplicateSuggestions
{
  return self->_duplicateSuggestions;
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)previouslyEngaged
{
  return self->_previouslyEngaged;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (NSString)scopedSearchApplicationBundleIdentifier
{
  return self->_scopedSearchApplicationBundleIdentifier;
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_utteranceText, 0);
  objc_storeStrong((id *)&self->_scopedSearchApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
  objc_storeStrong((id *)&self->_duplicateSuggestions, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

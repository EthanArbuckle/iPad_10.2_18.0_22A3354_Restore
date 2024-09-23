@implementation PPTopicQuery

- (BOOL)overrideDecayRate
{
  return 0;
}

- (PPTopicQuery)init
{
  PPTopicQuery *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPTopicQuery;
  result = -[PPTopicQuery init](&v3, sel_init);
  if (result)
  {
    result->_limit = -1;
    result->_minimumComponentCount = 0;
    *(_WORD *)&result->_scoreWithBiases = 1;
    result->_scoreWithCalibration = 0;
    result->_deviceFilter = 0;
    result->_decayRate = -1.0;
  }
  return result;
}

- (PPTopicQuery)initWithCoder:(id)a3
{
  id v4;
  PPTopicQuery *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDate *fromDate;
  uint64_t v16;
  NSDate *toDate;
  uint64_t v18;
  NSDate *scoringDate;
  uint64_t v20;
  NSSet *matchingSourceBundleIds;
  uint64_t v22;
  NSSet *excludingSourceBundleIds;
  uint64_t v24;
  NSSet *matchingGroupIds;
  uint64_t v26;
  NSSet *matchingDocumentIds;
  double v28;
  uint64_t v29;
  NSSet *matchingTopicIds;
  uint64_t v31;
  NSSet *matchingMappedTopicIds;
  uint64_t v33;
  NSString *matchingTopicTrie;
  uint64_t v35;
  NSSet *matchingAlgorithms;
  uint64_t v37;
  NSSet *excludingAlgorithms;
  uint64_t v39;
  NSString *matchingContactHandle;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PPTopicQuery;
  v5 = -[PPTopicQuery init](&v42, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D7805AC]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x18D7805AC]();
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v10);
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lmt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fdt"));
    v14 = objc_claimAutoreleasedReturnValue();
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tdt"));
    v16 = objc_claimAutoreleasedReturnValue();
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdt"));
    v18 = objc_claimAutoreleasedReturnValue();
    scoringDate = v5->_scoringDate;
    v5->_scoringDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mbdl"));
    v20 = objc_claimAutoreleasedReturnValue();
    matchingSourceBundleIds = v5->_matchingSourceBundleIds;
    v5->_matchingSourceBundleIds = (NSSet *)v20;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("ebdl"));
    v22 = objc_claimAutoreleasedReturnValue();
    excludingSourceBundleIds = v5->_excludingSourceBundleIds;
    v5->_excludingSourceBundleIds = (NSSet *)v22;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("gid"));
    v24 = objc_claimAutoreleasedReturnValue();
    matchingGroupIds = v5->_matchingGroupIds;
    v5->_matchingGroupIds = (NSSet *)v24;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mdid"));
    v26 = objc_claimAutoreleasedReturnValue();
    matchingDocumentIds = v5->_matchingDocumentIds;
    v5->_matchingDocumentIds = (NSSet *)v26;

    v5->_deviceFilter = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("dflt"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dr"));
    v5->_decayRate = v28;
    v5->_scoreWithBiases = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sbias"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mids"));
    v29 = objc_claimAutoreleasedReturnValue();
    matchingTopicIds = v5->_matchingTopicIds;
    v5->_matchingTopicIds = (NSSet *)v29;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mmids"));
    v31 = objc_claimAutoreleasedReturnValue();
    matchingMappedTopicIds = v5->_matchingMappedTopicIds;
    v5->_matchingMappedTopicIds = (NSSet *)v31;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("trie"));
    v33 = objc_claimAutoreleasedReturnValue();
    matchingTopicTrie = v5->_matchingTopicTrie;
    v5->_matchingTopicTrie = (NSString *)v33;

    v5->_scoreWithCalibration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("scali"));
    v5->_minimumComponentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mcc"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("ma"));
    v35 = objc_claimAutoreleasedReturnValue();
    matchingAlgorithms = v5->_matchingAlgorithms;
    v5->_matchingAlgorithms = (NSSet *)v35;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("ea"));
    v37 = objc_claimAutoreleasedReturnValue();
    excludingAlgorithms = v5->_excludingAlgorithms;
    v5->_excludingAlgorithms = (NSSet *)v37;

    v5->_scoreWithStrictFiltering = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ssf"));
    v5->_excludeWithoutSentiment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("exnonsnt"));
    v5->_orderByIdentifier = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("obi"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mch"));
    v39 = objc_claimAutoreleasedReturnValue();
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v39;

    v5->_filterByRelevanceDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fbrd"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t limit;
  id v5;

  limit = self->_limit;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", limit, CFSTR("lmt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fromDate, CFSTR("fdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toDate, CFSTR("tdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoringDate, CFSTR("sdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingSourceBundleIds, CFSTR("mbdl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludingSourceBundleIds, CFSTR("ebdl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingGroupIds, CFSTR("gid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingDocumentIds, CFSTR("mdid"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_deviceFilter), CFSTR("dflt"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dr"), self->_decayRate);
  objc_msgSend(v5, "encodeBool:forKey:", self->_scoreWithBiases, CFSTR("sbias"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingTopicIds, CFSTR("mids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingMappedTopicIds, CFSTR("mmids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingTopicTrie, CFSTR("trie"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_scoreWithCalibration, CFSTR("scali"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minimumComponentCount, CFSTR("mcc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingAlgorithms, CFSTR("ma"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludingAlgorithms, CFSTR("ea"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_scoreWithStrictFiltering, CFSTR("ssf"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_excludeWithoutSentiment, CFSTR("exnonsnt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_orderByIdentifier, CFSTR("obi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingContactHandle, CFSTR("mch"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_filterByRelevanceDate, CFSTR("fbrd"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setLimit:", self->_limit);
    objc_msgSend(v5, "setFromDate:", self->_fromDate);
    objc_msgSend(v5, "setToDate:", self->_toDate);
    objc_msgSend(v5, "setScoringDate:", self->_scoringDate);
    objc_msgSend(v5, "setMatchingSourceBundleIds:", self->_matchingSourceBundleIds);
    objc_msgSend(v5, "setExcludingSourceBundleIds:", self->_excludingSourceBundleIds);
    objc_msgSend(v5, "setMatchingGroupIds:", self->_matchingGroupIds);
    objc_msgSend(v5, "setMatchingDocumentIds:", self->_matchingDocumentIds);
    objc_msgSend(v5, "setDeviceFilter:", self->_deviceFilter);
    objc_msgSend(v5, "setDecayRate:", self->_decayRate);
    objc_msgSend(v5, "setScoreWithBiases:", self->_scoreWithBiases);
    objc_msgSend(v5, "setMatchingTopicIds:", self->_matchingTopicIds);
    objc_msgSend(v5, "setMatchingMappedTopicIds:", self->_matchingMappedTopicIds);
    objc_msgSend(v5, "setMatchingTopicTrie:", self->_matchingTopicTrie);
    objc_msgSend(v5, "setScoreWithCalibration:", self->_scoreWithCalibration);
    objc_msgSend(v5, "setMinimumComponentCount:", self->_minimumComponentCount);
    objc_msgSend(v5, "setMatchingAlgorithms:", self->_matchingAlgorithms);
    objc_msgSend(v5, "setExcludingAlgorithms:", self->_excludingAlgorithms);
    objc_msgSend(v5, "setScoreWithStrictFiltering:", self->_scoreWithStrictFiltering);
    objc_msgSend(v5, "setExcludeWithoutSentiment:", self->_excludeWithoutSentiment);
    objc_msgSend(v5, "setOrderByIdentifier:", self->_orderByIdentifier);
    objc_msgSend(v5, "setMatchingContactHandle:", self->_matchingContactHandle);
    objc_msgSend(v5, "setFilterByRelevanceDate:", self->_filterByRelevanceDate);
  }
  return v5;
}

- (BOOL)isEqualToTopicQuery:(id)a3
{
  PPTopicQuery *v4;
  PPTopicQuery *v5;
  unint64_t limit;
  NSSet *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  unint64_t deviceFilter;
  double decayRate;
  double v24;
  _BOOL4 scoreWithBiases;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 scoreWithStrictFiltering;
  _BOOL4 excludeWithoutSentiment;
  _BOOL4 filterByRelevanceDate;
  BOOL v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  int v36;

  v4 = (PPTopicQuery *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v32 = 1;
    goto LABEL_57;
  }
  if (!v4)
    goto LABEL_56;
  limit = self->_limit;
  if (limit != -[PPTopicQuery limit](v4, "limit"))
    goto LABEL_56;
  v7 = self->_fromDate;
  -[PPTopicQuery fromDate](v5, "fromDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v8)
  {
    v9 = (void *)v8;
    if (!v7 || !v8)
      goto LABEL_55;
    v10 = -[NSSet isEqualToDate:](v7, "isEqualToDate:", v8);

    if (!v10)
      goto LABEL_56;
  }
  v7 = self->_toDate;
  -[PPTopicQuery toDate](v5, "toDate");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v11)
  {
    v9 = (void *)v11;
    if (!v7 || !v11)
      goto LABEL_55;
    v12 = -[NSSet isEqualToDate:](v7, "isEqualToDate:", v11);

    if (!v12)
      goto LABEL_56;
  }
  v7 = self->_scoringDate;
  -[PPTopicQuery scoringDate](v5, "scoringDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v13)
  {
    v9 = (void *)v13;
    if (!v7 || !v13)
      goto LABEL_55;
    v14 = -[NSSet isEqualToDate:](v7, "isEqualToDate:", v13);

    if (!v14)
      goto LABEL_56;
  }
  v7 = self->_matchingSourceBundleIds;
  -[PPTopicQuery matchingSourceBundleIds](v5, "matchingSourceBundleIds");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v15)
  {
    v9 = (void *)v15;
    if (!v7 || !v15)
      goto LABEL_55;
    v16 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v15);

    if (!v16)
      goto LABEL_56;
  }
  v7 = self->_excludingSourceBundleIds;
  -[PPTopicQuery excludingSourceBundleIds](v5, "excludingSourceBundleIds");
  v17 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v17)
  {
    v9 = (void *)v17;
    if (!v7 || !v17)
      goto LABEL_55;
    v18 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v17);

    if (!v18)
      goto LABEL_56;
  }
  v7 = self->_matchingGroupIds;
  -[PPTopicQuery matchingGroupIds](v5, "matchingGroupIds");
  v19 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v19)
  {
    v9 = (void *)v19;
    if (!v7 || !v19)
      goto LABEL_55;
    v20 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v19);

    if (!v20)
      goto LABEL_56;
  }
  v7 = self->_matchingDocumentIds;
  -[PPTopicQuery matchingDocumentIds](v5, "matchingDocumentIds");
  v21 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v21)
  {
    v9 = (void *)v21;
    if (!v7 || !v21)
      goto LABEL_55;
    v33 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v21);

    if (!v33)
      goto LABEL_56;
  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter != -[PPTopicQuery deviceFilter](v5, "deviceFilter"))
    goto LABEL_56;
  decayRate = self->_decayRate;
  -[PPTopicQuery decayRate](v5, "decayRate");
  if (decayRate != v24)
    goto LABEL_56;
  scoreWithBiases = self->_scoreWithBiases;
  if (scoreWithBiases != -[PPTopicQuery scoreWithBiases](v5, "scoreWithBiases"))
    goto LABEL_56;
  v7 = self->_matchingTopicIds;
  -[PPTopicQuery matchingTopicIds](v5, "matchingTopicIds");
  v26 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v26)
  {
    v9 = (void *)v26;
    if (!v7 || !v26)
      goto LABEL_55;
    v34 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v26);

    if (!v34)
      goto LABEL_56;
  }
  v7 = self->_matchingMappedTopicIds;
  -[PPTopicQuery matchingMappedTopicIds](v5, "matchingMappedTopicIds");
  v27 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v27)
  {
    v9 = (void *)v27;
    if (!v7 || !v27)
      goto LABEL_55;
    v35 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v27);

    if (!v35)
      goto LABEL_56;
  }
  v7 = self->_matchingContactHandle;
  -[PPTopicQuery matchingContactHandle](v5, "matchingContactHandle");
  v28 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v28)
  {
    v9 = (void *)v28;
    if (v7 && v28)
    {
      v36 = -[NSSet isEqualToString:](v7, "isEqualToString:", v28);

      if (v36)
        goto LABEL_35;
LABEL_56:
      v32 = 0;
      goto LABEL_57;
    }
LABEL_55:

    goto LABEL_56;
  }
LABEL_35:
  scoreWithStrictFiltering = self->_scoreWithStrictFiltering;
  if (scoreWithStrictFiltering != -[PPTopicQuery scoreWithStrictFiltering](v5, "scoreWithStrictFiltering"))
    goto LABEL_56;
  excludeWithoutSentiment = self->_excludeWithoutSentiment;
  if (excludeWithoutSentiment != -[PPTopicQuery excludeWithoutSentiment](v5, "excludeWithoutSentiment"))
    goto LABEL_56;
  filterByRelevanceDate = self->_filterByRelevanceDate;
  v32 = filterByRelevanceDate == -[PPTopicQuery filterByRelevanceDate](v5, "filterByRelevanceDate");
LABEL_57:

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  PPTopicQuery *v4;
  BOOL v5;

  v4 = (PPTopicQuery *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PPTopicQuery isEqualToTopicQuery:](self, "isEqualToTopicQuery:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSSet *matchingGroupIds;
  NSSet *matchingDocumentIds;
  void *v7;
  const __CFString *v8;
  NSUInteger v9;
  NSUInteger v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;

  objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_matchingAlgorithms);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_excludingAlgorithms);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19 = *(_OWORD *)&self->_toDate;
  v20 = *(_OWORD *)&self->_limit;
  v18 = *(_OWORD *)&self->_matchingSourceBundleIds;
  matchingGroupIds = self->_matchingGroupIds;
  matchingDocumentIds = self->_matchingDocumentIds;
  +[PPEnumTypes stringForDeviceFilter:](PPEnumTypes, "stringForDeviceFilter:", self->_deviceFilter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_scoreWithBiases)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = -[NSSet count](self->_matchingTopicIds, "count");
  v10 = -[NSSet count](self->_matchingMappedTopicIds, "count");
  if (self->_scoreWithCalibration)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_scoreWithStrictFiltering)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_excludeWithoutSentiment)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_orderByIdentifier)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (self->_filterByRelevanceDate)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("<PPTopicQuery l:%tu, d:%@-%@ sd:%@ mid:%@ eid:%@ gid:%@ mdid:%@ df:%@ sb:%@ mti:%tu mmti:%tu tri:%@ sc:%@ mcc:%tu ma:%@ ea:%@ ssf:%@ ews:%@ obi:%@ mch:%@ fbrd:%@>"), v20, v19, v18, matchingGroupIds, matchingDocumentIds, v7, v8, v9, v10, self->_matchingTopicTrie, v11, self->_minimumComponentCount, v3, v4, v12, v13,
                  v14,
                  self->_matchingContactHandle,
                  v15);

  return v16;
}

- (id)customizedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *matchingSourceBundleIds;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSSet *excludingSourceBundleIds;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSSet *matchingGroupIds;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSSet *matchingDocumentIds;
  unint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSSet *matchingAlgorithms;
  unint64_t v38;
  id v39;
  void *v40;
  void *v41;
  NSSet *excludingAlgorithms;
  unint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;

  v3 = (void *)objc_opt_new();
  if (self->_limit != -1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("limit:%tu"), self->_limit);
    objc_msgSend(v3, "addObject:", v4);

  }
  if (self->_fromDate)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fromDate:'%@'"), self->_fromDate);
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_toDate)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("toDate:'%@'"), self->_toDate);
    objc_msgSend(v3, "addObject:", v6);

  }
  if (self->_scoringDate)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("scoringDate:'%@'"), self->_scoringDate);
    objc_msgSend(v3, "addObject:", v7);

  }
  matchingSourceBundleIds = self->_matchingSourceBundleIds;
  if (matchingSourceBundleIds)
  {
    v9 = -[NSSet count](matchingSourceBundleIds, "count");
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v9 < 0xB)
      v11 = objc_msgSend(v10, "initWithFormat:", CFSTR("matchingSourceBundleIds:%@"), self->_matchingSourceBundleIds);
    else
      v11 = objc_msgSend(v10, "initWithFormat:", CFSTR("matchingSourceBundleIds.count:%tu"), -[NSSet count](self->_matchingSourceBundleIds, "count"));
    v12 = (void *)v11;
    objc_msgSend(v3, "addObject:", v11);

  }
  excludingSourceBundleIds = self->_excludingSourceBundleIds;
  if (excludingSourceBundleIds)
  {
    v14 = -[NSSet count](excludingSourceBundleIds, "count");
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v14 < 0xB)
      v16 = objc_msgSend(v15, "initWithFormat:", CFSTR("excludingSourceBundleIds:%@"), self->_excludingSourceBundleIds);
    else
      v16 = objc_msgSend(v15, "initWithFormat:", CFSTR("excludingSourceBundleIds.count:%tu"), -[NSSet count](self->_excludingSourceBundleIds, "count"));
    v17 = (void *)v16;
    objc_msgSend(v3, "addObject:", v16);

  }
  matchingGroupIds = self->_matchingGroupIds;
  if (matchingGroupIds)
  {
    v19 = -[NSSet count](matchingGroupIds, "count");
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v19 < 0xB)
      v21 = objc_msgSend(v20, "initWithFormat:", CFSTR("matchingGroupIds:%@"), self->_matchingGroupIds);
    else
      v21 = objc_msgSend(v20, "initWithFormat:", CFSTR("matchingGroupIds.count:%tu"), -[NSSet count](self->_matchingGroupIds, "count"));
    v22 = (void *)v21;
    objc_msgSend(v3, "addObject:", v21);

  }
  matchingDocumentIds = self->_matchingDocumentIds;
  if (matchingDocumentIds)
  {
    v24 = -[NSSet count](matchingDocumentIds, "count");
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v24 < 0xB)
      v26 = objc_msgSend(v25, "initWithFormat:", CFSTR("matchingDocumentIds:%@"), self->_matchingDocumentIds);
    else
      v26 = objc_msgSend(v25, "initWithFormat:", CFSTR("matchingDocumentIds.count:%tu"), -[NSSet count](self->_matchingDocumentIds, "count"));
    v27 = (void *)v26;
    objc_msgSend(v3, "addObject:", v26);

  }
  if (self->_deviceFilter)
  {
    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[PPEnumTypes stringForDeviceFilter:](PPEnumTypes, "stringForDeviceFilter:", self->_deviceFilter);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("deviceFilter:%@"), v29);
    objc_msgSend(v3, "addObject:", v30);

  }
  if (self->_decayRate != -1.0)
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("decayRate:%f"), *(_QWORD *)&self->_decayRate);
    objc_msgSend(v3, "addObject:", v31);

  }
  if (!self->_scoreWithBiases)
    objc_msgSend(v3, "addObject:", CFSTR("scoreWithBiases:NO"));
  if (self->_matchingTopicIds)
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingTopicIds.count:%tu"), -[NSSet count](self->_matchingTopicIds, "count"));
    objc_msgSend(v3, "addObject:", v32);

  }
  if (self->_matchingMappedTopicIds)
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingMappedTopicIds.count:%tu"), -[NSSet count](self->_matchingMappedTopicIds, "count"));
    objc_msgSend(v3, "addObject:", v33);

  }
  if (self->_matchingContactHandle)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingContactHandle.length:%tu"), -[NSString length](self->_matchingContactHandle, "length"));
    objc_msgSend(v3, "addObject:", v34);

  }
  if (self->_matchingTopicTrie)
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingTopicTrie:%@"), self->_matchingTopicTrie);
    objc_msgSend(v3, "addObject:", v35);

  }
  if (self->_minimumComponentCount)
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("minimumComponentCount:%tu"), self->_minimumComponentCount);
    objc_msgSend(v3, "addObject:", v36);

  }
  matchingAlgorithms = self->_matchingAlgorithms;
  if (matchingAlgorithms)
  {
    v38 = -[NSSet count](matchingAlgorithms, "count");
    v39 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v38 < 0xB)
    {
      objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_matchingAlgorithms);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("matchingAlgorithms:%@"), v40);
      objc_msgSend(v3, "addObject:", v41);

    }
    else
    {
      v40 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("matchingAlgorithms.count:%tu"), -[NSSet count](self->_matchingAlgorithms, "count"));
      objc_msgSend(v3, "addObject:", v40);
    }

  }
  excludingAlgorithms = self->_excludingAlgorithms;
  if (excludingAlgorithms)
  {
    v43 = -[NSSet count](excludingAlgorithms, "count");
    v44 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v43 < 0xB)
    {
      objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_excludingAlgorithms);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("excludingAlgorithms:%@"), v45);
      objc_msgSend(v3, "addObject:", v46);

    }
    else
    {
      v45 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("excludingAlgorithms.count:%tu"), -[NSSet count](self->_excludingAlgorithms, "count"));
      objc_msgSend(v3, "addObject:", v45);
    }

  }
  if (self->_scoreWithStrictFiltering)
    objc_msgSend(v3, "addObject:", CFSTR("scoreWithStrictFiltering:YES"));
  if (self->_excludeWithoutSentiment)
    objc_msgSend(v3, "addObject:", CFSTR("excludeWithoutSentiment:YES"));
  if (self->_orderByIdentifier)
    objc_msgSend(v3, "addObject:", CFSTR("orderByIdentifier:YES"));
  if (self->_filterByRelevanceDate)
    objc_msgSend(v3, "addObject:", CFSTR("filterByRelevanceDate:YES"));
  objc_msgSend(v3, "_pas_componentsJoinedByString:", CFSTR(" "));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  objc_storeStrong((id *)&self->_fromDate, a3);
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  objc_storeStrong((id *)&self->_toDate, a3);
}

- (NSDate)scoringDate
{
  return self->_scoringDate;
}

- (void)setScoringDate:(id)a3
{
  objc_storeStrong((id *)&self->_scoringDate, a3);
}

- (NSSet)matchingSourceBundleIds
{
  return self->_matchingSourceBundleIds;
}

- (void)setMatchingSourceBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSourceBundleIds, a3);
}

- (NSSet)excludingSourceBundleIds
{
  return self->_excludingSourceBundleIds;
}

- (void)setExcludingSourceBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_excludingSourceBundleIds, a3);
}

- (NSSet)matchingGroupIds
{
  return self->_matchingGroupIds;
}

- (void)setMatchingGroupIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingGroupIds, a3);
}

- (NSSet)matchingDocumentIds
{
  return self->_matchingDocumentIds;
}

- (void)setMatchingDocumentIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingDocumentIds, a3);
}

- (unint64_t)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setDeviceFilter:(unint64_t)a3
{
  self->_deviceFilter = a3;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (BOOL)scoreWithBiases
{
  return self->_scoreWithBiases;
}

- (void)setScoreWithBiases:(BOOL)a3
{
  self->_scoreWithBiases = a3;
}

- (NSSet)matchingTopicIds
{
  return self->_matchingTopicIds;
}

- (void)setMatchingTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingTopicIds, a3);
}

- (NSSet)matchingMappedTopicIds
{
  return self->_matchingMappedTopicIds;
}

- (void)setMatchingMappedTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingMappedTopicIds, a3);
}

- (BOOL)scoreWithStrictFiltering
{
  return self->_scoreWithStrictFiltering;
}

- (void)setScoreWithStrictFiltering:(BOOL)a3
{
  self->_scoreWithStrictFiltering = a3;
}

- (BOOL)excludeWithoutSentiment
{
  return self->_excludeWithoutSentiment;
}

- (void)setExcludeWithoutSentiment:(BOOL)a3
{
  self->_excludeWithoutSentiment = a3;
}

- (NSString)matchingContactHandle
{
  return self->_matchingContactHandle;
}

- (void)setMatchingContactHandle:(id)a3
{
  objc_storeStrong((id *)&self->_matchingContactHandle, a3);
}

- (BOOL)scoreWithCalibration
{
  return self->_scoreWithCalibration;
}

- (void)setScoreWithCalibration:(BOOL)a3
{
  self->_scoreWithCalibration = a3;
}

- (unint64_t)minimumComponentCount
{
  return self->_minimumComponentCount;
}

- (void)setMinimumComponentCount:(unint64_t)a3
{
  self->_minimumComponentCount = a3;
}

- (NSSet)matchingAlgorithms
{
  return self->_matchingAlgorithms;
}

- (void)setMatchingAlgorithms:(id)a3
{
  objc_storeStrong((id *)&self->_matchingAlgorithms, a3);
}

- (NSSet)excludingAlgorithms
{
  return self->_excludingAlgorithms;
}

- (void)setExcludingAlgorithms:(id)a3
{
  objc_storeStrong((id *)&self->_excludingAlgorithms, a3);
}

- (NSString)matchingTopicTrie
{
  return self->_matchingTopicTrie;
}

- (void)setMatchingTopicTrie:(id)a3
{
  objc_storeStrong((id *)&self->_matchingTopicTrie, a3);
}

- (BOOL)orderByIdentifier
{
  return self->_orderByIdentifier;
}

- (void)setOrderByIdentifier:(BOOL)a3
{
  self->_orderByIdentifier = a3;
}

- (BOOL)removeNearDuplicates
{
  return self->_removeNearDuplicates;
}

- (void)setRemoveNearDuplicates:(BOOL)a3
{
  self->_removeNearDuplicates = a3;
}

- (BOOL)filterByRelevanceDate
{
  return self->_filterByRelevanceDate;
}

- (void)setFilterByRelevanceDate:(BOOL)a3
{
  self->_filterByRelevanceDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingTopicTrie, 0);
  objc_storeStrong((id *)&self->_excludingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_matchingMappedTopicIds, 0);
  objc_storeStrong((id *)&self->_matchingTopicIds, 0);
  objc_storeStrong((id *)&self->_matchingDocumentIds, 0);
  objc_storeStrong((id *)&self->_matchingGroupIds, 0);
  objc_storeStrong((id *)&self->_excludingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_matchingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_scoringDate, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

+ (id)queryForCSSearchableItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x18D7805AC]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "setMatchingSourceBundleIds:", v8);

  objc_msgSend(v3, "domainIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x18D7805AC]();
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "domainIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, 0);

    objc_autoreleasePoolPop(v10);
    objc_msgSend(v4, "setMatchingGroupIds:", v13);

  }
  v14 = (void *)MEMORY[0x18D7805AC]();
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, 0);

  objc_autoreleasePoolPop(v14);
  objc_msgSend(v4, "setMatchingDocumentIds:", v17);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_algorithmsDescription:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        +[PPTopicRecord describeAlgorithm:](PPTopicRecord, "describeAlgorithm:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v11);

        if (objc_msgSend(v5, "count") > (unint64_t)(v8 + 1 + i))
          objc_msgSend(v4, "appendString:", CFSTR(", "));
      }
      v8 += v7;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", CFSTR("]"));
  return v4;
}

@end

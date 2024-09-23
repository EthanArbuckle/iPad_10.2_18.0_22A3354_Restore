@implementation PPNamedEntityQuery

- (BOOL)overrideDecayRate
{
  return 0;
}

- (PPNamedEntityQuery)init
{
  PPNamedEntityQuery *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityQuery;
  result = -[PPNamedEntityQuery init](&v3, sel_init);
  if (result)
  {
    result->_limit = -1;
    result->_deviceFilter = 0;
    result->_decayRate = -1.0;
  }
  return result;
}

- (PPNamedEntityQuery)initWithCoder:(id)a3
{
  id v4;
  PPNamedEntityQuery *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDate *fromDate;
  uint64_t v14;
  NSDate *toDate;
  uint64_t v16;
  NSDate *scoringDate;
  uint64_t v18;
  NSSet *matchingSourceBundleIds;
  uint64_t v20;
  NSSet *excludingSourceBundleIds;
  uint64_t v22;
  NSSet *matchingSourceGroupIds;
  double v24;
  uint64_t v25;
  NSString *matchingName;
  uint64_t v27;
  NSSet *matchingNames;
  uint64_t v29;
  NSSet *matchingCategories;
  uint64_t v31;
  NSString *matchingEntityTrie;
  uint64_t v33;
  NSSet *excludingAlgorithms;
  uint64_t v35;
  NSString *matchingContactHandle;
  uint64_t v37;
  NSSet *matchingSourceDocumentIds;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PPNamedEntityQuery;
  v5 = -[PPNamedEntityQuery init](&v40, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lmt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fdt"));
    v12 = objc_claimAutoreleasedReturnValue();
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tdt"));
    v14 = objc_claimAutoreleasedReturnValue();
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdt"));
    v16 = objc_claimAutoreleasedReturnValue();
    scoringDate = v5->_scoringDate;
    v5->_scoringDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("mbdl"));
    v18 = objc_claimAutoreleasedReturnValue();
    matchingSourceBundleIds = v5->_matchingSourceBundleIds;
    v5->_matchingSourceBundleIds = (NSSet *)v18;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ebdl"));
    v20 = objc_claimAutoreleasedReturnValue();
    excludingSourceBundleIds = v5->_excludingSourceBundleIds;
    v5->_excludingSourceBundleIds = (NSSet *)v20;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("gid"));
    v22 = objc_claimAutoreleasedReturnValue();
    matchingSourceGroupIds = v5->_matchingSourceGroupIds;
    v5->_matchingSourceGroupIds = (NSSet *)v22;

    v5->_deviceFilter = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("dflt"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dr"));
    v5->_decayRate = v24;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mnam"));
    v25 = objc_claimAutoreleasedReturnValue();
    matchingName = v5->_matchingName;
    v5->_matchingName = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("mnams"));
    v27 = objc_claimAutoreleasedReturnValue();
    matchingNames = v5->_matchingNames;
    v5->_matchingNames = (NSSet *)v27;

    v5->_matchCategory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bmcat"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("mcats"));
    v29 = objc_claimAutoreleasedReturnValue();
    matchingCategories = v5->_matchingCategories;
    v5->_matchingCategories = (NSSet *)v29;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("trie"));
    v31 = objc_claimAutoreleasedReturnValue();
    matchingEntityTrie = v5->_matchingEntityTrie;
    v5->_matchingEntityTrie = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("exalg"));
    v33 = objc_claimAutoreleasedReturnValue();
    excludingAlgorithms = v5->_excludingAlgorithms;
    v5->_excludingAlgorithms = (NSSet *)v33;

    v5->_excludeWithoutSentiment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("exnonsnt"));
    v5->_isForRecordMonitoring = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("frm"));
    v5->_orderByName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("obn"));
    v5->_locationConsumer = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mch"));
    v35 = objc_claimAutoreleasedReturnValue();
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("msdi"));
    v37 = objc_claimAutoreleasedReturnValue();
    matchingSourceDocumentIds = v5->_matchingSourceDocumentIds;
    v5->_matchingSourceDocumentIds = (NSSet *)v37;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingSourceGroupIds, CFSTR("gid"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_deviceFilter), CFSTR("dflt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingName, CFSTR("mnam"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingNames, CFSTR("mnams"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_matchCategory, CFSTR("bmcat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingCategories, CFSTR("mcats"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingEntityTrie, CFSTR("trie"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludingAlgorithms, CFSTR("exalg"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_excludeWithoutSentiment, CFSTR("exnonsnt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isForRecordMonitoring, CFSTR("frm"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_orderByName, CFSTR("obn"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_locationConsumer), CFSTR("lcon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingContactHandle, CFSTR("mch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingSourceDocumentIds, CFSTR("msdi"));
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
    objc_msgSend(v5, "setMatchingSourceGroupIds:", self->_matchingSourceGroupIds);
    objc_msgSend(v5, "setDeviceFilter:", self->_deviceFilter);
    objc_msgSend(v5, "setMatchingName:", self->_matchingName);
    objc_msgSend(v5, "setMatchingNames:", self->_matchingNames);
    objc_msgSend(v5, "setMatchCategory:", self->_matchCategory);
    objc_msgSend(v5, "setMatchingCategories:", self->_matchingCategories);
    objc_msgSend(v5, "setMatchingEntityTrie:", self->_matchingEntityTrie);
    objc_msgSend(v5, "setExcludingAlgorithms:", self->_excludingAlgorithms);
    objc_msgSend(v5, "setExcludeWithoutSentiment:", self->_excludeWithoutSentiment);
    objc_msgSend(v5, "setIsForRecordMonitoring:", self->_isForRecordMonitoring);
    objc_msgSend(v5, "setOrderByName:", self->_orderByName);
    objc_msgSend(v5, "setLocationConsumer:", self->_locationConsumer);
    objc_msgSend(v5, "setMatchingContactHandle:", self->_matchingContactHandle);
    objc_msgSend(v5, "setMatchingSourceDocumentIds:", self->_matchingSourceDocumentIds);
    objc_msgSend(v5, "setFilterByRelevanceDate:", self->_filterByRelevanceDate);
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t limit;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t deviceFilter;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;

  limit = self->_limit;
  v4 = -[NSDate hash](self->_fromDate, "hash") ^ limit;
  v5 = -[NSDate hash](self->_toDate, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_scoringDate, "hash");
  v7 = -[NSSet hash](self->_matchingSourceBundleIds, "hash");
  v8 = v7 ^ -[NSSet hash](self->_excludingSourceBundleIds, "hash");
  v9 = v6 ^ v8 ^ -[NSSet hash](self->_matchingSourceGroupIds, "hash");
  deviceFilter = self->_deviceFilter;
  v11 = deviceFilter ^ -[NSString hash](self->_matchingName, "hash");
  v12 = v9 ^ v11 ^ -[NSSet hash](self->_matchingNames, "hash") ^ self->_matchCategory;
  v13 = -[NSSet hash](self->_matchingCategories, "hash");
  v14 = v13 ^ -[NSString hash](self->_matchingEntityTrie, "hash");
  return v12 ^ v14 ^ -[NSSet hash](self->_excludingAlgorithms, "hash") ^ self->_excludeWithoutSentiment ^ self->_isForRecordMonitoring ^ self->_orderByName ^ self->_locationConsumer ^ self->_filterByRelevanceDate;
}

- (BOOL)isEqualToNamedEntityQuery:(id)a3
{
  PPNamedEntityQuery *v4;
  PPNamedEntityQuery *v5;
  unint64_t limit;
  NSSet *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  unint64_t deviceFilter;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 matchCategory;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 excludeWithoutSentiment;
  _BOOL4 isForRecordMonitoring;
  _BOOL4 orderByName;
  unint64_t locationConsumer;
  _BOOL4 filterByRelevanceDate;
  BOOL v33;
  int v34;
  _BOOL4 v35;
  _BOOL4 v36;
  int v37;
  _BOOL4 v38;
  int v39;
  int v40;
  _BOOL4 v41;
  _BOOL4 v42;

  v4 = (PPNamedEntityQuery *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v33 = 1;
    goto LABEL_75;
  }
  if (!v4)
    goto LABEL_74;
  limit = self->_limit;
  if (limit != -[PPNamedEntityQuery limit](v4, "limit"))
    goto LABEL_74;
  v7 = self->_fromDate;
  -[PPNamedEntityQuery fromDate](v5, "fromDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v8)
  {
    v9 = (void *)v8;
    if (!v7 || !v8)
      goto LABEL_73;
    v10 = -[NSSet isEqualToDate:](v7, "isEqualToDate:", v8);

    if (!v10)
      goto LABEL_74;
  }
  v7 = self->_toDate;
  -[PPNamedEntityQuery toDate](v5, "toDate");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v11)
  {
    v9 = (void *)v11;
    if (!v7 || !v11)
      goto LABEL_73;
    v12 = -[NSSet isEqualToDate:](v7, "isEqualToDate:", v11);

    if (!v12)
      goto LABEL_74;
  }
  v7 = self->_scoringDate;
  -[PPNamedEntityQuery scoringDate](v5, "scoringDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v13)
  {
    v9 = (void *)v13;
    if (!v7 || !v13)
      goto LABEL_73;
    v34 = -[NSSet isEqualToDate:](v7, "isEqualToDate:", v13);

    if (!v34)
      goto LABEL_74;
  }
  v7 = self->_matchingSourceBundleIds;
  -[PPNamedEntityQuery matchingSourceBundleIds](v5, "matchingSourceBundleIds");
  v14 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v14)
  {
    v9 = (void *)v14;
    if (!v7 || !v14)
      goto LABEL_73;
    v35 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v14);

    if (!v35)
      goto LABEL_74;
  }
  v7 = self->_excludingSourceBundleIds;
  -[PPNamedEntityQuery excludingSourceBundleIds](v5, "excludingSourceBundleIds");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v15)
  {
    v9 = (void *)v15;
    if (!v7 || !v15)
      goto LABEL_73;
    v16 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v15);

    if (!v16)
      goto LABEL_74;
  }
  v7 = self->_matchingSourceGroupIds;
  -[PPNamedEntityQuery matchingSourceGroupIds](v5, "matchingSourceGroupIds");
  v17 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v17)
  {
    v9 = (void *)v17;
    if (!v7 || !v17)
      goto LABEL_73;
    v36 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v17);

    if (!v36)
      goto LABEL_74;
  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter != -[PPNamedEntityQuery deviceFilter](v5, "deviceFilter"))
    goto LABEL_74;
  v7 = self->_matchingName;
  -[PPNamedEntityQuery matchingName](v5, "matchingName");
  v19 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v19)
  {
    v9 = (void *)v19;
    if (!v7 || !v19)
      goto LABEL_73;
    v37 = -[NSSet isEqualToString:](v7, "isEqualToString:", v19);

    if (!v37)
      goto LABEL_74;
  }
  v7 = self->_matchingNames;
  -[PPNamedEntityQuery matchingNames](v5, "matchingNames");
  v20 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v20)
  {
    v9 = (void *)v20;
    if (!v7 || !v20)
      goto LABEL_73;
    v38 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v20);

    if (!v38)
      goto LABEL_74;
  }
  v7 = self->_matchingContactHandle;
  -[PPNamedEntityQuery matchingContactHandle](v5, "matchingContactHandle");
  v21 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v21)
  {
    v9 = (void *)v21;
    if (!v7 || !v21)
      goto LABEL_73;
    v39 = -[NSSet isEqualToString:](v7, "isEqualToString:", v21);

    if (!v39)
      goto LABEL_74;
  }
  matchCategory = self->_matchCategory;
  if (matchCategory != -[PPNamedEntityQuery matchCategory](v5, "matchCategory"))
    goto LABEL_74;
  v7 = self->_matchingCategories;
  -[PPNamedEntityQuery matchingCategories](v5, "matchingCategories");
  v23 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v23)
  {
    v9 = (void *)v23;
    if (!v7 || !v23)
      goto LABEL_73;
    v24 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v23);

    if (!v24)
      goto LABEL_74;
  }
  v7 = self->_matchingEntityTrie;
  -[PPNamedEntityQuery matchingEntityTrie](v5, "matchingEntityTrie");
  v25 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v25)
  {
    v9 = (void *)v25;
    if (!v7 || !v25)
      goto LABEL_73;
    v40 = -[NSSet isEqualToString:](v7, "isEqualToString:", v25);

    if (!v40)
      goto LABEL_74;
  }
  v7 = self->_excludingAlgorithms;
  -[PPNamedEntityQuery excludingAlgorithms](v5, "excludingAlgorithms");
  v26 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v26)
  {
    v9 = (void *)v26;
    if (!v7 || !v26)
      goto LABEL_73;
    v41 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v26);

    if (!v41)
      goto LABEL_74;
  }
  v7 = self->_matchingSourceDocumentIds;
  -[PPNamedEntityQuery matchingSourceDocumentIds](v5, "matchingSourceDocumentIds");
  v27 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v27)
  {
    v9 = (void *)v27;
    if (v7 && v27)
    {
      v42 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v27);

      if (v42)
        goto LABEL_31;
LABEL_74:
      v33 = 0;
      goto LABEL_75;
    }
LABEL_73:

    goto LABEL_74;
  }
LABEL_31:
  excludeWithoutSentiment = self->_excludeWithoutSentiment;
  if (excludeWithoutSentiment != -[PPNamedEntityQuery excludeWithoutSentiment](v5, "excludeWithoutSentiment"))
    goto LABEL_74;
  isForRecordMonitoring = self->_isForRecordMonitoring;
  if (isForRecordMonitoring != -[PPNamedEntityQuery isForRecordMonitoring](v5, "isForRecordMonitoring"))
    goto LABEL_74;
  orderByName = self->_orderByName;
  if (orderByName != -[PPNamedEntityQuery orderByName](v5, "orderByName"))
    goto LABEL_74;
  locationConsumer = self->_locationConsumer;
  if (locationConsumer != -[PPNamedEntityQuery locationConsumer](v5, "locationConsumer"))
    goto LABEL_74;
  filterByRelevanceDate = self->_filterByRelevanceDate;
  v33 = filterByRelevanceDate == -[PPNamedEntityQuery filterByRelevanceDate](v5, "filterByRelevanceDate");
LABEL_75:

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  PPNamedEntityQuery *v4;
  BOOL v5;

  v4 = (PPNamedEntityQuery *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPNamedEntityQuery isEqualToNamedEntityQuery:](self, "isEqualToNamedEntityQuery:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  NSString *matchingEntityTrie;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSUInteger v14;
  NSSet *matchingSourceGroupIds;
  __int128 v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  id v20;
  void *v21;

  objc_msgSend((id)objc_opt_class(), "_matchingCategoriesDescription:", self->_matchingCategories);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_excludingAlgorithmsDescription:", self->_excludingAlgorithms);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18 = *(_OWORD *)&self->_toDate;
  v19 = *(_OWORD *)&self->_limit;
  v16 = *(_OWORD *)&self->_matchingSourceBundleIds;
  matchingSourceGroupIds = self->_matchingSourceGroupIds;
  +[PPEnumTypes stringForDeviceFilter:](PPEnumTypes, "stringForDeviceFilter:", self->_deviceFilter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSString length](self->_matchingName, "length");
  v4 = -[NSSet count](self->_matchingNames, "count");
  if (self->_excludeWithoutSentiment)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (self->_isForRecordMonitoring)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_orderByName)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  matchingEntityTrie = self->_matchingEntityTrie;
  +[PPLocationStore describeLocationConsumer:](PPLocationStore, "describeLocationConsumer:", self->_locationConsumer);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_filterByRelevanceDate)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("<PPNamedEntityQuery l:%tu d:%@-%@ sd:%@ mid:%@ eid:%@ gid:%@ df:%@ mn:%tu mns:%tu c:%@ ea:%@ trie:%@ ens:%@ frm:%@ obn:%@ lcon:%@ mch:%@ msdi:%@ fbrd:%@>"), v19, v18, v16, matchingSourceGroupIds, v3, v14, v4, v21, v17, matchingEntityTrie, v5, v6, v7, v9, self->_matchingContactHandle, self->_matchingSourceDocumentIds,
                  v11);

  return v12;
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
  NSSet *matchingSourceGroupIds;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSUInteger v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSSet *excludingAlgorithms;
  unint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSSet *matchingSourceDocumentIds;
  unint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;

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
  matchingSourceGroupIds = self->_matchingSourceGroupIds;
  if (matchingSourceGroupIds)
  {
    v19 = -[NSSet count](matchingSourceGroupIds, "count");
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v19 < 0xB)
      v21 = objc_msgSend(v20, "initWithFormat:", CFSTR("matchingGroupIds:%@"), self->_matchingSourceGroupIds);
    else
      v21 = objc_msgSend(v20, "initWithFormat:", CFSTR("matchingGroupIds.count:%tu"), -[NSSet count](self->_matchingSourceGroupIds, "count"));
    v22 = (void *)v21;
    objc_msgSend(v3, "addObject:", v21);

  }
  if (self->_deviceFilter)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[PPEnumTypes stringForDeviceFilter:](PPEnumTypes, "stringForDeviceFilter:", self->_deviceFilter);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("deviceFilter:%@"), v24);
    objc_msgSend(v3, "addObject:", v25);

  }
  if (self->_decayRate != -1.0)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("decayRate:%f"), *(_QWORD *)&self->_decayRate);
    objc_msgSend(v3, "addObject:", v26);

  }
  if (self->_matchingName)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingName.length:%tu"), -[NSString length](self->_matchingName, "length"));
    objc_msgSend(v3, "addObject:", v27);

  }
  if (self->_matchingNames)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingNames.count:%tu"), -[NSSet count](self->_matchingNames, "count"));
    objc_msgSend(v3, "addObject:", v28);

  }
  if (self->_matchingContactHandle)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingContactHandle.length:%tu"), -[NSString length](self->_matchingContactHandle, "length"));
    objc_msgSend(v3, "addObject:", v29);

  }
  if (self->_matchCategory)
  {
    v30 = -[NSSet count](self->_matchingCategories, "count");
    v31 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v30 < 0xB)
    {
      objc_msgSend((id)objc_opt_class(), "_matchingCategoriesDescription:", self->_matchingCategories);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("matchingCategories:%@"), v32);
      objc_msgSend(v3, "addObject:", v33);

    }
    else
    {
      v32 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("matchingCategories.count:%tu"), -[NSSet count](self->_matchingCategories, "count"));
      objc_msgSend(v3, "addObject:", v32);
    }

  }
  if (self->_matchingEntityTrie)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingEntityTrie:'%@'"), self->_matchingEntityTrie);
    objc_msgSend(v3, "addObject:", v34);

  }
  excludingAlgorithms = self->_excludingAlgorithms;
  if (excludingAlgorithms)
  {
    v36 = -[NSSet count](excludingAlgorithms, "count");
    v37 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v36 < 0xB)
    {
      objc_msgSend((id)objc_opt_class(), "_excludingAlgorithmsDescription:", self->_excludingAlgorithms);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("excludingAlgorithms:%@"), v38);
      objc_msgSend(v3, "addObject:", v39);

    }
    else
    {
      v38 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("excludingAlgorithms.count:%tu"), -[NSSet count](self->_excludingAlgorithms, "count"));
      objc_msgSend(v3, "addObject:", v38);
    }

  }
  if (self->_excludeWithoutSentiment)
    objc_msgSend(v3, "addObject:", CFSTR("excludeWithoutSentiment:YES"));
  if (self->_isForRecordMonitoring)
    objc_msgSend(v3, "addObject:", CFSTR("isForRecordMonitoring:YES"));
  if (self->_orderByName)
    objc_msgSend(v3, "addObject:", CFSTR("orderByName:YES"));
  if (self->_locationConsumer)
  {
    +[PPLocationStore describeLocationConsumer:](PPLocationStore, "describeLocationConsumer:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v40);

  }
  matchingSourceDocumentIds = self->_matchingSourceDocumentIds;
  if (matchingSourceDocumentIds)
  {
    v42 = -[NSSet count](matchingSourceDocumentIds, "count");
    v43 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v42 < 0xB)
      v44 = objc_msgSend(v43, "initWithFormat:", CFSTR("matchingSourceDocumentIds:%@"), self->_matchingSourceDocumentIds);
    else
      v44 = objc_msgSend(v43, "initWithFormat:", CFSTR("matchingSourceDocumentIds.count:%tu"), -[NSSet count](self->_matchingSourceDocumentIds, "count"));
    v45 = (void *)v44;
    objc_msgSend(v3, "addObject:", v44);

  }
  if (self->_filterByRelevanceDate)
    objc_msgSend(v3, "addObject:", CFSTR("filterByRelevanceDate:YES"));
  objc_msgSend(v3, "_pas_componentsJoinedByString:", CFSTR(" "));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (id)copyForMonitoring
{
  void *v2;

  v2 = (void *)-[PPNamedEntityQuery copy](self, "copy");
  objc_msgSend(v2, "setIsForRecordMonitoring:", 1);
  return v2;
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

- (NSSet)matchingSourceGroupIds
{
  return self->_matchingSourceGroupIds;
}

- (void)setMatchingSourceGroupIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSourceGroupIds, a3);
}

- (NSSet)matchingSourceDocumentIds
{
  return self->_matchingSourceDocumentIds;
}

- (void)setMatchingSourceDocumentIds:(id)a3
{
  objc_storeStrong((id *)&self->_matchingSourceDocumentIds, a3);
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

- (NSString)matchingName
{
  return self->_matchingName;
}

- (void)setMatchingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSSet)matchingNames
{
  return self->_matchingNames;
}

- (void)setMatchingNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)matchCategory
{
  return self->_matchCategory;
}

- (void)setMatchCategory:(BOOL)a3
{
  self->_matchCategory = a3;
}

- (NSSet)matchingCategories
{
  return self->_matchingCategories;
}

- (void)setMatchingCategories:(id)a3
{
  objc_storeStrong((id *)&self->_matchingCategories, a3);
}

- (NSSet)excludingAlgorithms
{
  return self->_excludingAlgorithms;
}

- (void)setExcludingAlgorithms:(id)a3
{
  objc_storeStrong((id *)&self->_excludingAlgorithms, a3);
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

- (NSString)matchingEntityTrie
{
  return self->_matchingEntityTrie;
}

- (void)setMatchingEntityTrie:(id)a3
{
  objc_storeStrong((id *)&self->_matchingEntityTrie, a3);
}

- (unint64_t)locationConsumer
{
  return self->_locationConsumer;
}

- (void)setLocationConsumer:(unint64_t)a3
{
  self->_locationConsumer = a3;
}

- (BOOL)orderByName
{
  return self->_orderByName;
}

- (void)setOrderByName:(BOOL)a3
{
  self->_orderByName = a3;
}

- (BOOL)orderByAscendingDate
{
  return self->_orderByAscendingDate;
}

- (void)setOrderByAscendingDate:(BOOL)a3
{
  self->_orderByAscendingDate = a3;
}

- (BOOL)removeNearDuplicates
{
  return self->_removeNearDuplicates;
}

- (void)setRemoveNearDuplicates:(BOOL)a3
{
  self->_removeNearDuplicates = a3;
}

- (BOOL)isForRecordMonitoring
{
  return self->_isForRecordMonitoring;
}

- (void)setIsForRecordMonitoring:(BOOL)a3
{
  self->_isForRecordMonitoring = a3;
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
  objc_storeStrong((id *)&self->_matchingEntityTrie, 0);
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_excludingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingCategories, 0);
  objc_storeStrong((id *)&self->_matchingNames, 0);
  objc_storeStrong((id *)&self->_matchingName, 0);
  objc_storeStrong((id *)&self->_matchingSourceDocumentIds, 0);
  objc_storeStrong((id *)&self->_matchingSourceGroupIds, 0);
  objc_storeStrong((id *)&self->_excludingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_matchingSourceBundleIds, 0);
  objc_storeStrong((id *)&self->_scoringDate, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_matchingCategoriesDescription:(id)a3
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
        +[PPNamedEntity describeCategory:](PPNamedEntity, "describeCategory:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v13));
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

+ (id)_excludingAlgorithmsDescription:(id)a3
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
        +[PPNamedEntityRecord describeAlgorithm:](PPNamedEntityRecord, "describeAlgorithm:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v13));
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

+ (id)locationQueryWithLimit:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setLimit:", a3);
  v9 = objc_msgSend(v8, "setMatchCategory:", 1);
  switch(a5)
  {
    case 3uLL:
      v10 = (void *)MEMORY[0x18D7805AC](v9);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E2284EF8, &unk_1E2284F10, &unk_1E2284F28, &unk_1E2284F40, &unk_1E2284EE0, &unk_1E2284F58, &unk_1E2284F70, 0);
      goto LABEL_7;
    case 2uLL:
      v10 = (void *)MEMORY[0x18D7805AC](v9);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E2284EF8, &unk_1E2284F10, &unk_1E2284F28, 0, v22, v23, v24, v25);
      goto LABEL_7;
    case 1uLL:
      v10 = (void *)MEMORY[0x18D7805AC](v9);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E2284EF8, &unk_1E2284F10, &unk_1E2284F28, &unk_1E2284F40, 0, v23, v24, v25);
LABEL_7:
      v12 = (void *)v11;
      objc_autoreleasePoolPop(v10);
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSSet<NSNumber *> * _Nonnull locationCategoriesForMaps(PPLocationConsumer)");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PPNamedEntityStore.m"), 368, CFSTR("Bad location consumer: %tu"), a5);

  v12 = (void *)objc_opt_new();
LABEL_9:
  objc_msgSend(v8, "setMatchingCategories:", v12);

  if (a5 == 3)
  {
    objc_msgSend(v8, "setExcludingAlgorithms:", 0);
  }
  else
  {
    v15 = (void *)MEMORY[0x18D7805AC]();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E2284EE0, 0);
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v8, "setExcludingAlgorithms:", v16);

  }
  v17 = (void *)MEMORY[0x18D7805AC](objc_msgSend(v8, "setFromDate:", v7));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.Maps"), CFSTR("com.apple.CoreRoutine"), CFSTR("com.apple.mobilecal"), CFSTR("com.apple.iCal"), CFSTR("com.apple.Passbook"), 0);
  objc_autoreleasePoolPop(v17);
  if (a5 == 3)
  {
    objc_msgSend(v8, "setExcludingSourceBundleIds:", v18);
  }
  else
  {
    v26[0] = CFSTR("com.apple.mobileslideshow");
    v26[1] = CFSTR("com.apple.Photos");
    v26[2] = CFSTR("com.apple.camera");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setByAddingObjectsFromArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExcludingSourceBundleIds:", v20);

  }
  objc_msgSend(v8, "setLocationConsumer:", a5);

  return v8;
}

@end

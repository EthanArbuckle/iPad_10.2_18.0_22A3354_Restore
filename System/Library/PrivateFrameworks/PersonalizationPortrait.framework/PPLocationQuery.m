@implementation PPLocationQuery

- (PPLocationQuery)init
{
  PPLocationQuery *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPLocationQuery;
  result = -[PPLocationQuery init](&v8, sel_init);
  if (result)
  {
    result->_limit = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_perRecordDecayRate = _Q0;
    result->_consumer = 0;
  }
  return result;
}

- (PPLocationQuery)initWithCoder:(id)a3
{
  id v4;
  PPLocationQuery *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDate *fromDate;
  uint64_t v17;
  NSDate *toDate;
  uint64_t v19;
  NSDate *scoringDate;
  uint64_t v21;
  NSSet *matchingSourceBundleIds;
  uint64_t v23;
  NSSet *excludingSourceBundleIds;
  double v25;
  double v26;
  uint64_t v27;
  NSString *fuzzyMatchingString;
  uint64_t v29;
  NSSet *matchingCategories;
  uint64_t v31;
  NSSet *matchingAlgorithms;
  uint64_t v33;
  NSSet *excludingAlgorithms;
  uint64_t v35;
  NSString *matchingContactHandle;
  PPLocationQuery *v37;

  v4 = a3;
  v5 = -[PPLocationQuery init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = (void *)MEMORY[0x18D7805AC]();
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v7);
    v11 = (void *)MEMORY[0x18D7805AC]();
    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v11);
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lim"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("fd"));
    v15 = objc_claimAutoreleasedReturnValue();
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("td"));
    v17 = objc_claimAutoreleasedReturnValue();
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sd"));
    v19 = objc_claimAutoreleasedReturnValue();
    scoringDate = v5->_scoringDate;
    v5->_scoringDate = (NSDate *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("mbi"));
    v21 = objc_claimAutoreleasedReturnValue();
    matchingSourceBundleIds = v5->_matchingSourceBundleIds;
    v5->_matchingSourceBundleIds = (NSSet *)v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("ebi"));
    v23 = objc_claimAutoreleasedReturnValue();
    excludingSourceBundleIds = v5->_excludingSourceBundleIds;
    v5->_excludingSourceBundleIds = (NSSet *)v23;

    v5->_deviceFilter = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("devf"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("prd"));
    v5->_perRecordDecayRate = v25;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dr"));
    v5->_decayRate = v26;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ms"));
    v27 = objc_claimAutoreleasedReturnValue();
    fuzzyMatchingString = v5->_fuzzyMatchingString;
    v5->_fuzzyMatchingString = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("mc"));
    v29 = objc_claimAutoreleasedReturnValue();
    matchingCategories = v5->_matchingCategories;
    v5->_matchingCategories = (NSSet *)v29;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("ma"));
    v31 = objc_claimAutoreleasedReturnValue();
    matchingAlgorithms = v5->_matchingAlgorithms;
    v5->_matchingAlgorithms = (NSSet *)v31;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("ea"));
    v33 = objc_claimAutoreleasedReturnValue();
    excludingAlgorithms = v5->_excludingAlgorithms;
    v5->_excludingAlgorithms = (NSSet *)v33;

    v5->_excludingWithoutSentiment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ews"));
    v5->_consumer = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cons"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mch"));
    v35 = objc_claimAutoreleasedReturnValue();
    matchingContactHandle = v5->_matchingContactHandle;
    v5->_matchingContactHandle = (NSString *)v35;

    v5->_filterByRelevanceDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fbrd"));
    v37 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t limit;
  id v5;

  limit = self->_limit;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", limit, CFSTR("lim"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fromDate, CFSTR("fd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toDate, CFSTR("td"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scoringDate, CFSTR("sd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingSourceBundleIds, CFSTR("mbi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludingSourceBundleIds, CFSTR("ebi"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_deviceFilter), CFSTR("devf"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("prd"), self->_perRecordDecayRate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dr"), self->_decayRate);
  objc_msgSend(v5, "encodeObject:forKey:", self->_fuzzyMatchingString, CFSTR("ms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingCategories, CFSTR("mc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingAlgorithms, CFSTR("ma"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludingAlgorithms, CFSTR("ea"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_excludingWithoutSentiment, CFSTR("ews"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_consumer, CFSTR("cons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingContactHandle, CFSTR("mch"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_filterByRelevanceDate, CFSTR("fbrd"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PPLocationQuery *v5;
  uint64_t v6;
  NSDate *fromDate;
  uint64_t v8;
  NSDate *toDate;
  uint64_t v10;
  NSDate *scoringDate;
  uint64_t v12;
  NSSet *matchingSourceBundleIds;
  uint64_t v14;
  NSSet *excludingSourceBundleIds;
  uint64_t v16;
  NSString *fuzzyMatchingString;
  uint64_t v18;
  NSSet *matchingCategories;
  uint64_t v20;
  NSSet *matchingAlgorithms;
  uint64_t v22;
  NSSet *excludingAlgorithms;
  uint64_t v24;
  NSString *matchingContactHandle;

  v5 = -[PPLocationQuery init](+[PPLocationQuery allocWithZone:](PPLocationQuery, "allocWithZone:"), "init");
  v5->_limit = self->_limit;
  v6 = -[NSDate copyWithZone:](self->_fromDate, "copyWithZone:", a3);
  fromDate = v5->_fromDate;
  v5->_fromDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_toDate, "copyWithZone:", a3);
  toDate = v5->_toDate;
  v5->_toDate = (NSDate *)v8;

  v10 = -[NSDate copyWithZone:](self->_scoringDate, "copyWithZone:", a3);
  scoringDate = v5->_scoringDate;
  v5->_scoringDate = (NSDate *)v10;

  v12 = -[NSSet copyWithZone:](self->_matchingSourceBundleIds, "copyWithZone:", a3);
  matchingSourceBundleIds = v5->_matchingSourceBundleIds;
  v5->_matchingSourceBundleIds = (NSSet *)v12;

  v14 = -[NSSet copyWithZone:](self->_excludingSourceBundleIds, "copyWithZone:", a3);
  excludingSourceBundleIds = v5->_excludingSourceBundleIds;
  v5->_excludingSourceBundleIds = (NSSet *)v14;

  v5->_deviceFilter = self->_deviceFilter;
  v5->_perRecordDecayRate = self->_perRecordDecayRate;
  v5->_decayRate = self->_decayRate;
  v16 = -[NSString copyWithZone:](self->_fuzzyMatchingString, "copyWithZone:", a3);
  fuzzyMatchingString = v5->_fuzzyMatchingString;
  v5->_fuzzyMatchingString = (NSString *)v16;

  v18 = -[NSSet copyWithZone:](self->_matchingCategories, "copyWithZone:", a3);
  matchingCategories = v5->_matchingCategories;
  v5->_matchingCategories = (NSSet *)v18;

  v20 = -[NSSet copyWithZone:](self->_matchingAlgorithms, "copyWithZone:", a3);
  matchingAlgorithms = v5->_matchingAlgorithms;
  v5->_matchingAlgorithms = (NSSet *)v20;

  v22 = -[NSSet copyWithZone:](self->_excludingAlgorithms, "copyWithZone:", a3);
  excludingAlgorithms = v5->_excludingAlgorithms;
  v5->_excludingAlgorithms = (NSSet *)v22;

  v5->_excludingWithoutSentiment = self->_excludingWithoutSentiment;
  v5->_consumer = self->_consumer;
  v24 = -[NSString copyWithZone:](self->_matchingContactHandle, "copyWithZone:", a3);
  matchingContactHandle = v5->_matchingContactHandle;
  v5->_matchingContactHandle = (NSString *)v24;

  v5->_filterByRelevanceDate = self->_filterByRelevanceDate;
  return v5;
}

- (BOOL)isEqualToLocationQuery:(id)a3
{
  id *v4;
  id *v5;
  NSSet *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  _BOOL4 v14;
  unint64_t v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int filterByRelevanceDate;
  BOOL v24;
  int v25;
  int v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || (id)self->_limit != v4[2])
    goto LABEL_55;
  v6 = self->_fromDate;
  v7 = (unint64_t)v5[3];
  if ((unint64_t)v6 | v7)
  {
    v9 = (void *)v7;
    if (!v6 || !v7)
      goto LABEL_54;
    v25 = -[NSSet isEqualToDate:](v6, "isEqualToDate:", v7);

    if (!v25)
      goto LABEL_55;
  }
  v6 = self->_toDate;
  v8 = (unint64_t)v5[4];
  if ((unint64_t)v6 | v8)
  {
    v9 = (void *)v8;
    if (!v6 || !v8)
      goto LABEL_54;
    v10 = -[NSSet isEqualToDate:](v6, "isEqualToDate:", v8);

    if (!v10)
      goto LABEL_55;
  }
  v6 = self->_scoringDate;
  v11 = (unint64_t)v5[5];
  if ((unint64_t)v6 | v11)
  {
    v9 = (void *)v11;
    if (!v6 || !v11)
      goto LABEL_54;
    v12 = -[NSSet isEqualToDate:](v6, "isEqualToDate:", v11);

    if (!v12)
      goto LABEL_55;
  }
  v6 = self->_matchingSourceBundleIds;
  v13 = (unint64_t)v5[6];
  if ((unint64_t)v6 | v13)
  {
    v9 = (void *)v13;
    if (!v6 || !v13)
      goto LABEL_54;
    v14 = -[NSSet isEqualToSet:](v6, "isEqualToSet:", v13);

    if (!v14)
      goto LABEL_55;
  }
  v6 = self->_excludingSourceBundleIds;
  v15 = (unint64_t)v5[7];
  if ((unint64_t)v6 | v15)
  {
    v9 = (void *)v15;
    if (!v6 || !v15)
      goto LABEL_54;
    v16 = -[NSSet isEqualToSet:](v6, "isEqualToSet:", v15);

    if (!v16)
      goto LABEL_55;
  }
  if ((id)self->_deviceFilter != v5[8]
    || self->_perRecordDecayRate != *((double *)v5 + 9)
    || self->_decayRate != *((double *)v5 + 10))
  {
    goto LABEL_55;
  }
  v6 = self->_fuzzyMatchingString;
  v17 = (unint64_t)v5[11];
  if ((unint64_t)v6 | v17)
  {
    v9 = (void *)v17;
    if (!v6 || !v17)
      goto LABEL_54;
    v26 = -[NSSet isEqualToString:](v6, "isEqualToString:", v17);

    if (!v26)
      goto LABEL_55;
  }
  v6 = self->_matchingContactHandle;
  objc_msgSend(v5, "matchingContactHandle");
  v18 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v6 | v18)
  {
    v9 = (void *)v18;
    if (!v6 || !v18)
      goto LABEL_54;
    v19 = -[NSSet isEqualToString:](v6, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_55;
  }
  v6 = self->_matchingCategories;
  v20 = (unint64_t)v5[12];
  if ((unint64_t)v6 | v20)
  {
    v9 = (void *)v20;
    if (!v6 || !v20)
      goto LABEL_54;
    v27 = -[NSSet isEqualToSet:](v6, "isEqualToSet:", v20);

    if (!v27)
      goto LABEL_55;
  }
  v6 = self->_matchingAlgorithms;
  v21 = (unint64_t)v5[13];
  if ((unint64_t)v6 | v21)
  {
    v9 = (void *)v21;
    if (!v6 || !v21)
      goto LABEL_54;
    v28 = -[NSSet isEqualToSet:](v6, "isEqualToSet:", v21);

    if (!v28)
      goto LABEL_55;
  }
  v6 = self->_excludingAlgorithms;
  v22 = (unint64_t)v5[14];
  if ((unint64_t)v6 | v22)
  {
    v9 = (void *)v22;
    if (v6 && v22)
    {
      v29 = -[NSSet isEqualToSet:](v6, "isEqualToSet:", v22);

      if (v29)
        goto LABEL_31;
LABEL_55:
      v24 = 0;
      goto LABEL_56;
    }
LABEL_54:

    goto LABEL_55;
  }
LABEL_31:
  if (self->_excludingWithoutSentiment != *((unsigned __int8 *)v5 + 8) || (id)self->_consumer != v5[16])
    goto LABEL_55;
  filterByRelevanceDate = self->_filterByRelevanceDate;
  v24 = filterByRelevanceDate == objc_msgSend(v5, "filterByRelevanceDate");
LABEL_56:

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  PPLocationQuery *v4;
  PPLocationQuery *v5;
  BOOL v6;

  v4 = (PPLocationQuery *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPLocationQuery isEqualToLocationQuery:](self, "isEqualToLocationQuery:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t limit;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  limit = self->_limit;
  v4 = -[NSDate hash](self->_fromDate, "hash") - limit + 32 * limit;
  v5 = -[NSDate hash](self->_toDate, "hash") - v4 + 32 * v4;
  v6 = -[NSDate hash](self->_scoringDate, "hash") - v5 + 32 * v5;
  v7 = -[NSSet hash](self->_matchingSourceBundleIds, "hash") - v6 + 32 * v6;
  v8 = -[NSSet hash](self->_excludingSourceBundleIds, "hash");
  v9 = self->_deviceFilter - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_perRecordDecayRate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") - v9 + 32 * v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_decayRate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") - v11 + 32 * v11;

  v14 = -[NSString hash](self->_fuzzyMatchingString, "hash") - v13 + 32 * v13;
  v15 = -[NSSet hash](self->_matchingCategories, "hash") - v14 + 32 * v14;
  v16 = -[NSSet hash](self->_matchingAlgorithms, "hash") - v15 + 32 * v15;
  v17 = -[NSSet hash](self->_excludingAlgorithms, "hash");
  v18 = self->_excludingWithoutSentiment - (v17 - v16 + 32 * v16) + 32 * (v17 - v16 + 32 * v16);
  v19 = self->_consumer - v18 + 32 * v18;
  return self->_filterByRelevanceDate - v19 + 32 * v19;
}

- (id)description
{
  void *v3;
  NSSet *matchingSourceBundleIds;
  NSSet *excludingSourceBundleIds;
  void *v6;
  NSUInteger v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  id v16;
  void *v17;
  void *v18;

  objc_msgSend((id)objc_opt_class(), "_matchingCategoriesDescription:", self->_matchingCategories);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_matchingAlgorithms);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_excludingAlgorithms);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = *(_OWORD *)&self->_limit;
  v14 = *(_OWORD *)&self->_toDate;
  matchingSourceBundleIds = self->_matchingSourceBundleIds;
  excludingSourceBundleIds = self->_excludingSourceBundleIds;
  +[PPEnumTypes stringForDeviceFilter:](PPEnumTypes, "stringForDeviceFilter:", self->_deviceFilter);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString length](self->_fuzzyMatchingString, "length");
  if (self->_excludingWithoutSentiment)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  +[PPLocationStore describeLocationConsumer:](PPLocationStore, "describeLocationConsumer:", self->_consumer);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_filterByRelevanceDate)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("<PPLocationQuery l:%tu d:%@-%@ sd:%@ mid:%@ eid:%@ df:%@ fms:%tu c:%@ ma:%@ ea:%@ ens:%@> cons:%@ mch:%@ fbrd:%@"), v15, v14, matchingSourceBundleIds, excludingSourceBundleIds, v6, v7, v18, v17, v3, v8, v9, self->_matchingContactHandle, v11);

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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSSet *matchingCategories;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  NSSet *matchingAlgorithms;
  unint64_t v31;
  id v32;
  void *v33;
  void *v34;
  NSSet *excludingAlgorithms;
  unint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

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
  if (self->_deviceFilter)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[PPEnumTypes stringForDeviceFilter:](PPEnumTypes, "stringForDeviceFilter:", self->_deviceFilter);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("deviceFilter:%@"), v19);
    objc_msgSend(v3, "addObject:", v20);

  }
  if (self->_perRecordDecayRate != -1.0)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("perRecordDecayRate:%f"), *(_QWORD *)&self->_perRecordDecayRate);
    objc_msgSend(v3, "addObject:", v21);

  }
  if (self->_decayRate != -1.0)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("decayRate:%f"), *(_QWORD *)&self->_decayRate);
    objc_msgSend(v3, "addObject:", v22);

  }
  if (self->_fuzzyMatchingString)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fuzzyMatchingString.length:%tu"), -[NSString length](self->_fuzzyMatchingString, "length"));
    objc_msgSend(v3, "addObject:", v23);

  }
  if (self->_matchingContactHandle)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("matchingContactHandle.length:%tu"), -[NSString length](self->_matchingContactHandle, "length"));
    objc_msgSend(v3, "addObject:", v24);

  }
  matchingCategories = self->_matchingCategories;
  if (matchingCategories)
  {
    v26 = -[NSSet count](matchingCategories, "count");
    v27 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v26 < 0xB)
    {
      objc_msgSend((id)objc_opt_class(), "_matchingCategoriesDescription:", self->_matchingCategories);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("matchingCategories:%@"), v28);
      objc_msgSend(v3, "addObject:", v29);

    }
    else
    {
      v28 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("matchingCategories.count:%tu"), -[NSSet count](self->_matchingCategories, "count"));
      objc_msgSend(v3, "addObject:", v28);
    }

  }
  matchingAlgorithms = self->_matchingAlgorithms;
  if (matchingAlgorithms)
  {
    v31 = -[NSSet count](matchingAlgorithms, "count");
    v32 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v31 < 0xB)
    {
      objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_matchingAlgorithms);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("matchingAlgorithms:%@"), v33);
      objc_msgSend(v3, "addObject:", v34);

    }
    else
    {
      v33 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("matchingAlgorithms.count:%tu"), -[NSSet count](self->_matchingAlgorithms, "count"));
      objc_msgSend(v3, "addObject:", v33);
    }

  }
  excludingAlgorithms = self->_excludingAlgorithms;
  if (excludingAlgorithms)
  {
    v36 = -[NSSet count](excludingAlgorithms, "count");
    v37 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v36 < 0xB)
    {
      objc_msgSend((id)objc_opt_class(), "_algorithmsDescription:", self->_excludingAlgorithms);
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
  if (self->_excludingWithoutSentiment)
    objc_msgSend(v3, "addObject:", CFSTR("excludingWithoutSentiment:YES"));
  if (self->_consumer)
  {
    +[PPLocationStore describeLocationConsumer:](PPLocationStore, "describeLocationConsumer:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v40);

  }
  if (self->_filterByRelevanceDate)
    objc_msgSend(v3, "addObject:", CFSTR("filterByRelevanceDate:YES"));
  objc_msgSend(v3, "_pas_componentsJoinedByString:", CFSTR(" "));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
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

- (unint64_t)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setDeviceFilter:(unint64_t)a3
{
  self->_deviceFilter = a3;
}

- (double)perRecordDecayRate
{
  return self->_perRecordDecayRate;
}

- (void)setPerRecordDecayRate:(double)a3
{
  self->_perRecordDecayRate = a3;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (NSString)fuzzyMatchingString
{
  return self->_fuzzyMatchingString;
}

- (void)setFuzzyMatchingString:(id)a3
{
  objc_storeStrong((id *)&self->_fuzzyMatchingString, a3);
}

- (NSSet)matchingCategories
{
  return self->_matchingCategories;
}

- (void)setMatchingCategories:(id)a3
{
  objc_storeStrong((id *)&self->_matchingCategories, a3);
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

- (BOOL)excludingWithoutSentiment
{
  return self->_excludingWithoutSentiment;
}

- (void)setExcludingWithoutSentiment:(BOOL)a3
{
  self->_excludingWithoutSentiment = a3;
}

- (NSString)matchingContactHandle
{
  return self->_matchingContactHandle;
}

- (void)setMatchingContactHandle:(id)a3
{
  objc_storeStrong((id *)&self->_matchingContactHandle, a3);
}

- (unint64_t)consumer
{
  return self->_consumer;
}

- (void)setConsumer:(unint64_t)a3
{
  self->_consumer = a3;
}

- (BOOL)orderByAscendingDate
{
  return self->_orderByAscendingDate;
}

- (void)setOrderByAscendingDate:(BOOL)a3
{
  self->_orderByAscendingDate = a3;
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
  objc_storeStrong((id *)&self->_matchingContactHandle, 0);
  objc_storeStrong((id *)&self->_excludingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingAlgorithms, 0);
  objc_storeStrong((id *)&self->_matchingCategories, 0);
  objc_storeStrong((id *)&self->_fuzzyMatchingString, 0);
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
        +[PPLocation describeCategory:](PPLocation, "describeCategory:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v13));
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
        +[PPLocationRecord describeAlgorithm:](PPLocationRecord, "describeAlgorithm:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v13));
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

+ (id)queryForMapsWithLimit:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = v8;
  if (a5 == 3)
  {
    objc_msgSend(v8, "setExcludingAlgorithms:", 0);
  }
  else
  {
    v10 = (void *)MEMORY[0x18D7805AC]();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E2284B50, 0);
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "setExcludingAlgorithms:", v11);

  }
  objc_msgSend(v9, "setFromDate:", v7);
  objc_msgSend(v9, "setPerRecordDecayRate:", 0.000385);
  v12 = (void *)MEMORY[0x18D7805AC](objc_msgSend(v9, "setConsumer:", a5));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.Maps"), CFSTR("com.apple.CoreRoutine"), CFSTR("com.apple.mobilecal"), CFSTR("com.apple.iCal"), CFSTR("com.apple.Passbook"), 0);
  objc_autoreleasePoolPop(v12);
  if (a5 == 3)
  {
    objc_msgSend(v9, "setExcludingSourceBundleIds:", v13);
  }
  else
  {
    v17[0] = CFSTR("com.apple.mobileslideshow");
    v17[1] = CFSTR("com.apple.Photos");
    v17[2] = CFSTR("com.apple.camera");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExcludingSourceBundleIds:", v15);

  }
  objc_msgSend(v9, "setLimit:", a3);

  return v9;
}

@end

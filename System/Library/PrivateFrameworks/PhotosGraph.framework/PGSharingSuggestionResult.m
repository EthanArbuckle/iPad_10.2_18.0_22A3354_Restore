@implementation PGSharingSuggestionResult

- (PGSharingSuggestionResult)initWithPerson:(id)a3 weight:(double)a4 sourceWeight:(double)a5 sourceName:(id)a6
{
  id v11;
  id v12;
  PGSharingSuggestionResult *v13;
  PGSharingSuggestionResult *v14;
  uint64_t v15;
  NSArray *sourceNames;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGSharingSuggestionResult;
  v13 = -[PGSharingSuggestionResult init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_person, a3);
    v14->_weight = a4;
    v14->_sourceWeight = a5;
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    sourceNames = v14->_sourceNames;
    v14->_sourceNames = (NSArray *)v15;

    v14->_useContactSuggestion = 0;
  }

  return v14;
}

- (void)mergeWithSuggestionResult:(id)a3
{
  double sourceWeight;
  double v5;
  double v6;
  double v7;
  NSArray *sourceNames;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "weight");
  sourceWeight = self->_sourceWeight;
  self->_weight = v5 + self->_weight;
  if (sourceWeight > 0.25 || (objc_msgSend(v12, "sourceWeight"), v6 > 0.25))
  {
    objc_msgSend(v12, "sourceWeight");
    self->_sourceWeight = v7 + self->_sourceWeight;
  }
  sourceNames = self->_sourceNames;
  objc_msgSend(v12, "sourceNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](sourceNames, "arrayByAddingObjectsFromArray:", v9);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v11 = self->_sourceNames;
  self->_sourceNames = v10;

}

- (double)score
{
  return self->_sourceWeight + self->_weight * 0.001;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x1E0C80C00];
  -[PGSharingSuggestionResult person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v4, "length")
    && -[PGSharingSuggestionResult useContactSuggestion](self, "useContactSuggestion"))
  {
    -[PGSharingSuggestionResult person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestedContactIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  v23[0] = CFSTR("localIdentifier");
  -[PGSharingSuggestionResult person](self, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E8436F28;
  if (v4)
    v11 = v4;
  else
    v11 = &stru_1E8436F28;
  v24[0] = v10;
  v24[1] = v11;
  v23[1] = CFSTR("contactIdentifier");
  v23[2] = CFSTR("displayName");
  -[PGSharingSuggestionResult person](self, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fullName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E8436F28;
  v24[2] = v15;
  v23[3] = CFSTR("score");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PGSharingSuggestionResult score](self, "score");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v17;
  v23[4] = CFSTR("weight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_weight);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("sourceWeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sourceWeight);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v19;
  v23[6] = CFSTR("sourceNames");
  -[PGSharingSuggestionResult sourceNames](self, "sourceNames");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGSharingSuggestionResult;
  -[PGSharingSuggestionResult description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - person:%@ weight:%.2f sourceWeight:%.2f sources:%@"), v4, self->_person, *(_QWORD *)&self->_weight, *(_QWORD *)&self->_sourceWeight, self->_sourceNames);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PGPersonResult)person
{
  return self->_person;
}

- (double)weight
{
  return self->_weight;
}

- (double)sourceWeight
{
  return self->_sourceWeight;
}

- (NSArray)sourceNames
{
  return self->_sourceNames;
}

- (BOOL)useContactSuggestion
{
  return self->_useContactSuggestion;
}

- (void)setUseContactSuggestion:(BOOL)a3
{
  self->_useContactSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceNames, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end

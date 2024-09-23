@implementation TIAutocorrectionList

- (TIKeyboardCandidate)autocorrection
{
  void *v2;
  void *v3;

  -[TIAutocorrectionList corrections](self, "corrections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardCandidate *)v3;
}

- (NSArray)candidates
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[TIAutocorrectionList corrections](self, "corrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AA60];
  if (v4)
  {
    -[TIAutocorrectionList corrections](self, "corrections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autocorrection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  -[TIAutocorrectionList predictions](self, "predictions");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = v5;
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (TICorrectionCandidates)corrections
{
  return self->_corrections;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (NSArray)emojiList
{
  return self->_emojiList;
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (BOOL)containsProactiveTriggers
{
  return self->_containsProactiveTriggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_emojiList, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
}

- (TIAutocorrectionList)initWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6 inlineCompletions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TIAutocorrectionList *v18;
  TIAutocorrectionList *v19;
  uint64_t v20;
  NSArray *predictions;
  uint64_t v22;
  NSArray *emojiList;
  uint64_t v24;
  NSArray *proactiveTriggers;
  uint64_t v26;
  NSArray *inlineCompletions;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TIAutocorrectionList;
  v18 = -[TIAutocorrectionList init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_corrections, a3);
    v20 = objc_msgSend(v14, "copy");
    predictions = v19->_predictions;
    v19->_predictions = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    emojiList = v19->_emojiList;
    v19->_emojiList = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    proactiveTriggers = v19->_proactiveTriggers;
    v19->_proactiveTriggers = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    inlineCompletions = v19->_inlineCompletions;
    v19->_inlineCompletions = (NSArray *)v26;

  }
  return v19;
}

- (id)initListWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6 inlineCompletions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TIAutocorrectionList *v18;
  TIAutocorrectionList *v19;
  uint64_t v20;
  NSArray *predictions;
  uint64_t v22;
  NSArray *emojiList;
  uint64_t v24;
  NSArray *proactiveTriggers;
  uint64_t v26;
  NSArray *inlineCompletions;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TIAutocorrectionList;
  v18 = -[TIAutocorrectionList init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_corrections, a3);
    v20 = objc_msgSend(v14, "copy");
    predictions = v19->_predictions;
    v19->_predictions = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    emojiList = v19->_emojiList;
    v19->_emojiList = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    proactiveTriggers = v19->_proactiveTriggers;
    v19->_proactiveTriggers = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    inlineCompletions = v19->_inlineCompletions;
    v19->_inlineCompletions = (NSArray *)v26;

  }
  return v19;
}

- (TIAutocorrectionList)initWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TIAutocorrectionList *v15;
  TIAutocorrectionList *v16;
  uint64_t v17;
  NSArray *predictions;
  uint64_t v19;
  NSArray *emojiList;
  uint64_t v21;
  NSArray *proactiveTriggers;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TIAutocorrectionList;
  v15 = -[TIAutocorrectionList init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_corrections, a3);
    v17 = objc_msgSend(v12, "copy");
    predictions = v16->_predictions;
    v16->_predictions = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    emojiList = v16->_emojiList;
    v16->_emojiList = (NSArray *)v19;

    v21 = objc_msgSend(v14, "copy");
    proactiveTriggers = v16->_proactiveTriggers;
    v16->_proactiveTriggers = (NSArray *)v21;

  }
  return v16;
}

- (NSArray)alternateCorrections
{
  void *v2;
  void *v3;

  -[TIAutocorrectionList corrections](self, "corrections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternateCorrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (TIAutocorrectionList)initWithCandidates:(id)a3
{
  id v4;
  TIAutocorrectionList *v5;

  v4 = a3;
  v5 = -[TIAutocorrectionList initWithCandidates:shouldAcceptTopCandidate:](self, "initWithCandidates:shouldAcceptTopCandidate:", v4, objc_msgSend(v4, "count") != 0);

  return v5;
}

- (TIAutocorrectionList)initWithCandidates:(id)a3 shouldAcceptTopCandidate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  TICorrectionCandidates *v10;
  TIAutocorrectionList *v11;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
    v9 = v7;
  }
  v10 = -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:]([TICorrectionCandidates alloc], "initWithAutocorrection:alternateCorrections:", v8, 0);
  v11 = -[TIAutocorrectionList initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:](self, "initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", v10, v9, 0, 0, 0);

  return v11;
}

- (TIAutocorrectionList)initWithCoder:(id)a3
{
  id v4;
  TIAutocorrectionList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  TICorrectionCandidates *corrections;
  void *v11;
  TICorrectionCandidates *v12;
  TICorrectionCandidates *v13;
  void *v14;
  uint64_t v15;
  NSArray *predictions;
  void *v17;
  uint64_t v18;
  NSArray *inlineCompletions;
  void *v20;
  uint64_t v21;
  NSArray *emojiList;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TIAutocorrectionList;
  v5 = -[TIAutocorrectionList init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("corrections"));
    v9 = objc_claimAutoreleasedReturnValue();
    corrections = v5->_corrections;
    v5->_corrections = (TICorrectionCandidates *)v9;

    if (!v5->_corrections)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autocorrection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:]([TICorrectionCandidates alloc], "initWithAutocorrection:alternateCorrections:", v11, 0);
        v13 = v5->_corrections;
        v5->_corrections = v12;

      }
    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("predictions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    predictions = v5->_predictions;
    v5->_predictions = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("inlineCompletions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    inlineCompletions = v5->_inlineCompletions;
    v5->_inlineCompletions = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("emojiList"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    emojiList = v5->_emojiList;
    v5->_emojiList = (NSArray *)v21;

    v5->_containsProactiveTriggers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containsProactiveTriggers"));
    v5->_proactiveSuggestionsEmpty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proactiveSuggestionsEmpty"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TICorrectionCandidates *corrections;
  NSArray *predictions;
  NSArray *inlineCompletions;
  NSArray *emojiList;
  id v9;

  v4 = a3;
  corrections = self->_corrections;
  v9 = v4;
  if (corrections)
  {
    objc_msgSend(v4, "encodeObject:forKey:", corrections, CFSTR("corrections"));
    v4 = v9;
  }
  predictions = self->_predictions;
  if (predictions)
  {
    objc_msgSend(v9, "encodeObject:forKey:", predictions, CFSTR("predictions"));
    v4 = v9;
  }
  inlineCompletions = self->_inlineCompletions;
  if (inlineCompletions)
  {
    objc_msgSend(v9, "encodeObject:forKey:", inlineCompletions, CFSTR("inlineCompletions"));
    v4 = v9;
  }
  emojiList = self->_emojiList;
  if (emojiList)
  {
    objc_msgSend(v9, "encodeObject:forKey:", emojiList, CFSTR("emojiList"));
    v4 = v9;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_containsProactiveTriggers, CFSTR("containsProactiveTriggers"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_proactiveSuggestionsEmpty, CFSTR("proactiveSuggestionsEmpty"));

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p corrections=%@ predictions=%@"), objc_opt_class(), self, self->_corrections, self->_predictions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_emojiList)
    objc_msgSend(v3, "appendFormat:", CFSTR(" emojiList=%@"), self->_emojiList);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)empty
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[TIAutocorrectionList corrections](self, "corrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[TIAutocorrectionList corrections](self, "corrections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alternateCorrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count")
      || -[NSArray count](self->_predictions, "count")
      || -[NSArray count](self->_emojiList, "count") != 0;

  }
  return !v5;
}

- (BOOL)shouldAcceptTopCandidate
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TIAutocorrectionList corrections](self, "corrections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasSupplementalCandidates
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[TIAutocorrectionList corrections](self, "corrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSupplementalItemCandidate");

  if ((v5 & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = self->_predictions;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isSupplementalItemCandidate", (_QWORD)v11) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v6;
}

- (TIKeyboardCandidate)autocorrectionIfSupplemental
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TIAutocorrectionList corrections](self, "corrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSupplementalItemCandidate"))
  {
    -[TIAutocorrectionList corrections](self, "corrections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autocorrection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (TIKeyboardCandidate *)v6;
}

- (NSArray)predictionsIfSupplemental
{
  NSArray *predictions;
  void *v3;
  void *v4;

  predictions = self->_predictions;
  if (predictions)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_775);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](predictions, "filteredArrayUsingPredicate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (BOOL)isSupplementalCandidateInPredictions:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_predictions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSupplementalItemCandidate", (_QWORD)v13))
        {
          objc_msgSend(v9, "candidate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v4, "isEqualToString:", v10);

          if ((v11 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)shouldAcceptInlineCompletion
{
  void *v2;
  BOOL v3;

  -[TIAutocorrectionList inlineCompletions](self, "inlineCompletions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setContainsProactiveTriggers:(BOOL)a3
{
  self->_containsProactiveTriggers = a3;
}

- (BOOL)proactiveSuggestionsEmpty
{
  return self->_proactiveSuggestionsEmpty;
}

- (void)setProactiveSuggestionsEmpty:(BOOL)a3
{
  self->_proactiveSuggestionsEmpty = a3;
}

uint64_t __49__TIAutocorrectionList_predictionsIfSupplemental__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSupplementalItemCandidate");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", v4, 0, 0, 0, 0);

  return (TIAutocorrectionList *)v5;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", v7, v6, 0, 0, 0);

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 inlineCompletionList:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", v7, 0, 0, 0, v6);

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", v10, v9, v8, 0, 0);

  return (TIAutocorrectionList *)v11;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:", v13, v12, v11, v10);

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletionList:(id)a6 proactiveTriggers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initListWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", v16, v15, v14, v12, v13);

  return (TIAutocorrectionList *)v17;
}

+ (TIAutocorrectionList)listWithPredictions:(id)a3 proactiveTriggers:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", 0, v7, 0, v6, 0);

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithPredictions:(id)a3 emojiList:(id)a4 proactiveTriggers:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:", 0, v10, v9, v8);

  return (TIAutocorrectionList *)v11;
}

+ (TIAutocorrectionList)listWithCorrections:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCorrections:predictions:emojiList:proactiveTriggers:inlineCompletions:", v13, v12, v11, 0, v10);

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3
{
  id v3;
  TICorrectionCandidates *v4;
  void *v5;

  v3 = a3;
  v4 = -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:]([TICorrectionCandidates alloc], "initWithAutocorrection:alternateCorrections:", v3, 0);

  +[TIAutocorrectionList listWithCorrections:](TIAutocorrectionList, "listWithCorrections:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIAutocorrectionList *)v5;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4
{
  id v5;
  id v6;
  TICorrectionCandidates *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:]([TICorrectionCandidates alloc], "initWithAutocorrection:alternateCorrections:", v6, 0);

  +[TIAutocorrectionList listWithCorrections:predictions:](TIAutocorrectionList, "listWithCorrections:predictions:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIAutocorrectionList *)v8;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5
{
  id v7;
  id v8;
  id v9;
  TICorrectionCandidates *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:]([TICorrectionCandidates alloc], "initWithAutocorrection:alternateCorrections:", v9, 0);

  +[TIAutocorrectionList listWithCorrections:predictions:emojiList:](TIAutocorrectionList, "listWithCorrections:predictions:emojiList:", v10, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIAutocorrectionList *)v11;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5 inlineCompletions:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  TICorrectionCandidates *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:]([TICorrectionCandidates alloc], "initWithAutocorrection:alternateCorrections:", v12, 0);

  +[TIAutocorrectionList listWithCorrections:predictions:emojiList:inlineCompletions:](TIAutocorrectionList, "listWithCorrections:predictions:emojiList:inlineCompletions:", v13, v11, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)listWithAutocorrection:(id)a3 predictions:(id)a4 emojiList:(id)a5 proactiveTriggers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  TICorrectionCandidates *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:]([TICorrectionCandidates alloc], "initWithAutocorrection:alternateCorrections:", v12, 0);

  +[TIAutocorrectionList listWithCorrections:predictions:emojiList:proactiveTriggers:](TIAutocorrectionList, "listWithCorrections:predictions:emojiList:proactiveTriggers:", v13, v11, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIAutocorrectionList *)v14;
}

+ (TIAutocorrectionList)autocorrectionListWithCandidates:(id)a3 shouldAcceptTopCandidate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidates:shouldAcceptTopCandidate:", v6, v4);

  return (TIAutocorrectionList *)v7;
}

@end

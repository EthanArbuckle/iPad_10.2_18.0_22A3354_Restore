@implementation SFMutableResultSection

- (id)results
{
  return (id)-[NSMutableOrderedSet array](self->_resultSet, "array");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMutableResultSection)initWithCoder:(id)a3
{
  id v4;
  SFMutableResultSection *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableOrderedSet *resultSet;
  uint64_t v11;
  NSString *relatedSectionBundleIdentifier;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFMutableResultSection;
  v5 = -[SFResultSection initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_resultSet"));
    v9 = objc_claimAutoreleasedReturnValue();
    resultSet = v5->_resultSet;
    v5->_resultSet = (NSMutableOrderedSet *)v9;

    v5->_doNotFold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_doNotFold"));
    v5->_domain = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_domain"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rsbid"));
    v11 = objc_claimAutoreleasedReturnValue();
    relatedSectionBundleIdentifier = v5->_relatedSectionBundleIdentifier;
    v5->_relatedSectionBundleIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_button_command"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection button](v5, "button");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCommand:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFMutableResultSection;
  v4 = a3;
  -[SFResultSection setResults:](&v8, sel_setResults_, 0);
  v7.receiver = self;
  v7.super_class = (Class)SFMutableResultSection;
  -[SFResultSection encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_doNotFold, CFSTR("_doNotFold"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultSet, CFSTR("_resultSet"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_domain, CFSTR("_domain"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relatedSectionBundleIdentifier, CFSTR("_rsbid"));
  -[SFResultSection button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_button_command"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preMergeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_resultSetIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceDomain, 0);
  objc_storeStrong((id *)&self->_relatedSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_headerResult, 0);
  objc_storeStrong((id *)&self->_resultSet, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_hiddenExtResults, 0);
}

- (void)addResults:(id)a3
{
  id v4;
  void *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *resultSet;
  id v8;

  v4 = a3;
  v5 = v4;
  v8 = v4;
  if (!self->_resultSet)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    resultSet = self->_resultSet;
    self->_resultSet = v6;

    v5 = v8;
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    -[NSMutableOrderedSet addObject:](self->_resultSet, "addObject:", v8);
    v5 = v8;
  }
LABEL_4:

}

- (void)setResultSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_resultSetIdentifier, a3);
}

+ (id)mutableSectionWithBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBundleIdentifier:", v3);

  return v4;
}

- (id)objectForFeedback
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(self, "_feedbackobject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D8C650]);
    -[SFResultSection identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIdentifier:", v4);

    -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setBundleIdentifier:", v6);

    -[SFResultSection title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setTitle:", v8);

    -[SFResultSection subtitle](self, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setSubtitle:", v10);

    -[SFResultSection rankingScore](self, "rankingScore");
    objc_msgSend(v3, "setRankingScore:");
    objc_msgSend(v3, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
    objc_msgSend(v3, "setIsInitiallyHidden:", -[SFResultSection isInitiallyHidden](self, "isInitiallyHidden"));
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[SFMutableResultSection results](self, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[SFMutableResultSection resultSet](self, "resultSet", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "objectForFeedback");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setResults:", v13);
    objc_setAssociatedObject(self, "_feedbackobject", v3, (void *)1);

  }
  return v3;
}

- (id)objectForFeedbackWithResultsArray:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_getAssociatedObject(self, "_feedbackobject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D8C650]);
    -[SFResultSection identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

    -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "setBundleIdentifier:", v8);

    -[SFResultSection title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v5, "setTitle:", v10);

    -[SFResultSection subtitle](self, "subtitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v5, "setSubtitle:", v12);

    -[SFResultSection rankingScore](self, "rankingScore");
    objc_msgSend(v5, "setRankingScore:");
    objc_msgSend(v5, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++), (_QWORD)v20);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

    objc_msgSend(v5, "setResults:", v13);
    objc_setAssociatedObject(self, "_feedbackobject", v5, (void *)1);

  }
  return v5;
}

- (void)addHiddenExtResult:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *hiddenExtResults;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_hiddenExtResults)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    hiddenExtResults = self->_hiddenExtResults;
    self->_hiddenExtResults = v5;

  }
  if (v4)
  {
    v7 = self->_hiddenExtResults;
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray arrayByAddingObjectsFromArray:](v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_hiddenExtResults;
    self->_hiddenExtResults = v9;

  }
}

- (NSArray)hiddenExtResults
{
  NSArray *hiddenExtResults;
  NSArray *v4;
  NSArray *v5;

  hiddenExtResults = self->_hiddenExtResults;
  if (!hiddenExtResults)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_hiddenExtResults;
    self->_hiddenExtResults = v4;

    hiddenExtResults = self->_hiddenExtResults;
  }
  return hiddenExtResults;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)SFMutableResultSection;
  -[SFMutableResultSection description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFMutableResultSection resultsCount](self, "resultsCount");
  v8 = -[SFResultSection isInitiallyHidden](self, "isInitiallyHidden");
  v9 = "no";
  if (v8)
    v9 = "yes";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ -- Result count:%ld Hidden: %s"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SFMutableResultSection)initWithSection:(id)a3
{
  id v4;
  SFMutableResultSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *resultSet;

  v4 = a3;
  v5 = (SFMutableResultSection *)objc_opt_new();
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMutableResultSection setResults:](v5, "setResults:", v6);

  -[SFResultSection setMaxInitiallyVisibleResults:](v5, "setMaxInitiallyVisibleResults:", objc_msgSend(v4, "maxInitiallyVisibleResults"));
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection setIdentifier:](v5, "setIdentifier:", v7);

  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection setBundleIdentifier:](v5, "setBundleIdentifier:", v8);

  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection setTitle:](v5, "setTitle:", v9);

  objc_msgSend(v4, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection setSubtitle:](v5, "setSubtitle:", v10);

  objc_msgSend(v4, "moreText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection setMoreText:](v5, "setMoreText:", v11);

  objc_msgSend(v4, "rankingScore");
  -[SFResultSection setRankingScore:](v5, "setRankingScore:");
  -[SFResultSection setIsInitiallyHidden:](v5, "setIsInitiallyHidden:", objc_msgSend(v4, "isInitiallyHidden"));
  objc_msgSend(v4, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection setButton:](v5, "setButton:", v12);

  v13 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(v4, "results");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderedSetWithArray:", v14);
  v15 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  resultSet = self->_resultSet;
  self->_resultSet = v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SFMutableResultSection setDomain:](v5, "setDomain:", objc_msgSend(v4, "domain"));

  return v5;
}

- (SFMutableResultSection)initWithResultSection:(id)a3
{
  id v4;
  SFMutableResultSection *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableOrderedSet *resultSet;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFMutableResultSection;
  v5 = -[SFResultSection init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "applicationBundleIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    -[SFResultSection setBundleIdentifier:](v5, "setBundleIdentifier:", v7);
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setTitle:](v5, "setTitle:", v10);

    objc_msgSend(v4, "subtitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setSubtitle:](v5, "setSubtitle:", v11);

    objc_msgSend(v4, "moreText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setMoreText:](v5, "setMoreText:", v12);

    objc_msgSend(v4, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setButton:](v5, "setButton:", v13);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SFMutableResultSection setDomain:](v5, "setDomain:", objc_msgSend(v4, "domain"));
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    resultSet = v5->_resultSet;
    v5->_resultSet = (NSMutableOrderedSet *)v14;

  }
  return v5;
}

- (SFMutableResultSection)initWithPrototype:(id)a3
{
  id v4;
  SFMutableResultSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *groupName;
  uint64_t v14;
  NSNumber *groupId;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFMutableResultSection;
  v5 = -[SFResultSection init](&v17, sel_init);
  if (v5)
  {
    -[SFResultSection setMaxInitiallyVisibleResults:](v5, "setMaxInitiallyVisibleResults:", objc_msgSend(v4, "maxInitiallyVisibleResults"));
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setTitle:](v5, "setTitle:", v8);

    objc_msgSend(v4, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setSubtitle:](v5, "setSubtitle:", v9);

    objc_msgSend(v4, "moreText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setMoreText:](v5, "setMoreText:", v10);

    objc_msgSend(v4, "rankingScore");
    -[SFResultSection setRankingScore:](v5, "setRankingScore:");
    objc_msgSend(v4, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResultSection setButton:](v5, "setButton:", v11);

    objc_msgSend(v4, "groupName");
    v12 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v12;

    objc_msgSend(v4, "groupId");
    v14 = objc_claimAutoreleasedReturnValue();
    groupId = v5->_groupId;
    v5->_groupId = (NSNumber *)v14;

    v5->_doNotFold = objc_msgSend(v4, "doNotFold");
    v5->_domain = objc_msgSend(v4, "domain");
    v5->_pinToTop = objc_msgSend(v4, "pinToTop");
  }

  return v5;
}

- (id)mutableDeepCopy
{
  void *v3;
  void *v4;
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
  -[SFResultSection identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIdentifier:", v5);

  -[SFResultSection title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v6);

  -[SFResultSection subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v7);

  -[SFResultSection moreText](self, "moreText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMoreText:", v8);

  -[SFResultSection rankingScore](self, "rankingScore");
  objc_msgSend(v3, "setRankingScore:");
  -[SFMutableResultSection groupId](self, "groupId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupId:", v9);

  objc_msgSend(v3, "setDomain:", -[SFMutableResultSection domain](self, "domain"));
  -[SFMutableResultSection groupName](self, "groupName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupName:", v10);

  objc_msgSend(v3, "setDoNotFold:", -[SFMutableResultSection doNotFold](self, "doNotFold"));
  objc_msgSend(v3, "setPinToTop:", -[SFMutableResultSection pinToTop](self, "pinToTop"));
  -[SFMutableResultSection headerResult](self, "headerResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHeaderResult:", v11);

  -[SFResultSection button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButton:", v12);

  objc_msgSend(v3, "setIsInitiallyHidden:", -[SFResultSection isInitiallyHidden](self, "isInitiallyHidden"));
  -[SFMutableResultSection resultSet](self, "resultSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:copyItems:", v13, 1);
    objc_msgSend(v3, "setResultSet:", v14);

  }
  return v3;
}

- (id)copySectionRemovingResults:(id)a3
{
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

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setMaxInitiallyVisibleResults:", -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults"));
  -[SFResultSection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v7);

  -[SFResultSection title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v8);

  -[SFResultSection subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v9);

  -[SFResultSection moreText](self, "moreText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMoreText:", v10);

  -[SFResultSection rankingScore](self, "rankingScore");
  objc_msgSend(v5, "setRankingScore:");
  -[SFMutableResultSection groupId](self, "groupId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupId:", v11);

  objc_msgSend(v5, "setDomain:", -[SFMutableResultSection domain](self, "domain"));
  -[SFMutableResultSection groupName](self, "groupName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupName:", v12);

  objc_msgSend(v5, "setDoNotFold:", -[SFMutableResultSection doNotFold](self, "doNotFold"));
  objc_msgSend(v5, "setPinToTop:", -[SFMutableResultSection pinToTop](self, "pinToTop"));
  -[SFMutableResultSection headerResult](self, "headerResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderResult:", v13);

  -[SFResultSection button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButton:", v14);

  -[SFMutableResultSection resultSet](self, "resultSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "minusOrderedSet:", v4);
    objc_msgSend(v5, "setResultSet:", v16);
    v15 = v16;
  }

  return v5;
}

- (void)setResults:(id)a3
{
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *resultSet;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", a3);
  v4 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  resultSet = self->_resultSet;
  self->_resultSet = v4;

}

- (void)copyAndSetResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = objc_alloc((Class)objc_opt_class());
        v13 = (void *)objc_msgSend(v12, "initWithResult:", v11, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[SFMutableResultSection setResults:](self, "setResults:", v5);
}

- (void)clearResults
{
  -[NSMutableOrderedSet removeAllObjects](self->_resultSet, "removeAllObjects");
}

- (void)addResultsFromArray:(id)a3
{
  id v4;
  NSMutableOrderedSet *resultSet;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  resultSet = self->_resultSet;
  v8 = v4;
  if (!resultSet)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_resultSet;
    self->_resultSet = v6;

    v4 = v8;
    resultSet = self->_resultSet;
  }
  -[NSMutableOrderedSet addObjectsFromArray:](resultSet, "addObjectsFromArray:", v4);

}

- (void)addResults:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSMutableOrderedSet *resultSet;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *v9;
  id v10;

  v6 = a3;
  resultSet = self->_resultSet;
  v10 = v6;
  if (!resultSet)
  {
    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v9 = self->_resultSet;
    self->_resultSet = v8;

    v6 = v10;
    resultSet = self->_resultSet;
  }
  -[NSMutableOrderedSet insertObject:atIndex:](resultSet, "insertObject:atIndex:", v6, a4);

}

- (unint64_t)resultsCount
{
  return -[NSMutableOrderedSet count](self->_resultSet, "count");
}

- (unint64_t)indexOfResult:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_resultSet, "indexOfObject:", a3);
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_resultSet, "objectAtIndex:", a3);
}

- (void)removeResultsAtIndex:(unint64_t)a3
{
  -[NSMutableOrderedSet removeObjectAtIndex:](self->_resultSet, "removeObjectAtIndex:", a3);
}

- (void)removeResults:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->_resultSet, "removeObject:", a3);
}

- (void)removeResultsInRange:(_NSRange)a3
{
  -[NSMutableOrderedSet removeObjectsInRange:](self->_resultSet, "removeObjectsInRange:", a3.location, a3.length);
}

- (void)removeResultsInArray:(id)a3
{
  -[NSMutableOrderedSet removeObjectsInArray:](self->_resultSet, "removeObjectsInArray:", a3);
}

- (void)replaceResultsAtIndex:(unint64_t)a3 withResults:(id)a4
{
  -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_resultSet, "replaceObjectAtIndex:withObject:", a3, a4);
}

- (void)moveResultsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](self->_resultSet, "moveObjectsAtIndexes:toIndex:", a3, a4);
}

- (void)filterUsingPredicate:(id)a3
{
  -[NSMutableOrderedSet filterUsingPredicate:](self->_resultSet, "filterUsingPredicate:", a3);
}

- (void)sortUsingComparator:(id)a3
{
  -[NSMutableOrderedSet sortUsingComparator:](self->_resultSet, "sortUsingComparator:", a3);
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  -[NSMutableOrderedSet sortWithOptions:usingComparator:](self->_resultSet, "sortWithOptions:usingComparator:", a3, a4);
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  -[NSMutableOrderedSet sortRange:options:usingComparator:](self->_resultSet, "sortRange:options:usingComparator:", a3.location, a3.length, a4, a5);
}

- (void)setHiddenExtResults:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenExtResults, a3);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (NSNumber)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (NSMutableOrderedSet)resultSet
{
  return self->_resultSet;
}

- (void)setResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_resultSet, a3);
}

- (SPGroupHeadingResult)headerResult
{
  return self->_headerResult;
}

- (void)setHeaderResult:(id)a3
{
  objc_storeStrong((id *)&self->_headerResult, a3);
}

- (BOOL)doNotFold
{
  return self->_doNotFold;
}

- (void)setDoNotFold:(BOOL)a3
{
  self->_doNotFold = a3;
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)setDomain:(unsigned int)a3
{
  self->_domain = a3;
}

- (BOOL)pinToTop
{
  return self->_pinToTop;
}

- (void)setPinToTop:(BOOL)a3
{
  self->_pinToTop = a3;
}

- (NSString)relatedSectionBundleIdentifier
{
  return self->_relatedSectionBundleIdentifier;
}

- (void)setRelatedSectionBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_relatedSectionBundleIdentifier, a3);
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (NSString)sourceDomain
{
  return self->_sourceDomain;
}

- (void)setSourceDomain:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDomain, a3);
}

- (NSString)resultSetIdentifier
{
  return self->_resultSetIdentifier;
}

- (BOOL)serialized
{
  return self->_serialized;
}

- (void)setSerialized:(BOOL)a3
{
  self->_serialized = a3;
}

- (BOOL)isGlanceCategory
{
  return self->_isGlanceCategory;
}

- (void)setIsGlanceCategory:(BOOL)a3
{
  self->_isGlanceCategory = a3;
}

- (NSString)preMergeBundleIdentifier
{
  return self->_preMergeBundleIdentifier;
}

- (void)setPreMergeBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_preMergeBundleIdentifier, a3);
}

@end

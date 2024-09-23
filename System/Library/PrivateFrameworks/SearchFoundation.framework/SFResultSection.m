@implementation SFResultSection

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (SFCommandButtonItem)button
{
  return self->_button;
}

- (SFResultSection)init
{
  SFResultSection *v2;
  id v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFResultSection;
  v2 = -[SFResultSection init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_moreText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleButtonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_rankingScore"), self->_rankingScore);
  objc_msgSend(v5, "encodeObject:forKey:", self->_results, CFSTR("_results"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxInitiallyVisibleResults, CFSTR("_maxInitiallyVisibleResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_moreText, CFSTR("_moreText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_button, CFSTR("_button"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInitiallyHidden, CFSTR("_isInitiallyHidden"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("_subtitle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_totalAvailableResults, CFSTR("_totalAvailableResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleButtonItem, CFSTR("_titleButtonItem"));

}

- (SFResultSection)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bundleIdentifier;
  NSString *v7;
  NSString *title;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *results;
  NSString *v15;
  NSString *moreText;
  SFCommandButtonItem *v17;
  SFCommandButtonItem *button;
  NSString *v19;
  NSString *identifier;
  NSString *v21;
  NSString *subtitle;
  SFCommandButtonItem *v23;
  SFCommandButtonItem *titleButtonItem;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = a3;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v5;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v7;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_rankingScore"));
    self->_rankingScore = v9;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_results"));
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    results = self->_results;
    self->_results = v13;

    self->_maxInitiallyVisibleResults = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maxInitiallyVisibleResults"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_moreText"));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    moreText = self->_moreText;
    self->_moreText = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_button"));
    v17 = (SFCommandButtonItem *)objc_claimAutoreleasedReturnValue();
    button = self->_button;
    self->_button = v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v19;

    self->_isInitiallyHidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isInitiallyHidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subtitle"));
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle = self->_subtitle;
    self->_subtitle = v21;

    self->_totalAvailableResults = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_totalAvailableResults"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleButtonItem"));
    v23 = (SFCommandButtonItem *)objc_claimAutoreleasedReturnValue();

    titleButtonItem = self->_titleButtonItem;
    self->_titleButtonItem = v23;

  }
  return self;
}

- (unint64_t)maxInitiallyVisibleResults
{
  return self->_maxInitiallyVisibleResults;
}

- (NSArray)results
{
  return self->_results;
}

- (BOOL)isInitiallyHidden
{
  return self->_isInitiallyHidden;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)totalAvailableResults
{
  return self->_totalAvailableResults;
}

- (SFCommandButtonItem)titleButtonItem
{
  return self->_titleButtonItem;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (NSDictionary)dictionaryRepresentation
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
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bundleIdentifier"));

  }
  -[SFResultSection identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SFResultSection identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));

  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SFResultSection rankingScore](self, "rankingScore");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rankingScore"));

  -[SFResultSection results](self, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SFResultSection results](self, "results", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("results"));
  }
  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SFResultSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFResultSection bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v6;

  -[SFResultSection title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v9;

  -[SFResultSection rankingScore](self, "rankingScore");
  *(_QWORD *)(v4 + 88) = v11;
  -[SFResultSection results](self, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  v14 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v13;

  *(_QWORD *)(v4 + 24) = -[SFResultSection maxInitiallyVisibleResults](self, "maxInitiallyVisibleResults");
  -[SFResultSection identifier](self, "identifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v15;

  *(_BYTE *)(v4 + 8) = -[SFResultSection isInitiallyHidden](self, "isInitiallyHidden");
  -[SFResultSection button](self, "button");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  v19 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v18;

  -[SFResultSection subtitle](self, "subtitle");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v20;

  -[SFResultSection moreText](self, "moreText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  v24 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v23;

  *(_QWORD *)(v4 + 96) = -[SFResultSection totalAvailableResults](self, "totalAvailableResults");
  -[SFResultSection titleButtonItem](self, "titleButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copy");
  v27 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v26;

  return (id)v4;
}

- (void)setMaxInitiallyVisibleResults:(unint64_t)a3
{
  self->_maxInitiallyVisibleResults = a3;
}

- (void)setIsInitiallyHidden:(BOOL)a3
{
  self->_isInitiallyHidden = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTitleButtonItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)moreText
{
  return self->_moreText;
}

- (void)setMoreText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (void)setTotalAvailableResults:(unint64_t)a3
{
  self->_totalAvailableResults = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

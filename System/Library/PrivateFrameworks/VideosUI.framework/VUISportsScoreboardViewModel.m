@implementation VUISportsScoreboardViewModel

- (VUISportsScoreboardViewModel)initWithDictionary:(id)a3
{
  id v4;
  VUISportsScoreboardViewModel *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  uint64_t v8;
  NSString *canonicalId;
  uint64_t v10;
  NSDictionary *leagueContext;
  uint64_t v12;
  NSString *leagueId;
  uint64_t v14;
  NSArray *scores;
  uint64_t v16;
  NSDictionary *contentMetadata;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *v21;
  NSDate *lastUpdatedTime;
  NSDate *v23;
  uint64_t v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VUISportsScoreboardViewModel;
  v5 = -[VUISportsScoreboardViewModel init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("sportingEventId"));
    v8 = objc_claimAutoreleasedReturnValue();
    canonicalId = v5->_canonicalId;
    v5->_canonicalId = (NSString *)v8;

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("leagueContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    leagueContext = v5->_leagueContext;
    v5->_leagueContext = (NSDictionary *)v10;

    -[NSDictionary vui_stringForKey:](v5->_leagueContext, "vui_stringForKey:", CFSTR("leagueId"));
    v12 = objc_claimAutoreleasedReturnValue();
    leagueId = v5->_leagueId;
    v5->_leagueId = (NSString *)v12;

    objc_msgSend(v4, "vui_arrayForKey:", CFSTR("scores"));
    v14 = objc_claimAutoreleasedReturnValue();
    scores = v5->_scores;
    v5->_scores = (NSArray *)v14;

    v5->_suppressed = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("suppressScoreboard"), 0);
    v5->_configureScoreUpdates = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("configureScoreUpdates"), 0);
    v5->_isVersus = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("isVersus"), 0);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("contentMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    contentMetadata = v5->_contentMetadata;
    v5->_contentMetadata = (NSDictionary *)v16;

    objc_msgSend(v4, "vui_numberForKey:", CFSTR("lastUpdatedTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18
      && (v20 = objc_msgSend(v18, "longLongValue"),
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v20 / 1000.0),
          (v21 = (NSDate *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      lastUpdatedTime = v5->_lastUpdatedTime;
      v5->_lastUpdatedTime = v21;
      v23 = v21;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v24 = objc_claimAutoreleasedReturnValue();
      v23 = v5->_lastUpdatedTime;
      v5->_lastUpdatedTime = (NSDate *)v24;
    }

    -[VUISportsScoreboardViewModel removeUnicodeFromScoreValuesIfNeeded](v5, "removeUnicodeFromScoreValuesIfNeeded");
  }

  return v5;
}

- (BOOL)showScoreboard
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sportsScoreSpoilersAllowed"))
    v4 = !self->_suppressed;
  else
    v4 = 0;

  return v4;
}

- (id)jsContextDictionary
{
  id v3;
  NSDictionary *leagueContext;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSString length](self->_canonicalId, "length"))
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_canonicalId, CFSTR("sportingEventId"));
  leagueContext = self->_leagueContext;
  if (leagueContext && -[NSDictionary count](leagueContext, "count"))
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_leagueContext, CFSTR("leagueContext"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)dictionaryRepresentation
{
  return (id)-[NSDictionary copy](self->_dictionaryRepresentation, "copy");
}

- (void)removeUnicodeFromScoreValuesIfNeeded
{
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSArray *v15;
  NSArray *scores;
  id v17;

  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_scores, "count"))
  {
    v3 = 0;
    do
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSArray objectAtIndexedSubscript:](self->_scores, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        v7 = 0;
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_scores, "objectAtIndexedSubscript:", v3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" ٠ "), CFSTR(" "));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" · "), CFSTR(" "));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v11);
          ++v7;
          -[NSArray objectAtIndexedSubscript:](self->_scores, "objectAtIndexedSubscript:", v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

        }
        while (v7 < v13);
      }
      v14 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v17, "addObject:", v14);

      ++v3;
    }
    while (v3 < -[NSArray count](self->_scores, "count"));
  }
  v15 = (NSArray *)objc_msgSend(v17, "copy");
  scores = self->_scores;
  self->_scores = v15;

}

- (BOOL)isEqual:(id)a3
{
  VUISportsScoreboardViewModel *v4;
  BOOL v5;

  v4 = (VUISportsScoreboardViewModel *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDictionary isEqualToDictionary:](self->_dictionaryRepresentation, "isEqualToDictionary:", v4->_dictionaryRepresentation);
  }

  return v5;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (NSString)leagueId
{
  return self->_leagueId;
}

- (NSDictionary)leagueContext
{
  return self->_leagueContext;
}

- (NSArray)scores
{
  return self->_scores;
}

- (BOOL)configureScoreUpdates
{
  return self->_configureScoreUpdates;
}

- (void)setConfigureScoreUpdates:(BOOL)a3
{
  self->_configureScoreUpdates = a3;
}

- (BOOL)isVersus
{
  return self->_isVersus;
}

- (NSDate)lastUpdatedTime
{
  return self->_lastUpdatedTime;
}

- (NSDictionary)contentMetadata
{
  return self->_contentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetadata, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTime, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_leagueContext, 0);
  objc_storeStrong((id *)&self->_leagueId, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end

@implementation SPCachedResult

- (SPCachedResult)initWithResult:(id)a3 topic:(id)a4 title:(id)a5 searchString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPCachedResult *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *searchString;
  double v19;
  uint64_t v20;
  NSDate *engagementTime;
  id v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSData *encodedNormalizedTopic;
  NSObject *p_super;
  id v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)SPCachedResult;
  v14 = -[SPCachedResult init](&v31, sel_init);
  if (v14)
  {
    truncatedTitle(v12);
    v15 = objc_claimAutoreleasedReturnValue();
    title = v14->_title;
    v14->_title = (NSString *)v15;

    truncatedSearchString(v13);
    v17 = objc_claimAutoreleasedReturnValue();
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v17;

    v14->_type = objc_msgSend(v10, "type");
    objc_msgSend(v10, "rankingScore");
    v14->_score = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = objc_claimAutoreleasedReturnValue();
    engagementTime = v14->_engagementTime;
    v14->_engagementTime = (NSDate *)v20;

    v22 = v11;
    if (v22)
    {
LABEL_8:
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, &v30);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v30;
      encodedNormalizedTopic = v14->_encodedNormalizedTopic;
      v14->_encodedNormalizedTopic = (NSData *)v25;

      if (!v26)
      {
LABEL_13:

        goto LABEL_14;
      }
      logForSPLogCategoryCaching();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[SPCachedResult initWithResult:topic:title:searchString:].cold.1(v10);
LABEL_12:

      goto LABEL_13;
    }
    v23 = objc_msgSend(v10, "type");
    if ((v23 - 28) >= 2)
    {
      if (v23 != 8)
        goto LABEL_11;
      +[SPLocalTopic localTopicWithDictionaryResult:](SPLocalTopic, "localTopicWithDictionaryResult:", v10);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C5E8]), "initWithType:query:identifier:", 8, v14->_title, &stru_1E6004970);
    }
    v22 = (id)v24;
    if (v24)
      goto LABEL_8;
LABEL_11:
    v22 = 0;
    v26 = 0;
    p_super = &v14->_encodedNormalizedTopic->super;
    v14->_encodedNormalizedTopic = 0;
    goto LABEL_12;
  }
LABEL_14:

  return v14;
}

- (SPCachedResult)initWithResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SPCachedResult *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSString *searchString;
  double v22;
  uint64_t v23;
  NSDate *engagementTime;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSData *encodedNormalizedTopic;
  NSObject *v31;
  id v33;
  id v34;
  objc_super v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v35.receiver = self;
  v35.super_class = (Class)SPCachedResult;
  v17 = -[SPCachedResult init](&v35, sel_init);
  if (v17)
  {
    truncatedTitle(v14);
    v18 = objc_claimAutoreleasedReturnValue();
    title = v17->_title;
    v17->_title = (NSString *)v18;

    truncatedSearchString(v16);
    v20 = objc_claimAutoreleasedReturnValue();
    searchString = v17->_searchString;
    v17->_searchString = (NSString *)v20;

    v17->_type = objc_msgSend(v12, "type");
    objc_msgSend(v12, "rankingScore");
    v17->_score = v22;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = objc_claimAutoreleasedReturnValue();
    engagementTime = v17->_engagementTime;
    v17->_engagementTime = (NSDate *)v23;

    v33 = v13;
    topicIdentifierWithIdentifierAndDetail(v13, v14, v15, 0, v17->_type, 1u);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    searchResultWithTopicIdentifier(v25, v17->_score);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C4B0]), "initWithResult:identifier:", v26, v25);
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v27, 1, &v34);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v34;
    encodedNormalizedTopic = v17->_encodedNormalizedTopic;
    v17->_encodedNormalizedTopic = (NSData *)v28;

    if (v29)
    {
      logForSPLogCategoryCaching();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[SPCachedResult initWithResult:identifier:bundleIdentifier:protectionClass:searchString:].cold.1(v12);

    }
    v13 = v33;
  }

  return v17;
}

- (SPCachedResult)initWithPersonName:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPCachedResult *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *searchString;
  double v19;
  uint64_t v20;
  NSDate *engagementTime;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSData *encodedNormalizedTopic;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  objc_super v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SPCachedResult;
  v14 = -[SPCachedResult init](&v37, sel_init);
  if (v14)
  {
    truncatedTitle(v10);
    v15 = objc_claimAutoreleasedReturnValue();
    title = v14->_title;
    v14->_title = (NSString *)v15;

    truncatedSearchString(v13);
    v17 = objc_claimAutoreleasedReturnValue();
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v17;

    v14->_type = 38;
    objc_msgSend(v12, "doubleValue");
    v14->_score = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = objc_claimAutoreleasedReturnValue();
    engagementTime = v14->_engagementTime;
    v14->_engagementTime = (NSDate *)v20;

    topicIdentifierWithPersonQueryIdentifierAndDetail(v11, 0, v14->_type, 1u);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPLocalTopic localTopicWithTopicIdentifier:](SPLocalTopic, "localTopicWithTopicIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, &v36);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v36;
    encodedNormalizedTopic = v14->_encodedNormalizedTopic;
    v14->_encodedNormalizedTopic = (NSData *)v24;

    if (v25)
    {
      logForSPLogCategoryCaching();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[SPCachedResult initWithPersonName:personQueryIdentifier:score:searchString:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    }
  }

  return v14;
}

- (SPCachedResult)initWithContactName:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SPCachedResult *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *searchString;
  double v19;
  uint64_t v20;
  NSDate *engagementTime;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSData *encodedNormalizedTopic;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  objc_super v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SPCachedResult;
  v14 = -[SPCachedResult init](&v38, sel_init);
  if (v14)
  {
    truncatedTitle(v10);
    v15 = objc_claimAutoreleasedReturnValue();
    title = v14->_title;
    v14->_title = (NSString *)v15;

    truncatedSearchString(v13);
    v17 = objc_claimAutoreleasedReturnValue();
    searchString = v14->_searchString;
    v14->_searchString = (NSString *)v17;

    v14->_type = 32;
    objc_msgSend(v12, "doubleValue");
    v14->_score = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = objc_claimAutoreleasedReturnValue();
    engagementTime = v14->_engagementTime;
    v14->_engagementTime = (NSDate *)v20;

    if (!objc_msgSend(v11, "length") || v10 && (objc_msgSend(v11, "isEqualToString:", v10) & 1) != 0)
    {
      v14->_type = 38;
      topicIdentifierWithContactInfoAndDetail(v10, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0x26u, 1u);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      topicIdentifierWithContactIdentifierAndDetail(v10, v11, 0, v14->_type, 1u);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;
    +[SPLocalTopic localTopicWithTopicIdentifier:](SPLocalTopic, "localTopicWithTopicIdentifier:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, &v37);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v37;
    encodedNormalizedTopic = v14->_encodedNormalizedTopic;
    v14->_encodedNormalizedTopic = (NSData *)v25;

    if (v26)
    {
      logForSPLogCategoryCaching();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SPCachedResult initWithContactName:contactIdentifier:score:searchString:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);

    }
  }

  return v14;
}

- (SPCachedResult)initWithTitle:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6
{
  id v10;
  id v11;
  id v12;
  SPCachedResult *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *searchString;
  double v18;
  uint64_t v19;
  NSDate *engagementTime;
  uint64_t type;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSData *encodedNormalizedTopic;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  objc_super v37;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SPCachedResult;
  v13 = -[SPCachedResult init](&v37, sel_init);
  if (v13)
  {
    truncatedTitle(v10);
    v14 = objc_claimAutoreleasedReturnValue();
    title = v13->_title;
    v13->_title = (NSString *)v14;

    truncatedSearchString(v12);
    v16 = objc_claimAutoreleasedReturnValue();
    searchString = v13->_searchString;
    v13->_searchString = (NSString *)v16;

    v13->_type = a4;
    objc_msgSend(v11, "doubleValue");
    v13->_score = v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = objc_claimAutoreleasedReturnValue();
    engagementTime = v13->_engagementTime;
    v13->_engagementTime = (NSDate *)v19;

    if (a4 <= 0x1F && ((1 << a4) & 0xF0018000) != 0)
    {
      type = v13->_type;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13->_score);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPLocalTopic localTopicWithTitle:type:score:isCached:](SPLocalTopic, "localTopicWithTitle:type:score:isCached:", v10, type, v22, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C5E8]), "initWithType:query:identifier:", 7, v13->_title, &stru_1E6004970);
    }
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, &v36);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v36;
    encodedNormalizedTopic = v13->_encodedNormalizedTopic;
    v13->_encodedNormalizedTopic = (NSData *)v24;

    if (v25)
    {
      logForSPLogCategoryCaching();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[SPCachedResult initWithTitle:type:score:searchString:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    }
  }

  return v13;
}

- (SPCachedResult)initWithEngagedResult:(id)a3
{
  id v4;
  SPCachedResult *v5;
  uint64_t v6;
  NSString *title;
  double v8;
  double v9;
  uint64_t v10;
  NSDate *engagementTime;
  uint64_t v12;
  NSData *encodedNormalizedTopic;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SPCachedResult;
  v5 = -[SPCachedResult init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "score");
    v5->_score = v8;
    objc_msgSend(v4, "freshnessScore");
    v5->_freshnessScore = v9;
    objc_msgSend(v4, "engagementTime");
    v10 = objc_claimAutoreleasedReturnValue();
    engagementTime = v5->_engagementTime;
    v5->_engagementTime = (NSDate *)v10;

    objc_msgSend(v4, "encodedNormalizedTopic");
    v12 = objc_claimAutoreleasedReturnValue();
    encodedNormalizedTopic = v5->_encodedNormalizedTopic;
    v5->_encodedNormalizedTopic = (NSData *)v12;

  }
  return v5;
}

- (id)recentTopic
{
  void *v3;
  uint64_t v4;
  NSData *encodedNormalizedTopic;
  void *v6;
  id v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  SPRecentTopic *v12;
  SPRecentTopic *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  if (self->_encodedNormalizedTopic)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = objc_opt_class();
    encodedNormalizedTopic = self->_encodedNormalizedTopic;
    v18 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, encodedNormalizedTopic, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    v8 = v6 == 0;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v10 = 0;
LABEL_13:
      v13 = [SPRecentTopic alloc];
      v14 = (void *)MEMORY[0x1E0CB37E8];
      -[SPCachedResult freshnessScore](self, "freshnessScore");
      objc_msgSend(v14, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCachedResult engagementTime](self, "engagementTime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SPRecentTopic initWithTopic:score:engagementDate:](v13, "initWithTopic:score:engagementDate:", v6, v15, v16);

      goto LABEL_14;
    }
    v10 = v7;
  }
  else
  {
    v6 = 0;
    v10 = 0;
    v8 = 1;
  }
  logForSPLogCategoryCaching();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SPCachedResult recentTopic].cold.1((uint64_t)v10, v11);

  if (!v8)
    goto LABEL_13;
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)searchResult
{
  void *v2;
  void *v3;
  void *v4;

  -[SPCachedResult recentTopic](self, "recentTopic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "topic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (int)type
{
  return self->_type;
}

- (NSDate)engagementTime
{
  return self->_engagementTime;
}

- (double)score
{
  return self->_score;
}

- (double)freshnessScore
{
  return self->_freshnessScore;
}

- (NSData)encodedNormalizedTopic
{
  return self->_encodedNormalizedTopic;
}

- (void)setEncodedNormalizedTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedNormalizedTopic, 0);
  objc_storeStrong((id *)&self->_engagementTime, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithResult:(void *)a1 topic:title:searchString:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_4(&dword_1AF7DE000, v1, v2, "spotlight cache: could not encode cached topic: %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_6();
}

- (void)initWithResult:(void *)a1 identifier:bundleIdentifier:protectionClass:searchString:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_4(&dword_1AF7DE000, v1, v2, "spotlight cache: could not encode local cached topic: %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_6();
}

- (void)initWithPersonName:(uint64_t)a3 personQueryIdentifier:(uint64_t)a4 score:(uint64_t)a5 searchString:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, a1, a3, "spotlight cache: could not encode local person topic", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithContactName:(uint64_t)a3 contactIdentifier:(uint64_t)a4 score:(uint64_t)a5 searchString:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, a1, a3, "spotlight cache: could not encode local contact topic", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTitle:(uint64_t)a3 type:(uint64_t)a4 score:(uint64_t)a5 searchString:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF7DE000, a1, a3, "spotlight cache: could not encode generic topic", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)recentTopic
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF7DE000, a2, OS_LOG_TYPE_ERROR, "spotlight cache: could not encode generic topic. error: %@", (uint8_t *)&v2, 0xCu);
}

@end

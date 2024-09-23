@implementation ATXProactiveSuggestionUISpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextEndDate, 0);
  objc_storeStrong((id *)&self->_contextStartDate, 0);
  objc_storeStrong((id *)&self->_preferredLayoutConfigs, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)proto
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSDate *contextStartDate;
  double v13;
  NSDate *contextEndDate;
  double v15;
  char v17;
  _BYTE v18[15];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXPBProactiveSuggestionUISpecification setTitle:]((uint64_t)v3, self->_title);
  -[ATXPBProactiveSuggestionUISpecification setSubtitle:]((uint64_t)v3, self->_subtitle);
  -[ATXPBProactiveSuggestionUISpecification setReason:]((uint64_t)v3, self->_reason);
  -[ATXPBProactiveSuggestionUISpecification setAllowedOnLockscreen:]((uint64_t)v3, self->_allowedOnLockscreen);
  -[ATXPBProactiveSuggestionUISpecification setAllowedOnHomeScreen:]((uint64_t)v3, self->_allowedOnHomeScreen);
  -[ATXPBProactiveSuggestionUISpecification setAllowedOnSpotlight:]((uint64_t)v3, self->_allowedOnSpotlight);
  -[ATXPBProactiveSuggestionUISpecification setShouldClearOnEngagement:]((uint64_t)v3, self->_shouldClearOnEngagement);
  -[ATXPBProactiveSuggestionUISpecification setPredictionReasons:]((uint64_t)v3, self->_predictionReasons);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_preferredLayoutConfigs, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_preferredLayoutConfigs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          __atxlog_handle_blending();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[ATXProactiveSuggestionUISpecification proto].cold.1(&v17, v18);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  -[ATXPBProactiveSuggestionUISpecification setPreferredLayoutConfigs:]((uint64_t)v3, v4);
  contextStartDate = self->_contextStartDate;
  if (contextStartDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](contextStartDate, "timeIntervalSinceReferenceDate");
    -[ATXPBProactiveSuggestionUISpecification setContextStartDate:]((uint64_t)v3, v13);
  }
  contextEndDate = self->_contextEndDate;
  if (contextEndDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](contextEndDate, "timeIntervalSinceReferenceDate");
    -[ATXPBProactiveSuggestionUISpecification setContextEndDate:]((uint64_t)v3, v15);
  }

  return v3;
}

- (ATXProactiveSuggestionUISpecification)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  ATXProactiveSuggestionLayoutConfig *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  ATXProactiveSuggestionUISpecification *v20;
  void *v21;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[ATXPBProactiveSuggestionUISpecification preferredLayoutConfigs]((uint64_t)v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[ATXPBProactiveSuggestionUISpecification preferredLayoutConfigs]((uint64_t)v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v14 = -[ATXProactiveSuggestionLayoutConfig initWithProto:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
            objc_msgSend(v8, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v11);
      }

      -[ATXPBProactiveSuggestionUISpecification title]((uint64_t)v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBProactiveSuggestionUISpecification subtitle]((uint64_t)v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBProactiveSuggestionUISpecification reason]((uint64_t)v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[ATXPBProactiveSuggestionUISpecification allowedOnLockscreen]((_BOOL8)v5);
      v25 = -[ATXPBProactiveSuggestionUISpecification allowedOnHomeScreen]((_BOOL8)v5);
      v24 = -[ATXPBProactiveSuggestionUISpecification allowedOnSpotlight]((_BOOL8)v5);
      v17 = -[ATXPBProactiveSuggestionUISpecification shouldClearOnEngagement]((_BOOL8)v5);
      v18 = -[ATXPBProactiveSuggestionUISpecification predictionReasons]((uint64_t)v5);
      if (-[ATXPBProactiveSuggestionUISpecification hasContextStartDate]((uint64_t)v5))
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", -[ATXPBProactiveSuggestionUISpecification contextStartDate]((uint64_t)v5));
      else
        v19 = 0;
      if (-[ATXPBProactiveSuggestionUISpecification hasContextEndDate]((uint64_t)v5))
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", -[ATXPBProactiveSuggestionUISpecification contextEndDate]((uint64_t)v5));
      else
        v21 = 0;
      BYTE1(v23) = v17;
      LOBYTE(v23) = v24;
      self = -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", v27, v15, v16, v8, v26, v25, v23, v18, v19, v21);

      v20 = self;
    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestionUISpecification initWithProto:].cold.1();
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10 predictionReasons:(unint64_t)a11 contextStartDate:(id)a12 contextEndDate:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  ATXProactiveSuggestionUISpecification *v23;
  uint64_t v24;
  NSString *title;
  uint64_t v26;
  NSString *subtitle;
  uint64_t v28;
  NSString *reason;
  uint64_t v30;
  NSArray *preferredLayoutConfigs;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a12;
  v22 = a13;
  v35.receiver = self;
  v35.super_class = (Class)ATXProactiveSuggestionUISpecification;
  v23 = -[ATXProactiveSuggestionUISpecification init](&v35, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v34, "copy");
    title = v23->_title;
    v23->_title = (NSString *)v24;

    v26 = objc_msgSend(v33, "copy");
    subtitle = v23->_subtitle;
    v23->_subtitle = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    reason = v23->_reason;
    v23->_reason = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    preferredLayoutConfigs = v23->_preferredLayoutConfigs;
    v23->_preferredLayoutConfigs = (NSArray *)v30;

    v23->_allowedOnLockscreen = a7;
    v23->_allowedOnHomeScreen = a8;
    v23->_allowedOnSpotlight = a9;
    v23->_shouldClearOnEngagement = a10;
    v23->_predictionReasons = a11;
    objc_storeStrong((id *)&v23->_contextStartDate, a12);
    objc_storeStrong((id *)&v23->_contextEndDate, a13);
  }

  return v23;
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 preferredLayoutConfigs:(id)a5 allowedOnLockscreen:(BOOL)a6 allowedOnHomeScreen:(BOOL)a7 allowedOnSpotlight:(BOOL)a8
{
  uint64_t v9;

  BYTE1(v9) = 1;
  LOBYTE(v9) = a8;
  return -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", a3, a4, 0, a5, a6, a7, v9);
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10
{
  uint64_t v11;

  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", a3, a4, a5, a6, a7, a8, v11, 0);
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10 predictionReasons:(unint64_t)a11
{
  uint64_t v12;

  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", a3, a4, a5, a6, a7, a8, v12, a11, 0, 0);
}

- (id)description
{
  id v3;
  NSString *title;
  NSString *subtitle;
  NSUInteger v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  title = self->_title;
  subtitle = self->_subtitle;
  v6 = -[NSString hash](self->_reason, "hash");
  v7 = CFSTR("Yes");
  if (self->_shouldClearOnEngagement)
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  if (self->_allowedOnLockscreen)
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  if (self->_allowedOnHomeScreen)
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  if (!self->_allowedOnSpotlight)
    v7 = CFSTR("No");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("Title: %@   Subtitle: %@   Reason.hash: %lu   Layouts: %@   Should clear on engagement: %@   Allowed on Lockscreen: %@   Allowed on HomeScreen: %@   Allowed on Spotlight: %@   Executable prediction reason: %llu   "), title, subtitle, v6, self->_preferredLayoutConfigs, v8, v9, v10, v7, self->_predictionReasons);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXProactiveSuggestionUISpecification *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXProactiveSuggestionUISpecification *v9;
  uint64_t v11;

  v4 = +[ATXProactiveSuggestionUISpecification allocWithZone:](ATXProactiveSuggestionUISpecification, "allocWithZone:", a3);
  v5 = (void *)-[NSString copy](self->_title, "copy");
  v6 = (void *)-[NSString copy](self->_subtitle, "copy");
  v7 = (void *)-[NSString copy](self->_reason, "copy");
  v8 = (void *)-[NSArray copy](self->_preferredLayoutConfigs, "copy");
  LOWORD(v11) = *(_WORD *)&self->_allowedOnSpotlight;
  v9 = -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:](v4, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", v5, v6, v7, v8, self->_allowedOnLockscreen, self->_allowedOnHomeScreen, v11, self->_predictionReasons, self->_contextStartDate, self->_contextEndDate);

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_subtitle, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_reason, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_preferredLayoutConfigs, "hash");
  v7 = self->_allowedOnLockscreen - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = self->_allowedOnHomeScreen - v7 + 32 * v7;
  v9 = self->_allowedOnSpotlight - v8 + 32 * v8;
  v10 = self->_shouldClearOnEngagement - v9 + 32 * v9;
  v11 = self->_predictionReasons - v10 + 32 * v10;
  v12 = (char *)&self->_contextStartDate[4 * v11] - v11;
  return (char *)self->_contextEndDate - v12 + 32 * (_QWORD)v12;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionUISpecification *v4;
  ATXProactiveSuggestionUISpecification *v5;
  NSString *title;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *subtitle;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  NSString *reason;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSArray *preferredLayoutConfigs;
  NSArray *v23;
  NSArray *v24;
  NSArray *v25;
  char v26;
  NSDate *contextStartDate;
  NSDate *v28;
  NSDate *v29;
  NSDate *v30;
  char v31;
  NSDate *v33;
  NSDate *v34;

  v4 = (ATXProactiveSuggestionUISpecification *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      v7 = v5->_title;
      if (title == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = title;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_28;
      }
      subtitle = self->_subtitle;
      v13 = v5->_subtitle;
      if (subtitle == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = subtitle;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_28;
      }
      reason = self->_reason;
      v18 = v5->_reason;
      if (reason == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = reason;
        v21 = -[NSString isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
          goto LABEL_28;
      }
      preferredLayoutConfigs = self->_preferredLayoutConfigs;
      v23 = v5->_preferredLayoutConfigs;
      if (preferredLayoutConfigs == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = preferredLayoutConfigs;
        v26 = -[NSArray isEqual:](v25, "isEqual:", v24);

        if ((v26 & 1) == 0)
          goto LABEL_28;
      }
      if (self->_allowedOnLockscreen != -[ATXProactiveSuggestionUISpecification allowedOnLockscreen](v5, "allowedOnLockscreen")|| self->_allowedOnHomeScreen != -[ATXProactiveSuggestionUISpecification allowedOnHomeScreen](v5, "allowedOnHomeScreen")|| self->_allowedOnSpotlight != -[ATXProactiveSuggestionUISpecification allowedOnSpotlight](v5, "allowedOnSpotlight")|| self->_shouldClearOnEngagement != -[ATXProactiveSuggestionUISpecification shouldClearOnEngagement](v5, "shouldClearOnEngagement")|| -[ATXProactiveSuggestionUISpecification predictionReasons](v5, "predictionReasons") != self->_predictionReasons)
      {
        goto LABEL_28;
      }
      contextStartDate = self->_contextStartDate;
      v28 = v5->_contextStartDate;
      if (contextStartDate == v28)
      {

      }
      else
      {
        v29 = v28;
        v30 = contextStartDate;
        v31 = -[NSDate isEqual:](v30, "isEqual:", v29);

        if ((v31 & 1) == 0)
        {
LABEL_28:
          v11 = 0;
LABEL_29:

          goto LABEL_30;
        }
      }
      v33 = self->_contextEndDate;
      v34 = v33;
      if (v33 == v5->_contextEndDate)
        v11 = 1;
      else
        v11 = -[NSDate isEqual:](v33, "isEqual:");

      goto LABEL_29;
    }
    v11 = 0;
  }
LABEL_30:

  return v11;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestionUISpecification proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXProactiveSuggestionUISpecification)initWithProtoData:(id)a3
{
  id v4;
  ATXPBProactiveSuggestionUISpecification *v5;
  ATXProactiveSuggestionUISpecification *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBProactiveSuggestionUISpecification initWithData:]([ATXPBProactiveSuggestionUISpecification alloc], "initWithData:", v4);

    self = -[ATXProactiveSuggestionUISpecification initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXProactiveSuggestionUISpecification encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXProactiveSuggestionUISpecification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestionUISpecification *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXProactiveSuggestionUISpecification initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  const __CFString *title;
  NSString *subtitle;
  const __CFString *v5;
  const __CFString *reason;
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
  _QWORD v18[10];
  _QWORD v19[11];

  v19[10] = *MEMORY[0x1E0C80C00];
  title = (const __CFString *)self->_title;
  subtitle = self->_subtitle;
  if (!title)
    title = CFSTR("nil");
  v18[0] = CFSTR("title");
  v18[1] = CFSTR("subtitle");
  if (subtitle)
    v5 = (const __CFString *)subtitle;
  else
    v5 = CFSTR("nil");
  v19[0] = title;
  v19[1] = v5;
  reason = (const __CFString *)self->_reason;
  if (!reason)
    reason = CFSTR("nil");
  v19[2] = reason;
  v18[2] = CFSTR("reason");
  v18[3] = CFSTR("allowedOnLockscreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowedOnLockscreen);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v7;
  v18[4] = CFSTR("allowedOnHomeScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowedOnHomeScreen);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v8;
  v18[5] = CFSTR("allowedOnSpotlight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowedOnSpotlight);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  v18[6] = CFSTR("shouldClearOnEngagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldClearOnEngagement);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v10;
  v18[7] = CFSTR("predictionReasons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_predictionReasons);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v11;
  v18[8] = CFSTR("contextStartDate");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_contextStartDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v13;
  v18[9] = CFSTR("contextEndDate");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_contextEndDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)preferredLayoutConfigs
{
  return self->_preferredLayoutConfigs;
}

- (BOOL)allowedOnLockscreen
{
  return self->_allowedOnLockscreen;
}

- (BOOL)allowedOnHomeScreen
{
  return self->_allowedOnHomeScreen;
}

- (BOOL)allowedOnSpotlight
{
  return self->_allowedOnSpotlight;
}

- (BOOL)shouldClearOnEngagement
{
  return self->_shouldClearOnEngagement;
}

- (unint64_t)predictionReasons
{
  return self->_predictionReasons;
}

- (NSDate)contextStartDate
{
  return self->_contextStartDate;
}

- (NSDate)contextEndDate
{
  return self->_contextEndDate;
}

- (void)initWithProto:.cold.1()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA841000, v4, v5, "Unable to construct class %@ from ProtoBuf object Protobuf object was of class: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_3();
}

- (void)proto
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13(a1, a2);
  _os_log_error_impl(&dword_1AA841000, v2, OS_LOG_TYPE_ERROR, "Unable to generate inner ProtoBuf class for ATXProactiveSuggestionLayoutConfig", v3, 2u);
}

@end

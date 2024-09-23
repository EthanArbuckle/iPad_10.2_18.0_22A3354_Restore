@implementation ATXProactiveSuggestionUIFeedbackResult

- (ATXProactiveSuggestionUIFeedbackResult)initWithShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5 session:(id)a6 consumerSubType:(unsigned __int8)a7 clientCacheUpdate:(id)a8 uiCacheUpdate:(id)a9 context:(id)a10
{
  uint64_t v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  ATXProactiveSuggestionUIFeedbackResult *v24;

  v11 = a7;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = -[ATXProactiveSuggestionUIFeedbackResult initWithEngagementType:shownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:](self, "initWithEngagementType:shownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:", -[ATXProactiveSuggestionUIFeedbackResult uiEngagementTypeFromShownSuggestions:engagedSuggestions:rejectedSuggestions:](self, "uiEngagementTypeFromShownSuggestions:engagedSuggestions:rejectedSuggestions:", v23, v22, v21), v23, v22, v21, v20, v11, v19, v18, v17);

  return v24;
}

- (ATXProactiveSuggestionUIFeedbackResult)initWithEngagementType:(int64_t)a3 shownSuggestions:(id)a4 engagedSuggestions:(id)a5 rejectedSuggestions:(id)a6 session:(id)a7 consumerSubType:(unsigned __int8)a8 clientCacheUpdate:(id)a9 uiCacheUpdate:(id)a10 context:(id)a11
{
  uint64_t v11;
  id v17;
  ATXProactiveSuggestionUIFeedbackResult *v18;
  ATXProactiveSuggestionUIFeedbackResult *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v11 = a8;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXProactiveSuggestionUIFeedbackResult;
  v18 = -[ATXProactiveSuggestionFeedbackResult initWithConsumerSubType:sessionType:clientCacheUpdate:uiCacheUpdate:context:](&v25, sel_initWithConsumerSubType_sessionType_clientCacheUpdate_uiCacheUpdate_context_, v11, 0, a9, a10, a11);
  v19 = v18;
  if (v18)
  {
    v18->_engagementType = a3;
    objc_storeStrong((id *)&v18->_shownSuggestions, a4);
    objc_storeStrong((id *)&v19->_engagedSuggestions, a5);
    objc_storeStrong((id *)&v19->_rejectedSuggestions, a6);
    objc_storeStrong((id *)&v19->_session, a7);
  }

  return v19;
}

- (int64_t)uiEngagementTypeFromShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5
{
  id v6;
  int64_t v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_msgSend(a5, "count") != 0;
  v8 = objc_msgSend(v6, "count");

  if (v8)
    return 2;
  else
    return v7;
}

- (unint64_t)hash
{
  int64_t engagementType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  engagementType = self->_engagementType;
  v4 = -[NSArray hash](self->_engagedSuggestions, "hash") - engagementType + 32 * engagementType;
  v5 = -[NSArray hash](self->_shownSuggestions, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_rejectedSuggestions, "hash") - v5 + 32 * v5;
  v7 = 31 * (-[ATXProactiveSuggestionUIFeedbackSession hash](self->_session, "hash") - v6 + 32 * v6);
  v8 = v7 + -[ATXProactiveSuggestionFeedbackResult consumerSubType](self, "consumerSubType");
  -[ATXProactiveSuggestionFeedbackResult clientCacheUpdate](self, "clientCacheUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[ATXProactiveSuggestionFeedbackResult uiCacheUpdate](self, "uiCacheUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  -[ATXProactiveSuggestionFeedbackResult context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash") - v12 + 32 * v12;

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionUIFeedbackResult *v4;
  ATXProactiveSuggestionUIFeedbackResult *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionUIFeedbackResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionUIFeedbackResult isEqualToATXProactiveSuggestionUIFeedbackResult:](self, "isEqualToATXProactiveSuggestionUIFeedbackResult:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionUIFeedbackResult:(id)a3
{
  id *v4;
  int64_t engagementType;
  NSArray *engagedSuggestions;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  NSArray *shownSuggestions;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  char v15;
  NSArray *rejectedSuggestions;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;
  ATXProactiveSuggestionUIFeedbackSession *session;
  ATXProactiveSuggestionUIFeedbackSession *v22;
  ATXProactiveSuggestionUIFeedbackSession *v23;
  ATXProactiveSuggestionUIFeedbackSession *v24;
  BOOL v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  char v39;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;

  v4 = (id *)a3;
  engagementType = self->_engagementType;
  if (engagementType != objc_msgSend(v4, "engagementType"))
    goto LABEL_25;
  engagedSuggestions = self->_engagedSuggestions;
  v7 = (NSArray *)v4[8];
  if (engagedSuggestions == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = engagedSuggestions;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_25;
  }
  shownSuggestions = self->_shownSuggestions;
  v12 = (NSArray *)v4[7];
  if (shownSuggestions == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = shownSuggestions;
    v15 = -[NSArray isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_25;
  }
  rejectedSuggestions = self->_rejectedSuggestions;
  v17 = (NSArray *)v4[9];
  if (rejectedSuggestions == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = rejectedSuggestions;
    v20 = -[NSArray isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_25;
  }
  session = self->_session;
  v22 = (ATXProactiveSuggestionUIFeedbackSession *)v4[10];
  if (session == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = session;
    v25 = -[ATXProactiveSuggestionUIFeedbackSession isEqual:](v24, "isEqual:", v23);

    if (!v25)
      goto LABEL_25;
  }
  v26 = -[ATXProactiveSuggestionFeedbackResult consumerSubType](self, "consumerSubType");
  if (v26 != objc_msgSend(v4, "consumerSubType"))
  {
LABEL_25:
    v39 = 0;
    goto LABEL_26;
  }
  -[ATXProactiveSuggestionFeedbackResult clientCacheUpdate](self, "clientCacheUpdate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientCacheUpdate");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v27 == (void *)v28)
  {

  }
  else
  {
    v29 = (void *)v28;
    -[ATXProactiveSuggestionFeedbackResult clientCacheUpdate](self, "clientCacheUpdate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientCacheUpdate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_25;
  }
  -[ATXProactiveSuggestionFeedbackResult uiCacheUpdate](self, "uiCacheUpdate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiCacheUpdate");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v33 == (void *)v34)
  {

  }
  else
  {
    v35 = (void *)v34;
    -[ATXProactiveSuggestionFeedbackResult uiCacheUpdate](self, "uiCacheUpdate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiCacheUpdate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_25;
  }
  -[ATXProactiveSuggestionFeedbackResult context](self, "context");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v41 == (void *)v42)
  {
    v39 = 1;
    v43 = v41;
  }
  else
  {
    v43 = (void *)v42;
    -[ATXProactiveSuggestionFeedbackResult context](self, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v44, "isEqual:", v45);

  }
LABEL_26:

  return v39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", -[ATXProactiveSuggestionFeedbackResult consumerSubType](self, "consumerSubType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("consumerSubType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXProactiveSuggestionFeedbackResult sessionType](self, "sessionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("sessionType"));

  -[ATXProactiveSuggestionFeedbackResult clientCacheUpdate](self, "clientCacheUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("clientCache"));

  -[ATXProactiveSuggestionFeedbackResult uiCacheUpdate](self, "uiCacheUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("uiCache"));

  -[ATXProactiveSuggestionFeedbackResult context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("context"));

  -[ATXProactiveSuggestionFeedbackResult context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ATXProactiveSuggestionFeedbackResult context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("contextString"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_engagementType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("uiEngagementType"));

  objc_msgSend(v14, "encodeObject:forKey:", self->_engagedSuggestions, CFSTR("engaged"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_shownSuggestions, CFSTR("shown"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_rejectedSuggestions, CFSTR("dismissed"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_session, CFSTR("session"));

}

- (ATXProactiveSuggestionUIFeedbackResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestionUIFeedbackResult *v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending_ecosystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("consumerSubType"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v8, 0);
      if ((_DWORD)v12)
      {
        v13 = v12;
        v14 = (void *)MEMORY[0x1E0D81610];
        v15 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v15, CFSTR("sessionType"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17
          || (objc_msgSend(v4, "error"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
        {
          v10 = 0;
LABEL_50:

          goto LABEL_4;
        }
        v19 = (void *)MEMORY[0x1E0D81610];
        v20 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("clientCache"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22
          || (objc_msgSend(v4, "error"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, v23))
        {
          v10 = 0;
LABEL_49:

          goto LABEL_50;
        }
        v73 = v22;
        v24 = (void *)MEMORY[0x1E0D81610];
        v25 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v25, CFSTR("uiCache"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27
          || (objc_msgSend(v4, "error"), v28 = (void *)objc_claimAutoreleasedReturnValue(), v28, v28))
        {
          v10 = 0;
          v22 = v73;
LABEL_48:

          goto LABEL_49;
        }
        v72 = v27;
        v29 = (void *)MEMORY[0x1E0D81610];
        v30 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v30, CFSTR("contextString"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v10 = 0;
          v27 = v72;
          v22 = v73;
LABEL_47:

          goto LABEL_48;
        }
        v22 = v73;
        if (v32
          && (-[ATXProactiveSuggestionFeedbackResult validContextClassNames](self, "validContextClassNames"),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              v35 = objc_msgSend(v34, "containsObject:", v32),
              v34,
              v35))
        {
          v36 = NSClassFromString((NSString *)v32);
          if (!v36)
            goto LABEL_22;
          v70 = (void *)MEMORY[0x1E0D81610];
          __atxlog_handle_blending_ecosystem();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v36, CFSTR("context"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v37);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36
            || (objc_msgSend(v4, "error"), v38 = (void *)objc_claimAutoreleasedReturnValue(), v38, v38))
          {
LABEL_22:
            v10 = 0;
            v27 = v72;
LABEL_46:

            goto LABEL_47;
          }
          v68 = v32;
          v69 = v36;
        }
        else
        {
          v68 = v32;
          v69 = 0;
        }
        v39 = (void *)MEMORY[0x1E0D81610];
        v40 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v40, CFSTR("uiEngagementType"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v41);
        v42 = objc_claimAutoreleasedReturnValue();

        v71 = (void *)v42;
        if (v42
          && (objc_msgSend(v4, "error"), v43 = (void *)objc_claimAutoreleasedReturnValue(), v43, !v43))
        {
          v44 = (void *)MEMORY[0x1AF421DC4]();
          v45 = objc_alloc(MEMORY[0x1E0C99E60]);
          v46 = objc_opt_class();
          v47 = (void *)objc_msgSend(v45, "initWithObjects:", v46, objc_opt_class(), 0);
          objc_autoreleasePoolPop(v44);
          v48 = (void *)MEMORY[0x1E0D81610];
          __atxlog_handle_blending_ecosystem();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v47, CFSTR("engaged"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50
            && (objc_msgSend(v4, "error"), v51 = (void *)objc_claimAutoreleasedReturnValue(), v51, !v51))
          {
            v52 = (void *)MEMORY[0x1E0D81610];
            __atxlog_handle_blending_ecosystem();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v47, CFSTR("shown"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v53);
            v54 = objc_claimAutoreleasedReturnValue();

            v67 = (void *)v54;
            if (v54
              && (objc_msgSend(v4, "error"), v55 = (void *)objc_claimAutoreleasedReturnValue(), v55, !v55))
            {
              v56 = (void *)MEMORY[0x1E0D81610];
              __atxlog_handle_blending_ecosystem();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v47, CFSTR("dismissed"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v57);
              v58 = objc_claimAutoreleasedReturnValue();

              v59 = (void *)v58;
              if (v58
                && (objc_msgSend(v4, "error"), v60 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v60,
                                               !v60))
              {
                v66 = (void *)MEMORY[0x1E0D81610];
                v61 = objc_opt_class();
                __atxlog_handle_blending_ecosystem();
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v61, CFSTR("session"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionUIFeedbackResult"), -1, v62);
                v63 = objc_claimAutoreleasedReturnValue();

                v64 = (void *)v63;
                if (v63
                  && (objc_msgSend(v4, "error"),
                      v65 = (void *)objc_claimAutoreleasedReturnValue(),
                      v65,
                      !v65))
                {
                  self = -[ATXProactiveSuggestionUIFeedbackResult initWithEngagementType:shownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:](self, "initWithEngagementType:shownSuggestions:engagedSuggestions:rejectedSuggestions:session:consumerSubType:clientCacheUpdate:uiCacheUpdate:context:", objc_msgSend(v71, "integerValue"), v67, v50, v59, v64, v13, v73, v72, v69);
                  v10 = self;
                }
                else
                {
                  v10 = 0;
                }

              }
              else
              {
                v10 = 0;
              }

            }
            else
            {
              v10 = 0;
            }

          }
          else
          {
            v10 = 0;
          }

          v22 = v73;
        }
        else
        {
          v10 = 0;
        }
        v27 = v72;
        v36 = v69;

        v32 = v68;
        goto LABEL_46;
      }
    }
  }
  v10 = 0;
LABEL_4:

  return v10;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v24 = (void *)MEMORY[0x1AF421DC4](self, a2);
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", -[ATXProactiveSuggestionFeedbackResult consumerSubType](self, "consumerSubType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestionFeedbackTypes stringForUIFeedbackEngagementType:](ATXProactiveSuggestionFeedbackTypes, "stringForUIFeedbackEngagementType:", -[ATXProactiveSuggestionUIFeedbackResult engagementType](self, "engagementType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult session](self, "session");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sessionStartDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult session](self, "session");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sessionEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult engagedSuggestions](self, "engagedSuggestions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult suggestionExecutableObjectListFromSuggestions:](self, "suggestionExecutableObjectListFromSuggestions:", v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult rejectedSuggestions](self, "rejectedSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult suggestionExecutableObjectListFromSuggestions:](self, "suggestionExecutableObjectListFromSuggestions:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult shownSuggestions](self, "shownSuggestions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult suggestionExecutableObjectListFromSuggestions:](self, "suggestionExecutableObjectListFromSuggestions:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionFeedbackResult clientCacheUpdate](self, "clientCacheUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blendingUICacheUpdateUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionUIFeedbackResult session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@: %@ - %@ \nsession start: %@, session end: %@ \nengaged suggestions: %@ \nrejected suggestions: %@ \nshown suggestions: %@ \nclient model id: %@ \nblending cache uuid: %@ \nmetadata: %@"), v19, v17, v26, v25, v14, v4, v13, v5, v7, v9, v11);

  objc_autoreleasePoolPop(v24);
  return v21;
}

- (id)suggestionExecutableObjectListFromSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1AF421DC4](v6);
        objc_msgSend(v10, "executableSpecification", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "executableIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v7 = v6;
    }
    while (v6);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)engagementType
{
  return self->_engagementType;
}

- (NSArray)shownSuggestions
{
  return self->_shownSuggestions;
}

- (NSArray)engagedSuggestions
{
  return self->_engagedSuggestions;
}

- (NSArray)rejectedSuggestions
{
  return self->_rejectedSuggestions;
}

- (ATXProactiveSuggestionUIFeedbackSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestions, 0);
  objc_storeStrong((id *)&self->_shownSuggestions, 0);
}

@end

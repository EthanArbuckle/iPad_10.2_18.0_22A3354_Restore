@implementation ATXProactiveSuggestionWidgetRotationFeedbackSession

- (ATXProactiveSuggestionWidgetRotationFeedbackSession)init
{
  void *v3;
  ATXProactiveSuggestionWidgetRotationFeedbackSession *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXProactiveSuggestionWidgetRotationFeedbackSession initWithEngagementType:metadata:engagementHistory:systemSuggestSuggestionLayout:sessionStartDate:sessionEndDate:dwellStartDate:longestDwell:](self, "initWithEngagementType:metadata:engagementHistory:systemSuggestSuggestionLayout:sessionStartDate:sessionEndDate:dwellStartDate:longestDwell:", 0, 0, v3, 0, 0, 0, 0.0, 0);

  return v4;
}

- (ATXProactiveSuggestionWidgetRotationFeedbackSession)initWithEngagementType:(int64_t)a3 metadata:(id)a4 engagementHistory:(id)a5 systemSuggestSuggestionLayout:(id)a6 sessionStartDate:(id)a7 sessionEndDate:(id)a8 dwellStartDate:(id)a9 longestDwell:(double)a10
{
  id v18;
  id v19;
  ATXProactiveSuggestionWidgetRotationFeedbackSession *v20;
  ATXProactiveSuggestionWidgetRotationFeedbackSession *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v18 = a8;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXProactiveSuggestionWidgetRotationFeedbackSession;
  v20 = -[ATXProactiveSuggestionWidgetRotationFeedbackSession init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_engagementType = a3;
    objc_storeStrong((id *)&v20->_metadata, a4);
    objc_storeStrong((id *)&v21->_engagementHistory, a5);
    objc_storeStrong((id *)&v21->_systemSuggestSuggestionLayout, a6);
    objc_storeStrong((id *)&v21->_sessionStartDate, a7);
    objc_storeStrong((id *)&v21->_sessionEndDate, a8);
    objc_storeStrong((id *)&v21->_dwellStartDate, a9);
    v21->_longestDwell = a10;
  }

  return v21;
}

- (void)markRotationSessionStartedAtDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartDate, a3);
}

- (void)updateWithSystemSuggestSuggestionLayout:(id)a3
{
  objc_storeStrong((id *)&self->_systemSuggestSuggestionLayout, a3);
}

- (void)markStackShownAtDate:(id)a3
{
  objc_storeStrong((id *)&self->_dwellStartDate, a3);
  -[ATXProactiveSuggestionWidgetRotationFeedbackSession tryUpdateStackRotationEngagementType:](self, "tryUpdateStackRotationEngagementType:", 1);
}

- (void)markStackHiddenAtDate:(id)a3
{
  id v4;
  NSDate *dwellStartDate;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  dwellStartDate = self->_dwellStartDate;
  v8 = v4;
  if (v4 && dwellStartDate)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    v7 = v6;
    if (v6 >= *(double *)&kATXWidgetRotationFeedbackMinTimeIntervalToBeConsideredDwell)
      -[ATXProactiveSuggestionWidgetRotationFeedbackSession tryUpdateStackRotationEngagementType:](self, "tryUpdateStackRotationEngagementType:", 3);
    if (v7 > self->_longestDwell)
      self->_longestDwell = v7;
    dwellStartDate = self->_dwellStartDate;
  }
  self->_dwellStartDate = 0;

}

- (void)markStackTapped
{
  -[ATXProactiveSuggestionWidgetRotationFeedbackSession tryUpdateStackRotationEngagementType:](self, "tryUpdateStackRotationEngagementType:", 4);
}

- (void)tryUpdateStackRotationEngagementType:(int64_t)a3
{
  NSMutableArray *engagementHistory;
  void *v6;

  engagementHistory = self->_engagementHistory;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](engagementHistory, "addObject:", v6);

  if (self->_engagementType < a3)
    self->_engagementType = a3;
}

- (void)markRotationSessionEndedAtDate:(id)a3 wasUserScroll:(BOOL)a4
{
  _BOOL4 v4;
  id v7;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_sessionEndDate, a3);
  -[ATXProactiveSuggestionWidgetRotationFeedbackSession markStackHiddenAtDate:](self, "markStackHiddenAtDate:", v7);
  if (v4)
    -[ATXProactiveSuggestionWidgetRotationFeedbackSession tryUpdateStackRotationEngagementType:](self, "tryUpdateStackRotationEngagementType:", 2);

}

- (void)updateSessionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionWidgetRotationFeedbackSession *v4;
  ATXProactiveSuggestionWidgetRotationFeedbackSession *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionWidgetRotationFeedbackSession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionWidgetRotationFeedbackSession isEqualToATXProactiveSuggestionWidgetRotationFeedbackSession:](self, "isEqualToATXProactiveSuggestionWidgetRotationFeedbackSession:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionWidgetRotationFeedbackSession:(id)a3
{
  id *v4;
  id *v5;
  ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata *metadata;
  ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata *v7;
  ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata *v8;
  ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata *v9;
  char v10;
  NSMutableArray *engagementHistory;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  char v15;
  ATXSuggestionLayout *systemSuggestSuggestionLayout;
  ATXSuggestionLayout *v17;
  ATXSuggestionLayout *v18;
  ATXSuggestionLayout *v19;
  BOOL v20;
  NSDate *sessionStartDate;
  NSDate *v22;
  NSDate *v23;
  NSDate *v24;
  char v25;
  NSDate *sessionEndDate;
  NSDate *v27;
  NSDate *v28;
  NSDate *v29;
  char v30;
  NSDate *dwellStartDate;
  NSDate *v32;
  NSDate *v33;
  NSDate *v34;
  char v35;
  BOOL v36;

  v4 = (id *)a3;
  v5 = v4;
  if ((id)self->_engagementType != v4[1])
    goto LABEL_24;
  metadata = self->_metadata;
  v7 = (ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata *)v4[2];
  if (metadata == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = metadata;
    v10 = -[ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_24;
  }
  engagementHistory = self->_engagementHistory;
  v12 = (NSMutableArray *)v5[3];
  if (engagementHistory == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = engagementHistory;
    v15 = -[NSMutableArray isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_24;
  }
  systemSuggestSuggestionLayout = self->_systemSuggestSuggestionLayout;
  v17 = (ATXSuggestionLayout *)v5[4];
  if (systemSuggestSuggestionLayout == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = systemSuggestSuggestionLayout;
    v20 = -[ATXSuggestionLayout isEqual:](v19, "isEqual:", v18);

    if (!v20)
      goto LABEL_24;
  }
  sessionStartDate = self->_sessionStartDate;
  v22 = (NSDate *)v5[5];
  if (sessionStartDate == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = sessionStartDate;
    v25 = -[NSDate isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_24;
  }
  sessionEndDate = self->_sessionEndDate;
  v27 = (NSDate *)v5[6];
  if (sessionEndDate == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = sessionEndDate;
    v30 = -[NSDate isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_24;
  }
  dwellStartDate = self->_dwellStartDate;
  v32 = (NSDate *)v5[7];
  if (dwellStartDate == v32)
  {

    goto LABEL_27;
  }
  v33 = v32;
  v34 = dwellStartDate;
  v35 = -[NSDate isEqual:](v34, "isEqual:", v33);

  if ((v35 & 1) != 0)
  {
LABEL_27:
    v36 = self->_longestDwell == *((double *)v5 + 8);
    goto LABEL_25;
  }
LABEL_24:
  v36 = 0;
LABEL_25:

  return v36;
}

- (id)description
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_systemSuggestSuggestionLayout)
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - engagementType: %lu, metadata: %@, engagementHistory: %@, suggestionLayout: %@, sessionStartDate: %@, sessionEndDate: %@, dwellStartDate: %@, longestDwell: %f"), v5, *(_OWORD *)&self->_engagementType, self->_engagementHistory, v7, self->_sessionStartDate, self->_sessionEndDate, self->_dwellStartDate, *(_QWORD *)&self->_longestDwell);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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
  if (a3 == 0.0)
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
  int64_t engagementType;
  id v5;

  engagementType = self->_engagementType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", engagementType, CFSTR("engagementType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engagementHistory, CFSTR("engagementHistory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemSuggestSuggestionLayout, CFSTR("suggestionLayout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionStartDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionEndDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dwellStartDate, CFSTR("dwellStartDate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longestDwell"), self->_longestDwell);

}

- (ATXProactiveSuggestionWidgetRotationFeedbackSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  ATXProactiveSuggestionWidgetRotationFeedbackSession *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v43;
  void *v44;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("engagementType"));
  if (-[ATXProactiveSuggestionWidgetRotationFeedbackSession checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v5, CFSTR("engagementType"), v4, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1))
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D81610];
    v8 = objc_opt_class();
    __atxlog_handle_blending_ecosystem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("metadata"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v6 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0D81610];
      v13 = (void *)MEMORY[0x1AF421DC4]();
      v14 = objc_alloc(MEMORY[0x1E0C99E60]);
      v15 = objc_opt_class();
      v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v13);
      __atxlog_handle_blending_ecosystem();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v16, CFSTR("engagementHistory"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18
        && (objc_msgSend(v4, "error"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, !v19))
      {
        v20 = (void *)MEMORY[0x1E0D81610];
        v21 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v21, CFSTR("suggestionLayout"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v6 = 0;
        }
        else
        {
          v25 = (void *)MEMORY[0x1E0D81610];
          v26 = objc_opt_class();
          __atxlog_handle_blending_ecosystem();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v26, CFSTR("startDate"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "error");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            v6 = 0;
          }
          else
          {
            v44 = v28;
            v30 = (void *)MEMORY[0x1E0D81610];
            v31 = objc_opt_class();
            __atxlog_handle_blending_ecosystem();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v31, CFSTR("endDate"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "error");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              v6 = 0;
              v28 = v44;
            }
            else
            {
              v43 = v33;
              v35 = (void *)MEMORY[0x1E0D81610];
              v36 = objc_opt_class();
              __atxlog_handle_blending_ecosystem();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v36, CFSTR("dwellStartDate"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "error");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                v6 = 0;
                v33 = v43;
                v28 = v44;
              }
              else
              {
                objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longestDwell"));
                v41 = v40;
                v28 = v44;
                if (-[ATXProactiveSuggestionWidgetRotationFeedbackSession checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", CFSTR("longestDwell"), v4, CFSTR("com.apple.proactive.ATXProactiveSuggestionWidgetRotationFeedbackSession"), -1))
                {
                  v6 = 0;
                  v33 = v43;
                }
                else
                {
                  v33 = v43;
                  self = -[ATXProactiveSuggestionWidgetRotationFeedbackSession initWithEngagementType:metadata:engagementHistory:systemSuggestSuggestionLayout:sessionStartDate:sessionEndDate:dwellStartDate:longestDwell:](self, "initWithEngagementType:metadata:engagementHistory:systemSuggestSuggestionLayout:sessionStartDate:sessionEndDate:dwellStartDate:longestDwell:", v5, v10, v18, v23, v44, v43, v41, v38);
                  v6 = self;
                }
              }

            }
          }

        }
      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (int64_t)engagementType
{
  return self->_engagementType;
}

- (ATXProactiveSuggestionWidgetRotationFeedbackSessionMetadata)metadata
{
  return self->_metadata;
}

- (NSMutableArray)engagementHistory
{
  return self->_engagementHistory;
}

- (ATXSuggestionLayout)systemSuggestSuggestionLayout
{
  return self->_systemSuggestSuggestionLayout;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (NSDate)dwellStartDate
{
  return self->_dwellStartDate;
}

- (double)longestDwell
{
  return self->_longestDwell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dwellStartDate, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_systemSuggestSuggestionLayout, 0);
  objc_storeStrong((id *)&self->_engagementHistory, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end

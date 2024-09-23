@implementation ATXProactiveSuggestionSingleSuggestionFeedbackSession

- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithProactiveSuggestion:(id)a3 clientModelCacheUUID:(id)a4 feedbackMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXProactiveSuggestionSingleSuggestionFeedbackSession *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v10, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v13);

  objc_msgSend(v12, "addObject:", v9);
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v16 = -[ATXProactiveSuggestionSingleSuggestionFeedbackSession initWithProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:](self, "initWithProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:", v10, v8, v11, v14, v12, v15);

  return v16;
}

- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithProactiveSuggestion:(id)a3 feedbackMetadata:(id)a4 matchingSuggestionUUIDs:(id)a5 associatedBlendingCacheUUIDs:(id)a6 associatedClientModelCacheUUIDs:(id)a7 sessionContextStatuses:(id)a8
{
  id v15;
  id v16;
  id v17;
  ATXProactiveSuggestionSingleSuggestionFeedbackSession *v18;
  ATXProactiveSuggestionSingleSuggestionFeedbackSession *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ATXProactiveSuggestionSingleSuggestionFeedbackSession;
  v18 = -[ATXProactiveSuggestionSingleSuggestionFeedbackSession init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestion, a3);
    objc_storeStrong((id *)&v19->_feedbackMetadata, a4);
    objc_storeStrong((id *)&v19->_matchingSuggestionUUIDs, a5);
    objc_storeStrong((id *)&v19->_associatedBlendingCacheUUIDs, a6);
    objc_storeStrong((id *)&v19->_associatedClientModelCacheUUIDs, a7);
    objc_storeStrong((id *)&v19->_sessionContextStatusByConsumerSubType, a8);
  }

  return v19;
}

- (BOOL)tryUpdateEngagementType:(int64_t)a3 consumerSubType:(unsigned __int8)a4
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSMutableDictionary *sessionContextStatusByConsumerSubType;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sessionContextStatusByConsumerSubType, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v7 = (void *)objc_msgSend(v7, "integerValue");
  if (a3 >= 1 && !v7 || (v9 = 0, a3 > 1) && v7 == (void *)1)
  {
    sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](sessionContextStatusByConsumerSubType, "setObject:forKey:", v11, v6);

    v9 = 1;
  }

  return v9;
}

- (void)enumerateShownAndEngagedEngagementTypesAndConsumerSubTypesWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *sessionContextStatusByConsumerSubType;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __125__ATXProactiveSuggestionSingleSuggestionFeedbackSession_enumerateShownAndEngagedEngagementTypesAndConsumerSubTypesWithBlock___block_invoke;
  v7[3] = &unk_1E57CF7D8;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessionContextStatusByConsumerSubType, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __125__ATXProactiveSuggestionSingleSuggestionFeedbackSession_enumerateShownAndEngagedEngagementTypesAndConsumerSubTypesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", a2, 0))
  {
    objc_msgSend(v5, "integerValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXProactiveSuggestion *suggestion;
  id v5;

  suggestion = self->_suggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestion, CFSTR("suggestion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feedbackMetadata, CFSTR("feedbackMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingSuggestionUUIDs, CFSTR("matchingSuggestionUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedBlendingCacheUUIDs, CFSTR("blendingUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedClientModelCacheUUIDs, CFSTR("clientUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionContextStatusByConsumerSubType, CFSTR("sessionStatuses"));

}

- (ATXProactiveSuggestionSingleSuggestionFeedbackSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestionSingleSuggestionFeedbackSession *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *context;
  void *contexta;
  uint64_t v49;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_metrics();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("suggestion"), v4, 1, CFSTR("com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_metrics();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("feedbackMetadata"), v4, 0, CFSTR("com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession"), -1, v13);
    v49 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = (void *)MEMORY[0x1AF421DC4]();
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17 = objc_opt_class();
    v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v15);
    __atxlog_handle_metrics();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("matchingSuggestionUUIDs"), v4, 1, CFSTR("com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession"), -1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && (objc_msgSend(v4, "error"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, !v21))
    {
      v23 = (void *)MEMORY[0x1E0D81610];
      v24 = (void *)MEMORY[0x1AF421DC4]();
      v25 = objc_alloc(MEMORY[0x1E0C99E60]);
      v26 = objc_opt_class();
      v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v24);
      __atxlog_handle_metrics();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v27, CFSTR("blendingUUIDs"), v4, 1, CFSTR("com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession"), -1, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29
        && (objc_msgSend(v4, "error"), v30 = (void *)objc_claimAutoreleasedReturnValue(), v30, !v30))
      {
        context = (void *)MEMORY[0x1E0D81610];
        v31 = (void *)MEMORY[0x1AF421DC4]();
        v32 = objc_alloc(MEMORY[0x1E0C99E60]);
        v33 = objc_opt_class();
        v34 = (void *)objc_msgSend(v32, "initWithObjects:", v33, objc_opt_class(), 0);
        objc_autoreleasePoolPop(v31);
        __atxlog_handle_metrics();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(context, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v34, CFSTR("clientUUIDs"), v4, 1, CFSTR("com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession"), -1, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36
          && (objc_msgSend(v4, "error"), v37 = (void *)objc_claimAutoreleasedReturnValue(), v37, !v37))
        {
          v38 = (void *)MEMORY[0x1E0D81610];
          contexta = (void *)MEMORY[0x1AF421DC4]();
          v39 = objc_alloc(MEMORY[0x1E0C99E60]);
          v40 = objc_opt_class();
          v41 = objc_opt_class();
          v42 = (void *)objc_msgSend(v39, "initWithObjects:", v40, v41, objc_opt_class(), 0);
          objc_autoreleasePoolPop(contexta);
          __atxlog_handle_metrics();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v42, CFSTR("sessionStatuses"), v4, 1, CFSTR("com.apple.ATXProactiveSuggestionSingleSuggestionFeedbackSession"), -1, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44
            && (objc_msgSend(v4, "error"), v45 = (void *)objc_claimAutoreleasedReturnValue(), v45, !v45))
          {
            v22 = (void *)v49;
            self = -[ATXProactiveSuggestionSingleSuggestionFeedbackSession initWithProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:](self, "initWithProactiveSuggestion:feedbackMetadata:matchingSuggestionUUIDs:associatedBlendingCacheUUIDs:associatedClientModelCacheUUIDs:sessionContextStatuses:", v8, v49, v20, v29, v36, v44);
            v10 = self;
          }
          else
          {
            v10 = 0;
            v22 = (void *)v49;
          }

        }
        else
        {
          v10 = 0;
          v22 = (void *)v49;
        }

      }
      else
      {
        v10 = 0;
        v22 = (void *)v49;
      }

    }
    else
    {
      v10 = 0;
      v22 = (void *)v49;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionSingleSuggestionFeedbackSession *v4;
  ATXProactiveSuggestionSingleSuggestionFeedbackSession *v5;
  BOOL v6;

  v4 = (ATXProactiveSuggestionSingleSuggestionFeedbackSession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXProactiveSuggestionSingleSuggestionFeedbackSession isEqualToATXProactiveSuggestionSingleSuggestionFeedbackSession:](self, "isEqualToATXProactiveSuggestionSingleSuggestionFeedbackSession:", v5);

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionSingleSuggestionFeedbackSession:(id)a3
{
  id *v4;
  ATXProactiveSuggestion *suggestion;
  ATXProactiveSuggestion *v6;
  ATXProactiveSuggestion *v7;
  ATXProactiveSuggestion *v8;
  BOOL v9;
  NSData *feedbackMetadata;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  char v14;
  NSMutableOrderedSet *matchingSuggestionUUIDs;
  NSMutableOrderedSet *v16;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *v18;
  char v19;
  NSMutableOrderedSet *associatedBlendingCacheUUIDs;
  NSMutableOrderedSet *v21;
  NSMutableOrderedSet *v22;
  NSMutableOrderedSet *v23;
  char v24;
  NSMutableOrderedSet *associatedClientModelCacheUUIDs;
  NSMutableOrderedSet *v26;
  NSMutableOrderedSet *v27;
  NSMutableOrderedSet *v28;
  char v29;
  char v30;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;

  v4 = (id *)a3;
  suggestion = self->_suggestion;
  v6 = (ATXProactiveSuggestion *)v4[1];
  if (suggestion == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = suggestion;
    v9 = -[ATXProactiveSuggestion isEqual:](v8, "isEqual:", v7);

    if (!v9)
      goto LABEL_19;
  }
  feedbackMetadata = self->_feedbackMetadata;
  v11 = (NSData *)v4[2];
  if (feedbackMetadata == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = feedbackMetadata;
    v14 = -[NSData isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_19;
  }
  matchingSuggestionUUIDs = self->_matchingSuggestionUUIDs;
  v16 = (NSMutableOrderedSet *)v4[3];
  if (matchingSuggestionUUIDs == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = matchingSuggestionUUIDs;
    v19 = -[NSMutableOrderedSet isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_19;
  }
  associatedBlendingCacheUUIDs = self->_associatedBlendingCacheUUIDs;
  v21 = (NSMutableOrderedSet *)v4[5];
  if (associatedBlendingCacheUUIDs == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = associatedBlendingCacheUUIDs;
    v24 = -[NSMutableOrderedSet isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_19;
  }
  associatedClientModelCacheUUIDs = self->_associatedClientModelCacheUUIDs;
  v26 = (NSMutableOrderedSet *)v4[4];
  if (associatedClientModelCacheUUIDs == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = associatedClientModelCacheUUIDs;
    v29 = -[NSMutableOrderedSet isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
    {
LABEL_19:
      v30 = 0;
      goto LABEL_20;
    }
  }
  v32 = self->_sessionContextStatusByConsumerSubType;
  v33 = v32;
  if (v32 == v4[6])
    v30 = 1;
  else
    v30 = -[NSMutableDictionary isEqual:](v32, "isEqual:");

LABEL_20:
  return v30;
}

- (unint64_t)hash
{
  int64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;

  v2 = (char *)self->_feedbackMetadata - (char *)self->_suggestion + 32 * (uint64_t)self->_suggestion;
  v3 = (char *)&self->_matchingSuggestionUUIDs[4 * v2] - v2;
  v4 = (char *)self->_associatedBlendingCacheUUIDs - v3 + 32 * (_QWORD)v3;
  v5 = (int64_t)&self->_associatedClientModelCacheUUIDs[4 * v4] - v4;
  return (unint64_t)&self->_sessionContextStatusByConsumerSubType[4 * v5] - v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXProactiveSuggestion uuid](self->_suggestion, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestion clientModelSpecification](self->_suggestion, "clientModelSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientModelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("uuid: %@, clientModelId: %@, statuses: %@, suggestionUUIDs: %@, blendingUUIDs: %@, clientUUIDs: %@"), v4, v6, self->_sessionContextStatusByConsumerSubType, self->_matchingSuggestionUUIDs, self->_associatedBlendingCacheUUIDs, self->_associatedClientModelCacheUUIDs);

  return v7;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (NSMutableOrderedSet)matchingSuggestionUUIDs
{
  return self->_matchingSuggestionUUIDs;
}

- (NSMutableOrderedSet)associatedClientModelCacheUUIDs
{
  return self->_associatedClientModelCacheUUIDs;
}

- (NSMutableOrderedSet)associatedBlendingCacheUUIDs
{
  return self->_associatedBlendingCacheUUIDs;
}

- (NSMutableDictionary)sessionContextStatusByConsumerSubType
{
  return self->_sessionContextStatusByConsumerSubType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContextStatusByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_associatedBlendingCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_associatedClientModelCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_matchingSuggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end

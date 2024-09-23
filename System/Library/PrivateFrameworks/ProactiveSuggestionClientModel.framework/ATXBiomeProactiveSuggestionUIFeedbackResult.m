@implementation ATXBiomeProactiveSuggestionUIFeedbackResult

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProactiveSuggestionUIFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ATXBiomeProactiveSuggestionUIFeedbackResult *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blendingUICacheUpdateUUID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionStartDate");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v4, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionEndDate");
      v12 = (ATXBiomeProactiveSuggestionUIFeedbackResult *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v4, "shownSuggestions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
        {
          v12 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v4, "session");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sessionIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "session");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "blendingUICacheUpdateUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clientCacheUpdate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "clientModelId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clientCacheUpdate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "cacheCreationDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v4, "consumerSubType");
        objc_msgSend(v4, "session");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sessionStartDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "session");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sessionEndDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shownSuggestions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromSuggestions:", v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "engagedSuggestions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromSuggestions:", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "rejectedSuggestions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromSuggestions:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[ATXBiomeProactiveSuggestionUIFeedbackResult initWithSessionId:blendingUICacheUpdateUUID:clientModelId:clientModelCacheCreationDate:consumerSubType:sessionStartDate:sessionEndDate:shownSuggestions:engagedSuggestions:rejectedSuggestions:](self, "initWithSessionId:blendingUICacheUpdateUUID:clientModelId:clientModelCacheCreationDate:consumerSubType:sessionStartDate:sessionEndDate:shownSuggestions:engagedSuggestions:rejectedSuggestions:", v7, v10, v29, v28, v21, v27, v26, v19, v15, v17);

        v12 = self;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

LABEL_11:
  return v12;
}

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithSessionId:(id)a3 blendingUICacheUpdateUUID:(id)a4 clientModelId:(id)a5 clientModelCacheCreationDate:(id)a6 consumerSubType:(unsigned __int8)a7 sessionStartDate:(id)a8 sessionEndDate:(id)a9 shownSuggestions:(id)a10 engagedSuggestions:(id)a11 rejectedSuggestions:(id)a12
{
  id v18;
  ATXBiomeProactiveSuggestionUIFeedbackResult *v19;
  ATXBiomeProactiveSuggestionUIFeedbackResult *v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v18 = a12;
  v31.receiver = self;
  v31.super_class = (Class)ATXBiomeProactiveSuggestionUIFeedbackResult;
  v19 = -[ATXBiomeProactiveSuggestionUIFeedbackResult init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionId, a3);
    objc_storeStrong((id *)&v20->_blendingUICacheUpdateUUID, a4);
    objc_storeStrong((id *)&v20->_clientModelId, a5);
    objc_storeStrong((id *)&v20->_clientModelCacheCreationDate, a6);
    v20->_consumerSubType = a7;
    objc_storeStrong((id *)&v20->_sessionStartDate, a8);
    objc_storeStrong((id *)&v20->_sessionEndDate, a9);
    objc_storeStrong((id *)&v20->_shownSuggestions, a10);
    objc_storeStrong((id *)&v20->_engagedSuggestions, a11);
    objc_storeStrong((id *)&v20->_rejectedSuggestions, a12);
  }

  return v20;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("sessionId: %@\n"), self->_sessionId);
  -[NSUUID UUIDString](self->_blendingUICacheUpdateUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("blendingUICacheUpdateUUID: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("clientModelId: %@\n"), self->_clientModelId);
  objc_msgSend(v3, "appendFormat:", CFSTR("clientModelCacheCreationDate: %@\n"), self->_clientModelCacheCreationDate);
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("consumerSubType: %@\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("sessionStartDate: %@\n"), self->_sessionStartDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("sessionEndDate: %@\n"), self->_sessionEndDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("shownSuggestions: %@\n"), self->_shownSuggestions);
  objc_msgSend(v3, "appendFormat:", CFSTR("engagedSuggestions: %@\n"), self->_engagedSuggestions);
  objc_msgSend(v3, "appendFormat:", CFSTR("rejectedSuggestions: %@\n"), self->_rejectedSuggestions);
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v6;
}

- (id)jsonDict
{
  NSUUID *blendingUICacheUpdateUUID;
  const __CFString *sessionId;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  NSDate *clientModelCacheCreationDate;
  const __CFString *clientModelId;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[10];
  _QWORD v26[11];

  v26[10] = *MEMORY[0x1E0C80C00];
  sessionId = (const __CFString *)self->_sessionId;
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  if (!sessionId)
    sessionId = CFSTR("nil");
  v26[0] = sessionId;
  v25[0] = CFSTR("sessionId");
  v25[1] = CFSTR("blendingUICacheUpdateUUID");
  -[NSUUID UUIDString](blendingUICacheUpdateUUID, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("nil");
  clientModelId = (const __CFString *)self->_clientModelId;
  clientModelCacheCreationDate = self->_clientModelCacheCreationDate;
  if (!clientModelId)
    clientModelId = CFSTR("nil");
  v26[1] = v7;
  v26[2] = clientModelId;
  v25[2] = CFSTR("clientModelId");
  v25[3] = CFSTR("clientModelCacheCreationDate");
  -[NSDate description](clientModelCacheCreationDate, "description");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  v26[3] = v12;
  v25[4] = CFSTR("consumerSubType");
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v13;
  v25[5] = CFSTR("sessionStartDate");
  -[NSDate description](self->_sessionStartDate, "description");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("nil");
  v26[5] = v16;
  v25[6] = CFSTR("sessionEndDate");
  -[NSDate description](self->_sessionEndDate, "description");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("nil");
  v26[6] = v19;
  v25[7] = CFSTR("shownSuggestions");
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionDescriptionsFromLightWeightSuggestions:", self->_shownSuggestions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v20;
  v25[8] = CFSTR("engagedSuggestions");
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionDescriptionsFromLightWeightSuggestions:", self->_engagedSuggestions);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v21;
  v25[9] = CFSTR("rejectedSuggestions");
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionDescriptionsFromLightWeightSuggestions:", self->_rejectedSuggestions);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXBiomeProactiveSuggestionUIFeedbackResult jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXBiomeProactiveSuggestionUIFeedbackResult *v4;
  ATXBiomeProactiveSuggestionUIFeedbackResult *v5;
  BOOL v6;

  v4 = (ATXBiomeProactiveSuggestionUIFeedbackResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXBiomeProactiveSuggestionUIFeedbackResult isEqualToATXBiomeProactiveSuggestionUIFeedbackResult:](self, "isEqualToATXBiomeProactiveSuggestionUIFeedbackResult:", v5);

  return v6;
}

- (BOOL)isEqualToATXBiomeProactiveSuggestionUIFeedbackResult:(id)a3
{
  id *v4;
  NSString *sessionId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSUUID *blendingUICacheUpdateUUID;
  NSUUID *v11;
  NSUUID *v12;
  NSUUID *v13;
  char v14;
  NSString *clientModelId;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSDate *clientModelCacheCreationDate;
  NSDate *v21;
  NSDate *v22;
  NSDate *v23;
  char v24;
  NSDate *sessionStartDate;
  NSDate *v26;
  NSDate *v27;
  NSDate *v28;
  char v29;
  NSDate *sessionEndDate;
  NSDate *v31;
  NSDate *v32;
  NSDate *v33;
  char v34;
  NSArray *shownSuggestions;
  NSArray *v36;
  NSArray *v37;
  NSArray *v38;
  char v39;
  NSArray *engagedSuggestions;
  NSArray *v41;
  NSArray *v42;
  NSArray *v43;
  char v44;
  char v45;
  NSArray *v47;
  NSArray *v48;

  v4 = (id *)a3;
  sessionId = self->_sessionId;
  v6 = (NSString *)v4[2];
  if (sessionId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = sessionId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_32;
  }
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  v11 = (NSUUID *)v4[3];
  if (blendingUICacheUpdateUUID == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = blendingUICacheUpdateUUID;
    v14 = -[NSUUID isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_32;
  }
  clientModelId = self->_clientModelId;
  v16 = (NSString *)v4[4];
  if (clientModelId == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = clientModelId;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_32;
  }
  clientModelCacheCreationDate = self->_clientModelCacheCreationDate;
  v21 = (NSDate *)v4[5];
  if (clientModelCacheCreationDate == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = clientModelCacheCreationDate;
    v24 = -[NSDate isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_32;
  }
  if (self->_consumerSubType != *((unsigned __int8 *)v4 + 8))
  {
LABEL_32:
    v45 = 0;
    goto LABEL_33;
  }
  sessionStartDate = self->_sessionStartDate;
  v26 = (NSDate *)v4[6];
  if (sessionStartDate == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = sessionStartDate;
    v29 = -[NSDate isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_32;
  }
  sessionEndDate = self->_sessionEndDate;
  v31 = (NSDate *)v4[7];
  if (sessionEndDate == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = sessionEndDate;
    v34 = -[NSDate isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_32;
  }
  shownSuggestions = self->_shownSuggestions;
  v36 = (NSArray *)v4[8];
  if (shownSuggestions == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = shownSuggestions;
    v39 = -[NSArray isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
      goto LABEL_32;
  }
  engagedSuggestions = self->_engagedSuggestions;
  v41 = (NSArray *)v4[9];
  if (engagedSuggestions == v41)
  {

  }
  else
  {
    v42 = v41;
    v43 = engagedSuggestions;
    v44 = -[NSArray isEqual:](v43, "isEqual:", v42);

    if ((v44 & 1) == 0)
      goto LABEL_32;
  }
  v47 = self->_rejectedSuggestions;
  v48 = v47;
  if (v47 == v4[10])
    v45 = 1;
  else
    v45 = -[NSArray isEqual:](v47, "isEqual:");

LABEL_33:
  return v45;
}

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProtoData:(id)a3
{
  id v4;
  ATXPBBiomeProactiveSuggestionUIFeedbackResult *v5;
  ATXBiomeProactiveSuggestionUIFeedbackResult *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBBiomeProactiveSuggestionUIFeedbackResult initWithData:]([ATXPBBiomeProactiveSuggestionUIFeedbackResult alloc], "initWithData:", v4);

    self = -[ATXBiomeProactiveSuggestionUIFeedbackResult initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXBiomeProactiveSuggestionUIFeedbackResult proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXBiomeProactiveSuggestionUIFeedbackResult)initWithProto:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXBiomeProactiveSuggestionUIFeedbackResult *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ATXLightweightClientModelCacheUpdate initWithProto:].cold.1((uint64_t)self, v16);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "sessionId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "blendingUICacheUpdateUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v6, "initWithUUIDString:", v27);
  objc_msgSend(v5, "clientModelId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "clientModelCacheCreationDate");
  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CF9508];
  objc_msgSend(v5, "consumerSubType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v8, "consumerSubtypeForString:found:", v26, 0);
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "sessionStartDate");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "sessionEndDate");
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shownSuggestions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromProtoLightWeightSuggestions:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engagedSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromProtoLightWeightSuggestions:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rejectedSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromProtoLightWeightSuggestions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXBiomeProactiveSuggestionUIFeedbackResult initWithSessionId:blendingUICacheUpdateUUID:clientModelId:clientModelCacheCreationDate:consumerSubType:sessionStartDate:sessionEndDate:shownSuggestions:engagedSuggestions:rejectedSuggestions:](self, "initWithSessionId:blendingUICacheUpdateUUID:clientModelId:clientModelCacheCreationDate:consumerSubType:sessionStartDate:sessionEndDate:shownSuggestions:engagedSuggestions:rejectedSuggestions:", v28, v25, v24, v23, v22, v20, v19, v18, v12, v14);

  v15 = self;
LABEL_8:

  return v15;
}

- (id)proto
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setSessionId:", self->_sessionId);
  -[NSUUID UUIDString](self->_blendingUICacheUpdateUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlendingUICacheUpdateUUID:", v4);

  objc_msgSend(v3, "setClientModelId:", self->_clientModelId);
  -[NSDate timeIntervalSinceReferenceDate](self->_clientModelCacheCreationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setClientModelCacheCreationDate:");
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConsumerSubType:", v5);

  -[NSDate timeIntervalSinceReferenceDate](self->_sessionStartDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setSessionStartDate:");
  -[NSDate timeIntervalSinceReferenceDate](self->_sessionEndDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setSessionEndDate:");
  +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "protoLightWeightSuggestionsFromLightWeightSuggestions:", self->_shownSuggestions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "setShownSuggestions:", v7);

  +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "protoLightWeightSuggestionsFromLightWeightSuggestions:", self->_engagedSuggestions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v3, "setEngagedSuggestions:", v9);

  +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "protoLightWeightSuggestionsFromLightWeightSuggestions:", self->_rejectedSuggestions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v3, "setRejectedSuggestions:", v11);

  return v3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (NSUUID)blendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSDate)clientModelCacheCreationDate
{
  return self->_clientModelCacheCreationDate;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
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

- (int64_t)suggestionExecutableType
{
  return self->_suggestionExecutableType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectedSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestions, 0);
  objc_storeStrong((id *)&self->_shownSuggestions, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_clientModelCacheCreationDate, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_blendingUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end

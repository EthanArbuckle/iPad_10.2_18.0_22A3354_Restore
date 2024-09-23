@implementation ATXClientModelCacheUpdate

- (id)proto
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t v17;
  _BYTE v18[15];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuidString:", v4);

  if ((objc_msgSend(v3, "hasUuidString") & 1) == 0)
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXClientModelCacheUpdate proto].cold.2(v3, (id *)&self->_uuid, v5);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_suggestions, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_suggestions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "proto");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "proto");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          __atxlog_handle_blending();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            -[ATXClientModelCacheUpdate proto].cold.1(&v17, v18, v14);
        }

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setSuggestions:", v6);
  objc_msgSend(v3, "setFeedbackMetadata:", self->_feedbackMetadata);
  objc_msgSend(v3, "setClientModelId:", self->_clientModelId);
  objc_msgSend(v3, "setCacheCreationDate:", self->_absoluteCacheCreationDate);
  -[ATXSuggestionRequestResponse proto](self->_suggestionRequestResponse, "proto");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResponseForRequestForSuggestions:", v15);

  return v3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)MEMORY[0x1AF421DC4]();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, v6, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    objc_autoreleasePoolPop(v7);
    v10 = 0;
    if (!v9)
      v10 = v8;

  }
  else
  {
    v10 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }

  return v10;
}

- (ATXClientModelCacheUpdate)initWithProtoData:(id)a3
{
  id v4;
  ATXPBClientModelCacheUpdate *v5;
  ATXClientModelCacheUpdate *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBClientModelCacheUpdate initWithData:]([ATXPBClientModelCacheUpdate alloc], "initWithData:", v4);

    self = -[ATXClientModelCacheUpdate initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 feedbackMetadata:(id)a5 responseForRealTimeRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  ATXClientModelCacheUpdate *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v16 = -[ATXClientModelCacheUpdate initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:uuid:cacheCreationDate:](self, "initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:uuid:cacheCreationDate:", v13, v12, v11, v10, v14, v15);

  return v16;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXClientModelCacheUpdate proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (ATXClientModelCacheUpdate)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  ATXProactiveSuggestion *v17;
  ATXProactiveSuggestion *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  ATXSuggestionRequestResponse *v23;
  void *v24;
  ATXSuggestionRequestResponse *v25;
  ATXClientModelCacheUpdate *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_blending();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXLightweightClientModelCacheUpdate initWithProto:].cold.1((uint64_t)self, v5);
      v26 = 0;
      goto LABEL_29;
    }
    v5 = v4;
    if ((-[NSObject hasUuidString](v5, "hasUuidString") & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NSObject uuidString](v5, "uuidString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithUUIDString:", v7);

      if (v8)
      {
        v32 = v8;
        v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
        -[NSObject suggestions](v5, "suggestions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        -[NSObject suggestions](v5, "suggestions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              v17 = -[ATXProactiveSuggestion initWithProto:]([ATXProactiveSuggestion alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
              if (!v17)
              {
                __atxlog_handle_blending();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
                  -[ATXClientModelCacheUpdate initWithProto:].cold.1(v20, v29, v30);
                v26 = 0;
                v8 = v32;
                goto LABEL_27;
              }
              v18 = v17;
              objc_msgSend(v11, "addObject:", v17);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v14)
              continue;
            break;
          }
        }

        -[NSObject feedbackMetadata](v5, "feedbackMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject clientModelId](v5, "clientModelId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXClientModelCacheUpdate _clientModelFromClientModelId:suggestions:](self, "_clientModelFromClientModelId:suggestions:", v19, v11);
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = objc_alloc(MEMORY[0x1E0C99D68]);
        -[NSObject cacheCreationDate](v5, "cacheCreationDate");
        v22 = (void *)objc_msgSend(v21, "initWithTimeIntervalSince1970:");
        if (-[NSObject hasResponseForRequestForSuggestions](v5, "hasResponseForRequestForSuggestions"))
        {
          v23 = [ATXSuggestionRequestResponse alloc];
          -[NSObject responseForRequestForSuggestions](v5, "responseForRequestForSuggestions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[ATXSuggestionRequestResponse initWithProto:](v23, "initWithProto:", v24);

        }
        else
        {
          v25 = 0;
        }
        v8 = v32;
        self = -[ATXClientModelCacheUpdate initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:uuid:cacheCreationDate:](self, "initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:uuid:cacheCreationDate:", v20, v11, v12, v25, v32, v22);

        v26 = self;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      __atxlog_handle_blending();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXClientModelCacheUpdate initWithProto:].cold.2(v8, v27, v28);
    }
    v26 = 0;
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  v26 = 0;
LABEL_30:

  return v26;
}

- (ATXClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 feedbackMetadata:(id)a5 responseForRealTimeRequest:(id)a6 uuid:(id)a7 cacheCreationDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ATXClientModelCacheUpdate *v19;
  ATXClientModelCacheUpdate *v20;
  double v21;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)ATXClientModelCacheUpdate;
  v19 = -[ATXClientModelCacheUpdate init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_suggestions, a4);
    objc_storeStrong((id *)&v20->_feedbackMetadata, a5);
    objc_storeStrong((id *)&v20->_uuid, a7);
    objc_storeStrong((id *)&v20->_clientModelId, a3);
    objc_msgSend(v18, "timeIntervalSince1970", v23, v24);
    v20->_absoluteCacheCreationDate = v21;
    objc_storeStrong((id *)&v20->_suggestionRequestResponse, a6);
  }

  return v20;
}

- (id)_clientModelFromClientModelId:(id)a3 suggestions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientModelSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientModelId");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionRequestResponse, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSDate)cacheCreationDate
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteCacheCreationDate);
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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXClientModelCacheUpdate encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXClientModelCacheUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXClientModelCacheUpdate *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXClientModelCacheUpdate initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXClientModelCacheUpdate *v4;
  ATXClientModelCacheUpdate *v5;
  BOOL v6;

  v4 = (ATXClientModelCacheUpdate *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXClientModelCacheUpdate isEqualToATXClientModelCacheUpdate:](self, "isEqualToATXClientModelCacheUpdate:", v5);

  return v6;
}

- (BOOL)isEqualToATXClientModelCacheUpdate:(id)a3
{
  id *v4;
  NSUUID *uuid;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSArray *suggestions;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  NSData *feedbackMetadata;
  NSData *v16;
  NSData *v17;
  NSData *v18;
  char v19;
  NSString *clientModelId;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  ATXSuggestionRequestResponse *suggestionRequestResponse;
  ATXSuggestionRequestResponse *v26;
  ATXSuggestionRequestResponse *v27;
  ATXSuggestionRequestResponse *v28;
  BOOL v29;
  BOOL v30;

  v4 = (id *)a3;
  uuid = self->_uuid;
  v6 = (NSUUID *)v4[2];
  if (uuid == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uuid;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_19;
  }
  suggestions = self->_suggestions;
  v11 = (NSArray *)v4[4];
  if (suggestions == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = suggestions;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_19;
  }
  feedbackMetadata = self->_feedbackMetadata;
  v16 = (NSData *)v4[5];
  if (feedbackMetadata == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = feedbackMetadata;
    v19 = -[NSData isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_19;
  }
  clientModelId = self->_clientModelId;
  v21 = (NSString *)v4[3];
  if (clientModelId == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = clientModelId;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_19;
  }
  suggestionRequestResponse = self->_suggestionRequestResponse;
  v26 = (ATXSuggestionRequestResponse *)v4[6];
  if (suggestionRequestResponse == v26)
  {

    goto LABEL_22;
  }
  v27 = v26;
  v28 = suggestionRequestResponse;
  v29 = -[ATXSuggestionRequestResponse isEqual:](v28, "isEqual:", v27);

  if (v29)
  {
LABEL_22:
    v30 = self->_absoluteCacheCreationDate == *((double *)v4 + 1);
    goto LABEL_20;
  }
LABEL_19:
  v30 = 0;
LABEL_20:

  return v30;
}

- (unsigned)dataVersion
{
  return 2;
}

- (id)jsonRawData
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[6];
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v30[0] = CFSTR("clientModelId");
  -[ATXClientModelCacheUpdate clientModelId](self, "clientModelId");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("nil");
  v31[0] = v6;
  v30[1] = CFSTR("uuid");
  -[NSUUID description](self->_uuid, "description");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("nil");
  v31[1] = v9;
  v31[2] = v3;
  v30[2] = CFSTR("suggestions");
  v30[3] = CFSTR("suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_suggestions, "count"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  v31[3] = v12;
  v30[4] = CFSTR("cacheCreationDate");
  -[ATXClientModelCacheUpdate cacheCreationDate](self, "cacheCreationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v30[5] = CFSTR("responseForRequest");
  if (self->_suggestionRequestResponse)
    v16 = CFSTR("Was in response to a request");
  else
    v16 = CFSTR("Not a real-time response");
  v31[4] = v14;
  v31[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_suggestions;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "jsonRawData", (_QWORD)v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v23);

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  return v17;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXClientModelCacheUpdate jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackMetadata, a3);
}

- (ATXSuggestionRequestResponse)suggestionRequestResponse
{
  return self->_suggestionRequestResponse;
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a1, a3, "Attempting to decode ATXClientModelCacheUpdate from proto failed because the recovered PBCodable had an unrecoverable ATXProactiveSuggestion.", v3);
}

- (void)initWithProto:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a1, a3, "Attempting to decode ATXClientModelCacheUpdate from proto failed because the recovered PBCodable didn't have a uuidString.", v3);
}

- (void)proto
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_1AA841000, a3, OS_LOG_TYPE_FAULT, "Attempting to encode ATXClientModelCacheUpdate to proto failed because proto uuid: %@. Original uuid: %@", (uint8_t *)&v7, 0x16u);

}

@end

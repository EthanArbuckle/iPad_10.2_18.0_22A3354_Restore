@implementation ATXSuggestionRequestResponse

- (ATXSuggestionRequestResponse)initWithSuggestions:(id)a3 feedbackMetadata:(id)a4 originalRequest:(id)a5 responseCode:(int)a6 error:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  ATXSuggestionRequestResponse *v17;

  v7 = *(_QWORD *)&a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  v17 = -[ATXSuggestionRequestResponse initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:uuid:](self, "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:uuid:", v15, v14, v13, v7, v12, v16);

  return v17;
}

- (ATXSuggestionRequestResponse)initWithSuggestions:(id)a3 feedbackMetadata:(id)a4 originalRequest:(id)a5 responseCode:(int)a6 error:(id)a7 uuid:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXSuggestionRequestResponse *v18;
  ATXSuggestionRequestResponse *v19;
  uint64_t v20;
  NSUUID *uuid;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXSuggestionRequestResponse;
  v18 = -[ATXSuggestionRequestResponse init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestions, a3);
    objc_storeStrong((id *)&v19->_feedbackMetadata, a4);
    objc_storeStrong((id *)&v19->_originalRequest, a5);
    v19->_responseCode = a6;
    objc_storeStrong((id *)&v19->_error, a7);
    v20 = objc_opt_new();
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;

  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  ATXSuggestionRequestResponse *v4;
  ATXSuggestionRequestResponse *v5;
  void *v6;
  uint64_t v7;
  NSArray *suggestions;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  char v12;
  char v13;
  NSData *feedbackMetadata;
  NSData *v15;
  NSData *v16;
  NSData *v17;
  char v18;
  ATXSuggestionRequest *originalRequest;
  ATXSuggestionRequest *v20;
  ATXSuggestionRequest *v21;
  ATXSuggestionRequest *v22;
  BOOL v23;
  NSError *v24;
  NSError *v25;

  v4 = (ATXSuggestionRequestResponse *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSArray count](self->_suggestions, "count"))
      {
        -[ATXSuggestionRequestResponse suggestions](v5, "suggestions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        if (v7)
        {
          suggestions = self->_suggestions;
          v9 = v5->_suggestions;
          if (suggestions == v9)
          {

          }
          else
          {
            v10 = v9;
            v11 = suggestions;
            v12 = -[NSArray isEqual:](v11, "isEqual:", v10);

            if ((v12 & 1) == 0)
              goto LABEL_22;
          }
        }
      }
      feedbackMetadata = self->_feedbackMetadata;
      v15 = v5->_feedbackMetadata;
      if (feedbackMetadata == v15)
      {

      }
      else
      {
        v16 = v15;
        v17 = feedbackMetadata;
        v18 = -[NSData isEqual:](v17, "isEqual:", v16);

        if ((v18 & 1) == 0)
          goto LABEL_22;
      }
      originalRequest = self->_originalRequest;
      v20 = v5->_originalRequest;
      if (originalRequest == v20)
      {

      }
      else
      {
        v21 = v20;
        v22 = originalRequest;
        v23 = -[ATXSuggestionRequest isEqual:](v22, "isEqual:", v21);

        if (!v23)
          goto LABEL_22;
      }
      if (-[ATXSuggestionRequestResponse responseCode](v5, "responseCode") == self->_responseCode)
      {
        v24 = self->_error;
        v25 = v24;
        if (v24 == v5->_error)
          v13 = 1;
        else
          v13 = -[NSError isEqual:](v24, "isEqual:");

        goto LABEL_25;
      }
LABEL_22:
      v13 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v13 = 0;
  }
LABEL_26:

  return v13;
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
  -[ATXSuggestionRequestResponse encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSuggestionRequestResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSuggestionRequestResponse *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSuggestionRequestResponse initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXSuggestionRequestResponse)initWithProtoData:(id)a3
{
  id v4;
  ATXPBResponseForRequestForSuggestions *v5;
  ATXSuggestionRequestResponse *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBResponseForRequestForSuggestions initWithData:]([ATXPBResponseForRequestForSuggestions alloc], "initWithData:", v4);

    self = -[ATXSuggestionRequestResponse initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSuggestionRequestResponse)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  ATXSuggestionRequestResponse *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ATXInteractionSuggestionRequest *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXSuggestionRequestResponse initWithProto:].cold.2((uint64_t)self, v5);
      v12 = 0;
      goto LABEL_38;
    }
    v5 = v4;
    -[NSObject uuidString](v5, "uuidString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject suggestions](v5, "suggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject feedbackMetadata](v5, "feedbackMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject responseCode](v5, "responseCode");
    if (v10 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E57CE6B0[(int)v10];
    }
    v13 = v11;
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("FallbackToCache")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("Success")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("Error")) & 1) != 0)
    {
      v14 = 3;
    }
    else if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("SuccessAndReplaceCache")) & 1) != 0)
    {
      v14 = 4;
    }
    else if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("Max")))
    {
      v14 = 5;
    }
    else
    {
      v14 = 0;
    }

    if (-[NSObject hasErrorData](v5, "hasErrorData"))
    {
      -[NSObject errorData](v5, "errorData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSuggestionRequestResponse unarchivedNSErrorFromData:](self, "unarchivedNSErrorFromData:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    if (-[NSObject hasInteractionSuggestionRequest](v5, "hasInteractionSuggestionRequest"))
    {
      v17 = [ATXInteractionSuggestionRequest alloc];
      -[NSObject interactionSuggestionRequest](v5, "interactionSuggestionRequest");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[NSObject hasContextualActionSuggestionRequest](v5, "hasContextualActionSuggestionRequest"))
    {
      v17 = [ATXContextualActionSuggestionRequest alloc];
      -[NSObject contextualActionSuggestionRequest](v5, "contextualActionSuggestionRequest");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[NSObject hasIntentSuggestionRequest](v5, "hasIntentSuggestionRequest"))
        goto LABEL_34;
      v17 = [ATXIntentSuggestionRequest alloc];
      -[NSObject intentSuggestionRequest](v5, "intentSuggestionRequest");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;
    v20 = -[ATXInteractionSuggestionRequest initWithProto:](v17, "initWithProto:", v18);

    if (v20)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
      self = -[ATXSuggestionRequestResponse initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:uuid:](self, "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:uuid:", v8, v9, v20, v14, v16, v21);

      v12 = self;
LABEL_37:

LABEL_38:
      goto LABEL_39;
    }
LABEL_34:
    __atxlog_handle_blending();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[ATXSuggestionRequestResponse initWithProto:].cold.1(v20, v22, v23, v24, v25, v26, v27, v28);
    v12 = 0;
    goto LABEL_37;
  }
  v12 = 0;
LABEL_39:

  return v12;
}

ATXProactiveSuggestion *__46__ATXSuggestionRequestResponse_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXProactiveSuggestion *v3;
  ATXProactiveSuggestion *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  v3 = -[ATXProactiveSuggestion initWithProto:]([ATXProactiveSuggestion alloc], "initWithProto:", v2);

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __46__ATXSuggestionRequestResponse_initWithProto___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuidString:", v4);

  -[NSArray _pas_mappedArrayWithTransform:](self->_suggestions, "_pas_mappedArrayWithTransform:", &__block_literal_global_19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v3, "setSuggestions:", v6);

  objc_msgSend(v3, "setFeedbackMetadata:", self->_feedbackMetadata);
  v7 = self->_responseCode - 1;
  if (v7 > 4)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E57CE6E0[v7];
  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v9 = 0;
  }
  else if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("FallbackToCache")) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v9 = 2;
  }
  else if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Error")) & 1) != 0)
  {
    v9 = 3;
  }
  else if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("SuccessAndReplaceCache")) & 1) != 0)
  {
    v9 = 4;
  }
  else if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("Max")))
  {
    v9 = 5;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, "setResponseCode:", v9);
  if (self->_error)
  {
    -[ATXSuggestionRequestResponse dataFromNSError:](self, "dataFromNSError:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setErrorData:", v10);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ATXSuggestionRequest proto](self->_originalRequest, "proto");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteractionSuggestionRequest:", v11);
LABEL_25:

    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ATXSuggestionRequest proto](self->_originalRequest, "proto");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContextualActionSuggestionRequest:", v11);
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ATXSuggestionRequest proto](self->_originalRequest, "proto");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIntentSuggestionRequest:", v11);
    goto LABEL_25;
  }
  return v3;
}

id __37__ATXSuggestionRequestResponse_proto__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __37__ATXSuggestionRequestResponse_proto__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v3;
}

- (id)unarchivedNSErrorFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1AF421DC4]();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  objc_autoreleasePoolPop(v4);
  if (v6)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXSuggestionRequestResponse unarchivedNSErrorFromData:].cold.1((uint64_t)v6, v7, v8);

    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)dataFromNSError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1AF421DC4]();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  objc_autoreleasePoolPop(v4);
  if (v6)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXSuggestionRequestResponse dataFromNSError:].cold.1((uint64_t)v6, v7, v8);

    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSuggestionRequestResponse proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (ATXSuggestionRequest)originalRequest
{
  return self->_originalRequest;
}

- (int)responseCode
{
  return self->_responseCode;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Attempting to decode ATXSuggestionRequestResponse from proto failed because there is no original request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, v5, "%@: tried to initialize with a non-ATXPBUIEvent proto", (uint8_t *)&v6);

}

void __46__ATXSuggestionRequestResponse_initWithProto___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Attempting to decode ATXClientModelCacheUpdate from proto failed because the recovered PBCodable had an unrecoverable ATXProactiveSuggestion.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __37__ATXSuggestionRequestResponse_proto__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Unable to generate inner ProtoBuf class for ATXProactiveSuggestion", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)unarchivedNSErrorFromData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, a3, "Unable to unarchive error from Suggestion Request Response. Unarchiving Error: %@", (uint8_t *)&v3);
}

- (void)dataFromNSError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, a3, "Unable to archive error from Suggestion Request Response. Archiving Error: %@", (uint8_t *)&v3);
}

@end

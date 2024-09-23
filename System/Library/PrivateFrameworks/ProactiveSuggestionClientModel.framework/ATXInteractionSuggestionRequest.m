@implementation ATXInteractionSuggestionRequest

- (ATXInteractionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 psPredictionContext:(id)a5
{
  return -[ATXInteractionSuggestionRequest initWithOriginatorId:consumerSubType:psPredictionContext:timeout:](self, "initWithOriginatorId:consumerSubType:psPredictionContext:timeout:", a3, a4, a5, 0.5);
}

- (ATXInteractionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 psPredictionContext:(id)a5 timeout:(double)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  ATXInteractionSuggestionRequest *v13;

  v7 = a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  v13 = -[ATXInteractionSuggestionRequest initWithUUID:originatorId:consumerSubType:psPredictionContext:timeout:](self, "initWithUUID:originatorId:consumerSubType:psPredictionContext:timeout:", v12, v11, v7, v10, a6);

  return v13;
}

- (ATXInteractionSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 psPredictionContext:(id)a6 timeout:(double)a7
{
  uint64_t v9;
  id v13;
  ATXInteractionSuggestionRequest *v14;
  ATXInteractionSuggestionRequest *v15;
  objc_super v17;

  v9 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ATXInteractionSuggestionRequest;
  v14 = -[ATXSuggestionRequest initWithUUID:originatorId:consumerSubType:timeout:](&v17, sel_initWithUUID_originatorId_consumerSubType_timeout_, a3, a4, v9, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_psPredictionContext, a6);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  ATXInteractionSuggestionRequest *v4;
  ATXInteractionSuggestionRequest *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  ATXSuggestionExecutableProtocol *v12;
  ATXSuggestionExecutableProtocol *v13;
  char v14;

  v4 = (ATXInteractionSuggestionRequest *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXSuggestionRequest requestUUID](self, "requestUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSuggestionRequest requestUUID](v5, "requestUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (-[ATXSuggestionRequest originatorId](self, "originatorId"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[ATXSuggestionRequest originatorId](v5, "originatorId"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqualToString:", v10),
            v10,
            v9,
            v11))
      {
        v12 = self->_psPredictionContext;
        v13 = v12;
        if (v12 == v5->_psPredictionContext)
          v14 = 1;
        else
          v14 = -[ATXSuggestionExecutableProtocol isEqual:](v12, "isEqual:");

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
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
  -[ATXInteractionSuggestionRequest encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXInteractionSuggestionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXInteractionSuggestionRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXInteractionSuggestionRequest initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXInteractionSuggestionRequest)initWithProtoData:(id)a3
{
  id v4;
  ATXPBRequestForInteractionSuggestions *v5;
  ATXInteractionSuggestionRequest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBRequestForInteractionSuggestions initWithData:]([ATXPBRequestForInteractionSuggestions alloc], "initWithData:", v4);

    self = -[ATXInteractionSuggestionRequest initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXInteractionSuggestionRequest)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  ATXInteractionSuggestionRequest *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject consumerSubTypeString](v5, "consumerSubTypeString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v7 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v6, &v27);
      v8 = 0;
      if (v27)
      {
        v9 = v7;
        if ((_DWORD)v7)
        {
          if ((_DWORD)v7 != 48)
          {
            -[NSObject uuidString](v5, "uuidString");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject originatorId](v5, "originatorId");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSObject hasPsPredictionContext](v5, "hasPsPredictionContext"))
            {
              -[NSObject psPredictionContext](v5, "psPredictionContext");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = NSClassFromString(CFSTR("_PSPredictionContext"));
              if (v13)
              {
                v14 = MEMORY[0x1AF421DC4]();
                v23 = (void *)MEMORY[0x1E0CB3710];
                v24 = (void *)v14;
                v15 = (void *)MEMORY[0x1AF421DC4]();
                v25 = v10;
                v16 = v12;
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v13, 0);
                objc_autoreleasePoolPop(v15);
                v26 = 0;
                objc_msgSend(v23, "unarchivedObjectOfClasses:fromData:error:", v17, v16, &v26);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v26;

                v12 = v16;
                v10 = v25;
                objc_autoreleasePoolPop(v24);

              }
            }
            else
            {
              v13 = 0;
            }
            v19 = 0.5;
            if (-[NSObject hasTimeout](v5, "hasTimeout"))
            {
              -[NSObject timeout](v5, "timeout");
              v19 = v20;
            }
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
            self = -[ATXInteractionSuggestionRequest initWithUUID:originatorId:consumerSubType:psPredictionContext:timeout:](self, "initWithUUID:originatorId:consumerSubType:psPredictionContext:timeout:", v21, v11, v9, v13, v19);

            v8 = self;
          }
        }
      }

    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXSuggestionRequestResponse initWithProto:].cold.2((uint64_t)self, v5);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", -[ATXSuggestionRequest consumerSubType](self, "consumerSubType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConsumerSubTypeString:", v4);

  -[ATXSuggestionRequest originatorId](self, "originatorId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginatorId:", v5);

  -[ATXSuggestionRequest requestUUID](self, "requestUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuidString:", v7);

  -[ATXInteractionSuggestionRequest archivePredictionContext](self, "archivePredictionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPsPredictionContext:", v8);

  -[ATXSuggestionRequest timeout](self, "timeout");
  objc_msgSend(v3, "setTimeout:");
  return v3;
}

- (id)archivePredictionContext
{
  void *v3;
  ATXSuggestionExecutableProtocol *psPredictionContext;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v11;

  if (!self->_psPredictionContext)
    return 0;
  v3 = (void *)MEMORY[0x1AF421DC4]();
  psPredictionContext = self->_psPredictionContext;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", psPredictionContext, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  objc_autoreleasePoolPop(v3);
  if (v6)
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXInteractionSuggestionRequest archivePredictionContext].cold.1((uint64_t)v6, v7, v8);

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

  -[ATXInteractionSuggestionRequest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXSuggestionExecutableProtocol)psPredictionContext
{
  return self->_psPredictionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psPredictionContext, 0);
}

- (void)archivePredictionContext
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, a3, "Error when archiving psPredictionContext in ATXInteractionSuggestionRequest. Error: %@", (uint8_t *)&v3);
}

@end

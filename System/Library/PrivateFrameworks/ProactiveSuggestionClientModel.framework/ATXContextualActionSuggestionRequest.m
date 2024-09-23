@implementation ATXContextualActionSuggestionRequest

- (ATXContextualActionSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 caxPredictionContext:(id)a5 maxSuggestions:(unint64_t)a6 timeout:(double)a7
{
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  ATXContextualActionSuggestionRequest *v15;

  v9 = a4;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = -[ATXContextualActionSuggestionRequest initWithUUID:originatorId:consumerSubType:caxPredictionContext:maxSuggestions:timeout:](self, "initWithUUID:originatorId:consumerSubType:caxPredictionContext:maxSuggestions:timeout:", v14, v13, v9, v12, a6, a7);

  return v15;
}

- (ATXContextualActionSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 caxPredictionContext:(id)a6 maxSuggestions:(unint64_t)a7 timeout:(double)a8
{
  uint64_t v11;
  id v15;
  ATXContextualActionSuggestionRequest *v16;
  ATXContextualActionSuggestionRequest *v17;
  objc_super v19;

  v11 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ATXContextualActionSuggestionRequest;
  v16 = -[ATXSuggestionRequest initWithUUID:originatorId:consumerSubType:timeout:](&v19, sel_initWithUUID_originatorId_consumerSubType_timeout_, a3, a4, v11, a8);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_caxPredictionContext, a6);
    v17->_maxSuggestions = a7;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  ATXContextualActionSuggestionRequest *v4;
  ATXContextualActionSuggestionRequest *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  ATXSuggestionExecutableProtocol *v12;
  ATXSuggestionExecutableProtocol *v13;
  char v14;

  v4 = (ATXContextualActionSuggestionRequest *)a3;
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
        v12 = self->_caxPredictionContext;
        v13 = v12;
        if (v12 == v5->_caxPredictionContext)
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
  -[ATXContextualActionSuggestionRequest encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXContextualActionSuggestionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXContextualActionSuggestionRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXContextualActionSuggestionRequest initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXContextualActionSuggestionRequest)initWithProtoData:(id)a3
{
  id v4;
  ATXPBRequestForContextualActionSuggestions *v5;
  ATXContextualActionSuggestionRequest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBRequestForContextualActionSuggestions initWithData:]([ATXPBRequestForContextualActionSuggestions alloc], "initWithData:", v4);

    self = -[ATXContextualActionSuggestionRequest initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXContextualActionSuggestionRequest)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  ATXContextualActionSuggestionRequest *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  Class v13;
  Class v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *context;
  void *v28;
  void *v29;
  id v30;
  char v31;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_contextual_actions();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXSuggestionRequestResponse initWithProto:].cold.2((uint64_t)self, v5);
      v8 = 0;
      goto LABEL_24;
    }
    v5 = v4;
    -[NSObject consumerSubTypeString](v5, "consumerSubTypeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v7 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v6, &v31);
    v8 = 0;
    if (!v31 || (v9 = v7, !(_DWORD)v7) || (_DWORD)v7 == 48)
    {
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    -[NSObject uuidString](v5, "uuidString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject originatorId](v5, "originatorId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSObject hasCaxPredictionContext](v5, "hasCaxPredictionContext"))
    {
      v19 = 0;
LABEL_22:
      v22 = (int)-[NSObject maxSuggestions](v5, "maxSuggestions");
      -[NSObject timeout](v5, "timeout");
      v24 = v23;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
      self = -[ATXContextualActionSuggestionRequest initWithUUID:originatorId:consumerSubType:caxPredictionContext:maxSuggestions:timeout:](self, "initWithUUID:originatorId:consumerSubType:caxPredictionContext:maxSuggestions:timeout:", v25, v11, v9, v19, v22, v24);

      v8 = self;
      goto LABEL_23;
    }
    v29 = v10;
    -[NSObject caxPredictionContext](v5, "caxPredictionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = NSClassFromString(CFSTR("CAXPredictionContext"));
    if (v13)
    {
      v14 = v13;
      context = (void *)MEMORY[0x1AF421DC4]();
      v15 = (void *)MEMORY[0x1E0CB3710];
      v28 = v12;
      v16 = MEMORY[0x1AF421DC4]();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v14, 0);
      v18 = (void *)v16;
      v12 = v28;
      objc_autoreleasePoolPop(v18);
      v30 = 0;
      objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v17, v28, &v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v30;

      objc_autoreleasePoolPop(context);
      if (!v20)
      {
LABEL_21:

        v10 = v29;
        goto LABEL_22;
      }
      __atxlog_handle_contextual_actions();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ATXContextualActionSuggestionRequest initWithProto:].cold.2((uint64_t)v20, v21);

      v12 = v28;
    }
    else
    {
      __atxlog_handle_contextual_actions();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ATXContextualActionSuggestionRequest initWithProto:].cold.1(v20);
      v19 = 0;
    }

    goto LABEL_21;
  }
  v8 = 0;
LABEL_25:

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

  -[ATXContextualActionSuggestionRequest archivePredictionContext](self, "archivePredictionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCaxPredictionContext:", v8);

  objc_msgSend(v3, "setMaxSuggestions:", LODWORD(self->_maxSuggestions));
  -[ATXSuggestionRequest timeout](self, "timeout");
  objc_msgSend(v3, "setTimeout:");
  return v3;
}

- (id)archivePredictionContext
{
  void *v3;
  ATXSuggestionExecutableProtocol *caxPredictionContext;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v11;

  if (!self->_caxPredictionContext)
    return 0;
  v3 = (void *)MEMORY[0x1AF421DC4]();
  caxPredictionContext = self->_caxPredictionContext;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", caxPredictionContext, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  objc_autoreleasePoolPop(v3);
  if (v6)
  {
    __atxlog_handle_contextual_actions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXContextualActionSuggestionRequest archivePredictionContext].cold.1((uint64_t)v6, v7, v8);

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

  -[ATXContextualActionSuggestionRequest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXSuggestionExecutableProtocol)caxPredictionContext
{
  return self->_caxPredictionContext;
}

- (unint64_t)maxSuggestions
{
  return self->_maxSuggestions;
}

- (void)setMaxSuggestions:(unint64_t)a3
{
  self->_maxSuggestions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caxPredictionContext, 0);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "Unable to access class for CAXPredictionContext", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AA841000, a2, OS_LOG_TYPE_ERROR, "Error when deserializing CAXPredictionContext: %@", (uint8_t *)&v2, 0xCu);
}

- (void)archivePredictionContext
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, a3, "Error when archiving caxPredictionContext in ATXContextualActionSuggestionRequest. Error: %@", (uint8_t *)&v3);
}

@end

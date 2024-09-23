@implementation ATXSuggestionRequest

- (ATXSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5
{
  return -[ATXSuggestionRequest initWithUUID:originatorId:consumerSubType:timeout:](self, "initWithUUID:originatorId:consumerSubType:timeout:", a3, a4, a5, 0.5);
}

- (ATXSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 timeout:(double)a6
{
  id v11;
  id v12;
  ATXSuggestionRequest *v13;
  ATXSuggestionRequest *v14;
  uint64_t v15;
  NSString *originatorId;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXSuggestionRequest;
  v13 = -[ATXSuggestionRequest init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requestUUID, a3);
    v15 = objc_msgSend(v12, "copy");
    originatorId = v14->_originatorId;
    v14->_originatorId = (NSString *)v15;

    v14->_consumerSubType = a5;
    v14->_timeout = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  ATXSuggestionRequest *v4;
  id *v5;
  NSUUID *requestUUID;
  NSUUID *v7;
  NSUUID *v8;
  NSUUID *v9;
  char v10;
  BOOL v11;
  NSString *originatorId;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  int consumerSubType;

  v4 = (ATXSuggestionRequest *)a3;
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
      requestUUID = self->_requestUUID;
      v7 = (NSUUID *)v5[2];
      if (requestUUID == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = requestUUID;
        v10 = -[NSUUID isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_11;
      }
      originatorId = self->_originatorId;
      v13 = (NSString *)v5[3];
      if (originatorId == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = originatorId;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
        {
LABEL_11:
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      consumerSubType = self->_consumerSubType;
      v11 = consumerSubType == objc_msgSend(v5, "consumerSubType");
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_requestUUID, "hash");
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
  -[ATXSuggestionRequest encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSuggestionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSuggestionRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSuggestionRequest initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXSuggestionRequest)initWithProtoData:(id)a3
{
  id v4;
  ATXPBRequestForSuggestions *v5;
  ATXSuggestionRequest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBRequestForSuggestions initWithData:]([ATXPBRequestForSuggestions alloc], "initWithData:", v4);

    self = -[ATXSuggestionRequest initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSuggestionRequest)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  ATXSuggestionRequest *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  char v16;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject consumerSubTypeString](v5, "consumerSubTypeString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v7 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v6, &v16);
      v8 = 0;
      if (v16)
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
            v12 = 0.5;
            if (-[NSObject hasTimeout](v5, "hasTimeout"))
            {
              -[NSObject timeout](v5, "timeout");
              v12 = v13;
            }
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
            self = -[ATXSuggestionRequest initWithUUID:originatorId:consumerSubType:timeout:](self, "initWithUUID:originatorId:consumerSubType:timeout:", v14, v11, v9, v12);

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
        -[ATXSuggestionRequest initWithProto:].cold.1((uint64_t)self, v5);
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConsumerSubTypeString:", v4);

  objc_msgSend(v3, "setOriginatorId:", self->_originatorId);
  -[NSUUID UUIDString](self->_requestUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuidString:", v5);

  objc_msgSend(v3, "setTimeout:", self->_timeout);
  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSuggestionRequest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSString)originatorId
{
  return self->_originatorId;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorId, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBUIEvent proto", (uint8_t *)&v5, 0xCu);

}

@end

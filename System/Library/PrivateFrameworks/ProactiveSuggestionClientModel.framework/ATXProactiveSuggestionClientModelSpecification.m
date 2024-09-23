@implementation ATXProactiveSuggestionClientModelSpecification

- (id)proto
{
  void *v3;
  unint64_t engagementResetPolicy;
  __CFString *v5;
  __CFString *v6;
  int v7;

  v3 = (void *)objc_opt_new();
  -[ATXPBProactiveSuggestionClientModelSpecification setClientModelId:]((uint64_t)v3, self->_clientModelId);
  -[ATXPBProactiveSuggestionClientModelSpecification setClientModelVersion:]((uint64_t)v3, self->_clientModelVersion);
  engagementResetPolicy = self->_engagementResetPolicy;
  if (engagementResetPolicy)
  {
    if (engagementResetPolicy == 1)
    {
      v5 = CFSTR("WhenNotPredicted");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), self->_engagementResetPolicy);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = CFSTR("OnCacheUpdate");
  }
  v6 = v5;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("OnCacheUpdate")) & 1) != 0)
    v7 = 0;
  else
    v7 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("WhenNotPredicted"));

  -[ATXPBProactiveSuggestionClientModelSpecification setEngagementResetPolicy:]((uint64_t)v3, v7);
  return v3;
}

- (ATXProactiveSuggestionClientModelSpecification)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  NSObject *v10;
  ATXProactiveSuggestionClientModelSpecification *v11;
  __CFString *v12;
  uint64_t v13;

  v4 = a3;
  if (!v4)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestion initWithProto:].cold.7();

    goto LABEL_9;
  }
  v5 = v4;
  -[ATXPBProactiveSuggestionClientModelSpecification clientModelId]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionClientModelSpecification clientModelVersion]((uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXPBProactiveSuggestionClientModelSpecification engagementResetPolicy]((uint64_t)v5);
  if ((_DWORD)v8)
  {
    if ((_DWORD)v8 == 1)
    {
      v9 = CFSTR("WhenNotPredicted");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = CFSTR("OnCacheUpdate");
  }
  v12 = v9;
  if ((-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("OnCacheUpdate")) & 1) != 0)
    v13 = 0;
  else
    v13 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("WhenNotPredicted"));

  self = -[ATXProactiveSuggestionClientModelSpecification initWithClientModelId:clientModelVersion:engagementResetPolicy:](self, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v6, v7, v13);
  v11 = self;
LABEL_16:

  return v11;
}

- (ATXProactiveSuggestionClientModelSpecification)initWithClientModelId:(id)a3 clientModelVersion:(id)a4 engagementResetPolicy:(unint64_t)a5
{
  id v8;
  id v9;
  ATXProactiveSuggestionClientModelSpecification *v10;
  uint64_t v11;
  NSString *clientModelId;
  uint64_t v13;
  NSString *clientModelVersion;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXProactiveSuggestionClientModelSpecification;
  v10 = -[ATXProactiveSuggestionClientModelSpecification init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    clientModelId = v10->_clientModelId;
    v10->_clientModelId = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    clientModelVersion = v10->_clientModelVersion;
    v10->_clientModelVersion = (NSString *)v13;

    v10->_engagementResetPolicy = a5;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelVersion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (ATXProactiveSuggestionClientModelSpecification)initWithClientModelId:(id)a3 clientModelVersion:(id)a4
{
  return -[ATXProactiveSuggestionClientModelSpecification initWithClientModelId:clientModelVersion:engagementResetPolicy:](self, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", a3, a4, 0);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Client Model: %@ (version: %@)   Recently Engaged Policy: %lu"), self->_clientModelId, self->_clientModelVersion, self->_engagementResetPolicy);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXProactiveSuggestionClientModelSpecification *v4;
  void *v5;
  void *v6;
  ATXProactiveSuggestionClientModelSpecification *v7;

  v4 = +[ATXProactiveSuggestionClientModelSpecification allocWithZone:](ATXProactiveSuggestionClientModelSpecification, "allocWithZone:", a3);
  v5 = (void *)-[NSString copy](self->_clientModelId, "copy");
  v6 = (void *)-[NSString copy](self->_clientModelVersion, "copy");
  v7 = -[ATXProactiveSuggestionClientModelSpecification initWithClientModelId:clientModelVersion:engagementResetPolicy:](v4, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v5, v6, self->_engagementResetPolicy);

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_clientModelId, "hash");
  v4 = -[NSString hash](self->_clientModelVersion, "hash");
  return self->_engagementResetPolicy - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionClientModelSpecification *v4;
  id *v5;
  NSString *clientModelId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  BOOL v11;
  NSString *clientModelVersion;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  unint64_t engagementResetPolicy;

  v4 = (ATXProactiveSuggestionClientModelSpecification *)a3;
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
      clientModelId = self->_clientModelId;
      v7 = (NSString *)v5[1];
      if (clientModelId == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = clientModelId;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_11;
      }
      clientModelVersion = self->_clientModelVersion;
      v13 = (NSString *)v5[2];
      if (clientModelVersion == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = clientModelVersion;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
        {
LABEL_11:
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      engagementResetPolicy = self->_engagementResetPolicy;
      v11 = engagementResetPolicy == objc_msgSend(v5, "engagementResetPolicy");
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestionClientModelSpecification proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXProactiveSuggestionClientModelSpecification)initWithProtoData:(id)a3
{
  id v4;
  ATXPBProactiveSuggestionClientModelSpecification *v5;
  ATXProactiveSuggestionClientModelSpecification *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBProactiveSuggestionClientModelSpecification initWithData:]([ATXPBProactiveSuggestionClientModelSpecification alloc], "initWithData:", v4);

    self = -[ATXProactiveSuggestionClientModelSpecification initWithProto:](self, "initWithProto:", v5);
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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXProactiveSuggestionClientModelSpecification encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXProactiveSuggestionClientModelSpecification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestionClientModelSpecification *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXProactiveSuggestionClientModelSpecification initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  NSString *clientModelVersion;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("clientModelId");
  v4[1] = CFSTR("clientModelVersion");
  clientModelVersion = self->_clientModelVersion;
  v5[0] = self->_clientModelId;
  v5[1] = clientModelVersion;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSString)clientModelVersion
{
  return self->_clientModelVersion;
}

- (unint64_t)engagementResetPolicy
{
  return self->_engagementResetPolicy;
}

@end

@implementation ATXLightweightClientModelCacheUpdate

- (ATXLightweightClientModelCacheUpdate)initWithClientModelCacheUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXLightweightClientModelCacheUpdate *v10;

  v4 = a3;
  objc_msgSend(v4, "clientModelId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromSuggestions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheCreationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXLightweightClientModelCacheUpdate initWithClientModelId:suggestions:uuid:cacheCreationDate:](self, "initWithClientModelId:suggestions:uuid:cacheCreationDate:", v5, v7, v8, v9);
  return v10;
}

- (ATXLightweightClientModelCacheUpdate)initWithClientModelId:(id)a3 suggestions:(id)a4 uuid:(id)a5 cacheCreationDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXLightweightClientModelCacheUpdate *v15;
  ATXLightweightClientModelCacheUpdate *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXLightweightClientModelCacheUpdate;
  v15 = -[ATXLightweightClientModelCacheUpdate init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientModelId, a3);
    objc_storeStrong((id *)&v16->_suggestions, a4);
    objc_storeStrong((id *)&v16->_uuid, a5);
    objc_storeStrong((id *)&v16->_cacheCreationDate, a6);
  }

  return v16;
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
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("clientModelId: %@\n"), self->_clientModelId);
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionDescriptionsFromLightWeightSuggestions:", self->_suggestions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("suggestions: %@\n"), v4);

  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("uuid: %@\n"), v5);

  -[NSDate description](self->_cacheCreationDate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cacheCreationDate: %@\n"), v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSString *)v7;
}

- (id)jsonDict
{
  const __CFString *clientModelId;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  clientModelId = (const __CFString *)self->_clientModelId;
  if (!clientModelId)
    clientModelId = CFSTR("nil");
  v15[0] = clientModelId;
  v14[0] = CFSTR("clientModelId");
  v14[1] = CFSTR("uuid");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("nil");
  v15[1] = v6;
  v14[2] = CFSTR("suggestions");
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionDescriptionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionDescriptionsFromLightWeightSuggestions:", self->_suggestions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("suggestionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_suggestions, "count"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("nil");
  v15[3] = v10;
  v14[4] = CFSTR("cacheCreationDate");
  -[NSDate description](self->_cacheCreationDate, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXLightweightClientModelCacheUpdate jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXLightweightClientModelCacheUpdate *v4;
  ATXLightweightClientModelCacheUpdate *v5;
  BOOL v6;

  v4 = (ATXLightweightClientModelCacheUpdate *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXLightweightClientModelCacheUpdate isEqualToATXLightweightClientModelCacheUpdate:](self, "isEqualToATXLightweightClientModelCacheUpdate:", v5);

  return v6;
}

- (BOOL)isEqualToATXLightweightClientModelCacheUpdate:(id)a3
{
  id *v4;
  NSString *clientModelId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSArray *suggestions;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  NSUUID *uuid;
  NSUUID *v16;
  NSUUID *v17;
  NSUUID *v18;
  char v19;
  char v20;
  NSDate *v21;
  NSDate *v22;

  v4 = (id *)a3;
  clientModelId = self->_clientModelId;
  v6 = (NSString *)v4[1];
  if (clientModelId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = clientModelId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  suggestions = self->_suggestions;
  v11 = (NSArray *)v4[2];
  if (suggestions == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = suggestions;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  uuid = self->_uuid;
  v16 = (NSUUID *)v4[3];
  if (uuid == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = uuid;
    v19 = -[NSUUID isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
    {
LABEL_11:
      v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_cacheCreationDate;
  v22 = v21;
  if (v21 == v4[4])
    v20 = 1;
  else
    v20 = -[NSDate isEqual:](v21, "isEqual:");

LABEL_17:
  return v20;
}

- (ATXLightweightClientModelCacheUpdate)initWithProtoData:(id)a3
{
  id v4;
  ATXPBLightweightClientModelCacheUpdate *v5;
  ATXLightweightClientModelCacheUpdate *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBLightweightClientModelCacheUpdate initWithData:]([ATXPBLightweightClientModelCacheUpdate alloc], "initWithData:", v4);

    self = -[ATXLightweightClientModelCacheUpdate initWithProto:](self, "initWithProto:", v5);
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

  -[ATXLightweightClientModelCacheUpdate proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXLightweightClientModelCacheUpdate)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  ATXLightweightClientModelCacheUpdate *v16;
  NSObject *v17;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_blending();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXLightweightClientModelCacheUpdate initWithProto:].cold.1((uint64_t)self, v17);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "clientModelId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXLightweightProactiveSuggestion lightWeightSuggestionsFromProtoLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "lightWeightSuggestionsFromProtoLightWeightSuggestions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "uuidString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
  v12 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v5, "cacheCreationDate");
  v14 = v13;

  v15 = (void *)objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:", v14);
  self = -[ATXLightweightClientModelCacheUpdate initWithClientModelId:suggestions:uuid:cacheCreationDate:](self, "initWithClientModelId:suggestions:uuid:cacheCreationDate:", v6, v8, v11, v15);

  v16 = self;
LABEL_8:

  return v16;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setClientModelId:", self->_clientModelId);
  +[ATXLightweightProactiveSuggestion protoLightWeightSuggestionsFromLightWeightSuggestions:](ATXLightweightProactiveSuggestion, "protoLightWeightSuggestionsFromLightWeightSuggestions:", self->_suggestions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setSuggestions:", v5);

  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuidString:", v6);

  -[NSDate timeIntervalSinceReferenceDate](self->_cacheCreationDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setCacheCreationDate:");
  return v3;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)cacheCreationDate
{
  return self->_cacheCreationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCreationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
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
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);

}

@end

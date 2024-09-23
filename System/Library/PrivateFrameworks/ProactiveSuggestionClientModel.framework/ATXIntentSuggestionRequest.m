@implementation ATXIntentSuggestionRequest

- (ATXIntentSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 timeout:(double)a6
{
  return -[ATXIntentSuggestionRequest initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:](self, "initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:", a3, a4, a5, 0, 0, 0, a6);
}

- (ATXIntentSuggestionRequest)initWithOriginatorId:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIds:(id)a5 intentClassNames:(id)a6 limit:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  ATXIntentSuggestionRequest *v17;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  v17 = -[ATXIntentSuggestionRequest initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:](self, "initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:", v16, v15, v9, v14, v13, v12, 10.0);

  return v17;
}

- (ATXIntentSuggestionRequest)initWithUUID:(id)a3 originatorId:(id)a4 consumerSubType:(unsigned __int8)a5 bundleIds:(id)a6 intentClassNames:(id)a7 limit:(id)a8 timeout:(double)a9
{
  uint64_t v13;
  id v17;
  id v18;
  id v19;
  ATXIntentSuggestionRequest *v20;
  objc_super v22;

  v13 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v22.receiver = self;
  v22.super_class = (Class)ATXIntentSuggestionRequest;
  v20 = -[ATXSuggestionRequest initWithUUID:originatorId:consumerSubType:timeout:](&v22, sel_initWithUUID_originatorId_consumerSubType_timeout_, a3, a4, v13, a9);
  if (v20)
  {
    if (objc_msgSend(v17, "count"))
      objc_storeStrong((id *)&v20->_bundleIds, a6);
    if (objc_msgSend(v18, "count"))
      objc_storeStrong((id *)&v20->_intentClassNames, a7);
    objc_storeStrong((id *)&v20->_limit, a8);
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  ATXIntentSuggestionRequest *v4;
  ATXIntentSuggestionRequest *v5;
  NSNumber *limit;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  char v10;
  char v11;
  NSArray *bundleIds;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  char v16;
  NSArray *v17;
  NSArray *v18;
  objc_super v20;

  v4 = (ATXIntentSuggestionRequest *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ATXIntentSuggestionRequest;
    if (-[ATXSuggestionRequest isEqual:](&v20, sel_isEqual_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        limit = self->_limit;
        v7 = v5->_limit;
        if (limit == v7)
        {

        }
        else
        {
          v8 = v7;
          v9 = limit;
          v10 = -[NSNumber isEqual:](v9, "isEqual:", v8);

          if ((v10 & 1) == 0)
            goto LABEL_12;
        }
        bundleIds = self->_bundleIds;
        v13 = v5->_bundleIds;
        if (bundleIds == v13)
        {

        }
        else
        {
          v14 = v13;
          v15 = bundleIds;
          v16 = -[NSArray isEqual:](v15, "isEqual:", v14);

          if ((v16 & 1) == 0)
          {
LABEL_12:
            v11 = 0;
LABEL_18:

            goto LABEL_19;
          }
        }
        v17 = self->_intentClassNames;
        v18 = v17;
        if (v17 == v5->_intentClassNames)
          v11 = 1;
        else
          v11 = -[NSArray isEqual:](v17, "isEqual:");

        goto LABEL_18;
      }
    }
    v11 = 0;
  }
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXIntentSuggestionRequest;
  v3 = -[ATXSuggestionRequest hash](&v7, sel_hash);
  v4 = -[NSArray hash](self->_bundleIds, "hash") - v3 + 32 * v3;
  v5 = -[NSArray hash](self->_intentClassNames, "hash") - v4 + 32 * v4;
  return -[NSNumber hash](self->_limit, "hash") - v5 + 32 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXIntentSuggestionRequest encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXIntentSuggestionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXIntentSuggestionRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXIntentSuggestionRequest initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXIntentSuggestionRequest)initWithProtoData:(id)a3
{
  id v4;
  ATXPBRequestForIntentSuggestions *v5;
  ATXIntentSuggestionRequest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBRequestForIntentSuggestions initWithData:]([ATXPBRequestForIntentSuggestions alloc], "initWithData:", v4);

    self = -[ATXIntentSuggestionRequest initWithProto:](self, "initWithProto:", v5);
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

  -[ATXIntentSuggestionRequest proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXIntentSuggestionRequest)initWithProto:(id)a3
{
  id v4;
  id v5;
  ATXSuggestionRequest *v6;
  void *v7;
  ATXSuggestionRequest *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  ATXIntentSuggestionRequest *v16;
  void *v18;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v16 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ATXIntentSuggestionRequest initWithProto:].cold.1();

    goto LABEL_8;
  }
  v5 = v4;
  v6 = [ATXSuggestionRequest alloc];
  objc_msgSend(v5, "base");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXSuggestionRequest initWithProto:](v6, "initWithProto:", v7);

  -[ATXSuggestionRequest requestUUID](v8, "requestUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionRequest originatorId](v8, "originatorId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATXSuggestionRequest consumerSubType](v8, "consumerSubType");
  objc_msgSend(v5, "bundleIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentClassNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "hasLimit");
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "limit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[ATXSuggestionRequest timeout](v8, "timeout");
  self = -[ATXIntentSuggestionRequest initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:](self, "initWithUUID:originatorId:consumerSubType:bundleIds:intentClassNames:limit:timeout:", v18, v9, v10, v11, v12, v14);
  if (v13)

  v16 = self;
LABEL_13:

  return v16;
}

- (id)proto
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v26.receiver = self;
  v26.super_class = (Class)ATXIntentSuggestionRequest;
  -[ATXSuggestionRequest proto](&v26, sel_proto);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "setBase:", v4);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_bundleIds;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "addBundleIds:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v7);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_intentClassNames;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v3, "addIntentClassNames:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++), (_QWORD)v18);
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v12);
    }

    if (self->_limit)
    {
      objc_msgSend(v3, "setHasLimit:", 1);
      objc_msgSend(v3, "setLimit:", -[NSNumber intValue](self->_limit, "intValue"));
    }
    else
    {
      objc_msgSend(v3, "setHasLimit:", 0);
    }
    v16 = v3;
  }
  else
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ATXIntentSuggestionRequest proto].cold.1();

    v16 = 0;
  }

  return v16;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (NSArray)intentClassNames
{
  return self->_intentClassNames;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_intentClassNames, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)initWithProto:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1AA841000, v0, v1, "%s: Returning nil because input proto is of unexpected class %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)proto
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1AA841000, v0, v1, "%s: Returning nil because [super proto] is of unexpected class %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end

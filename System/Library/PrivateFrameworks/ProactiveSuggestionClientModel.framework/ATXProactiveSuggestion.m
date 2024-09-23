@implementation ATXProactiveSuggestion

- (ATXProactiveSuggestionExecutableSpecification)executableSpecification
{
  return self->_executableSpecification;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  NSObject *v10;

  v3 = (void *)objc_opt_new();
  -[ATXProactiveSuggestionClientModelSpecification proto](self->_clientModelSpecification, "proto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestion setClientModelSpecification:]((uint64_t)v3, v4);

  -[ATXProactiveSuggestionExecutableSpecification proto](self->_executableSpecification, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestion setExecutableSpecification:]((uint64_t)v3, v5);

  -[ATXProactiveSuggestionScoreSpecification proto](self->_scoreSpecification, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestion setScoreSpecification:]((uint64_t)v3, v6);

  -[ATXProactiveSuggestionUISpecification proto](self->_uiSpecification, "proto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestion setUiSpecification:]((uint64_t)v3, v7);

  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestion setUuidString:]((uint64_t)v3, v8);

  -[ATXPBProactiveSuggestion uuidString]((uint64_t)v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestion proto].cold.1((uint64_t *)&self->_uuid, (uint64_t)self, v10);

  }
  return v3;
}

+ (id)suggestionsFromProtoSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ATXProactiveSuggestion *v10;
  NSObject *v11;
  char v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = -[ATXProactiveSuggestion initWithProto:]([ATXProactiveSuggestion alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            __atxlog_handle_default();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
              +[ATXProactiveSuggestion suggestionsFromProtoSuggestions:].cold.1(&v13, v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ATXProactiveSuggestion)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  ATXProactiveSuggestionClientModelSpecification *v9;
  void *v10;
  NSObject *v11;
  ATXProactiveSuggestionExecutableSpecification *v12;
  void *v13;
  NSObject *v14;
  ATXProactiveSuggestionUISpecification *v15;
  void *v16;
  NSObject *v17;
  ATXProactiveSuggestionScoreSpecification *v18;
  void *v19;
  NSObject *v20;
  ATXProactiveSuggestion *v21;
  NSObject *v22;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestion initWithProto:].cold.7();
      v21 = 0;
      goto LABEL_37;
    }
    v5 = v4;
    if (!-[ATXPBProactiveSuggestion hasUuidString]((_BOOL8)v5))
    {
      __atxlog_handle_blending();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestion initWithProto:].cold.6();
      v21 = 0;
      goto LABEL_36;
    }
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[ATXPBProactiveSuggestion uuidString]((uint64_t)v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithUUIDString:", v7);

    if (!v8)
    {
      __atxlog_handle_blending();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestion initWithProto:].cold.1();
      v21 = 0;
      goto LABEL_35;
    }
    v9 = [ATXProactiveSuggestionClientModelSpecification alloc];
    -[ATXPBProactiveSuggestion clientModelSpecification]((uint64_t)v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ATXProactiveSuggestionClientModelSpecification initWithProto:](v9, "initWithProto:", v10);

    if (!v11)
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestion initWithProto:].cold.2();
      v21 = 0;
      goto LABEL_34;
    }
    v12 = [ATXProactiveSuggestionExecutableSpecification alloc];
    -[ATXPBProactiveSuggestion executableSpecification]((uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ATXProactiveSuggestionExecutableSpecification initWithProto:](v12, "initWithProto:", v13);

    if (!v14)
    {
      __atxlog_handle_blending();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestion initWithProto:].cold.3();
      v21 = 0;
      goto LABEL_33;
    }
    v15 = [ATXProactiveSuggestionUISpecification alloc];
    -[ATXPBProactiveSuggestion uiSpecification]((uint64_t)v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ATXProactiveSuggestionUISpecification initWithProto:](v15, "initWithProto:", v16);

    if (v17)
    {
      v18 = [ATXProactiveSuggestionScoreSpecification alloc];
      -[ATXPBProactiveSuggestion scoreSpecification]((uint64_t)v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[ATXProactiveSuggestionScoreSpecification initWithProto:](v18, "initWithProto:", v19);

      if (v20)
      {
        self = -[ATXProactiveSuggestion initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:uuid:](self, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:uuid:", v11, v14, v17, v20, v8);
        v21 = self;
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      __atxlog_handle_blending();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestion initWithProto:].cold.5();

    }
    else
    {
      __atxlog_handle_blending();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[ATXProactiveSuggestion initWithProto:].cold.4();
    }
    v21 = 0;
    goto LABEL_32;
  }
  v21 = 0;
LABEL_38:

  return v21;
}

- (ATXProactiveSuggestion)initWithClientModelSpecification:(id)a3 executableSpecification:(id)a4 uiSpecification:(id)a5 scoreSpecification:(id)a6 uuid:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXProactiveSuggestion *v17;
  ATXProactiveSuggestion *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXProactiveSuggestion;
  v17 = -[ATXProactiveSuggestion init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientModelSpecification, a3);
    objc_storeStrong((id *)&v18->_executableSpecification, a4);
    objc_storeStrong((id *)&v18->_uiSpecification, a5);
    objc_storeStrong((id *)&v18->_scoreSpecification, a6);
    objc_storeStrong((id *)&v18->_uuid, a7);
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_uiSpecification, 0);
  objc_storeStrong((id *)&self->_executableSpecification, 0);
  objc_storeStrong((id *)&self->_clientModelSpecification, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (ATXProactiveSuggestionScoreSpecification)scoreSpecification
{
  return self->_scoreSpecification;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (ATXProactiveSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXProactiveSuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXProactiveSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBProactiveSuggestion *v5;
  ATXProactiveSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBProactiveSuggestion initWithData:]([ATXPBProactiveSuggestion alloc], "initWithData:", v4);

    self = -[ATXProactiveSuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)suggestionsHaveChangedFromPreviousSuggestions:(id)a3 newSuggestions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v5, "count"))
  {
    v7 = objc_msgSend(v6, "count");
    if (v7 == objc_msgSend(v5, "count"))
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke;
      v13[3] = &unk_1E57CF530;
      v14 = v5;
      v15 = &v16;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
      v8 = *((_BYTE *)v17 + 24) != 0;
      if (!*((_BYTE *)v17 + 24))
      {
        __atxlog_handle_blending();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:].cold.2();

      }
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      __atxlog_handle_blending();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:].cold.3();

      v8 = 1;
    }
  }
  else
  {
    __atxlog_handle_blending();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXProactiveSuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)protoSuggestionsFromSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  char v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "proto");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            __atxlog_handle_default();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
              +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:].cold.1(&v13, v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)infoSuggestion
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;

  -[ATXProactiveSuggestion executableSpecification](self, "executableSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestion(ATXProactiveCardSuggestionClient) infoSuggestion].cold.1(v5);

    v4 = 0;
  }

  return v4;
}

- (NSString)appBundleIdentifier
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)widgetBundleIdentifier
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)criterion
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "criterion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)applicableLayouts
{
  void *v2;
  unint64_t v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layouts");

  return v3;
}

- (NSString)suggestionIdentifier
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (INIntent)intent
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INIntent *)v3;
}

- (NSDictionary)metadata
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestion infoSuggestion](self, "infoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (ATXProactiveSuggestion)initWithClientModelSpecification:(id)a3 executableSpecification:(id)a4 uiSpecification:(id)a5 scoreSpecification:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ATXProactiveSuggestion *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = -[ATXProactiveSuggestion initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:uuid:](self, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:uuid:", v13, v12, v11, v10, v14);

  return v15;
}

- (BOOL)isValidForSuggestionsWidget
{
  int64_t v3;

  v3 = -[ATXProactiveSuggestionExecutableSpecification executableType](self->_executableSpecification, "executableType");
  if (v3)
    LOBYTE(v3) = -[ATXProactiveSuggestionExecutableSpecification executableType](self->_executableSpecification, "executableType") != 3&& -[ATXProactiveSuggestionExecutableSpecification executableType](self->_executableSpecification, "executableType") != 4&& -[ATXProactiveSuggestionExecutableSpecification executableType](self->_executableSpecification, "executableType") != 11;
  return v3;
}

- (id)description
{
  id v3;
  ATXProactiveSuggestionClientModelSpecification *clientModelSpecification;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  clientModelSpecification = self->_clientModelSpecification;
  -[ATXProactiveSuggestionExecutableSpecification executableIdentifier](self->_executableSpecification, "executableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionExecutableSpecification executableDescription](self->_executableSpecification, "executableDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Client Model Spec: %@   Executable ID: %@   Executable Description: %@   UI Spec: %@   Score Spec: %@"), clientModelSpecification, v5, v6, self->_uiSpecification, self->_scoreSpecification);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXProactiveSuggestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestion *v10;

  v4 = +[ATXProactiveSuggestion allocWithZone:](ATXProactiveSuggestion, "allocWithZone:", a3);
  v5 = (void *)-[ATXProactiveSuggestionClientModelSpecification copy](self->_clientModelSpecification, "copy");
  v6 = (void *)-[ATXProactiveSuggestionExecutableSpecification copy](self->_executableSpecification, "copy");
  v7 = (void *)-[ATXProactiveSuggestionUISpecification copy](self->_uiSpecification, "copy");
  v8 = (void *)-[ATXProactiveSuggestionScoreSpecification copy](self->_scoreSpecification, "copy");
  v9 = (void *)-[NSUUID copy](self->_uuid, "copy");
  v10 = -[ATXProactiveSuggestion initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:uuid:](v4, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:uuid:", v5, v6, v7, v8, v9);

  return v10;
}

- (unint64_t)hash
{
  unint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  result = self->_hash;
  if (!result)
  {
    v4 = -[ATXProactiveSuggestionClientModelSpecification hash](self->_clientModelSpecification, "hash");
    v5 = -[ATXProactiveSuggestionExecutableSpecification hash](self->_executableSpecification, "hash") - v4 + 32 * v4;
    v6 = -[ATXProactiveSuggestionUISpecification hash](self->_uiSpecification, "hash") - v5 + 32 * v5;
    result = -[ATXProactiveSuggestionScoreSpecification hash](self->_scoreSpecification, "hash") - v6 + 32 * v6;
    self->_hash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestion *v4;
  ATXProactiveSuggestion *v5;
  ATXProactiveSuggestionClientModelSpecification *clientModelSpecification;
  ATXProactiveSuggestionClientModelSpecification *v7;
  ATXProactiveSuggestionClientModelSpecification *v8;
  ATXProactiveSuggestionClientModelSpecification *v9;
  BOOL v10;
  char v11;
  ATXProactiveSuggestionExecutableSpecification *executableSpecification;
  ATXProactiveSuggestionExecutableSpecification *v13;
  ATXProactiveSuggestionExecutableSpecification *v14;
  ATXProactiveSuggestionExecutableSpecification *v15;
  BOOL v16;
  ATXProactiveSuggestionUISpecification *uiSpecification;
  ATXProactiveSuggestionUISpecification *v18;
  ATXProactiveSuggestionUISpecification *v19;
  ATXProactiveSuggestionUISpecification *v20;
  BOOL v21;
  ATXProactiveSuggestionScoreSpecification *scoreSpecification;
  ATXProactiveSuggestionScoreSpecification *v23;
  ATXProactiveSuggestionScoreSpecification *v24;
  ATXProactiveSuggestionScoreSpecification *v25;
  BOOL v26;
  NSUUID *v27;
  NSUUID *v28;

  v4 = (ATXProactiveSuggestion *)a3;
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
      clientModelSpecification = self->_clientModelSpecification;
      v7 = v5->_clientModelSpecification;
      if (clientModelSpecification == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = clientModelSpecification;
        v10 = -[ATXProactiveSuggestionClientModelSpecification isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_19;
      }
      executableSpecification = self->_executableSpecification;
      v13 = v5->_executableSpecification;
      if (executableSpecification == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = executableSpecification;
        v16 = -[ATXProactiveSuggestionExecutableSpecification isEqual:](v15, "isEqual:", v14);

        if (!v16)
          goto LABEL_19;
      }
      uiSpecification = self->_uiSpecification;
      v18 = v5->_uiSpecification;
      if (uiSpecification == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = uiSpecification;
        v21 = -[ATXProactiveSuggestionUISpecification isEqual:](v20, "isEqual:", v19);

        if (!v21)
          goto LABEL_19;
      }
      scoreSpecification = self->_scoreSpecification;
      v23 = v5->_scoreSpecification;
      if (scoreSpecification == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = scoreSpecification;
        v26 = -[ATXProactiveSuggestionScoreSpecification isEqual:](v25, "isEqual:", v24);

        if (!v26)
        {
LABEL_19:
          v11 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      v27 = self->_uuid;
      v28 = v27;
      if (v27 == v5->_uuid)
        v11 = 1;
      else
        v11 = -[NSUUID isEqual:](v27, "isEqual:");

      goto LABEL_25;
    }
    v11 = 0;
  }
LABEL_26:

  return v11;
}

- (BOOL)fuzzyIsEqualToProactiveSuggestion:(id)a3
{
  ATXProactiveSuggestion *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (ATXProactiveSuggestion *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    -[ATXProactiveSuggestion clientModelSpecification](self, "clientModelSpecification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXProactiveSuggestion clientModelSpecification](v4, "clientModelSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fuzzyIsEqualToClientModelSpecification:", v6);

    if (!v7)
      goto LABEL_7;
    -[ATXProactiveSuggestion executableSpecification](self, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXProactiveSuggestion executableSpecification](v4, "executableSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fuzzyIsEqualToExecutableSpecification:", v9);

    if (!v10)
      goto LABEL_7;
    -[ATXProactiveSuggestion uiSpecification](self, "uiSpecification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXProactiveSuggestion uiSpecification](v4, "uiSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fuzzyIsEqualToUISpecification:", v12);

    if (v13)
    {
      -[ATXProactiveSuggestion scoreSpecification](self, "scoreSpecification");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXProactiveSuggestion scoreSpecification](v4, "scoreSpecification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "fuzzyIsEqualToScoreSpecification:", v15);

    }
    else
    {
LABEL_7:
      v16 = 0;
    }
  }

  return v16;
}

void __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == objc_msgSend(v9, "hash"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "fuzzyIsEqualToProactiveSuggestion:", v10);

    if ((v11 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
  __atxlog_handle_blending();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke_cold_1();

  __atxlog_handle_blending();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "uiSpecification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uiSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v15;
    v21 = 2112;
    v22 = v18;
    _os_log_debug_impl(&dword_1AA841000, v13, OS_LOG_TYPE_DEBUG, "Blending: New suggestion title: %@, Previous suggestion title: %@.", (uint8_t *)&v19, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a4 = 1;
LABEL_10:

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

- (id)jsonRawData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("uuid");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("clientModelSpecification");
  -[ATXProactiveSuggestionClientModelSpecification jsonRawData](self->_clientModelSpecification, "jsonRawData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("uiSpecification");
  -[ATXProactiveSuggestionUISpecification jsonRawData](self->_uiSpecification, "jsonRawData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("scoreSpecification");
  -[ATXProactiveSuggestionScoreSpecification jsonRawData](self->_scoreSpecification, "jsonRawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("executableSpecification");
  -[ATXProactiveSuggestionExecutableSpecification jsonRawData](self->_executableSpecification, "jsonRawData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ATXProactiveSuggestionClientModelSpecification)clientModelSpecification
{
  return self->_clientModelSpecification;
}

- (ATXProactiveSuggestionUISpecification)uiSpecification
{
  return self->_uiSpecification;
}

+ (void)suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "Blending: New suggestions and previous suggestions were both empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "Blending: New suggestions and previous suggestions were the same.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:.cold.3()
{
  NSObject *v0;
  void *v1;
  id v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_11();
  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = objc_msgSend(v2, "count");
  v5 = 2048;
  v6 = objc_msgSend(v1, "count");
  _os_log_debug_impl(&dword_1AA841000, v0, OS_LOG_TYPE_DEBUG, "Blending: New suggestions and previous suggestions have different counts. New %lu, Previous %lu.", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2_3();
}

void __87__ATXProactiveSuggestion_suggestionsHaveChangedFromPreviousSuggestions_newSuggestions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, v0, v1, "Blending: New suggestions and previous suggestions have at least one different suggestion.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because uuid was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because clientModelSpecification was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because executableSpecification was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because uiSpecification was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because scoreSpecification was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1AA841000, v0, v1, "Attempting to decode ATXProactiveSuggestion from proto failed because the recovered PBCodable didn't have a uuidString.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithProto:.cold.7()
{
  void *v0;
  objc_class *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA841000, v4, v5, "Unable to construct class %@ from ProtoBuf object. Protobuf object was of class: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_3();
}

- (void)proto
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "Proto uuidString not set for Proactive Suggestion with UUID: %@. Suggestion: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)suggestionsFromProtoSuggestions:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, v2, (uint64_t)v2, "Unable to construct class ATXProactiveSuggestion from ProtoBuf object. Unarchived suggestion from proto was nil.", v3);
}

+ (void)protoSuggestionsFromSuggestions:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, v2, (uint64_t)v2, "Unable to construct class ProtoBuf object from ATXProactiveSuggestion. Archived suggestion was nil.", v3);
}

@end

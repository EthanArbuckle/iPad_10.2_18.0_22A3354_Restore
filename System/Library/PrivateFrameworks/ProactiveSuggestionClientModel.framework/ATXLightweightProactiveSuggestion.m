@implementation ATXLightweightProactiveSuggestion

- (ATXLightweightProactiveSuggestion)initWithProactiveSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ATXLightweightProactiveSuggestion *v11;

  v4 = a3;
  objc_msgSend(v4, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "executableType");
  objc_msgSend(v4, "scoreSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATXLightweightProactiveSuggestion initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:](self, "initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:", v6, v8, v9, objc_msgSend(v10, "predictionReasons"));
  return v11;
}

- (ATXLightweightProactiveSuggestion)initWithExecutableIdentifier:(id)a3 executableType:(int64_t)a4 scoreSpecification:(id)a5 predictionReasons:(unint64_t)a6
{
  id v11;
  id v12;
  ATXLightweightProactiveSuggestion *v13;
  ATXLightweightProactiveSuggestion *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXLightweightProactiveSuggestion;
  v13 = -[ATXLightweightProactiveSuggestion init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_executableIdentifier, a3);
    v14->_executableType = a4;
    objc_storeStrong((id *)&v14->_scoreSpecification, a5);
    v14->_predictionReasons = a6;
  }

  return v14;
}

- (id)description
{
  void *v2;
  unint64_t executableType;
  NSString *executableIdentifier;
  __CFString *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  executableIdentifier = self->_executableIdentifier;
  executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), self->_executableType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E57CF958[executableType];
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@)"), executableIdentifier, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXLightweightProactiveSuggestion *v4;
  ATXLightweightProactiveSuggestion *v5;
  BOOL v6;

  v4 = (ATXLightweightProactiveSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXLightweightProactiveSuggestion isEqualToATXLightweightProactiveSuggestion:](self, "isEqualToATXLightweightProactiveSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXLightweightProactiveSuggestion:(id)a3
{
  id v4;
  _QWORD *v5;
  ATXProactiveSuggestionScoreSpecification *scoreSpecification;
  ATXProactiveSuggestionScoreSpecification *v7;
  ATXProactiveSuggestionScoreSpecification *v8;
  ATXProactiveSuggestionScoreSpecification *v9;
  BOOL v10;
  char v11;
  NSString *v13;
  NSString *v14;

  v4 = a3;
  v5 = v4;
  if (self->_executableType != *((_QWORD *)v4 + 3) || self->_predictionReasons != *((_QWORD *)v4 + 5))
    goto LABEL_5;
  scoreSpecification = self->_scoreSpecification;
  v7 = (ATXProactiveSuggestionScoreSpecification *)*((id *)v4 + 4);
  if (scoreSpecification == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = scoreSpecification;
    v10 = -[ATXProactiveSuggestionScoreSpecification isEqual:](v9, "isEqual:", v8);

    if (!v10)
    {
LABEL_5:
      v11 = 0;
      goto LABEL_6;
    }
  }
  v13 = self->_executableIdentifier;
  v14 = v13;
  if (v13 == (NSString *)v5[2])
    v11 = 1;
  else
    v11 = -[NSString isEqual:](v13, "isEqual:");

LABEL_6:
  return v11;
}

- (ATXLightweightProactiveSuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBLightweightProactiveSuggestion *v5;
  ATXLightweightProactiveSuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBLightweightProactiveSuggestion initWithData:]([ATXPBLightweightProactiveSuggestion alloc], "initWithData:", v4);

    self = -[ATXLightweightProactiveSuggestion initWithProto:](self, "initWithProto:", v5);
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

  -[ATXLightweightProactiveSuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXLightweightProactiveSuggestion)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  ATXProactiveSuggestionScoreSpecification *v10;
  ATXProactiveSuggestionScoreSpecification *v11;
  void *v12;
  NSObject *v13;
  ATXLightweightProactiveSuggestion *v14;
  void *v15;
  id v16;
  uint64_t v17;

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
      v14 = 0;
      goto LABEL_44;
    }
    v5 = v4;
    -[NSObject executableIdentifier](v5, "executableIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[NSObject executableType](v5, "executableType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = -[NSObject hasScoreSpecification](v5, "hasScoreSpecification");
        v10 = [ATXProactiveSuggestionScoreSpecification alloc];
        v11 = v10;
        if (v9)
        {
          -[NSObject scoreSpecification](v5, "scoreSpecification");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[ATXProactiveSuggestionScoreSpecification initWithProto:](v11, "initWithProto:", v12);

          if (!v13)
          {
            __atxlog_handle_blending();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[ATXLightweightProactiveSuggestion initWithProto:].cold.2(v5);
LABEL_15:
            v14 = 0;
LABEL_43:

LABEL_44:
            goto LABEL_45;
          }
        }
        else
        {
          v13 = -[ATXProactiveSuggestionScoreSpecification initWithRawScore:suggestedConfidenceCategory:](v10, "initWithRawScore:suggestedConfidenceCategory:", 0, 0.0);
        }
        -[NSObject executableIdentifier](v5, "executableIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject executableType](v5, "executableType");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
        {
          v17 = 0;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("App")) & 1) != 0)
        {
          v17 = 1;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Action")) & 1) != 0)
        {
          v17 = 2;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Widget")) & 1) != 0)
        {
          v17 = 3;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Tip")) & 1) != 0)
        {
          v17 = 4;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AppClip")) & 1) != 0)
        {
          v17 = 5;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Interaction")) & 1) != 0)
        {
          v17 = 6;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("ContextualAction")) & 1) != 0)
        {
          v17 = 7;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("SpotlightAction")) & 1) != 0)
        {
          v17 = 8;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("ShortcutsAction")) & 1) != 0)
        {
          v17 = 9;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("LinkAction")) & 1) != 0)
        {
          v17 = 10;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("Max")))
        {
          v17 = 11;
        }
        else
        {
          v17 = 0;
        }

        self = -[ATXLightweightProactiveSuggestion initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:](self, "initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:", v15, v17, v13, -[NSObject predictionReasons](v5, "predictionReasons"));
        v14 = self;
        goto LABEL_43;
      }
    }
    __atxlog_handle_blending();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXLightweightProactiveSuggestion initWithProto:].cold.1(v5);
    goto LABEL_15;
  }
  v14 = 0;
LABEL_45:

  return v14;
}

- (id)proto
{
  void *v3;
  unint64_t executableType;
  __CFString *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setExecutableIdentifier:", self->_executableIdentifier);
  executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), self->_executableType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E57CF958[executableType];
  }
  objc_msgSend(v3, "setExecutableType:", v5);

  -[ATXProactiveSuggestionScoreSpecification proto](self->_scoreSpecification, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScoreSpecification:", v6);

  objc_msgSend(v3, "setPredictionReasons:", self->_predictionReasons);
  return v3;
}

- (NSString)executableIdentifier
{
  return self->_executableIdentifier;
}

- (int64_t)executableType
{
  return self->_executableType;
}

- (ATXProactiveSuggestionScoreSpecification)scoreSpecification
{
  return self->_scoreSpecification;
}

- (unint64_t)predictionReasons
{
  return self->_predictionReasons;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(unsigned __int8)a3
{
  self->_consumerSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
}

+ (id)lightWeightSuggestionDescriptionsFromLightWeightSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "description", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)lightWeightSuggestionsFromProtoLightWeightSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ATXLightweightProactiveSuggestion *v10;
  NSObject *v11;
  uint8_t v13;
  _BYTE v14[15];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
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
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = -[ATXLightweightProactiveSuggestion initWithProto:]([ATXLightweightProactiveSuggestion alloc], "initWithProto:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        if (v10)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          __atxlog_handle_blending();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            +[ATXLightweightProactiveSuggestion(ArrayHelpers) lightWeightSuggestionsFromProtoLightWeightSuggestions:].cold.1(&v13, v14, v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)protoLightWeightSuggestionsFromLightWeightSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138412290;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "proto", v15, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          __atxlog_handle_blending();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v11;
            _os_log_fault_impl(&dword_1AA841000, v13, OS_LOG_TYPE_FAULT, "Unable to generate proto for ATXLightweightProactiveSuggestion: %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)lightWeightSuggestionsFromSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ATXLightweightProactiveSuggestion *v11;
  ATXLightweightProactiveSuggestion *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [ATXLightweightProactiveSuggestion alloc];
        v12 = -[ATXLightweightProactiveSuggestion initWithProactiveSuggestion:](v11, "initWithProactiveSuggestion:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)initWithProto:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "executableIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "executableType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1AA841000, v4, v5, "%s: Returning nil because proto is missing exeId and/or exeType. (exeID %@, type %@)", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_4();
}

- (void)initWithProto:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "executableIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "executableType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1AA841000, v4, v5, "%s: Returning nil because scoreSpecification initialization from proto returned nil. (exeId %@, type %@)", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_4();
}

@end

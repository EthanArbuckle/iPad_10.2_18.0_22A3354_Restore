@implementation ATXSpotlightUIEvent

- (ATXSpotlightUIEvent)initWithType:(int64_t)a3 suggestionUniqueId:(id)a4 suggestionType:(id)a5 suggestionSubtype:(id)a6 suggestionContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ATXSpotlightUIEvent *v16;
  ATXSpotlightUIEvent *v17;
  uint64_t v18;
  NSString *suggestionUniqueId;
  uint64_t v20;
  NSString *suggestionType;
  uint64_t v22;
  NSString *suggestionSubtype;
  uint64_t v24;
  NSString *suggestionContext;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)ATXSpotlightUIEvent;
  v16 = -[ATXSpotlightUIEvent init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_eventType = a3;
    v18 = objc_msgSend(v12, "copy");
    suggestionUniqueId = v17->_suggestionUniqueId;
    v17->_suggestionUniqueId = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    suggestionType = v17->_suggestionType;
    v17->_suggestionType = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    suggestionSubtype = v17->_suggestionSubtype;
    v17->_suggestionSubtype = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    suggestionContext = v17->_suggestionContext;
    v17->_suggestionContext = (NSString *)v24;

  }
  return v17;
}

+ (id)stringForATXSpotlightUIEventType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("Unknown");
  else
    return off_1E57CFB10[a3 - 1];
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXSpotlightUIEvent eventType](self, "eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("suggestionUniqueId");
  -[ATXSpotlightUIEvent suggestionUniqueId](self, "suggestionUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v5;
  v14[2] = CFSTR("suggestionType");
  -[ATXSpotlightUIEvent suggestionType](self, "suggestionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v7;
  v14[3] = CFSTR("suggestionSubtype");
  -[ATXSpotlightUIEvent suggestionSubtype](self, "suggestionSubtype");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v9;
  v14[4] = CFSTR("suggestionContext");
  -[ATXSpotlightUIEvent suggestionContext](self, "suggestionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)

  if (!v8)
  if (!v6)

  if (!v4)
  return v12;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXSpotlightUIEvent jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXSpotlightUIEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSpotlightUIEvent *v5;
  ATXSpotlightUIEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSpotlightUIEvent initWithData:]([ATXPBSpotlightUIEvent alloc], "initWithData:", v4);

    self = -[ATXSpotlightUIEvent initWithProto:](self, "initWithProto:", v5);
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

  -[ATXSpotlightUIEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXSpotlightUIEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXSpotlightUIEvent *v11;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "eventType");
    objc_msgSend(v5, "suggestionUniqueId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionSubtype");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[ATXSpotlightUIEvent initWithType:suggestionUniqueId:suggestionType:suggestionSubtype:suggestionContext:](self, "initWithType:suggestionUniqueId:suggestionType:suggestionSubtype:suggestionContext:", v6, v7, v8, v9, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[ATXSpotlightUIEvent suggestionUniqueId](self, "suggestionUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestionUniqueId:", v4);

  -[ATXSpotlightUIEvent suggestionType](self, "suggestionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestionType:", v5);

  -[ATXSpotlightUIEvent suggestionSubtype](self, "suggestionSubtype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestionSubtype:", v6);

  -[ATXSpotlightUIEvent suggestionContext](self, "suggestionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestionContext:", v7);

  objc_msgSend(v3, "setEventType:", (int)-[ATXSpotlightUIEvent eventType](self, "eventType"));
  return v3;
}

- (NSString)suggestionUniqueId
{
  return self->_suggestionUniqueId;
}

- (void)setSuggestionUniqueId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (void)setSuggestionSubtype:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)suggestionContext
{
  return self->_suggestionContext;
}

- (void)setSuggestionContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_suggestionSubtype, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_suggestionUniqueId, 0);
}

@end

@implementation ATXSpotlightSuggestionCollection

- (ATXSpotlightSuggestionCollection)initWithSuggestions:(id)a3 contextTitle:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXSpotlightSuggestionCollection *v11;
  uint64_t v12;
  NSArray *suggestions;
  uint64_t v14;
  NSString *contextTitle;
  uint64_t v16;
  NSString *sectionIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXSpotlightSuggestionCollection;
  v11 = -[ATXSpotlightSuggestionCollection init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    suggestions = v11->_suggestions;
    v11->_suggestions = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    contextTitle = v11->_contextTitle;
    v11->_contextTitle = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    sectionIdentifier = v11->_sectionIdentifier;
    v11->_sectionIdentifier = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  ATXSpotlightSuggestionCollection *v4;
  ATXSpotlightSuggestionCollection *v5;
  BOOL v6;

  v4 = (ATXSpotlightSuggestionCollection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSpotlightSuggestionCollection isEqualToATXSpotlightSuggestionCollection:](self, "isEqualToATXSpotlightSuggestionCollection:", v5);

  return v6;
}

- (BOOL)isEqualToATXSpotlightSuggestionCollection:(id)a3
{
  id *v4;
  NSString *contextTitle;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSArray *suggestions;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  char v15;
  NSString *v16;
  NSString *v17;

  v4 = (id *)a3;
  contextTitle = self->_contextTitle;
  v6 = (NSString *)v4[1];
  if (contextTitle == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = contextTitle;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  suggestions = self->_suggestions;
  v11 = (NSArray *)v4[3];
  if (suggestions == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = suggestions;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_13;
    }
  }
  v16 = self->_sectionIdentifier;
  v17 = v16;
  if (v16 == v4[2])
    v15 = 1;
  else
    v15 = -[NSString isEqual:](v16, "isEqual:");

LABEL_13:
  return v15;
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
  -[ATXSpotlightSuggestionCollection encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSpotlightSuggestionCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSpotlightSuggestionCollection *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSpotlightSuggestionCollection initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSpotlightSuggestionCollection proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXSpotlightSuggestionCollection)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXSpotlightSuggestionCollection *v10;
  NSObject *v11;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXLightweightClientModelCacheUpdate initWithProto:].cold.1((uint64_t)self, v11);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "contextTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[ATXSpotlightSuggestionCollection initWithSuggestions:contextTitle:sectionIdentifier:](self, "initWithSuggestions:contextTitle:sectionIdentifier:", v8, v6, v9);
  v10 = self;
LABEL_8:

  return v10;
}

ATXProactiveSuggestion *__50__ATXSpotlightSuggestionCollection_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXProactiveSuggestion *v3;
  ATXProactiveSuggestion *v4;
  NSObject *v5;

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
      __50__ATXSpotlightSuggestionCollection_initWithProto___block_invoke_cold_1(v5);

  }
  return v3;
}

- (ATXSpotlightSuggestionCollection)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSuggestionCollection *v5;
  ATXSpotlightSuggestionCollection *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSuggestionCollection initWithData:]([ATXPBSuggestionCollection alloc], "initWithData:", v4);

    self = -[ATXSpotlightSuggestionCollection initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setContextTitle:", self->_contextTitle);
  objc_msgSend(v3, "setSectionIdentifier:", self->_sectionIdentifier);
  +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:](ATXProactiveSuggestion, "protoSuggestionsFromSuggestions:", self->_suggestions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestions:", v4);

  return v3;
}

- (NSString)contextTitle
{
  return self->_contextTitle;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_contextTitle, 0);
}

void __50__ATXSpotlightSuggestionCollection_initWithProto___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "Attempting to decode ATXSpotlightSuggestionCollection from proto failed because the recovered PBCodable had an unrecoverable ATXProactiveSuggestion.", v1, 2u);
}

@end

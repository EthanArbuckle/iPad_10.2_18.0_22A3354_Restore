@implementation ATXSpotlightSuggestionLayout

- (ATXSpotlightSuggestionLayout)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSpotlightSuggestionLayout *v5;
  ATXSpotlightSuggestionLayout *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSpotlightSuggestionLayout initWithData:]([ATXPBSpotlightSuggestionLayout alloc], "initWithData:", v4);

    self = -[ATXSpotlightSuggestionLayout initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSpotlightSuggestionLayout)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  ATXSpotlightSuggestionLayout *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject collections](v5, "collections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (-[NSObject scoresCount](v5, "scoresCount"))
      {
        v9 = 0;
        do
        {
          -[NSObject scoresAtIndex:](v5, "scoresAtIndex:", v9);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v10);

          ++v9;
        }
        while (-[NSObject scoresCount](v5, "scoresCount") > v9);
      }
      if (+[ATXSpotlightSuggestionLayout isValidInputWithCollections:scores:](ATXSpotlightSuggestionLayout, "isValidInputWithCollections:scores:", v7, v8))
      {
        v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[NSObject uuidString](v5, "uuidString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
        self = -[ATXSpotlightSuggestionLayout initWithCollections:scores:uuid:](self, "initWithCollections:scores:uuid:", v7, v8, v13);

        v14 = self;
      }
      else
      {
        __atxlog_handle_blending();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[ATXSpotlightSuggestionLayout initWithProto:].cold.1(v15, v16, v17);

        v14 = 0;
      }

    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXLightweightClientModelCacheUpdate initWithProto:].cold.1((uint64_t)self, v5);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ATXSpotlightSuggestionLayout)initWithCollections:(id)a3 scores:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXSpotlightSuggestionLayout *v11;
  uint64_t v12;
  NSArray *collections;
  uint64_t v14;
  NSArray *scores;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXSpotlightSuggestionLayout;
  v11 = -[ATXSpotlightSuggestionLayout init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    collections = v11->_collections;
    v11->_collections = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    scores = v11->_scores;
    v11->_scores = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_uuid, a5);
  }

  return v11;
}

+ (BOOL)isValidInputWithCollections:(id)a3 scores:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "suggestions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v12, "count");

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v13 = v9 == objc_msgSend(v6, "count");

  return v13;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (ATXProactiveSuggestion)highestConfidenceSuggestion
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  NSArray *obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_collections;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  v3 = 0;
  v4 = 0;
  if (v23)
  {
    v5 = 0;
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "suggestions");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
        {
          v9 = v8;
          v24 = i;
          v10 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v25);
              v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              if (v5 + j >= -[NSArray count](self->_scores, "count"))
              {
                v5 += j;
                goto LABEL_19;
              }
              -[NSArray objectAtIndexedSubscript:](self->_scores, "objectAtIndexedSubscript:", v5 + j);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (!v4 || (objc_msgSend(v13, "doubleValue"), v16 = v15, objc_msgSend(v4, "doubleValue"), v16 > v17))
              {
                v18 = v14;

                v19 = v12;
                v3 = v19;
                v4 = v18;
              }

            }
            v9 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            v5 += j;
            if (v9)
              continue;
            break;
          }
LABEL_19:
          i = v24;
        }

      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }

  return (ATXProactiveSuggestion *)v3;
}

- (id)compactDescription
{
  return CFSTR("ATXSpotlightLayout");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXSpotlightSuggestionLayout initWithCollections:scores:uuid:](+[ATXSpotlightSuggestionLayout allocWithZone:](ATXSpotlightSuggestionLayout, "allocWithZone:", a3), "initWithCollections:scores:uuid:", self->_collections, self->_scores, self->_uuid);
}

- (BOOL)isEqual:(id)a3
{
  ATXSpotlightSuggestionLayout *v4;
  ATXSpotlightSuggestionLayout *v5;
  BOOL v6;

  v4 = (ATXSpotlightSuggestionLayout *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSpotlightSuggestionLayout isEqualToATXSpotlightSuggestionLayout:](self, "isEqualToATXSpotlightSuggestionLayout:", v5);

  return v6;
}

- (BOOL)isEqualToATXSpotlightSuggestionLayout:(id)a3
{
  id *v4;
  NSUUID *uuid;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSArray *collections;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  char v15;
  NSArray *v16;
  NSArray *v17;

  v4 = (id *)a3;
  uuid = self->_uuid;
  v6 = (NSUUID *)v4[1];
  if (uuid == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uuid;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  collections = self->_collections;
  v11 = (NSArray *)v4[2];
  if (collections == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = collections;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_13;
    }
  }
  v16 = self->_scores;
  v17 = v16;
  if (v16 == v4[3])
    v15 = 1;
  else
    v15 = -[NSArray isEqual:](v16, "isEqual:");

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
  -[ATXSpotlightSuggestionLayout encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSpotlightSuggestionLayout)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ATXSpotlightSuggestionLayout *v9;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("protobufData"), v5, 0, CFSTR("com.apple.proactive.ATXSpotlightSuggestionLayout"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ATXSpotlightSuggestionLayout initWithProtoData:](self, "initWithProtoData:", v8);
  return v9;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSpotlightSuggestionLayout proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

ATXSpotlightSuggestionCollection *__46__ATXSpotlightSuggestionLayout_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXSpotlightSuggestionCollection *v3;
  ATXSpotlightSuggestionCollection *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a2;
  v3 = -[ATXSpotlightSuggestionCollection initWithProto:]([ATXSpotlightSuggestionCollection alloc], "initWithProto:", v2);

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __46__ATXSpotlightSuggestionLayout_initWithProto___block_invoke_cold_1(v5, v6, v7);

  }
  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24;
  _BYTE v25[15];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuidString:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_collections, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_collections;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v10), "proto");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          __atxlog_handle_default();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            -[ATXSpotlightSuggestionLayout proto].cold.1(&v24, v25, v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setCollections:", v13);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_scores;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "doubleValue", (_QWORD)v20);
        objc_msgSend(v3, "addScores:");
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v16);
  }

  return v3;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)initWithProto:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a1, a3, "Attempting to decode ATXPBSpotlightSuggestionLayout from proto failed because the count of suggestions and scores should be the same", v3);
}

void __46__ATXSpotlightSuggestionLayout_initWithProto___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a1, a3, "Attempting to decode ATXPBSpotlightSuggestionLayout from proto failed because the recovered PBCodable had an unrecoverable ATXSpotlightSuggestionCollection.", v3);
}

- (void)proto
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1AA841000, a3, (uint64_t)a3, "Unable to construct class ProtoBuf object from ATXProactiveSuggestion. Archived suggestion was nil.", a1);
}

@end

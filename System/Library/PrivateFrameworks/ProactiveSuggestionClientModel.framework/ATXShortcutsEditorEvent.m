@implementation ATXShortcutsEditorEvent

- (ATXShortcutsEditorEvent)initWithDate:(id)a3 eventType:(unint64_t)a4 blendingCacheUUID:(id)a5 suggestionUUIDs:(id)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  ATXShortcutsEditorEvent *v15;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  v15 = -[ATXShortcutsEditorEvent initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:](self, "initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:", a4, v14, v13, v12);

  return v15;
}

- (ATXShortcutsEditorEvent)initWithAbsoluteDate:(double)a3 eventType:(unint64_t)a4 blendingCacheUUID:(id)a5 suggestionUUIDs:(id)a6 metadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  ATXShortcutsEditorEvent *v17;
  ATXShortcutsEditorEvent *v18;
  objc_super v20;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2 && (unint64_t)objc_msgSend(v14, "count") >= 2)
  {
    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ATXShortcutsEditorEvent initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:].cold.1((uint64_t)v14, a4, v16);

  }
  v20.receiver = self;
  v20.super_class = (Class)ATXShortcutsEditorEvent;
  v17 = -[ATXShortcutsEditorEvent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_absoluteDate = a3;
    v17->_eventType = a4;
    objc_storeStrong((id *)&v17->_blendingCacheUUID, a5);
    objc_storeStrong((id *)&v18->_suggestionUUIDs, a6);
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

- (NSDate)date
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteDate);
}

- (void)setDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  self->_absoluteDate = v4;
}

- (unsigned)consumerSubTypeForUIStream
{
  return 43;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  unint64_t eventType;

  eventType = self->_eventType;
  if (eventType > 5)
    return &unk_1E57EC6A0;
  else
    return (id)qword_1E57CE818[eventType];
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return self->_blendingCacheUUID;
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a4);
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  ATXShortcutsEditorSessionMetadata *v5;
  NSArray *suggestionUUIDs;
  void *v7;
  NSArray *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "updateConsumerSubTypeIfUnset:", 43);
  objc_msgSend(v20, "updateBlendingUICacheUpdateUUIDIfUnset:", self->_blendingCacheUUID);
  objc_msgSend(v20, "sessionMetadata");
  v5 = (ATXShortcutsEditorSessionMetadata *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[ATXShortcutsEditorSessionMetadata initWithNumStepsInShortcutAtStart:]([ATXShortcutsEditorSessionMetadata alloc], "initWithNumStepsInShortcutAtStart:", -[ATXShortcutsEditorEventMetadata numStepsInShortcut](self->_metadata, "numStepsInShortcut"));
    objc_msgSend(v20, "updateSessionMetadataIfUnset:", v5);
  }
  switch(self->_eventType)
  {
    case 1uLL:
      suggestionUUIDs = self->_suggestionUUIDs;
      v7 = v20;
      v8 = 0;
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(v20, "mutableRejectedUUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](self->_suggestionUUIDs, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if (v11)
      {
        objc_msgSend(v20, "mutableRejectedUUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray firstObject](self->_suggestionUUIDs, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v13);

      }
      v8 = self->_suggestionUUIDs;
      v7 = v20;
      suggestionUUIDs = 0;
LABEL_8:
      objc_msgSend(v7, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", v8, 0, suggestionUUIDs);
      break;
    case 3uLL:
      objc_msgSend(v20, "mutableEngagedUUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](self->_suggestionUUIDs, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsObject:", v15);

      if (v16)
      {
        objc_msgSend(v20, "mutableEngagedUUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray firstObject](self->_suggestionUUIDs, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObject:", v18);

      }
      objc_msgSend(v20, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", 0, self->_suggestionUUIDs, 0);
      objc_msgSend(v20, "sessionMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setIsLastSession:", 1);

      break;
    case 4uLL:
      -[ATXShortcutsEditorSessionMetadata setStepWasManuallyAdded:](v5, "setStepWasManuallyAdded:", 1);
      break;
    case 5uLL:
      objc_msgSend(v20, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", 0, 0, self->_suggestionUUIDs);
      -[ATXShortcutsEditorSessionMetadata setNumStepsInShortcutAtEnd:](v5, "setNumStepsInShortcutAtEnd:", -[ATXShortcutsEditorEventMetadata numStepsInShortcut](self->_metadata, "numStepsInShortcut"));
      -[ATXShortcutsEditorSessionMetadata setIsLastSession:](v5, "setIsLastSession:", 1);
      break;
    default:
      break;
  }

}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXShortcutsEditorEvent jsonDict](self, "jsonDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v4);

  return (NSString *)v5;
}

- (id)jsonDict
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  -[NSArray _pas_mappedArrayWithTransform:](self->_suggestionUUIDs, "_pas_mappedArrayWithTransform:", &__block_literal_global_1);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("date");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShortcutsEditorEvent date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = CFSTR("eventType");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), self->_eventType);
  v15[1] = v7;
  v14[2] = CFSTR("blendingCacheUUID");
  -[NSUUID UUIDString](self->_blendingCacheUUID, "UUIDString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("nil");
  if (v8)
    v11 = (const __CFString *)v8;
  else
    v11 = CFSTR("nil");
  v14[3] = CFSTR("suggestionUUIDs");
  if (v3)
    v10 = v3;
  v15[2] = v11;
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __35__ATXShortcutsEditorEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXShortcutsEditorEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  -[ATXShortcutsEditorEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXShortcutsEditorEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXShortcutsEditorEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXShortcutsEditorEvent initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
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

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXShortcutsEditorEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXShortcutsEditorEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  ATXShortcutsEditorEvent *v13;
  void *v14;
  void *v15;
  ATXShortcutsEditorEventMetadata *v16;
  void *v17;
  ATXShortcutsEditorEventMetadata *v18;

  v4 = a3;
  if (!v4)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXShortcutsEditorEvent initWithProto:].cold.1((uint64_t)self, v12);

    goto LABEL_10;
  }
  v5 = v4;
  if (objc_msgSend(v5, "hasDate")
    && (objc_msgSend(v5, "date"), v7 = v6, objc_msgSend(v5, "hasEventType")))
  {
    v8 = objc_msgSend(v5, "eventType");
    if (objc_msgSend(v5, "hasBlendingCacheId"))
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v5, "blendingCacheId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v5, "suggestionUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = [ATXShortcutsEditorEventMetadata alloc];
    objc_msgSend(v5, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[ATXShortcutsEditorEventMetadata initWithProto:](v16, "initWithProto:", v17);

    self = -[ATXShortcutsEditorEvent initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:](self, "initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:", v8, v11, v15, v18, v7);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

LABEL_15:
  return v13;
}

id __41__ATXShortcutsEditorEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (ATXShortcutsEditorEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBShortcutsEditorEvent *v5;
  ATXShortcutsEditorEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBShortcutsEditorEvent initWithData:]([ATXPBShortcutsEditorEvent alloc], "initWithData:", v4);

    self = -[ATXShortcutsEditorEvent initWithProto:](self, "initWithProto:", v5);
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
  NSUUID *blendingCacheUUID;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDate:", self->_absoluteDate);
  objc_msgSend(v3, "setEventType:", self->_eventType);
  blendingCacheUUID = self->_blendingCacheUUID;
  if (blendingCacheUUID)
  {
    -[NSUUID UUIDString](blendingCacheUUID, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBlendingCacheId:", v5);

  }
  if (self->_suggestionUUIDs)
  {
    v6 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_suggestionUUIDs;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "UUIDString", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setSuggestionUUIDs:", v6);
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  v4 = -[NSUUID hash](self->_blendingCacheUUID, "hash") - v3 + 32 * v3;
  return -[NSArray hash](self->_suggestionUUIDs, "hash") - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXShortcutsEditorEvent *v4;
  ATXShortcutsEditorEvent *v5;
  BOOL v6;

  v4 = (ATXShortcutsEditorEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXShortcutsEditorEvent isEqualToATXShortcutsEditorEvent:](self, "isEqualToATXShortcutsEditorEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXShortcutsEditorEvent:(id)a3
{
  id v4;
  _QWORD *v5;
  double v6;
  NSUUID *blendingCacheUUID;
  NSUUID *v8;
  NSUUID *v9;
  NSUUID *v10;
  char v11;
  char v12;
  NSArray *v14;
  NSArray *v15;

  v4 = a3;
  v5 = v4;
  v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 2.22044605e-16 || self->_eventType != *((_QWORD *)v4 + 3))
    goto LABEL_7;
  blendingCacheUUID = self->_blendingCacheUUID;
  v8 = (NSUUID *)*((id *)v4 + 4);
  if (blendingCacheUUID == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = blendingCacheUUID;
    v11 = -[NSUUID isEqual:](v10, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
LABEL_7:
      v12 = 0;
      goto LABEL_8;
    }
  }
  v14 = self->_suggestionUUIDs;
  v15 = v14;
  if (v14 == (NSArray *)v5[5])
    v12 = 1;
  else
    v12 = -[NSArray isEqual:](v14, "isEqual:");

LABEL_8:
  return v12;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSUUID)blendingCacheUUID
{
  return self->_blendingCacheUUID;
}

- (void)setBlendingCacheUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blendingCacheUUID, a3);
}

- (NSArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void)setSuggestionUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionUUIDs, a3);
}

- (ATXShortcutsEditorEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_suggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_blendingCacheUUID, 0);
}

- (void)initWithAbsoluteDate:(os_log_t)log eventType:blendingCacheUUID:suggestionUUIDs:metadata:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "Encountered more than 1 suggestionUUID for event type %lu. Expected 1, received: %@", (uint8_t *)&v3, 0x16u);
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
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBShortcutsEditorEvent proto", (uint8_t *)&v5, 0xCu);

}

@end

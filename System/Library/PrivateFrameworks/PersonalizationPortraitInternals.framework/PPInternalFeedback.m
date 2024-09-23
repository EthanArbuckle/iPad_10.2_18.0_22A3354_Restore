@implementation PPInternalFeedback

- (PPInternalFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  PPInternalFeedback *v21;

  v12 = (void *)MEMORY[0x1E0D70D00];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "osBuild");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = CFSTR("unknown-build");
  if (v18)
    v20 = (const __CFString *)v18;
  v21 = -[PPInternalFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:](self, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:", v17, v16, v15, v14, v13, 0, v20);

  return v21;
}

- (PPInternalFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7 storeType:(unsigned __int8)a8 build:(id)a9
{
  id v16;
  PPInternalFeedback *v17;
  PPInternalFeedback *v18;
  objc_super v20;

  v16 = a9;
  v20.receiver = self;
  v20.super_class = (Class)PPInternalFeedback;
  v17 = -[PPBaseFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:](&v20, sel_initWithFeedbackItems_timestamp_clientIdentifier_clientBundleId_mappingId_, a3, a4, a5, a6, a7);
  v18 = v17;
  if (v17)
  {
    v17->_storeType = a8;
    objc_storeStrong((id *)&v17->_build, a9);
  }

  return v18;
}

- (unsigned)dataVersion
{
  return 1;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PPInternalFeedback *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = self;
  -[PPBaseFeedback feedbackItems](self, "feedbackItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v10, "itemString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setItemString:", v12);

        objc_msgSend(v11, "setFeedbackType:", objc_msgSend(v10, "itemFeedbackType"));
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setFeedbackItems:", v4);
  -[PPBaseFeedback timestamp](v20, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v3, "setSecondsFrom1970:");

  -[PPBaseFeedback clientIdentifier](v20, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentifier:", v14);

  -[PPBaseFeedback clientBundleId](v20, "clientBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientBundleIdentifier:", v15);

  -[PPBaseFeedback mappingId](v20, "mappingId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMappingId:", v16);

  objc_msgSend(v3, "setStoreType:", -[PPInternalFeedback storeType](v20, "storeType"));
  -[PPInternalFeedback build](v20, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBuild:", v17);

  objc_msgSend(v3, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)json
{
  PPStorableFeedback *v3;
  void *v4;
  PPStorableFeedback *v5;
  void *v6;
  void *v7;

  v3 = [PPStorableFeedback alloc];
  -[PPInternalFeedback serialize](self, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPStorableFeedback initWithData:](v3, "initWithData:", v4);
  -[PPStorableFeedback dictionaryRepresentation](v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  _BOOL4 v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    v13.receiver = self;
    v13.super_class = (Class)PPInternalFeedback;
    if (-[PPBaseFeedback isEqual:](&v13, sel_isEqual_, v5))
    {
      v6 = self->_build;
      v7 = (unint64_t)v5[7];
      if (!(v6 | v7))
      {
LABEL_12:
        v10 = self->_storeType == *((unsigned __int8 *)v5 + 48);
LABEL_14:

        goto LABEL_15;
      }
      v8 = (void *)v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
      {

      }
      else
      {
        v11 = objc_msgSend((id)v6, "isEqualToString:", v7);

        if (v11)
          goto LABEL_12;
      }
    }
    v10 = 0;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPInternalFeedback;
  return -[PPBaseFeedback hash](&v3, sel_hash);
}

- (unsigned)storeType
{
  return self->_storeType;
}

- (void)setStoreType:(unsigned __int8)a3
{
  self->_storeType = a3;
}

- (NSString)build
{
  return self->_build;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_build, 0);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  PPStorableFeedback *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  PPInternalFeedback *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  PPInternalFeedback *v24;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 == 1)
  {
    v27 = v5;
    v6 = -[PPStorableFeedback initWithData:]([PPStorableFeedback alloc], "initWithData:", v5);
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[PPStorableFeedback secondsFrom1970](v6, "secondsFrom1970");
    v26 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");
    v8 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[PPStorableFeedback feedbackItems](v6, "feedbackItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
          v15 = objc_alloc(MEMORY[0x1E0D70B60]);
          objc_msgSend(v14, "itemString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithItemString:itemFeedbackType:", v16, objc_msgSend(v14, "feedbackType"));
          objc_msgSend(v8, "addObject:", v17);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    v18 = [PPInternalFeedback alloc];
    -[PPStorableFeedback clientIdentifier](v6, "clientIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPStorableFeedback clientBundleIdentifier](v6, "clientBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPStorableFeedback mappingId](v6, "mappingId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PPStorableFeedback storeType](v6, "storeType");
    -[PPStorableFeedback build](v6, "build");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PPInternalFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:](v18, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:", v8, v26, v19, v20, v21, v22, v23);

    v5 = v27;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)fromBaseFeedback:(id)a3 storeType:(unsigned __int8)a4
{
  uint64_t v4;
  id v5;
  PPInternalFeedback *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  PPInternalFeedback *v15;

  v4 = a4;
  v5 = a3;
  v6 = [PPInternalFeedback alloc];
  objc_msgSend(v5, "feedbackItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mappingId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D70D00], "osBuild");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("unknown-build");
  if (v12)
    v14 = (const __CFString *)v12;
  v15 = -[PPInternalFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:](v6, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:", v7, v8, v9, v10, v11, v4, v14);

  return v15;
}

@end

@implementation UPQuery

- (UPQuery)initWithUtterance:(id)a3 tokens:(id)a4 embeddingsByToken:(id)a5 spans:(id)a6 dialogAct:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UPQuery *v17;
  uint64_t v18;
  NSUUID *uuid;
  uint64_t v20;
  NSString *utterance;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)UPQuery;
  v17 = -[UPQuery init](&v23, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    uuid = v17->_uuid;
    v17->_uuid = (NSUUID *)v18;

    v20 = objc_msgSend(v12, "copy");
    utterance = v17->_utterance;
    v17->_utterance = (NSString *)v20;

    objc_storeStrong((id *)&v17->_tokens, a4);
    objc_storeStrong((id *)&v17->_embeddingsByToken, a5);
    objc_storeStrong((id *)&v17->_dialogAct, a7);
    objc_storeStrong((id *)&v17->_spans, a6);
  }

  return v17;
}

- (UPQuery)initWithProtobufQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  UPQuery *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "hasTokenChain") & 1) != 0)
  {
    objc_msgSend(v6, "tokenChain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UPQuery _getNonWhitespaceTokenIndexes:](self, "_getNonWhitespaceTokenIndexes:", v7);
    v27 = objc_claimAutoreleasedReturnValue();
    -[UPQuery _buildTokenListWithTokenChain:nonWhitespaceTokenIndexes:](self, "_buildTokenListWithTokenChain:nonWhitespaceTokenIndexes:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v7, "tokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v11);
    }

    if ((objc_msgSend(v6, "hasEmbeddings") & 1) != 0)
    {
      objc_msgSend(v6, "embeddings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v16 = (void *)v27;
      -[UPQuery _buildEmbeddingsDictionaryWithNonWhitespaceTokens:nonWhitespaceTokenIndexes:embeddings:error:](self, "_buildEmbeddingsDictionaryWithNonWhitespaceTokens:nonWhitespaceTokenIndexes:embeddings:error:", v28, v27, v15, &v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v30;

      if (v17)
      {
        v29 = 0;
        -[UPQuery buildSpansListWithProtobufQuery:nonWhitespaceTokenIndexes:error:](self, "buildSpansListWithProtobufQuery:nonWhitespaceTokenIndexes:error:", v6, v27, &v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v29;
        v26 = v20;
        if (v19)
        {
          -[UPQuery _createDialogActWithProtobufQuery:](self, "_createDialogActWithProtobufQuery:", v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[UPQuery initWithUtterance:tokens:embeddingsByToken:spans:dialogAct:](self, "initWithUtterance:tokens:embeddingsByToken:spans:dialogAct:", v8, v28, v17, v19, v21);

          v22 = self;
        }
        else
        {
          v22 = 0;
          if (v20)
            *a4 = objc_retainAutorelease(v20);
        }

      }
      else
      {
        v22 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v18);
      }

    }
    else
    {
      v16 = (void *)v27;
      if (!a4)
      {
        v22 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = CFSTR("Request has no embeddings");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 10, v18);
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_27;
  }
  if (a4)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("Request has no token chain");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 10, v7);
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  v22 = 0;
LABEL_29:

  return v22;
}

- (id)_getNonWhitespaceTokenIndexes:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "tokensCount");
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v3, "tokensAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isWhitespace") & 1) == 0)
        objc_msgSend(v5, "addIndex:", i);

    }
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v5);

  return v8;
}

- (id)_buildTokenListWithTokenChain:(id)a3 nonWhitespaceTokenIndexes:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __67__UPQuery__buildTokenListWithTokenChain_nonWhitespaceTokenIndexes___block_invoke;
  v13 = &unk_1E7BED678;
  v7 = v5;
  v14 = v7;
  v15 = &v16;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", &v10);
  v8 = (void *)objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)_buildEmbeddingsDictionaryWithNonWhitespaceTokens:(id)a3 nonWhitespaceTokenIndexes:(id)a4 embeddings:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[3];
  int v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v9, "count");
  if (v12 == objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v36 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v30 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __104__UPQuery__buildEmbeddingsDictionaryWithNonWhitespaceTokens_nonWhitespaceTokenIndexes_embeddings_error___block_invoke;
    v18[3] = &unk_1E7BED6A0;
    v19 = v9;
    v22 = v35;
    v20 = v11;
    v23 = &v25;
    v24 = &v31;
    v14 = v13;
    v21 = v14;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v18);
    if (*((_BYTE *)v32 + 24))
    {
      v15 = 0;
      if (a6)
        *a6 = objc_retainAutorelease((id)v26[5]);
    }
    else
    {
      v15 = v14;
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v35, 8);
    goto LABEL_10;
  }
  if (a6)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = CFSTR("Count of nonWhitespaceTokens does not match nonWhitespaceTokenIndexes");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 10, v14);
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)buildSpansListWithProtobufQuery:(id)a3 nonWhitespaceTokenIndexes:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  UPSpan *v11;
  void *v12;
  UPSpan *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "matchingSpansCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "matchingSpansCount"))
  {
    v10 = 0;
    while (1)
    {
      v11 = [UPSpan alloc];
      objc_msgSend(v7, "matchingSpansAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v13 = -[UPSpan initWithProtobufSpan:nonWhitespaceTokenIndexes:error:](v11, "initWithProtobufSpan:nonWhitespaceTokenIndexes:error:", v12, v8, &v19);
      v14 = v19;

      if (!v13)
        break;
      objc_msgSend(v9, "addObject:", v13);

      if (objc_msgSend(v7, "matchingSpansCount") <= (unint64_t)++v10)
        goto LABEL_5;
    }
    SNLPOSLoggerForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_1C2196000, v16, OS_LOG_TYPE_ERROR, "Hit error when converting protobuf span to UPSpan: %@", buf, 0xCu);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v14);

    v15 = 0;
  }
  else
  {
LABEL_5:
    v15 = v9;
  }

  return v15;
}

- (id)_createDialogActWithProtobufQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v24[16];

  v3 = a3;
  if (!objc_msgSend(v3, "hasTurnInput"))
    goto LABEL_12;
  objc_msgSend(v3, "turnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasTurnContext") & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v3, "turnInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasNlContext") & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(v3, "turnInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "turnContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nlContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemDialogActs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "turnInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "turnContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nlContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "systemDialogActsCount");

  if (v15 >= 2)
  {
    SNLPOSLoggerForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1C2196000, v16, OS_LOG_TYPE_ERROR, "Multiple SystemDialogActs specified in context but UaaP can only handle one - using the first one", v24, 2u);
    }

  }
  objc_msgSend(v3, "turnInput");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "turnContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nlContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "systemDialogActs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D9FAE0], "convertSystemDialogAct:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v22;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UPQuery tokens](self, "tokens");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v25)
  {
    v22 = *(_QWORD *)v27;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v3);
        objc_msgSend((id)objc_opt_class(), "tokenDescription:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v5);
        -[UPQuery embeddingsByToken](self, "embeddingsByToken");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        NSStringFromSelector(sel_description);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@]"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ => %@"), v5, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v13);

        ++v3;
      }
      while (v25 != v3);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v25);
  }

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[UPQuery utterance](self, "utterance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPQuery spans](self, "spans");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("{UPQuery\n  utterance: %@\n  tokens: %@\n  embeddingsByToken:\n%@\n  spans:\n%@\n}"), v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)utterance
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)embeddingsByToken
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)spans
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (SIRINLUSystemDialogAct)dialogAct
{
  return (SIRINLUSystemDialogAct *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogAct, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_embeddingsByToken, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __104__UPQuery__buildEmbeddingsDictionaryWithNonWhitespaceTokens_nonWhitespaceTokenIndexes_embeddings_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  UPEmbedding *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UPEmbedding *v10;
  void *v11;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [UPEmbedding alloc];
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v9 + 40);
  v10 = -[UPEmbedding initWithProtobufEmbeddings:forTokenAt:error:](v6, "initWithProtobufEmbeddings:forTokenAt:error:", v7, v8, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v5);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __67__UPQuery__buildTokenListWithTokenChain_nonWhitespaceTokenIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tokensAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

+ (id)tokenDescription:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "hasBegin"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v3, "begin"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("(missing)");
  }
  if (objc_msgSend(v3, "hasEnd"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v3, "end"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("(missing)");
  }
  if (objc_msgSend(v3, "hasValue"))
  {
    objc_msgSend(v3, "value");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("(missing)");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{Token begin=%@, end=%@, value='%@'}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

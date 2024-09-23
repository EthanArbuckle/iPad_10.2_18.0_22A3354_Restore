@implementation VIACacheHitContext

- (VIACacheHitContext)initWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 applicationIdentifier:(id)a5 engagementSuggestionType:(id)a6
{
  id v10;
  id v11;
  VIACacheHitContext *v12;
  VIACacheHitContext *v13;
  uint64_t v14;
  NSString *applicationIdentifier;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VIACacheHitContext;
  v12 = -[VIACacheHitContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_queryID = a3;
    v12->_cachedResultQueryID = a4;
    v14 = objc_msgSend(v10, "copy");
    applicationIdentifier = v13->_applicationIdentifier;
    v13->_applicationIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_engagementSuggestionType, a6);
  }

  return v13;
}

+ (VIACacheHitContext)contextWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  VIACacheHitContextQueryIDMapper *v6;
  VIACacheHitContextCachedResultQueryIDMapper *v7;
  VIACacheHitContextApplicationIdentifierMapper *v8;
  VIACacheHitContextEngagementSuggestionTypeMapper *v9;
  void *v10;
  VIACacheHitContextBuilder *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[4];
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  VIACacheHitContextEngagementSuggestionTypeMapper *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45[0] = CFSTR("com.apple.argos.cache_hit_context_key.query_id");
  v6 = objc_alloc_init(VIACacheHitContextQueryIDMapper);
  v46 = (const __CFString *)v6;
  v45[1] = CFSTR("com.apple.argos.cache_hit_context_key.cached_result_query_id");
  v7 = objc_alloc_init(VIACacheHitContextCachedResultQueryIDMapper);
  v47 = (const __CFString *)v7;
  v45[2] = CFSTR("com.apple.argos.cache_hit_context_key.application_id");
  v8 = objc_alloc_init(VIACacheHitContextApplicationIdentifierMapper);
  v48 = (const __CFString *)v8;
  v45[3] = CFSTR("com.apple.argos.cache_hit_context_key.engagement_suggestion_type");
  v9 = objc_alloc_init(VIACacheHitContextEngagementSuggestionTypeMapper);
  v49 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, v45, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(VIACacheHitContextBuilder);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = (void *)MEMORY[0x1E0C99E60];
  v46 = CFSTR("com.apple.argos.cache_hit_context_key.query_id");
  v47 = CFSTR("com.apple.argos.cache_hit_context_key.cached_result_query_id");
  v48 = CFSTR("com.apple.argos.cache_hit_context_key.application_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          if (a4)
          {
            VIACacheHitContextMapperMissingValueError(v19);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_27:

          v29 = 0;
          goto LABEL_28;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v16);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = v5;
  v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (!v21)
    goto LABEL_18;
  v22 = v21;
  v23 = *(_QWORD *)v34;
  while (2)
  {
    for (j = 0; j != v22; ++j)
    {
      if (*(_QWORD *)v34 != v23)
        objc_enumerationMutation(v14);
      v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
      objc_msgSend(v10, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        if (!a4)
          goto LABEL_27;
        v41 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized key: %@"), v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.argos.cache_hit_context.error_domain"), 1, v28);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateBuilder:withDictionary:", v11, v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        if (!a4)
        {
LABEL_26:

          goto LABEL_27;
        }
        v31 = objc_retainAutorelease(v28);
LABEL_25:
        *a4 = v31;
        goto LABEL_26;
      }
    }
    v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v22)
      continue;
    break;
  }
LABEL_18:

  -[VIACacheHitContextBuilder build](v11, "build");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return (VIACacheHitContext *)v29;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (unint64_t)cachedResultQueryID
{
  return self->_cachedResultQueryID;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end

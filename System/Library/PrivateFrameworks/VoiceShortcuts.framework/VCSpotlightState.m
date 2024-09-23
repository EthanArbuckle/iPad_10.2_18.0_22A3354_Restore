@implementation VCSpotlightState

- (VCSpotlightState)initWithIdentifier:(unint64_t)a3 syncedShortcuts:(id)a4
{
  id v6;
  VCSpotlightState *v7;
  VCSpotlightState *v8;
  uint64_t v9;
  NSDictionary *syncedShortcuts;
  VCSpotlightState *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VCSpotlightState;
  v7 = -[VCSpotlightState init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_identifier = a3;
    v9 = objc_msgSend(v6, "copy");
    syncedShortcuts = v8->_syncedShortcuts;
    v8->_syncedShortcuts = (NSDictionary *)v9;

    v11 = v8;
  }

  return v8;
}

- (VCSpotlightState)initWithPath:(id)a3
{
  id v4;
  VCSpotlightState *v5;
  VCSpotlightState *v6;
  uint64_t v7;
  NSDictionary *syncedShortcuts;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *v26;
  VCSpotlightState *v27;
  VCSpotlightState *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VCSpotlightState;
  v5 = -[VCSpotlightState init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_identifier = 0;
    v7 = objc_opt_new();
    syncedShortcuts = v6->_syncedShortcuts;
    v6->_syncedShortcuts = (NSDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v4);

    if ((v10 & 1) != 0)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithContentsOfURL:", v12);

      v31 = (void *)v13;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v13);
      v15 = (void *)objc_opt_new();
      v30 = (void *)v14;
      objc_msgSend(v15, "readFrom:", v14);
      v16 = (void *)objc_opt_new();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v15, "pairs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "spotlightHash"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "workflowID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v23, v24);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v19);
      }

      v6->_identifier = objc_msgSend(v15, "identifier");
      v25 = objc_msgSend(v16, "copy");
      v26 = v6->_syncedShortcuts;
      v6->_syncedShortcuts = (NSDictionary *)v25;

      v27 = v6;
    }
    else
    {
      v28 = v6;
    }
  }

  return v6;
}

- (BOOL)isConsistentWithClientState:(unint64_t)a3
{
  return -[VCSpotlightState identifier](self, "identifier") == a3;
}

- (BOOL)saveToPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setIdentifier:", self->_identifier);
  -[VCSpotlightState syncedShortcuts](self, "syncedShortcuts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __37__VCSpotlightState_saveToPath_error___block_invoke;
  v14[3] = &unk_1E7AA6BF0;
  v14[4] = self;
  objc_msgSend(v9, "if_map:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v7, "setPairs:", v11);

  objc_msgSend(v7, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v12, "writeToFile:atomically:error:", v6, 1, a4);

  return (char)a4;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSDictionary)syncedShortcuts
{
  return self->_syncedShortcuts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedShortcuts, 0);
}

VCPBSpotlightPair *__37__VCSpotlightState_saveToPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VCPBSpotlightPair *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = objc_alloc_init(VCPBSpotlightPair);
  -[VCPBSpotlightPair setWorkflowID:](v4, "setWorkflowID:", v3);
  objc_msgSend(*(id *)(a1 + 32), "syncedShortcuts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCPBSpotlightPair setSpotlightHash:](v4, "setSpotlightHash:", objc_msgSend(v6, "unsignedLongLongValue"));
  return v4;
}

@end

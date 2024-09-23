@implementation SSAppIntent

- (id)consumerLabel
{
  if (consumerLabel_onceToken_2 != -1)
    dispatch_once(&consumerLabel_onceToken_2, &__block_literal_global_29);
  return (id)consumerLabel_label_2;
}

void __28__SSAppIntent_consumerLabel__block_invoke()
{
  void *v0;

  v0 = (void *)consumerLabel_label_2;
  consumerLabel_label_2 = (uint64_t)CFSTR("SSAppIntent");

}

- (id)stream
{
  void *v2;
  void *v3;
  void *v4;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "App");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_54_3);
  return (id)sharedInstance_sharedInstance_2;
}

void __29__SSAppIntent_sharedInstance__block_invoke()
{
  SSAppIntent *v0;
  void *v1;

  v0 = objc_alloc_init(SSAppIntent);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (SSAppIntent)init
{
  SSAppIntent *v2;
  SSAppIntent *v3;
  SSAppIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSAppIntent;
  v2 = -[SSBaseConsumer init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)filterEvent:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "intentClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isEqualToString:", v7);

    }
  }

  return v5 ^ 1;
}

- (void)handleEvent:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __CFString **v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "bundleID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_21;
    v7 = (void *)v6;
    objc_msgSend(v5, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9 || -[SSAppIntent filterEvent:](self, "filterEvent:", v5))
      goto LABEL_21;
    -[SSAppIntent _getInteraction:](self, "_getInteraction:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAppIntent _extractIdentifiersForIndex:interaction:](self, "_extractIdentifiersForIndex:interaction:", v5, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SSRedactString(v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      SSGeneralLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[SSBaseConsumer identifier](self, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v16;
        v23 = 2112;
        v24 = v14;
        v25 = 2112;
        v26 = objc_opt_class();
        _os_log_impl(&dword_1B86C5000, v15, OS_LOG_TYPE_DEFAULT, "%@: processing event for bundle %@ with intent: %@", (uint8_t *)&v21, 0x20u);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = SSShortcutsBundleIdentifier;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = 0;
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
      }
      v17 = SSContactsBundleIdentifier;
    }
    v18 = *v17;
    v19 = v18;
    if (v18 && -[__CFString length](v18, "length"))
    {
      -[SSAppIntent _itemUpdatesForEvent:itemIdentifiers:bundleToUpdate:](self, "_itemUpdatesForEvent:itemIdentifiers:bundleToUpdate:", v5, v12, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
        -[SSBaseConsumer indexItems:protectionClass:bundleID:](self, "indexItems:protectionClass:bundleID:", v20, CFSTR("Priority"), v19);

    }
    goto LABEL_20;
  }
LABEL_22:

}

- (id)_attributesUpdatesForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = CFSTR("_kMDItemLastOutOfSpotlightEngagementDate");
    objc_msgSend(v3, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v9[1] = *MEMORY[0x1E0CA6450];
    objc_msgSend(v3, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

- (id)_itemUpdatesForEvent:(id)a3 itemIdentifiers:(id)a4 bundleToUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
        -[SSAppIntent _attributesUpdatesForEvent:](self, "_attributesUpdatesForEvent:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "count"))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
          objc_msgSend(v19, "setUniqueIdentifier:", v16);
          objc_msgSend(v19, "setBundleID:", v10);
          objc_msgSend(v19, "setIsUpdate:", 1);
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithAttributes:", v18);
          objc_msgSend(v19, "setAttributeSet:", v20);

          objc_msgSend(v22, "addObject:", v19);
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  return v22;
}

- (id)_getInteraction:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v5, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v6, v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v8)
  {
    v10 = v8;
  }
  else if (v9)
  {
    SSGeneralLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SSAppIntent _getInteraction:].cold.1(self, v9, v11);

  }
  return v8;
}

- (id)_extractIdentifiersForIndex:(id)a3 interaction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "groupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_msgSend(v5, "groupIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);
LABEL_4:

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_31;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v8, "contacts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v33 != v17)
              objc_enumerationMutation(v11);
            v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v19, "contactIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v19, "contactIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v21);

            }
          }
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v16);
      }
      goto LABEL_4;
    }
    v12 = v8;
    v31 = v12;
    if (objc_msgSend(v6, "direction") == 2)
    {
      objc_msgSend(v12, "sender");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v12, "sender");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(v12, "recipients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = v13;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v27, "contactIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v27, "contactIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v29);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v24);
    }

  }
LABEL_31:

  return v7;
}

- (void)_getInteraction:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1B86C5000, a3, OS_LOG_TYPE_ERROR, "%@ : Error decoding interaction data: %@", (uint8_t *)&v7, 0x16u);

}

@end

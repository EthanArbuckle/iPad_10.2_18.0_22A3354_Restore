@implementation SPKeyReconciler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIndices, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

- (id)reconcileKey:(id)a3 matchedIndex:(unsigned int *)a4 sequence:(unsigned __int8 *)a5 error:(unsigned __int8 *)a6
{
  id v10;
  void *v11;
  unsigned __int8 v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t *v19;
  id v20;
  unsigned int *v22;
  unsigned __int8 *v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((unint64_t)objc_msgSend(v10, "length") >= 6 && (unint64_t)objc_msgSend(v10, "length") < 0x1D)
  {
    v22 = a4;
    v23 = a5;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = self->_keyIndices;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v24 = 0;
          v19 = (uint64_t *)objc_msgSend(v18, "mapHandle");
          v20 = objc_retainAutorelease(v10);
          if (sp_key_index_map_contains_key_prefix(v19, (unsigned __int16 *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"), &v24))
          {
            if (v22)
              *v22 = v24;
            if (v23)
              *v23 = objc_msgSend(v18, "sequence");
            if (a6)
              *a6 = 0;
            objc_msgSend(v18, "beaconIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (a6)
    {
      v11 = 0;
      v12 = 2;
      goto LABEL_5;
    }
LABEL_16:
    v11 = 0;
    goto LABEL_24;
  }
  if (!a6)
    goto LABEL_16;
  v11 = 0;
  v12 = 1;
LABEL_5:
  *a6 = v12;
LABEL_24:

  return v11;
}

- (SPKeyReconciler)initWithDictionary:(id)a3
{
  id v5;
  SPKeyReconciler *v6;
  SPKeyReconciler *v7;
  NSMutableArray *v8;
  NSMutableArray *keyIndices;
  _QWORD v11[4];
  SPKeyReconciler *v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPKeyReconciler;
  v6 = -[SPKeyReconciler init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingDictionary, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    keyIndices = v7->_keyIndices;
    v7->_keyIndices = v8;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__SPKeyReconciler_initWithDictionary___block_invoke;
    v11[3] = &unk_1E5E17D80;
    v12 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  return v7;
}

void __38__SPKeyReconciler_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SPKeyReconciler_initWithDictionary___block_invoke_2;
  v7[3] = &unk_1E5E17D58;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __38__SPKeyReconciler_initWithDictionary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD *handle_from_file_descriptor;
  SPKeyIndexMap *v7;
  uint64_t v8;
  SPKeyIndexMap *v9;

  v5 = a2;
  handle_from_file_descriptor = sp_key_index_map_create_handle_from_file_descriptor(objc_msgSend(v5, "fileDescriptor"));
  v7 = [SPKeyIndexMap alloc];
  if (a3)
    v8 = 2;
  else
    v8 = 1;
  v9 = -[SPKeyIndexMap initWithBeaconIdentifier:keySequence:mapHandle:](v7, "initWithBeaconIdentifier:keySequence:mapHandle:", *(_QWORD *)(a1 + 32), v8, handle_from_file_descriptor);
  objc_msgSend(v5, "closeFile");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v9);
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  NSMutableArray *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Backed by %lu keymaps\n"), -[NSMutableArray count](self->_keyIndices, "count"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = self->_keyIndices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "beaconIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "sequence") == 1)
          v10 = "primary";
        else
          v10 = "secondary";
        objc_msgSend(v3, "appendFormat:", CFSTR("\tIndex for beacon %@ sequence %s\n"), v9, v10);

        objc_msgSend(v8, "headerString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), v11);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v3;
}

@end

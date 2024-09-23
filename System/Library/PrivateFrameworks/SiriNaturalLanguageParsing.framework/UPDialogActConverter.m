@implementation UPDialogActConverter

- (UPDialogActConverter)initWithUsoSerializer:(id)a3
{
  id v5;
  UPDialogActConverter *v6;
  UPDialogActConverter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UPDialogActConverter;
  v6 = -[UPDialogActConverter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_usoSerializer, a3);

  return v7;
}

- (id)convertFromDialogAct:(id)a3 error:(id *)a4
{
  id v6;
  id *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    v7 = (id *)&v14;
    -[UPDialogActConverter _convertFromOfferedDialogAct:error:](self, "_convertFromOfferedDialogAct:error:", v6, &v14);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = 0;
      v7 = (id *)&v13;
      -[UPDialogActConverter _convertFromGaveOptionsDialogAct:error:](self, "_convertFromGaveOptionsDialogAct:error:", v6, &v13);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = 0;
        if (a4)
          goto LABEL_9;
        goto LABEL_11;
      }
      v12 = 0;
      v7 = (id *)&v12;
      -[UPDialogActConverter _convertFromPromptedDialogAct:error:](self, "_convertFromPromptedDialogAct:error:", v6, &v12);
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = (void *)v8;
  v10 = *v7;
  if (!v9)
  {
    if (a4)
    {
LABEL_9:
      v10 = objc_retainAutorelease(v10);
      v9 = 0;
      *a4 = v10;
      goto LABEL_12;
    }
LABEL_11:
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (id)_convertFromOfferedDialogAct:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  UPDialogActOffer *v9;
  void *v10;
  void *v11;
  UPDialogActOffer *v12;
  id v14;

  objc_msgSend(a3, "offeredAct");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[UPDialogActConverter _parseUserDialogAct:error:](self, "_parseUserDialogAct:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    v9 = [UPDialogActOffer alloc];
    objc_msgSend(v7, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UPDialogActOffer initWithIntent:entityWithValue:](v9, "initWithIntent:entityWithValue:", v10, v11);

  }
  else
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v12;
}

- (id)_convertFromGaveOptionsDialogAct:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UPDialogActOptions *v32;
  id *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v6, "choices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v42 = 0;
        -[UPDialogActConverter _parseUserDialogAct:error:](self, "_parseUserDialogAct:error:", v13, &v42);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v42;
        v16 = v15;
        if (!v14)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v15);

          goto LABEL_22;
        }
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (objc_msgSend(v7, "count"))
  {
    v34 = a4;
    objc_msgSend(v7, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "intent");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "entity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "entityType");
    v36 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "entityName");
    v35 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v21 = v7;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v39;
      while (2)
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          if ((objc_msgSend(v26, "isEqualToIntentWithSingleEntity:", v17) & 1) == 0)
          {
            if (v34)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 8, 0);
              *v34 = (id)objc_claimAutoreleasedReturnValue();
            }

            v32 = 0;
            v30 = (void *)v36;
            v29 = (void *)v37;
            v31 = (void *)v35;
            goto LABEL_26;
          }
          objc_msgSend(v26, "entity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "entityValue");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v28);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v23)
          continue;
        break;
      }
    }

    v30 = (void *)v36;
    v29 = (void *)v37;
    v31 = (void *)v35;
    v32 = -[UPDialogActOptions initWithIntent:entityType:entityName:entityValues:]([UPDialogActOptions alloc], "initWithIntent:entityType:entityName:entityValues:", v37, v36, v35, v20);
LABEL_26:

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 7, 0);
    v32 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    v32 = 0;
  }

  return v32;
}

- (id)_convertFromPromptedDialogAct:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UPDialogActPrompt *v17;
  void *v19;
  UPDialogActPrompt *v20;
  id v21;

  v6 = a3;
  objc_msgSend(v6, "reference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  -[UPDialogActConverter _parseUserDialogActGraph:error:](self, "_parseUserDialogActGraph:error:", v7, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;

  if (v8)
  {
    objc_msgSend(v8, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entityValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isEqualToString:", &stru_1E7BED9E0) & 1) != 0)
    {
      v20 = [UPDialogActPrompt alloc];
      objc_msgSend(v8, "intent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "entity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entityType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entityName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reference");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[UPDialogActPrompt initWithIntent:entityType:entityName:reference:](v20, "initWithIntent:entityType:entityName:reference:", v19, v13, v15, v16);

    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 6, 0);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v17;
}

- (id)_parseUserDialogAct:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "task");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    objc_msgSend(v6, "reference");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (!v7)
  {
LABEL_8:
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 4, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_14;
  }
  v14 = 0;
  -[UPDialogActConverter _parseUserDialogActGraph:error:](self, "_parseUserDialogActGraph:error:", v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  v11 = v10;
  if (v9)
  {
    v12 = v9;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v10);
  }

LABEL_14:
  return v9;
}

- (id)_parseUserDialogActGraph:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UPEntityWithValue *v26;
  UPIntentWithSingleEntity *v27;

  -[UPUsoSerializer deserializeFromSerializedGraph:](self->_usoSerializer, "deserializeFromSerializedGraph:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "directLeafNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      objc_msgSend(v6, "intermediateNodes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (!v9 && v11 == 1)
      {
        objc_msgSend(v6, "intermediateNodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "label");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14
          || (v15 = (void *)v14,
              objc_msgSend(v13, "leafNodes"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "count"),
              v16,
              v15,
              v17 != 1))
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 5, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          v22 = 0;
          v23 = 0;
          goto LABEL_20;
        }
        objc_msgSend(v13, "leafNodes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndex:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "label");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[UPUtilities higherLevelEntityLabelFromParentLabel:childLabel:](UPUtilities, "higherLevelEntityLabelFromParentLabel:childLabel:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        if (v22 && v23)
        {
          objc_msgSend(v6, "label");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[UPEntityWithValue initWithType:entityName:entityValue:]([UPEntityWithValue alloc], "initWithType:entityName:entityValue:", CFSTR("string"), v22, v23);
          v27 = -[UPIntentWithSingleEntity initWithIntent:singleEntity:]([UPIntentWithSingleEntity alloc], "initWithIntent:singleEntity:", v25, v26);

LABEL_23:
          goto LABEL_24;
        }
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 5, 0);
          v27 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
LABEL_20:
        v27 = 0;
        goto LABEL_23;
      }
      if (v9 == 1 && !v11)
      {
        objc_msgSend(v6, "directLeafNodes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "label");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 5, 0);
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
LABEL_24:

  return v27;
}

- (UPUsoSerializer)usoSerializer
{
  return (UPUsoSerializer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoSerializer, 0);
}

@end

@implementation MTLJSONAdapter

- (MTLJSONAdapter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 130, CFSTR("%@ must be initialized with a model class"), objc_opt_class());

  return 0;
}

- (MTLJSONAdapter)initWithModelClass:(Class)a3
{
  Class v3;
  MTLJSONAdapter *v6;
  MTLJSONAdapter *v7;
  uint64_t v8;
  NSDictionary *JSONKeyPathsByPropertyKey;
  void *v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSDictionary *valueTransformersByPropertyKey;
  uint64_t v23;
  NSMapTable *JSONAdaptersByModelClass;
  MTLJSONAdapter *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  objc_class *v31;
  uint64_t v32;
  SEL v33;
  NSDictionary *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v3 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelClass != nil"));

  }
  if ((-[objc_class conformsToProtocol:](v3, "conformsToProtocol:", &unk_1EF72D300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]"));

  }
  v45.receiver = self;
  v45.super_class = (Class)MTLJSONAdapter;
  v6 = -[MTLJSONAdapter init](&v45, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelClass, v3);
    -[objc_class JSONKeyPathsByPropertyKey](v3, "JSONKeyPathsByPropertyKey");
    v8 = objc_claimAutoreleasedReturnValue();
    JSONKeyPathsByPropertyKey = v7->_JSONKeyPathsByPropertyKey;
    v7->_JSONKeyPathsByPropertyKey = (NSDictionary *)v8;

    -[objc_class propertyKeys](-[MTLJSONAdapter modelClass](v7, "modelClass"), "propertyKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = v7->_JSONKeyPathsByPropertyKey;
    v36 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v36)
    {
      v12 = *(_QWORD *)v42;
      v33 = a2;
      v34 = v11;
      v35 = v10;
      v31 = v3;
      v32 = *(_QWORD *)v42;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v11);
        v14 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v13);
        if ((objc_msgSend(v10, "containsObject:", v14) & 1) == 0)
          break;
        -[NSDictionary objectForKeyedSubscript:](v7->_JSONKeyPathsByPropertyKey, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v38;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v38 != v19)
                  objc_enumerationMutation(v16);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v33, v7, CFSTR("MTLJSONAdapter.m"), 159, CFSTR("%@ must either map to a JSON key path or a JSON array of key paths, got: %@."), v14, v16);

                  v27 = v16;
                  v11 = v34;
                  v10 = v35;
                  goto LABEL_28;
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
              if (v18)
                continue;
              break;
            }
          }

          v11 = v34;
          v10 = v35;
          v12 = v32;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MTLJSONAdapter.m"), 163, CFSTR("%@ must either map to a JSON key path or a JSON array of key paths, got: %@."), v14, v15);
            v16 = v15;
LABEL_28:

            goto LABEL_29;
          }
        }

        if (++v13 == v36)
        {
          v3 = v31;
          v36 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
          if (v36)
            goto LABEL_8;
          goto LABEL_25;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MTLJSONAdapter.m"), 149, CFSTR("%@ is not a property of %@."), v14, v31);
LABEL_29:

      v25 = 0;
      goto LABEL_30;
    }
LABEL_25:

    objc_msgSend((id)objc_opt_class(), "valueTransformersForModelClass:", v3);
    v21 = objc_claimAutoreleasedReturnValue();
    valueTransformersByPropertyKey = v7->_valueTransformersByPropertyKey;
    v7->_valueTransformersByPropertyKey = (NSDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    JSONAdaptersByModelClass = v7->_JSONAdaptersByModelClass;
    v7->_JSONAdaptersByModelClass = (NSMapTable *)v23;

    v25 = v7;
LABEL_30:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)JSONDictionaryFromModel:(id)a3 error:(id *)a4
{
  id v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("model != nil"));

  }
  -[MTLJSONAdapter modelClass](self, "modelClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[model isKindOfClass:self.modelClass]"));

  }
  v8 = -[MTLJSONAdapter modelClass](self, "modelClass");
  if (v8 == (objc_class *)objc_opt_class())
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    -[MTLJSONAdapter JSONKeyPathsByPropertyKey](self, "JSONKeyPathsByPropertyKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLJSONAdapter serializablePropertyKeys:forModel:](self, "serializablePropertyKeys:forModel:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dictionaryValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithValuesForKeys:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 1;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__57098;
    v32 = __Block_byref_object_dispose__57099;
    v33 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke;
    v24[3] = &unk_1E7AF7600;
    v24[4] = self;
    v26 = &v34;
    v27 = &v28;
    v20 = v19;
    v25 = v20;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v24);
    if (*((_BYTE *)v35 + 24))
    {
      v10 = v20;
    }
    else
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease((id)v29[5]);
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    -[MTLJSONAdapter JSONAdapterForModelClass:error:](self, "JSONAdapterForModelClass:error:", objc_opt_class(), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "JSONDictionaryFromModel:error:", v7, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)modelFromJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  MTLJSONAdapter *v43;
  void *v44;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _QWORD v57[2];
  _QWORD v58[5];

  v58[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MTLJSONAdapter modelClass](self, "modelClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (objc_class *)-[objc_class classForParsingJSONDictionary:](-[MTLJSONAdapter modelClass](self, "modelClass"), "classForParsingJSONDictionary:", v6);
    if (!v7)
    {
      if (a4)
      {
        v57[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Could not parse JSON"), &stru_1E7AFA810, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v57[1] = *MEMORY[0x1E0CB2D68];
        v58[0] = v34;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("No model class could be found to parse the JSON dictionary."), &stru_1E7AFA810, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLJSONAdapterErrorDomain"), 2, v37);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 0;
      goto LABEL_47;
    }
    v8 = v7;
    if (v7 != -[MTLJSONAdapter modelClass](self, "modelClass"))
    {
      if ((-[objc_class conformsToProtocol:](v8, "conformsToProtocol:", &unk_1EF72D300) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 276, CFSTR("Class %@ returned from +classForParsingJSONDictionary: does not conform to <MTLJSONSerializing>"), v8);

      }
      -[MTLJSONAdapter JSONAdapterForModelClass:error:](self, "JSONAdapterForModelClass:error:", v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "modelFromJSONDictionary:error:", v6, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_47;
    }
  }
  v44 = v6;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v43 = self;
  -[objc_class propertyKeys](-[MTLJSONAdapter modelClass](self, "modelClass"), "propertyKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v52;
LABEL_9:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v40)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v11);
      -[MTLJSONAdapter JSONKeyPathsByPropertyKey](v43, "JSONKeyPathsByPropertyKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v16 = v14;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v48;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v48 != v18)
                  objc_enumerationMutation(v16);
                v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                v46 = 0;
                objc_msgSend(v44, "mtl_valueForJSONKeyPath:success:error:", v20, &v46, a4);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if (!v46)
                {

                  goto LABEL_45;
                }
                if (v21)
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v20);

              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              if (v17)
                continue;
              break;
            }
          }

        }
        else
        {
          v46 = 0;
          objc_msgSend(v44, "mtl_valueForJSONKeyPath:success:error:", v14, &v46, a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v46)
          {
            v16 = v14;
            goto LABEL_45;
          }
        }
        if (v15)
        {
          -[MTLJSONAdapter valueTransformersByPropertyKey](v43, "valueTransformersByPropertyKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v15, "isEqual:", v25);

            if (v26)
            {

              v15 = 0;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v27 = v24;
              v46 = 1;
              objc_msgSend(v27, "transformedValue:success:error:", v15, &v46, a4);
              v28 = objc_claimAutoreleasedReturnValue();

              v29 = v46 == 0;
              if (v29)
              {

                v16 = v14;
                v15 = (void *)v28;
LABEL_45:

                v10 = 0;
                v30 = obj;
                goto LABEL_46;
              }
            }
            else
            {
              objc_msgSend(v24, "transformedValue:", v15);
              v28 = objc_claimAutoreleasedReturnValue();

            }
            v15 = (void *)v28;
            if (!v28)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v15, v12);

        }
      }
      if (++v11 == v41)
      {
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v41)
          goto LABEL_9;
        break;
      }
    }
  }

  -[objc_class modelWithDictionary:error:](-[MTLJSONAdapter modelClass](v43, "modelClass"), "modelWithDictionary:error:", v39, a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "validate:", a4))
    v31 = v30;
  else
    v31 = 0;
  v10 = v31;
LABEL_46:

  v6 = v44;
LABEL_47:

  return v10;
}

- (id)JSONAdapterForModelClass:(Class)a3 error:(id *)a4
{
  MTLJSONAdapter *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelClass != nil"));

  }
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EF72D300, a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLJSONAdapter.m"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]"));

  }
  v7 = self;
  objc_sync_enter(v7);
  -[MTLJSONAdapter JSONAdaptersByModelClass](v7, "JSONAdaptersByModelClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithModelClass:", a3);
    if (v9)
    {
      -[MTLJSONAdapter JSONAdaptersByModelClass](v7, "JSONAdaptersByModelClass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, a3);

    }
  }
  v11 = v9;

  objc_sync_exit(v7);
  return v11;
}

- (id)serializablePropertyKeys:(id)a3 forModel:(id)a4
{
  return a3;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (NSDictionary)JSONKeyPathsByPropertyKey
{
  return self->_JSONKeyPathsByPropertyKey;
}

- (NSDictionary)valueTransformersByPropertyKey
{
  return self->_valueTransformersByPropertyKey;
}

- (NSMapTable)JSONAdaptersByModelClass
{
  return self->_JSONAdaptersByModelClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONAdaptersByModelClass, 0);
  objc_storeStrong((id *)&self->_valueTransformersByPropertyKey, 0);
  objc_storeStrong((id *)&self->_JSONKeyPathsByPropertyKey, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
}

void __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id obj;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "JSONKeyPathsByPropertyKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueTransformersByPropertyKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)objc_opt_class(), "allowsReverseTransformation"))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "isEqual:", v13);

      if (v14)
      {

        v8 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24;
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        obj = *(id *)(v16 + 40);
        objc_msgSend(v12, "reverseTransformedValue:success:error:", v8, v15, &obj);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v16 + 40), obj);

        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          *a4 = 1;
LABEL_24:

          v8 = v17;
          goto LABEL_25;
        }
      }
      else
      {
        objc_msgSend(v12, "reverseTransformedValue:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v20;

      }
    }
    else
    {
      v17 = v8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke_2(*(void **)(a1 + 40), v10);
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKeyPath:", v17, v10);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v12;
      v30 = v7;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v21 = v10;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke_2(*(void **)(a1 + 40), v26);
            v27 = *(void **)(a1 + 40);
            objc_msgSend(v17, "objectForKeyedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setValue:forKeyPath:", v28, v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v23);
      }

      v12 = v29;
      v7 = v30;
    }
    goto LABEL_24;
  }
LABEL_25:

}

void __48__MTLJSONAdapter_JSONDictionaryFromModel_error___block_invoke_2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(v9, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValue:forKey:", v12, v10);

        }
        objc_msgSend(v9, "valueForKey:", v10);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

+ (id)modelOfClass:(Class)a3 fromJSONDictionary:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelClass:", a3);
  objc_msgSend(v9, "modelFromJSONDictionary:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)modelsOfClass:(Class)a3 fromJSONArray:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v27;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(a1, "modelOfClass:fromJSONDictionary:error:", a3, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14), a5);
            v15 = objc_claimAutoreleasedReturnValue();
            if (!v15)
            {

              v17 = 0;
              goto LABEL_16;
            }
            v16 = (void *)v15;
            objc_msgSend(v9, "addObject:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v12)
            continue;
          break;
        }
      }

      v9 = v9;
      v17 = v9;
      goto LABEL_16;
    }
  }
  if (a5)
  {
    v31[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Missing JSON array"), &stru_1E7AFA810, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = *MEMORY[0x1E0CB2D68];
    v32[0] = v19;
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%@ could not be created because an invalid JSON array was provided: %@"), &stru_1E7AFA810, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v22, v23, objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLJSONAdapterErrorDomain"), 3, v9);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  v17 = 0;
LABEL_17:

  return v17;
}

+ (id)JSONDictionaryFromModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelClass:", objc_opt_class());
  objc_msgSend(v7, "JSONDictionaryFromModel:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)JSONArrayFromModels:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("models != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[models isKindOfClass:NSArray.class]"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "JSONDictionaryFromModel:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), a4);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {

          v16 = 0;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
  }

  v16 = v8;
LABEL_15:

  return v16;
}

+ (id)valueTransformersForModelClass:(Class)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  SEL v10;
  void (**v11)(_QWORD);
  id v12;
  objc_property *Property;
  _BYTE *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  id obj;
  _QWORD aBlock[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelClass != nil"));

  }
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EF72D300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[objc_class propertyKeys](a3, "propertyKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = MTLSelectorWithKeyPattern(v9, "JSONTransformer");
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || (-[objc_class JSONTransformerForKey:](a3, "JSONTransformerForKey:", v9),
                (v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue()) == 0))
          {
            v12 = objc_retainAutorelease(v9);
            Property = class_getProperty(a3, (const char *)objc_msgSend(v12, "UTF8String"));
            if (!Property)
              continue;
            v14 = mtl_copyPropertyAttributes(Property);
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __49__MTLJSONAdapter_valueTransformersForModelClass___block_invoke;
            aBlock[3] = &__block_descriptor_40_e5_v8__0l;
            aBlock[4] = v14;
            v11 = (void (**)(_QWORD))_Block_copy(aBlock);
            if (v14[48] == 64)
            {
              v15 = (void *)*((_QWORD *)v14 + 5);
              if (v15)
              {
                objc_msgSend(a1, "transformerForModelPropertiesOfClass:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                  goto LABEL_29;
              }
              if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF72D300))
              {
                objc_msgSend(a1, "dictionaryTransformerWithModelClass:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                  goto LABEL_29;
              }
              v17 = (void *)MEMORY[0x1E0CB3B20];
              if (!v15)
                v15 = (void *)objc_opt_class();
              objc_msgSend(v17, "mtl_validatingTransformerForClass:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
              if (v16)
LABEL_29:
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v12);

              v11[2](v11);
              goto LABEL_31;
            }
            objc_msgSend(a1, "transformerForModelPropertiesOfObjCType:", v14 + 48);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
            {
              v20 = v18;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_validatingTransformerForClass:", objc_opt_class());
              v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v16 = v20;

            goto LABEL_28;
          }
LABEL_12:
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v9);
          goto LABEL_31;
        }
        ((void (*)(Class, SEL))-[objc_class methodForSelector:](a3, "methodForSelector:", v10))(a3, v10);
        v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_12;
LABEL_31:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  return v5;
}

+ (id)transformerForModelPropertiesOfClass:(Class)a3
{
  void *v5;
  SEL v6;
  void *v7;
  void *v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelClass != nil"));

  }
  NSStringFromClass(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MTLSelectorWithKeyPattern(v5, "JSONTransformer");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(id, SEL))objc_msgSend(a1, "methodForSelector:", v6))(a1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)transformerForModelPropertiesOfObjCType:(const char *)a3
{
  void *v4;
  void *v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objCType != NULL"));

  }
  if (!strcmp(a3, "B"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_BOOLeanValueTransformer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __49__MTLJSONAdapter_valueTransformersForModelClass___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

+ (id)dictionaryTransformerWithModelClass:(Class)a3
{
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[7];
  _QWORD v12[5];
  id v13;

  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EF72D1A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[modelClass conformsToProtocol:@protocol(MTLModel)]"));

  }
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EF72D300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLJSONAdapter.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[modelClass conformsToProtocol:@protocol(MTLJSONSerializing)]"));

  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__57098;
  v12[4] = __Block_byref_object_dispose__57099;
  v13 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke;
  v11[3] = &unk_1E7AF7638;
  v11[4] = v12;
  v11[5] = a1;
  v11[6] = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke_2;
  v10[3] = &unk_1E7AF7660;
  v10[4] = v12;
  v10[5] = a1;
  v10[6] = a3;
  +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", v11, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v12, 8);

  return v6;
}

+ (id)arrayTransformerWithModelClass:(Class)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a1, "dictionaryTransformerWithModelClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke;
  v10[3] = &unk_1E7AF7688;
  v11 = v3;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke_2;
  v8[3] = &unk_1E7AF7688;
  v9 = v11;
  v5 = v11;
  +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", v10, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)NSURLJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_URLValueTransformer");
}

+ (id)NSUUIDJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B20], "mtl_UUIDValueTransformer");
}

id __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = a4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v34 = v7;
      obj = v7;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == v15)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = v34;
            if (v8)
            {
              v40[0] = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Could not convert JSON array to model array"), &stru_1E7AFA810, 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v41[0] = v33;
              v40[1] = *MEMORY[0x1E0CB2D68];
              v27 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Expected an NSDictionary or an NSNull, got: %@."), &stru_1E7AFA810, 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringWithFormat:", v29, v14);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v40[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
              v41[1] = v30;
              v41[2] = v14;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v31);
              *v8 = (id)objc_claimAutoreleasedReturnValue();

            }
            *a3 = 0;
            goto LABEL_26;
          }
          objc_msgSend(*(id *)(a1 + 32), "transformedValue:success:error:", v14, a3, v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!*a3)
          {

            v7 = v34;
LABEL_26:

            v18 = 0;
            goto LABEL_27;
          }
          if (v16)
            goto LABEL_14;
LABEL_15:

          if (v11 == ++v13)
          {
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_17;
          }
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        objc_msgSend(v9, "addObject:", v17);
        goto LABEL_15;
      }
LABEL_17:

      v18 = v9;
      v7 = v34;
LABEL_27:

    }
    else
    {
      if (a4)
      {
        v43[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Could not convert JSON array to model array"), &stru_1E7AFA810, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v20;
        v43[1] = *MEMORY[0x1E0CB2D68];
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Expected an NSArray, got: %@."), &stru_1E7AFA810, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v23, v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v44[1] = v24;
        v44[2] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v25);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __68__MTLJSONAdapter_ValueTransformers__arrayTransformerWithModelClass___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = a4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v34 = v7;
      obj = v7;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == v15)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v8)
            {
              v40[0] = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Could not convert JSON array to model array"), &stru_1E7AFA810, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v41[0] = v27;
              v40[1] = *MEMORY[0x1E0CB2D68];
              v28 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Expected a MTLModel or an NSNull, got: %@."), &stru_1E7AFA810, 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringWithFormat:", v30, v14);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v40[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
              v41[1] = v31;
              v41[2] = v14;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v32);
              *v8 = (id)objc_claimAutoreleasedReturnValue();

            }
            *a3 = 0;
            goto LABEL_26;
          }
          objc_msgSend(*(id *)(a1 + 32), "reverseTransformedValue:success:error:", v14, a3, v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!*a3)
          {

LABEL_26:
            v18 = 0;
            goto LABEL_27;
          }
          if (v16)
            goto LABEL_14;
LABEL_15:

          if (v11 == ++v13)
          {
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_17;
          }
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        objc_msgSend(v9, "addObject:", v17);
        goto LABEL_15;
      }
LABEL_17:

      v18 = v9;
LABEL_27:
      v7 = v34;

    }
    else
    {
      if (a4)
      {
        v43[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Could not convert model array to JSON array"), &stru_1E7AFA810, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v20;
        v43[1] = *MEMORY[0x1E0CB2D68];
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Expected an NSArray, got: %@."), &stru_1E7AFA810, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v23, v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v44[1] = v24;
        v44[2] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v25);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

id __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v21[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Could not convert JSON dictionary to model object"), &stru_1E7AFA810, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v14;
        v21[1] = *MEMORY[0x1E0CB2D68];
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Expected an NSDictionary, got: %@"), &stru_1E7AFA810, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v17, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
        v22[1] = v18;
        v22[2] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_10;
    }
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v8)
    {
      v9 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithModelClass:", *(_QWORD *)(a1 + 48));
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v8, "modelFromJSONDictionary:error:", v7, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_10:
      v12 = 0;
      *a3 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __73__MTLJSONAdapter_ValueTransformers__dictionaryTransformerWithModelClass___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1EF72D1A0)
    || (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF72D300) & 1) == 0)
  {
    if (a4)
    {
      v22[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Could not convert model object to JSON dictionary"), &stru_1E7AFA810, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v15;
      v22[1] = *MEMORY[0x1E0CB2D68];
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Expected a MTLModel object conforming to <MTLJSONSerializing>, got: %@."), &stru_1E7AFA810, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v18, v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = CFSTR("MTLTransformerErrorHandlingInputValueErrorKey");
      v23[1] = v19;
      v23[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLTransformerErrorHandlingErrorDomain"), 1, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_10;
  }
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v9)
  {
    v10 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithModelClass:", *(_QWORD *)(a1 + 48));
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v9, "JSONDictionaryFromModel:error:", v8, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_10:
    v13 = 0;
    *a3 = 0;
  }
LABEL_12:

  return v13;
}

+ (id)JSONArrayFromModels:(id)a3
{
  return (id)objc_msgSend(a1, "JSONArrayFromModels:error:", a3, 0);
}

+ (id)JSONDictionaryFromModel:(id)a3
{
  return (id)objc_msgSend(a1, "JSONDictionaryFromModel:error:", a3, 0);
}

@end

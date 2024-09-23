@implementation PBObjectToRepresentationCoercion

- (PBObjectToRepresentationCoercion)initWithClass:(Class)a3
{
  PBObjectToRepresentationCoercion *v4;
  PBObjectToRepresentationCoercion *v5;
  uint64_t v6;
  NSMutableDictionary *coercionBlockByType;
  uint64_t v8;
  NSMutableOrderedSet *typeOrder;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PBObjectToRepresentationCoercion;
  v4 = -[PBObjectToRepresentationCoercion init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_theClass, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    coercionBlockByType = v5->_coercionBlockByType;
    v5->_coercionBlockByType = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v8 = objc_claimAutoreleasedReturnValue();
    typeOrder = v5->_typeOrder;
    v5->_typeOrder = (NSMutableOrderedSet *)v8;

  }
  return v5;
}

- (void)addCoercionToType:(id)a3 block:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)MEMORY[0x18D782EA4](a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coercionBlockByType, "setObject:forKeyedSubscript:", v6, v7);

  -[NSMutableOrderedSet addObject:](self->_typeOrder, "addObject:", v7);
}

- (id)availableExportTypes
{
  return (id)-[NSMutableOrderedSet array](self->_typeOrder, "array");
}

- (BOOL)canCoerceToType:(id)a3
{
  __CFString *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_typeOrder;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (UTTypeConformsTo(*(CFStringRef *)(*((_QWORD *)&v10 + 1) + 8 * i), v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)createRepresentationOfType:(id)a3 fromObject:(id)a4 completionBlock:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  NSMutableOrderedSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD *v18;
  void (*v19)(_QWORD *, __CFString *, id, _QWORD *);
  id v20;
  id v21;
  __CFString *v22;
  NSObject *v23;
  id v24;
  id v25;
  __CFString *v26;
  _QWORD v27[4];
  __CFString *v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  __CFString *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = self->_typeOrder;
  v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v14)
        objc_enumerationMutation(v11);
      v16 = *(__CFString **)(*((_QWORD *)&v35 + 1) + 8 * v15);
      if (UTTypeConformsTo(v16, v8))
        break;
      if (v13 == ++v15)
      {
        v13 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_coercionBlockByType, "objectForKeyedSubscript:", v16);
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v17 = v16;

    if (!v18)
      goto LABEL_12;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke;
    v31[3] = &unk_1E2432080;
    v32 = v8;
    v33 = v9;
    v34 = v10;
    v19 = (void (*)(_QWORD *, __CFString *, id, _QWORD *))v18[2];
    v20 = v10;
    v21 = v9;
    v22 = v8;
    v19(v18, v17, v21, v31);

  }
  else
  {
LABEL_9:

    v17 = 0;
LABEL_12:
    dispatch_get_global_queue(0, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_3;
    v27[3] = &unk_1E2431540;
    v29 = v9;
    v30 = v10;
    v28 = v8;
    v24 = v10;
    v25 = v9;
    v26 = v8;
    dispatch_async(v23, v27);

    v18 = v30;
  }

}

void __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  char v14;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 || v8 || v9)
  {
    if (v9)
    {
      objc_msgSend(v9, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("PBErrorDomain"));

      if ((v14 & 1) == 0)
      {
        v15 = *(void **)(a1 + 32);
        v16 = (objc_class *)objc_opt_class();
        PBCannotCreateRepresentationError(v15, v16, v10);
        v17 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v17;
      }
    }
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    v12 = (objc_class *)objc_opt_class();
    PBCannotCreateRepresentationError(v11, v12, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_2;
    v19[3] = &unk_1E2431888;
    v23 = v18;
    v20 = v7;
    v21 = v8;
    v22 = v10;
    PBDispatchAsyncCallback(v19);

  }
}

uint64_t __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __90__PBObjectToRepresentationCoercion_createRepresentationOfType_fromObject_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_class *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    v2 = *(void **)(a1 + 32);
    v3 = (objc_class *)objc_opt_class();
    PBCannotCreateRepresentationError(v2, v3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v4);

  }
}

- (Class)theClass
{
  return self->_theClass;
}

- (void)setTheClass:(Class)a3
{
  objc_storeStrong((id *)&self->_theClass, a3);
}

- (NSMutableDictionary)coercionBlockByType
{
  return self->_coercionBlockByType;
}

- (void)setCoercionBlockByType:(id)a3
{
  objc_storeStrong((id *)&self->_coercionBlockByType, a3);
}

- (NSMutableOrderedSet)typeOrder
{
  return self->_typeOrder;
}

- (void)setTypeOrder:(id)a3
{
  objc_storeStrong((id *)&self->_typeOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeOrder, 0);
  objc_storeStrong((id *)&self->_coercionBlockByType, 0);
  objc_storeStrong((id *)&self->_theClass, 0);
}

@end

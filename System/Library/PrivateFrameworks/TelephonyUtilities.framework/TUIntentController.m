@implementation TUIntentController

- (TUIntentController)initWithContactProvider:(id)a3
{
  id v5;
  TUIntentController *v6;
  TUIntentController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIntentController;
  v6 = -[TUIntentController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactProvider, a3);

  return v7;
}

- (id)voicemailStartCallIntentByHandleForHandles:(id)a3
{
  return -[TUIntentController startCallIntentByHandleForHandles:capability:destinationType:](self, "startCallIntentByHandleForHandles:capability:destinationType:", a3, 1, 3);
}

- (id)personsByHandleForHandles:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = *MEMORY[0x1E0C967C0];
  v30[0] = *MEMORY[0x1E0C966E8];
  v30[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3850], "descriptorForUsedKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v8 = objc_claimAutoreleasedReturnValue();

  -[TUIntentController contactProvider](self, "contactProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v23 = (void *)v8;
  objc_msgSend(v9, "tu_contactsByHandleForHandles:keyDescriptors:error:", v4, v8, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v28;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
        v17 = (void *)objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", v16, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "tu_INPersonsFromHandle:contacts:", v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v13);
  }

  v20 = (void *)objc_msgSend(v5, "copy");
  return v20;
}

- (id)startCallIntentByHandleForHandles:(id)a3 capability:(int64_t)a4 destinationType:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  -[TUIntentController personsByHandleForHandles:](self, "personsByHandleForHandles:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v15 = (void *)getINStartCallIntentClass_softClass;
        v30 = getINStartCallIntentClass_softClass;
        if (!getINStartCallIntentClass_softClass)
        {
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __getINStartCallIntentClass_block_invoke;
          v26[3] = &unk_1E38A1710;
          v26[4] = &v27;
          __getINStartCallIntentClass_block_invoke((uint64_t)v26);
          v15 = (void *)v28[3];
        }
        v16 = objc_retainAutorelease(v15);
        _Block_object_dispose(&v27, 8);
        v17 = (void *)objc_msgSend([v16 alloc], "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", 0, 0, 0, a5, v14, a4);
        if (v17)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v21, "copy");
  return v18;
}

+ (int64_t)tu_INPersonHandleTypeForTUHandleType:(int64_t)a3
{
  if (a3 == 3)
    return 1;
  else
    return 2 * (a3 == 2);
}

+ (id)tu_INPersonHandleForTUHandle:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "tu_INPersonHandleTypeForTUHandleType:", objc_msgSend(v6, "type"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v9 = (void *)getINPersonHandleClass_softClass;
  v20 = getINPersonHandleClass_softClass;
  if (!getINPersonHandleClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getINPersonHandleClass_block_invoke;
    v16[3] = &unk_1E38A1710;
    v16[4] = &v17;
    __getINPersonHandleClass_block_invoke((uint64_t)v16);
    v9 = (void *)v18[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v17, 8);
  v11 = [v10 alloc];
  objc_msgSend(v6, "normalizedValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_msgSend(v11, "initWithValue:type:label:", v12, v8, v7);
  }
  else
  {
    objc_msgSend(v6, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithValue:type:label:", v14, v8, v7);

  }
  return v13;
}

+ (id)tu_INPersonsFromHandle:(id)a3 contacts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = v6;
  if (v6)
  {
    v7 = v6;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v8)
    {
      v29 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v29)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "tu_labeledValueForHandle:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
            v34 = 0;
            v35 = &v34;
            v36 = 0x2020000000;
            v14 = getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr;
            v37 = getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr;
            if (!getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr)
            {
              v15 = (void *)IntentsLibrary();
              v14 = dlsym(v15, "INPersonHandleLabelForCNLabeledValue");
              v35[3] = (uint64_t)v14;
              getINPersonHandleLabelForCNLabeledValueSymbolLoc_ptr = v14;
            }
            _Block_object_dispose(&v34, 8);
            if (!v14)
              +[TUIntentController tu_INPersonsFromHandle:contacts:].cold.1();
            ((void (*)(id))v14)(v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v16 = 0;
          }
          objc_msgSend((id)objc_opt_class(), "tu_INPersonHandleForTUHandle:label:", v5, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = 0;
          }
          v19 = objc_alloc((Class)getINPersonClass());
          objc_msgSend(v10, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v17, v18, 0, 0, v20, 0);

          if (v21)
            objc_msgSend(v28, "addObject:", v21);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "tu_INPersonHandleForTUHandle:label:", v5, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc((Class)getINPersonClass()), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v22, 0, 0, 0, 0, 0);
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }

  }
  v24 = (void *)objc_msgSend(v28, "copy");

  return v24;
}

- (TUHandleContactProvider)contactProvider
{
  return self->_contactProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactProvider, 0);
}

+ (void)tu_INPersonsFromHandle:contacts:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "INPersonHandleLabel _INPersonHandleLabelForCNLabeledValue(CNLabeledValue *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TUIntentController.m"), 24, CFSTR("%s"), dlerror());

  __break(1u);
}

@end

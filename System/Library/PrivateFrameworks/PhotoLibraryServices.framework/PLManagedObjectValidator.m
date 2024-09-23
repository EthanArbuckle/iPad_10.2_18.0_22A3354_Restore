@implementation PLManagedObjectValidator

+ (id)validateManagedObject:(id)a3
{
  id v3;
  PLManagedObjectValidationResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(PLManagedObjectValidationResult);
  -[PLManagedObjectValidationResult setStatus:](v4, "setStatus:", 1);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "attributeValidationRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          _PLPropertyValidationRuleMake(0, v14, 0, 0, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v22 = 0;
        v16 = objc_msgSend(v15, "evaluateWithObject:outMessage:", v3, &v22);
        v17 = v22;
        -[PLManagedObjectValidationResult setStatus:](v4, "setStatus:", v16);
        if (v17)
        {
          if (-[PLManagedObjectValidationResult status](v4, "status"))
            v18 = v20;
          else
            v18 = v21;
          objc_msgSend(v18, "addObject:", v17);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  -[PLManagedObjectValidationResult setErrorMessages:](v4, "setErrorMessages:", v21);
  -[PLManagedObjectValidationResult setInfoMessages:](v4, "setInfoMessages:", v20);
  -[PLManagedObjectValidationResult setValidatedObject:](v4, "setValidatedObject:", v3);

  return v4;
}

+ (BOOL)validateAllObjectsWithEntityClass:(Class)a3 inManagedObjectContext:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a4;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  if (a3 && v8 && -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v10 = (void *)MEMORY[0x1E0C97B48];
    -[objc_class entityName](a3, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__PLManagedObjectValidator_validateAllObjectsWithEntityClass_inManagedObjectContext_resultHandler___block_invoke;
    v16[3] = &unk_1E3676100;
    v18 = &v21;
    v19 = a1;
    v17 = v9;
    v13 = (id)objc_msgSend(v8, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v12, &v20, v16);

  }
  v14 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return v14;
}

+ (BOOL)validateAllObjectsUsingManagedObjectContext:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "_entityClassesToValidate", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    v12 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v12 &= +[PLManagedObjectValidator validateAllObjectsWithEntityClass:inManagedObjectContext:resultHandler:](PLManagedObjectValidator, "validateAllObjectsWithEntityClass:inManagedObjectContext:resultHandler:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v6, v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

+ (id)_entityClassesToValidate
{
  _QWORD v3[46];

  v3[45] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  v3[16] = objc_opt_class();
  v3[17] = objc_opt_class();
  v3[18] = objc_opt_class();
  v3[19] = objc_opt_class();
  v3[20] = objc_opt_class();
  v3[21] = objc_opt_class();
  v3[22] = objc_opt_class();
  v3[23] = objc_opt_class();
  v3[24] = objc_opt_class();
  v3[25] = objc_opt_class();
  v3[26] = objc_opt_class();
  v3[27] = objc_opt_class();
  v3[28] = objc_opt_class();
  v3[29] = objc_opt_class();
  v3[30] = objc_opt_class();
  v3[31] = objc_opt_class();
  v3[32] = objc_opt_class();
  v3[33] = objc_opt_class();
  v3[34] = objc_opt_class();
  v3[35] = objc_opt_class();
  v3[36] = objc_opt_class();
  v3[37] = objc_opt_class();
  v3[38] = objc_opt_class();
  v3[39] = objc_opt_class();
  v3[40] = objc_opt_class();
  v3[41] = objc_opt_class();
  v3[42] = objc_opt_class();
  v3[43] = objc_opt_class();
  v3[44] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 45);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __99__PLManagedObjectValidator_validateAllObjectsWithEntityClass_inManagedObjectContext_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 48), "validateManagedObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "status") & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end

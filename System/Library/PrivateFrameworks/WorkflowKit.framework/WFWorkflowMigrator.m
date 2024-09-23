@implementation WFWorkflowMigrator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "registerAllWorkflowKitMigrationClasses");
}

+ (void)registerAllWorkflowKitMigrationClasses
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  _QWORD v13[57];

  v13[56] = *MEMORY[0x1E0C80C00];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v13[6] = objc_opt_class();
  v13[7] = objc_opt_class();
  v13[8] = objc_opt_class();
  v13[9] = objc_opt_class();
  v13[10] = objc_opt_class();
  v13[11] = objc_opt_class();
  v13[12] = objc_opt_class();
  v13[13] = objc_opt_class();
  v13[14] = objc_opt_class();
  v13[15] = objc_opt_class();
  v13[16] = objc_opt_class();
  v13[17] = objc_opt_class();
  v13[18] = objc_opt_class();
  v13[19] = objc_opt_class();
  v13[20] = objc_opt_class();
  v13[21] = objc_opt_class();
  v13[22] = objc_opt_class();
  v13[23] = objc_opt_class();
  v13[24] = objc_opt_class();
  v13[25] = objc_opt_class();
  v13[26] = objc_opt_class();
  v13[27] = objc_opt_class();
  v13[28] = objc_opt_class();
  v13[29] = objc_opt_class();
  v13[30] = objc_opt_class();
  v13[31] = objc_opt_class();
  v13[32] = objc_opt_class();
  v13[33] = objc_opt_class();
  v13[34] = objc_opt_class();
  v13[35] = objc_opt_class();
  v13[36] = objc_opt_class();
  v13[37] = objc_opt_class();
  v13[38] = objc_opt_class();
  v13[39] = objc_opt_class();
  v13[40] = objc_opt_class();
  v13[41] = objc_opt_class();
  v13[42] = objc_opt_class();
  v13[43] = objc_opt_class();
  v13[44] = objc_opt_class();
  v13[45] = objc_opt_class();
  v13[46] = objc_opt_class();
  v13[47] = objc_opt_class();
  v13[48] = objc_opt_class();
  v13[49] = objc_opt_class();
  v13[50] = objc_opt_class();
  v13[51] = objc_opt_class();
  v13[52] = objc_opt_class();
  v13[53] = objc_opt_class();
  v13[54] = objc_opt_class();
  v13[55] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 56);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(a1, "registerMigrationClass:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (id)migrationClasses
{
  if (migrationClasses_onceToken != -1)
    dispatch_once(&migrationClasses_onceToken, &__block_literal_global_59776);
  return (id)migrationClasses_migrationClasses;
}

+ (void)registerMigrationClass:(Class)a3
{
  id v4;

  objc_msgSend(a1, "migrationClasses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", a3);

}

+ (void)migrateWorkflowIfNeeded:(id)a3 completion:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  void *v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v33 = a4;
  objc_msgSend(a1, "orderedMigrationClassesWithoutDependencies");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a1;
  objc_msgSend(a1, "migrationClassesWithDependencies");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v39)
  {
    v36 = *(_QWORD *)v61;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v61 != v36)
          objc_enumerationMutation(obj);
        v42 = v6;
        v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v6);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObject:", v7);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v9 = obj;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v57 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(v7, "migrationClassDependencies");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "containsObject:", v14))
              {

              }
              else
              {
                objc_msgSend(v14, "migrationClassDependencies");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "containsObject:", v7);

                if (!v17)
                  continue;
              }
              objc_msgSend(v8, "addObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
          }
          while (v11);
        }

        objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_170);
        objc_msgSend(v37, "unionOrderedSet:", v8);

        v6 = v42 + 1;
      }
      while (v42 + 1 != v39);
      v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v39);
  }

  v18 = v38;
  objc_msgSend(v38, "objectForKey:", CFSTR("WFWorkflowClientVersion"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = v37;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v53 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v24, "migrationClassDependencies");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v49;
          do
          {
            v29 = 0;
            do
            {
              if (*(_QWORD *)v49 != v28)
                objc_enumerationMutation(v25);
              v30 = objc_msgSend(v19, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v29));
              if (v30 >= objc_msgSend(v19, "indexOfObject:", v24))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v34, CFSTR("WFWorkflowMigrator.m"), 172, CFSTR("Dependent migration class is either missing or part of a circular dependency."));

              }
              ++v29;
            }
            while (v27 != v29);
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
          }
          while (v27);
        }

        v18 = v38;
        if (objc_msgSend(v24, "workflowNeedsMigration:fromClientVersion:", v38, v43))
          objc_msgSend(v40, "addObject:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v40, "count"))
  {
    dispatch_get_global_queue(0, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_2;
    block[3] = &unk_1E7AF8378;
    v45 = v18;
    v46 = v40;
    v47 = v33;
    dispatch_async(v32, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, void *, _QWORD))v33 + 2))(v33, 0, v18, 0);
  }

}

+ (id)orderedMigrationClassesWithoutDependencies
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E10]);
  objc_msgSend(a1, "migrationClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_180);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithSet:", v5);

  return v6;
}

+ (id)migrationClassesWithDependencies
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "migrationClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_181);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__WFWorkflowMigrator_migrationClassesWithDependencies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "migrationClassDependencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = a2;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

id __64__WFWorkflowMigrator_orderedMigrationClassesWithoutDependencies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "migrationClassDependencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count"))
    v5 = 0;
  else
    v5 = a2;

  return v5;
}

void __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_2(uint64_t a1)
{
  void *DeepCopy;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFPropertyListRef *)(a1 + 32), 1uLL);
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_3;
  v14[3] = &unk_1E7AF8328;
  v15 = DeepCopy;
  v16 = v3;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_5;
  v10[3] = &unk_1E7AF8350;
  v7 = *(id *)(a1 + 48);
  v12 = v16;
  v13 = v7;
  v11 = v15;
  v8 = v16;
  v9 = v15;
  objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v14, v10);

}

void __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_3(uint64_t a1, objc_class *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v7 = objc_alloc_init(a2);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_4;
  v10[3] = &unk_1E7AF8300;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v6;
  v9 = v6;
  objc_msgSend(v7, "migrateWorkflowIfNeeded:completion:", v8, v10);

}

uint64_t __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

uint64_t __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __57__WFWorkflowMigrator_migrateWorkflowIfNeeded_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "migrationClassDependencies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", a3) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a3, "migrationClassDependencies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", a2) << 63 >> 63;

  }
  return v6;
}

void __38__WFWorkflowMigrator_migrationClasses__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)migrationClasses_migrationClasses;
  migrationClasses_migrationClasses = (uint64_t)v0;

}

@end

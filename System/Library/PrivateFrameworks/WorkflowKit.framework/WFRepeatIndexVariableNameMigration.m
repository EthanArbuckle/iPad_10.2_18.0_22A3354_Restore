@implementation WFRepeatIndexVariableNameMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  v6 = (unint64_t)(WFCompareBundleVersions(a4, CFSTR("154")) - 1) >= 2
    && WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.getvariable"), v5)
    && ((WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.repeat.each"), v5) & 1) != 0
     || WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.repeat.count"), v5));

  return v6;
}

- (void)migrateWorkflow
{
  void *v3;
  _QWORD v4[5];

  -[WFWorkflowMigration actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke;
  v4[3] = &unk_1E7AF9228;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[WFWorkflowMigration finish](self, "finish");
}

- (void)calculateVariableNamesAtActionIndex:(unint64_t)a3 oldRepeatScopeVariables:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD v15[4];
  _QWORD v16[4];

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  -[WFWorkflowMigration actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__WFRepeatIndexVariableNameMigration_calculateVariableNamesAtActionIndex_oldRepeatScopeVariables___block_invoke;
  v10[3] = &unk_1E7AF9250;
  v12 = v16;
  v13 = v15;
  v10[4] = self;
  v14 = a3;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  if (a4)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);

}

void __98__WFRepeatIndexVariableNameMigration_calculateVariableNamesAtActionIndex_oldRepeatScopeVariables___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  id v16;

  v16 = a2;
  if (*(_QWORD *)(a1 + 64) >= a3 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.repeat.each")) & 1) == 0
      && !objc_msgSend(v8, "isEqualToString:", CFSTR("is.workflow.actions.repeat.count")))
    {
      goto LABEL_19;
    }
    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", CFSTR("WFControlFlowMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      goto LABEL_8;
    v13 = objc_msgSend(v11, "integerValue");
    if (v13 == 2)
    {
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    else if (!v13)
    {
LABEL_8:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (*(_QWORD *)(a1 + 64) != a3)
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
        {
          v14 = CFSTR("Repeat Index");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Repeat Index %ld"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
        {
          v15 = CFSTR("Repeat Index");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Repeat Index %ld"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v15, v14);

      }
    }

LABEL_19:
    goto LABEL_20;
  }
  *a4 = 1;
LABEL_20:

}

void __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifierKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("is.workflow.actions.getvariable")))
  {
    v8 = *(void **)(a1 + 32);
    v31 = 0;
    objc_msgSend(v8, "calculateVariableNamesAtActionIndex:oldRepeatScopeVariables:", a3, &v31);
    v9 = v31;
    objc_msgSend(*(id *)(a1 + 32), "actionParametersKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", CFSTR("WFVariable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("Value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("VariableName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("VariableUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("VariableName"));
      objc_msgSend(*(id *)(a1 + 32), "workflow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", CFSTR("WFWorkflowVariables"));
      v28 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v11;
      v19 = (void *)MEMORY[0x1E0CB3880];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke_2;
      v29[3] = &unk_1E7AF9200;
      v30 = v15;
      v25 = v15;
      objc_msgSend(v19, "predicateWithBlock:", v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "filteredArrayUsingPredicate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = v14;
      v23 = v12;
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v27;
      v9 = v28;

      objc_msgSend(v24, "setObject:forKey:", v17, CFSTR("Name"));
      v12 = v23;
      v14 = v22;

      v15 = v17;
    }

  }
}

uint64_t __53__WFRepeatIndexVariableNameMigration_migrateWorkflow__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end

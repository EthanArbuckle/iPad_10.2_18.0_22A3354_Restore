@implementation WFImageCombineActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("900")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.image.combine"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  const __CFString *v21;
  char v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isEqualToString:", CFSTR("is.workflow.actions.image.combine")))
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFImageCombineMode"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v13 = v12;
            else
              v13 = 0;
          }
          else
          {
            v13 = 0;
          }
          v14 = v13;

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WFImageCombineDirection"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = v15;
            else
              v16 = 0;
          }
          else
          {
            v16 = 0;
          }
          v17 = v16;

          if (v14)
            v18 = v14;
          else
            v18 = CFSTR("Side-by-Side");
          if (v17)
            v19 = v17;
          else
            v19 = CFSTR("Horizontal");
          if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Side-by-Side"))
            && (v20 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Horizontal")),
                v21 = CFSTR("Horizontally"),
                (v20 & 1) != 0)
            || -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Side-by-Side"))
            && (v22 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Vertical")),
                v21 = CFSTR("Vertically"),
                (v22 & 1) != 0))
          {
            objc_msgSend(v11, "setObject:forKey:", v21, CFSTR("WFImageCombineMode"));
            goto LABEL_30;
          }
          if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Grid")))
          {
            objc_msgSend(v11, "setObject:forKey:", CFSTR("In a Grid"), CFSTR("WFImageCombineMode"));
            objc_msgSend(v11, "objectForKey:", CFSTR("WFImageCombineDirection"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
LABEL_30:
              objc_msgSend(v11, "removeObjectForKey:", CFSTR("WFImageCombineDirection"));
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end

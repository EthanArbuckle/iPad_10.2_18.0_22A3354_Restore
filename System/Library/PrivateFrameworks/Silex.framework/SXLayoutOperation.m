@implementation SXLayoutOperation

- (SXLayoutOperation)initWithTask:(id)a3 layouter:(id)a4 DOMObjectProvider:(id)a5 componentSizerEngine:(id)a6 layoutBlueprintFactory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SXLayoutOperation *v17;
  SXLayoutOperation *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SXLayoutOperation;
  v17 = -[SXLayoutOperation init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_task, a3);
    objc_storeStrong((id *)&v18->_DOMObjectProvider, a5);
    objc_storeStrong((id *)&v18->_componentSizerEngine, a6);
    objc_storeStrong((id *)&v18->_layoutBlueprintFactory, a7);
    objc_storeStrong((id *)&v18->_layouter, a4);
    objc_msgSend(v13, "setDelegate:", v18);
  }

  return v18;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[SXLayoutOperation isCancelled](self, "isCancelled"))
  {
    -[SXLayoutOperation cancelOperation](self, "cancelOperation");
  }
  else
  {
    v3 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[SXLayoutOperation task](self, "task");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXLayoutOperation task](self, "task");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Starting layout operation for task, task-identifier=%{public}@, task: %{public}@", (uint8_t *)&v22, 0x16u);

    }
    -[SXLayoutOperation startBookKeeping](self, "startBookKeeping");
    -[SXLayoutOperation task](self, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blueprint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXLayoutOperation prepareLayoutBlueprint:](self, "prepareLayoutBlueprint:", v9);
    -[SXLayoutOperation beforeBlock](self, "beforeBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SXLayoutOperation beforeBlock](self, "beforeBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v9);

    }
    if ((-[SXLayoutOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      while (1)
      {
        v12 = v9;
        -[SXLayoutOperation layoutWithBlueprint:](self, "layoutWithBlueprint:", v9);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[SXLayoutOperation afterBlock](self, "afterBlock");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = -[SXLayoutOperation isCancelled](self, "isCancelled");

          if ((v15 & 1) == 0)
          {
            -[SXLayoutOperation afterBlock](self, "afterBlock");
            v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v16)[2](v16, v9);

          }
        }
        if ((-[SXLayoutOperation isCancelled](self, "isCancelled") & 1) != 0)
          break;
        -[SXLayoutOperation task](self, "task");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "instructions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "areFulfilledForBlueprint:", v9))
        {
          -[SXLayoutOperation DOMObjectProvider](self, "DOMObjectProvider");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "components");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[SXLayoutOperation layoutBlueprint:containsComponents:](self, "layoutBlueprint:containsComponents:", v9, v20);

          if (v21)
            break;
        }
        else
        {

        }
      }
      objc_storeStrong((id *)&self->_layoutBlueprint, v9);
    }
    -[SXLayoutOperation finishBookKeeping](self, "finishBookKeeping");

  }
}

- (BOOL)isAsynchronous
{
  return 0;
}

- (void)cancelOperation
{
  -[SXLayoutOperation startBookKeeping](self, "startBookKeeping");
  -[SXLayoutOperation finishBookKeeping](self, "finishBookKeeping");
}

- (void)startBookKeeping
{
  self->_startTime = CACurrentMediaTime();
  -[SXLayoutOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[SXLayoutOperation setExecuting:](self, "setExecuting:", 1);
  -[SXLayoutOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)finishBookKeeping
{
  void *v3;
  void (**v4)(void);

  self->_duration = CACurrentMediaTime() - self->_startTime;
  -[SXLayoutOperation completionBlock](self, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXLayoutOperation completionBlock](self, "completionBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[SXLayoutOperation setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
  -[SXLayoutOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[SXLayoutOperation setExecuting:](self, "setExecuting:", 0);
  -[SXLayoutOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[SXLayoutOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[SXLayoutOperation setFinished:](self, "setFinished:", 1);
  -[SXLayoutOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)prepareLayoutBlueprint:(id)a3
{
  objc_msgSend(a3, "invalidateDependentsOfInvalidatedComponents");
}

- (id)layoutWithBlueprint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  SXLayoutDescription *v46;
  void *v47;
  void *v48;
  SXLayoutDescription *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BYTE v55[22];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    -[SXLayoutOperation DOMObjectProvider](self, "DOMObjectProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "components");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLayoutOperation createLayoutBlueprintForComponents:](self, "createLayoutBlueprintForComponents:", v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      -[SXLayoutOperation task](self, "task");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138412546;
      *(_QWORD *)&v55[4] = v5;
      *(_WORD *)&v55[12] = 2112;
      *(_QWORD *)&v55[14] = v26;
      _os_log_impl(&dword_217023000, v24, OS_LOG_TYPE_DEFAULT, "Created new layout blueprint, layout-blueprint=%@, task-identifier=%@", v55, 0x16u);

    }
    goto LABEL_18;
  }
  v5 = v4;
  v6 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[SXLayoutOperation task](self, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v55 = 138412546;
    *(_QWORD *)&v55[4] = v9;
    *(_WORD *)&v55[12] = 1024;
    *(_DWORD *)&v55[14] = objc_msgSend(v5, "isComplete");
    _os_log_impl(&dword_217023000, v7, OS_LOG_TYPE_DEFAULT, "Validating existing layout, task-identifier=%@, layoutIsComplete=%d", v55, 0x12u);

  }
  -[SXLayoutOperation task](self, "task");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "instructions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "areFulfilledForBlueprint:", v5);

  if ((v12 & 1) != 0)
  {
    -[SXLayoutOperation DOMObjectProvider](self, "DOMObjectProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "components");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SXLayoutOperation layoutBlueprint:containsComponents:](self, "layoutBlueprint:containsComponents:", v5, v14);

    v16 = (void *)SXLayoutLog;
    v17 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        v18 = v16;
        -[SXLayoutOperation task](self, "task");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v55 = 138412290;
        *(_QWORD *)&v55[4] = v20;
        _os_log_impl(&dword_217023000, v18, OS_LOG_TYPE_DEFAULT, "No layout required, blueprint is valid, task-identifier=%@", v55, 0xCu);

      }
      return v5;
    }
    if (!v17)
      goto LABEL_15;
    v28 = v16;
    -[SXLayoutOperation task](self, "task");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v55 = 138412290;
    *(_QWORD *)&v55[4] = v30;
    v31 = "Requiring layout, DOM contains components that are not in provided blueprint, task-identifier=%@";
    goto LABEL_14;
  }
  v27 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v28 = v27;
    -[SXLayoutOperation task](self, "task");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v55 = 138412290;
    *(_QWORD *)&v55[4] = v30;
    v31 = "Requiring layout, instructions are not fullfilled with provided blueprint, task-identifier=%@";
LABEL_14:
    _os_log_impl(&dword_217023000, v28, OS_LOG_TYPE_DEFAULT, v31, v55, 0xCu);

  }
LABEL_15:
  v32 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    -[SXLayoutOperation task](self, "task");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v55 = 138412290;
    *(_QWORD *)&v55[4] = v35;
    _os_log_impl(&dword_217023000, v33, OS_LOG_TYPE_DEFAULT, "Updating existing layout blueprint, task-identifier=%@", v55, 0xCu);

  }
  -[SXLayoutOperation DOMObjectProvider](self, "DOMObjectProvider", *(_OWORD *)v55);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "components");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutOperation updateLayoutBlueprint:components:requiresInvalidation:](self, "updateLayoutBlueprint:components:requiresInvalidation:", v5, v37, 0);

LABEL_18:
  v38 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    -[SXLayoutOperation task](self, "task");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v55 = 138412290;
    *(_QWORD *)&v55[4] = v41;
    _os_log_impl(&dword_217023000, v39, OS_LOG_TYPE_DEFAULT, "Invalidating components in layout, task-identifier=%@", v55, 0xCu);

  }
  objc_msgSend(v5, "invalidateDependentsOfInvalidatedComponents");
  v42 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v43 = v42;
    -[SXLayoutOperation task](self, "task");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v55 = 138412290;
    *(_QWORD *)&v55[4] = v45;
    _os_log_impl(&dword_217023000, v43, OS_LOG_TYPE_DEFAULT, "Starting layout for task, task-identifier=%@", v55, 0xCu);

  }
  v46 = [SXLayoutDescription alloc];
  -[SXLayoutOperation task](self, "task");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "identifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[SXLayoutDescription initWithTaskIdentifier:](v46, "initWithTaskIdentifier:", v48);

  v55[0] = 0;
  -[SXLayoutOperation layouter](self, "layouter", *(_QWORD *)v55);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutOperation task](self, "task");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "options");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "columnLayout");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layoutBlueprint:columnLayout:description:shouldContinue:", v5, v53, v49, v55);

  return v5;
}

- (BOOL)layoutBlueprint:(id)a3 containsComponents:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v7, "componentAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentBlueprintForComponentIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        break;
      v12 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "layoutBlueprint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v9, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "componentsForContainerComponentWithIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "layoutBlueprint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[SXLayoutOperation layoutBlueprint:containsComponents:](self, "layoutBlueprint:containsComponents:", v16, v15);

          if (!v17)
          {
            objc_msgSend(v12, "component");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "invalidateSizeForComponentWithIdentifier:", v20);

            break;
          }

        }
      }

      if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_9;
    }

    v18 = 0;
  }
  else
  {
LABEL_9:
    v18 = 1;
  }

  return v18;
}

- (void)updateLayoutBlueprint:(id)a3 components:(id)a4 requiresInvalidation:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v7, "componentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v8, "componentForIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unregisterLayout:", v17);
          if (a5)
            *a5 = 1;

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count"))
  {
    v18 = 0;
    while (1)
    {
      objc_msgSend(v8, "componentAtIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        -[SXLayoutOperation registerComponent:layoutBlueprint:componentIndex:](self, "registerComponent:layoutBlueprint:componentIndex:", v19, v7, v18);
        objc_msgSend(v7, "componentIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count") - 1;

        if (v18 + 1 < v23)
        {
          objc_msgSend(v7, "componentIdentifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndex:", v18 + 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "invalidatePositionForComponentWithIdentifier:", v25);

        }
        if (a5)
          *a5 = 1;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
      v27 = v21;
      objc_msgSend(v19, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsForContainerComponentWithIdentifier:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "layoutBlueprint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
        break;
      v35 = 0;
      -[SXLayoutOperation updateLayoutBlueprint:components:requiresInvalidation:](self, "updateLayoutBlueprint:components:requiresInvalidation:", v30, v29, &v35);
      if (v35)
      {
        objc_msgSend(v27, "component");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v33 = v29;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invalidateSizeForComponentWithIdentifier:", v32);

        v29 = v33;
LABEL_25:

      }
LABEL_27:

      if (++v18 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_28;
    }
    -[SXLayoutOperation createLayoutBlueprintForComponents:](self, "createLayoutBlueprintForComponents:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setLayoutBlueprint:", v31);
    objc_msgSend(v31, "setParentLayoutBlueprint:", v7);
    if (a5)
      *a5 = 1;
    goto LABEL_25;
  }
LABEL_28:

}

- (id)createLayoutBlueprintForComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[SXLayoutOperation layoutBlueprintFactory](self, "layoutBlueprintFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutOperation task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createLayoutBlueprintWithLayoutOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v4, "componentAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXLayoutOperation registerComponent:layoutBlueprint:componentIndex:](self, "registerComponent:layoutBlueprint:componentIndex:", v10, v8, v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentBlueprintForComponentIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "componentsForContainerComponentWithIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[SXLayoutOperation createLayoutBlueprintForComponents:](self, "createLayoutBlueprintForComponents:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setLayoutBlueprint:", v16);
        objc_msgSend(v16, "setParentLayoutBlueprint:", v8);

      }
      ++v9;
    }
    while (v9 < objc_msgSend(v4, "count"));
  }

  return v8;
}

- (void)registerComponent:(id)a3 layoutBlueprint:(id)a4 componentIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  v9 = a3;
  -[SXLayoutOperation DOMObjectProvider](self, "DOMObjectProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentLayoutForIdentifier:", v11);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SXLayoutOperation componentSizerEngine](self, "componentSizerEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutOperation DOMObjectProvider](self, "DOMObjectProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizerForComponent:componentLayout:layoutOptions:DOMObjectProvider:", v9, v16, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "registerLayout:sizer:forComponent:atIndex:", v16, v15, v9, a5);
}

- (void)layouter:(id)a3 didFinishLayoutForComponentBlueprint:(id)a4 layoutBlueprint:(id)a5 shouldContinueLayout:(BOOL *)a6
{
  SXLayoutTask *task;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;

  task = self->_task;
  v10 = a5;
  v11 = a4;
  -[SXLayoutTask instructions](task, "instructions");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didLayoutComponentBlueprint:blueprint:", v11, v10);

  objc_msgSend(v10, "rootLayoutBlueprint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(task) = objc_msgSend(v14, "areFulfilledForBlueprint:", v12);
  if ((task & 1) != 0)
    v13 = 0;
  else
    v13 = -[SXLayoutOperation isCancelled](self, "isCancelled") ^ 1;
  *a6 = v13;

}

- (BOOL)executing
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (SXLayoutBlueprint)layoutBlueprint
{
  return self->_layoutBlueprint;
}

- (id)beforeBlock
{
  return self->_beforeBlock;
}

- (void)beforeLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)afterBlock
{
  return self->_afterBlock;
}

- (void)afterLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (double)duration
{
  return self->_duration;
}

- (SXComponentSizerEngine)componentSizerEngine
{
  return self->_componentSizerEngine;
}

- (SXLayoutBlueprintFactory)layoutBlueprintFactory
{
  return self->_layoutBlueprintFactory;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXColumnLayouter)layouter
{
  return self->_layouter;
}

- (SXLayoutTask)task
{
  return self->_task;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_layouter, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_layoutBlueprintFactory, 0);
  objc_storeStrong((id *)&self->_componentSizerEngine, 0);
  objc_storeStrong(&self->_afterBlock, 0);
  objc_storeStrong(&self->_beforeBlock, 0);
  objc_storeStrong((id *)&self->_layoutBlueprint, 0);
}

@end

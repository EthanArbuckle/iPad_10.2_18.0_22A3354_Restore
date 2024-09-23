@implementation SXLayoutCoordinator

- (SXLayoutCoordinator)initWithPipeline:(id)a3 integrator:(id)a4 instructionFactory:(id)a5 invalidationManager:(id)a6 blueprintProvider:(id)a7 DOMObjectProvider:(id)a8 layoutParametersManager:(id)a9 documentProvider:(id)a10 layoutPolicyManager:(id)a11
{
  id v18;
  SXLayoutCoordinator *v19;
  SXLayoutCoordinator *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v27 = a4;
  v26 = a5;
  v28 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)SXLayoutCoordinator;
  v19 = -[SXLayoutCoordinator init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_pipeline, a3);
    objc_storeStrong((id *)&v20->_integrator, a4);
    objc_storeStrong((id *)&v20->_instructionFactory, a5);
    objc_storeStrong((id *)&v20->_invalidationManager, a6);
    objc_storeStrong((id *)&v20->_blueprintProvider, a7);
    objc_storeStrong((id *)&v20->_DOMObjectProvider, a8);
    objc_storeStrong((id *)&v20->_layoutParametersManager, a9);
    objc_storeStrong((id *)&v20->_documentProvider, a10);
    objc_storeStrong((id *)&v20->_layoutPolicyManager, a11);
    objc_msgSend(v29, "setDelegate:", v20);
    objc_msgSend(v28, "setDelegate:", v20);
  }

  return v20;
}

- (void)layoutWithOptions:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217023000, v6, OS_LOG_TYPE_DEFAULT, "Received request for new layout", buf, 2u);
  }
  -[SXLayoutCoordinator layoutOptions](self, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if (v8)
  {
    v9 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v5;
      v10 = "Ignored layout request because options are identical to a previous request, options=%{public}@";
      v11 = v9;
LABEL_6:
      _os_log_impl(&dword_217023000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_50;
    }
    goto LABEL_50;
  }
  -[SXLayoutCoordinator blueprintProvider](self, "blueprintProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blueprint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v5);

  if (v15)
  {
    v16 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v5;
      _os_log_impl(&dword_217023000, v16, OS_LOG_TYPE_DEFAULT, "Ignored layout request; options are identical to integrated layout blueprint, options=%{public}@",
        buf,
        0xCu);
    }
    -[SXLayoutCoordinator pipeline](self, "pipeline");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelTasks");

    -[SXLayoutCoordinator layoutOptions](self, "layoutOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[SXLayoutCoordinator delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[SXLayoutCoordinator delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layoutCoordinator:cancelledLayoutWithOptions:", self, v18);

    }
    goto LABEL_50;
  }
  -[SXLayoutCoordinator layoutOptions](self, "layoutOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v5, "diffWithLayoutOptions:", v22);

  v24 = (id)SXLayoutLog;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("<SXLayoutOptionsDiff: "));
    v26 = v25;
    if (v23)
    {
      if (v23 == 0xFFFF)
      {
        v27 = CFSTR("All");
      }
      else
      {
        if ((v23 & 1) != 0)
          objc_msgSend(v25, "appendString:", CFSTR("ColumnLayout; "));
        if ((v23 & 2) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("ViewportSize; "));
        if ((v23 & 4) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("ContentSizeCategory; "));
        if ((v23 & 8) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("BundleSubscriptionStatus; "));
        if ((v23 & 0x10) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("ChannelSubscriptionStatus; "));
        if ((v23 & 0x20) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("ViewingLocation; "));
        if ((v23 & 0x40) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("Testing; "));
        if ((v23 & 0x80) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("ContentScaleFactor; "));
        if ((v23 & 0x100) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("PreferredColorScheme; "));
        if ((v23 & 0x200) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("HorizontalSizeClass; "));
        if ((v23 & 0x400) != 0)
          objc_msgSend(v26, "appendString:", CFSTR("VerticalSizeClass; "));
        if ((v23 & 0x800) == 0)
          goto LABEL_43;
        v27 = CFSTR("NewsletterSubscriptionStatus; ");
      }
    }
    else
    {
      v27 = CFSTR("Equal");
    }
    objc_msgSend(v26, "appendString:", v27);
LABEL_43:
    objc_msgSend(v26, "appendString:", CFSTR(">"));
    *(_DWORD *)buf = 138543618;
    v41 = v26;
    v42 = 2114;
    v43 = v5;
    _os_log_impl(&dword_217023000, v24, OS_LOG_TYPE_DEFAULT, "Assessing layout request; layout diff=%{public}@, options=%{public}@",
      buf,
      0x16u);

  }
  -[SXLayoutCoordinator layoutPolicyManager](self, "layoutPolicyManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "shouldPerformLayoutWithLayoutOptionsDiff:", v23);

  v30 = SXLayoutLog;
  v31 = os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (!v31)
      goto LABEL_50;
    *(_DWORD *)buf = 138543362;
    v41 = v5;
    v10 = "Ignored layout request; layout policy did not require layout, options=%{public}@";
    v11 = v30;
    goto LABEL_6;
  }
  if (v31)
  {
    *(_DWORD *)buf = 138543362;
    v41 = v5;
    _os_log_impl(&dword_217023000, v30, OS_LOG_TYPE_DEFAULT, "Creating layout task; layout policy requires a layout, options=%{public}@",
      buf,
      0xCu);
  }
  objc_storeStrong((id *)&self->_layoutOptions, a3);
  -[SXLayoutCoordinator debouncer](self, "debouncer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cancel");

  objc_initWeak((id *)buf, self);
  v34 = MEMORY[0x24BDAC760];
  v35 = 3221225472;
  v36 = __41__SXLayoutCoordinator_layoutWithOptions___block_invoke;
  v37 = &unk_24D68A678;
  objc_copyWeak(&v39, (id *)buf);
  v38 = v5;
  +[SXDelayed execute:delay:](SXDelayed, "execute:delay:", &v34, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutCoordinator setDebouncer:](self, "setDebouncer:", v33, v34, v35, v36, v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
LABEL_50:

}

void __41__SXLayoutCoordinator_layoutWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "instructionFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createInstructions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "taskWithOptions:layoutBlueprint:instructions:", v3, 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "startTask:", v6);
    objc_msgSend(v7, "setDebouncer:", 0);

    WeakRetained = v7;
  }

}

- (void)layoutPipeline:(id)a3 finishedTask:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  CFTimeInterval v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  SXRepeatedLayoutTask *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41[2];
  id location;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = CACurrentMediaTime();
  v12 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v14;
    v45 = 2112;
    v46 = v10;
    _os_log_impl(&dword_217023000, v13, OS_LOG_TYPE_DEFAULT, "Received layout result, task-identifier=%{public}@, result=%@", buf, 0x16u);

  }
  -[SXLayoutCoordinator layoutOptions](self, "layoutOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {
    -[SXLayoutCoordinator DOMObjectProvider](self, "DOMObjectProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "DOM");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDOM:", v19);

    -[SXLayoutCoordinator blueprintProvider](self, "blueprintProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blueprint");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateBlueprint:", v21);

    -[SXLayoutCoordinator layoutParametersManager](self, "layoutParametersManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutFinishedForTask:result:", v9, v10);

    -[SXLayoutCoordinator delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[SXLayoutCoordinator delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "blueprint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "layoutCoordinator:willIntegrateBlueprint:", self, v25);

    }
    objc_initWeak(&location, self);
    -[SXLayoutCoordinator integrator](self, "integrator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blueprint");
    v27 = objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __62__SXLayoutCoordinator_layoutPipeline_finishedTask_withResult___block_invoke;
    v38[3] = &unk_24D68BE50;
    objc_copyWeak(v41, &location);
    v41[1] = *(id *)&v11;
    v28 = v9;
    v39 = v28;
    v29 = v10;
    v40 = v29;
    objc_msgSend(v26, "integrateBlueprint:withCompletion:", v27, v38);

    objc_msgSend(v29, "blueprint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend(v30, "isComplete");

    if ((v27 & 1) == 0)
    {
      v31 = SXLayoutLog;
      if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217023000, v31, OS_LOG_TYPE_DEFAULT, "Starting new layout because blueprint is incomplete", buf, 2u);
      }
      v32 = -[SXRepeatedLayoutTask initWithTask:result:]([SXRepeatedLayoutTask alloc], "initWithTask:result:", v28, v29);
      if (-[SXRepeatedLayoutTask repeatCount](v32, "repeatCount") > 1)
      {
        v36 = (id)SXLayoutLog;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v28, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXLayoutCoordinator layoutPipeline:finishedTask:withResult:].cold.1(v37, buf, v36);
        }

      }
      else
      {
        -[SXLayoutCoordinator startTask:](self, "startTask:", v32);
      }

    }
    objc_destroyWeak(v41);
    objc_destroyWeak(&location);
  }
  else
  {
    v33 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      objc_msgSend(v9, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v35;
      _os_log_impl(&dword_217023000, v34, OS_LOG_TYPE_DEFAULT, "Dropped result of layout because options are no longer valid, task-identifier=%{public}@", buf, 0xCu);

    }
  }

}

void __62__SXLayoutCoordinator_layoutPipeline_finishedTask_withResult___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  CFTimeInterval v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  CFTimeInterval v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (CACurrentMediaTime() - *(double *)(a1 + 56)) * 1000.0;
    v6 = CACurrentMediaTime();
    objc_msgSend(*(id *)(a1 + 32), "startTime");
    v8 = (v6 - v7) * 1000.0;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = v5;
    v16 = 2048;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_217023000, v4, OS_LOG_TYPE_DEFAULT, "Integrated layout blueprint in %fms, total-duration=%fms, task-identifier=%{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "blueprint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutCoordinator:didIntegrateBlueprint:", WeakRetained, v13);

  }
}

- (void)layoutInvalidationManager:(id)a3 didInvalidateBlueprint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v16[0] = 67109120;
    v16[1] = objc_msgSend(v7, "isComplete");
    _os_log_impl(&dword_217023000, v9, OS_LOG_TYPE_DEFAULT, "Received invalidated blueprint, requesting new layout; layoutIsComplete=%d",
      (uint8_t *)v16,
      8u);

  }
  objc_msgSend(v7, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutCoordinator layoutOptions](self, "layoutOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(v7, "layoutOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLayoutCoordinator taskWithOptions:layoutBlueprint:instructions:](self, "taskWithOptions:layoutBlueprint:instructions:", v13, v7, MEMORY[0x24BDBD1A8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXLayoutCoordinator startTask:](self, "startTask:", v14);
  }
  else
  {
    v15 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_217023000, v15, OS_LOG_TYPE_DEFAULT, "Invalidated blueprint doesn't match the current layout options", (uint8_t *)v16, 2u);
    }
  }

}

- (void)startTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
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
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  SXLayoutCoordinator *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "type") != 1)
    goto LABEL_3;
  objc_msgSend(v4, "blueprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v23 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_ERROR))
      -[SXLayoutCoordinator startTask:].cold.1(v23);
  }
  else
  {
LABEL_3:
    -[SXLayoutCoordinator documentProvider](self, "documentProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v10, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v13;
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v14;
      _os_log_impl(&dword_217023000, v12, OS_LOG_TYPE_DEFAULT, "Scheduling new layout task, document-identifier=%{public}@, coordinator=%p, task-identifier=%{public}@", (uint8_t *)&v24, 0x20u);

    }
    -[SXLayoutCoordinator layoutParametersManager](self, "layoutParametersManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXLayoutCoordinator blueprintProvider](self, "blueprintProvider");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "blueprint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutParametersForTask:previousLayoutOptions:", v4, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXLayoutCoordinator delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[SXLayoutCoordinator delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layoutCoordinator:willLayoutWithParameters:", self, v19);

    }
    -[SXLayoutCoordinator pipeline](self, "pipeline");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutWithTask:", v4);

  }
}

- (id)taskWithOptions:(id)a3 layoutBlueprint:(id)a4 instructions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  SXLayoutInstructions *v13;
  SXLayoutInstructions *v14;
  SXLayoutTask *v15;
  SXLayoutTask *v16;
  void *v17;
  void *v18;
  SXLayoutTask *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v10, "count"))
  {
    +[SXDefaultLayoutInstruction instruction](SXDefaultLayoutInstruction, "instruction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v12;
  }
  if (objc_msgSend(v10, "count"))
  {
    v13 = -[SXLayoutInstructions initWithInstructions:]([SXLayoutInstructions alloc], "initWithInstructions:", v10);
  }
  else
  {
    +[SXLayoutInstructions defaultInstructions](SXLayoutInstructions, "defaultInstructions");
    v13 = (SXLayoutInstructions *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = [SXLayoutTask alloc];
  v16 = v15;
  if (v9)
  {
    -[SXLayoutCoordinator DOMObjectProvider](self, "DOMObjectProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "DOM");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SXLayoutTask initWithOptions:instructions:blueprint:DOM:](v16, "initWithOptions:instructions:blueprint:DOM:", v8, v14, v9, v18);

  }
  else
  {
    v19 = -[SXLayoutTask initWithOptions:instructions:](v15, "initWithOptions:instructions:", v8, v14);
  }

  return v19;
}

- (SXLayoutCoordinatorDelegate)delegate
{
  return (SXLayoutCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SXLayoutPipeline)pipeline
{
  return self->_pipeline;
}

- (SXLayoutIntegrator)integrator
{
  return self->_integrator;
}

- (SXLayoutInstructionFactory)instructionFactory
{
  return self->_instructionFactory;
}

- (SXLayoutInvalidationManager)invalidationManager
{
  return self->_invalidationManager;
}

- (SXLayoutBlueprintProvider)blueprintProvider
{
  return self->_blueprintProvider;
}

- (SXDOMObjectProvider)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXLayoutParametersManager)layoutParametersManager
{
  return self->_layoutParametersManager;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXLayoutPolicyManager)layoutPolicyManager
{
  return self->_layoutPolicyManager;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (SXDelayed)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_debouncer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_layoutPolicyManager, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_layoutParametersManager, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_blueprintProvider, 0);
  objc_storeStrong((id *)&self->_invalidationManager, 0);
  objc_storeStrong((id *)&self->_instructionFactory, 0);
  objc_storeStrong((id *)&self->_integrator, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)layoutPipeline:(void *)a1 finishedTask:(uint8_t *)buf withResult:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_217023000, log, OS_LOG_TYPE_ERROR, "Loop detected, unable to complete layout, task-identifier=%{public}@", buf, 0xCu);

}

- (void)startTask:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217023000, log, OS_LOG_TYPE_ERROR, "Attempted to start a layout with an existing blueprint with invalid layout options", v1, 2u);
}

@end

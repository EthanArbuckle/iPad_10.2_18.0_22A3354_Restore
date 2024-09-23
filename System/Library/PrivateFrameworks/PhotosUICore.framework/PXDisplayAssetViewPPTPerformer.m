@implementation PXDisplayAssetViewPPTPerformer

- (PXDisplayAssetViewPPTPerformer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 34, CFSTR("%s is not available as initializer"), "-[PXDisplayAssetViewPPTPerformer init]");

  abort();
}

- (PXDisplayAssetViewPPTPerformer)initWithContainerView:(id)a3 delegate:(id)a4 testOptions:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXDisplayAssetViewPPTPerformer *v13;
  PXDisplayAssetViewPPTPerformer *v14;
  uint64_t v15;
  NSString *testName;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView != nil"));

  if (!v11)
    goto LABEL_11;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("testOptions != nil"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)PXDisplayAssetViewPPTPerformer;
  v13 = -[PXDisplayAssetViewPPTPerformer init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_containerView, a3);
    objc_storeWeak((id *)&v14->_delegate, v11);
    objc_storeStrong((id *)&v14->_testOptions, a5);
    -[NSDictionary objectForKeyedSubscript:](v14->_testOptions, "objectForKeyedSubscript:", CFSTR("testName"));
    v15 = objc_claimAutoreleasedReturnValue();
    testName = v14->_testName;
    v14->_testName = (NSString *)v15;

    -[PXDisplayAssetViewPPTPerformer testOptions](v14, "testOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("iterations"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    if (v19 <= 1)
      v20 = 1;
    else
      v20 = v19;
    v14->_testIterations = v20;
  }

  return v14;
}

- (void)runScrubbingTestWithConfigurations:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  PXDisplayAssetViewPPTPerformer *v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurations != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke;
  v13[3] = &unk_1E5146828;
  v14 = v7;
  v15 = self;
  v16 = a2;
  v10 = v7;
  -[PXDisplayAssetViewPPTPerformer _runTestUsingBlock:completionHandler:](self, "_runTestUsingBlock:completionHandler:", v13, v9);

}

- (void)runLocalizedTitleTestWithConfigurations:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  PXDisplayAssetViewPPTPerformer *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurations != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayAssetViewPPTPerformer.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke;
  v13[3] = &unk_1E51468A0;
  v14 = v7;
  v15 = self;
  v10 = v7;
  -[PXDisplayAssetViewPPTPerformer _runTestUsingBlock:completionHandler:](self, "_runTestUsingBlock:completionHandler:", v13, v9);

}

- (void)_runScrubbingSubtestWithAssetView:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[3];
  char v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") > 4)
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 1;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__291446;
    v23 = __Block_byref_object_dispose__291447;
    v24 = 0;
    -[PXDisplayAssetViewPPTPerformer testIterations](self, "testIterations");
    v15 = v11;
    v16 = v9;
    v17 = v8;
    v14 = v10;
    PXIterateAsynchronously();

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v18, 8);
  }
  else
  {
    PLOneUpGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "not enough assets for scrubbing subtest %@", (uint8_t *)&buf, 0xCu);

    }
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
  }

}

- (void)_runTestUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void (*v10)(_QWORD *, _QWORD *);
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[PXDisplayAssetViewPPTPerformer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetViewPPTPerformer testName](self, "testName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startedTest:", v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__PXDisplayAssetViewPPTPerformer__runTestUsingBlock_completionHandler___block_invoke;
  v14[3] = &unk_1E5146918;
  v15 = v8;
  v16 = v9;
  v17 = v6;
  v10 = (void (*)(_QWORD *, _QWORD *))v7[2];
  v11 = v6;
  v12 = v9;
  v13 = v8;
  v10(v7, v14);

}

- (void)_runSubtestWithName:(id)a3 metrics:(id)a4 configuration:(id)a5 usingBlock:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void (*v18)(_QWORD *, _QWORD *);
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  -[PXDisplayAssetViewPPTPerformer delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetViewPPTPerformer testName](self, "testName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  objc_msgSend(v15, "startedSubTest:forTest:withMetrics:", v17, v16, v14);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __105__PXDisplayAssetViewPPTPerformer__runSubtestWithName_metrics_configuration_usingBlock_completionHandler___block_invoke;
  v23[3] = &unk_1E5146940;
  v24 = v15;
  v25 = v17;
  v26 = v16;
  v27 = v12;
  v18 = (void (*)(_QWORD *, _QWORD *))v13[2];
  v19 = v12;
  v20 = v16;
  v21 = v17;
  v22 = v15;
  v18(v13, v23);

}

- (void)_createAssetViewWithConfiguration:(id)a3 resultHandler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  void (**v7)(void);
  void *v8;
  id v9;

  v6 = (void (**)(id, id, _QWORD))a4;
  objc_msgSend(a3, "assetViewFactory");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXDisplayAssetViewPPTPerformer containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v8, "addSubview:", v9);
  v6[2](v6, v9, 0);

}

- (void)_tearDownAssetView:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(a3, "removeFromSuperview");
  v5[2](v5, 1, 0);

}

- (PXAnonymousView)containerView
{
  return self->_containerView;
}

- (PXPPTDelegate)delegate
{
  return (PXPPTDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSDictionary)testOptions
{
  return self->_testOptions;
}

- (NSString)testName
{
  return self->_testName;
}

- (int64_t)testIterations
{
  return self->_testIterations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_testOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);
}

void __105__PXDisplayAssetViewPPTPerformer__runSubtestWithName_metrics_configuration_usingBlock_completionHandler___block_invoke(_QWORD *a1, int a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = (void *)a1[4];
  if (a2)
  {
    v5 = a1[5];
    v6 = a1[6];
    v7 = a3;
    objc_msgSend(v4, "finishedSubTest:forTest:", v5, v6);
  }
  else
  {
    objc_msgSend(v4, "failedTest:withFailureFormat:", a1[6], CFSTR("test %@ subtest %@ failed with error: %@"), a1[6], a1[5], a3);
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void __71__PXDisplayAssetViewPPTPerformer__runTestUsingBlock_completionHandler___block_invoke(_QWORD *a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  v8 = v7;
  if (a2)
    objc_msgSend(v5, "finishedTest:", v6);
  else
    objc_msgSend(v5, "failedTest:withFailureFormat:", v6, CFSTR("test %@ failed with error: %@"), v6, v7);
  (*(void (**)(void))(a1[6] + 16))();

}

void __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v3, "index") % *(_QWORD *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_2;
  v13[3] = &unk_1E51468A0;
  v14 = *(id *)(a1 + 56);
  v15 = v4;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_4;
  v10[3] = &unk_1E51468C8;
  v11 = v3;
  v12 = *(_OWORD *)(a1 + 64);
  v8 = v3;
  v9 = v4;
  objc_msgSend(v6, "_runSubtestWithName:metrics:configuration:usingBlock:completionHandler:", CFSTR("Scrub-Latency"), &unk_1E53EABD8, v7, v13, v10);

}

uint64_t __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAsset:", *(_QWORD *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_3;
  block[3] = &unk_1E5148A40;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "next");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 32), "stop");
  }

}

uint64_t __100__PXDisplayAssetViewPPTPerformer__runScrubbingSubtestWithAssetView_configuration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t k;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t j;
  _QWORD v19[6];
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__291446;
  v30 = __Block_byref_object_dispose__291447;
  v31 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 32);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v23;
    v3 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v4, "assets");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        for (j = 0; j < objc_msgSend(*(id *)(a1 + 40), "testIterations"); ++j)
        {
          v6 = objc_msgSend(v5, "count");
          if (v6 >= 5)
            goto LABEL_12;
          PLOneUpGetLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "label");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v37 = v8;
            _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "not enough assets for localized title subtest %@", buf, 0xCu);

          }
          if (v6 > 0)
          {
LABEL_12:
            for (k = 0; k != v6; ++k)
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", k);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = *(void **)(a1 + 40);
              v20[0] = v3;
              v20[1] = 3221225472;
              v20[2] = __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_35;
              v20[3] = &unk_1E5146850;
              v12 = v10;
              v21 = v12;
              v19[0] = v3;
              v19[1] = 3221225472;
              v19[2] = __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_2;
              v19[3] = &unk_1E5146878;
              v19[4] = &v32;
              v19[5] = &v26;
              objc_msgSend(v11, "_runSubtestWithName:metrics:configuration:usingBlock:completionHandler:", CFSTR("Title-Latency"), &unk_1E53EABC0, v4, v20, v19);

            }
          }
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
    }
    while (v16);
  }

  v13[2](v13, *((unsigned __int8 *)v33 + 24), v27[5]);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (**v3)(id, uint64_t, _QWORD);
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  +[PXDisplayAssetView localizedTitleForAsset:](PXDisplayAssetView, "localizedTitleForAsset:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3[2](v3, 1, 0);

}

void __92__PXDisplayAssetViewPPTPerformer_runLocalizedTitleTestWithConfigurations_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[3];
  char v9;

  v3 = a2;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__291446;
  v6[4] = __Block_byref_object_dispose__291447;
  v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  PXIterateAsynchronously();

  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v8, 8);

}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__291446;
  v19[4] = __Block_byref_object_dispose__291447;
  v20 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_2;
  v16[3] = &unk_1E5146738;
  v16[4] = v6;
  v17 = v4;
  v18 = v19;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_4;
  v10[3] = &unk_1E51467B0;
  v15 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v19;
  v10[4] = v7;
  v8 = v17;
  v11 = v8;
  v9 = v3;
  v12 = v9;
  v14 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v6, "_runSubtestWithName:metrics:configuration:usingBlock:completionHandler:", CFSTR("ViewCreation"), &unk_1E53EABA8, v8, v16, v10);

  _Block_object_dispose(v19, 8);
}

uint64_t __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_7(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5146710;
  v6 = a1[6];
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v4, "_createAssetViewWithConfiguration:resultHandler:", v5, v8);

}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  __int128 v15;

  v6 = a3;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("PXDisplayAssetViewPPTPerformer.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetView != nil"));

      v7 = *(_QWORD *)(a1 + 56);
      v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40);
    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_5;
    v12[3] = &unk_1E5146788;
    v12[4] = v9;
    v14 = v7;
    v13 = *(id *)(a1 + 48);
    v15 = *(_OWORD *)(a1 + 64);
    objc_msgSend(v9, "_runScrubbingSubtestWithAssetView:configuration:completionHandler:", v8, v10, v12);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 48), "stop");
  }

}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  char v14;

  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_6;
  v10[3] = &unk_1E5146760;
  v14 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 56);
  v11 = v8;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v7, "_tearDownAssetView:completionHandler:", v6, v10);

}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  BOOL v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (*(_BYTE *)(a1 + 64))
    v4 = a2 == 0;
  else
    v4 = 1;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (*(_QWORD *)(a1 + 40))
      v5 = *(void **)(a1 + 40);
    else
      v5 = a3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);
    v6 = a3;
    objc_msgSend(*(id *)(a1 + 32), "stop");
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = a3;
    objc_msgSend(v7, "next");
  }

}

void __87__PXDisplayAssetViewPPTPerformer_runScrubbingTestWithConfigurations_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end

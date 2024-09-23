@implementation WBSAutoFillTestController

- (id)expectedResultsPathExtension
{
  return CFSTR("txt");
}

- (id)bundleType
{
  return CFSTR("autofilltest");
}

- (unint64_t)pageTestType
{
  return 1;
}

- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 completionHandler:(id)a6
{
  -[WBSAutoFillTestController runTest:bundle:storeResultsIn:tryCount:completionHandler:](self, "runTest:bundle:storeResultsIn:tryCount:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 tryCount:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  WBSAutoFillTestController *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v12;
  -[WBSPageTestController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v16, "viewportSize");
    v19 = v18;
    v21 = v20;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke;
    v22[3] = &unk_1E4B29CE8;
    v29 = v15;
    v23 = v17;
    v24 = self;
    v25 = v16;
    v26 = v13;
    v27 = v25;
    v30 = a6;
    v28 = v14;
    objc_msgSend(v23, "pageTestController:resizeViewport:completionHandler:", self, v22, v19, v21);

  }
  else
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "pageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2;
    v8[3] = &unk_1E4B29CC0;
    v9 = *(id *)(a1 + 56);
    v6 = *(id *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 88);
    v7 = *(_QWORD *)(a1 + 40);
    v10 = v6;
    v11 = v7;
    v12 = *(id *)(a1 + 72);
    v14 = *(id *)(a1 + 80);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v3, "pageTestController:navigateAndCaptureFormsMetadataForURL:completionHandler:", v4, v5, v8);

  }
}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  dispatch_time_t v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int8x16_t v49;
  void *v50;
  int8x16_t v51;
  void *v52;
  _QWORD v53[4];
  int8x16_t v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  _QWORD block[4];
  int8x16_t v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  const __CFString *v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
    goto LABEL_9;
  v7 = WBS_LOG_CHANNEL_PREFIXTest();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_2(a1, v7, (uint64_t)v6);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = WBS_LOG_CHANNEL_PREFIXTest();
  v10 = v9;
  if (v8 <= 2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      objc_msgSend(v11, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v13;
      v70 = 2114;
      v71 = v14;
      _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_DEFAULT, "Error has been detected for test %{public}@/%{public}@. Retrying.", buf, 0x16u);

    }
    v15 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_5;
    block[3] = &unk_1E4B29C98;
    v49 = *(int8x16_t *)(a1 + 40);
    v16 = (id)v49.i64[0];
    v61 = vextq_s8(v49, v49, 8uLL);
    v62 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 56);
    v19 = *(void **)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 80);
    v63 = v17;
    v65 = v18;
    v64 = v19;
    dispatch_after(v15, MEMORY[0x1E0C80D38], block);

    goto LABEL_21;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_1(a1, v10);
    if (!v5)
      goto LABEL_18;
  }
  else
  {
LABEL_9:
    if (!v5)
      goto LABEL_18;
  }
  v20 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(*(id *)(a1 + 64), "expectedResultsURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v22 = (void *)objc_msgSend(v20, "initWithContentsOfURL:options:error:", v21, 1, &v59);
  v23 = v59;

  if (v23)
    objc_msgSend(*(id *)(a1 + 56), "reportError:forStage:forTest:inBundle:", v23, CFSTR("AutoFill"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  +[WBSFormAutoFillTestSupport stringRepresentationFromMetadataProvider:](WBSFormAutoFillTestSupport, "stringRepresentationFromMetadataProvider:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v22, 4);
  v26 = objc_msgSend(v25, "isEqualToString:", v24);
  if ((v26 & 1) == 0 && *(_QWORD *)(a1 + 80) <= 2uLL)
  {
    v27 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v50 = v25;
      v28 = *(void **)(a1 + 32);
      v29 = v27;
      objc_msgSend(v28, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v30;
      v70 = 2114;
      v71 = v31;
      _os_log_impl(&dword_1A3D90000, v29, OS_LOG_TYPE_DEFAULT, "Test %{public}@/%{public}@ expected and actual results differed. Retrying.", buf, 0x16u);

      v25 = v50;
    }
    v32 = dispatch_time(0, 2000000000);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_9;
    v53[3] = &unk_1E4B29C98;
    v51 = *(int8x16_t *)(a1 + 40);
    v33 = (id)v51.i64[0];
    v54 = vextq_s8(v51, v51, 8uLL);
    v55 = *(id *)(a1 + 32);
    v34 = *(id *)(a1 + 56);
    v36 = *(void **)(a1 + 72);
    v35 = *(_QWORD *)(a1 + 80);
    v56 = v34;
    v58 = v35;
    v57 = v36;
    dispatch_after(v32, MEMORY[0x1E0C80D38], v53);

    goto LABEL_21;
  }
  v52 = v25;
  v37 = *(void **)(a1 + 56);
  objc_msgSend(v24, "dataUsingEncoding:", 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "expectedResultsURL");
  v48 = v23;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastPathComponent");
  v47 = v24;
  v40 = v5;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v42 = v22;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "reportActualResults:expectedResults:expectedResultsName:uniformTypeIdentifier:forStage:forTest:inBundle:", v38, v42, v41, v43, *(_QWORD *)(a1 + 32));

  v44 = *(void **)(a1 + 56);
  v66 = CFSTR("overall");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "reportPerformance:forStage:forTest:inBundle:", v46, CFSTR("AutoFill"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));

  v5 = v40;
LABEL_18:
  if (v6)
    objc_msgSend(*(id *)(a1 + 56), "reportError:forStage:forTest:inBundle:", v6, CFSTR("AutoFill"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_21:

}

uint64_t __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runTest:bundle:storeResultsIn:tryCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1, *(_QWORD *)(a1 + 64));
}

uint64_t __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runTest:bundle:storeResultsIn:tryCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1, *(_QWORD *)(a1 + 64));
}

- (void)prepareSuiteWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, _QWORD))a3;
  -[WBSPageTestController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "pageTestControllerInitializeApp:completionHandler:", self, v4);
  else
    v4[2](v4, 0);

}

- (void)cleanSuiteWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  -[WBSPageTestController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageTestControllerTerminateApp:", self);

  v5[2](v5, 0);
}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_ERROR, "Too many consecutive errors for test %{public}@/%{public}@. Failing.", (uint8_t *)&v7, 0x16u);

}

void __86__WBSAutoFillTestController_runTest_bundle_storeResultsIn_tryCount_completionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v7;
  v11 = 2114;
  v12 = v8;
  v13 = 2114;
  v14 = a3;
  _os_log_error_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_ERROR, "Test %{public}@/%{public}@ reported error: %{public}@", (uint8_t *)&v9, 0x20u);

}

@end

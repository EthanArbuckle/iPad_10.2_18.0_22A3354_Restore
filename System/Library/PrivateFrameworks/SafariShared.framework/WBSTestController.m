@implementation WBSTestController

- (WBSTestController)initWithSuiteURL:(id)a3 bundleNames:(id)a4
{
  id v6;
  id v7;
  WBSTestController *result;
  WBSTestController *v9;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *internalQueue;
  void *v13;
  NSObject *v14;
  WBSTestController *v15;
  WBSTestController *v16;
  WBSTestController *v17;
  _QWORD block[4];
  id v19;
  id v20;
  WBSTestController *v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  result = (WBSTestController *)objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall");
  if ((result & 1) != 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)WBSTestController;
    v9 = -[WBSTestController init](&v22, sel_init);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSTestController.%@.%p.internalQueue"), objc_opt_class(), v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
      internalQueue = v9->_internalQueue;
      v9->_internalQueue = (OS_dispatch_queue *)v11;

      if (v6)
      {
        v13 = (void *)objc_msgSend(v7, "copy");

        v14 = v9->_internalQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke;
        block[3] = &unk_1E4B2A5F8;
        v7 = v13;
        v19 = v7;
        v20 = v6;
        v15 = v9;
        v21 = v15;
        dispatch_async(v14, block);
        v16 = v15;

      }
      else
      {
        v17 = v9;
      }
    }

    return v9;
  }
  else
  {
    __break(0xC471u);
  }
  return result;
}

void __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = objc_msgSend(a1[4], "count");
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_2;
    v15[3] = &unk_1E4B401D0;
    v4 = a1[4];
    v16 = a1[5];
    objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v16;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB34D0];
    v7 = a1[5];
    objc_msgSend(a1[6], "bundleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_bundlesFromDirectory:bundleType:", v7, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_98);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_4;
  v13[3] = &unk_1E4B40238;
  v14 = a1[6];
  objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", v13);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = a1[6];
  v11 = (void *)v10[2];
  v10[2] = v9;

}

id __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB34D0];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithURL:", v6);
  return v7;
}

uint64_t __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __50__WBSTestController_initWithSuiteURL_bundleNames___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleFromNSBundle:", a2);
}

- (void)_runTestsAndStoreResultsIn:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WBSTestController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke;
  v10[3] = &unk_1E4B40350;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  -[WBSTestController prepareSuiteWithCompletionHandler:](self, "prepareSuiteWithCompletionHandler:", v10);

}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportError:forStage:forTest:inBundle:", a2, 0, 0, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(v4 + 8);
    v6 = *(void **)(v4 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_2;
    v15[3] = &unk_1E4B40328;
    v15[4] = v4;
    v16 = v5;
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_10;
    v11[3] = &unk_1E4B2A0F0;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    objc_msgSend(v6, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", v7, v15, v11);

  }
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v6 = a2;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_3;
  v11[3] = &unk_1E4B3FAC0;
  v8 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "prepareBundle:completionHandler:", v10, v11);

}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportError:forStage:forTest:inBundle:", v3, 0, 0, *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    objc_msgSend(*(id *)(a1 + 40), "allTests");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(v6 + 8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_4;
    v16[3] = &unk_1E4B402B0;
    v16[4] = v6;
    v17 = v7;
    v19 = v20;
    v18 = *(id *)(a1 + 32);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_8;
    v11[3] = &unk_1E4B40300;
    v10 = *(int8x16_t *)(a1 + 40);
    v9 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    v13 = *(id *)(a1 + 32);
    v15 = v20;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v4, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", v8, v16, v11);

    _Block_object_dispose(v20, 8);
  }

}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v6 = a2;
  v7 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_5;
  v15[3] = &unk_1E4B40288;
  v8 = (void *)a1[6];
  v21 = a1[7];
  v9 = (void *)a1[4];
  v10 = a1[5];
  v15[1] = 3221225472;
  v16 = v8;
  v17 = v6;
  v11 = (id)a1[5];
  v12 = a1[4];
  v18 = v11;
  v19 = v12;
  v20 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v9, "prepareTest:bundle:completionHandler:", v14, v10, v15);

}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "reportError:forStage:forTest:inBundle:", a2, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "beginTest:inBundle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 48);
    v3 = *(void **)(a1 + 56);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_6;
    v8[3] = &unk_1E4B40288;
    v14 = *(_QWORD *)(a1 + 72);
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = v7;
    objc_msgSend(v3, "runTest:bundle:storeResultsIn:completionHandler:", v6, v4, v9, v8);

  }
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "reportError:forStage:forTest:inBundle:", a2, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "endTest:inBundle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    v3 = *(void **)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_7;
    v6[3] = &unk_1E4B40260;
    v11 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v3, "cleanTest:bundle:completionHandler:", v5, v4, v6);

  }
}

uint64_t __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_7(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "reportError:forStage:forTest:inBundle:", a2, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "endTest:inBundle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_9;
  v6[3] = &unk_1E4B402D8;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v9 = v5;
  objc_msgSend(v2, "cleanBundle:completionHandler:", v3, v6);

}

uint64_t __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportError:forStage:forTest:inBundle:", a2, 0, 0, *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_10(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_11;
  v4[3] = &unk_1E4B2A0F0;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "flushWithCompletionHandler:", v4);

}

void __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_11(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_12;
  v3[3] = &unk_1E4B2B768;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "cleanSuiteWithCompletionHandler:", v3);

}

uint64_t __64__WBSTestController__runTestsAndStoreResultsIn_completionBlock___block_invoke_12(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "reportError:forStage:forTest:inBundle:", a2, 0, 0, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)runTestsAndStoreResultsIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke;
  block[3] = &unk_1E4B3B168;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_cold_1(v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    *(_BYTE *)(v2 + 24) = 1;
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_10;
    v6[3] = &unk_1E4B2A708;
    v6[4] = v4;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_runTestsAndStoreResultsIn:completionBlock:", v5, v6);

  }
}

void __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4B2A708;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSArray)bundles
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__WBSTestController_bundles__block_invoke;
  v5[3] = &unk_1E4B2A8C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __28__WBSTestController_bundles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)bundleType
{
  return 0;
}

- (id)bundleFromNSBundle:(id)a3
{
  return 0;
}

- (void)prepareSuiteWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)cleanSuiteWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)prepareBundle:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)cleanBundle:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)prepareTest:(id)a3 bundle:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)runTest:(id)a3 bundle:(id)a4 storeResultsIn:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)cleanTest:(id)a3 bundle:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (NSURL)suiteURL
{
  return self->_suiteURL;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suiteURL, 0);
  objc_storeStrong((id *)&self->_testBundles, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __65__WBSTestController_runTestsAndStoreResultsIn_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A3D90000, log, OS_LOG_TYPE_FAULT, "Test suite is already running", v1, 2u);
}

@end

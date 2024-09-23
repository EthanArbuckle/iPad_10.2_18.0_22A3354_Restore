@implementation WFPosterService

- (void)fetchEligiblePostersWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getPRSExternalSystemServiceClass_softClass;
  v11 = getPRSExternalSystemServiceClass_softClass;
  if (!getPRSExternalSystemServiceClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPRSExternalSystemServiceClass_block_invoke;
    v7[3] = &unk_1E7AF9520;
    v7[4] = &v8;
    __getPRSExternalSystemServiceClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "fetchEligibleConfigurationsWithCompletion:", v3);

}

- (void)getPostersWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getPRSServiceClass_softClass;
  v15 = getPRSServiceClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getPRSServiceClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getPRSServiceClass_block_invoke;
    v11[3] = &unk_1E7AF9520;
    v11[4] = &v12;
    __getPRSServiceClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v7 = objc_alloc_init(v6);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __51__WFPosterService_getPostersWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E7AF6C78;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "fetchPosterConfigurations:", v9);

}

- (void)findPosterMatchingRepresentation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF8790;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[WFPosterService getPostersWithCompletionHandler:](self, "getPostersWithCompletionHandler:", v10);

}

void __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke_2;
    v8[3] = &unk_1E7AEEE68;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "if_firstObjectPassingTest:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __70__WFPosterService_findPosterMatchingRepresentation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

void __51__WFPosterService_getPostersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  if (v5)
  {
    v3 = (void *)objc_opt_new();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__WFPosterService_getPostersWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E7AEEE40;
    v7 = v3;
    v4 = v3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __51__WFPosterService_getPostersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  WFPosterRepresentation *v8;
  void *v9;
  void *v10;
  WFPosterRepresentation *v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  WFLocalizedString(CFSTR("Wallpaper %ld"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, a3 + 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [WFPosterRepresentation alloc];
  objc_msgSend(v6, "serverUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFPosterRepresentation initWithUUID:name:providerBundleIdentifier:](v8, "initWithUUID:name:providerBundleIdentifier:", v9, v12, v10);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

@end

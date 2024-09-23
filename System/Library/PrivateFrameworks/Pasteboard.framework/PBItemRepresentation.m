@implementation PBItemRepresentation

- (BOOL)isDerivedRepresentation
{
  return self->_derivedRepresentation;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (unint64_t)preferredRepresentation
{
  return self->_preferredRepresentation;
}

- (BOOL)isDataAvailableImmediately
{
  return self->_isDataAvailableImmediately;
}

- (PBItemRepresentation)initWithNSItemRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  PBItemRepresentation *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "preferredRepresentation");
  if (v6 == 2)
    v7 = 2;
  else
    v7 = v6 == 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke;
  v11[3] = &unk_1E2430D28;
  v8 = v4;
  v12 = v8;
  v9 = -[PBItemRepresentation initWithType:preferredRepresentation:v2_loader:](self, "initWithType:preferredRepresentation:v2_loader:", v5, v7, v11);

  if (v9)
  {
    v9->_visibility = objc_msgSend(v8, "visibility");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9->_isDataAvailableImmediately = objc_msgSend(v8, "isDataAvailableImmediately");
  }

  return v9;
}

- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 v2_loader:(id)a5
{
  id v8;
  id v9;
  PBItemRepresentation *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PBItemRepresentation_initWithType_preferredRepresentation_v2_loader___block_invoke;
  v12[3] = &unk_1E2430CD8;
  v13 = v8;
  v9 = v8;
  v10 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](self, "initWithType:preferredRepresentation:v3_loader:", a3, a4, v12);

  return v10;
}

- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 v3_loader:(id)a5
{
  id v9;
  id v10;
  PBItemRepresentation *v11;
  PBItemRepresentation *v12;
  uint64_t v13;
  id loader;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PBItemRepresentation;
  v11 = -[PBItemRepresentation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_typeIdentifier, a3);
    v13 = MEMORY[0x18D782EA4](v10);
    loader = v12->_loader;
    v12->_loader = (id)v13;

    v12->_preferredRepresentation = a4;
  }

  return v12;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setIsDataAvailableImmediately:(BOOL)a3
{
  self->_isDataAvailableImmediately = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataTransferDelegate);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong(&self->_loader, 0);
}

- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PBItemRepresentation *v12;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke;
  v14[3] = &unk_1E2430CB0;
  v15 = v8;
  v9 = v8;
  v10 = a3;
  v11 = (void *)MEMORY[0x18D782EA4](v14);
  v12 = -[PBItemRepresentation initWithType:preferredRepresentation:v2_loader:](self, "initWithType:preferredRepresentation:v2_loader:", v10, a4, v11);

  return v12;
}

id __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_1E2430C88;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x18D782EA4](v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__PBItemRepresentation_initWithType_preferredRepresentation_v2_loader___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke_2;
  v8[3] = &unk_1E2430D00;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadWithOptions_v2:completionHandler:", 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PBSecurityScopedURLWrapper *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  PBSecurityScopedURLWrapper *v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = a2;
    v4 = [PBSecurityScopedURLWrapper alloc];
    objc_msgSend(v3, "urlWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBSecurityScopedURLWrapper initWithNSURLWrapper:](v4, "initWithNSURLWrapper:", v5);

    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cleanupHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *, PBSecurityScopedURLWrapper *, _QWORD, void *, void *))(v6 + 16))(v6, v7, v10, 0, v8, v9);
  }
}

- (id)copyWithDoNothingLoaderBlock
{
  id v3;
  NSString *typeIdentifier;
  unint64_t v5;
  id result;
  _QWORD v7[5];

  v3 = objc_alloc((Class)objc_opt_class());
  typeIdentifier = self->_typeIdentifier;
  v5 = -[PBItemRepresentation preferredRepresentation](self, "preferredRepresentation");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PBItemRepresentation_copyWithDoNothingLoaderBlock__block_invoke;
  v7[3] = &unk_1E2430D28;
  v7[4] = self;
  result = (id)objc_msgSend(v3, "initWithType:preferredRepresentation:v2_loader:", typeIdentifier, v5, v7);
  *((_QWORD *)result + 4) = self->_preferredRepresentation;
  *((_QWORD *)result + 5) = self->_visibility;
  *((_BYTE *)result + 16) = self->_isDataAvailableImmediately;
  return result;
}

uint64_t __52__PBItemRepresentation_copyWithDoNothingLoaderBlock__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  PBCannotLoadRepresentationError(v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *, _QWORD))a2)[2](v4, 0, 0, 0, v5, 0);

  return 0;
}

- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v33 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke;
  v29[3] = &unk_1E2430D50;
  v31 = v32;
  v9 = v6;
  v30 = v9;
  objc_msgSend(v7, "setCancellationHandler:", v29);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v15 = v8;
  v16 = 3221225472;
  v17 = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_8;
  v18 = &unk_1E2430DC8;
  v21 = &v23;
  v11 = v5;
  v20 = v11;
  v12 = v10;
  v19 = v12;
  v22 = v32;
  _os_activity_initiate(&dword_18C53A000, "loading item", OS_ACTIVITY_FLAG_DEFAULT, &v15);

  v13 = v24[5];
  if (v13)
    objc_msgSend(v7, "addChild:withPendingUnitCount:", v13, 100, v15, v16, v17, v18);
  else
    objc_msgSend(v7, "addChild:withPendingUnitCount:", v12, 100, v15, v16, v17, v18);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(v32, 8);
  return v7;
}

void __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2;
  v3[3] = &unk_1E2430D50;
  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  v4 = v2;
  PBDispatchAsyncCallback(v3);

}

uint64_t __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2_9;
  v8[3] = &unk_1E2430DA0;
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v9 = v3;
  v10 = v4;
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3;
  v7[3] = &unk_1E2430D78;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v8 = v4;
  v6 = v3;
  PBDispatchAsyncCallback(v7);

}

uint64_t __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_loadWithContext:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  PBCallbackSerialization *v8;
  uint64_t v9;
  PBCallbackSerialization *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  PBCallbackSerialization *v30;
  PBItemRepresentation *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(PBCallbackSerialization);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__12;
  v36[4] = __Block_byref_object_dispose__13;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  v9 = MEMORY[0x1E0C809B0];
  v35 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke;
  v29[3] = &unk_1E2430E18;
  v32 = v34;
  v10 = v8;
  v30 = v10;
  v31 = self;
  v33 = v36;
  v11 = (void *)MEMORY[0x18D782EA4](v29);
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3;
  v24[3] = &unk_1E2430EB8;
  v24[4] = self;
  v12 = v6;
  v25 = v12;
  v28 = v36;
  v26 = v7;
  v27 = v11;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4_19;
  v21[3] = &unk_1E2430EE0;
  v13 = v26;
  v22 = v13;
  v14 = v27;
  v23 = v14;
  -[PBItemRepresentation performProgressTrackingWithLoaderBlock:onCancelCallback:](self, "performProgressTrackingWithLoaderBlock:onCancelCallback:", v24, v21);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7_22;
  v19[3] = &unk_1E2430F08;
  v19[4] = self;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  -[PBCallbackSerialization sendBeginBlock:](v10, "sendBeginBlock:", v19);
  v16 = v20;
  v17 = v15;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  return v17;
}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;
  _QWORD v4[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "totalUnitCount"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2;
  v4[3] = &unk_1E2430DF0;
  v2 = (void *)a1[4];
  v4[4] = a1[5];
  objc_msgSend(v2, "sendEndBlock:", v4);
  result = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemRepresentationFinishedDataTransfer:", *(_QWORD *)(a1 + 32));

}

id __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4;
  v9[3] = &unk_1E2430E68;
  v13 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v5 + 16))(v5, v4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void (*v20)(uint64_t, _QWORD *);
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = MEMORY[0x18D782EA4](a6);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5;
  v25[3] = &unk_1E2430E40;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v29 = v14;
  v30 = v19;
  v26 = v11;
  v27 = v12;
  v28 = v13;
  v31 = *(id *)(a1 + 48);
  v20 = *(void (**)(uint64_t, _QWORD *))(v18 + 16);
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v11;
  v20(v18, v25);

}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6;
    v6[3] = &unk_1E2431110;
    v7 = *(id *)(a1 + 72);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(v1 + 16))(v1, v2, v3, v4, v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7;
  v1[3] = &unk_1E2431110;
  v2 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback(v1);

}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2_16;
    v4[3] = &unk_1E2431110;
    v5 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *, _QWORD *))(v2 + 16))(v2, 0, 0, 0, v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2_16(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3_17;
  v1[3] = &unk_1E2431110;
  v2 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback(v1);

}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4_19(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    PBDataTransferCancelledError(0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5_20;
    v4[3] = &unk_1E2431110;
    v5 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *, _QWORD *))(v2 + 16))(v2, 0, 0, 0, v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5_20(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6_21;
  v1[3] = &unk_1E2431110;
  v2 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback(v1);

}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7_22(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemRepresentation:beganDataTransferWithProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)loadWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PBItemRepresentation_loadWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E2430F30;
  v9 = v4;
  v5 = v4;
  -[PBItemRepresentation loadWithContext:completionHandler:](self, "loadWithContext:completionHandler:", 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __50__PBItemRepresentation_loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)loadWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke;
  v10[3] = &unk_1E2430F30;
  v11 = v6;
  v7 = v6;
  -[PBItemRepresentation _loadWithContext:completionBlock:](self, "_loadWithContext:completionBlock:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(void **)(a1 + 32);
  if (v16)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke_2;
    v17[3] = &unk_1E2430E40;
    v22 = v16;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    v21 = v14;
    v23 = v15;
    PBDispatchAsyncCallback(v17);

  }
}

uint64_t __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7], a1[9]);
}

- (void)setLoaderBlock:(id)a3
{
  void *v4;
  id loader;

  v4 = (void *)MEMORY[0x18D782EA4](a3, a2);
  loader = self->_loader;
  self->_loader = v4;

}

- (id)loadDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PBItemRepresentation_loadDataWithCompletion___block_invoke;
  v8[3] = &unk_1E2430F58;
  v9 = v4;
  v5 = v4;
  -[PBItemRepresentation loadDataWithDetailedCompletion:](self, "loadDataWithDetailedCompletion:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __47__PBItemRepresentation_loadDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)loadDataWithDetailedCompletion:(id)a3
{
  return -[PBItemRepresentation loadDataWithContext:completion:](self, "loadDataWithContext:completion:", 0, a3);
}

- (id)loadDataWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PBItemRepresentation preferredRepresentation](self, "preferredRepresentation");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke;
  v17[3] = &unk_1E2430FF8;
  v17[4] = self;
  v19 = v7;
  v10 = v9;
  v18 = v10;
  v11 = v7;
  -[PBItemRepresentation _loadWithContext:completionBlock:](self, "_loadWithContext:completionBlock:", v6, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (-[PBItemRepresentation preferredRepresentation](self, "preferredRepresentation") == 2)
    {
      objc_msgSend(v8, "addChild:withPendingUnitCount:", v12, 10);
      v13 = v8;
      v14 = v10;
      v15 = 90;
    }
    else
    {
      objc_msgSend(v8, "addChild:withPendingUnitCount:", v12, 50);
      v13 = v8;
      v14 = v10;
      v15 = 50;
    }
  }
  else
  {
    v13 = v8;
    v14 = v12;
    v15 = 100;
  }
  objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, v15);

  return v8;
}

void __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[5];
  id v39;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy_;
  v38[4] = __Block_byref_object_dispose_;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v16 = v14;
  v37 = v16;
  if (v16)
    goto LABEL_5;
  if (v11)
  {
    v17 = v11;
    v18 = 0;
    v16 = 0;
    v39 = v17;
LABEL_4:

    goto LABEL_5;
  }
  if (v12)
  {
    objc_msgSend(v12, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_2;
    v28[3] = &unk_1E2430FA8;
    v28[4] = *(_QWORD *)(a1 + 32);
    v30 = *(id *)(a1 + 48);
    v29 = v13;
    v31 = v15;
    PBCoordinatedReadForUploading(v19, v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", v20, 100);
    v16 = 0;
    goto LABEL_6;
  }
  PBNoLoaderAvailableError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v16);
    v21 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v33[5];
    v33[5] = v21;
    goto LABEL_4;
  }
LABEL_5:
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_4;
  v22[3] = &unk_1E2430FD0;
  v24 = *(id *)(a1 + 48);
  v26 = v38;
  v23 = v13;
  v27 = &v32;
  v25 = v15;
  PBDispatchAsyncCallback(v22);

LABEL_6:
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(v38, 8);
}

void __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = (uint64_t)v6;
  v8 = 0;
  v9 = v6;
  if (v5 && !v6)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v26 = 0;
    PBCloneToTemporaryDir(v5, v10, &v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v26;
    if (v11)
      v13 = v12 == 0;
    else
      v13 = 0;
    if (v13)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v11, 8, &v25);
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = v25;
    }
    else
    {
      v9 = v12;
      v14 = 0;
      v8 = 0;
      if (!v11)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtURL:error:", v11, 0);

    v8 = v14;
LABEL_11:

  }
  if (v9)
  {
    PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v9);
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = v16;
  }
  if (!(v8 | v7))
  {
    PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_3;
  v19[3] = &unk_1E2430F80;
  v23 = *(id *)(a1 + 48);
  v20 = (id)v8;
  v21 = *(id *)(a1 + 40);
  v22 = (id)v7;
  v24 = *(id *)(a1 + 56);
  v17 = (id)v7;
  v18 = (id)v8;
  PBDispatchAsyncCallback(v19);

}

uint64_t __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[7];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
  result = a1[8];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[4], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)loadFileCopyWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PBItemRepresentation_loadFileCopyWithCompletion___block_invoke;
  v8[3] = &unk_1E2431020;
  v9 = v4;
  v5 = v4;
  -[PBItemRepresentation loadFileCopyWithDetailedCompletion:](self, "loadFileCopyWithDetailedCompletion:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __51__PBItemRepresentation_loadFileCopyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)loadFileCopyWithDetailedCompletion:(id)a3
{
  return -[PBItemRepresentation loadFileCopyWithContext:completion:](self, "loadFileCopyWithContext:completion:", 0, a3);
}

- (id)loadFileCopyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PBItemRepresentation preferredRepresentation](self, "preferredRepresentation");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke;
  v17[3] = &unk_1E2430FF8;
  v17[4] = self;
  v19 = v7;
  v10 = v9;
  v18 = v10;
  v11 = v7;
  -[PBItemRepresentation _loadWithContext:completionBlock:](self, "_loadWithContext:completionBlock:", v6, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (-[PBItemRepresentation preferredRepresentation](self, "preferredRepresentation") == 2)
    {
      objc_msgSend(v8, "addChild:withPendingUnitCount:", v12, 10);
      v13 = v8;
      v14 = v10;
      v15 = 90;
    }
    else
    {
      objc_msgSend(v8, "addChild:withPendingUnitCount:", v12, 50);
      v13 = v8;
      v14 = v10;
      v15 = 50;
    }
  }
  else
  {
    v13 = v8;
    v14 = v12;
    v15 = 100;
  }
  objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, v15);

  return v8;
}

void __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[16];

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v14;
  v17 = v16;
  if (v16)
  {
    v18 = 0;
    v19 = v16;
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_3;
    v31[3] = &unk_1E2430F80;
    v28 = *(id *)(a1 + 48);
    v32 = v18;
    v33 = v13;
    v34 = v19;
    v35 = v28;
    v36 = v15;
    v29 = v15;
    v30 = v13;
    v24 = v19;
    v25 = v18;
    PBDispatchAsyncCallback(v31);

    goto LABEL_17;
  }
  if (v11)
  {
    CPTemporaryFileWithUniqueName();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v11, "writeToURL:atomically:", v18, 1);
      v20 = v18;
      v21 = 0;
    }
    else
    {
      _PBLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18C53A000, v27, OS_LOG_TYPE_FAULT, "Cannot create temporary file.", buf, 2u);
      }

      PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v21)
      goto LABEL_12;
    goto LABEL_14;
  }
  if (!v12)
  {
    PBNoLoaderAvailableError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (v21)
    {
LABEL_12:
      PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v12, "url");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_28;
  v37[3] = &unk_1E2431048;
  v37[4] = *(_QWORD *)(a1 + 32);
  v38 = v12;
  v23 = *(id *)(a1 + 48);
  v39 = v13;
  v40 = v23;
  v41 = v15;
  v24 = v15;
  v25 = v13;
  PBCoordinatedRead(v22, v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:", v26, 100);
LABEL_17:

}

void __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  v8 = v5;
  if (a2 && !v5)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v23 = 0;
    PBCloneToTemporaryDir(a2, v9, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23;
    if (v10)
      v12 = v11 == 0;
    else
      v12 = 0;
    if (v12)
    {
      v7 = v10;
      v8 = 0;
    }
    else
    {
      v13 = v11;
      objc_msgSend(*(id *)(a1 + 40), "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PBCannotCopyFileError(v14, 0, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v7 = 0;
    }
    v6 = 0;
    goto LABEL_12;
  }
LABEL_13:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_2;
  v17[3] = &unk_1E2430F80;
  v21 = *(id *)(a1 + 56);
  v18 = v7;
  v19 = *(id *)(a1 + 48);
  v20 = v6;
  v22 = *(id *)(a1 + 64);
  v15 = v6;
  v16 = v7;
  PBDispatchAsyncCallback(v17);

}

uint64_t __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = a1[7];
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
    if (a1[4])
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeItemAtURL:error:", a1[4], 0);

    }
  }
  result = a1[8];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = a1[7];
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
    if (a1[4])
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeItemAtURL:error:", a1[4], 0);

    }
  }
  result = a1[8];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)loadOpenInPlaceWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PBItemRepresentation_loadOpenInPlaceWithCompletion___block_invoke;
  v8[3] = &unk_1E2431070;
  v9 = v4;
  v5 = v4;
  -[PBItemRepresentation loadOpenInPlaceWithDetailedCompletion:](self, "loadOpenInPlaceWithDetailedCompletion:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__PBItemRepresentation_loadOpenInPlaceWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)loadOpenInPlaceWithDetailedCompletion:(id)a3
{
  return -[PBItemRepresentation loadOpenInPlaceWithContext:completion:](self, "loadOpenInPlaceWithContext:completion:", 0, a3);
}

- (id)loadOpenInPlaceWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke;
  v10[3] = &unk_1E24310E8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[PBItemRepresentation _loadWithContext:completionBlock:](self, "_loadWithContext:completionBlock:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[16];

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v14;
  v17 = v16;
  if (v16)
  {
    v18 = 0;
    LOBYTE(v19) = 0;
    v20 = v16;
    goto LABEL_3;
  }
  if (v11)
  {
    CPTemporaryFileWithUniqueName();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (objc_msgSend(v11, "writeToURL:atomically:", v21, 1))
      {
        v18 = v21;
        v19 = 0;
        goto LABEL_22;
      }
      _PBLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18C53A000, v32, OS_LOG_TYPE_FAULT, "Could not write data to temporary file.", buf, 2u);
      }

      PBCannotCopyFileError(0, 0, 0);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _PBLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18C53A000, v30, OS_LOG_TYPE_FAULT, "Could not create temporary file.", buf, 2u);
      }

      PBCannotCreateTemporaryFile(0, 0);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (id)v31;
    v18 = 0;
LABEL_22:

    if (v19)
      goto LABEL_23;
LABEL_27:
    v20 = 0;
    goto LABEL_3;
  }
  if (v12)
  {
    v22 = objc_msgSend(v12, "isReadonly");
    objc_msgSend(v12, "url");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;
    if (!v22)
    {
      v20 = 0;
      LOBYTE(v19) = 1;
      goto LABEL_3;
    }
    v24 = objc_msgSend(v23, "startAccessingSecurityScopedResource");

    v25 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    objc_msgSend(v12, "url");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_31;
    v40[3] = &unk_1E2431098;
    v27 = *(void **)(a1 + 40);
    v40[4] = *(_QWORD *)(a1 + 32);
    v42 = v27;
    v41 = v13;
    v43 = v15;
    objc_msgSend(v25, "coordinateReadingItemAtURL:options:error:byAccessor:", v26, 1, &v44, v40);
    v19 = v44;

    if (v24)
    {
      objc_msgSend(v12, "url");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stopAccessingSecurityScopedResource");

    }
    v18 = 0;
    if (!v19)
    {
      v20 = 0;
      goto LABEL_4;
    }
    v29 = 0;
    goto LABEL_24;
  }
  PBNoLoaderAvailableError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (!v19)
    goto LABEL_27;
LABEL_23:
  v29 = 1;
LABEL_24:
  PBCannotLoadRepresentationError(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!v29)
    goto LABEL_4;
  LOBYTE(v19) = 0;
LABEL_3:
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_3;
  v33[3] = &unk_1E24310C0;
  v37 = *(id *)(a1 + 40);
  v18 = v18;
  v34 = v18;
  v39 = (char)v19;
  v35 = v13;
  v20 = v20;
  v36 = v20;
  v38 = v15;
  PBDispatchAsyncCallback(v33);

LABEL_4:
}

void __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v19 = 0;
    PBCloneToTemporaryDir(v3, v5, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v10 = v6;
      v9 = 0;
    }
    else
    {
      v9 = v7;
      if (!v7)
      {
        PBCannotCopyFileError(v4, 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = 0;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_2;
    v13[3] = &unk_1E2430F80;
    v17 = *(id *)(a1 + 48);
    v14 = v10;
    v15 = *(id *)(a1 + 40);
    v16 = v9;
    v18 = *(id *)(a1 + 56);
    v11 = v9;
    v12 = v10;
    PBDispatchAsyncCallback(v13);

  }
}

uint64_t __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[7];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], 0, a1[5], a1[6]);
  result = a1[8];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPreferredRepresentation:(unint64_t)a3
{
  self->_preferredRepresentation = a3;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (void)setDerivedRepresentation:(BOOL)a3
{
  self->_derivedRepresentation = a3;
}

- (PBItemRepresentationDataTransferDelegate)dataTransferDelegate
{
  return (PBItemRepresentationDataTransferDelegate *)objc_loadWeakRetained((id *)&self->_dataTransferDelegate);
}

- (void)setDataTransferDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataTransferDelegate, a3);
}

@end

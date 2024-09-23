@implementation RadioLoadStoreBagRequest

void __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = a2;
  v6 = -[RadioStoreBag _initWithURLBag:]([RadioStoreBag alloc], "_initWithURLBag:", v5);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v6, v8);

}

- (void)loadStoreBagWithOptions:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  char v15;

  v5 = a4;
  v6 = ((unint64_t)a3 >> 1) & 1;
  v7 = objc_alloc(MEMORY[0x24BEC89F8]);
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke;
  v14[3] = &__block_descriptor_33_e31_v16__0__ICStoreRequestContext_8l;
  v15 = v6;
  v9 = (void *)objc_msgSend(v7, "initWithBlock:", v14);
  objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke_2;
  v12[3] = &unk_24CA2EAB0;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v10, "getBagForRequestContext:forceRefetch:withCompletionHandler:", v9, v6, v12);

}

void __70__RadioLoadStoreBagRequest_loadStoreBagWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEC8A58];
  v5 = a2;
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentity:", v4);

  objc_msgSend(v5, "setAllowsExpiredBags:", *(_BYTE *)(a1 + 32) == 0);
}

- (BOOL)ignoresRadioDiskCache
{
  return *(&self->super._asynchronousBackgroundRequest + 1);
}

- (void)setIgnoresRadioDiskCache:(BOOL)a3
{
  *(&self->super._asynchronousBackgroundRequest + 1) = a3;
}

@end

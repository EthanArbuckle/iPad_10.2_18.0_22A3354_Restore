@implementation WFHomeKitAccessResource

- (unint64_t)status
{
  unsigned int v2;

  v2 = softLinkTCCAccessPreflight((uint64_t)CFSTR("kTCCServiceWillow"), 0);
  if (v2 > 2)
    return 1;
  else
    return qword_1C1B47DF0[v2];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.Home");
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (*v6)(uint64_t, uint64_t, void *);
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v8[3] = &unk_1E7AF07E0;
  v8[4] = self;
  v9 = v5;
  v6 = (void (*)(uint64_t, uint64_t, void *))softLinkTCCAccessRequest;
  v7 = v5;
  v6((uint64_t)CFSTR("kTCCServiceWillow"), 0, v8);

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  void *v4;
  void (**completionHandler)(id, uint64_t, _QWORD);

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventObserver:", self);

  -[WFResource refreshAvailabilityWithForcedNotification](self, "refreshAvailabilityWithForcedNotification");
  completionHandler = (void (**)(id, uint64_t, _QWORD))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 1, 0);
    completionHandler = (void (**)(id, uint64_t, _QWORD))self->_completionHandler;
  }
  self->_completionHandler = 0;

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

void __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  block[3] = &unk_1E7AF5B48;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__WFHomeKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

    +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEventObserver:", *(_QWORD *)(a1 + 32));

    +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
    (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) != 0, 0);
  }
}

@end

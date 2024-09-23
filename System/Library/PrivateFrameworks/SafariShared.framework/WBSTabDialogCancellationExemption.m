@implementation WBSTabDialogCancellationExemption

- (WBSTabDialogCancellationExemption)init
{

  return 0;
}

- (WBSTabDialogCancellationExemption)initWithCancellationHandler:(id)a3
{
  id v4;
  WBSTabDialogCancellationExemption *v5;
  uint64_t v6;
  id cancellationExemptionHandler;
  WBSTabDialogCancellationExemption *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTabDialogCancellationExemption;
  v5 = -[WBSTabDialogCancellationExemption init](&v10, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1A8599ED0](v4);
    cancellationExemptionHandler = v5->_cancellationExemptionHandler;
    v5->_cancellationExemptionHandler = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isExemptFromCancellationInContext:(id)a3
{
  return (*((uint64_t (**)(void))self->_cancellationExemptionHandler + 2))();
}

+ (id)provisionalNavigationExemption
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCancellationHandler:", &__block_literal_global_97);
}

uint64_t __67__WBSTabDialogCancellationExemption_provisionalNavigationExemption__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "reason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("WBSTabDialogCancellationReasonProvisionalNavigation"));

  return v3;
}

+ (id)committedNavigationExemption
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCancellationHandler:", &__block_literal_global_1_0);
}

uint64_t __65__WBSTabDialogCancellationExemption_committedNavigationExemption__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "reason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("WBSTabDialogCancellationReasonCommittedNavigation"));

  return v3;
}

+ (id)sameOriginNavigationExemption:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__WBSTabDialogCancellationExemption_sameOriginNavigationExemption___block_invoke;
  v9[3] = &unk_1E4B3FFF8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithCancellationHandler:", v9);

  return v7;
}

uint64_t __67__WBSTabDialogCancellationExemption_sameOriginNavigationExemption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("WBSTabDialogCancellationReasonCommittedNavigation"));

  if (v5)
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_URLForKey:", CFSTR("WBSTabDialogCancellationReasonCommittedNavigationCurrentURLKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "safari_hasSameOriginAsURL:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationExemptionHandler, 0);
}

@end

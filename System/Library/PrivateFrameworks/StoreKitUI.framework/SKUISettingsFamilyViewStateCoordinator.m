@implementation SKUISettingsFamilyViewStateCoordinator

- (void)checkSettingsFamilyViewStateWithBlock:(id)a3
{
  id v4;
  void *v5;
  id completionBlock;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsFamilyViewStateCoordinator checkSettingsFamilyViewStateWithBlock:].cold.1();
  }
  v5 = (void *)objc_msgSend(v4, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v5;

  -[SKUISettingsFamilyViewStateCoordinator _getSubscriptionStatus](self, "_getSubscriptionStatus");
}

- (void)_checkSubscriptionStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  uint64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "accountStatus") != 3 || !objc_msgSend(v7, "isFamilySubscription"))
    goto LABEL_8;
  if (!objc_msgSend(v7, "hasFamily"))
  {
    v6 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isFamilyOrganizer"))
  {
    if (objc_msgSend(v7, "hasFamilyMembers"))
      v6 = 3;
    else
      v6 = 2;
  }
  else
  {
LABEL_8:
    v6 = 0;
  }
LABEL_9:
  -[SKUISettingsFamilyViewStateCoordinator _returnFamilyViewState:](self, "_returnFamilyViewState:", v6);

}

- (void)_getSubscriptionStatus
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DAF6D0], "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SKUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke;
  v4[3] = &unk_1E73A95A8;
  v4[4] = self;
  objc_msgSend(v3, "getStatusWithOptions:statusBlock:", 0, v4);

}

void __64__SKUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v7 = a2;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__SKUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke_2;
  v11[3] = &unk_1E73A9580;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v14 = a3;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __64__SKUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkSubscriptionStatus:isFinal:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_returnFamilyViewState:(int64_t)a3
{
  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

- (void)checkSettingsFamilyViewStateWithBlock:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISettingsFamilyViewStateCoordinator checkSettingsFamilyViewStateWithBlock:]";
}

@end

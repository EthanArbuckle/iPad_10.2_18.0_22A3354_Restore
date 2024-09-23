@implementation NCNotificationBannerAuthority

+ (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0DC6008], "requesterIdentifier");
}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  int64_t v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = objc_opt_class();
  v11 = v8;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  if (v13 && (objc_msgSend(v13, "isStaticContentLoadingComplete") & 1) == 0)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __107__NCNotificationBannerAuthority_shouldPresentPresentable_withPresentedPresentables_responsiblePresentable___block_invoke;
    v16[3] = &unk_1E8D1DE68;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v17, "loadStaticContentWithCompletion:", v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v14 = -1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __107__NCNotificationBannerAuthority_shouldPresentPresentable_withPresentedPresentables_responsiblePresentable___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "bannerAuthority:mayChangeDecisionForResponsiblePresentable:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC6008], "requesterIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requesterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "viewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_class();
      v14 = v12;
      if (v13)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v16 = v15;

      objc_msgSend(v16, "notificationViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v16) = objc_msgSend(v17, "hasCommittedToPresentingCustomContentProvidingViewController");
      v10 = v16;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

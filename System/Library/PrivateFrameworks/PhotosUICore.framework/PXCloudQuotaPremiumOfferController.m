@implementation PXCloudQuotaPremiumOfferController

- (PXCloudQuotaPremiumOfferController)init
{
  PXCloudQuotaPremiumOfferController *v2;
  uint64_t v3;
  PXCloudQuotaPremiumOfferProvider *premiumOfferProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCloudQuotaPremiumOfferController;
  v2 = -[PXCloudQuotaController init](&v6, sel_init);
  if (v2)
  {
    +[PXCloudQuotaPremiumOfferProvider currentPremiumOfferProvider](PXCloudQuotaPremiumOfferProvider, "currentPremiumOfferProvider");
    v3 = objc_claimAutoreleasedReturnValue();
    premiumOfferProvider = v2->_premiumOfferProvider;
    v2->_premiumOfferProvider = (PXCloudQuotaPremiumOfferProvider *)v3;

    -[PXCloudQuotaPremiumOfferProvider registerChangeObserver:context:](v2->_premiumOfferProvider, "registerChangeObserver:context:", v2, PXCloudQuotaOfferProviderObservationContext_42201);
    -[PXCloudQuotaPremiumOfferController _updateInformationView](v2, "_updateInformationView");
  }
  return v2;
}

- (void)_updateInformationView
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  PXCloudQuotaTileView *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE buf[24];
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXCloudQuotaPremiumOfferProvider premiumOffer](self->_premiumOfferProvider, "premiumOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PLUserStatusGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = v5;
      PXCloudQuotaOfferDebugDescription(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v18 = v7;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Create view for premium offer:%{public}@", buf, 0x20u);

    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v8 = (void *)getICQTileViewClass_softClass;
    v16 = getICQTileViewClass_softClass;
    if (!getICQTileViewClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getICQTileViewClass_block_invoke;
      v18 = &unk_1E51482E0;
      v19 = &v13;
      __getICQTileViewClass_block_invoke((uint64_t)buf);
      v8 = (void *)v14[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v13, 8);
    v10 = [v9 alloc];
    v11 = (void *)objc_msgSend(v10, "initWithPremiumOffer:", v3, v13);
    objc_msgSend(v11, "setDelegate:", self);
    v12 = -[PXCloudQuotaTileView initWithTileView:]([PXCloudQuotaTileView alloc], "initWithTileView:", v11);

  }
  else
  {
    v12 = 0;
  }
  -[PXCloudQuotaController setInformationView:](self, "setInformationView:", v12);

}

- (id)presentingViewControllerForTileView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserStatusGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "offer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXCloudQuotaOfferDebugDescription(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller for premium offer:%{public}@", (uint8_t *)&v10, 0xCu);

  }
  -[PXCloudQuotaController presentingViewControllerForInformationView](self, "presentingViewControllerForInformationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)tileView:(id)a3 performAction:(int64_t)a4 parameters:(id)a5
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXCloudQuotaOfferProviderObservationContext_42201 == a5)
    -[PXCloudQuotaPremiumOfferController _updateInformationView](self, "_updateInformationView", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_premiumOfferProvider, 0);
}

@end

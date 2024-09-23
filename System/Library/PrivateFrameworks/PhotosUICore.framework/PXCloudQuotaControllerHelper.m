@implementation PXCloudQuotaControllerHelper

- (PXCloudQuotaControllerHelper)init
{
  return (PXCloudQuotaControllerHelper *)-[PXCloudQuotaControllerHelper initForDismissibleOffers:](self, "initForDismissibleOffers:", 0);
}

- (id)initForDismissibleOffers:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  PXCloudQuotaControllerHelper *v9;
  PXCloudQuotaOfferController *v10;
  PXCloudQuotaOfferController *offerController;
  PXCloudQuotaPremiumOfferController *v12;
  PXCloudQuotaPremiumOfferController *premiumOfferController;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  PXCloudQuotaControllerHelper *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    v7 = CFSTR("non-dismissible");
    *(_DWORD *)buf = 138543874;
    v17 = v6;
    if (v3)
      v7 = CFSTR("dismissible");
    v18 = 2048;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    v8 = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> init %@", buf, 0x20u);

  }
  v15.receiver = self;
  v15.super_class = (Class)PXCloudQuotaControllerHelper;
  v9 = -[PXCloudQuotaControllerHelper init](&v15, sel_init);
  if (v9)
  {
    v10 = -[PXCloudQuotaOfferController initForDismissibleOffers:]([PXCloudQuotaOfferController alloc], "initForDismissibleOffers:", v3);
    offerController = v9->_offerController;
    v9->_offerController = v10;

    -[PXCloudQuotaController setDelegate:](v9->_offerController, "setDelegate:", v9);
    v12 = objc_alloc_init(PXCloudQuotaPremiumOfferController);
    premiumOfferController = v9->_premiumOfferController;
    v9->_premiumOfferController = v12;

    -[PXCloudQuotaController setDelegate:](v9->_premiumOfferController, "setDelegate:", v9);
    v9->_dismissibleOffers = v3;
  }
  return v9;
}

- (BOOL)hasAnyInformationViews
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PXCloudQuotaController informationView](self->_offerController, "informationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[PXCloudQuotaController informationView](self->_premiumOfferController, "informationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (UIView)informationView
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  PXCloudQuotaControllerHelper *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PXCloudQuotaController informationView](self->_offerController, "informationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCloudQuotaControllerHelper premiumInformationView](self, "premiumInformationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v3)
  {
    PLUserStatusUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = self;
      v6 = v9;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Both offer and premium offer available. Will only use premium offer", (uint8_t *)&v8, 0x16u);

    }
    v3 = 0;
  }
  return (UIView *)v3;
}

- (UIView)premiumInformationView
{
  return -[PXCloudQuotaController informationView](self->_premiumOfferController, "informationView");
}

- (void)cloudQuotaController:(id)a3 informationViewDidChange:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PXCloudQuotaControllerHelper delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudQuotaControllerHelper:informationViewDidChange:", self, v5);

}

- (id)presentingViewControllerForCloudQuotaController:(id)a3
{
  void *v4;
  void *v5;

  -[PXCloudQuotaControllerHelper delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForCloudQuotaControllerHelper:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXCloudQuotaControllerHelperDelegate)delegate
{
  return (PXCloudQuotaControllerHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)dismissibleOffers
{
  return self->_dismissibleOffers;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_premiumOfferController, 0);
  objc_storeStrong((id *)&self->_offerController, 0);
}

@end

@implementation PXCloudQuotaOfferController

- (PXCloudQuotaOfferController)init
{
  return (PXCloudQuotaOfferController *)-[PXCloudQuotaOfferController initForDismissibleOffers:](self, "initForDismissibleOffers:", 0);
}

- (id)initForDismissibleOffers:(BOOL)a3
{
  PXCloudQuotaOfferController *v4;
  id *p_isa;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXCloudQuotaOfferController;
  v4 = -[PXCloudQuotaController init](&v11, sel_init);
  p_isa = (id *)&v4->super.super.isa;
  if (v4)
  {
    v4->_dismissibleOffers = a3;
    +[PXCloudQuotaOfferProvider currentOfferProvider](PXCloudQuotaOfferProvider, "currentOfferProvider");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = p_isa[3];
    p_isa[3] = (id)v6;

    objc_msgSend(p_isa[3], "registerChangeObserver:context:", p_isa, PXCloudQuotaOfferProviderObservationContext_110411);
    objc_msgSend(p_isa, "_updateInformationView");
    +[PXCPLStatusSettings sharedInstance](PXCPLStatusSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addDeferredKeyObserver:", p_isa);

    _SharedDefaults();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", p_isa, CFSTR("PXCloudQuotaControllerOfferLevelMock"), 0, &PXCloudQuotaOfferControllerUserDefaultsContext);

  }
  return p_isa;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  PXCloudQuotaOfferController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2048;
    v10 = self;
    v4 = v8;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> dealloc", buf, 0x16u);

  }
  _SharedDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("PXCloudQuotaControllerOfferLevelMock"), &PXCloudQuotaOfferControllerUserDefaultsContext);

  v6.receiver = self;
  v6.super_class = (Class)PXCloudQuotaOfferController;
  -[PXCloudQuotaOfferController dealloc](&v6, sel_dealloc);
}

- (int64_t)_mockOfferLevel
{
  void *v2;
  int64_t v3;
  void *v4;
  void *v5;

  +[PXCPLStatusSettings sharedInstance](PXCPLStatusSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudQuotaOfferLevel");
  if (!v3)
  {
    _SharedDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", CFSTR("PXCloudQuotaControllerOfferLevelMock"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("no-offer")) & 1) != 0)
    {
      v3 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("almost-full")) & 1) != 0)
    {
      v3 = 2;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("full")))
    {
      v3 = 3;
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)_updateInformationView
{
  int64_t v3;
  int64_t v4;
  NSObject *v5;
  id v6;
  PXCloudQuotaMockView *v7;
  void *v8;
  objc_class *v9;
  BOOL v10;
  PXCloudQuotaOfferProvider *offerProvider;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  const __CFString *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v3 = -[PXCloudQuotaOfferController _mockOfferLevel](self, "_mockOfferLevel");
  if (v3)
  {
    v4 = v3;
    if (v3 == 1)
    {
      PLUserStatusGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        v6 = *(id *)&buf[4];
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Mock showing no information banner!", buf, 0x16u);

      }
      v7 = 0;
    }
    else
    {
      PLUserStatusGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        v13 = *(id *)&buf[4];
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Create mock information banner!", buf, 0x16u);

      }
      v7 = -[PXCloudQuotaMockView initWithCloudQuotaFull:]([PXCloudQuotaMockView alloc], "initWithCloudQuotaFull:", v4 == 3);
    }
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v8 = (void *)getICQBannerViewClass_softClass_110415;
    v29 = getICQBannerViewClass_softClass_110415;
    if (!getICQBannerViewClass_softClass_110415)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getICQBannerViewClass_block_invoke_110416;
      v31 = (const __CFString *)&unk_1E51482E0;
      v32[0] = &v26;
      __getICQBannerViewClass_block_invoke_110416((uint64_t)buf);
      v8 = (void *)v27[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v26, 8);
    v10 = -[PXCloudQuotaOfferController dismissibleOffers](self, "dismissibleOffers", v26);
    offerProvider = self->_offerProvider;
    if (v10)
      -[PXCloudQuotaOfferProvider dismissibleOffer](offerProvider, "dismissibleOffer");
    else
      -[PXCloudQuotaOfferProvider offer](offerProvider, "offer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      PLUserStatusGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_opt_class();
        v17 = v16;
        if (-[PXCloudQuotaOfferController dismissibleOffers](self, "dismissibleOffers"))
          v18 = CFSTR("dismissible");
        else
          v18 = CFSTR("non-dismissible");
        PXCloudQuotaOfferDebugDescription(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        v31 = v18;
        LOWORD(v32[0]) = 2114;
        *(_QWORD *)((char *)v32 + 2) = v19;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Create information banner for %@ offer:%{public}@", buf, 0x2Au);

      }
      v20 = -[PXCloudQuotaOfferController dismissibleOffers](self, "dismissibleOffers");
      v21 = [v9 alloc];
      if (v20)
        v22 = (void *)objc_msgSend(v21, "initWithDismissibleOffer:", v14);
      else
        v22 = (void *)objc_msgSend(v21, "initWithOffer:", v14);
      v23 = v22;
      objc_msgSend(v22, "setDelegate:", self);
      v7 = -[PXCloudQuotaBannerView initWithBannerView:]([PXCloudQuotaBannerView alloc], "initWithBannerView:", v23);
      v24 = objc_msgSend(v14, "level") - 1;
      if (v24 > 2)
        v25 = 0;
      else
        v25 = qword_1A7C08F90[v24];
      -[PXCloudQuotaView setOfferLevel:](v7, "setOfferLevel:", v25);

    }
    else
    {
      v7 = 0;
    }

  }
  -[PXCloudQuotaController setInformationView:](self, "setInformationView:", v7);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXCloudQuotaOfferProviderObservationContext_110411 == a5)
    -[PXCloudQuotaOfferController _updateInformationView](self, "_updateInformationView", a3, a4);
}

- (id)presentingViewControllerForBannerView:(id)a3
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
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller for offer:%{public}@", (uint8_t *)&v10, 0xCu);

  }
  -[PXCloudQuotaController presentingViewControllerForInformationView](self, "presentingViewControllerForInformationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (a6 == &PXCloudQuotaOfferControllerUserDefaultsContext)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PXCloudQuotaOfferController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCloudQuotaOfferController;
    -[PXCloudQuotaOfferController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a4;
  NSStringFromSelector(sel_cloudQuotaOfferLevel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    -[PXCloudQuotaOfferController _updateInformationView](self, "_updateInformationView");
}

- (BOOL)dismissibleOffers
{
  return self->_dismissibleOffers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerProvider, 0);
}

uint64_t __78__PXCloudQuotaOfferController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInformationView");
}

@end

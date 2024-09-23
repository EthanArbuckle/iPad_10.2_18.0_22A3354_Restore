@implementation VUIPurchaseRequest

- (VUIPurchaseRequest)initWithBuyParams:(id)a3 ofPurchaseType:(int64_t)a4
{
  id v7;
  VUIPurchaseRequest *v8;
  VUIPurchaseRequest *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSString *enhancedBuyParamsString;
  uint64_t v14;
  AMSBuyParams *amsBuyParams;
  uint64_t v16;
  AMSPurchase *purchase;
  AMSPurchase *v18;
  void *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  int64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUIPurchaseRequest;
  v8 = -[VUIPurchaseRequest init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_buyParamsString, a3);
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v24 = a4;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIPurchaseRequest - new request type: %ld, %@", buf, 0x16u);
    }

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getMetricsEnhancedBuyParams:", v9->_buyParamsString);
    v12 = objc_claimAutoreleasedReturnValue();
    enhancedBuyParamsString = v9->_enhancedBuyParamsString;
    v9->_enhancedBuyParamsString = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CFDA08], "buyParamsWithString:", v9->_enhancedBuyParamsString);
    v14 = objc_claimAutoreleasedReturnValue();
    amsBuyParams = v9->_amsBuyParams;
    v9->_amsBuyParams = (AMSBuyParams *)v14;

    v9->_purchaseType = 0;
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VUIPurchaseRequest initWithBuyParams:ofPurchaseType:].cold.1();
    }
    else
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDBE0]), "initWithPurchaseType:buyParams:", v9->_purchaseType, v9->_amsBuyParams);
      purchase = v9->_purchase;
      v9->_purchase = (AMSPurchase *)v16;

      v18 = v9->_purchase;
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ams_activeiTunesAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSPurchase setAccount:](v18, "setAccount:", v20);

      -[AMSPurchase setRequiresAccount:](v9->_purchase, "setRequiresAccount:", 1);
      -[AMSPurchase setUserInitiated:](v9->_purchase, "setUserInitiated:", 1);
    }
  }

  return v9;
}

- (void)enqueueWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  +[VUIPurchaser sharedInstance](VUIPurchaser, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPurchaseRequest setCompletionHandler:](self, "setCompletionHandler:", v4);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__VUIPurchaseRequest_enqueueWithCompletion___block_invoke;
  v6[3] = &unk_1E9F9B308;
  v6[4] = self;
  objc_msgSend(v5, "enqueuePurchase:withCompletion:", self, v6);

}

void __44__VUIPurchaseRequest_enqueueWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "responseDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "handleRequestCompletionWithResult:andError:", v6, v5);

}

- (void)handleRequestCompletionWithResult:(id)a3 andError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIPurchaseRequest - Purchase completed: %@, %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __65__VUIPurchaseRequest_handleRequestCompletionWithResult_andError___block_invoke;
  v14 = &unk_1E9F99000;
  objc_copyWeak(&v17, (id *)buf);
  v9 = v6;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v11 = v12;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v13((uint64_t)v11);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  -[VUIPurchaseRequest _recordErrorLog:](self, "_recordErrorLog:", v10);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __65__VUIPurchaseRequest_handleRequestCompletionWithResult_andError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "completionHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (int64_t)getPurchaseTypeFromActionRef:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  int64_t v6;

  v3 = getPurchaseTypeFromActionRef__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&getPurchaseTypeFromActionRef__onceToken, &__block_literal_global_27);
  objc_msgSend((id)getPurchaseTypeFromActionRef__sCommerceActionRefToPurchaseType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

void __51__VUIPurchaseRequest_getPurchaseTypeFromActionRef___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("actionRefGet");
  v2[1] = CFSTR("actionRefBuy");
  v3[0] = &unk_1EA0B9250;
  v3[1] = &unk_1EA0B9250;
  v2[2] = CFSTR("actionRefRentWatchNow");
  v2[3] = CFSTR("actionRefComplete");
  v3[2] = &unk_1EA0B9250;
  v3[3] = &unk_1EA0B9250;
  v2[4] = CFSTR("actionRefUpdate");
  v2[5] = CFSTR("actionRefRent");
  v3[4] = &unk_1EA0B9250;
  v3[5] = &unk_1EA0B9250;
  v2[6] = CFSTR("actionRefPreorder");
  v2[7] = CFSTR("actionRefSubscribe");
  v3[6] = &unk_1EA0B9250;
  v3[7] = &unk_1EA0B9268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getPurchaseTypeFromActionRef__sCommerceActionRefToPurchaseType;
  getPurchaseTypeFromActionRef__sCommerceActionRefToPurchaseType = v0;

}

+ (BOOL)shouldPlayWhenDoneForActionRef:(id)a3
{
  return 0;
}

- (void)_recordErrorLog:(id)a3
{
  void *v4;
  int64_t type;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *enhancedBuyParamsString;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    type = self->_type;
    v6 = a3;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - %ld"), CFSTR("commerce transaction failure"), type);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E9FF3598;
    v27[0] = v9;
    v26[0] = CFSTR("message");
    v26[1] = CFSTR("errorCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v6, "code"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1E9FF3598;
    v27[1] = v12;
    v26[2] = CFSTR("errorDomain");
    objc_msgSend(v6, "domain");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = &stru_1E9FF3598;
    v26[3] = CFSTR("buyParams");
    enhancedBuyParamsString = (const __CFString *)self->_enhancedBuyParamsString;
    if (!enhancedBuyParamsString)
      enhancedBuyParamsString = &stru_1E9FF3598;
    v27[2] = v15;
    v27[3] = enhancedBuyParamsString;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AMSServerErrorCode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v24[0] = CFSTR("underlyingErrorCode");
      v24[1] = CFSTR("underlyingErrorDomain");
      v25[0] = v19;
      v25[1] = CFSTR("AMSServerError");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addEntriesFromDictionary:", v20);
      v22 = objc_msgSend(v21, "copy");

      v17 = (void *)v22;
    }
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "recordLog:", v17);

  }
}

- (AMSPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (NSString)buyParamsString
{
  return self->_buyParamsString;
}

- (void)setBuyParamsString:(id)a3
{
  objc_storeStrong((id *)&self->_buyParamsString, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)enhancedBuyParamsString
{
  return self->_enhancedBuyParamsString;
}

- (void)setEnhancedBuyParamsString:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedBuyParamsString, a3);
}

- (AMSBuyParams)amsBuyParams
{
  return self->_amsBuyParams;
}

- (void)setAmsBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_amsBuyParams, a3);
}

- (int64_t)purchaseType
{
  return self->_purchaseType;
}

- (void)setPurchaseType:(int64_t)a3
{
  self->_purchaseType = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_amsBuyParams, 0);
  objc_storeStrong((id *)&self->_enhancedBuyParamsString, 0);
  objc_storeStrong((id *)&self->_buyParamsString, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
}

- (void)initWithBuyParams:ofPurchaseType:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D96EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "NativeFaro is currently only supported on macos.", v0, 2u);
}

@end

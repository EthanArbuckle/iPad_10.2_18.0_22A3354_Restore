@implementation PKPassFooterView

- (PKPassFooterView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKPassFooterView)init
{
  PKPassFooterView *v2;
  dispatch_group_t v3;
  OS_dispatch_group *sessionDelayGroup;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassFooterView;
  v2 = -[PKPassFooterView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = dispatch_group_create();
    sessionDelayGroup = v2->_sessionDelayGroup;
    v2->_sessionDelayGroup = (OS_dispatch_group *)v3;

    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v2->_isBackgrounded = (objc_msgSend(v5, "registerObserver:", v2) & 1) == 0;
      v2->_isAssistantActive = (objc_msgSend(v6, "registerDeactivationObserver:", v2) & 0x10) != 0;
    }

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  PKPassFooterContentView *contentView;
  objc_super v7;

  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "unregisterObserver:", self);
    objc_msgSend(v4, "unregisterDeactivationObserver:", self);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  contentView = self->_contentView;
  if (contentView)
  {
    -[PKPassFooterContentView setDelegate:](contentView, "setDelegate:", 0);
    -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", 0, 0);
  }
  -[PKPassFooterView invalidate](self, "invalidate");

  v7.receiver = self;
  v7.super_class = (Class)PKPassFooterView;
  -[PKPassFooterView dealloc](&v7, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPassFooterView;
  -[PKPassFooterView layoutSubviews](&v11, sel_layoutSubviews);
  -[PKPassFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPassFooterContentView setFrame:](self->_contentView, "setFrame:");
  -[PKPassFooterContentView setFrame:](self->_fadingContentView, "setFrame:", v4, v6, v8, v10);
}

- (void)willBecomeVisibleAnimated:(BOOL)a3
{
  -[PKPassFooterView _advanceVisibilityToState:animated:](self, "_advanceVisibilityToState:animated:", 1, a3);
}

- (void)willBecomeHiddenAnimated:(BOOL)a3
{
  -[PKPassFooterView _advanceVisibilityToState:animated:](self, "_advanceVisibilityToState:animated:", 3, a3);
}

- (void)didBecomeVisibleAnimated:(BOOL)a3
{
  -[PKPassFooterView _advanceVisibilityToState:animated:](self, "_advanceVisibilityToState:animated:", 2, a3);
}

- (void)didBecomeHiddenAnimated:(BOOL)a3
{
  -[PKPassFooterView _advanceVisibilityToState:animated:](self, "_advanceVisibilityToState:animated:", 0, a3);
}

- (void)configureWithConfiguration:(id)a3 context:(id)a4 options:(id)a5
{
  char v5;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id *v20;
  __CFString *v21;
  unint64_t v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  id v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[3];

  v5 = (char)a5;
  v44[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (PKEqualObjects())
    v10 = (v5 & 2) == 0;
  else
    v10 = 0;
  if (!v10)
  {
    -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFooterView _configureWithConfiguration:context:animated:](self, "_configureWithConfiguration:context:animated:", v8, v9, v5 & 1);
    -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = v11 == v12;
    else
      v14 = 1;
    if (v14 || objc_msgSend(v12, "style") == 8)
      goto LABEL_36;
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68C20], *MEMORY[0x1E0D68AA0]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68FF0], *MEMORY[0x1E0D68F50]);
    v16 = v15;
    v17 = v13;
    v18 = v17;
    if (!v16)
    {
LABEL_35:

      v41 = (void *)MEMORY[0x1E0D66A58];
      v42 = *MEMORY[0x1E0D69940];
      v44[0] = *MEMORY[0x1E0D698E8];
      v44[1] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "subjects:sendEvent:", v43, v16);

LABEL_36:
      goto LABEL_37;
    }
    v19 = objc_msgSend(v17, "passType");
    v20 = (id *)MEMORY[0x1E0D69618];
    if ((unint64_t)(v19 + 1) >= 3)
      v21 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    else
      v21 = off_1E3E7A158[v19 + 1];
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D69040]);

    v22 = objc_msgSend(v18, "style");
    if (v22 < 0xD && ((0x13FFu >> v22) & 1) != 0)
      v23 = off_1E3E7A170[v22];
    else
      v23 = (__CFString *)*v20;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D69038]);

    objc_msgSend(v18, "nfcPayload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D69000]);

    v26 = v18;
    if (objc_msgSend(v26, "passType") == 1)
    {
      objc_msgSend(v26, "secureElementPass");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "cardType");
      if (v28 <= 4)
        v25 = (__CFString *)**((id **)&unk_1E3E7A1D8 + v28);

    }
    else
    {
      v25 = CFSTR("other");
    }

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D69028]);
    objc_msgSend(v26, "secureElementPass");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isIdentityPass"))
    {
      v30 = objc_msgSend(v29, "identityType");
      if ((unint64_t)(v30 - 1) < 3)
      {
        v31 = off_1E3E7A200[v30 - 1];
        goto LABEL_30;
      }
    }
    else if (objc_msgSend(v29, "isAccessPass"))
    {
      v32 = objc_msgSend(v29, "accessType");
      if (v32 < 7)
      {
        v31 = off_1E3E7A218[v32];
        goto LABEL_30;
      }
    }
    v31 = (__CFString *)*v20;
LABEL_30:

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D69020]);
    objc_msgSend(v26, "secureElementPass");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "devicePaymentApplications");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D68940]);
    objc_msgSend(v26, "secureElementPass");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *v20;
    objc_msgSend(v36, "organizationName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "length"))
    {
      v39 = objc_msgSend(v36, "cardType");
      if (v39 == 4 || v39 == 2)
      {
        v40 = v38;

        v37 = v40;
      }
    }

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D68D88]);
    goto LABEL_35;
  }
LABEL_37:

}

- (void)invalidate
{
  NSObject *v3;
  NFAssertion *informativeAssertion;
  NFAssertion *v5;
  int v6;
  PKPassFooterView *v7;
  __int16 v8;
  NFAssertion *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134349056;
      v7 = self;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): invalidated.", (uint8_t *)&v6, 0xCu);
    }

    self->_invalidated = 1;
    -[PKPassFooterView _endSessionStartTimer](self, "_endSessionStartTimer");
    -[PKPassFooterView _endSession](self, "_endSession");
    informativeAssertion = self->_informativeAssertion;
    if (informativeAssertion)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v6 = 134349312;
        v7 = self;
        v8 = 2048;
        v9 = informativeAssertion;
        _os_log_debug_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEBUG, "PKPassFooterView (%{public}p): releasing nearfield informative assertion %p.", (uint8_t *)&v6, 0x16u);
      }

      InvalidateAssertion(self->_informativeAssertion);
      v5 = self->_informativeAssertion;
      self->_informativeAssertion = 0;

    }
    if (self->_contentView || self->_fadingContentView)
      -[PKPassFooterView _setContentView:animated:](self, "_setContentView:animated:", 0, 0);
  }
}

- (BOOL)isPassAuthorized
{
  return -[PKPassFooterContentView isPassAuthorized](self->_contentView, "isPassAuthorized");
}

- (BOOL)requestPileSuppression
{
  return -[PKPassFooterContentView requestPileSuppression](self->_contentView, "requestPileSuppression");
}

- (BOOL)isViewCurrentContentView:(id)a3
{
  return self->_contentView == a3;
}

- (void)showFullScreenBarcode
{
  -[PKPassFooterContentView showFullScreenBarcode](self->_contentView, "showFullScreenBarcode");
}

- (void)passFooterContentViewDidAuthenticate:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;

  -[PKPassFooterViewConfiguration passView](self->_configuration, "passView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAuthenticate");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "passFooterViewDidSucceedAtAuthorization:", self);
      v6 = v8;
    }
  }

}

- (void)passFooterContentViewDidTransact:(id)a3 success:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id WeakRetained;
  void *v8;
  char v9;
  void *v10;

  v4 = a4;
  -[PKPassFooterViewConfiguration passView](self->_configuration, "passView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didTransact");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v9 = objc_opt_respondsToSelector();
    v8 = v10;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v10, "passFooterViewDidTransact:success:", self, v4);
      v8 = v10;
    }
  }

}

- (void)passFooterContentView:(id)a3 didAuthorizeAndRetrieveDecryptedBarcode:(id)a4
{
  PKPassFooterViewConfiguration *configuration;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;

  configuration = self->_configuration;
  v6 = a4;
  -[PKPassFooterViewConfiguration passView](configuration, "passView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaymentBarcodeData:", v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v10 = objc_opt_respondsToSelector();
    v9 = v11;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "passFooterViewDidSucceedAtAuthorization:", self);
      v9 = v11;
    }
  }

}

- (void)passFooterContentViewDidInvalidateAuthorization:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;

  -[PKPassFooterViewConfiguration passView](self->_configuration, "passView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaymentBarcodeData:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "passFooterViewDidEndAuthorization:", self);
      v6 = v8;
    }
  }

}

- (void)passFooterContentViewRequestsSessionSuppression:(id)a3
{
  OS_dispatch_group *v4;
  dispatch_time_t v5;
  OS_dispatch_group *v6;
  _QWORD block[4];
  OS_dispatch_group *v8;

  -[PKPassFooterView _endSessionStartTimer](self, "_endSessionStartTimer", a3);
  -[PKPassFooterView _endSession](self, "_endSession");
  v4 = self->_sessionDelayGroup;
  dispatch_group_enter((dispatch_group_t)v4);
  v5 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKPassFooterView_passFooterContentViewRequestsSessionSuppression___block_invoke;
  block[3] = &unk_1E3E612E8;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  -[PKPassFooterView _configureWithConfiguration:context:animated:](self, "_configureWithConfiguration:context:animated:", self->_configuration, 0, 1);

}

void __68__PKPassFooterView_passFooterContentViewRequestsSessionSuppression___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)passFooterContentViewDidChangePhysicalButtonRequirement:(id)a3
{
  if (self->_contentView == a3)
    -[PKPassFooterView _setPhysicalButtonRequired:](self, "_setPhysicalButtonRequired:", objc_msgSend(a3, "isPhysicalButtonRequired"));
}

- (void)passFooterContentViewDidChangeCoachingState:(id)a3
{
  if (self->_contentView == a3)
    -[PKPassFooterView _setCoachingState:](self, "_setCoachingState:", objc_msgSend(a3, "coachingState"));
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  BOOL var0;
  id v6;
  id v7;

  var0 = a4.var0;
  v6 = a3;
  if (!self->_isBackgrounded != var0)
  {
    v7 = v6;
    self->_isBackgrounded = !var0;
    if (var0)
      -[PKPassFooterView _updateForForegroundActivePresentationIfNecessaryAnimated:](self, "_updateForForegroundActivePresentationIfNecessaryAnimated:", 0);
    else
      -[PKPassFooterView _updateForNonForegroundActivePresentationAnimated:](self, "_updateForNonForegroundActivePresentationAnimated:", 0);
    v6 = v7;
  }

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4
{
  char v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  if (((v4 & 0x10) == 0) != !self->_isAssistantActive)
  {
    v7 = v6;
    self->_isAssistantActive = (v4 & 0x10) >> 4;
    if ((v4 & 0x10) != 0)
      -[PKPassFooterView _updateForNonForegroundActivePresentationAnimated:](self, "_updateForNonForegroundActivePresentationAnimated:", 1);
    else
      -[PKPassFooterView _updateForForegroundActivePresentationIfNecessaryAnimated:](self, "_updateForForegroundActivePresentationIfNecessaryAnimated:", 1);
    v6 = v7;
  }

}

- (BOOL)isPassFooterContentViewInGroup:(id)a3
{
  PKPassFooterView *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "isPassFooterViewInGroup:", v3);

  return (char)v3;
}

- (unint64_t)suppressedContentForContentView:(id)a3
{
  id WeakRetained;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "suppressedContentForPassFooter:", self);

  return v5;
}

- (void)passFooterContentViewDidChangePileSuppressionRequirement:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "passFooterViewDidChangePileSuppressionRequirement:", self);

}

- (void)_updateForForegroundActivePresentationIfNecessaryAnimated:(BOOL)a3
{
  if (!self->_isBackgrounded && !self->_isAssistantActive)
    -[PKPassFooterView _configureWithConfiguration:context:animated:](self, "_configureWithConfiguration:context:animated:", self->_configuration, 0, 0);
}

- (void)_updateForNonForegroundActivePresentationAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PKPassFooterView _endSessionStartTimer](self, "_endSessionStartTimer");
  -[PKPassFooterView _endSession](self, "_endSession");
  -[PKPassFooterView _setContentView:animated:](self, "_setContentView:animated:", 0, v3);
}

- (void)_configureWithConfiguration:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  PKPassFooterViewConfiguration **p_configuration;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NFAssertion *informativeAssertion;
  void *v16;
  NFAssertion *v17;
  NFAssertion *v18;
  NSObject *v19;
  NSObject *v20;
  NFAssertion *v21;
  NSObject *v22;
  void *v23;
  PKPassBarcodeFooterView *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int IsPersonalized;
  id v30;
  _BOOL4 v31;
  id v32;
  uint8_t buf[4];
  PKPassFooterView *v34;
  __int16 v35;
  NFAssertion *v36;
  uint64_t v37;

  v31 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self->_invalidated)
    v9 = 0;
  else
    v9 = v7;
  p_configuration = &self->_configuration;
  objc_storeStrong((id *)&self->_configuration, v9);
  -[PKPassFooterView _endSessionStartTimer](self, "_endSessionStartTimer");
  -[PKPassFooterView _endSession](self, "_endSession");
  -[PKPassFooterViewConfiguration passView](self->_configuration, "passView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "passType") == 1)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;
  informativeAssertion = self->_informativeAssertion;
  if (v12)
  {
    if (informativeAssertion)
      goto LABEL_21;
    v30 = v8;
    objc_msgSend((id)PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v16, "requestAssertion:error:", 3, &v32);
    v17 = (NFAssertion *)objc_claimAutoreleasedReturnValue();
    v18 = (NFAssertion *)v32;

    PKLogFacilityTypeGetObject();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        v34 = self;
        v35 = 2048;
        v36 = v17;
        _os_log_debug_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEBUG, "PKPassFooterView (%{public}p): acquired nearfield informative assertion %p.", buf, 0x16u);
      }

      v21 = v17;
      v20 = self->_informativeAssertion;
      self->_informativeAssertion = v21;
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v34 = self;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): failed to acquire nearfield informative assertion - %@.", buf, 0x16u);
    }

    v8 = v30;
  }
  else
  {
    if (!informativeAssertion)
      goto LABEL_21;
    PKLogFacilityTypeGetObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v34 = self;
      v35 = 2048;
      v36 = informativeAssertion;
      _os_log_debug_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEBUG, "PKPassFooterView (%{public}p): releasing nearfield informative assertion %p.", buf, 0x16u);
    }

    InvalidateAssertion(self->_informativeAssertion);
    v18 = self->_informativeAssertion;
    self->_informativeAssertion = 0;
  }

LABEL_21:
  if (*p_configuration)
  {
    v23 = 0;
    switch(-[PKPassFooterViewConfiguration state](*p_configuration, "state"))
    {
      case 0:
        v24 = -[PKPassFooterContentView initWithPass:presentationContext:]([PKPassBarcodeFooterView alloc], "initWithPass:presentationContext:", v12, 0);
        goto LABEL_33;
      case 1:
        if (!v11)
          break;
        -[PKPassFooterView _messageForPaymentApplicationState](self, "_messageForPaymentApplicationState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassFooterView _messageContentViewFromMessage:](self, "_messageContentViewFromMessage:", v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          goto LABEL_39;
        objc_msgSend(v14, "devicePrimaryBarcodePaymentApplication");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "state");
        if (PKPaymentApplicationStateIsPersonalized())
        {

        }
        else
        {
          objc_msgSend(v14, "effectiveContactlessPaymentApplicationState");
          IsPersonalized = PKPaymentApplicationStateIsPersonalized();

          if (!IsPersonalized)
            break;
        }
        -[PKPassFooterView _configureForPersonalizedPaymentApplicationWithContext:](self, "_configureForPersonalizedPaymentApplicationWithContext:", v8);
        break;
      case 2:
        if (v11)
          -[PKPassFooterView _configureForValueAddedServiceWithContext:](self, "_configureForValueAddedServiceWithContext:", v8);
        break;
      case 3:
        -[PKPassFooterView _messageForRestrictedState](self, "_messageForRestrictedState");
        v27 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 4:
        v24 = -[PKPassPaymentConfirmationView initWithPass:passView:context:]([PKPassPaymentConfirmationView alloc], "initWithPass:passView:context:", v14, v11, v8);
LABEL_33:
        v23 = v24;
        goto LABEL_39;
      case 6:
        -[PKPassFooterView _messageForPeerPaymentZeroBalance](self, "_messageForPeerPaymentZeroBalance");
        v27 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      case 7:
        -[PKPassFooterView _messageForPeerPaymentLockedByOwner](self, "_messageForPeerPaymentLockedByOwner");
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_35:
        v28 = (void *)v27;
        -[PKPassFooterView _messageContentViewFromMessage:](self, "_messageContentViewFromMessage:", v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_39;
      default:
        goto LABEL_39;
    }
  }
  v23 = 0;
LABEL_39:
  -[PKPassFooterView _setContentView:animated:](self, "_setContentView:animated:", v23, v31);

}

- (void)_startContactlessInterfaceSessionWithContext:(id)a3 shouldForceSessionAcquisition:(BOOL)a4 sessionAvailable:(id)a5 sessionUnavailable:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *sessionDelayGroup;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  OS_dispatch_source *v21;
  OS_dispatch_source *sessionStartTimer;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  id v26;
  id v28;
  _QWORD handler[4];
  id v30;
  _QWORD *v31;
  id v32[2];
  _QWORD block[4];
  id v34;
  id v35;
  PKPassFooterView *v36;
  id v37;
  id v38;
  _QWORD *v39;
  id v40[2];
  BOOL v41;
  _QWORD v42[3];
  char v43;
  id location[2];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  -[PKPassFooterView _endSessionStartTimer](self, "_endSessionStartTimer");
  -[PKPassFooterView _endSession](self, "_endSession");
  objc_msgSend(v9, "backgroundSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0D672B0]);
  if (*(_OWORD *)&self->_contentView == 0 && PKUserIntentIsAvailable())
  {
    -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassFooterView _setPhysicalButtonRequired:](self, "_setPhysicalButtonRequired:", +[PKPassPaymentContainerView initialPhysicalButtonRequiredAssumptionForPass:context:paymentService:](PKPassPaymentContainerView, "initialPhysicalButtonRequiredAssumptionForPass:context:paymentService:", v14, v9, v13));

  }
  objc_initWeak(location, self);
  v15 = (void *)(self->_sessionToken + 1);
  self->_sessionToken = (unint64_t)v15;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  self->_acquiringSession = 1;
  v43 = 0;
  sessionDelayGroup = self->_sessionDelayGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke;
  block[3] = &unk_1E3E7A008;
  objc_copyWeak(v40, location);
  v40[1] = v15;
  v34 = v12;
  v35 = v13;
  v37 = v10;
  v39 = v42;
  v17 = v11;
  v38 = v17;
  v36 = self;
  v41 = a4;
  v28 = v13;
  v18 = v10;
  v19 = v12;
  v20 = MEMORY[0x1E0C80D38];
  dispatch_group_notify(sessionDelayGroup, MEMORY[0x1E0C80D38], block);
  v21 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v20);
  sessionStartTimer = self->_sessionStartTimer;
  self->_sessionStartTimer = v21;

  v23 = self->_sessionStartTimer;
  v24 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v25 = self->_sessionStartTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_39;
  handler[3] = &unk_1E3E7A030;
  objc_copyWeak(v32, location);
  v32[1] = v15;
  v30 = v17;
  v31 = v42;
  v26 = v17;
  dispatch_source_set_event_handler(v25, handler);
  dispatch_resume((dispatch_object_t)self->_sessionStartTimer);

  objc_destroyWeak(v32);
  objc_destroyWeak(v40);
  _Block_object_dispose(v42, 8);
  objc_destroyWeak(location);

}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22[2];
  char v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  __int128 v27;
  id v28[2];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_2;
    aBlock[3] = &unk_1E3E79FB8;
    objc_copyWeak(v28, v2);
    v28[1] = *(id *)(a1 + 88);
    v26 = *(id *)(a1 + 56);
    v25 = *(id *)(a1 + 40);
    v19 = *(_OWORD *)(a1 + 64);
    v4 = (id)v19;
    v27 = v19;
    v5 = _Block_copy(aBlock);
    v6 = *(void **)(a1 + 32);
    if (!v6)
    {
LABEL_15:
      objc_msgSend(WeakRetained, "_acquireContactlessInterfaceSessionWithSessionToken:shouldForceSessionAcquisition:handler:", *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), v5, v19);
      goto LABEL_16;
    }
    objc_msgSend(v6, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 496), "pass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = v10;
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      if (!v11 || !v12)
      {

LABEL_12:
        PKLogFacilityTypeGetObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v30 = WeakRetained;
          _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%p): error: background session configured for incorrect pass - unwanted transactions may have occurred.", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "invalidate");
        goto LABEL_15;
      }
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_12;
    }
    v15 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_3;
    v20[3] = &unk_1E3E79FE0;
    objc_copyWeak(v22, v2);
    v16 = v5;
    v17 = *(void **)(a1 + 88);
    v21 = v16;
    v22[1] = v17;
    v23 = *(_BYTE *)(a1 + 96);
    objc_msgSend(v15, "claimActiveSessionWithCompletion:", v20);

    objc_destroyWeak(v22);
LABEL_16:

    objc_destroyWeak(v28);
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
LABEL_17:

}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  PKContactlessInterfaceSession *v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 57) == *(_QWORD *)(a1 + 72) && !*((_BYTE *)WeakRetained + 488))
  {
    *((_BYTE *)WeakRetained + 450) = 0;
    objc_msgSend(WeakRetained, "_endSessionStartTimer");
    if (v6 || (PKStoreDemoModeEnabled() & 1) != 0 || PKUIOnlyDemoModeEnabled())
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (!*(_BYTE *)(v5 + 24))
      {
        *(_BYTE *)(v5 + 24) = 1;
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
  }
  else
  {
    InvalidateSession(v6);
  }

}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_3(uint64_t a1, void *a2)
{
  PKContactlessInterfaceSession *v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        v7 = 134217984;
        v8 = WeakRetained;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%p): using background session.", (uint8_t *)&v7, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      if (v6)
      {
        v7 = 134217984;
        v8 = WeakRetained;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%p): failed to acquire background session - falling back.", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(WeakRetained, "_acquireContactlessInterfaceSessionWithSessionToken:shouldForceSessionAcquisition:handler:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    InvalidateSession(v3);
  }

}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_39(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 56);
      v6 = 134349312;
      v7 = WeakRetained;
      v8 = 2050;
      v9 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Contactless payment session acquisition timed-out for token %{public}ld.", (uint8_t *)&v6, 0x16u);
    }

    if (*((_QWORD *)WeakRetained + 57) == *(_QWORD *)(a1 + 56) && !*((_BYTE *)WeakRetained + 488))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (!*(_BYTE *)(v5 + 24))
      {
        *(_BYTE *)(v5 + 24) = 1;
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      objc_msgSend(WeakRetained, "_endSessionStartTimer");
    }
  }

}

- (int64_t)_acquireContactlessInterfaceSessionErrorActionForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;

  v3 = a3;
  if (PKNearFieldRadioIsAvailable())
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
      v7 = objc_msgSend(v3, "code") == 50;
    else
      v7 = 0;
  }
  else
  {
    v7 = 2;
  }

  return v7;
}

- (void)_acquireContactlessInterfaceSessionWithSessionToken:(unint64_t)a3 shouldForceSessionAcquisition:(BOOL)a4 handler:(id)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  PKPaymentSessionHandle *v19;
  PKPaymentSessionHandle *sessionHandle;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[5];
  id v24;
  id v25[2];
  BOOL v26;
  uint8_t buf[4];
  PKPassFooterView *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v5 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    if (self->_sessionToken != a3 || self->_invalidated || self->_isBackgrounded)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:

        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_45;
        v21[3] = &unk_1E3E61590;
        v22 = v8;
        dispatch_async(MEMORY[0x1E0C80D38], v21);

        goto LABEL_9;
      }
      *(_DWORD *)buf = 134349312;
      v28 = self;
      v29 = 2050;
      v30 = a3;
      v10 = "PKPassFooterView (%{public}p): acquisition no longer allowed for token %{public}ld.";
      v11 = v9;
      v12 = 22;
LABEL_7:
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_8;
    }
    if ((PKStoreDemoModeEnabled() & 1) != 0 || (PKUIOnlyDemoModeEnabled() & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      *(_DWORD *)buf = 134349056;
      v28 = self;
      v10 = "PKPassFooterView (%{public}p): skippping contactless payment session aquisition due to demo mode.";
      v11 = v9;
      v12 = 12;
      goto LABEL_7;
    }
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      v28 = self;
      v29 = 2050;
      v30 = a3;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Acquiring contactless payment session for token %{public}ld...", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "passType") == 1)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke;
    aBlock[3] = &unk_1E3E7A080;
    objc_copyWeak(v25, (id *)buf);
    v25[1] = (id)a3;
    v17 = v8;
    v26 = v5;
    aBlock[4] = self;
    v24 = v17;
    v18 = _Block_copy(aBlock);
    if (objc_msgSend(v16, "isCarKeyPass"))
    {
      objc_msgSend(MEMORY[0x1E0D672B8], "startDigitalCarKeySessionWithCompletion:", v18);
      v19 = (PKPaymentSessionHandle *)objc_claimAutoreleasedReturnValue();
    }
    else if ((objc_msgSend(v16, "isCarKeyPass") & 1) != 0 || !objc_msgSend(v16, "hasCredentials"))
    {
      if (v5)
        objc_msgSend(MEMORY[0x1E0D672B8], "forceContactlessInterfaceSessionWithCompletion:", v18);
      else
        objc_msgSend(MEMORY[0x1E0D672B8], "startContactlessInterfaceSessionWithCompletion:", v18);
      v19 = (PKPaymentSessionHandle *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D672B8], "startSTSContactlessInterfaceSessionWithDelegate:completion:", self, v18);
      v19 = (PKPaymentSessionHandle *)objc_claimAutoreleasedReturnValue();
    }
    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = v19;

    objc_destroyWeak(v25);
    objc_destroyWeak((id *)buf);
  }
LABEL_9:

}

void __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16[2];
  char v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_2;
  block[3] = &unk_1E3E7A058;
  objc_copyWeak(v16, (id *)(a1 + 48));
  v16[1] = *(id *)(a1 + 56);
  v12 = v5;
  v7 = *(id *)(a1 + 40);
  v17 = *(_BYTE *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v16);
}

void __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_2(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  char v20;
  uint8_t buf[4];
  _QWORD *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (!WeakRetained || (v5 = WeakRetained[57], v5 != *(_QWORD *)(a1 + 72)) || *((_BYTE *)WeakRetained + 488))
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD **)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 134349312;
      v22 = v7;
      v23 = 2050;
      v24 = v8;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): acquisition no longer allowed for token %{public}ld.", buf, 0x16u);
    }

    InvalidateSession(*(PKContactlessInterfaceSession **)(a1 + 32));
    goto LABEL_7;
  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134349568;
    v22 = v4;
    v23 = 2050;
    v24 = v11;
    v25 = 2050;
    v26 = v5;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Acquired contactless payment session (%{public}p) for token %{public}ld.", buf, 0x20u);
  }

  v12 = (void *)v4[59];
  v4[59] = 0;

  if (*(_QWORD *)(a1 + 32))
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_8;
  }
  v13 = objc_msgSend(v4, "_acquireContactlessInterfaceSessionErrorActionForError:", *(_QWORD *)(a1 + 40));
  switch(v13)
  {
    case 2:
LABEL_7:
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_8:
      v9();
      break;
    case 1:
      v15 = PKCreateAlertControllerForNFCRadioDisabled();
      objc_msgSend(v4, "pkui_viewControllerFromResponderChain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentViewController:animated:completion:", v15, 1, 0);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      break;
    case 0:
      v14 = dispatch_time(0, 2000000000);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_42;
      v17[3] = &unk_1E3E712F8;
      objc_copyWeak(v19, v2);
      v19[1] = *(id *)(a1 + 72);
      v20 = *(_BYTE *)(a1 + 80);
      v18 = *(id *)(a1 + 56);
      dispatch_after(v14, MEMORY[0x1E0C80D38], v17);

      objc_destroyWeak(v19);
      break;
  }

}

void __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_42(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = 134349312;
      v6 = WeakRetained;
      v7 = 2050;
      v8 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Restarting contactless payment session acquisition for token %{public}ld...", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(WeakRetained, "_acquireContactlessInterfaceSessionWithSessionToken:shouldForceSessionAcquisition:handler:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_configureForPersonalizedPaymentApplicationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  id v18;
  PKPassFooterView *v19;
  id v20;
  id v21;
  id location;

  v4 = a3;
  -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "passType") == 1)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke;
  aBlock[3] = &unk_1E3E7A0A8;
  objc_copyWeak(&v21, &location);
  v9 = v7;
  v18 = v9;
  v19 = self;
  v10 = v4;
  v20 = v10;
  v11 = _Block_copy(aBlock);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke_2;
  v15[3] = &unk_1E3E61B68;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  v12 = _Block_copy(v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_msgSend(WeakRetained, "isPassFooterViewInGroup:", self);

  -[PKPassFooterView _startContactlessInterfaceSessionWithContext:shouldForceSessionAcquisition:sessionAvailable:sessionUnavailable:](self, "_startContactlessInterfaceSessionWithContext:shouldForceSessionAcquisition:sessionAvailable:sessionUnavailable:", v10, v14, v11, v12);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKPassPaymentContainerView *v8;
  uint64_t v9;
  void *v10;
  PKPassPaymentContainerView *v11;
  PKContactlessInterfaceSession *v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_canApplyContentViewForPersonalizedApplication"))
  {
    v8 = [PKPassPaymentContainerView alloc];
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "passView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPassPaymentContainerView initWithPass:passView:context:paymentSession:paymentService:](v8, "initWithPass:passView:context:paymentSession:paymentService:", v9, v10, *(_QWORD *)(a1 + 48), v12, v5);

    objc_msgSend(v7, "_setContentView:animated:", v11, 1);
  }
  else
  {
    InvalidateSession(v12);
  }

}

void __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_canApplyContentViewForPersonalizedApplication");
    v3 = v8;
    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "_messageForUnavailableState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_messageContentViewFromMessage:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setContentView:animated:", v7, 1);

      v3 = v8;
    }
  }

}

- (void)_configureForValueAddedServiceWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  PKPassFooterView *v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke;
  aBlock[3] = &unk_1E3E7A0A8;
  objc_copyWeak(&v17, &location);
  v7 = v5;
  v14 = v7;
  v15 = self;
  v8 = v4;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke_2;
  v11[3] = &unk_1E3E61B68;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  v10 = _Block_copy(v11);
  -[PKPassFooterView _startContactlessInterfaceSessionWithContext:shouldForceSessionAcquisition:sessionAvailable:sessionUnavailable:](self, "_startContactlessInterfaceSessionWithContext:shouldForceSessionAcquisition:sessionAvailable:sessionUnavailable:", v8, 0, v9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  PKPassPaymentContainerView *v8;
  uint64_t v9;
  void *v10;
  PKPassPaymentContainerView *v11;
  PKContactlessInterfaceSession *v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_canApplyContentViewForValueAddedService"))
  {
    v8 = [PKPassPaymentContainerView alloc];
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "passView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKPassPaymentContainerView initWithPass:passView:context:paymentSession:paymentService:](v8, "initWithPass:passView:context:paymentSession:paymentService:", v9, v10, *(_QWORD *)(a1 + 48), v12, v5);

    objc_msgSend(v7, "_setContentView:animated:", v11, 1);
  }
  else
  {
    InvalidateSession(v12);
  }

}

void __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_canApplyContentViewForValueAddedService");
    v3 = v8;
    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "_messageForUnavailableState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_messageContentViewFromMessage:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setContentView:animated:", v7, 1);

      v3 = v8;
    }
  }

}

- (void)_setContentView:(id)a3 animated:(BOOL)a4
{
  PKPassFooterContentView *v6;
  PKPassFooterContentView *v7;
  PKPassFooterContentView **p_contentView;
  PKPassFooterContentView *contentView;
  uint64_t v10;
  PKPassFooterContentView *fadingContentView;
  PKPassFooterContentView *v12;
  PKPassFooterContentView *v13;
  int contentViewVisibility;
  BOOL v15;
  PKPassFooterContentView **p_fadingContentView;
  PKPassFooterContentView *v17;
  PKPassFooterContentView *v18;
  PKPassFooterContentView *v19;
  PKPassFooterContentView *v20;
  PKPassFooterContentView *v21;
  double v22;
  void *OpacityAnimation;
  PKPassFooterContentView *v24;
  PKPassFooterContentView *v25;
  void *v26;
  id v27;
  _BOOL4 v28;
  id WeakRetained;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  PKPassFooterContentView *v36;
  id v37;
  id location;

  v6 = (PKPassFooterContentView *)a3;
  v7 = v6;
  if (self->_invalidated)
  {
    if (v6)
    {
      -[PKPassFooterContentView setDelegate:](v6, "setDelegate:", 0);
      -[PKPassFooterContentView invalidate](v7, "invalidate");

      v7 = 0;
    }
  }
  else if (a4)
  {
    p_contentView = &self->_contentView;
    contentView = self->_contentView;
    if (contentView == v7)
      goto LABEL_49;
    v10 = 1;
    if (!contentView)
      goto LABEL_31;
    goto LABEL_14;
  }
  fadingContentView = self->_fadingContentView;
  if (fadingContentView)
  {
    v12 = fadingContentView;
    v13 = self->_fadingContentView;
    self->_fadingContentView = 0;

    if (self->_fadingContentViewNeedsDidHide)
      -[PKPassFooterContentView didBecomeHiddenAnimated:](v12, "didBecomeHiddenAnimated:", 0);
    -[PKPassFooterContentView removeFromSuperview](v12, "removeFromSuperview");
    -[PKPassFooterContentView invalidate](v12, "invalidate");

  }
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v7)
  {
    v10 = 0;
    if (!contentView)
    {
LABEL_31:
      v28 = -[PKPassFooterContentView requestPileSuppression](*p_contentView, "requestPileSuppression", v31);
      objc_storeStrong((id *)p_contentView, v7);
      if (*p_contentView)
      {
        -[PKPassFooterContentView setDelegate:](*p_contentView, "setDelegate:", self);
        if (((self->_fadingContentView == 0) & ~(_DWORD)v10) == 0)
          -[PKPassFooterContentView setAlpha:](*p_contentView, "setAlpha:", 0.0);
        if (PKViewVisibilityStateIsVisible())
          -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", 1, v10);
        -[PKPassFooterView addSubview:](self, "addSubview:", *p_contentView);
        -[PKPassFooterView setNeedsLayout](self, "setNeedsLayout");
        -[PKPassFooterView layoutIfNeeded](self, "layoutIfNeeded");
        if (!self->_fadingContentView)
          -[PKPassFooterView _commitContentViewAnimated:](self, "_commitContentViewAnimated:", v10);
      }
      if (v28 != -[PKPassFooterContentView requestPileSuppression](*p_contentView, "requestPileSuppression"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "passFooterViewDidChangePileSuppressionRequirement:", self);

      }
      if (v7)
      {
        -[PKPassFooterView _setPhysicalButtonRequired:](self, "_setPhysicalButtonRequired:", -[PKPassFooterContentView isPhysicalButtonRequired](v7, "isPhysicalButtonRequired"));
        v30 = -[PKPassFooterContentView coachingState](v7, "coachingState");
      }
      else
      {
        if (!self->_acquiringSession)
          -[PKPassFooterView _setPhysicalButtonRequired:](self, "_setPhysicalButtonRequired:", objc_msgSend(0, "isPhysicalButtonRequired"));
        v30 = 0;
      }
      -[PKPassFooterView _setCoachingState:](self, "_setCoachingState:", v30);
      goto LABEL_49;
    }
LABEL_14:
    -[PKPassFooterContentView setDelegate:](contentView, "setDelegate:", 0);
    contentViewVisibility = self->_contentViewVisibility;
    v15 = self->_contentViewVisibility != 0;
    if ((_DWORD)v10 && (p_fadingContentView = &self->_fadingContentView, !self->_fadingContentView))
    {
      if (self->_contentViewVisibility)
        -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", 3, 1);
      objc_storeStrong((id *)p_fadingContentView, *p_contentView);
      self->_fadingContentViewNeedsDidHide = v15;
      v21 = *p_contentView;
      *p_contentView = 0;

      -[PKPassFooterContentView alpha](*p_fadingContentView, "alpha");
      OpacityAnimation = CreateOpacityAnimation(v22, 0.0);
      objc_initWeak(&location, self);
      v24 = *p_fadingContentView;
      v33 = 3221225472;
      v34 = __45__PKPassFooterView__setContentView_animated___block_invoke;
      v35 = &unk_1E3E62FA0;
      v31 = &v37;
      v32 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v37, &location);
      v25 = v24;
      v36 = v25;
      objc_msgSend(OpacityAnimation, "pkui_setCompletionHandler:", &v32);
      -[PKPassFooterContentView layer](*p_fadingContentView, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (id)objc_msgSend(v26, "pkui_addAdditiveAnimation:", OpacityAnimation);

      -[PKPassFooterContentView setAlpha:](*p_fadingContentView, "setAlpha:", 0.0);
      if (contentViewVisibility)
        -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", 0, 0, &v37, v32, v33, v34, v35);

      objc_destroyWeak(v31);
      objc_destroyWeak(&location);

    }
    else
    {
      if (self->_contentViewVisibility)
      {
        -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", 3, 0);
        -[PKPassFooterContentView removeFromSuperview](*p_contentView, "removeFromSuperview");
        -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", 0, 0);
      }
      else
      {
        -[PKPassFooterContentView removeFromSuperview](*p_contentView, "removeFromSuperview");
      }
      -[PKPassFooterContentView invalidate](*p_contentView, "invalidate");
      v17 = *p_contentView;
      *p_contentView = 0;

      if ((v10 & 1) == 0)
      {
        v18 = self->_fadingContentView;
        if (v18)
        {
          v19 = v18;
          v20 = self->_fadingContentView;
          self->_fadingContentView = 0;

          if (self->_fadingContentViewNeedsDidHide)
            -[PKPassFooterContentView didBecomeHiddenAnimated:](v19, "didBecomeHiddenAnimated:", 0);
          -[PKPassFooterContentView removeFromSuperview](v19, "removeFromSuperview");
          -[PKPassFooterContentView invalidate](v19, "invalidate");

        }
      }
    }
    goto LABEL_31;
  }
  if (self->_fadingContentView)
    -[PKPassFooterView _commitContentViewAnimated:](self, "_commitContentViewAnimated:", 0);
LABEL_49:

}

void __45__PKPassFooterView__setContentView_animated___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[53] == *(_QWORD *)(a1 + 32))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_commitContentViewAnimated:", 1);
    WeakRetained = v3;
  }

}

- (void)_commitContentViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  PKPassFooterContentView *fadingContentView;
  PKPassFooterContentView *v6;
  PKPassFooterContentView *v7;
  PKPassFooterContentView *contentView;
  double v9;
  void *OpacityAnimation;
  void *v11;
  id v12;

  v3 = a3;
  fadingContentView = self->_fadingContentView;
  if (fadingContentView)
  {
    v6 = fadingContentView;
    v7 = self->_fadingContentView;
    self->_fadingContentView = 0;

    if (self->_fadingContentViewNeedsDidHide)
      -[PKPassFooterContentView didBecomeHiddenAnimated:](v6, "didBecomeHiddenAnimated:", 0);
    -[PKPassFooterContentView removeFromSuperview](v6, "removeFromSuperview");
    -[PKPassFooterContentView invalidate](v6, "invalidate");

  }
  if (v3)
  {
    contentView = self->_contentView;
    if (contentView)
    {
      -[PKPassFooterContentView alpha](contentView, "alpha");
      OpacityAnimation = CreateOpacityAnimation(v9, 1.0);
      -[PKPassFooterContentView layer](self->_contentView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "pkui_addAdditiveAnimation:", OpacityAnimation);

      -[PKPassFooterContentView setAlpha:](self->_contentView, "setAlpha:", 1.0);
    }
  }
  -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", self->_visibility, v3);
}

- (void)_setPhysicalButtonRequired:(BOOL)a3
{
  id WeakRetained;

  if (((!self->_physicalButtonRequired ^ a3) & 1) == 0)
  {
    self->_physicalButtonRequired = a3;
    if (PKViewVisibilityStateIsVisible())
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "passFooterViewDidChangePhysicalButtonRequirement:", self);

    }
  }
}

- (void)_setCoachingState:(int64_t)a3
{
  id WeakRetained;

  if (self->_coachingState != a3)
  {
    self->_coachingState = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "passFooterViewDidChangeCoachingState:", self);

  }
}

- (void)_advanceVisibilityToState:(unsigned __int8)a3 animated:(BOOL)a4
{
  uint64_t v5;
  uint64_t v7;

  v5 = MEMORY[0x1E0C809B0];
  LOBYTE(v7) = a4;
  PKViewVisibilityStateAdvanceState();
  if (!self->_visibility)
    -[PKPassFooterView _endSession](self, "_endSession", v5, 3221225472, __55__PKPassFooterView__advanceVisibilityToState_animated___block_invoke, &unk_1E3E7A0D0, self, v7);
}

uint64_t __55__PKPassFooterView__advanceVisibilityToState_animated___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 489) = a2;
  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 424))
    return objc_msgSend(*(id *)(result + 32), "_advanceContentViewVisibilityToState:animated:", a2, *(unsigned __int8 *)(result + 40));
  return result;
}

- (void)_advanceContentViewVisibilityToState:(unsigned __int8)a3 animated:(BOOL)a4
{
  PKPassFooterContentView *v4;
  PKPassFooterContentView *v5;
  PKPassFooterContentView *v6;

  v4 = self->_contentView;
  if (v4)
  {
    v5 = v4;
    v6 = v4;
    PKViewVisibilityStateAdvanceState();

    v4 = v5;
  }

}

uint64_t __66__PKPassFooterView__advanceContentViewVisibilityToState_animated___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 490) = a2;
  v2 = result;
  switch(a2)
  {
    case 0:
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        result = objc_msgSend(*(id *)(v2 + 40), "didBecomeHiddenAnimated:", *(unsigned __int8 *)(v2 + 48));
      break;
    case 1:
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        result = objc_msgSend(*(id *)(v2 + 40), "willBecomeVisibleAnimated:", *(unsigned __int8 *)(v2 + 48));
      break;
    case 2:
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        result = objc_msgSend(*(id *)(v2 + 40), "didBecomeVisibleAnimated:", *(unsigned __int8 *)(v2 + 48));
      break;
    case 3:
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        result = objc_msgSend(*(id *)(v2 + 40), "willBecomeHiddenAnimated:", *(unsigned __int8 *)(v2 + 48));
      break;
    default:
      return result;
  }
  return result;
}

- (void)_endSession
{
  PKPaymentSessionHandle *sessionHandle;
  PKPaymentSessionHandle *v4;
  PKPaymentSessionHandle *v5;
  PKPaymentSessionHandle *v6;
  _QWORD v7[4];
  PKPaymentSessionHandle *v8;

  self->_acquiringSession = 0;
  ++self->_sessionToken;
  sessionHandle = self->_sessionHandle;
  if (sessionHandle)
  {
    v4 = sessionHandle;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___ZL17InvalidateSessionP22PKPaymentSessionHandle_block_invoke;
    v7[3] = &unk_1E3E63C08;
    v8 = v4;
    v5 = v4;
    PeformBackgroundTask(v7);

    v6 = self->_sessionHandle;
    self->_sessionHandle = 0;

  }
}

- (void)_endSessionStartTimer
{
  NSObject *sessionStartTimer;
  OS_dispatch_source *v4;

  sessionStartTimer = self->_sessionStartTimer;
  if (sessionStartTimer)
  {
    dispatch_source_cancel(sessionStartTimer);
    v4 = self->_sessionStartTimer;
    self->_sessionStartTimer = 0;

  }
}

- (BOOL)_canApplyContentViewForPersonalizedApplication
{
  int IsVisible;

  if (self->_invalidated || self->_isBackgrounded || self->_isAssistantActive)
  {
    LOBYTE(IsVisible) = 0;
  }
  else
  {
    IsVisible = PKViewVisibilityStateIsVisible();
    if (IsVisible)
      LOBYTE(IsVisible) = -[PKPassFooterViewConfiguration state](self->_configuration, "state") == 1;
  }
  return IsVisible;
}

- (BOOL)_canApplyContentViewForValueAddedService
{
  int IsVisible;

  if (self->_invalidated || self->_isBackgrounded || self->_isAssistantActive)
  {
    LOBYTE(IsVisible) = 0;
  }
  else
  {
    IsVisible = PKViewVisibilityStateIsVisible();
    if (IsVisible)
      LOBYTE(IsVisible) = -[PKPassFooterViewConfiguration state](self->_configuration, "state") == 2;
  }
  return IsVisible;
}

- (void)_lostModeButtonTapped
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Starting FMDFMIP lost mode exit.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initiateLostModeExitAuthWithCompletion:", &__block_literal_global_229);

}

void __41__PKPassFooterView__lostModeButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error exiting lost mode: %@", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Completed FMDFMIP lost mode exit.", (uint8_t *)&v6, 2u);
    }

    PKSetNeedsLostModeExitAuth();
  }

}

- (id)_messageContentViewFromMessage:(id)a3
{
  id v3;
  PKPassMessageFooterContentView *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = -[PKPassMessageFooterContentView initWithPass:presentationContext:]([PKPassMessageFooterContentView alloc], "initWithPass:presentationContext:", 0, 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObject:", v3);

    -[PKPassMessageFooterContentView updateWithMessages:](v4, "updateWithMessages:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_messageForUnavailableState
{
  PKDashboardPassMessage *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v3, "setIdentifier:", CFSTR("applicationState"));
  PKLocalizedPaymentString(CFSTR("PAYMENT_DEVICE_UNAVAILABLE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v3, "setTitle:", v4);

  -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "passType") == 1)
    v6 = v5;
  else
    v6 = 0;
  if (objc_msgSend(v6, "isAccessPass"))
    v7 = CFSTR("PAYMENT_DEVICE_UNAVAILABLE_WALLET_MESSAGE");
  else
    v7 = CFSTR("PAYMENT_DEVICE_UNAVAILABLE_MESSAGE");
  PKLocalizedPaymentString(&v7->isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v3, "setMessage:", v8);

  return v3;
}

- (id)_messageForRestrictedState
{
  PKDashboardPassMessage *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v2, "setIdentifier:", CFSTR("applicationState"));
  PKLocalizedPaymentString(CFSTR("RESTRICTED_MODE_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v2, "setTitle:", v3);

  PKLocalizedPaymentString(CFSTR("RESTRICTED_MODE_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v2, "setMessage:", v4);

  return v2;
}

- (id)_messageForPeerPaymentZeroBalance
{
  PKDashboardPassMessage *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v2 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v2, "setIdentifier:", CFSTR("applicationState"));
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_STATE_FOOTER_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v2, "setTitle:", v3);

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_STATE_FOOTER_INSUFFICIENT_BALANCE_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v2, "setMessage:", v4);

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_STATE_FOOTER_ADD_MONEY_BUTTON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setButtonTitle:](v2, "setButtonTitle:", v5);

  -[PKDashboardPassMessage setActionOnButtonPress:](v2, "setActionOnButtonPress:", &__block_literal_global_78);
  -[PKDashboardPassMessage setShowDisclosure:](v2, "setShowDisclosure:", 1);
  PKPassKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("MessageError"), CFSTR("pdf"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKUIScreenScale();
  PKUIImageFromPDF(v7, 45.0, 45.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v2, "setImage:", v9);

  return v2;
}

void __53__PKPassFooterView__messageForPeerPaymentZeroBalance__block_invoke()
{
  void *v0;
  id v1;
  id v2;

  if (PKRunningInViewService() && (objc_msgSend(MEMORY[0x1E0D67798], "isWalletRestricted") & 1) == 0)
  {
    PKPeerPaymentGetTopUpSensitiveURL();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
    if (v2)
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D22D78]);
    objc_msgSend(v0, "openApplication:options:withResult:", *MEMORY[0x1E0D6B590], v1, 0);

  }
}

- (id)_messageForPeerPaymentLockedByOwner
{
  PKDashboardPassMessage *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v2 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v2, "setIdentifier:", CFSTR("applicationState"));
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_DASHBOARD_LOCKED_BY_ASSOCIATED_ACCOUNT_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v2, "setTitle:", v3);

  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_DASHBOARD_LOCKED_BY_ASSOCIATED_ACCOUNT_PREARM_FOOTER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v2, "setMessage:", v4);

  PKPassKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("MessageAlert"), CFSTR("pdf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKUIScreenScale();
  PKUIImageFromPDF(v6, 45.0, 45.0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v2, "setImage:", v8);

  return v2;
}

- (id)_messageForPaymentApplicationState
{
  void *v3;
  void *v4;
  id v5;
  char v6;
  uint64_t v7;
  void *v8;
  PKDashboardPassMessage *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  PKPassFooterView *v31;

  -[PKPassFooterViewConfiguration pass](self->_configuration, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "passType") == 1)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = objc_msgSend(v5, "supportsBarcodePayment");
  if ((PKNeedsLostModeExitAuth() & 1) != 0)
    v7 = 7;
  else
    v7 = objc_msgSend(v5, "effectiveContactlessPaymentApplicationState");
  if (!PKPaymentApplicationStateIsPersonalized())
    goto LABEL_10;
  objc_msgSend(v5, "devicePrimaryContactlessPaymentApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v5, "deviceInAppPaymentApplications"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v8, "count")))
  {

LABEL_10:
    v9 = 0;
    switch(v7)
    {
      case 2:
        v9 = objc_alloc_init(PKDashboardPassMessage);
        -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", CFSTR("applicationState"));
        PKLocalizedPaymentString(CFSTR("ACTIVATING_TITLE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setTitle:](v9, "setTitle:", v10);

        if ((v6 & 1) != 0)
          PKLocalizedAquamanString(CFSTR("ACTIVATING_ACCOUNT_MESSAGE"));
        else
          PKLocalizedPaymentString(CFSTR("ACTIVATING_MESSAGE"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 6:
        v9 = objc_alloc_init(PKDashboardPassMessage);
        -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", CFSTR("applicationState"));
        if ((v6 & 1) != 0)
        {
          PKLocalizedAquamanString(CFSTR("PAYMENT_APP_ERROR_TITLE_ACCOUNT"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardPassMessage setTitle:](v9, "setTitle:", v16);

          objc_msgSend(v3, "organizationName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedAquamanString(CFSTR("PAYMENT_APP_SUSPENDED_BY_ISSUER_ACCOUNT"), CFSTR("%@"), v15);
        }
        else
        {
          PKLocalizedPaymentString(CFSTR("PAYMENT_APP_ERROR_TITLE"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardPassMessage setTitle:](v9, "setTitle:", v24);

          objc_msgSend(v3, "organizationName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("PAYMENT_APP_SUSPENDED_BY_ISSUER"), CFSTR("%@"), v15);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setMessage:](v9, "setMessage:", v25);
        goto LABEL_31;
      case 7:
        v9 = objc_alloc_init(PKDashboardPassMessage);
        -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", CFSTR("applicationState"));
        PKLocalizedPaymentString(CFSTR("PAYMENT_APP_SUSPENDED_LOST_MODE_TITLE"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setTitle:](v9, "setTitle:", v17);

        PKLocalizedPaymentString(CFSTR("PAYMENT_APP_SUSPENDED_LOST_MODE_DETAIL"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setMessage:](v9, "setMessage:", v18);

        PKLocalizedPaymentString(CFSTR("PAYMENT_APP_SUSPENDED_LOST_MODE_ACTION"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setButtonTitle:](v9, "setButtonTitle:", v19);

        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __54__PKPassFooterView__messageForPaymentApplicationState__block_invoke;
        v29[3] = &unk_1E3E61388;
        v30 = v3;
        v31 = self;
        -[PKDashboardPassMessage setActionOnButtonPress:](v9, "setActionOnButtonPress:", v29);
        -[PKDashboardPassMessage setShowDisclosure:](v9, "setShowDisclosure:", 1);
        PKPassKitUIBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "URLForResource:withExtension:", CFSTR("MessageAlert"), CFSTR("pdf"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = PKUIScreenScale();
        PKUIImageFromPDF(v21, 45.0, 45.0, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setImage:](v9, "setImage:", v23);

        goto LABEL_33;
      case 9:
        v9 = objc_alloc_init(PKDashboardPassMessage);
        -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", CFSTR("applicationState"));
        if ((v6 & 1) != 0)
          PKLocalizedAquamanString(CFSTR("PAYMENT_APP_ERROR_TITLE_ACCOUNT"));
        else
          PKLocalizedPaymentString(CFSTR("PAYMENT_APP_ERROR_TITLE"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setTitle:](v9, "setTitle:", v26);

        objc_msgSend(v5, "localizedSuspendedReason");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_32;
LABEL_28:
        -[PKDashboardPassMessage setMessage:](v9, "setMessage:", v15);
        goto LABEL_32;
      default:
        goto LABEL_33;
    }
  }
  v11 = objc_msgSend(v5, "supportsBarcodePayment");

  if ((v11 & 1) != 0)
    goto LABEL_10;
  objc_msgSend(v3, "organizationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "organizationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pk_uppercaseStringForPreferredLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PAYMENT_SUMMARY_MESSAGE_TITLE_FORMAT"), CFSTR("%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_SUMMARY_DEFAULT_MESSAGE_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", CFSTR("applicationState"));
  -[PKDashboardPassMessage setTitle:](v9, "setTitle:", v15);
  objc_msgSend(v3, "localizedDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("PAYMENT_APP_NO_CONTACTLESS"), CFSTR("%@"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v9, "setMessage:", v27);

LABEL_31:
LABEL_32:

LABEL_33:
  return v9;
}

void __54__PKPassFooterView__messageForPaymentApplicationState__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  if (PKRunningInViewService() && PKDeviceUILocked())
  {
    if ((objc_msgSend(MEMORY[0x1E0D67798], "isWalletRestricted") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
      objc_msgSend(*(id *)(a1 + 32), "passURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D22D78]);

      objc_msgSend(v4, "openApplication:options:withResult:", *MEMORY[0x1E0D6B590], v2, 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_lostModeButtonTapped");
  }
}

- (PKPassFooterViewConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isPhysicalButtonRequired
{
  return self->_physicalButtonRequired;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (PKPassFooterViewDelegate)delegate
{
  return (PKPassFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_informativeAssertion, 0);
  objc_storeStrong((id *)&self->_sessionHandle, 0);
  objc_storeStrong((id *)&self->_sessionDelayGroup, 0);
  objc_storeStrong((id *)&self->_sessionStartTimer, 0);
  objc_storeStrong((id *)&self->_fadingContentView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

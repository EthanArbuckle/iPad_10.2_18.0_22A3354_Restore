@implementation VUITransactionButton

- (VUITransactionButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  VUITransactionButton *v4;
  uint64_t v5;
  NSSet *v6;
  NSSet *transactionIDs;
  void *v8;
  _QWORD v10[4];
  id v11;
  id from;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VUITransactionButton;
  v4 = -[VUIButton initWithType:interfaceStyle:](&v16, sel_initWithType_interfaceStyle_, a3, a4);
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke;
    v13[3] = &unk_1E9F990E0;
    objc_copyWeak(&v14, &location);
    -[VUIButton setSelectActionHandler:](v4, "setSelectActionHandler:", v13);
    v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    transactionIDs = v4->_transactionIDs;
    v4->_transactionIDs = v6;

    objc_initWeak(&from, v4);
    v17[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke_2;
    v10[3] = &unk_1E9F99F98;
    objc_copyWeak(&v11, &from);
    -[VUITransactionButton vui_registerForTraitChanges:withHandler:](v4, "vui_registerForTraitChanges:withHandler:", v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_buttonTapped:eventName:", v3, CFSTR("select"));

}

void __52__VUITransactionButton_initWithType_interfaceStyle___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "progressIndicator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_msgSend(WeakRetained, "_updateProgressIndicatorTintColor:", v1);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VUIPurchaseOrSubscribeRequestDidStartNotification"), 0);

  -[VUITransactionButton _unregisterTransactionNotifications](self, "_unregisterTransactionNotifications");
  v4.receiver = self;
  v4.super_class = (Class)VUITransactionButton;
  -[VUITransactionButton dealloc](&v4, sel_dealloc);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)VUITransactionButton;
  -[VUIButton vui_layoutSubviews:computationOnly:](&v11, sel_vui_layoutSubviews_computationOnly_, a4, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[VUITransactionButton _layoutProgressIndicatorIfNeeded](self, "_layoutProgressIndicatorIfNeeded");
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setTransactionIDs:(id)a3
{
  id v4;
  id v5;
  NSSet **p_transactionIDs;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  VUITransactionButton *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  p_transactionIDs = &self->_transactionIDs;
  objc_storeStrong((id *)&self->_transactionIDs, v5);
  if (!v4)

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *p_transactionIDs;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        if (+[VUIActionCommerceTransaction isTransactionInProgressForBuyParams:](VUIActionCommerceTransaction, "isTransactionInProgressForBuyParams:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
        {
          v8 = 1;
          goto LABEL_15;
        }
      }
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

  VUIDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[NSSet count](*p_transactionIDs, "count");
    *(_DWORD *)buf = 134218496;
    v20 = self;
    v21 = 1024;
    v22 = v8;
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: anyTransactionsInProgress=%d, [_transactionIds count]=%lu", buf, 0x1Cu);
  }

  -[VUITransactionButton setMonitorTransaction:](self, "setMonitorTransaction:", v8);
  if ((v8 & 1) == 0 && -[NSSet count](*p_transactionIDs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("VUIPurchaseOrSubscribeRequestDidStartNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__handleTransactionDidStartNotification_, CFSTR("VUIPurchaseOrSubscribeRequestDidStartNotification"), 0);

  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  VUITransactionButton *v7;
  VUITransactionButton *v8;
  VUITransactionButton *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUITransactionButton;
  -[VUITransactionButton didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (VUITransactionButton *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    -[VUITransactionButton progressIndicator](self, "progressIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITransactionButton _updateProgressIndicatorTintColor:](self, "_updateProgressIndicatorTintColor:", v10);

    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedItem");
  v9 = (VUITransactionButton *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)setMonitorTransaction:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (self->_monitorTransaction != a3)
  {
    self->_monitorTransaction = a3;
    if (a3)
    {
      v4 = *MEMORY[0x1E0C9D648];
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      -[VUIButton imageMaxWidth](self, "imageMaxWidth");
      v7 = v6;
      -[VUIButton imageMaxHeight](self, "imageMaxHeight");
      -[VUITransactionButton _addProgressIndicatorWithFrame:](self, "_addProgressIndicatorWithFrame:", v4, v5, v7, v8);
      -[VUITransactionButton _registerForTransactionNotification](self, "_registerForTransactionNotification");
      -[VUITransactionButton _carouselView](self, "_carouselView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v10 = 2;
    }
    else
    {
      -[VUITransactionButton progressIndicator](self, "progressIndicator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "vui_removeFromSuperView");

      -[VUITransactionButton setProgressIndicator:](self, "setProgressIndicator:", 0);
      -[VUITransactionButton _carouselView](self, "_carouselView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v10 = 0;
    }
    objc_msgSend(v9, "setScrollMode:", v10);

  }
}

- (id)_carouselView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;

  -[VUITransactionButton superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[VUITransactionButton superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v5, "superview");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
      while (v6);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_layoutProgressIndicatorIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  -[VUITransactionButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIButton padding](self, "padding");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[VUITransactionButton progressIndicator](self, "progressIndicator");
  v19 = objc_claimAutoreleasedReturnValue();
  v36 = (id)v19;
  if (v19)
  {
    v20 = v4 + v14;
    v21 = v6 + v12;
    v22 = v8 - (v14 + v18);
    v23 = v10 - (v12 + v16);
    -[VUITransactionButton progressIndicator](self, "progressIndicator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");

    v25 = v22;
    v26 = v23;
    if (-[VUIButton buttonType](self, "buttonType") != 1)
    {
      -[VUIButton imageMaxWidth](self, "imageMaxWidth");
      v25 = v22;
      if (v27 > 0.0)
      {
        -[VUIButton imageMaxWidth](self, "imageMaxWidth");
        v25 = v28;
      }
      -[VUIButton imageMaxHeight](self, "imageMaxHeight");
      if (v29 <= 0.0)
      {
        v26 = v23;
      }
      else
      {
        -[VUIButton imageMaxHeight](self, "imageMaxHeight");
        v26 = v30;
      }
    }
    -[VUITransactionButton vui_bringSubviewToFront:](self, "vui_bringSubviewToFront:", v36);
    -[VUITransactionButton progressIndicator](self, "progressIndicator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v20 + (v22 - v25) * 0.5, v21 + (v23 - v26) * 0.5, v25, v26);

    v19 = (uint64_t)v36;
  }
  v32 = v19 != 0;
  -[VUIButton textContentView](self, "textContentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHidden:", v32);

  -[VUIButton subtitleContentView](self, "subtitleContentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHidden:", v32);

  -[VUIButton imageView](self, "imageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", v32);

}

- (void)_buttonTapped:(id)a3 eventName:(id)a4
{
  NSObject *v5;
  void *v6;
  void (**v7)(id, VUITransactionButton *);
  uint8_t buf[4];
  _BOOL4 v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[VUITransactionButton isWaitingForTransactionToStart](self, "isWaitingForTransactionToStart", a3, a4)
    || -[VUITransactionButton monitorTransaction](self, "monitorTransaction"))
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v9 = -[VUITransactionButton isWaitingForTransactionToStart](self, "isWaitingForTransactionToStart");
      v10 = 1024;
      v11 = -[VUITransactionButton monitorTransaction](self, "monitorTransaction");
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring transaction button tap. isWaitingForTransactionToStart %d, monitorTransaction %d", buf, 0xEu);
    }

  }
  else
  {
    -[VUITransactionButton setWaitingForTransactionToStart:](self, "setWaitingForTransactionToStart:", 1);
    -[VUIButton selectActionHandler](self, "selectActionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUIButton selectActionHandler](self, "selectActionHandler");
      v7 = (void (**)(id, VUITransactionButton *))objc_claimAutoreleasedReturnValue();
      v7[2](v7, self);

    }
  }
}

- (void)_updateProgressIndicatorTintColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VUIButton textContentView](self, "textContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[VUITransactionButton vuiTintColor](self, "vuiTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setVuiTintColor:", v6);

}

- (void)_addProgressIndicatorWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  VUICircularProgress *v6;

  if (!self->_progressIndicator)
  {
    v6 = -[VUICircularProgress initWithFrame:]([VUICircularProgress alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUICircularProgress setVuiBackgroundColor:](v6, "setVuiBackgroundColor:", v4);

    -[VUICircularProgress vuiLayer](v6, "vuiLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllAnimations");

    -[VUICircularProgress setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[VUITransactionButton _updateProgressIndicatorTintColor:](self, "_updateProgressIndicatorTintColor:", v6);
    -[VUICircularProgress setIndeterminate:](v6, "setIndeterminate:", 1);
    -[VUITransactionButton vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v6, 0);
    -[VUITransactionButton setProgressIndicator:](self, "setProgressIndicator:", v6);

  }
}

- (void)_registerForTransactionNotification
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleTransactionDidFinishNotification_, CFSTR("VUISubscribeRequestDidFinishNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleTransactionDidFinishNotification_, CFSTR("VUIPurchaseRequestDidFinishNotification"), 0);

}

- (void)_unregisterTransactionNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VUISubscribeRequestDidFinishNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VUIPurchaseRequestDidFinishNotification"), 0);

}

- (void)_handleTransactionDidStartNotification:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TransactionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__VUITransactionButton__handleTransactionDidStartNotification___block_invoke;
    v6[3] = &unk_1E9F98FD8;
    v6[4] = self;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __63__VUITransactionButton__handleTransactionDidStartNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "transactionIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: setMonitorTransaction=YES", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setMonitorTransaction:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setWaitingForTransactionToStart:", 0);
  }
}

- (void)_handleTransactionDidFinishNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TransactionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__VUITransactionButton__handleTransactionDidFinishNotification___block_invoke;
    block[3] = &unk_1E9F99840;
    block[4] = self;
    v8 = v6;
    v9 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __64__VUITransactionButton__handleTransactionDidFinishNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "transactionIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "transactionIDs", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          if (+[VUIActionCommerceTransaction isTransactionInProgressForBuyParams:](VUIActionCommerceTransaction, "isTransactionInProgressForBuyParams:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8)))
          {

            VUIDefaultLogObject();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              v14 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 134217984;
              v21 = v14;
              _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: one or many transactions still running, do not hide indicator", buf, 0xCu);
            }
            goto LABEL_19;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 48), "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Error"));
    v10 = objc_claimAutoreleasedReturnValue();

    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v21 = v13;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: allTransactionsFinished & there's an error -> hide indicator", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setMonitorTransaction:", 0);
    }
    else
    {
      if (v12)
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v21 = v15;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUITransactionButton <%p>: allTransactionsFinished successfully, do not hide indicator, just wait for page refreshing", buf, 0xCu);
      }

    }
LABEL_19:

  }
}

- (NSSet)transactionIDs
{
  return self->_transactionIDs;
}

- (BOOL)isWaitingForTransactionToStart
{
  return self->_waitingForTransactionToStart;
}

- (void)setWaitingForTransactionToStart:(BOOL)a3
{
  self->_waitingForTransactionToStart = a3;
}

- (BOOL)monitorTransaction
{
  return self->_monitorTransaction;
}

- (VUICircularProgress)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (NSString)textContentTitleBackup
{
  return self->_textContentTitleBackup;
}

- (void)setTextContentTitleBackup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 856);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContentTitleBackup, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_transactionIDs, 0);
}

@end

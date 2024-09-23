@implementation PKAutomaticPassPresentationSuppressor

+ (id)sharedInstance
{
  if (qword_1ECF228C8 != -1)
    dispatch_once(&qword_1ECF228C8, &__block_literal_global_147);
  return (id)_MergedGlobals_249;
}

void __55__PKAutomaticPassPresentationSuppressor_sharedInstance__block_invoke()
{
  PKAutomaticPassPresentationSuppressor *v0;
  void *v1;

  v0 = objc_alloc_init(PKAutomaticPassPresentationSuppressor);
  v1 = (void *)_MergedGlobals_249;
  _MergedGlobals_249 = (uint64_t)v0;

}

- (PKAutomaticPassPresentationSuppressor)init
{
  PKAutomaticPassPresentationSuppressor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *suppressorQueue;
  NSObject *v5;
  _QWORD block[4];
  PKAutomaticPassPresentationSuppressor *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAutomaticPassPresentationSuppressor;
  v2 = -[PKAutomaticPassPresentationSuppressor init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passkit.automatic-pass-presentation-suppression", 0);
    suppressorQueue = v2->_suppressorQueue;
    v2->_suppressorQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_suppressorQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PKAutomaticPassPresentationSuppressor_init__block_invoke;
    block[3] = &unk_1E2ABE120;
    v8 = v2;
    dispatch_sync(v5, block);

  }
  return v2;
}

void __45__PKAutomaticPassPresentationSuppressor_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
  +[PKAssertion preheatConnection](PKAssertion, "preheatConnection");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKAssertion setInvalidationHandler:](self->_suppressionAssertion, "setInvalidationHandler:", 0);
  -[PKAssertion invalidate](self->_suppressionAssertion, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PKAutomaticPassPresentationSuppressor;
  -[PKAutomaticPassPresentationSuppressor dealloc](&v4, sel_dealloc);
}

- (unint64_t)requestSuppressionWithResponseHandler:(id)a3
{
  id v4;
  NSObject *suppressorQueue;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (PKNearFieldRadioIsAvailable())
  {
    suppressorQueue = self->_suppressorQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke;
    block[3] = &unk_1E2AC1F78;
    block[4] = self;
    block[5] = &v14;
    dispatch_sync(suppressorQueue, block);
    -[PKAutomaticPassPresentationSuppressor _acquireSuppressionAssertionIfNeededWithCompletion:](self, "_acquireSuppressionAssertionIfNeededWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke_2;
    v11[3] = &unk_1E2ABD9A0;
    v12 = v4;
    v8 = v11;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __dispatch_async_ar_block_invoke_13;
    v18[3] = &unk_1E2ABD9A0;
    v19 = v8;
    dispatch_async(v6, v18);

  }
  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)(v1 + 40) = v2 + 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __79__PKAutomaticPassPresentationSuppressor_requestSuppressionWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endSuppressionWithRequestToken:(unint64_t)a3
{
  NSObject *suppressorQueue;
  uint64_t v4;
  _QWORD *v5;
  _QWORD v6[6];
  _QWORD block[4];
  id v8;

  suppressorQueue = self->_suppressorQueue;
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKAutomaticPassPresentationSuppressor_endSuppressionWithRequestToken___block_invoke;
  v6[3] = &unk_1E2AC4430;
  v6[4] = self;
  v6[5] = a3;
  v5 = v6;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E2ABD9A0;
  v8 = v5;
  dispatch_async(suppressorQueue, block);

}

uint64_t __72__PKAutomaticPassPresentationSuppressor_endSuppressionWithRequestToken___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeIndex:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (!result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  return result;
}

- (BOOL)isSuppressing
{
  NSObject *suppressorQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  suppressorQueue = self->_suppressorQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PKAutomaticPassPresentationSuppressor_isSuppressing__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(suppressorQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__PKAutomaticPassPresentationSuppressor_isSuppressing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) != 0;
  return result;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v3;
  NSObject *suppressorQueue;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  suppressorQueue = self->_suppressorQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKAutomaticPassPresentationSuppressor__applicationDidEnterBackground___block_invoke;
  v6[3] = &unk_1E2ABE120;
  v6[4] = self;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E2ABD9A0;
  v8 = v5;
  dispatch_async(suppressorQueue, block);

}

void __72__PKAutomaticPassPresentationSuppressor__applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v3;
  NSObject *suppressorQueue;
  _QWORD *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  suppressorQueue = self->_suppressorQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PKAutomaticPassPresentationSuppressor__applicationWillEnterForeground___block_invoke;
  v6[3] = &unk_1E2ABE120;
  v6[4] = self;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E2ABD9A0;
  v8 = v5;
  dispatch_async(suppressorQueue, block);

}

void __73__PKAutomaticPassPresentationSuppressor__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 24))
    goto LABEL_10;
  v3 = *(void **)(v2 + 32);
  if (!v3)
    goto LABEL_10;
  objc_msgSend(v3, "timeIntervalSinceNow");
  if (fabs(v4) >= 86400.0)
  {
    v2 = *(_QWORD *)(a1 + 32);
LABEL_10:
    objc_msgSend(*(id *)(v2 + 16), "removeAllIndexes");
    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Re-Acquiring Assertion as Suppression Still Relevant", v10, 2u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllIndexes");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addIndexes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }
  objc_msgSend(*(id *)(a1 + 32), "_acquireSuppressionAssertionIfNeededWithCompletion:", 0);
LABEL_11:
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = 0;

}

- (void)_acquireSuppressionAssertionIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKAssertion *suppressionAssertion;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  suppressionAssertion = self->_suppressionAssertion;
  if (suppressionAssertion)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __92__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionIfNeededWithCompletion___block_invoke;
    v7[3] = &unk_1E2ABDDB0;
    v7[4] = self;
    v8 = v4;
    +[PKAssertion isAssertionValid:completion:](PKAssertion, "isAssertionValid:completion:", suppressionAssertion, v7);

  }
  else
  {
    -[PKAutomaticPassPresentationSuppressor _acquireSuppressionAssertionWithCompletion:](self, "_acquireSuppressionAssertionWithCompletion:", v4);
  }

}

uint64_t __92__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionIfNeededWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "_acquireSuppressionAssertionWithCompletion:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 4);
  return result;
}

- (void)_acquireSuppressionAssertionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Automatic Pass Presentation Suppression API from %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke;
  v9[3] = &unk_1E2AD3B88;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  +[PKAssertion acquireAssertionOfType:withReason:completion:](PKAssertion, "acquireAssertionOfType:withReason:completion:", 5, v7, v9);

}

void __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 48);
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_2;
  v14[3] = &unk_1E2ABE1E8;
  v15 = v5;
  v16 = v7;
  v17 = v6;
  v18 = v8;
  v11 = v14;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v9, block);

}

uint64_t __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[5];
  id v8;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  if (v2)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setInvalidationHandler:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "invalidate");
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 8), *(id *)(a1 + 32));
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_3;
      v7[3] = &unk_1E2ACA978;
      v4 = *(void **)(a1 + 32);
      v7[4] = *(_QWORD *)(a1 + 40);
      objc_copyWeak(&v8, &location);
      objc_msgSend(v4, "setInvalidationHandler:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
      v5 = 4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v5 = 3;
    }
  }
  else
  {
    objc_msgSend(v3, "removeAllIndexes");
    if (objc_msgSend(*(id *)(a1 + 48), "code") == -1)
      v5 = 2;
    else
      v5 = 1;
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  return result;
}

void __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD v4[4];
  id v5;
  _QWORD block[4];
  id v7;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  v2 = MEMORY[0x1E0C809B0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_4;
  v4[3] = &unk_1E2AC3648;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v3 = v4;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_13;
  block[3] = &unk_1E2ABD9A0;
  v7 = v3;
  dispatch_async(v1, block);

  objc_destroyWeak(&v5);
}

void __84__PKAutomaticPassPresentationSuppressor__acquireSuppressionAssertionWithCompletion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "removeAllIndexes");
    v2 = v3[1];
    v3[1] = 0;

    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressorQueue, 0);
  objc_storeStrong((id *)&self->_backgroundedDate, 0);
  objc_storeStrong((id *)&self->_backgrounedSuppressionIdentifiers, 0);
  objc_storeStrong((id *)&self->_suppressionRequestTokens, 0);
  objc_storeStrong((id *)&self->_suppressionAssertion, 0);
}

@end

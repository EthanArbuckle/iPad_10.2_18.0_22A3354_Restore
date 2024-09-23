@implementation PKSecureElement

+ (BOOL)isInFailForward
{
  if (qword_1ECF224A0 != -1)
    dispatch_once(&qword_1ECF224A0, &__block_literal_global_300);
  return _MergedGlobals_223;
}

+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 byHardware:(BOOL *)a4 outError:(id *)a5
{
  BOOL result;

  result = objc_msgSend(a1, "hardwareSupportsExpressForAutomaticSelectionTechnologyType:outError:", a3, a5);
  if (a4)
    *a4 = result;
  if (a3 == 3)
    return 1;
  return result;
}

+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 byHardware:(BOOL *)a4
{
  return objc_msgSend(a1, "supportsExpressForAutomaticSelectionTechnologyType:byHardware:outError:", a3, a4, 0);
}

+ (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return objc_msgSend(a1, "supportsExpressForAutomaticSelectionTechnologyType:byHardware:", a3, 0);
}

+ (BOOL)hardwareSupportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3 outError:(id *)a4
{
  void *v7;
  void *v8;
  id *v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    switch(a3)
    {
      case 1:
        v21 = 0;
        v9 = (id *)&v21;
        v10 = &v21;
        v11 = 4;
        break;
      case 2:
        v20 = 0;
        v9 = (id *)&v20;
        v10 = &v20;
        v11 = 2;
        break;
      case 3:
        v19 = 0;
        v9 = (id *)&v19;
        v10 = &v19;
        v11 = 8;
        break;
      case 4:
      case 5:
        v18 = 0;
        v9 = (id *)&v18;
        v10 = &v18;
        v11 = 32;
        break;
      case 6:
        v17 = 0;
        v9 = (id *)&v17;
        v10 = &v17;
        v11 = 512;
        break;
      case 7:
        v16 = 0;
        v9 = (id *)&v16;
        v10 = &v16;
        v11 = 1024;
        break;
      default:
        goto LABEL_4;
    }
    v12 = objc_msgSend(v7, "areFeaturesSupported:outError:", v11, v10, v16, v17, v18, v19, v20, v21);
    v13 = *v9;
    if (v13)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v23 = a1;
        v24 = 2048;
        v25 = a3;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): failed to check if feature %lu was supported, error: %@", buf, 0x20u);
      }

      if (a4)
      {
        v13 = objc_retainAutorelease(v13);
        *a4 = v13;
      }
    }
  }
  else
  {
LABEL_4:
    v12 = 0;
    v13 = 0;
  }

  return v12;
}

void __34__PKSecureElement_isInFailForward__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _MergedGlobals_223 = PKSimulateFailForward();
  if ((_MergedGlobals_223 & 1) == 0)
  {
    if (PKSecureElementIsAvailable())
    {
      objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
      v0 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v0 = 0;
    }
    v22 = 0;
    objc_msgSend(v0, "secureElementsWithError:", &v22);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v22;
    if (v2)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "description");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v4;
        _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKSecureElement in fail forward: accessing secure elements failed with error: %{public}@", buf, 0xCu);

      }
      _MergedGlobals_223 = 1;
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = v1;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v19 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "info", (_QWORD)v18);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              v12 = objc_msgSend(v10, "OSMode") == 2 ? 0 : objc_msgSend(v11, "restrictedMode") ^ 1;
              v13 = objc_msgSend(v11, "jcopTooOld");
              v14 = v13;
              if ((v12 & 1) != 0 || v13)
              {
                PKLogFacilityTypeGetObject(6uLL);
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  v16 = CFSTR("NO");
                  if (v12)
                    v17 = CFSTR("YES");
                  else
                    v17 = CFSTR("NO");
                  if (v14)
                    v16 = CFSTR("YES");
                  *(_DWORD *)buf = 138543618;
                  v24 = v17;
                  v25 = 2114;
                  v26 = v16;
                  _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKSecureElement in fail forward: SENotAvailable: %{public}@, jcopTooOld: %{public}@", buf, 0x16u);
                }

                _MergedGlobals_223 = 1;
                goto LABEL_31;
              }
            }

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_31:

    }
  }
}

- (PKSecureElement)init
{
  PKSecureElement *v2;
  uint64_t v3;
  NFSecureElement *secureElement;
  NSObject *v5;
  NSMutableArray *v6;
  NSMutableArray *sessionAccessHandlers;
  NSMutableArray *v8;
  NSMutableArray *prioritySessionAccessHandlers;
  NSMutableArray *v10;
  NSMutableArray *asyncSessionAccessHandlers;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *sessionQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *deletingAllAppletsTimerQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *replyQueue;
  uint64_t v21;
  NSHashTable *observers;
  uint8_t v24[16];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKSecureElement;
  v2 = -[PKSecureElement init](&v25, sel_init);
  if (v2)
  {
    if (PKSecureElementIsAvailable())
    {
      objc_msgSend(PKGetClassNFSecureElement(), "embeddedSecureElement");
      v3 = objc_claimAutoreleasedReturnValue();
      secureElement = v2->_secureElement;
      v2->_secureElement = (NFSecureElement *)v3;

      if (!v2->_secureElement)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "+[NFSecureElement embeddedSecureElement] returned nil.", v24, 2u);
        }

      }
    }
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sessionAccessHandlers = v2->_sessionAccessHandlers;
    v2->_sessionAccessHandlers = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    prioritySessionAccessHandlers = v2->_prioritySessionAccessHandlers;
    v2->_prioritySessionAccessHandlers = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    asyncSessionAccessHandlers = v2->_asyncSessionAccessHandlers;
    v2->_asyncSessionAccessHandlers = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.passkit.secureelement.session", v12);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = (OS_dispatch_queue *)v13;

    v2->_deletingAllAppletsPropertyLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.passkit.secureelement.deletingallapplets.timer", v15);
    deletingAllAppletsTimerQueue = v2->_deletingAllAppletsTimerQueue;
    v2->_deletingAllAppletsTimerQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.passkit.secureelement.reply", v18);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v21;

    v2->_observersLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSArray)secureElementIdentifiers
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PKSecureElement primarySecureElementIdentifier](self, "primarySecureElementIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

+ (id)primarySecureElementIdentifier
{
  if (qword_1ECF224B0 != -1)
    dispatch_once(&qword_1ECF224B0, &__block_literal_global_305);
  return (id)qword_1ECF224A8;
}

- (void)dealloc
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_registeredForHardwareUpdates)
    SharedHardwareManagerEventListenerRemove(self);
  v3 = (void *)-[NSMutableArray copy](self->_sessionAccessHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_sessionAccessHandlers, "removeAllObjects");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i) + 16))();
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v6);
  }

  v9 = (void *)-[NSMutableArray copy](self->_prioritySessionAccessHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_prioritySessionAccessHandlers, "removeAllObjects");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j) + 16))();
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v12);
  }

  v15 = (void *)-[NSMutableArray copy](self->_asyncSessionAccessHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_asyncSessionAccessHandlers, "removeAllObjects");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k) + 16))();
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v18);
  }

  v21.receiver = self;
  v21.super_class = (Class)PKSecureElement;
  -[PKSecureElement dealloc](&v21, sel_dealloc);
}

+ (id)sharedSecureElement
{
  if (qword_1ECF22498 != -1)
    dispatch_once(&qword_1ECF22498, &__block_literal_global_197_0);
  return (id)qword_1ECF22490;
}

void __38__PKSecureElement_sharedSecureElement__block_invoke()
{
  PKSecureElement *v0;
  void *v1;

  v0 = objc_alloc_init(PKSecureElement);
  v1 = (void *)qword_1ECF22490;
  qword_1ECF22490 = (uint64_t)v0;

}

+ (void)accessSecureElementManagerSessionWithSessionExchangeToken:(id)a3 handler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "accessSecureElementManagerSessionWithSessionExchangeToken:callbackQueue:handler:", v6, 0, v5);

}

+ (void)accessSecureElementManagerSessionWithSessionExchangeToken:(id)a3 callbackQueue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      v11 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke;
      aBlock[3] = &unk_1E2AC9E18;
      v23 = v9;
      v12 = _Block_copy(aBlock);
      if (PKSecureElementIsAvailable())
      {
        objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_201;
      v19[3] = &unk_1E2AC9E40;
      v20 = v8;
      v21 = v12;
      v14 = v12;
      objc_msgSend(v13, "startSecureElementManagerSession:", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKGetClassNFSession();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v15, "isActive") & 1) != 0)
          goto LABEL_16;
        objc_msgSend(v15, "activateWithToken:", v7);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_16;
        v17 = v16;
        PKLogFacilityTypeGetObject(6uLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v17;
          _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "PKSecureElement: Failed to activate session with exchange token %@", buf, 0xCu);
        }

      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement: Session handle is not an NFSession object", buf, 2u);
        }
      }

      objc_msgSend(v15, "endSession");
LABEL_16:

      goto LABEL_17;
    }
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }
LABEL_17:

}

void __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "state") == 2;
    v3 = v5;
    if (!v4)
    {
      objc_msgSend(v5, "endSessionWithCompletion:", &__block_literal_global_199);
      v3 = v5;
    }
  }

}

void __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject(6uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FC92000, v0, OS_LOG_TYPE_DEFAULT, "PKSecureElement: ended secure element manager session.", v1, 2u);
  }

}

void __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement: startSecureElementManagerSession finished, error: %@", buf, 0xCu);
  }

  if (v6)
  {

    v5 = 0;
  }
  v8 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_202;
    v9[3] = &unk_1E2ABDA18;
    v11 = *(id *)(a1 + 40);
    v10 = v5;
    dispatch_async(v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __99__PKSecureElement_accessSecureElementManagerSessionWithSessionExchangeToken_callbackQueue_handler___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)accessSecureElementManagerSessionWithHandler:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PKSecureElement_accessSecureElementManagerSessionWithHandler___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

void __64__PKSecureElement_accessSecureElementManagerSessionWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v1, "_startSecureElementManagerSessionWithType:handler:", 0, v2);

}

- (void)accessPrioritySecureElementManagerSessionWithHandler:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKSecureElement_accessPrioritySecureElementManagerSessionWithHandler___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

void __72__PKSecureElement_accessPrioritySecureElementManagerSessionWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v1, "_startSecureElementManagerSessionWithType:handler:", 1, v2);

}

- (void)accessAsyncSecureElementManagerSessionWithHandler:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PKSecureElement_accessAsyncSecureElementManagerSessionWithHandler___block_invoke;
  v7[3] = &unk_1E2ABE058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

void __69__PKSecureElement_accessAsyncSecureElementManagerSessionWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v1, "_startSecureElementManagerSessionWithType:handler:", 2, v2);

}

- (void)_startSecureElementManagerSessionWithType:(int64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  BOOL *p_startingAsyncSession;
  NSMutableArray *asyncSessionAccessHandlers;
  void *v10;
  NSObject *v11;
  int64_t sessionCounter;
  NSObject *v13;
  void (**secureElementSessionPrelude)(void);
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  int64_t v25;
  char v26;
  _QWORD aBlock[5];
  id v28;
  char v29;
  uint8_t buf[4];
  PKSecureElement *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_26;
  if (a3 == 2)
  {
    p_startingAsyncSession = &self->_startingAsyncSession;
    asyncSessionAccessHandlers = self->_asyncSessionAccessHandlers;
  }
  else if (a3 == 1)
  {
    p_startingAsyncSession = &self->_startingPrioritySession;
    asyncSessionAccessHandlers = self->_prioritySessionAccessHandlers;
  }
  else
  {
    if (a3)
    {
      p_startingAsyncSession = 0;
      goto LABEL_10;
    }
    p_startingAsyncSession = &self->_startingSession;
    asyncSessionAccessHandlers = self->_sessionAccessHandlers;
  }
  v10 = _Block_copy(v6);
  -[NSMutableArray addObject:](asyncSessionAccessHandlers, "addObject:", v10);

LABEL_10:
  if (*p_startingAsyncSession)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v31 = self;
      v32 = 2048;
      v33 = a3;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): session of type %ld is already starting - coalescing.", buf, 0x16u);
    }
  }
  else
  {
    sessionCounter = self->_sessionCounter;
    self->_sessionCounter = sessionCounter + 1;
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v31 = self;
      v32 = 2048;
      v33 = sessionCounter;
      v34 = 2048;
      v35 = a3;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu): starting session with type %ld.", buf, 0x20u);
    }

    *p_startingAsyncSession = 1;
    secureElementSessionPrelude = (void (**)(void))self->_secureElementSessionPrelude;
    if (secureElementSessionPrelude)
      secureElementSessionPrelude[2]();
    v15 = (void *)objc_msgSend(self->_secureElementSessionPostlude, "copy");
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke;
    aBlock[3] = &unk_1E2AC9E68;
    v29 = sessionCounter;
    aBlock[4] = self;
    v28 = v15;
    v11 = v15;
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_206;
    v23[3] = &unk_1E2AC9EB8;
    v24 = _Block_copy(aBlock);
    v25 = a3;
    v26 = sessionCounter;
    v23[4] = self;
    v17 = v24;
    v18 = _Block_copy(v23);
    kdebug_trace();
    if (PKSecureElementIsAvailable()
      && (objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI"),
          (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = v19;
      if (a3 == 1)
        v21 = (id)objc_msgSend(v19, "startSecureElementManagerSessionWithPriority:", v18);
      else
        v22 = (id)objc_msgSend(v19, "startSecureElementManagerSession:", v18);

    }
    else
    {
      (*((void (**)(void *, _QWORD, _QWORD))v18 + 2))(v18, 0, 0);
    }

  }
LABEL_26:

}

void __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 134218240;
      v13 = v5;
      v14 = 2048;
      v15 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu): ending session.", buf, 0x16u);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_204;
    v9[3] = &unk_1E2ABDAB8;
    v7 = *(id *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v3, "endSessionWithCompletion:", v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      (*(void (**)(void))(v8 + 16))();
      kdebug_trace();
    }
  }

}

uint64_t __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_204(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v7 = 134218240;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu): ended session.", (uint8_t *)&v7, 0x16u);
  }

  return kdebug_trace();
}

void __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 48);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_2;
  v13[3] = &unk_1E2AC9E90;
  v10 = *(_QWORD *)(a1 + 48);
  v13[4] = v7;
  v14 = v6;
  v17 = v10;
  v15 = v5;
  v18 = *(_BYTE *)(a1 + 56);
  v16 = v8;
  v11 = v5;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 32) + 73) = 0;
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
LABEL_2:
    v3 = objc_msgSend(v2, "code");
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3 == 12)
    {
      if (v5)
      {
        v6 = *(unsigned __int8 *)(a1 + 72);
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v23 = v7;
        v24 = 2048;
        v25 = v6;
        v26 = 2112;
        v27 = v8;
        v9 = "PKSecureElement (%p:%lu): failed to start session: %@. SE sessions can only be started from Wallet while it"
             " is active. It is preferred to start an SE session from passd.";
LABEL_7:
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, v9, buf, 0x20u);
      }
    }
    else if (v5)
    {
      v10 = *(unsigned __int8 *)(a1 + 72);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v23 = v11;
      v24 = 2048;
      v25 = v10;
      v26 = 2112;
      v27 = v12;
      v9 = "PKSecureElement (%p:%lu): failed to start session: %@.";
      goto LABEL_7;
    }
    v13 = 0;
    goto LABEL_9;
  }
  v16 = *(id *)(a1 + 48);
  if (!v16)
  {
    v2 = *(void **)(a1 + 40);
    goto LABEL_2;
  }
  v13 = v16;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(unsigned __int8 *)(a1 + 72);
    *(_DWORD *)buf = 134218240;
    v23 = v17;
    v24 = 2048;
    v25 = v18;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p:%lu): started session.", buf, 0x16u);
  }
LABEL_9:

  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(void **)(a1 + 32);
  if (v14 == 2)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_207;
    v19[3] = &unk_1E2ABDA18;
    v21 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v15, "_executeSecureElementAsyncSessionHandlersWithSession:completion:", v13, v19);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_executeSecureElementSessionHandlersWithPriority:session:", v14 == 1, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __69__PKSecureElement__startSecureElementManagerSessionWithType_handler___block_invoke_207(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_executeSecureElementSessionHandlersWithPriority:(BOOL)a3 session:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
    v7 = 88;
  else
    v7 = 80;
  v8 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v7), "copy");
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "removeAllObjects");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)_executeSecureElementAsyncSessionHandlersWithSession:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  PKAsyncUnaryOperationComposer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKSecureElement: Starting to execute raw session handlers", buf, 2u);
  }

  v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (void *)-[NSMutableArray copy](self->_asyncSessionAccessHandlers, "copy");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14);
        v22[0] = v11;
        v22[1] = 3221225472;
        v22[2] = __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke;
        v22[3] = &unk_1E2AC9EE0;
        v24 = v15;
        v23 = v6;
        -[PKAsyncUnaryOperationComposer addOperation:](v8, "addOperation:", v22);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_asyncSessionAccessHandlers, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_212;
  v20[3] = &unk_1E2AC9F08;
  v21 = v19;
  v17 = v19;
  v18 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v8, "evaluateWithInput:completion:", v16, v20);

}

void __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, _QWORD *);
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement: Executing raw session handler", buf, 2u);
  }

  v11 = a1 + 32;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v11 + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_209;
  v15[3] = &unk_1E2ABDA18;
  v16 = v6;
  v17 = v7;
  v12 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v10 + 16);
  v13 = v6;
  v14 = v7;
  v12(v10, v9, v15);

}

uint64_t __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_209(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKSecureElement: Raw session handler execution finished", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__PKSecureElement__executeSecureElementAsyncSessionHandlersWithSession_completion___block_invoke_212(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement: All raw session handler execution finished", v10, 2u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)contactlessPaymentPassesAvailableDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Contactless Payment passes available did change", v4, 2u);
  }

  os_unfair_lock_lock(&self->_observersLock);
  -[PKSecureElement _updateHardwareManagerListener](self, "_updateHardwareManagerListener");
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)_updateHardwareManagerListener
{
  NSUInteger v3;
  NSObject *sessionQueue;
  _QWORD v5[6];

  v3 = -[NSHashTable count](self->_observers, "count");
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PKSecureElement__updateHardwareManagerListener__block_invoke;
  v5[3] = &unk_1E2AC4430;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(sessionQueue, v5);
}

void __49__PKSecureElement__updateHardwareManagerListener__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  int v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40) && PDContactlessPaymentPassesAvailable() && PKSecureElementIsAvailable() != 0;
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 116);
    LODWORD(v8) = 67109376;
    HIDWORD(v8) = v4;
    LOWORD(v9) = 1024;
    *(_DWORD *)((char *)&v9 + 2) = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Updating hardware listener from %d to %d", (uint8_t *)&v8, 0xEu);
  }

  v5 = *(_BYTE **)(a1 + 32);
  if (((v2 ^ (v5[116] == 0)) & 1) == 0)
  {
    if (v2)
    {
      v6 = v5;
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __SharedHardwareManagerEventListenerAdd_block_invoke;
      v11 = &unk_1E2ACA498;
      v12 = v6;
      v7 = v6;
      _SharedHardwareManagerEventListenerAccess(1, &v8);

    }
    else
    {
      SharedHardwareManagerEventListenerRemove(v5);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 116) = v2;
  }
}

- (void)secureElement:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *replyQueue;
  _QWORD v6[5];
  BOOL v7;

  v4 = a4;
  replyQueue = self->_replyQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PKSecureElement_secureElement_didChangeRestrictedMode___block_invoke;
  v6[3] = &unk_1E2ABE1C0;
  v6[4] = self;
  v7 = a4;
  dispatch_async(replyQueue, v6);
  if (v4)
    AnalyticsSendEvent();
}

void __57__PKSecureElement_secureElement_didChangeRestrictedMode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  if (*(_BYTE *)(a1 + 40))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "secureElementDidEnterRestrictedMode:", *(_QWORD *)(a1 + 32));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v5);
    }
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v2;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "secureElementDidLeaveRestrictedMode:", *(_QWORD *)(a1 + 32), (_QWORD)v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v11);
    }
  }

}

- (void)remoteAdminCleanupProgress:(double)a3
{
  NSObject *replyQueue;
  _QWORD v4[6];

  replyQueue = self->_replyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PKSecureElement_remoteAdminCleanupProgress___block_invoke;
  v4[3] = &unk_1E2AC4430;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(replyQueue, v4);
}

void __46__PKSecureElement_remoteAdminCleanupProgress___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidUpdateToProgress:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  if (*(double *)(a1 + 40) >= 1.0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Successfully deleted all applets, unregistering applet event listeners", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterEventListener:", *(_QWORD *)(a1 + 32));

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 16);
    if (v12)
    {
      dispatch_source_cancel(v12);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 16);
      *(_QWORD *)(v13 + 16) = 0;

      v11 = *(_QWORD *)(a1 + 32);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 32));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v3;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v19);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "secureElement:deletionOfAppletsDidFinishWithSuccess:", *(_QWORD *)(a1 + 32), 1, (_QWORD)v21);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v17);
    }

  }
}

- (void)initializeSecureElementQueuingServerConnection:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;
  _QWORD v9[4];
  OS_dispatch_queue *v10;
  id v11;
  BOOL v12;

  v6 = a4;
  if (PKSecureElementIsAvailable())
  {
    v7 = self->_replyQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke;
    v9[3] = &unk_1E2AC9F30;
    v12 = a3;
    v10 = v7;
    v11 = v6;
    v8 = v7;
    -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v9);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

void __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v13 = 0;
    v14 = 0;
    LOBYTE(v6) = 0;
    goto LABEL_16;
  }
  v5 = *(unsigned __int8 *)(a1 + 48);
  v27 = 0;
  v6 = objc_msgSend(v3, "deleteAllApplets:error:", v5, &v27);
  v7 = v27;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v9)
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v10 = "Secure Element pairing succeeded.";
    v11 = v8;
    v12 = 2;
  }
  else
  {
    if (!v9)
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v29 = v7;
    v10 = "Failed initializing the Secure Element pairing. Error: %@";
    v11 = v8;
    v12 = 12;
  }
  _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_9:

  v25 = 0;
  v26 = 0;
  v24 = v7;
  v15 = objc_msgSend(v4, "getCryptogram:challengeResponse:error:", &v26, &v25, &v24);
  v14 = v26;
  v13 = v25;
  v16 = v24;

  if (!v15 || !v13 || !v14)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Could not fetch cryptogam and challenge. Error: %@", buf, 0xCu);
    }

  }
LABEL_16:
  v17 = *(void **)(a1 + 40);
  if (v17)
  {
    v18 = *(NSObject **)(a1 + 32);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke_222;
    v19[3] = &unk_1E2ABDC70;
    v22 = v17;
    v23 = v6;
    v20 = v14;
    v21 = v13;
    dispatch_async(v18, v19);

  }
}

uint64_t __81__PKSecureElement_initializeSecureElementQueuingServerConnection_withCompletion___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)initializeSecureElementIfNecessaryWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke;
  v6[3] = &unk_1E2AC3E70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKSecureElement pairingStateWithCompletion:](self, "pairingStateWithCompletion:", v6);

}

void __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  switch(a2)
  {
    case 3:
      goto LABEL_4;
    case 2:
      v4 = 1;
      break;
    case 0:
      goto LABEL_4;
    default:
      v4 = 0;
      break;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isOwnable")
    || ((v5 = objc_msgSend(*(id *)(a1 + 32), "ownershipStateForCurrentUser"), v5 <= 4)
      ? (v6 = ((1 << v5) & 0x16) == 0)
      : (v6 = 1),
        !v6))
  {
    if (v4)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Initializing Secure Element...", buf, 2u);
      }

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_223;
      v13[3] = &unk_1E2ABE340;
      v8 = *(void **)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v8, "initializeSecureElementQueuingServerConnection:withCompletion:", 1, v13);
      v9 = v14;
      goto LABEL_19;
    }
LABEL_18:
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_2;
    v11[3] = &unk_1E2ABE340;
    v10 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v10, "SEPPairingInfoWithCompletion:", v11);
    v9 = v12;
LABEL_19:

    return;
  }
  if (!v4)
    goto LABEL_18;
LABEL_4:
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0, 0);
}

uint64_t __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_223(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__PKSecureElement_initializeSecureElementIfNecessaryWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)SEPPairingInfoWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD v9[4];
  OS_dispatch_queue *v10;
  id v11;

  v4 = a3;
  if (PKSecureElementIsAvailable())
  {
    v5 = self->_replyQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke;
    v9[3] = &unk_1E2AC9F58;
    v10 = v5;
    v11 = v4;
    v6 = v5;
    -[PKSecureElement accessPrioritySecureElementManagerSessionWithHandler:](self, "accessPrioritySecureElementManagerSessionWithHandler:", v9);

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Secure element not available", v8, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

}

void __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;
  uint8_t buf[16];
  id v18;
  id v19;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v18 = 0;
    v19 = 0;
    v5 = objc_msgSend(v3, "getCryptogram:challengeResponse:", &v19, &v18);
    v6 = v19;
    v7 = v18;
    v8 = v7;
    if (v5 && v7 && v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: Could not fetch cryptogam and challenge.", buf, 2u);
      }

    }
  }
  else
  {
    v6 = 0;
    v8 = 0;
    LOBYTE(v5) = 0;
  }
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke_226;
    v12[3] = &unk_1E2ABDC70;
    v15 = v10;
    v16 = v5;
    v13 = v6;
    v14 = v8;
    dispatch_async(v11, v12);

  }
}

uint64_t __48__PKSecureElement_SEPPairingInfoWithCompletion___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)pairingStateWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;
  _QWORD v7[4];
  OS_dispatch_queue *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    if (PKSecureElementIsAvailable())
    {
      v5 = self->_replyQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __46__PKSecureElement_pairingStateWithCompletion___block_invoke;
      v7[3] = &unk_1E2AC9F58;
      v8 = v5;
      v9 = v4;
      v6 = v5;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v7);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __46__PKSecureElement_pairingStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v10 = 0;
    v3 = objc_msgSend(a2, "validateSEPairings:", &v10);
    v4 = 3;
    if (v3 != 24)
      v4 = v3 == 0;
    if (v3 == 27)
      v5 = 2;
    else
      v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PKSecureElement_pairingStateWithCompletion___block_invoke_2;
  block[3] = &unk_1E2AC1C68;
  v6 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v5;
  dispatch_async(v6, block);

}

uint64_t __46__PKSecureElement_pairingStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)hasRegistrationInformation
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registrationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)setRegistrationInformation:(id)a3 primaryRegionTopic:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setRegistrationInfo:primaryRegionTopic:", v5, v6);

  if ((v8 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to set Secure Element Registration Info: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  return v8;
}

- (id)_allAppletsWithSession:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    v4 = a3;
    objc_msgSend(v3, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allApplets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__PKSecureElement__allAppletsWithSession___block_invoke;
    v10[3] = &unk_1E2AC9F80;
    v7 = v5;
    v11 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

void __42__PKSecureElement__allAppletsWithSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "managedBySP") & 1) == 0)
  {
    +[PKSecureElementApplet secureElementAppletWithInternalApplet:](PKSecureElementApplet, "secureElementAppletWithInternalApplet:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (id)_appletsForAIDs:(id)a3 withSession:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "appletWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            +[PKSecureElementApplet secureElementAppletWithInternalApplet:](PKSecureElementApplet, "secureElementAppletWithInternalApplet:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }
  v15 = (void *)objc_msgSend(v7, "copy", (_QWORD)v17);

  return v15;
}

- (void)allAppletsWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;
  _QWORD v7[4];
  OS_dispatch_queue *v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (v4)
  {
    if (PKSecureElementIsAvailable())
    {
      objc_initWeak(&location, self);
      v5 = self->_replyQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __44__PKSecureElement_allAppletsWithCompletion___block_invoke;
      v7[3] = &unk_1E2AC9FA8;
      objc_copyWeak(&v10, &location);
      v6 = v5;
      v8 = v6;
      v9 = v4;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v7);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

void __44__PKSecureElement_allAppletsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_allAppletsWithSession:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PKSecureElement_allAppletsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E2ABDA18;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __44__PKSecureElement_allAppletsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)allAppletsAndCredentialsWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (v4)
  {
    if (!PKSecureElementIsAvailable())
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke;
    v5[3] = &unk_1E2AC9FF8;
    v5[4] = self;
    v6 = v4;
    -[PKSecureElement accessAsyncSecureElementManagerSessionWithHandler:](self, "accessAsyncSecureElementManagerSessionWithHandler:", v5);

  }
}

void __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "_allAppletsWithSession:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke_2;
  v12[3] = &unk_1E2AC9FD0;
  v14 = v5;
  v9 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v13 = v8;
  v10 = v8;
  v11 = v5;
  objc_msgSend(v9, "_credentialsForAIDs:session:completion:", 0, v7, v12);

}

void __58__PKSecureElement_allAppletsAndCredentialsWithCompletion___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  v3 = a1[5];
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  v4 = a1[6];
  v5 = a1[4];
  if (objc_msgSend(v7, "count"))
    v6 = v7;
  else
    v6 = 0;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v6);

}

- (void)appletCredentialsForAIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (!PKSecureElementIsAvailable())
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke;
    v8[3] = &unk_1E2ACA048;
    v10 = v7;
    v8[4] = self;
    v9 = v6;
    -[PKSecureElement accessAsyncSecureElementManagerSessionWithHandler:](self, "accessAsyncSecureElementManagerSessionWithHandler:", v8);

  }
}

void __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke_2;
    v12[3] = &unk_1E2ACA020;
    v13 = v6;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_credentialsForAIDs:session:completion:", v9, v5, v12);

  }
  else
  {
    if (v6)
      v6[2](v6);
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

  }
}

void __55__PKSecureElement_appletCredentialsForAIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  v4 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(v6, "count"))
    v5 = v6;
  else
    v5 = 0;
  (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

}

- (void)_credentialsForAIDs:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD *v12;
  PKDAManager *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *replyQueue;
  id v20;
  id v21;
  id v22;
  PKSecureElement *v23;
  id obj;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = dispatch_group_create();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (_QWORD *)&unk_190441000;
  if (v8)
  {
    v22 = v9;
    v13 = objc_alloc_init(PKDAManager);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = self;
    -[PKSecureElement secureElementIdentifiers](self, "secureElementIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17);
          dispatch_group_enter(v10);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke;
          v29[3] = &unk_1E2ACA070;
          v30 = v25;
          v31 = v11;
          v32 = v10;
          -[PKDAManager listCredentialsWithSession:seid:completion:](v13, "listCredentialsWithSession:seid:completion:", v8, v18, v29);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v15);
    }

    v9 = v22;
    self = v23;
    v12 = &unk_190441000;
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = v12[267];
  block[2] = __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke_2;
  block[3] = &unk_1E2ABDA18;
  v27 = v11;
  v28 = v9;
  v20 = v11;
  v21 = v9;
  dispatch_group_notify(v10, replyQueue, block);

}

void __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "appletIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (__CFString *)v9;
        else
          v11 = CFSTR("A000000809434343444B417631");
        v12 = v11;

        v13 = *(void **)(a1 + 32);
        if (!v13 || objc_msgSend(v13, "containsObject:", v12))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v14, v12);
          }
          objc_msgSend(v14, "addObject:", v8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __58__PKSecureElement__credentialsForAIDs_session_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)consistencyCheckDeviceCredentialsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  _QWORD v5[5];
  void (**v6)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    if (!PKSecureElementIsAvailable())
      v4[2](v4, 0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke;
    v5[3] = &unk_1E2AC9FF8;
    v5[4] = self;
    v6 = v4;
    -[PKSecureElement accessAsyncSecureElementManagerSessionWithHandler:](self, "accessAsyncSecureElementManagerSessionWithHandler:", v5);

  }
}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PKDAManager *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  PKAsyncUnaryOperationComposer *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  PKDAManager *v37;
  id v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v8 = (_QWORD *)&unk_190441000;
  if (v5)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_allAppletsWithSession:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          +[PKSEConsistencyCheckDeviceCredential deviceCredentialWithApplet:](PKSEConsistencyCheckDeviceCredential, "deviceCredentialWithApplet:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v11);
    }
    v30 = v6;
    v15 = v5;

    v16 = objc_alloc_init(PKDAManager);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = a1;
    objc_msgSend(*(id *)(a1 + 32), "secureElementIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v21);
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_2;
          v36[3] = &unk_1E2ACA0C0;
          v37 = v16;
          v38 = v15;
          v39 = v22;
          v40 = v7;
          -[PKAsyncUnaryOperationComposer addOperation:](v31, "addOperation:", v36);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v19);
    }

    v5 = v15;
    a1 = v29;
    v6 = v30;
    v8 = &unk_190441000;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = v8[267];
  v32[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_4;
  v32[3] = &unk_1E2ACA0E8;
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(a1 + 40);
  v34 = v6;
  v32[4] = v24;
  v35 = v25;
  v33 = v7;
  v26 = v7;
  v27 = v6;
  v28 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v31, "evaluateWithInput:completion:", v23, v32);

}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E2ACA098;
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v16 = v6;
  v17 = v7;
  v15 = v11;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v8, "listDACredentialsWithSession:seid:completion:", v9, v10, v14);

}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        +[PKSEConsistencyCheckDeviceCredential deviceCredentialWithDAKeyInformation:](PKSEConsistencyCheckDeviceCredential, "deviceCredentialWithDAKeyInformation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_5;
  v4[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

}

uint64_t __67__PKSecureElement_consistencyCheckDeviceCredentialsWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

- (void)appletWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  PKSecureElementApplet *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKSecureElementApplet *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *v16;
  _QWORD v17[4];
  id v18;
  OS_dispatch_queue *v19;
  void (**v20)(id, void *);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (PKMockOsloSecureElementAuth())
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement appletWithIdentifier: mocking applet from SE", buf, 2u);
      }

      v9 = [PKSecureElementApplet alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKSecureElementApplet initWithIdentifier:packageIdentifier:lifecycleState:locked:containsSubKeys:](v9, "initWithIdentifier:packageIdentifier:lifecycleState:locked:containsSubKeys:", v11, v13, 15, 0, 0);

      v7[2](v7, v14);
    }
    else if (PKSecureElementIsAvailable())
    {
      v15 = self->_replyQueue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__PKSecureElement_appletWithIdentifier_completion___block_invoke;
      v17[3] = &unk_1E2ACA2F8;
      v18 = v6;
      v19 = v15;
      v20 = v7;
      v16 = v15;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v17);

    }
    else
    {
      v7[2](v7, 0);
    }
  }

}

void __51__PKSecureElement_appletWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "appletWithIdentifier:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[PKSecureElementApplet secureElementAppletWithInternalApplet:](PKSecureElementApplet, "secureElementAppletWithInternalApplet:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKSecureElement appletWithIdentifier: failed to get NFApplet for identifier: %@ from NearField.", buf, 0xCu);
      }

      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PKSecureElement_appletWithIdentifier_completion___block_invoke_236;
  v10[3] = &unk_1E2ABDA18;
  v7 = *(NSObject **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v11 = v4;
  v12 = v8;
  v9 = v4;
  dispatch_async(v7, v10);

}

uint64_t __51__PKSecureElement_appletWithIdentifier_completion___block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)areAnyAppletsSuspendedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E2AC9F58;
    v6[4] = self;
    v7 = v4;
    -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v6);

  }
}

void __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  char v12;
  int v13;
  void (*v14)(void);
  NSObject *v15;
  const __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "secureElementIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          SESEndPointListContainers();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 0;
          if (v10)
          {
            v11 = v10;

          }
          else
          {
            v12 = objc_msgSend(v9, "pk_containsObjectPassingTest:", &__block_literal_global_238);

            if ((v12 & 1) != 0)
            {
              v13 = 1;
              goto LABEL_15;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "_allAppletsWithSession:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "pk_containsObjectPassingTest:", &__block_literal_global_240);
LABEL_15:

    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("N");
      if (v13)
        v16 = CFSTR("Y");
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKSecureElement areAnyAppletsSuspendedWithCompletionHandler returning %@", buf, 0xCu);
    }

    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v14();

}

uint64_t __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuspended");
}

uint64_t __63__PKSecureElement_areAnyAppletsSuspendedWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocked");
}

- (void)markAllAppletsForDeletionWithExternalAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_completion___block_invoke;
  v8[3] = &unk_1E2ABE518;
  v9 = v6;
  v7 = v6;
  -[PKSecureElement markAllAppletsForDeletionWithExternalAuthorization:obliterate:completion:](self, "markAllAppletsForDeletionWithExternalAuthorization:obliterate:completion:", a3, 1, v8);

}

uint64_t __81__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)markAllAppletsForDeletionWithExternalAuthorization:(id)a3 obliterate:(BOOL)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t);
  void *v8;
  id v9;
  _QWORD v10[5];
  void (**v11)(id, uint64_t);
  BOOL v12;

  v7 = (void (**)(id, uint64_t))a5;
  if (PKSecureElementIsAvailable())
  {
    if (-[PKSecureElement isDeletingAllApplets](self, "isDeletingAllApplets"))
    {
      if (v7)
        v7[2](v7, 1);
    }
    else
    {
      objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke;
      v10[3] = &unk_1E2ACA1B8;
      v12 = a4;
      v10[4] = self;
      v11 = v7;
      v9 = (id)objc_msgSend(v8, "startSecureElementManagerSession:", v10);

    }
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  dispatch_source_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  NSObject *v33;
  NSObject *v34;
  dispatch_time_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  _QWORD v45[5];
  _QWORD block[5];
  char v47;
  _QWORD handler[5];
  NSObject *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  uint8_t v55[4];
  id v56;
  __int128 buf;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v58 = 0x2020000000;
    v59 = 0;
    objc_msgSend(v5, "allApplets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2;
    v54[3] = &unk_1E2ACA190;
    v54[4] = &buf;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v54);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
    {
      if (*(_BYTE *)(a1 + 48))
      {
        v53 = 0;
        v10 = objc_msgSend(v5, "deleteAllApplets:error:", 1, &v53);
        v11 = v53;
        if (v10)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v55 = 0;
            v13 = "All Applets marked for delete and server connection queued.";
LABEL_17:
            _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v13, v55, 2u);
            goto LABEL_18;
          }
          goto LABEL_18;
        }
      }
      else
      {
        v52 = 0;
        objc_msgSend(v5, "deleteAllAppletsOfType:queueConnection:error:", 4, 1, &v52);
        v11 = v52;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v55 = 138412290;
        v56 = v11;
        v19 = "Failed to mark all Applets for deletion. Error: %@";
LABEL_25:
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v19, v55, 0xCu);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "No Applets exist to mark for delete. Ensuring non applet SE data is removed.", v55, 2u);
      }

      if (*(_BYTE *)(a1 + 48))
      {
        v51 = 0;
        v18 = objc_msgSend(v5, "deleteAllApplets:error:", 0, &v51);
        v11 = v51;
        if (v18)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v55 = 0;
            v13 = "All SE data removed.";
            goto LABEL_17;
          }
LABEL_18:
          v17 = 1;
LABEL_27:

          v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
          v21 = *(_QWORD *)(a1 + 32);
          if (v20)
          {
            *(_BYTE *)(v21 + 8) = 1;
            PKLogFacilityTypeGetObject(6uLL);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v55 = 0;
              _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Beginning to delete applets; registering for updates",
                v55,
                2u);
            }

            objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "registerEventListener:", *(_QWORD *)(a1 + 32));

            v24 = *(_QWORD *)(a1 + 32);
            v25 = *(NSObject **)(v24 + 16);
            if (v25)
            {
              dispatch_source_cancel(v25);
              v26 = *(_QWORD *)(a1 + 32);
              v27 = *(void **)(v26 + 16);
              *(_QWORD *)(v26 + 16) = 0;

              v24 = *(_QWORD *)(a1 + 32);
            }
            v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
            v29 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v24 + 24));
            v30 = *(_QWORD *)(a1 + 32);
            v31 = *(void **)(v30 + 16);
            *(_QWORD *)(v30 + 16) = v29;

            v32 = (double)(unint64_t)(60 * v28 + 30);
            v33 = v29;
            v34 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
            v35 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
            dispatch_source_set_timer(v34, v35, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
            v36 = *(_QWORD *)(a1 + 32);
            v37 = *(NSObject **)(v36 + 16);
            handler[0] = v9;
            handler[1] = 3221225472;
            handler[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_246;
            handler[3] = &unk_1E2ABE0D0;
            handler[4] = v36;
            v49 = v33;
            v38 = v33;
            dispatch_source_set_event_handler(v37, handler);
            dispatch_resume(v38);
            os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));

          }
          else
          {
            v39 = *(NSObject **)(v21 + 16);
            if (v39)
            {
              dispatch_source_cancel(v39);
              v40 = *(_QWORD *)(a1 + 32);
              v41 = *(void **)(v40 + 16);
              *(_QWORD *)(v40 + 16) = 0;

              v21 = *(_QWORD *)(a1 + 32);
            }
            os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 32));
            v42 = *(_QWORD *)(a1 + 32);
            v43 = *(NSObject **)(v42 + 40);
            block[0] = v9;
            block[1] = 3221225472;
            block[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2_248;
            block[3] = &unk_1E2ABE1C0;
            block[4] = v42;
            v47 = v17;
            dispatch_async(v43, block);
          }
          objc_msgSend(v5, "endSession");

          _Block_object_dispose(&buf, 8);
          goto LABEL_37;
        }
      }
      else
      {
        v50 = 0;
        objc_msgSend(v5, "deleteAllAppletsOfType:queueConnection:error:", 4, 0, &v50);
        v11 = v50;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v55 = 138412290;
        v56 = v11;
        v19 = "Failed to remove all SE data. Error: %@";
        goto LABEL_25;
      }
    }
    v17 = 0;
    goto LABEL_27;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Secure Element Session Error: %@", (uint8_t *)&buf, 0xCu);
  }

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(NSObject **)(v15 + 40);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_249;
  v45[3] = &unk_1E2ABE120;
  v45[4] = v15;
  dispatch_async(v16, v45);
  v17 = 0;
LABEL_37:
  v44 = *(_QWORD *)(a1 + 40);
  if (v44)
    (*(void (**)(uint64_t, uint64_t))(v44 + 16))(v44, v17);

}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "managedBySP") & 1) == 0)
  {
    v3 = objc_msgSend(v4, "lifecycleState");
    if ((objc_msgSend(v4, "isGPLocked") & 1) != 0 || (v3 - 129) < 2 || v3 == 15)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_246(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Server deletion payment applications timed out.", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterEventListener:", *(_QWORD *)(a1 + 32));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  if (v5 == *(void **)(v4 + 16))
  {
    *(_QWORD *)(v4 + 16) = 0;

    v4 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_247;
  block[3] = &unk_1E2ABE120;
  block[4] = v6;
  dispatch_async(v7, block);
}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_247(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidFinishWithSuccess:", *(_QWORD *)(a1 + 32), 0, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_2_248(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (*(_BYTE *)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidUpdateToProgress:", *(_QWORD *)(a1 + 32), 1.0, (_QWORD)v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidFinishWithSuccess:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __92__PKSecureElement_markAllAppletsForDeletionWithExternalAuthorization_obliterate_completion___block_invoke_249(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "secureElement:deletionOfAppletsDidFinishWithSuccess:", *(_QWORD *)(a1 + 32), 0, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)markAppletWithIdentifierForDeletion:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSecureElement markAppletsWithIdentifiersForDeletion:completion:](self, "markAppletsWithIdentifiersForDeletion:completion:", v9, v7, v10, v11);
}

- (void)markAppletsWithIdentifiersForDeletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PKSecureElement *v15;
  OS_dispatch_queue *v16;
  id v17;
  uint8_t buf[4];
  PKSecureElement *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): deleting applets %@.", buf, 0x16u);
  }

  v9 = self->_replyQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke;
  v13[3] = &unk_1E2ACA280;
  v14 = v6;
  v15 = self;
  v16 = v9;
  v17 = v7;
  v10 = v9;
  v11 = v7;
  v12 = v6;
  -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v13);

}

void __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  int8x16_t v23;
  _QWORD block[4];
  id v25;
  char v26;
  id v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  int8x16_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)a1[2].i64[0];
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_2;
    v28[3] = &unk_1E2ACA1E0;
    v7 = v3;
    v29 = v7;
    v8 = v5;
    v30 = v8;
    v23 = a1[2];
    v9 = (id)v23.i64[0];
    v31 = vextq_s8(v23, v23, 8uLL);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v28);
    if (!-[NSObject count](v8, "count"))
    {
      LOBYTE(v10) = 0;
LABEL_15:

      goto LABEL_16;
    }
    v27 = 0;
    v10 = objc_msgSend(v7, "deleteApplets:queueServerConnection:error:", v8, 1, &v27);
    v11 = v27;
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (!v10 || v11)
    {
      if (v13)
      {
        v20 = a1[2].i64[1];
        *(_DWORD *)buf = 134218498;
        v33 = v20;
        v34 = 2112;
        v35 = v8;
        v36 = 2112;
        v37 = v11;
        v15 = "PKSecureElement (%p): failed to delete applets %@ - %@.";
        v16 = v12;
        v17 = 32;
        goto LABEL_13;
      }
    }
    else if (v13)
    {
      v14 = a1[2].i64[1];
      *(_DWORD *)buf = 134218242;
      v33 = v14;
      v34 = 2112;
      v35 = v8;
      v15 = "PKSecureElement (%p): deleted applets %@.";
      v16 = v12;
      v17 = 22;
LABEL_13:
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }

    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = a1[2].i64[0];
    v18 = a1[2].i64[1];
    *(_DWORD *)buf = 134218242;
    v33 = v18;
    v34 = 2112;
    v35 = v19;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): no session to delete applets %@.", buf, 0x16u);
  }
  LOBYTE(v10) = 0;
LABEL_16:

  v21 = (void *)a1[3].i64[1];
  if (v21)
  {
    v22 = a1[3].i64[0];
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_252;
    block[3] = &unk_1E2ABDCC0;
    v25 = v21;
    v26 = v10;
    dispatch_async(v22, block);

  }
}

void __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "appletWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKSecureElement (%p): cannot find applet %@ to delete.", (uint8_t *)&v7, 0x16u);
    }

  }
}

uint64_t __68__PKSecureElement_markAppletsWithIdentifiersForDeletion_completion___block_invoke_252(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)signChallenge:(id)a3 forPaymentApplication:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  int IsAvailable;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  OS_dispatch_queue *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    IsAvailable = PKSecureElementIsAvailable();
    if (v8
      && IsAvailable
      && (objc_msgSend(v9, "applicationIdentifier"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "length"),
          v12,
          v13))
    {
      v14 = self->_replyQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke;
      v16[3] = &unk_1E2ACA280;
      v17 = v8;
      v18 = v9;
      v19 = v14;
      v20 = v10;
      v15 = v14;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v16);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
  }

}

void __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  PKSecureElementCertificateSet *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PKSecureElementSignatureInfo *v15;
  void *v16;
  void *v17;
  PKSecureElementSignatureInfo *v18;
  NSObject *v19;
  id v20;
  PKSecureElementSignatureInfo *v21;
  id v22;
  _QWORD block[4];
  id v24;
  PKSecureElementSignatureInfo *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = a2;
    objc_msgSend(v4, "applicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    objc_msgSend(v5, "signChallenge:forAID:sigInfo:error:", v3, v6, &v28, &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v28;
    v9 = v27;

    if (v8 && v7)
    {
      v10 = objc_msgSend(v8, "certificateVersion");
      v11 = [PKSecureElementCertificateSet alloc];
      objc_msgSend(v8, "rsaCert");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "eccCert");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKSecureElementCertificateSet initWithRSACertificate:ECDSACertificate:](v11, "initWithRSACertificate:ECDSACertificate:", v12, v13);

      v15 = [PKSecureElementSignatureInfo alloc];
      objc_msgSend(v8, "jsblCounter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "platformId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PKSecureElementSignatureInfo initWithSecureElementCertificateSet:sequenceCounter:platformIdentifier:certificateVersion:](v15, "initWithSecureElementCertificateSet:sequenceCounter:platformIdentifier:certificateVersion:", v14, v16, v17, v10);

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Failed to sign challange. Error: %@", buf, 0xCu);
      }
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
    v7 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke_254;
  block[3] = &unk_1E2ABDA68;
  v19 = *(NSObject **)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  v25 = v18;
  v26 = v20;
  v24 = v7;
  v21 = v18;
  v22 = v7;
  dispatch_async(v19, block);

}

uint64_t __70__PKSecureElement_signChallenge_forPaymentApplication_withCompletion___block_invoke_254(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)signChallenge:(id)a3 signatureEntanglementMode:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  int IsAvailable;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *v12;
  _QWORD v13[5];
  id v14;
  OS_dispatch_queue *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    IsAvailable = PKSecureElementIsAvailable();
    if (v8 && IsAvailable)
    {
      v11 = self->_replyQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke;
      v13[3] = &unk_1E2ACA208;
      v13[4] = self;
      v17 = a4;
      v14 = v8;
      v15 = v11;
      v16 = v9;
      v12 = v11;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }
  }

}

void __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);
  v17 = 0;
  objc_msgSend(v4, "signChallenge:signatureEntanglementMode:session:signatureInfo:error:", v5, v6, v3, &v17, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v17;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke_2;
  v13[3] = &unk_1E2ABDA68;
  v9 = *(NSObject **)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v15 = v8;
  v16 = v10;
  v14 = v7;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

uint64_t __70__PKSecureElement_signChallenge_signatureEntanglementMode_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)signChallenge:(id)a3 signatureEntanglementMode:(unint64_t)a4 session:(id)a5 signatureInfo:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  PKSecureElementSignatureInfo *v15;
  PKSecureElementSignatureInfo *v16;
  uint64_t v17;
  PKSecureElementCertificateSet *v18;
  void *v19;
  void *v20;
  PKSecureElementCertificateSet *v21;
  PKSecureElementSignatureInfo *v22;
  void *v23;
  void *v24;
  PKSecureElementSignatureInfo *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  PKSecureElementSignatureInfo *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (v12)
  {
    v33 = 0;
    v34 = 0;
    objc_msgSend(v12, "signChallenge:useOSVersion:signatureInfo:error:", v11, a4 == 1, &v34, &v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (PKSecureElementSignatureInfo *)v34;
    v16 = (PKSecureElementSignatureInfo *)v33;
    if (v15 && v14)
    {
      v32 = v14;
      v17 = -[PKSecureElementSignatureInfo certificateVersion](v15, "certificateVersion");
      v18 = [PKSecureElementCertificateSet alloc];
      -[PKSecureElementSignatureInfo rsaCert](v15, "rsaCert");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementSignatureInfo eccCert](v15, "eccCert");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PKSecureElementCertificateSet initWithRSACertificate:ECDSACertificate:](v18, "initWithRSACertificate:ECDSACertificate:", v19, v20);

      v22 = [PKSecureElementSignatureInfo alloc];
      -[PKSecureElementSignatureInfo jsblCounter](v15, "jsblCounter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementSignatureInfo platformId](v15, "platformId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PKSecureElementSignatureInfo initWithSecureElementCertificateSet:sequenceCounter:platformIdentifier:certificateVersion:](v22, "initWithSecureElementCertificateSet:sequenceCounter:platformIdentifier:certificateVersion:", v21, v23, v24, v17);

      if (a6)
        *a6 = objc_retainAutorelease(v25);
      v14 = v32;
      v26 = v32;

      v16 = v15;
      goto LABEL_16;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v16;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Failed to sign challange. Error: %@", buf, 0xCu);
    }

    if (a7)
    {
      if (v16)
      {
        v26 = 0;
        *a7 = objc_retainAutorelease(v16);
LABEL_15:
        v25 = v15;
LABEL_16:

        goto LABEL_17;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2938];
      v36 = CFSTR("Sign challenge failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v29);
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a7 = v30;

    }
    v26 = 0;
    goto LABEL_15;
  }
  v26 = 0;
LABEL_17:

  return v26;
}

- (void)signatureForAuthToken:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  OS_dispatch_queue *v11;
  _QWORD v12[4];
  id v13;
  OS_dispatch_queue *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SHA256Hash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "hexEncoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Auth token data to be signed: %@", buf, 0xCu);

  }
  if (v6)
  {
    v11 = self->_replyQueue;
    if (PKSecureElementIsAvailable())
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__PKSecureElement_signatureForAuthToken_completion___block_invoke;
      v12[3] = &unk_1E2ACA2F8;
      v13 = v8;
      v14 = v11;
      v15 = v6;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }

  }
}

void __52__PKSecureElement_signatureForAuthToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v14 = 0;
    objc_msgSend(a2, "signChallenge:certs:error:", v3, 0, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v4)
    {
      objc_msgSend(v4, "hexEncoding");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to sign authentication token. Error: %@", buf, 0xCu);
      }

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKSecureElement_signatureForAuthToken_completion___block_invoke_258;
  block[3] = &unk_1E2ABDA18;
  v8 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v12 = v6;
  v13 = v9;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __52__PKSecureElement_signatureForAuthToken_completion___block_invoke_258(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)stateInformationWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a3;
  if (v3)
  {
    if (PKSecureElementIsAvailable())
    {
      objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __50__PKSecureElement_stateInformationWithCompletion___block_invoke;
      v6[3] = &unk_1E2ACA230;
      v7 = v4;
      v8 = v3;
      v5 = v4;
      objc_msgSend(v5, "getSELDInfoForBroker:", v6);

    }
    else
    {
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    }
  }

}

void __50__PKSecureElement_stateInformationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Secure Element Remote Admin Manager Error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)signedPlatformDataWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;
  _QWORD v7[4];
  OS_dispatch_queue *v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (v4)
  {
    if (PKSecureElementIsAvailable())
    {
      objc_initWeak(&location, self);
      v5 = self->_replyQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke;
      v7[3] = &unk_1E2AC9FA8;
      objc_copyWeak(&v10, &location);
      v6 = v5;
      v8 = v6;
      v9 = v4;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v7);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
  }

}

void __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "primarySecureElementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v28 = 0;
    objc_msgSend(v3, "getSignedPlatformDataForSeid:error:", v5, &v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;
    if (!v6)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
        v31 = 2112;
        v32 = v15;
        v33 = 2112;
        v34 = v7;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to retrieve platform data: %@ error: %@", buf, 0x20u);

      }
      v11 = 0;
      v10 = 0;
      goto LABEL_26;
    }
    PKGetConstantStringNFSignedPlatformData();
    v8 = objc_claimAutoreleasedReturnValue();
    PKGetConstantStringNFSignedPlatformSignatureBlob();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (v9)
          goto LABEL_6;
        goto LABEL_21;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        v10 = 0;
        if (v9)
        {
LABEL_6:
          objc_msgSend(v6, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          PKLogFacilityTypeGetObject(6uLL);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
            v31 = 2112;
            v32 = v23;
            v13 = "%s missing platformDataSignature: %@";
LABEL_23:
            _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

            goto LABEL_24;
          }
          goto LABEL_24;
        }
LABEL_21:
        PKLogFacilityTypeGetObject(6uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
          v31 = 2112;
          v32 = v23;
          v13 = "%s missing platformDataSignatureKey: %@";
          goto LABEL_23;
        }
LABEL_24:

        v11 = 0;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
      v31 = 2112;
      v32 = v17;
      v18 = "%s missing platformData: %@";
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
      v31 = 2112;
      v32 = v17;
      v18 = "%s missing platformDataKey: %@";
    }
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);

    goto LABEL_20;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v30 = "-[PKSecureElement signedPlatformDataWithCompletion:]_block_invoke";
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to create session: %@ ", buf, 0x16u);

  }
  v11 = 0;
  v10 = 0;
LABEL_27:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke_261;
  block[3] = &unk_1E2ABDA68;
  v19 = *(NSObject **)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v26 = v11;
  v27 = v20;
  v25 = v10;
  v21 = v11;
  v22 = v10;
  dispatch_async(v19, block);

}

uint64_t __52__PKSecureElement_signedPlatformDataWithCompletion___block_invoke_261(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)generateTransactionKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke;
  v14[3] = &unk_1E2ACA280;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v14);

}

void __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKDAManager *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(PKDAManager);
    objc_msgSend(*(id *)(a1 + 32), "primarySecureElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_262;
    v10[3] = &unk_1E2ACA2D0;
    v6 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    -[PKDAManager generateTransactionKeyWithSession:seid:readerIdentifier:readerPublicKey:completion:](v4, "generateTransactionKeyWithSession:seid:readerIdentifier:readerPublicKey:completion:", v3, v5, v6, v7, v10);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement GenerateTransactionKeyWithReaderIdentifier failed to get session", buf, 2u);
    }

    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v4 = (PKDAManager *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, PKDAManager *))(v9 + 16))(v9, 0, 0, 0, v4);
  }

}

void __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_262(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "homeKeyInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKeyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appletIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_2;
  block[3] = &unk_1E2ACA258;
  v21 = v5;
  v22 = v11;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v13 = v5;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v12, block);

}

uint64_t __93__PKSecureElement_generateTransactionKeyWithReaderIdentifier_readerPublicKey_withCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)createAliroHomeKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 homeIdentifier:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke;
  v18[3] = &unk_1E2ACA2A8;
  v21 = v12;
  v22 = v13;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v18);

}

void __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKDAManager *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(PKDAManager);
    objc_msgSend(*(id *)(a1 + 32), "primarySecureElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_264;
    v11[3] = &unk_1E2ACA2D0;
    v8 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 64);
    -[PKDAManager createAliroHomeKey:seid:readerIdentifier:readerPublicKey:homeIdentifier:withCompletion:](v4, "createAliroHomeKey:seid:readerIdentifier:readerPublicKey:homeIdentifier:withCompletion:", v3, v5, v8, v6, v7, v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement createAliroHomeKeyWithReaderIdentifier failed to get session", buf, 2u);
    }

    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v4 = (PKDAManager *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, PKDAManager *))(v10 + 16))(v10, 0, 0, 0, v4);
  }

}

void __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_264(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[7];
  id v15;
  id v16;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "homeKeyInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKeyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appletIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_2;
  block[3] = &unk_1E2ACA258;
  v15 = v5;
  v16 = v11;
  block[4] = v8;
  block[5] = v9;
  block[6] = v10;
  v13 = v5;
  dispatch_async(v12, block);

}

uint64_t __104__PKSecureElement_createAliroHomeKeyWithReaderIdentifier_readerPublicKey_homeIdentifier_withCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *sessionQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKSecureElement *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke;
  block[3] = &unk_1E2ABE030;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(sessionQueue, block);

}

void __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke(uint64_t a1)
{
  PKDAManager *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v2 = objc_alloc_init(PKDAManager);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_2;
  v4[3] = &unk_1E2ACA2D0;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  -[PKDAManager generateTransactionKeyWithParameters:withCompletion:](v2, "generateTransactionKeyWithParameters:withCompletion:", v3, v4);

}

void __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "hydraKeyInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKeyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "certificateChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appletIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_3;
  block[3] = &unk_1E2ACA258;
  v21 = v5;
  v22 = v11;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v13 = v5;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v12, block);

}

uint64_t __71__PKSecureElement_generateTransactionKeyWithParameters_withCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)createAliroHydraKeyWithServerParameters:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke;
  v10[3] = &unk_1E2ACA2F8;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v10);

}

void __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKDAManager *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(PKDAManager);
    objc_msgSend(*(id *)(a1 + 32), "primarySecureElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_265;
    v10[3] = &unk_1E2ACA2D0;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    -[PKDAManager createAliroHydraKey:seid:serverParameters:withCompletion:](v4, "createAliroHydraKey:seid:serverParameters:withCompletion:", v3, v5, v6, v10);

LABEL_7:
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement createAliroHydraKeyWithServerParameters failed to get session", buf, 2u);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v4 = (PKDAManager *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, PKDAManager *))(v9 + 16))(v9, 0, 0, 0, v4);
    goto LABEL_7;
  }
LABEL_8:

}

void __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_265(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[7];
  id v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "hydraKeyInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKeyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "certificateChain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appletIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_2;
    block[3] = &unk_1E2ACA258;
    block[4] = v8;
    block[5] = v9;
    v15 = v11;
    block[6] = v10;
    v14 = v5;
    dispatch_async(v12, block);

  }
}

uint64_t __74__PKSecureElement_createAliroHydraKeyWithServerParameters_withCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (BOOL)queueConnectionToServerWithPushTopic:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "queueServerConnection:", v3);

  return v5;
}

- (BOOL)queueConnectionToServerForAppletIdentifiers:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "queueServerConnectionForApplets:", v3);

  return v5;
}

- (void)connectToServerWithPushTopic:(id)a3 completion:(id)a4
{
  -[PKSecureElement connectToServerWithPushTopic:performSECleanup:completion:](self, "connectToServerWithPushTopic:performSECleanup:completion:", a3, 0, a4);
}

- (void)connectToServerWithPushTopic:(id)a3 performSECleanup:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  if (v5)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PerformSECleanup"));
  v12 = (void *)objc_msgSend(v11, "copy");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PKSecureElement_connectToServerWithPushTopic_performSECleanup_completion___block_invoke;
  v14[3] = &unk_1E2ABD9C8;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v9, "connectToServer:initialClientRequestInfo:callback:", v8, v12, v14);

}

void __76__PKSecureElement_connectToServerWithPushTopic_performSECleanup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Secure Element Remote Server Connection Error: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 0);

}

- (void)peerPaymentEnrollmentDataWithAlternateDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *v9;
  _QWORD v10[4];
  id v11;
  PKSecureElement *v12;
  OS_dispatch_queue *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (PKSecureElementIsAvailable())
    {
      v8 = self->_replyQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke;
      v10[3] = &unk_1E2ACA280;
      v11 = v6;
      v12 = self;
      v13 = v8;
      v14 = v7;
      v9 = v8;
      -[PKSecureElement accessSecureElementManagerSessionWithHandler:](self, "accessSecureElementManagerSessionWithHandler:", v10);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }

}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[8];
  _QWORD aBlock[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41[2];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v41[0] = 0;
    v5 = objc_msgSend(v3, "validateSEPairings:", v41);
    v6 = v41[0];
    v7 = 0;
    if (v5)
    {
      if (v5 != 27
        || (v40 = 0, v8 = objc_msgSend(v4, "deleteAllApplets:error:", 0, &v40), v7 = v40, !v8))
      {
        v25 = *(NSObject **)(a1 + 48);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3_283;
        v29[3] = &unk_1E2ABE058;
        v7 = v7;
        v30 = v7;
        v31 = *(id *)(a1 + 56);
        dispatch_async(v25, v29);

        v9 = v30;
LABEL_17:

        goto LABEL_18;
      }
    }
    v9 = objc_alloc_init((Class)PKGetClassNFPeerPaymentEnrollmentRequest());
    objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "SHA256Hash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlternateDSID:", v11);

    v39 = 0;
    objc_msgSend(v4, "performPeerPaymentEnrollment:error:", v9, &v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v39;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2;
    aBlock[3] = &unk_1E2ACA320;
    v14 = *(void **)(a1 + 48);
    aBlock[4] = *(_QWORD *)(a1 + 40);
    v37 = v14;
    v38 = *(id *)(a1 + 56);
    v15 = _Block_copy(aBlock);
    if (v13)
    {
      objc_msgSend(v13, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", v17) & 1) != 0)
      {
        v26 = v6;
        v18 = v12;
        v19 = objc_msgSend(v13, "code");

        v20 = v19 == 16;
        v12 = v18;
        v6 = v26;
        v21 = MEMORY[0x1E0C809B0];
        if (v20)
        {
          PKLogFacilityTypeGetObject(0xBuLL);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "SE Error: Handling NFCD NFResultCommmandError by reaching out to TSM, then retrying enrollment request.", buf, 2u);
          }

          v23 = *(void **)(a1 + 40);
          v32[0] = v21;
          v32[1] = 3221225472;
          v32[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_281;
          v32[3] = &unk_1E2ACA348;
          v32[4] = v23;
          v33 = v9;
          v34 = v15;
          objc_msgSend(v23, "connectToServerWithPushTopic:completion:", 0, v32);

          goto LABEL_16;
        }
      }
      else
      {

      }
    }
    (*((void (**)(void *, void *, id))v15 + 2))(v15, v12, v13);
LABEL_16:

    goto LABEL_17;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_284;
  block[3] = &unk_1E2ABD9A0;
  v24 = *(NSObject **)(a1 + 48);
  v28 = *(id *)(a1 + 56);
  dispatch_async(v24, block);
  v6 = v28;
LABEL_18:

}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[3];
  _QWORD v42[5];

  v42[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "prePeerPaymentCertificate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hexEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "prePeerPaymentCertificate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "SHA256Hash");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "secureElementIdentifiers");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "certificate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("ECDSA"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "hexEncoding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ECDSA"));

  }
  v30 = (void *)v10;
  objc_msgSend(v5, "certificate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("ECC"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "hexEncoding");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("ECC"));

  }
  v31 = v13;
  objc_msgSend(v5, "certificate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("RSA"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "hexEncoding");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("RSA"));

  }
  v21 = v6;
  v22 = (void *)v32;
  if (!v6 && v5 && v8 && v11 && v32)
  {
    v42[0] = v8;
    v41[0] = CFSTR("signedEnrollmentData");
    v41[1] = CFSTR("casdCertificate");
    v23 = (void *)objc_msgSend(v11, "copy");
    v41[2] = CFSTR("seidList");
    v42[1] = v23;
    v42[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3;
    block[3] = &unk_1E2ABDA68;
    v25 = *(NSObject **)(a1 + 40);
    v40 = *(id *)(a1 + 48);
    v38 = v24;
    v26 = v30;
    v39 = v30;
    v27 = v24;
    v28 = v25;
    v22 = (void *)v32;
    dispatch_async(v28, block);

  }
  else
  {
    v29 = *(NSObject **)(a1 + 40);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_4;
    v33[3] = &unk_1E2ABE030;
    v34 = v5;
    v35 = v6;
    v36 = *(id *)(a1 + 48);
    dispatch_async(v29, v33);

    v27 = v34;
    v26 = v30;
  }

}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "SE Error: Failed to get Peer Payment enrollment certificates from NearField with response: %@, error: %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_281(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2_282;
  v3[3] = &unk_1E2AC9F58;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "accessSecureElementManagerSessionWithHandler:", v3);

}

void __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_2_282(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  objc_msgSend(a2, "performPeerPaymentEnrollment:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_3_283(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "SE Error: Failed to ensure that the SE is paired to the SEP, hence failing peer payment enrollment request. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__PKSecureElement_peerPaymentEnrollmentDataWithAlternateDSID_completion___block_invoke_284(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0xBuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "SE Error: Failed to access the secure element access session, hence failing peer payment enrollment request.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  if (v5 && !-[NSHashTable containsObject:](self->_observers, "containsObject:", v5))
  {
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKSecureElement _registerPairingChangeHandler](self, "_registerPairingChangeHandler");
    if (-[NSHashTable count](self->_observers, "count") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contactlessPaymentPassesAvailableDidChange, CFSTR("PDContactlessPaymentPassesAvailableDidChangeNotification"), 0);

    }
    -[PKSecureElement _updateHardwareManagerListener](self, "_updateHardwareManagerListener");
  }
  os_unfair_lock_unlock(&self->_observersLock);

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  if (v4 && -[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    -[PKSecureElement _updateHardwareManagerListener](self, "_updateHardwareManagerListener");
  }
  os_unfair_lock_unlock(&self->_observersLock);

}

- (BOOL)supportsExpressModeForExpressPassType:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "isExpressModeSupported"))
    goto LABEL_6;
  if (a3 == 2)
  {
    LOBYTE(v7) = 1;
    goto LABEL_7;
  }
  if (a3 == 1)
    v7 = (-[PKSecureElement supportedTechnologies](self, "supportedTechnologies") >> 2) & 1;
  else
LABEL_6:
    LOBYTE(v7) = 0;
LABEL_7:

  return v7;
}

+ (BOOL)hardwareSupportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return objc_msgSend(a1, "hardwareSupportsExpressForAutomaticSelectionTechnologyType:outError:", a3, 0);
}

+ (BOOL)supportsExpressMode:(id)a3
{
  return objc_msgSend(a1, "supportsExpressMode:byHardware:", a3, 0);
}

+ (BOOL)supportsExpressMode:(id)a3 byHardware:(BOOL *)a4
{
  __CFString *v6;
  char v7;
  char v8;

  v6 = (__CFString *)a3;
  v7 = objc_msgSend(a1, "hardwareSupportsExpressMode:", v6);
  if (a4)
    *a4 = v7;
  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else if (v6 && CFSTR("type_a.generic"))
  {
    v8 = -[__CFString isEqual:](v6, "isEqual:", CFSTR("type_a.generic"));
  }
  else
  {
    v8 = CFSTR("type_a.generic") == v6;
  }

  return v8;
}

+ (BOOL)hardwareSupportsExpressMode:(id)a3
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = (__CFString *)a3;
  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_15;
  if (!v3 || !CFSTR("transit.felica.suica"))
  {
    if (CFSTR("transit.felica.suica") == v3)
      goto LABEL_5;
    goto LABEL_7;
  }
  if ((-[__CFString isEqual:](v3, "isEqual:", CFSTR("transit.felica.suica")) & 1) == 0)
  {
LABEL_7:
    if (v3 && CFSTR("type_a.generic"))
    {
      if ((-[__CFString isEqual:](v3, "isEqual:", CFSTR("type_a.generic")) & 1) != 0)
      {
LABEL_10:
        v5 = 8;
        goto LABEL_14;
      }
    }
    else if (CFSTR("type_a.generic") == v3)
    {
      goto LABEL_10;
    }
    if (-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("access.hid.")))
    {
      v5 = 2;
      goto LABEL_14;
    }
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
LABEL_5:
  v5 = 4;
LABEL_14:
  v6 = objc_msgSend(v4, "areFeaturesSupported:outError:", v5, 0);
LABEL_16:

  return v6;
}

- (unint64_t)ownershipStateForCurrentUser
{
  void *v3;
  unint64_t v4;

  if (!-[PKSecureElement isOwnable](self, "isOwnable"))
    return 3;
  PKCurrentUserUUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKSecureElement ownershipStateForUserUUID:](self, "ownershipStateForUserUUID:", v3);

  return v4;
}

- (unint64_t)ownershipStateForUserUUID:(id)a3
{
  -[PKSecureElement isOwnable](self, "isOwnable", a3);
  return 3;
}

- (BOOL)setOwnerUserUUID:(id)a3 keybagUUID:(id)a4
{
  return 1;
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  PKLogFacilityTypeGetObject(0x16uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement creating FIDO key for relyingParty: %@", buf, 0xCu);
  }

  if (v12 && v13 && v14)
  {
    PKLogFacilityTypeGetObject(0x22uLL);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_make_with_pointer(v18, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v18, OS_SIGNPOST_EVENT, v20, "fidoKey:createKey", ", buf, 2u);
      }
    }

    objc_msgSend(MEMORY[0x1E0D89648], "shared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v21, "createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:usingSession:withSessionSEID:error:", v12, v13, v14, 0, 0, &v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v30;

    v24 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        v32 = v23;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to create FIDO key with error: %@", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v16 + 2))(v16, 0, 0, 0, v23);
    }
    else
    {
      if (v24)
      {
        objc_msgSend(v22, "fidoKeyHash");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hexEncoding");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v26;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement generated FIDO key for with keyHash: %@", buf, 0xCu);

      }
      objc_msgSend(v22, "fidoPublicKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fidoAttestation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fidoKeyHash");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, void *, void *, _QWORD))v16 + 2))(v16, v27, v28, v29, 0);

    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement creating FIDO key missing required parameters", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v16 + 2))(v16, 0, 0, 0, v23);
  }

}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  PKLogFacilityTypeGetObject(0x16uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO key for relyingParty: %@", buf, 0xCu);
  }

  if (v10 && v11)
  {
    PKLogFacilityTypeGetObject(0x22uLL);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_make_with_pointer(v15, self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v15, OS_SIGNPOST_EVENT, v17, "fidoKey:checkForKey", ", buf, 2u);
      }
    }

    objc_msgSend(MEMORY[0x1E0D89640], "withRelyingParty:relyingPartyAccountHash:fidoKeyHash:", v10, v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89648], "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v19, "checkFidoKeyPresence:usingSession:withSessionSEID:error:", v18, 0, 0, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (__CFString *)v24;
    v22 = objc_msgSend(v20, "BOOLValue");

    if (v21)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v21;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement failed to check FIDO key with error %@", buf, 0xCu);
      }

      v22 = 0;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("No");
      if ((_DWORD)v22)
        v23 = CFSTR("Yes");
      *(_DWORD *)buf = 138412290;
      v26 = v23;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement check FIDO key found key: %@", buf, 0xCu);
    }

    v13[2](v13, v22);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO key missing required parameters", buf, 2u);
    }

    v13[2](v13, 0);
  }

}

- (void)checkMultipleFidoKeyPresenceForFIDOProfiles:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  PKLogFacilityTypeGetObject(0x16uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO keys: %@", buf, 0xCu);

  }
  if (v6 && objc_msgSend(v6, "count"))
  {
    PKLogFacilityTypeGetObject(0x22uLL);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v10, self);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v10, OS_SIGNPOST_EVENT, v12, "fidoKey:checkForKey", ", buf, 2u);
      }
    }

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke;
    v24[3] = &unk_1E2ACA370;
    v15 = v13;
    v25 = v15;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v24);
    objc_msgSend(MEMORY[0x1E0D89648], "shared");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v16, "checkMultipleFidoKeyPresence:usingSession:withSessionSEID:error:", v15, 0, 0, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;

    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke_2;
    v20[3] = &unk_1E2ACA398;
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = v19;
    v22 = v6;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v20);
    if (v18)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v18;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement failed to check FIDO key with error %@", buf, 0xCu);
      }

    }
    v7[2](v7, v19);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKSecureElement checking FIDO key missing required parameters", buf, 2u);
    }

    v7[2](v7, (id)MEMORY[0x1E0C9AA70]);
  }

}

void __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0D89640];
  v4 = a2;
  objc_msgSend(v4, "relyingPartyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pk_decodeHexadecimal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "withRelyingParty:relyingPartyAccountHash:fidoKeyHash:", v5, v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
}

void __74__PKSecureElement_checkMultipleFidoKeyPresenceForFIDOProfiles_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD, id);
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (void (**)(id, _QWORD, id))a9;
  PKLogFacilityTypeGetObject(0x16uLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v15;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKSecureElement signing FIDO key for relyingParty: %@", buf, 0xCu);
  }

  if (v15 && v16 && v18 && v20)
  {
    v34 = v19;
    PKLogFacilityTypeGetObject(0x22uLL);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = os_signpost_id_make_with_pointer(v23, self);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v25 = v24;
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v23, OS_SIGNPOST_EVENT, v25, "fidoKey:sign", ", buf, 2u);
      }
    }

    v32 = v16;
    v33 = v17;
    objc_msgSend(MEMORY[0x1E0D89640], "withRelyingParty:relyingPartyAccountHash:fidoKeyHash:", v15, v16, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89648], "shared");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexEncodedString:", v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v27, "signWithFidoKeyFor:challenge:forNFCKeyWithIdentifier:usingSession:withSessionSEID:externalizedAuth:error:", v26, v18, v28, 0, 0, v20, &v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v35;

    if (v30)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v30;
        _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to sign FIDO challenge with error: %@", buf, 0xCu);
      }

      v21[2](v21, 0, v30);
    }
    else
    {
      objc_msgSend(v29, "fidoAssertion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, id))v21)[2](v21, v31, 0);

    }
    v16 = v32;
    v19 = v34;

    v17 = v33;
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKSecureElement signing FIDO key missing required parameters", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, 0, v26);
  }

}

- (void)verifySignedChallenge:(id)a3 forRelyingParty:(id)a4 relyingPartyAccountHash:(id)a5 fidoKeyHash:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t);
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t))a7;
  PKLogFacilityTypeGetObject(0x2AuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement verifying signed challenge for relyingParty: %@", buf, 0xCu);
  }

  if (v12 && v13 && v14)
  {
    PKLogFacilityTypeGetObject(0x22uLL);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_make_with_pointer(v18, self);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18FC92000, v18, OS_SIGNPOST_EVENT, v20, "issuerBindingData:verify", ", buf, 2u);
      }
    }

    objc_msgSend(MEMORY[0x1E0D89640], "withRelyingParty:relyingPartyAccountHash:fidoKeyHash:", v13, v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89648], "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v22, "verifyWithFidoKeyFor:signedChallenge:usingSession:withSessionSEID:error:", v21, v12, 0, 0, &v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;

    if (v24)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to verify signed challenge with error: %@", buf, 0xCu);
      }

      v25 = 0;
    }
    else
    {
      v25 = objc_msgSend(v23, "BOOLValue");
    }
    v16[2](v16, v25);

  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "PKSecureElement verifying signed challenge missing required parameters", buf, 2u);
    }

    v16[2](v16, 0);
  }

}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKDAManager *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PKDAManager);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v10[3] = &unk_1E2AC6E00;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[PKDAManager generateSEEncryptionCertificateForSubCredentialId:completion:](v8, "generateSEEncryptionCertificateForSubCredentialId:completion:", v7, v10);

}

void __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __80__PKSecureElement_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  void (**v8)(id, void *, _QWORD);
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  PKDAManager *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  PKLogFacilityTypeGetObject(0x16uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v11 = CFSTR("N");
      if (v6)
        v11 = CFSTR("Y");
      *(_DWORD *)buf = 138412546;
      v26 = v7;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement LTPK: Generating key for groupIdentifier: '%@' reuse: '%@'", buf, 0x16u);
    }

    v12 = objc_alloc_init(PKDAManager);
    v13 = v12;
    if (v6)
    {
      v24 = 0;
      -[PKDAManager privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:](v12, "privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:", v7, 0, &v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v24;
      objc_msgSend(v14, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        objc_msgSend(v16, "publicKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v17;
        v18 = "PKSecureElement LTPK: Found key %@";
        goto LABEL_21;
      }
    }
    else
    {
      -[PKDAManager privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:](v12, "privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:", v7, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v19, "count") >= 0xA)
      {
        objc_msgSend(v19, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v20;
          _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement LTPK: At max keys for groupIdentifier, deleting oldest key: %@", buf, 0xCu);
        }

        objc_msgSend(v13, "deletePrivacyKey:outError:", v20, 0);
      }

      v15 = 0;
    }
    v21 = v15;
    v23 = v15;
    objc_msgSend(v13, "createPrivacyKeyForGroupIdentifier:outError:", v7, &v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;

    if (!v16)
      goto LABEL_23;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:

      if (!v15)
      {
        if (v8)
        {
          objc_msgSend(v16, "publicKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v22, 0);

        }
        v15 = 0;
        goto LABEL_30;
      }
LABEL_23:
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v15;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to get long term privacy key with error: %@", buf, 0xCu);
      }

      if (v8)
        ((void (**)(id, void *, id))v8)[2](v8, 0, v15);
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v16, "publicKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    v18 = "PKSecureElement LTPK: Generated key %@";
LABEL_21:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

    goto LABEL_22;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKSecureElement LTPK: Error: Missing group identifier", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v8)[2](v8, 0, v13);
LABEL_31:

}

- (void)hasLongTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  PKDAManager *v6;
  uint64_t v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a4;
  v5 = a3;
  v6 = objc_alloc_init(PKDAManager);
  v7 = -[PKDAManager hasLongTermPrivacyKeyForGroupIdentifier:](v6, "hasLongTermPrivacyKeyForGroupIdentifier:", v5);

  if (v8)
    v8[2](v8, v7);

}

- (void)longTermPrivacyKeysForCredentialGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD, id);
  id v8;
  id v9;
  PKDAManager *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, id))a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PKDAManager);
  v14 = 0;
  -[PKDAManager privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:](v10, "privacyKeysForGroupIdentifier:privacyKeyIdentifier:outError:", v9, v8, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v12)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKSecureElement unable to get long term privacy keys with error: %@", buf, 0xCu);
    }

    if (v7)
      v7[2](v7, 0, v12);
  }
  else if (v7)
  {
    ((void (**)(id, void *, id))v7)[2](v7, v11, 0);
  }

}

- (id)secureElementSessionPrelude
{
  NSObject *sessionQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PKSecureElement_secureElementSessionPrelude__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__PKSecureElement_secureElementSessionPrelude__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSecureElementSessionPrelude:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PKSecureElement_setSecureElementSessionPrelude___block_invoke;
  block[3] = &unk_1E2ABE058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sessionQueue, block);

}

void __50__PKSecureElement_setSecureElementSessionPrelude___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

- (id)secureElementSessionPostlude
{
  NSObject *sessionQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PKSecureElement_secureElementSessionPostlude__block_invoke;
  v5[3] = &unk_1E2AC1F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__PKSecureElement_secureElementSessionPostlude__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSecureElementSessionPostlude:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKSecureElement_setSecureElementSessionPostlude___block_invoke;
  block[3] = &unk_1E2ABE058;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sessionQueue, block);

}

void __51__PKSecureElement_setSecureElementSessionPostlude___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (BOOL)isOwnable
{
  return 0;
}

- (BOOL)isProductionSigned
{
  NFSecureElement *secureElement;

  secureElement = self->_secureElement;
  if (secureElement)
    return -[NFSecureElement isProductionSigned](secureElement, "isProductionSigned");
  else
    return 1;
}

- (BOOL)isInRestrictedMode
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isInRestrictedMode");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isDeletingAllApplets
{
  PKSecureElement *v2;
  os_unfair_lock_s *p_deletingAllAppletsPropertyLock;

  v2 = self;
  p_deletingAllAppletsPropertyLock = &self->_deletingAllAppletsPropertyLock;
  os_unfair_lock_lock(&self->_deletingAllAppletsPropertyLock);
  LOBYTE(v2) = v2->_deletingAllApplets;
  os_unfair_lock_unlock(p_deletingAllAppletsPropertyLock);
  return (char)v2;
}

- (unint64_t)supportedTechnologies
{
  return -[NFSecureElement supportedTechnologies](self->_secureElement, "supportedTechnologies");
}

- (NSString)primaryRegionTopic
{
  void *v2;
  void *v3;

  objc_msgSend(PKGetClassNFRemoteAdminManager(), "sharedRemoteAdminManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryRegionTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)primaryJSBLSequenceCounter
{
  return (NSNumber *)-[NFSecureElement sequenceCounter](self->_secureElement, "sequenceCounter");
}

- (NSString)primarySecureElementIdentifier
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(PKGetClassNFSecureElement(), "embeddedSecureElementSerialNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length")
    || (NFSecureElementSerialNumberToString(), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (PKSecureElementIsAvailable())
    {
      PKLogFacilityTypeGetObject(6uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "+[NFSecureElement embeddedSecureElementSerialNumber] not available. Please file a radar.", v6, 2u);
      }

    }
    v3 = 0;
  }

  return (NSString *)v3;
}

void __49__PKSecureElement_primarySecureElementIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  PKSecureElement *v2;

  v2 = objc_alloc_init(PKSecureElement);
  -[PKSecureElement primarySecureElementIdentifier](v2, "primarySecureElementIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF224A8;
  qword_1ECF224A8 = v0;

}

+ (id)secureElementIdentifiers
{
  if (qword_1ECF224C0 != -1)
    dispatch_once(&qword_1ECF224C0, &__block_literal_global_306);
  return (id)qword_1ECF224B8;
}

void __43__PKSecureElement_secureElementIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;
  PKSecureElement *v2;

  v2 = objc_alloc_init(PKSecureElement);
  -[PKSecureElement secureElementIdentifiers](v2, "secureElementIdentifiers");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF224B8;
  qword_1ECF224B8 = v0;

}

- (void)_registerPairingChangeHandler
{
  PKSecureElement *v2;
  objc_class *v3;
  id pairingChangeHandler;
  int v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_pairingChangeHandler)
  {
    v2 = self;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__PKSecureElement__registerPairingChangeHandler__block_invoke;
    v7[3] = &unk_1E2ACA448;
    objc_copyWeak(&v8, &location);
    v3 = (objc_class *)_Block_copy(v7);
    pairingChangeHandler = v2->_pairingChangeHandler;
    v2 = (PKSecureElement *)((char *)v2 + 128);
    v2->super.isa = v3;

    v5 = SSESetEffacementNotificationHandler(v2->super.isa);
    if (v5)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v11 = v5;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error setting the Secure Element Pairing change handler: %d", buf, 8u);
      }

    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __48__PKSecureElement__registerPairingChangeHandler__block_invoke(uint64_t a1, int a2)
{
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PKSecureElement__registerPairingChangeHandler__block_invoke_2;
    v6[3] = &unk_1E2ACA420;
    v6[4] = v4;
    v7 = a2;
    dispatch_async(v5, v6);
  }

}

void __48__PKSecureElement__registerPairingChangeHandler__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 112));
  v3 = *(_DWORD *)(a1 + 40);
  if (v3 == 1)
    v4 = 1;
  else
    v4 = 2 * (v3 == 2);
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = off_1E2ACA4B8[v4];
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Secure Element Pairing did change for reason: %@", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "secureElementPairingDidChangeForReason:", v4, (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pairingChangeHandler, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_asyncSessionAccessHandlers, 0);
  objc_storeStrong((id *)&self->_prioritySessionAccessHandlers, 0);
  objc_storeStrong((id *)&self->_sessionAccessHandlers, 0);
  objc_storeStrong(&self->_secureElementSessionPostlude, 0);
  objc_storeStrong(&self->_secureElementSessionPrelude, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_deletingAllAppletsTimerQueue, 0);
  objc_storeStrong((id *)&self->_deletingAllAppletsTimer, 0);
}

@end

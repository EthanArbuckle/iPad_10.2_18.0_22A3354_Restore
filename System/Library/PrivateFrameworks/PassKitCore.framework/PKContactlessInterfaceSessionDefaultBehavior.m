@implementation PKContactlessInterfaceSessionDefaultBehavior

+ (void)attachDefaultBehaviorToSession:(id)a3
{
  void *v3;
  PKContactlessInterfaceSessionDefaultBehavior *v4;
  id object;

  object = a3;
  objc_getAssociatedObject(object, &SessionBehaviorKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PKContactlessInterfaceSessionDefaultBehavior);
    objc_msgSend(object, "setDelegate:", v4);
    objc_setAssociatedObject(object, &SessionBehaviorKey, v4, (void *)0x301);

  }
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  PKContactlessInterfaceSessionDefaultBehavior *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSessionDefaultBehavior (%p): ignoring transaction end....", buf, 0xCu);
  }

  if (v7)
  {
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactlessInterfaceSessionDefaultBehavior _processContexts:didFinishTransaction:](self, "_processContexts:didFinishTransaction:", v9, 1);

  }
  else
  {
    -[PKContactlessInterfaceSessionDefaultBehavior _processContexts:didFinishTransaction:](self, "_processContexts:didFinishTransaction:", 0, 1);
  }

}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
  -[PKContactlessInterfaceSessionDefaultBehavior _processContexts:didFinishTransaction:](self, "_processContexts:didFinishTransaction:", a4, 0);
}

- (void)_processContexts:(id)a3 didFinishTransaction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  PKPaymentService *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  PKContactlessInterfaceSessionDefaultBehavior *v24;
  void *v25;
  id v26;
  int v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  PKContactlessInterfaceSessionDefaultBehavior *v34;
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_16:
    PKLogFacilityTypeGetObject(6uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = self;
      _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSessionDefaultBehavior (%p): dropping transaction.", buf, 0xCu);
    }

    goto LABEL_19;
  }
  v24 = self;
  v9 = objc_alloc_init(PKPaymentService);
  v10 = objc_msgSend(v8, "isStoredValuePass");
  v25 = v8;
  objc_msgSend(v8, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v6;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v12)
  {
    v14 = 0;
    goto LABEL_15;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v30;
  v27 = v10 | v4;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v30 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v17, "paymentApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v17, "transitHistory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "expressState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentService processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:](v9, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v19, v20, v18, v11, v21);

        v14 = 1;
      }
      else if (!v27)
      {
        goto LABEL_11;
      }
      objc_msgSend(v18, "applicationIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentService recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:](v9, "recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:", v11, v22);

LABEL_11:
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  }
  while (v13);
LABEL_15:

  v8 = v25;
  v6 = v26;
  self = v24;
  if ((v14 & 1) == 0)
    goto LABEL_16;
LABEL_19:

}

@end

@implementation TPSCarrierBundleController

- (id)localizedCarrierNameForSubscriptionContext:(id)a3
{
  return -[TPSCarrierBundleController objectForKey:subscriptionContext:](self, "objectForKey:subscriptionContext:", CFSTR("CarrierName"), a3);
}

- (id)localizedStringForKey:(id)a3 subscriptionContext:(id)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[TPSCarrierBundleController localizedStringForKey:subscriptionContext:error:](self, "localizedStringForKey:subscriptionContext:error:", a3, a4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    TPSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);

    }
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)localizedStringForKey:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedCarrierBundleStringForKey:subscription:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)objectForKey:(id)a3 subscriptionContext:(id)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[TPSCarrierBundleController objectForKey:subscriptionContext:error:](self, "objectForKey:subscriptionContext:error:", a3, a4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    TPSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);

    }
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)objectForKey:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x1E0CA6D00];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithBundleType:", 1);
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyCarrierBundleValue:key:bundleType:error:", v9, v10, v11, a5);

  return v13;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  -[TPSCarrierBundleController objectForKeyHierarchy:subscriptionContext:error:](self, "objectForKeyHierarchy:subscriptionContext:error:", a3, a4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    TPSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);

    }
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x1E0CA6D00];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithBundleType:", 1);
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyCarrierBundleValueWithDefault:keyHierarchy:bundleType:error:", v9, v10, v11, a5);

  return v13;
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed for subscription context %@.", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__TPSCarrierBundleController_carrierBundleChange___block_invoke;
  v7[3] = &unk_1EA2CD690;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v7);

}

void __50__TPSCarrierBundleController_carrierBundleChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[6];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__TPSCarrierBundleController_carrierBundleChange___block_invoke_2;
          block[3] = &unk_1EA2CD990;
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          v13 = v11;
          dispatch_async(v9, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __50__TPSCarrierBundleController_carrierBundleChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleController:carrierBundleDidChangeForSubscriptionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)operatorBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Operator bundle changed for subscription context %@.", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__TPSCarrierBundleController_operatorBundleChange___block_invoke;
  v7[3] = &unk_1EA2CD690;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v7);

}

void __51__TPSCarrierBundleController_operatorBundleChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[6];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51__TPSCarrierBundleController_operatorBundleChange___block_invoke_2;
          block[3] = &unk_1EA2CD990;
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          v13 = v11;
          dispatch_async(v9, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __51__TPSCarrierBundleController_operatorBundleChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleController:operatorBundleDidChangeForSubscriptionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end

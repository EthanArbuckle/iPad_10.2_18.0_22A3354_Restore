@implementation TPSRegistrationTelephonyController

- (TPSRegistrationTelephonyController)init
{
  -[TPSRegistrationTelephonyController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSRegistrationTelephonyController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSRegistrationTelephonyController *v6;
  TPSRegistrationTelephonyController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSRegistrationTelephonyController;
  v6 = -[TPSTelephonyController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);

  return v7;
}

- (NSArray)networks
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__TPSRegistrationTelephonyController_networks__block_invoke;
  v4[3] = &unk_1EA2CD668;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __46__TPSRegistrationTelephonyController_networks__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)setNetworks:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__TPSRegistrationTelephonyController_setNetworks___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v6);

}

void *__50__TPSRegistrationTelephonyController_setNetworks___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 72) != result)
  {
    v4 = objc_msgSend(result, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v4;

    return (void *)objc_msgSend(*(id *)(a1 + 32), "performDelegateSelector:", sel_networksChangedForRegistrationController_);
  }
  return result;
}

- (CTNetworkSelectionInfo)networkSelectionInfo
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__TPSRegistrationTelephonyController_networkSelectionInfo__block_invoke;
  v4[3] = &unk_1EA2CD6B8;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CTNetworkSelectionInfo *)v2;
}

void __58__TPSRegistrationTelephonyController_networkSelectionInfo__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[10];
  if (!v3)
  {
    v4 = objc_msgSend(v2, "copyNetworkSelectionInfo");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setNetworkSelectionInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__TPSRegistrationTelephonyController_setNetworkSelectionInfo___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v6);

}

id *__62__TPSRegistrationTelephonyController_setNetworkSelectionInfo___block_invoke(uint64_t a1)
{
  id v2;
  id *result;

  v2 = *(id *)(a1 + 40);
  result = (id *)(*(_QWORD *)(a1 + 32) + 80);
  if (*result != v2)
  {
    objc_storeStrong(result, v2);
    return (id *)objc_msgSend(*(id *)(a1 + 32), "performDelegateSelector:", sel_networkSelectionInfoChangedForRegistrationController_);
  }
  return result;
}

- (void)automaticallySelectNetwork
{
  -[TPSRegistrationTelephonyController automaticallySelectNetworkWithCompletion:](self, "automaticallySelectNetworkWithCompletion:", &__block_literal_global_0);
}

void __64__TPSRegistrationTelephonyController_automaticallySelectNetwork__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    TPSLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__TPSRegistrationTelephonyController_automaticallySelectNetwork__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)automaticallySelectNetworkWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSRegistrationTelephonyController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "automaticallySelectNetwork:completion:", v5, v4);

}

- (void)selectNetwork:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke;
  v6[3] = &unk_1EA2CD720;
  v7 = v4;
  v5 = v4;
  -[TPSRegistrationTelephonyController selectNetwork:completion:](self, "selectNetwork:completion:", v5, v6);

}

void __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    TPSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)selectNetwork:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSRegistrationTelephonyController subscriptionContext](self, "subscriptionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectNetwork:network:completion:", v8, v7, v6);

}

- (id)copyNetworkSelectionInfo
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSRegistrationTelephonyController subscriptionContext](self, "subscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = (void *)objc_msgSend(v3, "copyNetworkSelectionInfo:error:", v4, &v15);
  v6 = v15;

  if (v6)
  {
    TPSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[TPSRegistrationTelephonyController copyNetworkSelectionInfo].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v5;
}

- (void)fetchNetworkList
{
  -[TPSRegistrationTelephonyController fetchNetworkListWithCompletion:](self, "fetchNetworkListWithCompletion:", &__block_literal_global_9);
}

void __54__TPSRegistrationTelephonyController_fetchNetworkList__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      TPSLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __54__TPSRegistrationTelephonyController_fetchNetworkList__block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

    }
  }

}

- (void)fetchNetworkListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSRegistrationTelephonyController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchNetworkList:completion:", v5, v4);

}

- (void)performDelegateSelector:(SEL)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke;
  v3[3] = &unk_1EA2CD790;
  v3[4] = self;
  v3[5] = a3;
  -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v3);
}

void __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke_2;
          block[3] = &unk_1EA2CD768;
          block[4] = v7;
          v11 = *(_OWORD *)(a1 + 32);
          dispatch_async(v9, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

id __62__TPSRegistrationTelephonyController_performDelegateSelector___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)networkListAvailable:(id)a3 list:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[TPSRegistrationTelephonyController subscriptionContext](self, "subscriptionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    TPSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1DB4B7000, v10, OS_LOG_TYPE_DEFAULT, "Network list is available %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v6, "networks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSRegistrationTelephonyController setNetworks:](self, "setNetworks:", v11);

  }
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[TPSRegistrationTelephonyController subscriptionContext](self, "subscriptionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    TPSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("failed");
      if (v5)
        v11 = CFSTR("succeeded");
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1DB4B7000, v10, OS_LOG_TYPE_DEFAULT, "Manual network selection %@ for subscription %@.", (uint8_t *)&v13, 0x16u);
    }

    v12 = -[TPSRegistrationTelephonyController copyNetworkSelectionInfo](self, "copyNetworkSelectionInfo");
    -[TPSRegistrationTelephonyController setNetworkSelectionInfo:](self, "setNetworkSelectionInfo:", v12);

  }
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_networkSelectionInfo, 0);
  objc_storeStrong((id *)&self->_networks, 0);
}

void __64__TPSRegistrationTelephonyController_automaticallySelectNetwork__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB4B7000, a2, a3, "Automatic network selection failed with error %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __52__TPSRegistrationTelephonyController_selectNetwork___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1DB4B7000, log, OS_LOG_TYPE_ERROR, "Manual selection of network %@ failed with error %@.", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)copyNetworkSelectionInfo
{
  OUTLINED_FUNCTION_0(&dword_1DB4B7000, a2, a3, "Retrieving network selection information failed with error %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__TPSRegistrationTelephonyController_fetchNetworkList__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB4B7000, a2, a3, "Fetch network list failed with error %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

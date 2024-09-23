@implementation TPSSubscriberTelephonyController

- (TPSSubscriberTelephonyController)init
{
  -[TPSSubscriberTelephonyController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSSubscriberTelephonyController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSSubscriberTelephonyController *v6;
  TPSSubscriberTelephonyController *v7;
  void *v8;
  uint64_t v9;
  NSString *SIMStatus;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSSubscriberTelephonyController;
  v6 = -[TPSTelephonyController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v7->_SIMPasscodeRemainingAttempts = 0x7FFFFFFFFFFFFFFFLL;
    -[TPSSubscriberTelephonyController getSIMStatus](v7, "getSIMStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    SIMStatus = v7->_SIMStatus;
    v7->_SIMStatus = (NSString *)v9;

    -[TPSSubscriberTelephonyController fetchSIMPasscodeLockEnabled](v7, "fetchSIMPasscodeLockEnabled");
    -[TPSSubscriberTelephonyController fetchSIMPasscodeRemainingAttempts](v7, "fetchSIMPasscodeRemainingAttempts");
  }

  return v7;
}

- (BOOL)isSIMPasscodeLockEnabled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__TPSSubscriberTelephonyController_isSIMPasscodeLockEnabled__block_invoke;
  v4[3] = &unk_1EA2CD668;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __60__TPSSubscriberTelephonyController_isSIMPasscodeLockEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)setSIMPasscodeLockEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke;
  v3[3] = &unk_1EA2CDA90;
  v3[4] = self;
  v4 = a3;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v3);
}

uint64_t __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  void *v3;
  _QWORD v4[5];
  char v5;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 72) != v2)
  {
    *(_BYTE *)(v1 + 72) = v2;
    v3 = *(void **)(result + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_2;
    v4[3] = &unk_1EA2CDA90;
    v4[4] = v3;
    v5 = *(_BYTE *)(result + 40);
    return objc_msgSend(v3, "performAtomicDelegateBlock:", v4);
  }
  return result;
}

void __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_2(uint64_t a1)
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
  _QWORD block[6];
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_3;
          block[3] = &unk_1EA2CDA68;
          v10 = *(_QWORD *)(a1 + 32);
          block[4] = v7;
          block[5] = v10;
          v12 = *(_BYTE *)(a1 + 40);
          dispatch_async(v9, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

uint64_t __62__TPSSubscriberTelephonyController_setSIMPasscodeLockEnabled___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriberController:SIMPasscodeLockEnabledDidChange:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (int64_t)SIMPasscodeRemainingAttempts
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__TPSSubscriberTelephonyController_SIMPasscodeRemainingAttempts__block_invoke;
  v4[3] = &unk_1EA2CD6B8;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __64__TPSSubscriberTelephonyController_SIMPasscodeRemainingAttempts__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[10];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "getSIMPasscodeRemainingAttemptsValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(v4, "integerValue");

    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

- (void)setSIMPasscodeRemainingAttempts:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke;
  v3[3] = &unk_1EA2CD790;
  v3[4] = self;
  v3[5] = a3;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v3);
}

uint64_t __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 80) != v2)
  {
    *(_QWORD *)(v1 + 80) = v2;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_2;
    v4[3] = &unk_1EA2CD790;
    v3 = *(_QWORD *)(result + 40);
    v5 = *(id *)(result + 32);
    v6 = v3;
    return objc_msgSend(v5, "performAtomicDelegateBlock:", v4);
  }
  return result;
}

void __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_2(uint64_t a1)
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
  uint64_t v11;
  _QWORD block[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_3;
          block[3] = &unk_1EA2CD768;
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(_QWORD *)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          block[6] = v11;
          dispatch_async(v9, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

uint64_t __68__TPSSubscriberTelephonyController_setSIMPasscodeRemainingAttempts___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriberController:SIMPasscodeRemainingAttemptsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSString)SIMStatus
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
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__TPSSubscriberTelephonyController_SIMStatus__block_invoke;
  v4[3] = &unk_1EA2CD668;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __45__TPSSubscriberTelephonyController_SIMStatus__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)setSIMStatus:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v6);

}

void __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 88) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v4;

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_2;
    v8[3] = &unk_1EA2CD690;
    v7 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v10 = v7;
    objc_msgSend(v9, "performAtomicDelegateBlock:", v8);

  }
}

void __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_2(uint64_t a1)
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
          block[2] = __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_3;
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

uint64_t __49__TPSSubscriberTelephonyController_setSIMStatus___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriberController:SIMStatusDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)changePIN:(id)a3 newPin:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke;
  v4[3] = &unk_1EA2CD720;
  v4[4] = self;
  -[TPSSubscriberTelephonyController changePIN:newPin:completion:](self, "changePIN:newPin:completion:", a3, a4, v4);
}

void __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;

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
        __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke_cold_1();

    }
  }

}

- (void)changePIN:(id)a3 newPin:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "changePIN:oldPin:newPin:completion:", v11, v10, v9, v8);

}

- (void)setSIMLockEnabled:(BOOL)a3 pin:(id)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke;
  v7[3] = &unk_1EA2CDAB8;
  objc_copyWeak(&v8, &location);
  v9 = v4;
  -[TPSSubscriberTelephonyController setSIMLockEnabled:pin:completion:](self, "setSIMLockEnabled:pin:completion:", v4, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      TPSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke_cold_1(a1);

    }
  }

}

- (void)setSIMLockEnabled:(BOOL)a3 pin:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveSIMLockValue:enabled:pin:completion:", v10, v6, v9, v8);

}

- (void)presentSIMPasscodeAlert
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke;
  v6[3] = &unk_1EA2CDAE0;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v4, "promptForSIMUnlock:completion:", v5, v6);

}

void __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      TPSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke_cold_1(a1);

    }
  }

}

- (id)getSIMPasscodeLockEnabledValue
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  -[TPSSubscriberTelephonyController getSIMPasscodeLockEnabledValueWithError:](self, "getSIMPasscodeLockEnabledValueWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      TPSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_opt_class();
        v10 = v9;
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v14 = v9;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v5;
        _os_log_error_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);

      }
    }
  }

  return v3;
}

- (id)getSIMPasscodeLockEnabledValueWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchSIMLockValue:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchSIMPasscodeLockEnabled
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__TPSSubscriberTelephonyController_fetchSIMPasscodeLockEnabled__block_invoke;
  v2[3] = &unk_1EA2CDB08;
  v2[4] = self;
  v2[5] = a2;
  -[TPSSubscriberTelephonyController fetchSIMPasscodeLockEnabledWithCompletion:](self, "fetchSIMPasscodeLockEnabledWithCompletion:", v2);
}

void __63__TPSSubscriberTelephonyController_fetchSIMPasscodeLockEnabled__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSIMPasscodeLockEnabled:", objc_msgSend(a2, "BOOLValue"));
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      TPSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_opt_class();
        v9 = *(const char **)(a1 + 40);
        v10 = v8;
        NSStringFromSelector(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v8;
        v14 = 2112;
        v15 = v11;
        v16 = 2112;
        v17 = v5;
        _os_log_error_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v12, 0x20u);

      }
    }
  }

}

- (void)fetchSIMPasscodeLockEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchSIMLockValue:completion:", v5, v4);

}

- (id)getSIMPasscodeRemainingAttemptsValue
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  -[TPSSubscriberTelephonyController getSIMPasscodeRemainingAttemptsValueWithError:](self, "getSIMPasscodeRemainingAttemptsValueWithError:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      TPSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[TPSSubscriberTelephonyController getSIMPasscodeRemainingAttemptsValue].cold.1();

    }
  }

  return v2;
}

- (id)getSIMPasscodeRemainingAttemptsValueWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getRemainingPINAttemptCount:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchSIMPasscodeRemainingAttempts
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__TPSSubscriberTelephonyController_fetchSIMPasscodeRemainingAttempts__block_invoke;
  v2[3] = &unk_1EA2CDB08;
  v2[4] = self;
  v2[5] = a2;
  -[TPSSubscriberTelephonyController fetchSIMPasscodeRemainingAttemptsWithCompletion:](self, "fetchSIMPasscodeRemainingAttemptsWithCompletion:", v2);
}

void __69__TPSSubscriberTelephonyController_fetchSIMPasscodeRemainingAttempts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSIMPasscodeRemainingAttempts:", objc_msgSend(a2, "integerValue"));
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      TPSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_opt_class();
        v9 = *(const char **)(a1 + 40);
        v10 = v8;
        NSStringFromSelector(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v8;
        v14 = 2112;
        v15 = v11;
        v16 = 2112;
        v17 = v5;
        _os_log_error_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v12, 0x20u);

      }
    }
  }

}

- (void)fetchSIMPasscodeRemainingAttemptsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getRemainingPINAttemptCount:completion:", v5, v4);

}

- (id)getSIMStatus
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  -[TPSSubscriberTelephonyController getSIMStatusWithError:](self, "getSIMStatusWithError:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      TPSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[TPSSubscriberTelephonyController getSIMStatus].cold.1();

    }
  }

  return v2;
}

- (id)getSIMStatusWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSIMStatus:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchSIMStatus
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__TPSSubscriberTelephonyController_fetchSIMStatus__block_invoke;
  v2[3] = &unk_1EA2CDB30;
  v2[4] = self;
  v2[5] = a2;
  -[TPSSubscriberTelephonyController fetchSIMStatusWithCompletion:](self, "fetchSIMStatusWithCompletion:", v2);
}

void __50__TPSSubscriberTelephonyController_fetchSIMStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setSIMStatus:", a2);
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      TPSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_opt_class();
        v9 = *(const char **)(a1 + 40);
        v10 = v8;
        NSStringFromSelector(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v8;
        v14 = 2112;
        v15 = v11;
        v16 = 2112;
        v17 = v5;
        _os_log_error_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v12, 0x20u);

      }
    }
  }

}

- (void)fetchSIMStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSIMStatus:completion:", v5, v4);

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    TPSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1DB4B7000, v12, OS_LOG_TYPE_DEFAULT, "SIM status changed to %@ for subscription context %@.", (uint8_t *)&v15, 0x16u);
    }

    -[TPSSubscriberTelephonyController getSIMPasscodeLockEnabledValue](self, "getSIMPasscodeLockEnabledValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriberTelephonyController setSIMPasscodeLockEnabled:](self, "setSIMPasscodeLockEnabled:", objc_msgSend(v13, "BOOLValue"));

    -[TPSSubscriberTelephonyController getSIMPasscodeRemainingAttemptsValue](self, "getSIMPasscodeRemainingAttemptsValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", objc_msgSend(v14, "integerValue"));

    -[TPSSubscriberTelephonyController setSIMStatus:](self, "setSIMStatus:", v7);
  }

}

- (void)simLockSaveRequestDidComplete:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    TPSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("unsuccessful");
      if (v4)
        v12 = CFSTR("successful");
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1DB4B7000, v11, OS_LOG_TYPE_DEFAULT, "SIM lock save request was %@ for subscription context %@.", buf, 0x16u);
    }

    -[TPSSubscriberTelephonyController getSIMPasscodeLockEnabledValue](self, "getSIMPasscodeLockEnabledValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriberTelephonyController setSIMPasscodeLockEnabled:](self, "setSIMPasscodeLockEnabled:", objc_msgSend(v13, "BOOLValue"));

    -[TPSSubscriberTelephonyController getSIMPasscodeRemainingAttemptsValue](self, "getSIMPasscodeRemainingAttemptsValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", objc_msgSend(v14, "integerValue"));

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke;
    v15[3] = &unk_1EA2CDA90;
    v15[4] = self;
    v16 = v4;
    -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v15);
  }

}

void __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke(uint64_t a1)
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
  _QWORD block[6];
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke_2;
          block[3] = &unk_1EA2CDA68;
          v10 = *(_QWORD *)(a1 + 32);
          block[4] = v7;
          block[5] = v10;
          v12 = *(_BYTE *)(a1 + 40);
          dispatch_async(v9, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

uint64_t __74__TPSSubscriberTelephonyController_simLockSaveRequestDidComplete_success___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriberController:SIMLockDidCompleteWithResult:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)simPinEntryErrorDidOccur:(id)a3 status:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    TPSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1DB4B7000, v10, OS_LOG_TYPE_DEFAULT, "SIM PIN entry attempt failed for subscription context %@.", buf, 0xCu);
    }

    -[TPSSubscriberTelephonyController getSIMPasscodeRemainingAttemptsValue](self, "getSIMPasscodeRemainingAttemptsValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", objc_msgSend(v11, "integerValue"));

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke;
    v12[3] = &unk_1EA2CD7B8;
    v12[4] = self;
    -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v12);
  }

}

void __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke(uint64_t a1)
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
  _QWORD v11[6];
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

          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke_2;
          v11[3] = &unk_1EA2CD690;
          v10 = *(_QWORD *)(a1 + 32);
          v11[4] = v7;
          v11[5] = v10;
          dispatch_async(v9, v11);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __68__TPSSubscriberTelephonyController_simPinEntryErrorDidOccur_status___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "SIMPasscodeEntryDidFailForSubscriberController:", *(_QWORD *)(a1 + 40));
}

- (void)simPukEntryErrorDidOccur:(id)a3 status:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    TPSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1DB4B7000, v10, OS_LOG_TYPE_DEFAULT, "SIM PUK entry attempt failed for subscription context %@.", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke;
    v11[3] = &unk_1EA2CD7B8;
    v11[4] = self;
    -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v11);
  }

}

void __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke(uint64_t a1)
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
  _QWORD v11[6];
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

          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke_2;
          v11[3] = &unk_1EA2CD690;
          v10 = *(_QWORD *)(a1 + 32);
          v11[4] = v7;
          v11[5] = v10;
          dispatch_async(v9, v11);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

uint64_t __68__TPSSubscriberTelephonyController_simPukEntryErrorDidOccur_status___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "SIMPUKEntryDidFailForSubscriberController:", *(_QWORD *)(a1 + 40));
}

- (void)simPinChangeRequestDidComplete:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[5];
  BOOL v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSSubscriberTelephonyController subscriptionContext](self, "subscriptionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    TPSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("unsuccessful");
      if (v4)
        v12 = CFSTR("successful");
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1DB4B7000, v11, OS_LOG_TYPE_DEFAULT, "SIM PIN change was %@ for %@.", buf, 0x16u);
    }

    -[TPSSubscriberTelephonyController getSIMPasscodeRemainingAttemptsValue](self, "getSIMPasscodeRemainingAttemptsValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriberTelephonyController setSIMPasscodeRemainingAttempts:](self, "setSIMPasscodeRemainingAttempts:", objc_msgSend(v13, "integerValue"));

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke;
    v14[3] = &unk_1EA2CDA90;
    v14[4] = self;
    v15 = v4;
    -[TPSController performAtomicDelegateBlock:](self, "performAtomicDelegateBlock:", v14);
  }

}

void __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke(uint64_t a1)
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
  _QWORD block[6];
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateToQueue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v7);
          v9 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke_2;
          block[3] = &unk_1EA2CDA68;
          v10 = *(_QWORD *)(a1 + 32);
          block[4] = v7;
          block[5] = v10;
          v12 = *(_BYTE *)(a1 + 40);
          dispatch_async(v9, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

uint64_t __75__TPSSubscriberTelephonyController_simPinChangeRequestDidComplete_success___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriberController:SIMPasscodeChangeDidCompleteWithResult:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_SIMStatus, 0);
}

void __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_2(&dword_1DB4B7000, v2, v3, "%@ SIM PIN change failed with error %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __58__TPSSubscriberTelephonyController_setSIMLockEnabled_pin___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  OUTLINED_FUNCTION_2_0(&dword_1DB4B7000, v2, v3, "%@ set SIM lock %@ failed with error %@.", v4, v5, v6, v7, 2u);

}

void __59__TPSSubscriberTelephonyController_presentSIMPasscodeAlert__block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)objc_opt_class();
  v3 = *(const char **)(a1 + 40);
  v4 = v2;
  NSStringFromSelector(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1DB4B7000, v5, v6, "-[%@ %@] failed with error %@.", v7, v8, v9, v10, 2u);

}

- (void)getSIMPasscodeRemainingAttemptsValue
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_2(&dword_1DB4B7000, v2, v3, "%@ get remaining PIN attempt count failed with error %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)getSIMStatus
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_2(v0);
  OUTLINED_FUNCTION_1_2(&dword_1DB4B7000, v2, v3, "%@ get SIM status failed with error %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

@end

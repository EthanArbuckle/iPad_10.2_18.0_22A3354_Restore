@implementation TPSPhonebookTelephonyController

- (TPSPhonebookTelephonyController)init
{
  -[TPSPhonebookTelephonyController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSPhonebookTelephonyController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSPhonebookTelephonyController *v6;
  TPSPhonebookTelephonyController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSPhonebookTelephonyController;
  v6 = -[TPSTelephonyController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    -[TPSPhonebookTelephonyController fetchPhoneNumberInfo](v7, "fetchPhoneNumberInfo");
  }

  return v7;
}

- (CTPhoneNumberInfo)phoneNumberInfo
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
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__TPSPhonebookTelephonyController_phoneNumberInfo__block_invoke;
  v4[3] = &unk_1EA2CD6B8;
  v4[4] = self;
  v4[5] = &v5;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CTPhoneNumberInfo *)v2;
}

void __50__TPSPhonebookTelephonyController_phoneNumberInfo__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  if (!v3)
  {
    objc_msgSend(v2, "getPhoneNumberInfo");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)setPhoneNumberInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke;
  v6[3] = &unk_1EA2CD690;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTelephonyController performAtomicAccessorBlock:](self, "performAtomicAccessorBlock:", v6);

}

void __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke(uint64_t a1)
{
  id v2;
  id *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(id *)(a1 + 40);
  v3 = (id *)(*(_QWORD *)(a1 + 32) + 72);
  if (*v3 != v2)
  {
    objc_storeStrong(v3, v2);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_2;
    v5[3] = &unk_1EA2CD690;
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = v4;
    objc_msgSend(v6, "performAtomicDelegateBlock:", v5);

  }
}

void __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_2(uint64_t a1)
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
          block[2] = __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_3;
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

uint64_t __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "phonebookController:didChangePhoneNumberInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)getPhoneNumberInfo
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  -[TPSPhonebookTelephonyController getPhoneNumberInfoWithError:](self, "getPhoneNumberInfoWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    TPSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);

    }
  }

  return v3;
}

- (id)getPhoneNumberInfoWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSPhonebookTelephonyController subscriptionContext](self, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPhoneNumber:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchPhoneNumberInfo
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__TPSPhonebookTelephonyController_fetchPhoneNumberInfo__block_invoke;
  v2[3] = &unk_1EA2CDED8;
  v2[4] = self;
  v2[5] = a2;
  -[TPSPhonebookTelephonyController fetchPhoneNumberInfoWithCompletion:](self, "fetchPhoneNumberInfoWithCompletion:", v2);
}

void __55__TPSPhonebookTelephonyController_fetchPhoneNumberInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setPhoneNumberInfo:", a2);
  if (v5)
  {
    TPSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(const char **)(a1 + 40);
      v9 = v7;
      NSStringFromSelector(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v11, 0x20u);

    }
  }

}

- (void)fetchPhoneNumberInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSPhonebookTelephonyController subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPhoneNumberWithCompletion:completion:", v5, v4);

}

- (void)selectPhoneBookWithName:(int)a3 password:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSPhonebookTelephonyController subscriptionContext](self, "subscriptionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectPhonebook:forPhonebookName:withPassword:completion:", v10, v6, v9, v8);

}

- (void)savePhoneBookEntryAtIndex:(int)a3 withContactName:(id)a4 contactNumber:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke;
  v5[3] = &unk_1EA2CDAE0;
  v5[4] = self;
  v5[5] = a2;
  -[TPSPhonebookTelephonyController savePhoneBookEntryAtIndex:withContactName:contactNumber:completion:](self, "savePhoneBookEntryAtIndex:withContactName:contactNumber:completion:", *(_QWORD *)&a3, a4, a4, v5);
}

void __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    TPSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)savePhoneBookEntryAtIndex:(int)a3 withContactName:(id)a4 contactNumber:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSPhonebookTelephonyController subscriptionContext](self, "subscriptionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "savePhonebookEntry:atIndex:withContactName:contactNumber:completion:", v13, v8, v12, v11, v10);

}

- (void)updatePhoneNumberInfo:(id)a3 label:(id)a4 number:(id)a5 completion:(id)a6
{
  id v8;
  _QWORD v9[5];

  v8 = a6;
  -[TPSPhonebookTelephonyController setUpdatePhoneNumber:](self, "setUpdatePhoneNumber:", a5);
  -[TPSPhonebookTelephonyController setUpdatePhoneNumberInfoCompletion:](self, "setUpdatePhoneNumberInfoCompletion:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__TPSPhonebookTelephonyController_updatePhoneNumberInfo_label_number_completion___block_invoke;
  v9[3] = &unk_1EA2CD720;
  v9[4] = self;
  -[TPSPhonebookTelephonyController selectPhoneBookWithName:password:completion:](self, "selectPhoneBookWithName:password:completion:", 2, 0, v9);
}

uint64_t __81__TPSPhonebookTelephonyController_updatePhoneNumberInfo_label_number_completion___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);

  if (a2)
  {
    v2 = result;
    v3 = *(void **)(result + 32);
    v4 = a2;
    objc_msgSend(v3, "setUpdatePhoneNumber:", 0);
    objc_msgSend(*(id *)(v2 + 32), "updatePhoneNumberInfoCompletion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v4);

    return objc_msgSend(*(id *)(v2 + 32), "setUpdatePhoneNumberInfoCompletion:", 0);
  }
  return result;
}

- (void)phoneNumberChanged:(id)a3
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TPSPhonebookTelephonyController subscriptionContext](self, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    TPSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "-[%@ %@] for subscription context %@.", (uint8_t *)&v13, 0x20u);

    }
    -[TPSPhonebookTelephonyController getPhoneNumberInfo](self, "getPhoneNumberInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSPhonebookTelephonyController setPhoneNumberInfo:](self, "setPhoneNumberInfo:", v12);

  }
}

- (void)phoneBookSelected:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __CFString *v21;
  id v22;
  id v23;
  TPSPhonebookTelephonyController *v24;
  int v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TPSPhonebookTelephonyController subscriptionContext](self, "subscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    -[TPSPhonebookTelephonyController updatePhoneNumber](self, "updatePhoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      TPSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_opt_class();
        v11 = v10;
        NSStringFromSelector(a2);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v10;
        v28 = 2112;
        v29 = v12;
        v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_1DB4B7000, v9, OS_LOG_TYPE_DEFAULT, "-[%@ %@] for subscription context %@.", buf, 0x20u);

      }
      -[TPSPhonebookTelephonyController updatePhoneNumber](self, "updatePhoneNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "tps_stringWithCTPhoneBookName:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      TPSLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413314;
        v27 = v6;
        v28 = 2112;
        v29 = CFSTR("My Number");
        v30 = 2112;
        v31 = v13;
        v32 = 2112;
        v33 = v14;
        v34 = 1024;
        v35 = 1;
        _os_log_impl(&dword_1DB4B7000, v15, OS_LOG_TYPE_DEFAULT, "Updating phone number (subscriptionContext: %@, label: %@, number: %@, selectedPhoneBookName: %@, index: %u).", buf, 0x30u);
      }

      -[TPSTelephonyController telephonyClient](self, "telephonyClient");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __53__TPSPhonebookTelephonyController_phoneBookSelected___block_invoke;
      v19[3] = &unk_1EA2CDF00;
      v20 = v6;
      v21 = CFSTR("My Number");
      v22 = v13;
      v23 = v14;
      v25 = 1;
      v24 = self;
      v17 = v14;
      v18 = v13;
      objc_msgSend(v16, "savePhonebookEntry:atIndex:withContactName:contactNumber:completion:", v20, 1, CFSTR("My Number"), v18, v19);

    }
  }

}

void __53__TPSPhonebookTelephonyController_phoneBookSelected___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void (**v10)(_QWORD, _QWORD);
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TPSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_DWORD *)(a1 + 72);
    v11 = 138413570;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = v9;
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_1DB4B7000, v4, OS_LOG_TYPE_DEFAULT, "Received response for update phone number (subscriptionContext: %@, label: %@, number: %@, selectedPhoneBookName: %@, index: %u, error: %@).", (uint8_t *)&v11, 0x3Au);
  }

  objc_msgSend(*(id *)(a1 + 64), "setUpdatePhoneNumber:", 0);
  objc_msgSend(*(id *)(a1 + 64), "updatePhoneNumberInfoCompletion");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v10)[2](v10, v3);

  objc_msgSend(*(id *)(a1 + 64), "setUpdatePhoneNumberInfoCompletion:", 0);
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (int64_t)phoneBookEntryCount
{
  return self->_phoneBookEntryCount;
}

- (void)setPhoneBookEntryCount:(int64_t)a3
{
  self->_phoneBookEntryCount = a3;
}

- (NSString)updatePhoneNumber
{
  return self->_updatePhoneNumber;
}

- (void)setUpdatePhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)updatePhoneNumberInfoCompletion
{
  return self->_updatePhoneNumberInfoCompletion;
}

- (void)setUpdatePhoneNumberInfoCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatePhoneNumberInfoCompletion, 0);
  objc_storeStrong((id *)&self->_updatePhoneNumber, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_phoneNumberInfo, 0);
}

void __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = *(const char **)(a1 + 40);
  v8 = v6;
  NSStringFromSelector(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v6;
  v12 = 2112;
  v13 = v9;
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_1DB4B7000, a3, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v10, 0x20u);

}

@end

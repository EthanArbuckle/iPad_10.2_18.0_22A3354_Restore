@implementation PKSafariCredentialsUtilities

+ (void)hasSafariCredentials:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PKSafariCredentialsUtilities_hasSafariCredentials___block_invoke;
  v5[3] = &unk_1E2AD2A28;
  v6 = v3;
  v4 = v3;
  +[PKSafariCredentialsUtilities _retrieveSafariCredentials:](PKSafariCredentialsUtilities, "_retrieveSafariCredentials:", v5);

}

void __53__PKSafariCredentialsUtilities_hasSafariCredentials___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;

  v6 = a3;
  if (a4)
    objc_msgSend(a4, "count");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)retrieveSafariCredentials:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PKSafariCredentialsUtilities_retrieveSafariCredentials___block_invoke;
  v5[3] = &unk_1E2AD2A28;
  v6 = v3;
  v4 = v3;
  +[PKSafariCredentialsUtilities _retrieveSafariCredentials:](PKSafariCredentialsUtilities, "_retrieveSafariCredentials:", v5);

}

void __58__PKSafariCredentialsUtilities_retrieveSafariCredentials___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  PKPaymentSafariCredential *v13;
  PKPaymentSafariCredential *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a2)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = -[PKPaymentSafariCredential initWithSafariDictionary:]([PKPaymentSafariCredential alloc], "initWithSafariDictionary:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v14 = v13;
          if (v13 && -[PKPaymentSafariCredential canCheckEligibility](v13, "canCheckEligibility"))
          {
            objc_msgSend(v7, "addObject:", v14);
          }
          else
          {
            PKLogFacilityTypeGetObject(6uLL);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Not adding Safari credential: Either missing required fields, or card has expired, so can't check eligibility", buf, 2u);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v7, "count");
      v19 = objc_msgSend(v8, "count");
      v20 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218240;
      v27 = v18;
      v28 = 2048;
      v29 = v19 - v20;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Got %lu Safari Cards, after filtering out %lu duplicates/invalid.", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v21;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (void)_retrieveSafariCredentials:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD handler[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  dispatch_source_t v27;

  v3 = a3;
  if (v3)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      dispatch_get_global_queue(0, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__42;
      v26 = __Block_byref_object_dispose__42;
      v27 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
      v5 = v23[5];
      v6 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      v21 = 0;
      v7 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke;
      aBlock[3] = &unk_1E2AD2A50;
      v18 = &v22;
      v19 = v20;
      v17 = v3;
      v8 = _Block_copy(aBlock);
      v9 = v23[5];
      handler[0] = v7;
      handler[1] = 3221225472;
      handler[2] = __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_2;
      handler[3] = &unk_1E2ABD9A0;
      v10 = v8;
      v15 = v10;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume((dispatch_object_t)v23[5]);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_11;
      block[3] = &unk_1E2ABD9A0;
      v13 = v10;
      v11 = v10;
      dispatch_async(v4, block);

      _Block_object_dispose(v20, 8);
      _Block_object_dispose(&v22, 8);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v3 + 2))(v3, 0, 0, MEMORY[0x1E0C9AA60]);
    }
  }

}

void __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = *(NSObject **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v8)
  {
    dispatch_source_cancel(v8);
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  v11 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v11 + 24))
  {
    *(_BYTE *)(v11 + 24) = 1;
    v12 = a1[4];
    if (v12)
      (*(void (**)(uint64_t, uint64_t, id, id))(v12 + 16))(v12, a2, v13, v7);
  }

}

uint64_t __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Timeout occured for -[PKPaymentProvisioningController retrieveSafariCredentials:]", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_11(uint64_t a1)
{
  void *v2;
  id v3;
  void (*v4)(void);
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_msgSend((Class)getSFSafariCreditCardStoreClass[0](), "savedCreditCardsWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v2)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Couldn't get credentials from Safari: %@", buf, 0xCu);
    }

    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v4();

}

@end

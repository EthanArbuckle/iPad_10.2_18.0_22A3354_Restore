@implementation PKPaymentCloudStoreZoneCreationManager

- (PKPaymentCloudStoreZoneCreationManager)initWithWebService:(id)a3
{
  id v5;
  PKPaymentCloudStoreZoneCreationManager *v6;
  PKPaymentCloudStoreZoneCreationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentCloudStoreZoneCreationManager;
  v6 = -[PKPaymentCloudStoreZoneCreationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_webService, a3);

  return v7;
}

- (void)triggerCloudStoreZoneCreationIfNeededForEligibilityResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  __int128 *v20;
  _QWORD handler[4];
  id v22;
  id v23;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  dispatch_source_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "supplementaryData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lightweightAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__82;
      v28 = __Block_byref_object_dispose__82;
      v29 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v10 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
      v11 = dispatch_time(0, 120000000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v12 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
      v13 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke;
      handler[3] = &unk_1E2AD8CB0;
      v14 = v9;
      v22 = v14;
      p_buf = &buf;
      v15 = v7;
      v23 = v15;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_resume(*(dispatch_object_t *)(*((_QWORD *)&buf + 1) + 40));
      -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke_8;
      v18[3] = &unk_1E2ADC1E0;
      v20 = &buf;
      v19 = v15;
      objc_msgSend(v16, "triggerCloudStoreZoneCreationForAccount:withCompletion:", v14, v18);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "No account found, skipping cloud store zone creation for eligibility response %@", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }

  }
}

NSObject *__113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *result;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Timed out waiting for cloud store zone creation for account %@", (uint8_t *)&v7, 0xCu);
  }

  result = *(NSObject **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    dispatch_source_cancel(result);
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

NSObject *__113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke_8(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  NSObject *result;
  uint64_t v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Cloud store zone creation triggered with success: %@", (uint8_t *)&v9, 0xCu);
  }

  result = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    dispatch_source_cancel(result);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webService, 0);
}

@end

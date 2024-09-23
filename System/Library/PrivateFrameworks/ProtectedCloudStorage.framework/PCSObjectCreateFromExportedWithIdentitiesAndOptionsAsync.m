@implementation PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync

void __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync", v2);
  v1 = (void *)PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_queue;
  PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_queue = (uint64_t)v0;

}

void __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _DWORD *v4;
  const void *v5;
  BOOL v6;
  id v7;
  void *v8;
  int v9;
  unsigned __int8 v10;
  const void *v11;
  _QWORD v12[4];
  id v13;
  const void *v14;
  __int128 v15;
  const void *v16;

  v16 = 0;
  v2 = (void *)PCSIdentitySetCopyService(*(_QWORD *)(a1 + 48));
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = CreateWithExportedInternal(*(const void **)(a1 + 56), *(_QWORD *)(a1 + 48), 0, 0, 0, 0, v3, &v16);
  if (!v4)
  {
    if (objc_msgSend(v3, "count"))
      v6 = v2 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = *(id *)(a1 + 32);
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", kPCSFPAllowFetch);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = objc_msgSend(v8, "BOOLValue");

          if (v9)
          {
            v10 = atomic_load(initialSyncComplete);
            if ((v10 & 1) == 0)
            {
              v12[0] = MEMORY[0x1E0C809B0];
              v12[1] = 3221225472;
              v12[2] = __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3;
              v12[3] = &unk_1E553E0D0;
              v13 = *(id *)(a1 + 40);
              v14 = v16;
              v15 = *(_OWORD *)(a1 + 48);
              _PCSCKKSOutOfBandFetchIdentities(v3, v2, 0, v12);

              goto LABEL_18;
            }
          }
          goto LABEL_14;
        }

      }
    }
LABEL_14:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_15;
  }
  v5 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CFRelease(v5);
LABEL_15:
  v11 = v16;
  if (v16)
  {
    v16 = 0;
    CFRelease(v11);
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));
LABEL_18:

}

void __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  _DWORD *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFTypeRef v33;
  CFTypeRef cf;

  if (!a2 || a3)
  {
    if (a3)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3_cold_2((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);
      v14 = a3;
      objc_msgSend(v14, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("CKKSErrorDomain")))
      {
        v16 = objc_msgSend(v14, "code");
        v17 = kPCSCKKSErrorOutOfBandFetchingDisallowed;

        if (v16 == v17)
        {
          atomic_store(1u, initialSyncComplete);
          v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v18)
            __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
      else
      {

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    cf = 0;
    v5 = CreateWithExportedInternal(*(const void **)(a1 + 56), a2, 0, 0, 0, 0, 0, &cf);
    if (v5)
    {
      v6 = v5;
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      CFRelease(v6);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3_cold_3((uint64_t)&cf, v26, v27, v28, v29, v30, v31, v32);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    v33 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v33);
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A9508000, MEMORY[0x1E0C81028], a3, "CKKS initial sync has completed, rejecting OOB fetch", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A9508000, MEMORY[0x1E0C81028], a3, "OOB fetch failed: %@", a5, a6, a7, a8, 2u);
}

void __PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync_block_invoke_3_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A9508000, MEMORY[0x1E0C81028], a3, "Creating PCS object with OOB identities failed: %@", a5, a6, a7, a8, 2u);
}

@end

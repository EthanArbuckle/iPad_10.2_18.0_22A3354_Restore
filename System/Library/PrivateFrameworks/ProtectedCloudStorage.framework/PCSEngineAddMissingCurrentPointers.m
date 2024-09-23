@implementation PCSEngineAddMissingCurrentPointers

void __PCSEngineAddMissingCurrentPointers_block_invoke(uint64_t a1, __CFString *key)
{
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  CFTypeRef v12;
  const void *v13;
  NSObject *v14;
  unsigned int IndexByName;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFDictionary *v25;
  OSStatus v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  CFTypeRef cf[5];
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  __CFString *v49;
  __int16 v50;
  OSStatus v51;
  _QWORD v52[9];
  _QWORD v53[12];

  v53[9] = *MEMORY[0x1E0C80C00];
  if (!PCSServiceItemTypeIsManatee((_BOOL8)key))
  {
    v4 = dispatch_semaphore_create(0);
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    if (PCSServiceItemGetCKKSViewByName(key))
    {
      PCSServiceItemGetAccessGroupByName(key);
      cf[1] = (CFTypeRef)MEMORY[0x1E0C809B0];
      cf[2] = (CFTypeRef)3221225472;
      cf[3] = __PCSEngineAddMissingCurrentPointers_block_invoke_602;
      cf[4] = &unk_1E553E7B8;
      v36 = &v44;
      v37 = &v40;
      v5 = *(_QWORD *)(a1 + 40);
      v38 = key;
      v39 = v5;
      v6 = v4;
      v35 = v6;
      SecItemFetchCurrentItemAcrossAllDevices();
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      if (*((_BYTE *)v45 + 24))
      {
        pcsLogObjForScope("ckks");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = key;
          _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "Found current item pointer for service %@", buf, 0xCu);
        }

        if (v41[3])
        {
          v8 = objc_msgSend(*(id *)(a1 + 32), "set");
          if ((_PCSIdentitySetIsCurrentIdentity(v8, v41[3]) & 1) == 0)
          {
            pcsLogObjForScope("ckks");
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v49 = key;
              _os_log_impl(&dword_1A9508000, v9, OS_LOG_TYPE_DEFAULT, "Current item for %@ does not have current bit set, attempting to fix", buf, 0xCu);
            }

            cf[0] = 0;
            v10 = objc_msgSend(*(id *)(a1 + 32), "set");
            if ((PCSIdentitySetSetCurrentIdentityWithError(v10, v41[3], cf) & 1) == 0)
            {
              pcsLogObjForScope("ckks");
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = (__CFString *)cf[0];
                _os_log_impl(&dword_1A9508000, v11, OS_LOG_TYPE_DEFAULT, "Failed to set current bit: %@", buf, 0xCu);
              }

            }
            v12 = cf[0];
            if (cf[0])
            {
              cf[0] = 0;
              CFRelease(v12);
            }
          }
        }
        v13 = (const void *)v41[3];
        if (v13)
        {
          v41[3] = 0;
          CFRelease(v13);
        }
      }
      else
      {
        IndexByName = PCSServiceItemGetIndexByName((const __CFNumber *)key);
        if (IndexByName)
        {
          v16 = *MEMORY[0x1E0CD6C98];
          v53[0] = *MEMORY[0x1E0CD6CB8];
          v17 = *MEMORY[0x1E0CD6BC8];
          v52[0] = v16;
          v52[1] = v17;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IndexByName | 0x10000);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *MEMORY[0x1E0CD7010];
          v53[1] = v18;
          v53[2] = MEMORY[0x1E0C9AAB0];
          v20 = *MEMORY[0x1E0CD7018];
          v52[2] = v19;
          v52[3] = v20;
          v21 = *MEMORY[0x1E0CD7020];
          v53[3] = MEMORY[0x1E0C9AAB0];
          v53[4] = MEMORY[0x1E0C9AAB0];
          v22 = *MEMORY[0x1E0CD6B80];
          v52[4] = v21;
          v52[5] = v22;
          v23 = *MEMORY[0x1E0CD6B40];
          v53[5] = MEMORY[0x1E0C9AAB0];
          v53[6] = kPCSServiceName[0];
          v24 = *MEMORY[0x1E0CD6B50];
          v52[6] = v23;
          v52[7] = v24;
          v53[7] = *(_QWORD *)(a1 + 40);
          v52[8] = *MEMORY[0x1E0CD6B78];
          v53[8] = PCSServiceItemGetViewHintByName(key);
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 9);
          v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          cf[0] = 0;
          v26 = SecItemCopyMatching(v25, cf);
          if (v26)
          {
            pcsLogObjForScope("ckks");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = key;
              v50 = 1024;
              v51 = v26;
              _os_log_impl(&dword_1A9508000, v27, OS_LOG_TYPE_DEFAULT, "Failed to get current in local keychain for service %@: %d", buf, 0x12u);
            }

          }
          else
          {
            v28 = (void *)cf[0];
            if (cf[0])
            {
              objc_msgSend((id)cf[0], "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B38]);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29 && v30)
              {
                PCSServiceItemGetAccessGroupByName(key);
                v32 = v28;
                v33 = v6;
                SecItemSetCurrentItemAcrossAllDevices();
                dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

              }
              else
              {
                pcsLogObjForScope("ckks");
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = key;
                  _os_log_impl(&dword_1A9508000, v31, OS_LOG_TYPE_DEFAULT, "Failed to get CKKS pref and digest %@", buf, 0xCu);
                }

              }
            }
          }
        }
        else
        {
          pcsLogObjForScope("ckks");
          v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v49 = key;
            _os_log_impl(&dword_1A9508000, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "Failed to get service ID for %@", buf, 0xCu);
          }
        }

      }
      v14 = v35;
    }
    else
    {
      pcsLogObjForScope("ckks");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = key;
        _os_log_impl(&dword_1A9508000, v14, OS_LOG_TYPE_DEFAULT, "Failed to get CKKS view for service %@", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);

  }
}

intptr_t __PCSEngineAddMissingCurrentPointers_block_invoke_602(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2 && !a3)
    goto LABEL_6;
  pcsLogObjForScope("ckks");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 56);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = a3;
    _os_log_impl(&dword_1A9508000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get CKKS current item pointer for service %@: %@", (uint8_t *)&v9, 0x16u);
  }

  if (a2)
  {
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = PCSIdentityCreateFromPersistentReference(a2, *(void **)(a1 + 64));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __PCSEngineAddMissingCurrentPointers_block_invoke_605(uint64_t a1, void *a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  pcsLogObjForScope("ckks");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 48);
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = a2;
      _os_log_impl(&dword_1A9508000, v4, OS_LOG_TYPE_DEFAULT, "Failed to setting CKKS current for service %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1A9508000, v4, OS_LOG_TYPE_DEFAULT, "Set CKKS current for service %@ to the identity: %@", (uint8_t *)&v10, 0x16u);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end

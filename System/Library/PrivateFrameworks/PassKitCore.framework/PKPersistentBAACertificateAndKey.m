@implementation PKPersistentBAACertificateAndKey

void __PKPersistentBAACertificateAndKey_block_invoke(uint64_t a1, __SecKey *a2, void *a3, void *a4)
{
  uint64_t (*v7)(uint64_t, uint64_t);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  SecAccessControlRef v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  _QWORD v30[4];
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, __SecKey *, void *, void *);
  void *v35;
  _QWORD *v36;
  _BYTE *v37;
  CFErrorRef error;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject(0xEuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "PKPersistentBAACertificateAndKey_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 2112;
    v40 = v7;
    LOWORD(v41) = 2112;
    *(_QWORD *)((char *)&v41 + 2) = v8;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%s with reference key: %@, certificates: %@, error: %@", buf, 0x2Au);
  }

  if (v8)
  {
    if ((mobileactivationErrorHasDomainAndErrorCode() & 1) != 0
      || mobileactivationErrorHasDomainAndErrorCode())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18FC92000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "BAA (UCRT) failed due to missing UCRT, falling back to BAA (SCRT)", buf, 2u);
      }
      v10 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v12 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __PKPersistentBAACertificateAndKey_block_invoke_31;
      v30[3] = &unk_1E2AD2FC8;
      v29 = *(_OWORD *)(a1 + 48);
      v13 = (id)v29;
      v31 = v29;
      v14 = v10;
      v15 = v11;
      v16 = v30;
      error = 0;
      v17 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68E0], 0x40000001uLL, &error);
      if (v17)
      {
        PKBAAOptionsDictionary(1, 0, &unk_1E2C3F088, (uint64_t)v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v17);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v40 = __Block_byref_object_copy__43;
        *(_QWORD *)&v41 = __Block_byref_object_dispose__43;
        *((_QWORD *)&v41 + 1) = 0;
        if (v14)
        {
          v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC12A0]), "initWithExternalizedContext:", v14);
          v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v19;

          objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("kSecUseAuthenticationUIFail"), *MEMORY[0x1E0D1D1A8]);
          objc_msgSend(v18, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), *MEMORY[0x1E0D1D148]);
        }
        v32 = v12;
        v33 = 3221225472;
        v34 = __PKGenerateSCRTFallbackCertificateAndKey_block_invoke;
        v35 = &unk_1E2AD3040;
        v37 = buf;
        v36 = v16;
        DeviceIdentityIssueClientCertificateWithCompletion();

        _Block_object_dispose(buf, 8);
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = error;
          _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: failed to create access control for BAA (SCRT) cert key: %@", buf, 0xCu);
        }

        if (error)
          CFRelease(error);
      }

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create BAA (UCRT) attestation: %@", buf, 0xCu);

      }
      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v26)
      {
        objc_msgSend(v26, "invalidate");
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = 0;

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v21)
    {
      objc_msgSend(v21, "invalidate");
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = 0;

    }
    PKExtractBAACertificatesData(a2, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  if (a2)
    CFRelease(a2);

}

void __PKPersistentBAACertificateAndKey_block_invoke_31(uint64_t a1, void *a2, const void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    objc_msgSend(v8, "invalidate");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3)
    CFRelease(a3);

}

@end

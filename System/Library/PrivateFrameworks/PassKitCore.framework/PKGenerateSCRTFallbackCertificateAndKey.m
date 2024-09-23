@implementation PKGenerateSCRTFallbackCertificateAndKey

void __PKGenerateSCRTFallbackCertificateAndKey_block_invoke(uint64_t a1, __SecKey *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  __SecKey *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v9)
  {
    objc_msgSend(v9, "invalidate");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315906;
    v16 = "PKGenerateSCRTFallbackCertificateAndKey_block_invoke";
    v17 = 2112;
    v18 = a2;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "%s with reference key: %@, certificates: %@, error: %@", (uint8_t *)&v15, 0x2Au);
  }

  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "description");
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create BAA (SCRT) attestation: %@", (uint8_t *)&v15, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PKExtractBAACertificatesData(a2, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end

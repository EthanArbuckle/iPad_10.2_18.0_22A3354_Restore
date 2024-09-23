@implementation PKGenerateOneTimeBAACertificate

void __PKGenerateOneTimeBAACertificate_block_invoke(uint64_t a1, __SecKey *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  char *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  __SecKey *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject(0xEuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315906;
    v13 = "PKGenerateOneTimeBAACertificate_block_invoke";
    v14 = 2112;
    v15 = a2;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%s with reference key: %@, certificates: %@, error: %@", (uint8_t *)&v12, 0x2Au);
  }

  if (!v8)
  {
    PKExtractBAACertificatesData(a2, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if (!a2)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "description");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create BAA attestation: %@", (uint8_t *)&v12, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a2)
LABEL_7:
    CFRelease(a2);
LABEL_8:

}

@end

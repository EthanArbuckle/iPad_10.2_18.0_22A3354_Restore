@implementation PKForceRefreshBAACertificateAndKey

void __PKForceRefreshBAACertificateAndKey_block_invoke(uint64_t a1, __SecKey *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const __CFData *v10;
  NSObject *v11;
  __SecKey *v12;
  __SecKey *v13;
  CFDataRef v14;
  __CFError *v15;
  uint64_t v16;
  CFErrorRef error;
  uint8_t buf[4];
  CFDataRef v19;
  __int16 v20;
  __CFError *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "description");
      v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create BAA (UCRT) attestation: %@", buf, 0xCu);

    }
  }
  else
  {
    if (a2 && objc_msgSend(v7, "count") == 2)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Successfully forced refresh of stored BAA key and certificates", buf, 2u);
      }

      v12 = SecKeyCopyPublicKey(a2);
      if (v12)
      {
        v13 = v12;
        error = 0;
        v14 = SecKeyCopyExternalRepresentation(v12, &error);
        v15 = error;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v14;
          v20 = 2112;
          v21 = v15;
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Client public key generated by Device Identity: %@\n error: %@", buf, 0x16u);
        }

        CFRelease(v13);
        if (error)
          CFRelease(error);

      }
      v16 = *(_QWORD *)(a1 + 32);
      if (v16)
        (*(void (**)(void))(v16 + 16))();
      goto LABEL_19;
    }
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get reference key or cert", buf, 2u);
    }
  }

  if (a2)
LABEL_19:
    CFRelease(a2);

}

@end

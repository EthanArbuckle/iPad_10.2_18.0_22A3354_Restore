@implementation SFAppleIDClientCopyCertificateInfo

void __SFAppleIDClientCopyCertificateInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  const void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v19 = a2;
  v3 = NSErrorToOSStatus();
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  else if (v19)
  {
    objc_msgSend(v19, "appleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 48));

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(v19, "altDSID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v19, "altDSID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("encDsId"));

        }
        objc_msgSend(v19, "identity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (const void *)objc_msgSend(v11, "copyCertificate");

        if (v6)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("CertificateReference"));
        objc_msgSend(v19, "identity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serialNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v19, "identity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serialNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("SerialNumber"));

        }
        objc_msgSend(v19, "validationRecord");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "data");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("AppleIDAccountValidationRecordData"));
        v3 = 0;
      }
      else
      {
        v5 = 0;
        v6 = 0;
        v3 = 4294960568;
      }
    }
    else
    {
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v3 = 201201;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v3 = 4294960534;
  }
  v17 = *(_QWORD *)(a1 + 40);
  v18 = v4;
  (*(void (**)(uint64_t, id, uint64_t))(v17 + 16))(v17, v18, v3);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v6)
    CFRelease(v6);

}

uint64_t __SFAppleIDClientCopyCertificateInfo_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

@end

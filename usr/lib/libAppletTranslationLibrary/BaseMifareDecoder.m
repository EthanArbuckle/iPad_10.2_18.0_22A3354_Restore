@implementation BaseMifareDecoder

+ (BOOL)canDecodeSPId:(unsigned __int8)a3
{
  return 1;
}

+ (id)getServiceProvider:(unsigned __int8)a3
{
  char v3;
  __CFString *v4;

  v3 = a3 - 48;
  if ((a3 - 48) < 7 && ((0x59u >> v3) & 1) != 0)
  {
    v4 = off_1E7D8AE10[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)getEmReentryDelayMs
{
  return &unk_1E7D9B280;
}

+ (BOOL)getDontWaitForEOT
{
  return 0;
}

+ (BOOL)didTransactionError:(id *)a3 withTransactionResult:(unsigned __int16 *)a4
{
  _BOOL4 v6;
  _BOOL4 v7;
  __int16 v8;
  unsigned __int16 v9;

  v6 = *(unsigned __int16 *)((char *)&a3->var7 + 1) == 18 && a3->var8[1] == 1
    || *(unsigned __int16 *)((char *)&a3->var7 + 1) == 19 && a3->var8[1] == 238;
  v7 = *(_WORD *)&a3->var4[31] == 0x4000 && v6;
  if (a4)
  {
    if (v7)
      v8 = 64;
    else
      v8 = 0;
    if (HIBYTE(a3->var7) == 15)
      v9 = -4096;
    else
      v9 = v8;
    *a4 = v9;
  }
  return !v7;
}

+ (BOOL)supportsPlasticCardMode:(unsigned __int8)a3 withTransceiver:(id)a4
{
  return 0;
}

+ (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint8_t v20[8];
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "MIFARE Decoder doesn't support GetState", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MIFARE Decoder doesn't support GetState"));
  v10 = (void *)v9;
  if (a7)
  {
    v11 = *a7;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v13 = *MEMORY[0x1E0CB3388];
      v21[0] = *MEMORY[0x1E0CB2D50];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v22;
      v16 = v21;
      v17 = 2;
    }
    else
    {
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = v9;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v24;
      v16 = &v23;
      v17 = 1;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint8_t v21[8];
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1C3511000, v9, OS_LOG_TYPE_ERROR, "MIFARE Decoder doesn't support getServiceProviderData", v21, 2u);
  }

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MIFARE Decoder doesn't support getServiceProviderData"));
  v11 = (void *)v10;
  if (a9)
  {
    v12 = *a9;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    if (*a9)
    {
      v14 = *MEMORY[0x1E0CB3388];
      v22[0] = *MEMORY[0x1E0CB2D50];
      v22[1] = v14;
      v23[0] = v10;
      v23[1] = v12;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v23;
      v17 = v22;
      v18 = 2;
    }
    else
    {
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = v10;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = v25;
      v17 = &v24;
      v18 = 1;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v19);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint8_t v20[8];
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "MIFARE Decoder doesn't support getServiceProviderData", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MIFARE Decoder doesn't support getServiceProviderData"));
  v10 = (void *)v9;
  if (a7)
  {
    v11 = *a7;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v13 = *MEMORY[0x1E0CB3388];
      v21[0] = *MEMORY[0x1E0CB2D50];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v22;
      v16 = v21;
      v17 = 2;
    }
    else
    {
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = v9;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v24;
      v16 = &v23;
      v17 = 1;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end

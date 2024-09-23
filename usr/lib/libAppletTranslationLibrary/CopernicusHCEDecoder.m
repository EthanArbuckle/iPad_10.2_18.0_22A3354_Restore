@implementation CopernicusHCEDecoder

+ (BOOL)isCopernicusHCE:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("A000000704D011500000000003000000"));
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("Supported");
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "HCE has no history", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("HCE has no history"));
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
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 7, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
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
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "HCE has no EOT", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("HCE has no EOT"));
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
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 7, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[7];
  _QWORD v28[7];
  _QWORD v29[2];
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((unint64_t)objc_msgSend(v10, "length") <= 1)
  {
    ATLLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v34 = objc_msgSend(v10, "length");
      _os_log_impl(&dword_1C3511000, v12, OS_LOG_TYPE_ERROR, "Bad length %u", buf, 8u);
    }

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Bad length %u"), objc_msgSend(v10, "length"));
    v14 = (void *)v13;
    if (a8)
    {
      v15 = *a8;
      v16 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v17 = *MEMORY[0x1E0CB3388];
        v29[0] = *MEMORY[0x1E0CB2D50];
        v29[1] = v17;
        v30[0] = v13;
        v30[1] = v15;
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = v30;
        v20 = v29;
        v21 = 2;
      }
      else
      {
        v31 = *MEMORY[0x1E0CB2D50];
        v32 = v13;
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = &v32;
        v20 = &v31;
        v21 = 1;
      }
      objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 3, v25);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0;
    }
    goto LABEL_11;
  }
  v22 = (void *)MEMORY[0x1E0C99E08];
  v27[0] = CFSTR("EventType");
  v27[1] = CFSTR("appletIdentifier");
  v28[0] = CFSTR("EndEvent");
  v28[1] = v11;
  v27[2] = CFSTR("didError");
  v27[3] = CFSTR("command");
  v28[2] = MEMORY[0x1E0C9AAB0];
  v28[3] = &unk_1E7D9B298;
  v27[4] = CFSTR("status");
  v27[5] = CFSTR("result");
  v28[4] = &unk_1E7D9B298;
  v28[5] = &unk_1E7D9B2B0;
  v27[6] = CFSTR("informative");
  v28[6] = &unk_1E7D9B298;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v23);
  a8 = (id *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "length") >= 4)
  {
    v24 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v24 + 2)) >> 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a8, "setObject:forKeyedSubscript:", v14, CFSTR("PairingModeBrandCode"));
LABEL_11:

  }
  return a8;
}

@end

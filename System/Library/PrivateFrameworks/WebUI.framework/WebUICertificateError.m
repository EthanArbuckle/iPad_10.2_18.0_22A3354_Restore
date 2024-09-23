@implementation WebUICertificateError

+ (BOOL)userAllowsCertificateTrust:(__SecTrust *)a3 host:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  NSObject *v20;
  uint64_t *v21;
  __SecTrust *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BE15928], "defaultTrustManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE15930];
  v8 = objc_msgSend(v6, "actionForSSLTrust:hostname:service:", a3, v5, *MEMORY[0x24BE15930]);
  if (v8)
  {
    if (v8 == 1)
    {
      v9 = 1;
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x24BE15920]);
      objc_msgSend(v10, "setTrust:", a3);
      objc_msgSend(v5, "_webkit_decodeHostName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHost:", v11);

      objc_msgSend(v10, "setService:", v7);
      if (objc_msgSend(off_24CB8CC40, "certificateWarningCannotBeBypassedForTrust:", a3))
      {
        v12 = *MEMORY[0x24BE15948];
        v27[0] = *MEMORY[0x24BE15950];
        v27[1] = v12;
        v28[0] = MEMORY[0x24BDBD1C0];
        v28[1] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v14 = dispatch_semaphore_create(0);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __57__WebUICertificateError_userAllowsCertificateTrust_host___block_invoke;
      v17[3] = &unk_24CB8D330;
      v18 = v6;
      v22 = a3;
      v19 = v5;
      v21 = &v23;
      v15 = v14;
      v20 = v15;
      objc_msgSend(v10, "showPromptWithOptions:responseBlock:", v13, v17);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      v9 = *((_BYTE *)v24 + 24) != 0;

      _Block_object_dispose(&v23, 8);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

intptr_t __57__WebUICertificateError_userAllowsCertificateTrust_host___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 2)
    objc_msgSend(*(id *)(a1 + 32), "allowTrust:forHost:service:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *MEMORY[0x24BE15930]);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (a2 - 1) < 2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end

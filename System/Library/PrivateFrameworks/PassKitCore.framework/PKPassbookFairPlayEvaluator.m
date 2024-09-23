@implementation PKPassbookFairPlayEvaluator

- (PKPassbookFairPlayEvaluator)init
{

  return 0;
}

+ (void)getFairPlayInfoWithAuditToken:(id *)a3 nonce:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  os_log_t v9;
  Class v10;
  __int128 v11;
  id v12;
  NSObject *v13;
  _OWORD v14[2];
  _QWORD v15[4];
  os_log_t v16;
  id v17;

  v7 = a5;
  v8 = a4;
  v9 = os_log_create("com.apple.passkit", "Provisioning.Add");
  v10 = (Class)getFairPlayPassbookProvisioningObjCClass[0]();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PKPassbookFairPlayEvaluator_getFairPlayInfoWithAuditToken_nonce_completion___block_invoke;
  v15[3] = &unk_1E2AC6E00;
  v16 = v9;
  v17 = v7;
  v11 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v11;
  v12 = v7;
  v13 = v9;
  -[objc_class getProvisioningInfoWithAuditToken:nonce:completionHandler:](v10, "getProvisioningInfoWithAuditToken:nonce:completionHandler:", v14, v8, v15);

}

void __78__PKPassbookFairPlayEvaluator_getFairPlayInfoWithAuditToken_nonce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void (*v10)(void);
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "length");
  v8 = *(NSObject **)(a1 + 32);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5 && v7)
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_INFO, "FairPlay: Returning modern blob", (uint8_t *)&v11, 2u);
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v9)
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_INFO, "FairPlay: Failed to get fairPlayInfo: %@", (uint8_t *)&v11, 0xCu);
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v10();

}

+ (void)_getLegacyFairPlayInfoWithAuditToken:(id *)a3 nonce:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;
  unsigned int v16;
  uint64_t v17;

  v7 = (void (**)(id, void *))a5;
  v17 = 0;
  v16 = 0;
  v8 = objc_retainAutorelease(a4);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  V0YaM92nP0Xx19HNvczPJ((uint64_t)a3, 32, v9, v10, (uint64_t)&v17, (uint64_t)&v16);
  v12 = v11;
  v13 = 0;
  v14 = v17;
  if (!v12 && v17 && v16)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D50]);
    v13 = (void *)objc_msgSend(v15, "initWithBytes:length:", v17, v16);
    v14 = v17;
  }
  if (v14)
    jEHf8Xzsv8K(v14);
  v7[2](v7, v13);

}

@end

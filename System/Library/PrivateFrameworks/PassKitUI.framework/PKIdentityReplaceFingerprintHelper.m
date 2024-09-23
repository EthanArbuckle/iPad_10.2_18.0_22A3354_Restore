@implementation PKIdentityReplaceFingerprintHelper

- (PKIdentityReplaceFingerprintHelper)initWithPass:(id)a3 isRemote:(BOOL)a4
{
  id v7;
  PKIdentityReplaceFingerprintHelper *v8;
  PKIdentityReplaceFingerprintHelper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKIdentityReplaceFingerprintHelper;
  v8 = -[PKIdentityReplaceFingerprintHelper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pass, a3);
    v9->_isRemote = a4;
    v9->_loading = 0;
  }

  return v9;
}

- (BOOL)hasCachedEligibility
{
  return self->_loading == 2;
}

- (BOOL)isEligibile
{
  return self->_canReplace;
}

- (void)isEligibleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (-[PKSecureElementPass isIdentityPass](self->_pass, "isIdentityPass")
    && (objc_msgSend(MEMORY[0x1E0D6BFD8], "currentStateForPolicy:", 0) & 4) != 0
    && !self->_loading)
  {
    self->_loading = 1;
    -[PKSecureElementPass devicePrimaryContactlessPaymentApplication](self->_pass, "devicePrimaryContactlessPaymentApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subcredentials");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D66B90]);
      objc_msgSend(v9, "addOperation:", &__block_literal_global_191);
      v10 = MEMORY[0x1E0C809B0];
      if (!self->_isRemote)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_9;
        v15[3] = &unk_1E3E67120;
        v16 = v8;
        objc_msgSend(v9, "addOperation:", v15);

      }
      objc_msgSend(v9, "addOperation:", &__block_literal_global_14_0);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_19;
      v13[3] = &unk_1E3E76280;
      v13[4] = self;
      v14 = v4;
      v12 = (id)objc_msgSend(v9, "evaluateWithInput:completion:", v11, v13);

    }
    else
    {
      self->_loading = 2;
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }

  }
  else
  {
    self->_loading = 2;
    (*((void (**)(id, BOOL))v4 + 2))(v4, self->_canReplace);
  }

}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  void (**v6)(id, id, BOOL);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  -[objc_class availableDevices](_MergedGlobals_664(), "availableDevices");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
      if (objc_msgSend(v12, "type") == 1)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v20 = 0;
    -[objc_class deviceWithDescriptor:error:](off_1ED06C530(), "deviceWithDescriptor:error:", v12, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    if (v15)
    {
      v16 = v15;
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Could not get device with error %@", buf, 0xCu);
      }
    }
    else
    {
      v19 = 0;
      objc_msgSend(v14, "identitiesWithError:", &v19);
      v17 = objc_claimAutoreleasedReturnValue();
      v16 = v19;
      if (!v16)
      {
        v13 = -[NSObject count](v17, "count");
        goto LABEL_18;
      }
      PKLogFacilityTypeGetObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Could not get identities with error %@", buf, 0xCu);
      }

    }
    v13 = 0;
LABEL_18:

    goto LABEL_19;
  }
LABEL_9:
  v13 = 0;
LABEL_19:

  v6[2](v6, v5, v13 < 2);
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D168D0]);
  v20[0] = *MEMORY[0x1E0D6A1C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithPartitions:", v9);

  v11 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2;
  v15[3] = &unk_1E3E76210;
  v16 = v10;
  v18 = v6;
  v19 = v7;
  v17 = v11;
  v12 = v6;
  v13 = v7;
  v14 = v10;
  objc_msgSend(v14, "propertiesOfCredential:completion:", v17, v15);

}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch properties of credential %@ with error %@", (uint8_t *)&v10, 0x16u);
    }

  }
  objc_msgSend(v5, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "presentmentAuthPolicy") == 2)
    objc_msgSend(v5, "hasUsablePresentmentAuthPolicy");

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D168C0]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_16;
  v11[3] = &unk_1E3E76258;
  v13 = v5;
  v14 = v6;
  v12 = v7;
  v8 = v5;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v10, "globalAuthACLWithCompletion:", v11);

}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch global ACL with error %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (v5)
    objc_msgSend(v5, "aclType");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char v5;
  void *v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = objc_msgSend(a4, "isCanceled");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_20;
  block[3] = &unk_1E3E66830;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5 ^ 1;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __63__PKIdentityReplaceFingerprintHelper_isEligibleWithCompletion___block_invoke_2_20(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = *(_BYTE *)(a1 + 48);
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)viewControllerWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D16AC8]);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke;
  v7[3] = &unk_1E3E762A8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "beginBiometricReplacement:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __67__PKIdentityReplaceFingerprintHelper_viewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v9 = 0;
        v6 = "Presenting biometric replacement flow";
        v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      v8 = 0;
      v6 = "Biometric replacement flow manager did not provide a view controller";
      v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end

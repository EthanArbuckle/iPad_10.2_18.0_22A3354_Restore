@implementation PSShowEnableKeychainSync

void __PSShowEnableKeychainSync_block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (void (*)(void))*((_QWORD *)a1[6] + 2);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getCDPStateErrorDomain();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v9))
  {
    v10 = objc_msgSend(v6, "code");

    if (v10 == -5700)
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "aa_primaryAppleAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init((Class)getCDPContextClass());
      objc_msgSend(v12, "aa_appleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAppleID:", v14);

      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v12, "aa_personID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "integerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDsid:", v17);

      v18 = (void *)objc_msgSend(objc_alloc((Class)getCDPStateControllerClass()), "initWithContext:", v13);
      v19 = (void *)objc_msgSend(objc_alloc((Class)getCDPUIControllerClass()), "initWithPresentingViewController:", a1[4]);
      objc_msgSend(v18, "setUiProvider:", v19);

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __PSShowEnableKeychainSync_block_invoke_2;
      v21[3] = &unk_1E4A66CD0;
      v22 = a1[5];
      v23 = a1[4];
      v24 = a1[6];
      objc_msgSend(v18, "repairCloudDataProtectionStateWithCompletion:", v21);

      goto LABEL_10;
    }
  }
  else
  {

  }
  v20 = a1[6];
  if (v20)
  {
    v7 = (void (*)(void))*((_QWORD *)v20 + 2);
    goto LABEL_9;
  }
LABEL_10:

}

void __PSShowEnableKeychainSync_block_invoke_2(_QWORD *a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  if (a2)
  {
    v7 = v5;
    PSShowEnableKeychainSync(a1[4], a1[5], a1[6]);
LABEL_5:
    v5 = v7;
    goto LABEL_6;
  }
  v6 = a1[6];
  if (v6)
  {
    v7 = v5;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
    goto LABEL_5;
  }
LABEL_6:

}

@end

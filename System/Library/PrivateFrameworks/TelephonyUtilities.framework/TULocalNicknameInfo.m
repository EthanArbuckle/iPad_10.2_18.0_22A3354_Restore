@implementation TULocalNicknameInfo

- (TULocalNicknameInfo)init
{
  TULocalNicknameInfo *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TULocalNicknameInfo;
  v2 = -[TULocalNicknameInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)CUTWeakLinkClass();
    if (v3)
    {
      objc_msgSend(v3, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "connectToDaemon");

    }
  }
  return v2;
}

- (NSString)shortNickname
{
  return (NSString *)-[TULocalNicknameInfo nicknameWithFormatterStyle:](self, "nicknameWithFormatterStyle:", 1);
}

- (id)appleTVNicknameForDeviceName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4
    && (-[TULocalNicknameInfo shortNickname](self, "shortNickname"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0CB3940];
    TUBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@_APPLE_TV_DEVICE_NAME_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v6, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    TUBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPLE_TV"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)nicknameWithFormatterStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  __int128 *v30;
  _QWORD v31[2];
  uint8_t buf[4];
  void *v33;
  __int128 v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (void *)CUTWeakLinkClass();
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v34 = 0;
  *((_QWORD *)&v34 + 1) = &v34;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  objc_msgSend(v6, "personalNickname");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 40);
  if (!v7)
  {
    v8 = dispatch_semaphore_create(0);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __50__TULocalNicknameInfo_nicknameWithFormatterStyle___block_invoke;
    v28[3] = &unk_1E38A16E8;
    v30 = &v34;
    v9 = v8;
    v29 = v9;
    objc_msgSend(v6, "fetchPersonalNicknameWithCompletion:", v28);
    v10 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      TUDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TULocalNicknameInfo nicknameWithFormatterStyle:].cold.2(v11);

    }
    v7 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 40);
  }
  -[TULocalNicknameInfo formattedDisplayNameForIMNickname:style:](self, "formattedDisplayNameForIMNickname:style:", v7, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v12;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "Local nickame info retrieved from SNaP: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v34, 8);
  if (!v12)
  {
LABEL_11:
    v14 = (void *)MEMORY[0x1E0C972A0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v14, "tu_contactStoreConfigurationForBundleIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      TUPreferredFaceTimeBundleIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tu_contactStoreConfigurationForBundleIdentifier:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v17);
    v31[0] = *MEMORY[0x1E0C966E8];
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v19, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v21, &v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v27;

    if (v23)
    {
      TUDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[TULocalNicknameInfo nicknameWithFormatterStyle:].cold.1((uint64_t)v23, v24);

      v12 = 0;
    }
    else
    {
      TUNameForContactWithFormatterStyle(v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    TUDefaultLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v34) = 138412290;
      *(_QWORD *)((char *)&v34 + 4) = v12;
      _os_log_impl(&dword_19A50D000, v25, OS_LOG_TYPE_DEFAULT, "Local nickame info retrieved from MeContact: %@", (uint8_t *)&v34, 0xCu);
    }

  }
  return v12;
}

void __50__TULocalNicknameInfo_nicknameWithFormatterStyle___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)formattedDisplayNameForIMNickname:(id)a3 style:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v5 = a3;
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGivenName:", v7);

    objc_msgSend(v5, "lastName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setFamilyName:", v8);
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v6, a4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)nicknameWithFormatterStyle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch meContact for local nickname info with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)nicknameWithFormatterStyle:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A50D000, log, OS_LOG_TYPE_ERROR, "Timeout occured waiting for IMCore to fetch nickname!", v1, 2u);
}

@end

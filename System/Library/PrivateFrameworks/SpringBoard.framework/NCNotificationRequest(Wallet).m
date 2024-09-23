@implementation NCNotificationRequest(Wallet)

+ (id)notificationRequestWithCardItem:()Wallet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationIdentifier:", v5);

  objc_msgSend(v3, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategoryIdentifier:", v6);

  objc_msgSend(v4, "setSectionIdentifier:", CFSTR("com.apple.springboard.pass"));
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThreadIdentifier:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimestamp:", v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = *MEMORY[0x1E0DC60C8];
  v32[0] = *MEMORY[0x1E0DC60D0];
  v32[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestDestinations:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v3, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v14);

  objc_msgSend(v3, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubtitle:", v15);

  objc_msgSend(v3, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMessage:", v16);

  v17 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(v3, "iconData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v20 = (void *)objc_msgSend(v17, "_initWithData:scale:", v18);
  objc_msgSend(v13, "setIcon:", v20);

  objc_msgSend(v3, "thumbnail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttachmentImage:", v21);

  objc_msgSend(v4, "setContent:", v13);
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setAddToLockScreenWhenUnlocked:", 1);
  objc_msgSend(v22, "setLockScreenPersistence:", 2);
  objc_msgSend(v22, "setLockScreenPriority:", 200);
  objc_msgSend(v22, "setHideClearActionInList:", 1);
  objc_msgSend(v4, "setOptions:", v22);
  objc_msgSend(MEMORY[0x1E0DC5FF0], "revealWalletPassNotificationActionForCardItem:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDefaultAction:", v23);
  v24 = (void *)objc_msgSend(v23, "copy");
  v25 = *MEMORY[0x1E0DC5F58];
  v29 = v24;
  v30 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupplementaryActions:", v27);

  return v4;
}

@end

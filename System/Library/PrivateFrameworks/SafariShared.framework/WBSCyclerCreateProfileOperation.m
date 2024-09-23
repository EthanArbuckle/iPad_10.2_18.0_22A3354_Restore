@implementation WBSCyclerCreateProfileOperation

- (void)_createRandomProfileWithContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __CFString *v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "randomItemTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLevelItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfChildren");

  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    v25 = 2048;
    v26 = v9;
    _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Creating profile with title %{public}@ at index %lu", buf, 0x16u);
  }
  objc_msgSend(v5, "testTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLevelItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__WBSCyclerCreateProfileOperation__createRandomProfileWithContext_completionHandler___block_invoke;
  v17[3] = &unk_1E4B38810;
  v18 = v5;
  v19 = v7;
  v20 = CFSTR("person");
  v21 = v6;
  v22 = v9;
  v14 = v7;
  v15 = v5;
  v16 = v6;
  objc_msgSend(v11, "createProfileWithTitle:symbolName:inListWithIdentifier:reply:", v14, CFSTR("person"), v13, v17);

}

void __85__WBSCyclerCreateProfileOperation__createRandomProfileWithContext_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v5;
  void *v6;
  WBSCyclerProfileRepresentation *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = -[WBSCyclerItemRepresentation initWithTitle:symbolImageName:uniqueIdentifier:]([WBSCyclerProfileRepresentation alloc], "initWithTitle:symbolImageName:uniqueIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9);
    objc_msgSend(v6, "insertChild:atIndex:", v7, *(_QWORD *)(a1 + 64));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v6);
  }

}

@end

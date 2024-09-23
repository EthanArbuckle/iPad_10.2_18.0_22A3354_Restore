@implementation ICQMegaBackupManager

uint64_t __115___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_quotaBackupCheckURLForAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 88);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 72);
    v19 = 0;
    +[_ICQMegaBackupEligibilityRequest eligibilityRequestWithAccount:deviceBackupUUID:deviceTotalUsedSpaceInBytes:entryMethod:deepLinkURL:requestURL:URLSession:queue:error:](_ICQMegaBackupEligibilityRequest, "eligibilityRequestWithAccount:deviceBackupUUID:deviceTotalUsedSpaceInBytes:entryMethod:deepLinkURL:requestURL:URLSession:queue:error:", v3, v4, v6, v5, v7, v2, v8, v9, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;

    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        objc_msgSend(v10, "bodyJSON");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v14;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Body JSON for _ICQMegaBackupEligibilityRequest: %{public}@", buf, 0xCu);

      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke_26;
      v17[3] = &unk_1E8B38648;
      v18 = *(id *)(a1 + 80);
      objc_msgSend(v10, "resumeWithCompletionHandler:", v17);

    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create eligibility request: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }

  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "No URL in bag for quotaBackupCheckURL", buf, 2u);
    }

    v16 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v16 + 16))(v16, 0, 0, v11);
  }

}

void __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Calling completion for request %@ with error: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "isBackupAllowed");
    objc_msgSend(v5, "needsTemporaryStorage");
    objc_msgSend(v5, "daysUntilExpiration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updateStatusURLForAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    v15 = 0;
    +[_ICQMegaBackupUpdateStatusRequest updateStatusRequestWithAccount:deviceBackupUUID:status:requestURL:URLSession:queue:error:](_ICQMegaBackupUpdateStatusRequest, "updateStatusRequestWithAccount:deviceBackupUUID:status:requestURL:URLSession:queue:error:", v3, v4, v5, v2, v6, v7, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (v8)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke_32;
      v13[3] = &unk_1E8B38698;
      v14 = *(id *)(a1 + 64);
      objc_msgSend(v8, "resumeWithCompletionHandler:", v13);

    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v9;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create update status request: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "No URL in bag for updateMegaBackupStatusURL", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v11 + 16))(v11, 0, 0, v9);
  }

}

void __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Calling completion for request %{public}@ with error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Received new expiration date %{public}@", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_extendExpirationURLForAccount:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 64);
    v16 = 0;
    +[_ICQMegaBackupExtendExpirationRequest extendExpirationRequestWithAccount:deviceBackupUUID:requestedExpirationDate:requestURL:URLSession:queue:error:](_ICQMegaBackupExtendExpirationRequest, "extendExpirationRequestWithAccount:deviceBackupUUID:requestedExpirationDate:requestURL:URLSession:queue:error:", v3, v4, v5, v2, v6, v7, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v8)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke_35;
      v13[3] = &unk_1E8B386E8;
      v15 = *(id *)(a1 + 72);
      v14 = v8;
      objc_msgSend(v14, "resumeWithCompletionHandler:", v13);

    }
    else
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v9;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create extend expiration date request: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
  else
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "No URL in bag for extendExpirationDateURL", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v11 + 16))(v11, 0, 0, v9);
  }

}

void __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Calling completion for request %@ with error: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = objc_msgSend(v5, "isExtensionAllowed");
    objc_msgSend(*(id *)(a1 + 32), "updatedExpirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1CDEBD000, v10, OS_LOG_TYPE_DEFAULT, "Server says extended expiration date is allowed (%{public}@) and updated expiration date is %{public}@", (uint8_t *)&v12, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end

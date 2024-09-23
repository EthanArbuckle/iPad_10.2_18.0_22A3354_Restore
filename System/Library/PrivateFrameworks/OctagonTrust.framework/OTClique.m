@implementation OTClique

void __47__OTClique_Framework__removeRecoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      v5 = "octagon-remove-recovery-key: removeRecoveryKey failed: %@";
      v6 = v4;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
    }
  }
  else
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v5 = "removeRecoveryKey succeeded";
      v6 = v4;
      v7 = 2;
      goto LABEL_6;
    }
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __62__OTClique_Framework__tlkRecoverabilityForEscrowRecord_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v17 = 138412290;
      v18 = v6;
      v9 = "tlkRecoverabilityForEscrowRecordData errored: %@";
      v10 = v7;
      v11 = 12;
LABEL_6:
      _os_log_impl(&dword_19A7FA000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
    }
  }
  else if (v8)
  {
    LOWORD(v17) = 0;
    v9 = "tlkRecoverabilityForEscrowRecordData succeeded";
    v10 = v7;
    v11 = 2;
    goto LABEL_6;
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;
  v14 = v5;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v6;

}

void __63__OTClique_Framework__waitForPriorityViewKeychainDataRecovery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "waitForPriorityViewKeychainDataRecovery errored: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    v6 = "waitForPriorityViewKeychainDataRecovery succeeded";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

void __44__OTClique_Framework__fetchAccountSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "fetchAccountSettings errored: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "fetchAccountSettings succeeded", (uint8_t *)&v13, 2u);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = v5;
    v7 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __47__OTClique_Framework__setAccountSetting_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "setAccountSetting errored: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    v6 = "setAccountSetting succeeded";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

void __59__OTClique_Framework__fetchTrustedSecureElementIdentities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "fetchTrustedSecureElementIdentities errored: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "fetchTrustedSecureElementIdentities succeeded", (uint8_t *)&v13, 2u);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = v5;
    v7 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

void __68__OTClique_Framework__removeLocalSecureElementIdentityPeerID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "removeLocalSecureElementIdentityPeerID errored: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    v6 = "removeLocalSecureElementIdentityPeerID succeeded";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

void __59__OTClique_Framework__setLocalSecureElementIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "setLocalSecureElementIdentity errored: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    v6 = "setLocalSecureElementIdentity succeeded";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

void __55__OTClique_Framework__areRecoveryKeysDistrusted_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "areRecoveryKeysDistrusted errored: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (v8)
    {
      v9 = CFSTR("NO");
      if (a2)
        v9 = CFSTR("YES");
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "areRecoveryKeysDistrusted succeeded, octagon circle contains distrusted recovery keys: %@", (uint8_t *)&v10, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __47__OTClique_Framework__totalTrustedPeers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "totalTrustedPeers errored: %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = a1 + 32;
    v10 = v6;
  }
  else
  {
    if (v8)
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "totalTrustedPeers succeeded, total count: %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = a1 + 40;
    v10 = v5;
  }
  v11 = *(_QWORD *)(*(_QWORD *)v9 + 8);
  v12 = v10;
  v13 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v12;

}

void __81__OTClique_Framework__preflightRecoverOctagonUsingRecoveryKey_recoveryKey_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  const __CFString *v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Preflight recovery key errored: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    if (v7)
    {
      v8 = CFSTR("incorrect");
      if (a2)
        v8 = CFSTR("correct");
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, "Recovery key is %@", (uint8_t *)&v11, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "reset and establish returned an error: %@", buf, 0xCu);
    }

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = v3;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "successfully reset octagon, attempting enrolling recovery key", buf, 2u);
    }

    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C78]), "initWithConfiguration:", *(_QWORD *)(a1 + 40));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_88;
    v12[3] = &unk_1E39191D0;
    v11 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v9, "createRecoveryKey:recoveryKey:reply:", v10, v11, v12);

    v8 = v13;
  }

}

void __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: joining with recovery key failed: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v3;
    v7 = *(NSObject **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }
  else
  {
    secLogObjForScope();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "joining with recovery key succeeded", (uint8_t *)&v8, 2u);
    }
  }

}

void __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  _BYTE v15[18];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v15 = v3;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk, failed to enroll new recovery key: %@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = v3;
    v7 = *(NSObject **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
LABEL_5:

    goto LABEL_6;
  }
  secLogObjForScope();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A7FA000, v8, OS_LOG_TYPE_DEFAULT, "successfully enrolled recovery key", buf, 2u);
  }

  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "overrideForJoinAfterRestore") & 1) != 0)
    {
      secLogObjForScope();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A7FA000, v9, OS_LOG_TYPE_DEFAULT, "skipping SOSCCRequestToJoinCircleAfterRestore attempt for tests", buf, 2u);
      }

      v10 = CFSTR("success");
    }
    else
    {
      v11 = SOSCCRequestToJoinCircleAfterRestore();
      secLogObjForScope();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v15 = v11;
        *(_WORD *)&v15[4] = 2112;
        *(_QWORD *)&v15[6] = 0;
        _os_log_impl(&dword_19A7FA000, v12, OS_LOG_TYPE_DEFAULT, "Join circle after restore: %d, error: %@", buf, 0x12u);
      }

      if (v11)
        v10 = CFSTR("success");
      else
        v10 = CFSTR("failure");
    }
    secLogObjForScope();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v15 = v10;
      *(_WORD *)&v15[8] = 2112;
      *(_QWORD *)&v15[10] = v13;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "joinAfterRestore complete: %@, error: %@", buf, 0x16u);
    }
    goto LABEL_5;
  }
LABEL_6:

}

void __83__OTClique_Framework__doesRecoveryKeyExistInOctagonAndIsCorrect_recoveryKey_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "Preflight recovery key errored: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (v8)
    {
      v9 = CFSTR("incorrect");
      if (a2)
        v9 = CFSTR("correct");
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "Recovery key is %@", (uint8_t *)&v10, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __55__OTClique_Framework__isRecoveryKeySetInOctagon_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    secLogObjForScope();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "octagon-is-recovery-key-set-in-octagon: isRecoveryKeySet failed: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    secLogObjForScope();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109120;
      LODWORD(v10) = a2;
      _os_log_impl(&dword_19A7FA000, v8, OS_LOG_TYPE_DEFAULT, "isRecoveryKeySet: %{BOOL}d", (uint8_t *)&v9, 8u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __67__OTClique_Framework__setRecoveryKeyWithContext_recoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "octagon-set-recovery-key, failed to set octagon recovery key error: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v3;
    v7 = *(NSObject **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }
  else
  {
    secLogObjForScope();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "successfully set octagon recovery key", (uint8_t *)&v8, 2u);
    }
  }

}

void __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, failed to create octagon recovery key error: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v3;
    v7 = *(NSObject **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }
  else
  {
    secLogObjForScope();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, "successfully set octagon recovery key", (uint8_t *)&v8, 2u);
    }
  }

}

void __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      v5 = "octagon-register-recovery-key, failed to remove recovery key from octagon error: %@";
      v6 = v4;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19A7FA000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
    }
  }
  else
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v5 = "successfully removed octagon recovery key";
      v6 = v4;
      v7 = 2;
      goto LABEL_6;
    }
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __101__OTClique_Framework___fetchAccountWideSettingsDefaultWithForceFetch_useDefault_configuration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  OTAccountSettings *v10;
  OTWalrus *v11;
  void *v12;
  OTWebAccess *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    if (*(_BYTE *)(a1 + 48)
      && objc_msgSend(v6, "code") == 53
      && (objc_msgSend(v7, "domain"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD5CA0]),
          v8,
          v9))
    {
      v10 = objc_alloc_init(OTAccountSettings);
      v11 = objc_alloc_init(OTWalrus);
      -[OTAccountSettings setWalrus:](v10, "setWalrus:", v11);

      -[OTAccountSettings walrus](v10, "walrus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnabled:", 0);

      v13 = objc_alloc_init(OTWebAccess);
      -[OTAccountSettings setWebAccess:](v10, "setWebAccess:", v13);

      -[OTAccountSettings webAccess](v10, "webAccess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnabled:", 1);

      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v10;

      secLogObjForScope();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_19A7FA000, v17, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings succeeded (returning default)", (uint8_t *)&v23, 2u);
      }
      v7 = 0;
    }
    else
    {
      secLogObjForScope();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = v7;
        _os_log_impl(&dword_19A7FA000, v17, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings errored: %@", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  else
  {
    secLogObjForScope();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_19A7FA000, v18, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings succeeded", (uint8_t *)&v23, 2u);
    }

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = v5;
    v7 = 0;
    v17 = *(NSObject **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v20;
  }

  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v7;

}

void __51__OTClique_Framework__invalidateEscrowCache_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache errored: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19A7FA000, v4, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache succeeded", (uint8_t *)&v8, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __112__OTClique_Framework__handleRecoveryResults_recoveredInformation_record_performedSilentBurn_recoverError_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5)
      goto LABEL_7;
    v20 = 138412290;
    v21 = v3;
    v6 = "restore bottle errored: %@";
    v7 = v4;
    v8 = 12;
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    LOWORD(v20) = 0;
    v6 = "restoring bottle succeeded";
    v7 = v4;
    v8 = 2;
  }
  _os_log_impl(&dword_19A7FA000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v20, v8);
LABEL_7:

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

  v11 = *(unsigned __int8 *)(a1 + 56);
  v12 = (double)(unint64_t)_OctagonSignpostGetNanoseconds() / 1000000000.0;
  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v20 = 67240192;
      LODWORD(v21) = 1;
      _os_signpost_emit_with_name_impl(&dword_19A7FA000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PerformOctagonJoinForSilent", " OctagonSignpostNamePerformOctagonJoinForSilent=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForSilent}d ", (uint8_t *)&v20, 8u);
    }

    _OctagonSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 40);
      v20 = 134218496;
      v21 = v17;
      v22 = 2048;
      v23 = v12;
      v24 = 1026;
      v25 = 1;
      v18 = "END [%lld] %fs: PerformOctagonJoinForSilent  OctagonSignpostNamePerformOctagonJoinForSilent=%{public,signpos"
            "t.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForSilent}d ";
LABEL_18:
      _os_log_impl(&dword_19A7FA000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0x1Cu);
    }
  }
  else
  {
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v20 = 67240192;
      LODWORD(v21) = 1;
      _os_signpost_emit_with_name_impl(&dword_19A7FA000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PerformOctagonJoinForNonSilent", " OctagonSignpostNamePerformOctagonJoinForNonSilent=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForNonSilent}d ", (uint8_t *)&v20, 8u);
    }

    _OctagonSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(void **)(a1 + 40);
      v20 = 134218496;
      v21 = v19;
      v22 = 2048;
      v23 = v12;
      v24 = 1026;
      v25 = 1;
      v18 = "END [%lld] %fs: PerformOctagonJoinForNonSilent  OctagonSignpostNamePerformOctagonJoinForNonSilent=%{public,s"
            "ignpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForNonSilent}d ";
      goto LABEL_18;
    }
  }

}

@end

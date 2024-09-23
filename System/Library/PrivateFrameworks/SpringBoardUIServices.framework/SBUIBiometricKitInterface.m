@implementation SBUIBiometricKitInterface

void __34___SBUIBiometricKitInterface_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    *((_QWORD *)WeakRetained + 2) = state64;
    objc_msgSend(*((id *)WeakRetained + 7), "biometricKitInterface:enrolledIdentitiesDidChange:", WeakRetained, objc_msgSend(WeakRetained, "hasEnrolledIdentities"));
  }

}

uint64_t __59___SBUIBiometricKitInterface_operation_finishedWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogBiometricResource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48) - 1;
    if (v4 > 3)
      v5 = CFSTR("BKOperationEndReasonFailed");
    else
      v5 = off_1E4C3EA08[v4];
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_INFO, "operation:%@ finishedWithReason:%@", (uint8_t *)&v7, 0x16u);
  }

  _SBUIEffectiveBiometricClassFromString(CFSTR("BKMatchPearlOperation"));
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0 && *(_QWORD *)(a1 + 48) == 3)
    return objc_msgSend(*(id *)(a1 + 40), "_sendDelegateEvent:", 15);
  return result;
}

void __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BYTE v14[12];
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "_trackerForOperation:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(v2 + 8);
  SBLogBiometricResource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(id *)v2;
    if ((unint64_t)(v4 - 1) > 4)
      v7 = CFSTR("BKOperationStateFinished");
    else
      v7 = off_1E4C3EA28[v4 - 1];
    *(_DWORD *)v14 = 138412546;
    *(_QWORD *)&v14[4] = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_INFO, "operation:%@ stateChanged:%@", v14, 0x16u);
  }

  switch(v4)
  {
    case 1:
    case 3:
      goto LABEL_7;
    case 2:
      objc_msgSend(v3, "setState:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEvent:", 12);
      break;
    case 5:
      _SBUIEffectiveBiometricClassFromString(CFSTR("BKMatchPearlOperation"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v3, "state") == 1)
        {
          *(_QWORD *)v14 = 1;
          objc_msgSend(*(id *)v2, "device");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "bioLockoutState:forUser:error:", v14, getuid(), 0);
          v10 = *(_QWORD *)v14;

          v11 = 15;
          if (v9 && v10 != 1)
            v11 = objc_msgSend(*(id *)(a1 + 32), "_eventForLockoutState:", *(_QWORD *)v14);
          SBLogBiometricResource();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_1((uint64_t *)v2, v11, v12);

          objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEvent:", v11);
        }
        else
        {
          SBLogBiometricResource();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_2((uint64_t *)v2, v3, v13);

        }
      }
LABEL_7:
      objc_msgSend(v3, "setState:", 0);
      break;
    default:
      break;
  }

}

void __62___SBUIBiometricKitInterface_matchOperation_failedWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogBiometricResource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48) - 2;
    if (v4 > 9)
      v5 = CFSTR("BKMatchFailReasonUnspecified");
    else
      v5 = off_1E4C3EA50[v4];
    v9 = 138412546;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_INFO, "operation:%@ finishedWithReason:%@", (uint8_t *)&v9, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 48);
  if (v6 != 2)
  {
    v7 = 27;
    if (v6 == 5)
      v7 = 26;
    if (v6 == 4)
      v8 = 25;
    else
      v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "_sendDelegateEvent:", v8);
  }
}

uint64_t __61___SBUIBiometricKitInterface_operation_presenceStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (*(_BYTE *)(a1 + 48))
  {
    if (v4 == 2)
    {
      v4 = 13;
      return objc_msgSend(*(id *)(a1 + 40), "_sendDelegateEvent:", v4);
    }
    if (v4 == 1)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 28) = 1;
      v9 = 1;
      _SBUIEffectiveBiometricClassFromString(CFSTR("BKMatchOperation"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 40), "_sendDelegateEvent:", v4);
      objc_msgSend(*(id *)(a1 + 32), "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "bioLockoutState:forUser:error:", &v9, getuid(), 0) & 1) != 0)
      {
        v6 = v9;

        if (v6 != 1)
        {
          v4 = objc_msgSend(*(id *)(a1 + 40), "_eventForLockoutState:", v9);
          return objc_msgSend(*(id *)(a1 + 40), "_sendDelegateEvent:", v4);
        }
      }
      else
      {

      }
    }
    v4 = 1;
    return objc_msgSend(*(id *)(a1 + 40), "_sendDelegateEvent:", v4);
  }
  if (v4 == 2)
  {
    v7 = 14;
  }
  else
  {
    v7 = 0;
    if (v4 == 1)
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 28) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_sendDelegateEvent:", v7);
}

void __63___SBUIBiometricKitInterface_matchOperation_matchedWithResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_trackerForOperation:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v8, "setState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEvent:", 3);
  }
  else
  {
    objc_msgSend(v8, "setState:", 3);
    objc_msgSend(*(id *)(a1 + 48), "identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_msgSend(*(id *)(a1 + 48), "lockoutState");
      objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEvent:", objc_msgSend(*(id *)(a1 + 32), "_eventForLockoutState:", v4));
      v5 = (v4 & 0xFFFFFFFFFFFFFFFDLL) == 4 ? 11 : 10;
      objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEvent:", v5);
      _SBUIEffectiveBiometricClassFromString(CFSTR("BKMatchPearlResultInfo"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = *(id *)(a1 + 48);
        v7 = objc_msgSend(v6, "feedback");
        if (v7 >= 1)
          objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEventForFeedback:", v7);
        if (objc_msgSend(v6, "periocularMatchState") == 8)
          objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEvent:", 32);

      }
    }
  }

}

uint64_t __62___SBUIBiometricKitInterface_matchOperation_providedFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEventForFeedback:", *(_QWORD *)(a1 + 40));
}

uint64_t __71___SBUIBiometricKitInterface_matchOperation_providedFaceOcclusionInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEventForFaceOcclusionInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __79___SBUIBiometricKitInterface_matchOperation_providedFaceWUPoseEligibilityInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateEventForFaceWUPoseEligibilityInfo:", *(_QWORD *)(a1 + 40));
}

void __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412802;
  v5 = v3;
  v6 = 2112;
  v7 = CFSTR("BKOperationStateOnHold");
  v8 = 2048;
  v9 = a2;
  OUTLINED_FUNCTION_0(&dword_1A471F000, a3, (uint64_t)a3, "operation:%@ stateChanged:%@ sending event %lu because operation was running", (uint8_t *)&v4);
}

void __53___SBUIBiometricKitInterface_operation_stateChanged___block_invoke_cold_2(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = CFSTR("BKOperationStateOnHold");
  v10 = 2048;
  v11 = objc_msgSend(a2, "state");
  OUTLINED_FUNCTION_0(&dword_1A471F000, a3, v5, "operation:%@ stateChanged:%@ not sending event because operation was in state %ld", (uint8_t *)&v6);
}

@end

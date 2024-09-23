@implementation RBSLegacyAttribute

- (uint64_t)_isTargetValidForContext:(const __CFString *)a3 errorReason:
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (objc_msgSend(v5, "targetIsSystem"))
    {
      a1 = 0;
      v7 = CFSTR("Attribute may not target the system");
LABEL_4:
      *a3 = v7;
      goto LABEL_20;
    }
    v8 = objc_msgSend((id)a1, "reason");
    if (v8 > 12)
    {
      if (v8 == 10006)
      {
        if ((objc_msgSend(v6, "ignoreRestrictions") & 1) == 0)
        {
          objc_msgSend(v6, "targetProperties");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "supportsBackgroundContentFetching");

          if ((v17 & 1) == 0)
          {
            a1 = 0;
            v7 = CFSTR("Target doesn't support background content fetching");
            goto LABEL_4;
          }
        }
      }
      else if (v8 == 13)
      {
        objc_msgSend(v6, "targetIdentity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isXPCService");

        if ((v12 & 1) == 0)
        {
          a1 = 0;
          v7 = CFSTR("Target is not an xpc service");
          goto LABEL_4;
        }
      }
    }
    else if (v8 == 9)
    {
      objc_msgSend(v6, "targetProcess");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entitlementManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entitlementsForProcess:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "hasEntitlement:", CFSTR("com.apple.UIKit.vends-view-services")) & 1) == 0)
      {
        *a3 = CFSTR("Target lacks view service entitlement");

        a1 = 0;
        goto LABEL_20;
      }

    }
    else if (v8 == 12 && (objc_msgSend(v6, "ignoreRestrictions") & 1) == 0)
    {
      objc_msgSend(v6, "targetProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "usesSocketMonitoring");

      if ((v10 & 1) == 0)
      {
        a1 = 0;
        v7 = CFSTR("Target doesn't support socket monitoring");
        goto LABEL_4;
      }
    }
    *a3 = 0;
    a1 = 1;
  }
LABEL_20:

  return a1;
}

- (uint64_t)_role
{
  if (a1)
  {
    if (objc_msgSend(a1, "requestedReason") == 9)
    {
      return 5;
    }
    else if ((objc_msgSend(a1, "flags") & 2) != 0)
    {
      return 4;
    }
    else if ((objc_msgSend(a1, "flags") & 1) != 0)
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_startPolicy
{
  unint64_t v1;
  char v2;
  unint64_t v3;

  if (result)
  {
    v1 = objc_msgSend((id)result, "reason");
    result = 1;
    if (v1 <= 0x17)
    {
      if (((1 << v1) & 0xBC33AE) != 0)
        return result;
      if (((1 << v1) & 0x10011) != 0)
        return 102;
      if (v1 == 10)
        return 103;
    }
    v2 = v1 - 16;
    if (v1 - 10000 > 8)
    {
LABEL_11:
      v3 = v1 - 50000;
      if (v3 > 4 || ((1 << v3) & 0x19) == 0)
        return 101;
      return 102;
    }
    if (((1 << v2) & 0x135) == 0)
    {
      if (((1 << v2) & 0xC0) != 0)
        return 103;
      goto LABEL_11;
    }
  }
  return result;
}

- (void)_mutateReasonWithContext:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1, "reason");
    if (v4 == 4)
    {
      objc_msgSend(v3, "initialProcessState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "legacyFinishTaskReason");
      if (v6 > 49999)
      {
        if (v6 == 50004)
          v7 = 50004;
        else
          v7 = 4;
        if (v6 == 50003)
          v8 = 50003;
        else
          v8 = v7;
        if (v6 == 50000)
          v4 = 50000;
        else
          v4 = v8;
      }
      else
      {
        switch(v6)
        {
          case 16:
            v4 = 50004;
            break;
          case 10006:
            v4 = 50000;
            break;
          case 10007:
            v4 = 50003;
            break;
        }
      }

    }
    if (v4 != objc_msgSend(a1, "reason"))
    {
      rbs_assertion_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(a1, "reason");
        objc_msgSend(v3, "assertion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 134349570;
        v13 = v10;
        v14 = 2050;
        v15 = v4;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_DEFAULT, "Mutating assertion reason from %{public}lu to %{public}lu for assertion %{public}@", (uint8_t *)&v12, 0x20u);

      }
      objc_msgSend(a1, "setReason:", v4);
    }
  }

}

- (double)_invalidationDurationExpiringTaskCompletionsQuickly:(void *)a1
{
  double result;
  uint64_t v4;
  uint64_t v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  uint64_t v10;

  result = 0.0;
  if (!a1)
    return result;
  v4 = objc_msgSend(a1, "reason", 0.0);
  result = 1.0;
  if (v4 <= 9999)
  {
    switch(v4)
    {
      case 1:
      case 2:
      case 3:
      case 5:
      case 7:
      case 8:
      case 9:
      case 12:
      case 13:
      case 18:
      case 19:
      case 20:
      case 21:
      case 23:
        return 0.0;
      case 4:
        result = 30.0;
        if (a2)
          result = 10.0;
        break;
      case 10:
        result = 10.0;
        break;
      case 16:
        result = 15.0;
        break;
      default:
        return result;
    }
    return result;
  }
  if (v4 > 49999)
  {
    if (v4 != 50000)
    {
      v6 = 40.0;
      if (v4 == 50004)
        result = 25.0;
      v7 = v4 == 50003;
      goto LABEL_18;
    }
    if (_backgroundContentFetchingProcessAssertionDuration_onceToken != -1)
      dispatch_once(&_backgroundContentFetchingProcessAssertionDuration_onceToken, &__block_literal_global_62);
    v8 = *(double *)&_backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
    v9 = 10.0;
    if ((a2 & 1) == 0)
    {
      if (_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_onceToken != -1)
      {
        v10 = _backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
        dispatch_once(&_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_onceToken, &__block_literal_global_65);
        v8 = *(double *)&v10;
      }
      v9 = *(double *)&_backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion;
    }
    return v8 + v9;
  }
  else
  {
    v5 = v4 - 10000;
    if ((unint64_t)(v4 - 10000) > 8)
      return result;
    if (((1 << v5) & 0x135) != 0)
      return 0.0;
    if (v4 != 10006)
    {
      v7 = v5 == 7;
      v6 = 30.0;
LABEL_18:
      if (v7)
        return v6;
      return result;
    }
    if (_backgroundContentFetchingProcessAssertionDuration_onceToken != -1)
      dispatch_once(&_backgroundContentFetchingProcessAssertionDuration_onceToken, &__block_literal_global_62);
    return *(double *)&_backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration;
  }
}

- (uint64_t)_invalidateOnThermalLevel
{
  uint64_t v1;
  unint64_t v2;

  if (result)
  {
    v1 = objc_msgSend((id)result, "reason");
    result = 820;
    switch(v1)
    {
      case 1:
      case 2:
      case 3:
      case 12:
      case 16:
      case 19:
      case 23:
LABEL_5:
        result = 840;
        break;
      case 4:
LABEL_10:
        result = 860;
        break;
      case 5:
      case 9:
      case 13:
LABEL_6:
        result = 850;
        break;
      case 6:
      case 10:
      case 11:
      case 14:
      case 15:
      case 17:
      case 22:
        return result;
      case 7:
      case 8:
      case 18:
      case 20:
      case 21:
LABEL_3:
        result = 830;
        break;
      default:
        switch(v1)
        {
          case 10000:
          case 10007:
            goto LABEL_5;
          case 10001:
          case 10002:
          case 10003:
          case 10006:
            return result;
          case 10004:
            goto LABEL_10;
          case 10005:
            goto LABEL_3;
          case 10008:
            goto LABEL_6;
          default:
            v2 = v1 - 50000;
            if (v2 <= 4 && ((1 << v2) & 0x19) != 0)
              goto LABEL_10;
            break;
        }
        break;
    }
  }
  return result;
}

- (uint64_t)_definesRelativeStartTime
{
  unint64_t v1;
  unint64_t v2;

  if (result)
  {
    v1 = objc_msgSend((id)result, "reason");
    result = 1;
    if (v1 > 0x17 || ((1 << v1) & 0xBC33AE) == 0)
    {
      v2 = v1 - 10000;
      if (v2 > 8 || ((1 << v2) & 0x135) == 0)
        return 0;
    }
  }
  return result;
}

- (uint64_t)_terminationResistance
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = objc_msgSend((id)result, "reason");
    v2 = v1;
    if (v1 <= 0x17 && ((1 << v1) & 0xA9132E) != 0)
      return 40;
    result = 20;
    v3 = v2 - 10000;
    if (v3 <= 8 && ((1 << v3) & 0x181) != 0)
      return 40;
  }
  return result;
}

- (uint64_t)_maxCPUDuration
{
  uint64_t v1;

  if (result)
  {
    v1 = objc_msgSend((id)result, "reason");
    switch(v1)
    {
      case 19:
      case 21:
      case 22:
        goto LABEL_6;
      case 20:
      case 23:
        result = 15;
        break;
      default:
        if (v1 == 4)
          result = 180;
        else
LABEL_6:
          result = 60;
        break;
    }
  }
  return result;
}

- (BOOL)_isLegacyReasonFinishableTask:(_BOOL8)result
{
  if (result)
  {
    result = 1;
    if ((unint64_t)(a2 - 50000) > 4 || ((1 << (a2 - 80)) & 0x19) == 0)
      return (unint64_t)(a2 - 10006) < 2 || a2 == 16;
  }
  return result;
}

- (uint64_t)_explicitJetsamBand:(void *)a1
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(a1, "flags");
    v5 = objc_msgSend(a1, "reason");
    if (v5 == 3 && (v4 & 8) != 0)
    {
      v6 = 120;
    }
    else if ((v4 & 8) != 0)
    {
      if (v5 != 9)
        goto LABEL_21;
      objc_msgSend(v3, "targetProcess");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_21;
      v10 = (void *)v9;
      objc_msgSend(v3, "assertion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "explanation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.viewservice.session"));

      if (v13)
      {
        objc_msgSend(v3, "entitlementManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "targetProcess");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "entitlementsForProcess:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.UIKit.vends-view-services")))
          v6 = 80;
        else
          v6 = 0;

      }
      else
      {
LABEL_21:
        v6 = 100;
      }
    }
    else
    {
      v7 = v5 == 10006 || v5 == 50000;
      v8 = 20;
      if (!v7)
        v8 = 0;
      if ((v4 & 1) != 0)
        v6 = 40;
      else
        v6 = v8;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_isOriginatorValidForContext:(const __CFString *)a3 errorReason:
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  const __CFString *v29;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!a1)
    goto LABEL_40;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__isOriginatorValidForContext_errorReason_, a1, CFSTR("RBSLegacyAttribute+RBProcessState.m"), 383, CFSTR("outReason is required"));

  }
  v6 = objc_msgSend(a1, "requestedReason");
  if (v6 > 0x17)
    goto LABEL_25;
  if (((1 << v6) & 0xBD15AE) != 0)
  {
LABEL_27:
    objc_msgSend(v5, "originatorEntitlements");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;
    goto LABEL_28;
  }
  if (((1 << v6) & 0x2200) != 0)
  {
    objc_msgSend(v5, "originatorProcess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v8)
    {
      if (objc_msgSend(a1, "reason") == 9 && objc_msgSend(v7, "isLifecycleManaged"))
      {
        objc_msgSend(v5, "originatorState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "inheritances");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allNamespaces");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *MEMORY[0x24BE80EA0]);

        objc_msgSend(v5, "originatorEntitlements");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.assertiond.background-view-services"));

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v9, "legacyAssertions", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v36;
          while (2)
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(v15);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v19), "isLegacyAssertionReason:", 9))
              {

                goto LABEL_46;
              }
              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v17)
              continue;
            break;
          }
        }

        if (((v12 | v14) & 1) == 0)
        {
          *a3 = CFSTR("Originator for view service request is not in a valid state");

LABEL_39:
LABEL_40:
          v26 = 0;
          goto LABEL_41;
        }
LABEL_46:

      }
      goto LABEL_29;
    }
    v29 = CFSTR("Originator and target must be different processes");
LABEL_38:
    *a3 = v29;
    goto LABEL_39;
  }
  if (v6 != 4)
  {
LABEL_25:
    v24 = v6 - 16;
    if (v6 - 10000 <= 8)
    {
      if (((1 << v24) & 0x194) != 0)
        goto LABEL_27;
      if (((1 << v24) & 0x21) != 0)
      {
        objc_msgSend(v5, "originatorEntitlements");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.backboard.client")) & 1) != 0)
          goto LABEL_29;
        v25 = v7;
LABEL_28:
        if ((objc_msgSend(v25, "hasEntitlementDomain:", 32) & 1) != 0)
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_37:
        v29 = CFSTR("Client is missing required entitlement");
        goto LABEL_38;
      }
      if (v6 == 10006)
      {
        objc_msgSend(v5, "originatorEntitlements");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "hasEntitlementDomain:", 32) & 1) != 0)
          goto LABEL_29;
        objc_msgSend(v5, "originatorProcess");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isPlatformBinary");

        if ((v28 & 1) != 0)
          goto LABEL_29;
        goto LABEL_37;
      }
    }
    v26 = 0;
    *a3 = CFSTR("Invalid assertion reason provided");
    goto LABEL_41;
  }
  objc_msgSend(v5, "originatorProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetProcess");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v20)
  {

    goto LABEL_29;
  }
  v21 = (void *)v20;
  objc_msgSend(v5, "originatorEntitlements");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isPlatformBinary") & 1) != 0 || (objc_msgSend(v22, "hasEntitlementDomain:", 63) & 1) != 0)
  {
    v23 = 4;
  }
  else
  {
    objc_msgSend(v5, "entitlementManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "entitlementsForProcess:", v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v21, "isPlatformBinary") & 1) != 0
      || objc_msgSend(v32, "hasEntitlementDomain:", 63))
    {
      rbs_assertion_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v7;
        v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_21A8B4000, v33, OS_LOG_TYPE_DEFAULT, "allowing legacy background task: untrusted process %{public}@ is targeting trusted process %{public}@", buf, 0x16u);
      }

      v23 = 4;
    }
    else
    {
      *a3 = CFSTR("Originator and target must be the same process");
      v23 = 1;
    }

  }
  if (v23 != 4)
    goto LABEL_40;
LABEL_30:
  *a3 = 0;
  v26 = 1;
LABEL_41:

  return v26;
}

uint64_t __93__RBSLegacyAttribute_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("BKExpireTaskCompletionsQuickly"), CFSTR("com.apple.assertiond"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 1;
  else
    v1 = 0;
  v2 = v1;
  applyToAssertionIntransientState_attributePath_context__expireTaskCompletionsQuickly = v2;
  return result;
}

@end

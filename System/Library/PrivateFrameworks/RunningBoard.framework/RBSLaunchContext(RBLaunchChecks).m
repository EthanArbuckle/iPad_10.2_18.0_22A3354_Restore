@implementation RBSLaunchContext(RBLaunchChecks)

- (uint64_t)_passesRegulatoryChecksWithError:()RBLaunchChecks
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  void *v12;
  id v13;

  if (objc_msgSend(a1, "_requiresPreflightCheck"))
  {
    if (a3)
    {
      v5 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", CFSTR("Launch prevented due to user approval regulatory requirements"), *MEMORY[0x24BDD0FD8]);
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = v5;
      v9 = 8;
LABEL_8:
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v12;
      result = 0;
      *a3 = v13;
      return result;
    }
  }
  else
  {
    if ((objc_msgSend(a1, "_passesEligibilityCheck") & 1) != 0)
      return 1;
    if (a3)
    {
      v11 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", CFSTR("Launch prevented due to device eligibility requirements"), *MEMORY[0x24BDD0FD8]);
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = v11;
      v9 = 9;
      goto LABEL_8;
    }
  }
  return 0;
}

- (uint64_t)_passesEligibilityCheck
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;

  if (!objc_msgSend(a1, "_needsEligibilityCheck"))
    return 1;
  objc_msgSend(a1, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isApplication"))
  {
    objc_msgSend(a1, "_applicationRecordForLaunchCheck");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = objc_msgSend(a1, "_recordPassesEligibilityChecks:", v3);
    }
    else
    {
      rbs_process_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[RBSLaunchContext(RBLaunchChecks) _passesEligibilityCheck].cold.1();

      v4 = 1;
    }

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (uint64_t)_requiresPreflightCheck
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  NSObject *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_sharedPreflightManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "identity");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "appID");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!(v4 | v3))
    {
      rbs_process_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck].cold.4();
      goto LABEL_40;
    }
    v5 = v4;
    if ((objc_msgSend((id)v3, "isApplication") & 1) != 0)
    {
      if (v5)
      {
LABEL_5:
        v6 = objc_msgSend(v2, "requiresPreflightForApplication:", v5);
        rbs_process_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = CFSTR("ALLOWED");
          if ((_DWORD)v6)
            v8 = CFSTR("DISALLOWED");
          *(_DWORD *)buf = 138543618;
          v33 = a1;
          v34 = 2114;
          v35 = v8;
          _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "preflightManager for %{public}@ -> %{public}@", buf, 0x16u);
        }

        goto LABEL_41;
      }
      objc_msgSend(a1, "bundleIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if (!objc_msgSend((id)v3, "isExtension")
          || (objc_msgSend((id)v3, "xpcServiceIdentifier"), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          rbs_process_log();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck].cold.1();
          goto LABEL_40;
        }
      }
      v31 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, &v31);
      v5 = v31;
      if (v10)
      {
        v23 = v10;
        v24 = v9;
        v26 = (void *)v3;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v10, "identities");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
LABEL_19:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
            objc_msgSend(v15, "personaUniqueString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "personaString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToString:", v17);

            if ((v18 & 1) != 0)
              break;
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
              if (v12)
                goto LABEL_19;
              goto LABEL_25;
            }
          }
          v19 = v15;

          v10 = v23;
          if (v19)
            goto LABEL_32;
        }
        else
        {
LABEL_25:

          v10 = v23;
        }
        objc_msgSend(v10, "identities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v19 = objc_claimAutoreleasedReturnValue();

        if (v19)
        {
LABEL_32:

          v5 = v19;
          v3 = (uint64_t)v26;
          goto LABEL_5;
        }
        rbs_process_log();
        v21 = objc_claimAutoreleasedReturnValue();
        v3 = (uint64_t)v26;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck].cold.3();
        v9 = v24;
      }
      else
      {
        rbs_process_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[RBSLaunchContext(RBLaunchChecks) _requiresPreflightCheck].cold.2();
      }

    }
    else
    {
      rbs_process_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = a1;
        _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_DEFAULT, "Skipping preflight as %{public}@ is not an app", buf, 0xCu);
      }
    }

LABEL_40:
    v6 = 0;
LABEL_41:

    goto LABEL_42;
  }
  v6 = 0;
LABEL_42:

  return v6;
}

- (id)_sharedPreflightManager
{
  if (_sharedPreflightManager_onceToken != -1)
    dispatch_once(&_sharedPreflightManager_onceToken, &__block_literal_global_17);
  return (id)_sharedPreflightManager_preflightManager;
}

- (uint64_t)_needsEligibilityCheck
{
  void *v2;
  void *v3;

  if (_needsEligibilityCheck_onceToken != -1)
    dispatch_once(&_needsEligibilityCheck_onceToken, &__block_literal_global_17);
  v2 = (void *)_needsEligibilityCheck_allowed;
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  return v2 ^ 1;
}

- (uint64_t)_launchAllowedBySystemState:()RBLaunchChecks error:
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  _BYTE v42[14];
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "preventLaunch");
  objc_msgSend(v6, "preventLaunchPredicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowLaunchPredicates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80C78]), "initWithLaunchContext:", a1);
  rbs_process_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "executablePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v42 = v7;
    *(_WORD *)&v42[4] = 2114;
    *(_QWORD *)&v42[6] = v12;
    v43 = 2114;
    v44 = v8;
    v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_DEFAULT, "Checking PreventLaunch: global:%d exPath:%{public}@ predicates:%{public}@ allow:%{public}@", buf, 0x26u);

  }
  if ((v7 & 1) != 0)
  {
LABEL_16:
    if (objc_msgSend(v9, "count"))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v6, "allowLaunchPredicates", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v24, "matchesProcess:", v10))
            {
              rbs_process_log();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)v42 = v24;
                _os_log_impl(&dword_21A8B4000, v26, OS_LOG_TYPE_DEFAULT, "PreventLaunch overriden by Predicate: %{public}@", buf, 0xCu);
              }

              v25 = 0;
              goto LABEL_29;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v21)
            continue;
          break;
        }
      }
      v25 = 1;
LABEL_29:

    }
    else
    {
      v25 = 1;
    }
    v18 = v25 ^ 1u;
    if (a4 && v25)
    {
      v27 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", CFSTR("Launch prevented due to \"prevent launch\" assertion"), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v27, 7, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      *a4 = v29;
    }
  }
  else
  {
    if (objc_msgSend(v8, "count"))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v6, "preventLaunchPredicates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v36 != v16)
              objc_enumerationMutation(v13);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "matchesProcess:", v10))
            {

              goto LABEL_16;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v15)
            continue;
          break;
        }
      }

    }
    v18 = 1;
  }

  return v18;
}

- (uint64_t)_recordPassesEligibilityChecks:()RBLaunchChecks
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  objc_msgSend(v4, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__RBSLaunchContext_RBLaunchChecks___recordPassesEligibilityChecks___block_invoke;
  v9[3] = &unk_24DD47280;
  v6 = v5;
  v10 = v6;
  v11 = a1;
  v12 = &v13;
  objc_msgSend(&unk_24DD5FB70, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)_applicationRecordForLaunchCheck
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  id v10;

  objc_msgSend(a1, "appID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(a1, "bundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = 0;
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v9);
      v5 = v9;
      if (v4)
      {
LABEL_13:

        goto LABEL_14;
      }
      rbs_process_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RBSLaunchContext(RBLaunchChecks) _applicationRecordForLaunchCheck].cold.2((uint64_t)v6);
    }
    else
    {
      rbs_process_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RBSLaunchContext(RBLaunchChecks) _applicationRecordForLaunchCheck].cold.1();
      v5 = 0;
      v4 = 0;
    }

    goto LABEL_13;
  }
  v10 = 0;
  objc_msgSend(v2, "findApplicationRecordWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (!v4)
  {
    rbs_process_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[RBSLaunchContext(RBLaunchChecks) _applicationRecordForLaunchCheck].cold.3((uint64_t)v3);
    goto LABEL_13;
  }
LABEL_14:

  return v4;
}

- (uint64_t)_deviceIsEligibleForDomain:()RBLaunchChecks
{
  uint64_t v3;
  int domain_answer;
  int v5;
  NSObject *v6;

  v3 = objc_msgSend(a3, "unsignedLongLongValue");
  domain_answer = os_eligibility_get_domain_answer();
  if (!domain_answer)
    return 0;
  v5 = domain_answer;
  rbs_process_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[RBSLaunchContext(RBLaunchChecks) _deviceIsEligibleForDomain:].cold.1(v5, v3, v6);

  return 0;
}

- (void)_requiresPreflightCheck
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "No LSApplicationIdentity or RBSProcessIdentity in %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_deviceIsEligibleForDomain:()RBLaunchChecks .cold.1(int a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 134218242;
  v5 = a2;
  v6 = 2080;
  v7 = strerror(a1);
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "failure getting eligibility info for domain %qu: %s", (uint8_t *)&v4, 0x16u);
}

- (void)_applicationRecordForLaunchCheck
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v1, v2, "unable to find LSApplicationRecord for identity %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_1();
}

- (void)_passesEligibilityCheck
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Could not find LS record for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end

@implementation RBSSavedEndowmentGrant(RBProcessState)

- (BOOL)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL8 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(v6, "targetIsSystem"))
  {
    objc_msgSend(v6, "originatorEntitlements");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "ignoreRestrictions") & 1) != 0
      || (-[NSObject hasEntitlementDomain:](v13, "hasEntitlementDomain:", 16) & 1) != 0)
    {
      objc_msgSend(v6, "savedEndowments");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "key");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v15, "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17 != 0;

      if (!a4 || v17)
        goto LABEL_18;
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BE80D88];
      v20 = *MEMORY[0x24BDD0FD8];
      v34[0] = CFSTR("Can't find saved endowment for key");
      v21 = *MEMORY[0x24BE80D80];
      v33[0] = v20;
      v33[1] = v21;
      objc_msgSend(a1, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 2, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      rbs_general_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:].cold.2((uint64_t)v15, a1, v24);

    }
    else
    {
      if (!a4)
      {
LABEL_5:
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BE80D88];
      v27 = *MEMORY[0x24BDD0FD8];
      v36[0] = CFSTR("Required client entitlement is missing");
      v28 = *MEMORY[0x24BE80D80];
      v35[0] = v27;
      v35[1] = v28;
      objc_msgSend(a1, "description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 3, v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      rbs_general_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:].cold.3((uint64_t)v13, v15, v31);
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (a4)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80D88];
    v9 = *MEMORY[0x24BDD0FD8];
    v38[0] = CFSTR("endowment grants cannot target the system");
    v10 = *MEMORY[0x24BE80D80];
    v37[0] = v9;
    v37[1] = v10;
    objc_msgSend(a1, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    rbs_general_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[RBSSavedEndowmentGrant(RBProcessState) isValidForContext:withError:].cold.1(v6, v13);
    goto LABEL_5;
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "savedEndowments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v22 = v8;
    v13 = objc_alloc(MEMORY[0x24BE80BC8]);
    objc_msgSend(a1, "endowmentNamespace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "environment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    RBSEndowmentEncode();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v13, "_initWithNamespace:environment:encodedEndowment:originatingIdentifier:attributePath:", v14, v16, v17, v18, a4);

    rbs_general_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_21A8B4000, v20, OS_LOG_TYPE_DEFAULT, "Saved endowment grant adding inheritance %{public}@", buf, 0xCu);
    }

    v8 = v22;
    objc_msgSend(v22, "addInheritance:", v19);
  }
  else
  {
    rbs_general_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[RBSSavedEndowmentGrant(RBProcessState) applyToProcessState:attributePath:context:].cold.1((uint64_t)a1, v19, v21);
  }

}

- (void)isValidForContext:()RBProcessState withError:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "targetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, a2, v4, "endowment grants cannot target the system: %{public}@", (uint8_t *)&v5);

}

- (void)isValidForContext:()RBProcessState withError:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "Can't find saved endowment:%{public}@ for %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)isValidForContext:()RBProcessState withError:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, a2, a3, "Required client entitlement is missing: %{public}@", (uint8_t *)&v3);
}

- (void)applyToProcessState:()RBProcessState attributePath:context:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_21A8B4000, a2, a3, "Attempting to apply saved endowment grant with no corresponding saved endowment %{public}@", (uint8_t *)&v3);
}

@end

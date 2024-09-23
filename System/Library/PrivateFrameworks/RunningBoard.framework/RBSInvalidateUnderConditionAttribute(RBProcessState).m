@implementation RBSInvalidateUnderConditionAttribute(RBProcessState)

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend(v8, "isActiveDueToInheritedEndowment") & 1) != 0)
    {
      rbs_assertion_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RBSInvalidateUnderConditionAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8, v9);

    }
    else
    {
      objc_msgSend(v7, "invalidatesOnConditions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setInvalidatesOnConditions:", v10);
      }
      objc_msgSend(a1, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || (v13 = objc_msgSend(a1, "minValue"), v13 < objc_msgSend(v12, "integerValue")))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "minValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "condition");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v14, v15);

      }
    }
  }

}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "ignoreRestrictions") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "originatorEntitlements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute"));

    if (a4 && (v7 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BE80D88];
      v11 = *MEMORY[0x24BDD0FD8];
      v17[0] = CFSTR("Required client entitlement is missing");
      v12 = *MEMORY[0x24BE80D80];
      v16[0] = v11;
      v16[1] = v12;
      objc_msgSend(a1, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 2, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v7 = 0;
    }
  }

  return v7;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSMimicTaskSuspensionAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

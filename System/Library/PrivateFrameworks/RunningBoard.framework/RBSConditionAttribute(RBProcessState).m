@implementation RBSConditionAttribute(RBProcessState)

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(a1, "condition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "upgradeCondition:toValue:", v4, objc_msgSend(a1, "value"));

  }
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "targetIsSystem") & 1) == 0)
  {
    if (!a4)
      goto LABEL_8;
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE80D88];
    v11 = *MEMORY[0x24BDD0FD8];
    v26[0] = CFSTR("Attribute is not current supported for process target");
    v12 = *MEMORY[0x24BE80D80];
    v25[0] = v11;
    v25[1] = v12;
    objc_msgSend(a1, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    v16 = v10;
    v17 = 2;
LABEL_7:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v14);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "ignoreRestrictions") & 1) == 0)
  {
    objc_msgSend(v6, "originatorEntitlements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute"));

    if ((v8 & 1) == 0)
    {
      if (!a4)
        goto LABEL_8;
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BE80D88];
      v21 = *MEMORY[0x24BDD0FD8];
      v24[0] = CFSTR("Required client entitlement is missing");
      v22 = *MEMORY[0x24BE80D80];
      v23[0] = v21;
      v23[1] = v22;
      objc_msgSend(a1, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      v16 = v20;
      v17 = 3;
      goto LABEL_7;
    }
  }
  a4 = 1;
LABEL_8:

  return a4;
}

@end

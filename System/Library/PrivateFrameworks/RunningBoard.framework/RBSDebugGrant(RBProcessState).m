@implementation RBSDebugGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setIsBeingDebugged:", 1);
  objc_msgSend(v3, "setPreventSuspend:", 1);
  if (objc_msgSend(v3, "role") <= 3)
    objc_msgSend(v3, "setRole:", 4);

}

- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  return objc_msgSend(a3, "setPreventsSuspension:", 1);
}

- (uint64_t)preventsSuspension
{
  return 1;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(v6, "targetIsSystem"))
  {
    if ((objc_msgSend(v6, "ignoreRestrictions") & 1) != 0
      || (objc_msgSend(v6, "originatorEntitlements"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "hasEntitlementDomain:", 8),
          v16,
          (v17 & 1) != 0))
    {
      a4 = 1;
      goto LABEL_8;
    }
    if (!a4)
      goto LABEL_8;
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80D88];
    v19 = *MEMORY[0x24BDD0FD8];
    v22[0] = CFSTR("Required client entitlement is missing");
    v20 = *MEMORY[0x24BE80D80];
    v21[0] = v19;
    v21[1] = v20;
    objc_msgSend(a1, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = v22;
    v14 = v21;
    goto LABEL_4;
  }
  if (a4)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80D88];
    v9 = *MEMORY[0x24BDD0FD8];
    v24[0] = CFSTR("Attribute is not applicable to system target");
    v10 = *MEMORY[0x24BE80D80];
    v23[0] = v9;
    v23[1] = v10;
    objc_msgSend(a1, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = v24;
    v14 = v23;
LABEL_4:
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v15);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_8:

  return a4;
}

@end

@implementation RBSCarPlayModeGrant(RBProcessState)

- (uint64_t)applyToProcessState:()RBProcessState attributePath:context:
{
  return objc_msgSend(a3, "setCarPlayMode:", 1);
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  char v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "originatorEntitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "ignoreRestrictions");

  if ((v8 & 1) != 0
    || (objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute")) & 1) != 0)
  {
    a4 = 1;
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80D88];
    v12 = *MEMORY[0x24BDD0FD8];
    v17[0] = CFSTR("Required client entitlement is missing");
    v13 = *MEMORY[0x24BE80D80];
    v16[0] = v12;
    v16[1] = v13;
    objc_msgSend(a1, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 2, v15);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end

@implementation RBSAttribute(RBProcessState)

+ (uint64_t)allowedForPrimitiveAttributeForProcessTarget:()RBProcessState withError:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(v6, "targetIsSystem"))
  {
    objc_msgSend(v6, "originatorEntitlements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "ignoreRestrictions") & 1) != 0
      || (objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute")) & 1) != 0)
    {
      a4 = 1;
      goto LABEL_8;
    }
    if (!a4)
      goto LABEL_8;
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BE80D88];
    v16 = *MEMORY[0x24BDD0FD8];
    v20[0] = CFSTR("Required client entitlement is missing");
    v17 = *MEMORY[0x24BE80D80];
    v19[0] = v16;
    v19[1] = v17;
    objc_msgSend(a1, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 2, v18);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
    a4 = 0;
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80D88];
    v9 = *MEMORY[0x24BDD0FD8];
    v22[0] = CFSTR("Attribute is not applicable to system target");
    v10 = *MEMORY[0x24BE80D80];
    v21[0] = v9;
    v21[1] = v10;
    objc_msgSend(a1, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v12);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_9:

  return a4;
}

- (uint64_t)hasMandatoryAttributes:()RBProcessState error:
{
  return 1;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  return 1;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return 1;
}

- (uint64_t)preventsSuspension
{
  return 0;
}

- (uint64_t)effectiveAttributesWithContext:()RBProcessState
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a1);
}

@end

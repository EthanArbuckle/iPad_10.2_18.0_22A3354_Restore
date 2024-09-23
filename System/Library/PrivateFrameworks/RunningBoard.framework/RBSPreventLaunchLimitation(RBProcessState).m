@implementation RBSPreventLaunchLimitation(RBProcessState)

- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  return objc_msgSend(a3, "setInvalidatesSynchronously:", 1);
}

- (uint64_t)applyToAcquisitionContext:()RBProcessState
{
  return objc_msgSend(a3, "setAllowAbstractTarget:", 1);
}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addPreventLaunchPredicate:", v5);

    objc_msgSend(a1, "allow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1, "allow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAllowLaunchPredicate:", v7);

    }
  }

}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSystem");

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "originatorEntitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "ignoreRestrictions") & 1) != 0
      || (objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute")) & 1) != 0
      || (objc_msgSend(v9, "hasEntitlementDomain:", 2) & 1) != 0
      || (objc_msgSend(v9, "hasEntitlementDomain:", 4) & 1) != 0)
    {
      a4 = 1;
LABEL_10:

      goto LABEL_11;
    }
    if (!a4)
      goto LABEL_10;
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BE80D88];
    v18 = *MEMORY[0x24BDD0FD8];
    v22[0] = CFSTR("Required client entitlement is missing for attribute");
    v19 = *MEMORY[0x24BE80D80];
    v21[0] = v18;
    v21[1] = v19;
    objc_msgSend(a1, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 2, v20);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    a4 = 0;
    goto LABEL_10;
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80D88];
    v12 = *MEMORY[0x24BDD0FD8];
    v24[0] = CFSTR("Prevent launch limitations must target system");
    v13 = *MEMORY[0x24BE80D80];
    v23[0] = v12;
    v23[1] = v13;
    objc_msgSend(a1, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 2, v14);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_11:

  return a4;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  id v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attribute conflict: attribute %@ conflicts with attribute %@"), a1, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE80D88];
    v12 = *MEMORY[0x24BDD0FD8];
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 2, v11);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end

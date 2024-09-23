@implementation RBSEndowmentGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "targetIsSystem"))
  {
    if (!a4)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE80D88];
    v9 = *MEMORY[0x24BDD0FD8];
    v24[0] = CFSTR("endowment grants cannot target the system");
    v10 = *MEMORY[0x24BE80D80];
    v23[0] = v9;
    v23[1] = v10;
    objc_msgSend(a1, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v12);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "originatorEntitlements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "hasEntitlementDomain:", 16);
    v13 = v14;
    if (!a4 || (v14 & 1) != 0)
      goto LABEL_8;
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BE80D88];
    v17 = *MEMORY[0x24BDD0FD8];
    v22[0] = CFSTR("Required client entitlement is missing");
    v18 = *MEMORY[0x24BE80D80];
    v21[0] = v17;
    v21[1] = v18;
    objc_msgSend(a1, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 2, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

LABEL_9:
  return v13;
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = (objc_class *)MEMORY[0x24BE80BC8];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(a1, "endowmentNamespace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "target");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodedEndowment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (id)objc_msgSend(v11, "_initWithNamespace:environment:encodedEndowment:originatingIdentifier:attributePath:", v12, v14, v15, v16, a4);
  objc_msgSend(v10, "addInheritance:", v17);

}

@end

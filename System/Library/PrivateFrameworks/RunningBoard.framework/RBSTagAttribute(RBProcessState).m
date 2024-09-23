@implementation RBSTagAttribute(RBProcessState)

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

- (void)applyToAssertionTransientState:()RBProcessState attributePath:context:
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "tag");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTag:", v5);

}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "tag");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTag:", v5);

}

- (void)applyToSystemState:()RBProcessState attributePath:context:
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "tag");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTag:", v5);

}

@end

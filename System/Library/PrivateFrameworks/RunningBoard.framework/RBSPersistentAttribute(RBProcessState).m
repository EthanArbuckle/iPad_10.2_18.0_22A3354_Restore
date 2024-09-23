@implementation RBSPersistentAttribute(RBProcessState)

- (unint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "ignoreRestrictions"))
  {
    v7 = a4 == 0;
    LODWORD(v8) = 1;
  }
  else
  {
    objc_msgSend(v6, "originatorEntitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute"));

    v7 = a4 == 0;
    if (a4 && (v8 & 1) == 0)
    {
      v8 = MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BE80D88];
      v11 = *MEMORY[0x24BDD0FD8];
      v28[0] = CFSTR("Required client entitlement is missing");
      v12 = *MEMORY[0x24BE80D80];
      v27[0] = v11;
      v27[1] = v12;
      objc_msgSend(a1, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "errorWithDomain:code:userInfo:", v10, 2, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v7 = 0;
      LODWORD(v8) = 0;
    }
  }
  objc_msgSend(v6, "assertionDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "target");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "processIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v8 = v8;
  else
    v8 = 0;
  if (!v7 && !v17)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BE80D88];
    v20 = *MEMORY[0x24BDD0FD8];
    v26[0] = CFSTR("Persistent attributes must target a process identity");
    v21 = *MEMORY[0x24BE80D80];
    v25[0] = v20;
    v25[1] = v21;
    objc_msgSend(a1, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 2, v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }

  return v8;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a5;
  if ((objc_msgSend(v7, "isActiveDueToInheritedEndowment") & 1) != 0)
  {
    rbs_assertion_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RBSPersistentAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v7, v8);

  }
  else
  {
    objc_msgSend(v6, "setIsPersistent:", 1);
  }

}

- (uint64_t)applyToAcquisitionContext:()RBProcessState
{
  return objc_msgSend(a3, "setAllowAbstractTarget:", 1);
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
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSPersistentAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

@implementation RBSLaunchGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:", v6, a4))goto LABEL_6;
  objc_msgSend(v6, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasConsistentLaunchdJob");

  if ((v9 & 1) == 0)
  {
    if (!a4)
      goto LABEL_7;
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE80D88];
    v12 = *MEMORY[0x24BDD0FD8];
    v18[0] = CFSTR("Attribute is only applicable to daemons and angels");
    v13 = *MEMORY[0x24BE80D80];
    v17[0] = v12;
    v17[1] = v13;
    objc_msgSend(a1, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 2, v15);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  a4 = 1;
LABEL_7:

  return a4;
}

- (uint64_t)applyToProcessState:()RBProcessState attributePath:context:
{
  return objc_msgSend(a3, "setGuaranteedRunning:", 1);
}

- (uint64_t)applyToAcquisitionContext:()RBProcessState
{
  return objc_msgSend(a3, "setAllowAbstractTarget:", 1);
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
      -[RBSLaunchGrant(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v7, v8);

  }
  else
  {
    objc_msgSend(v6, "setIsPersistent:", 1);
  }

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
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSLaunchGrant as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

@implementation RBSDurationAttribute(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "originatorEntitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "ignoreRestrictions") & 1) != 0
    || (objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.runningboard.primitiveattribute")) & 1) != 0
    || (objc_msgSend(v7, "hasEntitlementDomain:", 2) & 1) != 0)
  {
    if (objc_msgSend(a1, "startPolicy") == 1 || !objc_msgSend(v6, "targetIsSystem"))
    {
      a4 = 1;
    }
    else if (a4)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BE80D88];
      v10 = *MEMORY[0x24BDD0FD8];
      v21[0] = CFSTR("Start policy must be 'fixed' for the system target");
      v11 = *MEMORY[0x24BE80D80];
      v20[0] = v10;
      v20[1] = v11;
      objc_msgSend(a1, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v12;
      v13 = (void *)MEMORY[0x24BDBCE70];
      v14 = v21;
      v15 = v20;
LABEL_11:
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 2, v18);
      *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE80D88];
    v16 = *MEMORY[0x24BDD0FD8];
    v23[0] = CFSTR("Required client entitlement is missing");
    v17 = *MEMORY[0x24BE80D80];
    v22[0] = v16;
    v22[1] = v17;
    objc_msgSend(a1, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = v23;
    v15 = v22;
    goto LABEL_11;
  }

  return a4;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(a1, "startPolicy") == 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (objc_msgSend(a1, "startPolicy") != 3
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      a4 = 1;
      goto LABEL_14;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attribute conflict: attribute %@ conflicts with attribute %@"), a1, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BE80D88];
      v15 = *MEMORY[0x24BDD0FD8];
      v16 = v7;
      v10 = (void *)MEMORY[0x24BDBCE70];
      v11 = &v16;
      v12 = &v15;
      goto LABEL_12;
    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attribute conflict: attribute %@ conflicts with attribute %@"), a1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE80D88];
    v17 = *MEMORY[0x24BDD0FD8];
    v18[0] = v7;
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = (void **)v18;
    v12 = &v17;
LABEL_12:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 2, v13);
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_14:

  return a4;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7;
  id v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;

  v7 = a3;
  v8 = a5;
  if ((objc_msgSend(v8, "isActiveDueToInheritedEndowment") & 1) != 0)
  {
    rbs_assertion_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBSDurationAttribute(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v8, v9);

  }
  else
  {
    objc_msgSend(a1, "invalidationDuration");
    v11 = v10;
    objc_msgSend(v7, "invalidationDuration");
    if (v11 > v12)
      objc_msgSend(v7, "setInvalidationDuration:", v11);
    objc_msgSend(a1, "warningDuration");
    v14 = v13;
    objc_msgSend(v7, "warningDuration");
    if (v14 > v15)
      objc_msgSend(v7, "setWarningDuration:", v14);
    v16 = objc_msgSend(a1, "startPolicy");
    if (v16 > objc_msgSend(v7, "startPolicy"))
      objc_msgSend(v7, "setStartPolicy:", v16);
    v17 = objc_msgSend(a1, "endPolicy");
    if (v17 > objc_msgSend(v7, "endPolicy"))
      objc_msgSend(v7, "setEndPolicy:", v17);
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
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Not applying RBSDurationAttribute as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", (uint8_t *)&v4, 0xCu);

}

@end

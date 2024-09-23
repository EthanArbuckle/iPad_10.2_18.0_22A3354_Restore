@implementation RBSDefineRelativeStartTimeGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
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
      -[RBSDefineRelativeStartTimeGrant(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v7);

  }
  else
  {
    objc_msgSend(v6, "setPreventSuspend:", 1);
    if (objc_msgSend(v6, "role") <= 1)
      objc_msgSend(v6, "setRole:", 2);
  }

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
      -[RBSDefineRelativeStartTimeGrant(RBProcessState) applyToAssertionIntransientState:attributePath:context:].cold.1(v7);

  }
  else
  {
    objc_msgSend(v6, "setDefinesRelativeStartTime:", 1);
    objc_msgSend(v6, "setPreventsSuspension:", 1);
  }

}

- (uint64_t)preventsSuspension
{
  return 1;
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "assertion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_21A8B4000, v2, v3, "Not applying RBSDefineRelativeStartTimeGrant as it is not permitted as the subattribute of a hereditary grant for assertion %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end

@implementation RBSRunningReasonAttribute(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "runningReason")
    && (v9 = objc_msgSend(v7, "runningReason"), v9 != objc_msgSend(a1, "runningReason")))
  {
    rbs_assertion_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v7, "runningReason");
      v12 = objc_msgSend(a1, "runningReason");
      objc_msgSend(v8, "assertion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134218498;
      v15 = v11;
      v16 = 2048;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_error_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_ERROR, "Multiple RBSRunningReasonAttribute provided: %lu vs %lu. First one wins, but client should be fixed for assertion %{public}@", (uint8_t *)&v14, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v7, "setRunningReason:", objc_msgSend(a1, "runningReason"));
  }

}

@end

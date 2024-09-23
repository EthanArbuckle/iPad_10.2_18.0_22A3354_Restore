@implementation PLProgressPercentForOperationName

void __PLProgressPercentForOperationName_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PLProgressPercentGroupForLaunchStateMachine();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PLProgressPercentForOperationAddMap(v0, v1);

  PLProgressPercentGroupForRunningStateMachine();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLProgressPercentForOperationAddMap(v0, v2);

  v3 = (void *)PLProgressPercentForOperationName_progressPercentMap;
  PLProgressPercentForOperationName_progressPercentMap = (uint64_t)v0;

}

@end

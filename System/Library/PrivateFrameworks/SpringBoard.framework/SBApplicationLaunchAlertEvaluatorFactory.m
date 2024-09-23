@implementation SBApplicationLaunchAlertEvaluatorFactory

+ (id)defaultApplicationLaunchAlertEvaluators
{
  if (defaultApplicationLaunchAlertEvaluators___once != -1)
    dispatch_once(&defaultApplicationLaunchAlertEvaluators___once, &__block_literal_global_268);
  return (id)defaultApplicationLaunchAlertEvaluators___evaluators;
}

void __83__SBApplicationLaunchAlertEvaluatorFactory_defaultApplicationLaunchAlertEvaluators__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)defaultApplicationLaunchAlertEvaluators___evaluators;
  defaultApplicationLaunchAlertEvaluators___evaluators = (uint64_t)v0;

  v2 = (void *)defaultApplicationLaunchAlertEvaluators___evaluators;
  v3 = objc_alloc_init(SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems);
  objc_msgSend(v2, "addObject:", v3);

}

@end

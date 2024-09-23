@implementation WFUpdatableEntityValueTypeFromEntityUpdaterAction

uint64_t __WFUpdatableEntityValueTypeFromEntityUpdaterAction_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFEntityUpdatingAction entityParameterName](_TtC11WorkflowKit22WFEntityUpdatingAction, "entityParameterName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

@end

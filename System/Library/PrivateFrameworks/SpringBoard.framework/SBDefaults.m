@implementation SBDefaults

+ (id)localDefaults
{
  if (localDefaults___once != -1)
    dispatch_once(&localDefaults___once, &__block_literal_global_379);
  return (id)localDefaults___instance;
}

void __27__SBDefaults_localDefaults__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DA9FA0]);
  v1 = (void *)localDefaults___instance;
  localDefaults___instance = (uint64_t)v0;

}

+ (id)externalDefaults
{
  if (externalDefaults___once != -1)
    dispatch_once(&externalDefaults___once, &__block_literal_global_1_2);
  return (id)externalDefaults___instance;
}

void __30__SBDefaults_externalDefaults__block_invoke()
{
  SBExternalDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(SBExternalDefaults);
  v1 = (void *)externalDefaults___instance;
  externalDefaults___instance = (uint64_t)v0;

}

@end

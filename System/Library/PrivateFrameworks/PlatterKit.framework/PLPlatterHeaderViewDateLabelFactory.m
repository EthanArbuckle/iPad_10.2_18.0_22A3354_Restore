@implementation PLPlatterHeaderViewDateLabelFactory

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_0);
  return (id)sharedInstance___factory;
}

void __53__PLPlatterHeaderViewDateLabelFactory_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D01918]);
  v1 = (void *)sharedInstance___factory;
  sharedInstance___factory = (uint64_t)v0;

}

@end

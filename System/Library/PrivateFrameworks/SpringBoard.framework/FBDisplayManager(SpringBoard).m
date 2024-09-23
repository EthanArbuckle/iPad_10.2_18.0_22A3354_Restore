@implementation FBDisplayManager(SpringBoard)

+ (id)sb_secureMainIdentity
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sb_secureMainConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)sb_secureMainConfiguration
{
  if (sb_secureMainConfiguration___once != -1)
    dispatch_once(&sb_secureMainConfiguration___once, &__block_literal_global_380);
  return (id)sb_secureMainConfiguration___configuration;
}

@end

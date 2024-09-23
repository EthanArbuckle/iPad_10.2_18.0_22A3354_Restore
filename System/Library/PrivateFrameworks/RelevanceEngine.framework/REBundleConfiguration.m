@implementation REBundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  return 0;
}

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.NanoTimeKit.face"));
    objc_msgSend(v2, "registerDefaults:", &unk_24CFC1E50);

  }
}

- (id)elementGroupWithIdentifier:(id)a3
{
  return 0;
}

@end

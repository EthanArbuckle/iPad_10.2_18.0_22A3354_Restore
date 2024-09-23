@implementation PKApplicationProxy

+ (id)applicationProxyForBundleURL:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForBundleURL:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)plugInKitPlugins
{
  objc_opt_class();
  sub_1AF274354();
  return 0;
}

- (BOOL)isPlaceholder
{
  objc_opt_class();
  sub_1AF274354();
  return 0;
}

@end

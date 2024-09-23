@implementation PKExtensionPointProxy

+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CA58D8], "extensionPointForIdentifier:platform:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)platform
{
  objc_opt_class();
  sub_1AF266124();
  return 0;
}

- (NSDictionary)sdkEntry
{
  objc_opt_class();
  sub_1AF266124();
  return 0;
}

@end

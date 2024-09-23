@implementation SADialogInflectWordCommands

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.dialog");
}

- (id)encodedClassName
{
  return CFSTR("InflectWordCommands");
}

+ (id)inflectWordCommands
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)inflectWordCommands
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("inflectWordCommands"), v3);
}

- (void)setInflectWordCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("inflectWordCommands"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end

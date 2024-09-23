@implementation SAGenericCommand

- (NSString)group
{
  return (NSString *)-[AceObject topLevelPropertyForKey:](self, "topLevelPropertyForKey:", CFSTR("$group"));
}

- (NSString)className
{
  return (NSString *)-[AceObject topLevelPropertyForKey:](self, "topLevelPropertyForKey:", CFSTR("$class"));
}

@end

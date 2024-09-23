@implementation SAClockAddCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("AddCompleted");
}

+ (id)addCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)alreadyExists
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("alreadyExists"));
}

- (void)setAlreadyExists:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("alreadyExists"), a3);
}

- (NSURL)worldClockId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("worldClockId"));
}

- (void)setWorldClockId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("worldClockId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end

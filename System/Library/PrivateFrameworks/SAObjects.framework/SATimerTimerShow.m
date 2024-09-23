@implementation SATimerTimerShow

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.timer");
}

- (id)encodedClassName
{
  return CFSTR("TimerShow");
}

+ (id)timerShow
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)actions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("actions"), v3);
}

- (void)setActions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("actions"), (uint64_t)a3);
}

- (NSArray)timerIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("timerIds"));
}

- (void)setTimerIds:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("timerIds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end

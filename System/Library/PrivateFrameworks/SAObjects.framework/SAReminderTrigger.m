@implementation SAReminderTrigger

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("Trigger");
}

+ (id)trigger
{
  return objc_alloc_init((Class)a1);
}

@end

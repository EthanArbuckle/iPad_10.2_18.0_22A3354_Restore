@implementation SARecordActivity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RecordActivity");
}

+ (id)recordActivity
{
  return objc_alloc_init((Class)a1);
}

- (SAActivityObject)activity
{
  return (SAActivityObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("activity"));
}

- (void)setActivity:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("activity"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end

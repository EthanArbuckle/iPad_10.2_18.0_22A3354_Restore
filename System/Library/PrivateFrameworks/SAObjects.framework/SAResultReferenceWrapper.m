@implementation SAResultReferenceWrapper

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ResultReferenceWrapper");
}

+ (id)resultReferenceWrapper
{
  return objc_alloc_init((Class)a1);
}

- (SAResultObjectReference)resultReference
{
  return (SAResultObjectReference *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("resultReference"));
}

- (void)setResultReference:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("resultReference"), a3);
}

@end

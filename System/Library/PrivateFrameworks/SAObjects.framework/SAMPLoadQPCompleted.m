@implementation SAMPLoadQPCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("LoadQPCompleted");
}

+ (id)loadQPCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SAMPCollection)loadedItems
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("loadedItems"));
}

- (void)setLoadedItems:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("loadedItems"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end

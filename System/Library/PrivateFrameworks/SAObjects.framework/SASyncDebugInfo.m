@implementation SASyncDebugInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("DebugInfo");
}

+ (id)debugInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)objectIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("objectIds"));
}

- (void)setObjectIds:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("objectIds"), a3);
}

- (SASyncAnchor)syncAnchor
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("syncAnchor"));
}

- (void)setSyncAnchor:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("syncAnchor"), a3);
}

@end

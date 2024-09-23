@implementation SASportsStandingsSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("StandingsSnippet");
}

+ (id)standingsSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)columns
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("columns"));
}

- (void)setColumns:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("columns"), a3);
}

- (NSArray)entities
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("entities"), v3);
}

- (void)setEntities:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("entities"), (uint64_t)a3);
}

- (NSArray)selectedEntities
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("selectedEntities"), v3);
}

- (void)setSelectedEntities:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("selectedEntities"), (uint64_t)a3);
}

- (BOOL)showCardinalPositions
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("showCardinalPositions"));
}

- (void)setShowCardinalPositions:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("showCardinalPositions"), a3);
}

@end

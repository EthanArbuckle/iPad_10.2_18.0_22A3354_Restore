@implementation SAKnowledgeGraphTriple

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("GraphTriple");
}

+ (id)graphTriple
{
  return objc_alloc_init((Class)a1);
}

- (float)confidence
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("confidence"));
}

- (void)setConfidence:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("confidence"), a3);
}

- (NSString)object
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("object"));
}

- (void)setObject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("object"), a3);
}

- (NSString)predicate
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("predicate"));
}

- (void)setPredicate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("predicate"), a3);
}

- (NSString)storeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("storeName"));
}

- (void)setStoreName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("storeName"), a3);
}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

@end

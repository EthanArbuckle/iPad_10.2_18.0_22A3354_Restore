@implementation SAKnowledgeGetLinkedData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.knowledgeStore");
}

- (id)encodedClassName
{
  return CFSTR("GetLinkedData");
}

+ (id)getLinkedData
{
  return objc_alloc_init((Class)a1);
}

- (NSString)sparqlQuery
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sparqlQuery"));
}

- (void)setSparqlQuery:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sparqlQuery"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end

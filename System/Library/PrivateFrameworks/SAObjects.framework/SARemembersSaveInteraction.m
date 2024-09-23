@implementation SARemembersSaveInteraction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.remembers");
}

- (id)encodedClassName
{
  return CFSTR("SaveInteraction");
}

+ (id)saveInteraction
{
  return objc_alloc_init((Class)a1);
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntent"));
}

- (void)setJsonEncodedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntent"), a3);
}

- (NSString)jsonEncodedIntentResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntentResponse"));
}

- (void)setJsonEncodedIntentResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntentResponse"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end

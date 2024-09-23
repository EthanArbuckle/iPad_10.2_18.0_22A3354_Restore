@implementation SAUSSection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.universalsearch");
}

- (id)encodedClassName
{
  return CFSTR("Section");
}

+ (id)section
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)cardResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("cardResults"), v3);
}

- (void)setCardResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("cardResults"), (uint64_t)a3);
}

- (NSArray)genericResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("genericResults"), v3);
}

- (void)setGenericResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("genericResults"), (uint64_t)a3);
}

- (SAUIAppPunchOut)punchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("punchOut"));
}

- (void)setPunchOut:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("punchOut"), a3);
}

- (NSString)sectionTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sectionTitle"));
}

- (void)setSectionTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sectionTitle"), a3);
}

@end

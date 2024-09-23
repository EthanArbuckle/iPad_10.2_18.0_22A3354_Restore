@implementation SACFPEXQuery

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow.local.pex");
}

- (id)encodedClassName
{
  return CFSTR("Query");
}

+ (id)query
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)criteriaFields
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("criteriaFields"));
}

- (void)setCriteriaFields:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("criteriaFields"), a3);
}

- (NSString)criteriaSemanticTag
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("criteriaSemanticTag"));
}

- (void)setCriteriaSemanticTag:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("criteriaSemanticTag"), a3);
}

- (NSString)criteriaSubType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("criteriaSubType"));
}

- (void)setCriteriaSubType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("criteriaSubType"), a3);
}

- (NSString)criteriaTimeType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("criteriaTimeType"));
}

- (void)setCriteriaTimeType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("criteriaTimeType"), a3);
}

- (NSString)criteriaType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("criteriaType"));
}

- (void)setCriteriaType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("criteriaType"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSString)localeIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("localeIdentifier"));
}

- (void)setLocaleIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("localeIdentifier"), a3);
}

- (NSArray)people
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("people"));
}

- (void)setPeople:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("people"), a3);
}

- (int64_t)queryLimit
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("queryLimit"));
}

- (void)setQueryLimit:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("queryLimit"), a3);
}

- (NSNumber)queryTimeOut
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("queryTimeOut"));
}

- (void)setQueryTimeOut:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("queryTimeOut"), a3);
}

- (NSArray)recipients
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("recipients"));
}

- (void)setRecipients:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("recipients"), a3);
}

- (NSString)socialLabelType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("socialLabelType"));
}

- (void)setSocialLabelType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("socialLabelType"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end

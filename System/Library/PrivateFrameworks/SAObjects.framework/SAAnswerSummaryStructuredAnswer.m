@implementation SAAnswerSummaryStructuredAnswer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.answer");
}

- (id)encodedClassName
{
  return CFSTR("SummaryStructuredAnswer");
}

+ (id)summaryStructuredAnswer
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)answerPropertyGroups
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("answerPropertyGroups"), v3);
}

- (void)setAnswerPropertyGroups:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("answerPropertyGroups"), (uint64_t)a3);
}

- (NSString)category
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("category"));
}

- (void)setCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("category"), a3);
}

- (NSURL)image
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("image"));
}

- (void)setImage:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("image"), a3);
}

- (NSString)imageCaption
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("imageCaption"));
}

- (void)setImageCaption:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("imageCaption"), a3);
}

- (NSString)text
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("text"));
}

- (void)setText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("text"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (NSString)titleAnnotation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("titleAnnotation"));
}

- (void)setTitleAnnotation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("titleAnnotation"), a3);
}

@end

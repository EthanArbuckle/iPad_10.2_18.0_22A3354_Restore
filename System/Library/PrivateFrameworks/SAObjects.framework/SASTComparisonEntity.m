@implementation SASTComparisonEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("ComparisonEntity");
}

+ (id)comparisonEntity
{
  return objc_alloc_init((Class)a1);
}

- (SAUIDecoratedText)decoratedTitle
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedTitle"));
}

- (void)setDecoratedTitle:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedTitle"), a3);
}

- (SAUIDecoratedText)decoratedValue
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("decoratedValue"));
}

- (void)setDecoratedValue:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("decoratedValue"), a3);
}

- (SAUINanoImageResource)imageResource
{
  return (SAUINanoImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("imageResource"));
}

- (void)setImageResource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("imageResource"), a3);
}

@end

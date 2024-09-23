@implementation SAUITemplateTabularDataRowActionShowModalSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("TabularDataRowActionShowModalSnippet");
}

+ (id)tabularDataRowActionShowModalSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAServerBoundCommand)fetchContentCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("fetchContentCommand"));
}

- (void)setFetchContentCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("fetchContentCommand"), a3);
}

@end

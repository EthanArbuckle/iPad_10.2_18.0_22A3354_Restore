@implementation SAUITemplateCollectionView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("CollectionView");
}

+ (id)collectionView
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)cells
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("cells"), v3);
}

- (void)setCells:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("cells"), (uint64_t)a3);
}

@end

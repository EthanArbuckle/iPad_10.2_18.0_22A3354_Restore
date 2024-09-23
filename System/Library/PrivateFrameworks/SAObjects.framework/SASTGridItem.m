@implementation SASTGridItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("GridItem");
}

+ (id)gridItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)gridCells
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("gridCells"), v3);
}

- (void)setGridCells:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("gridCells"), (uint64_t)a3);
}

@end

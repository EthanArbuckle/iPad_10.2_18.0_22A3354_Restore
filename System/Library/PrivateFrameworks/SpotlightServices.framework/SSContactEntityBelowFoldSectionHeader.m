@implementation SSContactEntityBelowFoldSectionHeader

- (BOOL)shouldSkipSection
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSContactEntityBelowFoldSectionHeader;
  return -[SSContactEntitySectionBuilder shouldSkipSection](&v4, sel_shouldSkipSection)
      || -[SSSectionBuilder renderState](self, "renderState") != 4;
}

@end

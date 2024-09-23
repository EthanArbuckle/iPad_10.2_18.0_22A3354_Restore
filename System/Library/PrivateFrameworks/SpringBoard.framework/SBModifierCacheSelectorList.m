@implementation SBModifierCacheSelectorList

- (SBModifierCacheSelectorList)initWithSelectors:(SEL *)a3 count:(int64_t)a4
{
  SBModifierCacheSelectorList *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBModifierCacheSelectorList;
  result = -[SBModifierCacheSelectorList init](&v7, sel_init);
  result->selCount = a4;
  result->sels = a3;
  return result;
}

@end

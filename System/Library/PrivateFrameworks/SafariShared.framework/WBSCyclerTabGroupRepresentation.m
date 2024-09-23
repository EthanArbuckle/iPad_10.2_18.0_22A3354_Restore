@implementation WBSCyclerTabGroupRepresentation

- (WBSCyclerBookmarkLeafRepresentation)randomTabDescendant
{
  return (WBSCyclerBookmarkLeafRepresentation *)-[WBSCyclerItemListRepresentation randomChildPassingTest:](self, "randomChildPassingTest:", &__block_literal_global_39);
}

uint64_t __54__WBSCyclerTabGroupRepresentation_randomTabDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)numberOfTabs
{
  return -[WBSCyclerItemListRepresentation numberOfChildren](self, "numberOfChildren") - 1;
}

@end

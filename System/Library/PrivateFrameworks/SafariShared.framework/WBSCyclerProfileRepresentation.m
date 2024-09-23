@implementation WBSCyclerProfileRepresentation

- (id)randomTabGroupDescendant
{
  return -[WBSCyclerItemListRepresentation randomDescendantPassingTest:](self, "randomDescendantPassingTest:", &__block_literal_global_38);
}

uint64_t __58__WBSCyclerProfileRepresentation_randomTabGroupDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end

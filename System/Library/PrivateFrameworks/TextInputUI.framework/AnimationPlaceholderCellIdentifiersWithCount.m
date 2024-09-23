@implementation AnimationPlaceholderCellIdentifiersWithCount

void __AnimationPlaceholderCellIdentifiersWithCount_block_invoke()
{
  void *v0;
  uint64_t i;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = -1; i != -21; --i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v2);

  }
  v3 = (void *)AnimationPlaceholderCellIdentifiersWithCount_placeholderIdentifiers;
  AnimationPlaceholderCellIdentifiersWithCount_placeholderIdentifiers = (uint64_t)v0;

}

@end

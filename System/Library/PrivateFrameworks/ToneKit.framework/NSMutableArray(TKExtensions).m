@implementation NSMutableArray(TKExtensions)

- (void)tk_ensureHasItemsOrNullUpToIndex:()TKExtensions
{
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v5 = objc_msgSend(a1, "count");
  if (v5 <= a3)
  {
    v6 = v5;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "addObject:", v7);

      ++v6;
    }
    while (v6 <= a3);
  }
}

@end

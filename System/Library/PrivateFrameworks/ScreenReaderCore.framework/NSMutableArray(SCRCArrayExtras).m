@implementation NSMutableArray(SCRCArrayExtras)

- (void)insertObjects:()SCRCArrayExtras atIndex:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(v9, "count");
  if (v6)
  {
    v7 = v6 - 1;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "insertObject:atIndex:", v8, a4);

      --v7;
    }
    while (v7 != -1);
  }

}

@end

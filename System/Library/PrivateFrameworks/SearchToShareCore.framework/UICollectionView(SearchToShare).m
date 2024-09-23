@implementation UICollectionView(SearchToShare)

- (void)sts_enumerateAllIndexPathsUsingBlock:()SearchToShare
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  unsigned __int8 v15;

  v4 = a3;
  v15 = 0;
  v5 = objc_msgSend(a1, "numberOfSections");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = objc_msgSend(a1, "numberOfItemsInSection:", v7);
      if (v8)
      {
        v9 = v8;
        v10 = 1;
        do
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v10 - 1, v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v11, &v15);
          v12 = v15;

          if (v12)
            v13 = 1;
          else
            v13 = v10 >= v9;
          ++v10;
        }
        while (!v13);
      }
      ++v7;
      if (v15)
        v14 = 1;
      else
        v14 = v7 == v6;
    }
    while (!v14);
  }

}

@end

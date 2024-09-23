@implementation UICollectionView(TVMLKitAdditions)

- (double)tv_sizeThatFits:()TVMLKitAdditions withContentInset:
{
  return *MEMORY[0x24BDBF148];
}

- (uint64_t)tv_isFocusOnNonOwnedCell
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == a1 || !objc_msgSend(v3, "isDescendantOfView:", a1))
  {
    v8 = 0;
  }
  else
  {
    v4 = v3;
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == a1)
    {
      v6 = v4;
    }
    else
    {
      do
      {
        objc_msgSend(v4, "superview");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "superview");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v6;
      }
      while (v7 != a1);
    }
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() ^ 1;

  }
  return v8 & 1;
}

@end

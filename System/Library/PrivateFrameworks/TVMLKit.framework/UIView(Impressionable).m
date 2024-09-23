@implementation UIView(Impressionable)

- (uint64_t)tv_impressionableElementsForDocument:()Impressionable
{
  return objc_msgSend(a1, "tv_impressionableElementsForDocument:parentViewController:", a3, 0);
}

- (id)tv_impressionableElementsForDocument:()Impressionable parentViewController:
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "impressionViewablePercentage");
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "impressionableElementsContainedInDocument:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);
  }
  else
  {
    objc_msgSend(a1, "tv_associatedIKViewElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v7, "tv_associatedIKViewElement");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v14;

    v15 = ImpressionVisibilityFactor(a1);
    if (v11 && v15 >= v9 && ActuallyVisibleView(a1))
      objc_msgSend(v10, "addObject:", v11);
  }

  v16 = (void *)objc_msgSend(v10, "copy");
  return v16;
}

@end

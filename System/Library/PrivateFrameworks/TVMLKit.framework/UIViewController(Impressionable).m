@implementation UIViewController(Impressionable)

- (id)tv_impressionableElementsForDocument:()Impressionable
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "impressionableElementsContainedInDocument:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);
  }
  else if (objc_msgSend(a1, "isViewLoaded"))
  {
    objc_msgSend(a1, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tv_impressionableElementsForDocument:parentViewController:", v4, a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  else
  {
    objc_msgSend(a1, "tv_associatedIKViewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
  }

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

@end

@implementation UIViewController(PhotosDetailsNavigation)

- (id)representedItem
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "childViewControllerForRepresentedItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "representedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)childViewControllerForRepresentedItem
{
  return 0;
}

- (uint64_t)shouldUseSystemSwipeToDismiss
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_getAssociatedObject(a1, (const void *)ShouldUseSystemSwipeToDismissAssociationKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    objc_msgSend(a1, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "shouldUseSystemSwipeToDismiss");

  }
  return v4;
}

- (void)setShouldUseSystemSwipeToDismiss:()PhotosDetailsNavigation
{
  const void *v2;
  id v3;

  v2 = (const void *)ShouldUseSystemSwipeToDismissAssociationKey;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);

}

@end

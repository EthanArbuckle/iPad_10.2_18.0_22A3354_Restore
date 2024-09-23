@implementation UIViewController(PhotoLibraryAdditions)

- (uint64_t)pl_visitControllerHierarchyWithBlock:()PhotoLibraryAdditions
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;

  v5 = (void *)objc_msgSend(a1, "childViewControllers");
  v6 = (void *)objc_msgSend(a1, "presentedViewController");
  if (v6)
  {
    v7 = v6;
    if ((void *)objc_msgSend(v6, "presentingViewController") == a1
      && (objc_msgSend(v5, "containsObject:", v7) & 1) == 0)
    {
      v5 = (void *)objc_msgSend(v5, "arrayByAddingObject:", v7);
    }
  }
  v8 = objc_msgSend(v5, "count") - 1;
  while ((v8 & 0x8000000000000000) == 0)
  {
    v9 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v8--), "pl_visitControllerHierarchyWithBlock:", a3);
    if ((v9 & 1) == 0)
      return 0;
  }
  return (*(uint64_t (**)(uint64_t, void *))(a3 + 16))(a3, a1);
}

@end

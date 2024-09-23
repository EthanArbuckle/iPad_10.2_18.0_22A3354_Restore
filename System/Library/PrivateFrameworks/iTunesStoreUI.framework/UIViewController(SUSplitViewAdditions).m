@implementation UIViewController(SUSplitViewAdditions)

- (double)maximumViewSize
{
  void *v1;
  double result;

  v1 = (void *)objc_msgSend(a1, "childViewControllers");
  if (objc_msgSend(v1, "count") != 1)
    return *MEMORY[0x24BDBF148];
  objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", 0), "maximumViewSize");
  return result;
}

- (double)minimumViewSize
{
  void *v1;
  double result;

  v1 = (void *)objc_msgSend(a1, "childViewControllers");
  if (objc_msgSend(v1, "count") != 1)
    return *MEMORY[0x24BDBF148];
  objc_msgSend((id)objc_msgSend(v1, "objectAtIndex:", 0), "minimumViewSize");
  return result;
}

- (void)storeSplitViewController
{
  void *i;

  for (i = a1; i; i = (void *)objc_msgSend(i, "parentViewController"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
  }
  return i;
}

@end

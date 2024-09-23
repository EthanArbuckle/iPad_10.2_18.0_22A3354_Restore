@implementation UIWindow(PhotoLibrary)

- (uint64_t)pl_presentViewController:()PhotoLibrary animated:
{
  void *i;
  void *v7;

  for (i = (void *)objc_msgSend(a1, "rootViewController"); ; i = (void *)objc_msgSend(v7, "presentedViewController"))
  {
    v7 = i;
    if (!objc_msgSend(i, "presentedViewController"))
      break;
  }
  return objc_msgSend(v7, "presentViewController:animated:completion:", a3, a4, 0);
}

@end

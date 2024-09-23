@implementation UINavigationController(ReplaceViewController)

- (void)_VideosExtras_replaceViewController:()ReplaceViewController withViewController:animated:
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v8 = a3;
  objc_msgSend(a1, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = objc_msgSend(v10, "indexOfObject:", v8);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v11, v12);
    objc_msgSend(a1, "setViewControllers:animated:", v10, a5);
  }

}

@end

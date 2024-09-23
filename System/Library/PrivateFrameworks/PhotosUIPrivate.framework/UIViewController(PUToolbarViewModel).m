@implementation UIViewController(PUToolbarViewModel)

- (PUToolbarViewModel)pu_toolbarViewModel
{
  PUToolbarViewModel *v2;

  objc_getAssociatedObject(a1, "com.apple.photosui.toolbarViewModel");
  v2 = (PUToolbarViewModel *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(PUToolbarViewModel);
    -[PUToolbarViewModel _setViewController:](v2, "_setViewController:", a1);
    objc_setAssociatedObject(a1, "com.apple.photosui.toolbarViewModel", v2, (void *)1);
  }
  return v2;
}

@end

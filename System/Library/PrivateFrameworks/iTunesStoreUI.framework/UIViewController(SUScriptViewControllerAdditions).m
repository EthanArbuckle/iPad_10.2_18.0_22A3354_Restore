@implementation UIViewController(SUScriptViewControllerAdditions)

- (uint64_t)copyScriptViewController
{
  void *v2;
  __objc2_class *v3;
  id v4;

  v2 = (void *)objc_msgSend(a1, "parentViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = SUScriptNavigationController;
LABEL_8:
    v4 = objc_alloc_init(v3);
    objc_msgSend(v4, "setNativeViewController:", a1);
    return (uint64_t)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = SUScriptMediaPickerController;
    goto LABEL_8;
  }
  if (!v2 || objc_msgSend(a1, "_remoteViewControllerProxy"))
  {
    v3 = SUScriptViewController;
    goto LABEL_8;
  }
  return objc_msgSend(v2, "copyScriptViewController");
}

@end

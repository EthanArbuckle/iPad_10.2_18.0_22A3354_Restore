@implementation NSObject(FBScene_UIKit)

- (id)uiPresentationManager
{
  id v2;

  BSDispatchQueueAssertMain();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a1, "isValid"))
  {
    objc_getAssociatedObject(a1, &_UI_PRESENTATION_MANAGER_KEY);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v2 = -[UIScenePresentationManager _initWithScene:]([UIScenePresentationManager alloc], "_initWithScene:", a1);
      objc_setAssociatedObject(a1, &_UI_PRESENTATION_MANAGER_KEY, v2, (void *)0x301);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end

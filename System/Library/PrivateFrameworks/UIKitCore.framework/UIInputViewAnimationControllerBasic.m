@implementation UIInputViewAnimationControllerBasic

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
  objc_msgSend(a3, "updateToPlacement:withNormalAnimationsAndNotifications:", a4, 1);
}

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v7;

  v7 = a5;
  objc_msgSend(a3, "updateToPlacement:withNormalAnimationsAndNotifications:", a4, 0);
  return v7;
}

@end

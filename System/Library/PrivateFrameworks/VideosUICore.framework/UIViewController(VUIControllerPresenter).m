@implementation UIViewController(VUIControllerPresenter)

- (void)presentViewController:()VUIControllerPresenter modalPresentationStyle:animated:completion:
{
  id v10;
  id v11;

  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "setModalPresentationStyle:", a4);
  objc_msgSend(a1, "presentViewController:animated:completion:", v11, a5, v10);

}

@end

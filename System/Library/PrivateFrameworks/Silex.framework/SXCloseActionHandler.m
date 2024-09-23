@implementation SXCloseActionHandler

- (void)handleCloseActionOnPresenter:(id)a3
{
  id v3;

  objc_msgSend(a3, "controller");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end

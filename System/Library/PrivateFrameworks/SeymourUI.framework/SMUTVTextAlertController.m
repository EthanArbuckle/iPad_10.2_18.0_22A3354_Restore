@implementation SMUTVTextAlertController

- (SMUTVTextAlertController)initWithTitle:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  SMUTVTextAlertController *v8;
  uint64_t v9;
  UIAlertController *alertController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SMUTVTextAlertController;
  v8 = -[SMUTVTextAlertController init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    alertController = v8->_alertController;
    v8->_alertController = (UIAlertController *)v9;

  }
  return v8;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_alertController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end

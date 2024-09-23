@implementation SMUPasswordController

- (SMUPasswordController)initWithTitle:(id)a3 passwordLength:(int64_t)a4 supportedOrientations:(unint64_t)a5
{
  id v8;
  SMUPasswordController *v9;
  SMUPasswordAlertController *v10;
  SMUPasswordAlertController *alertController;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SMUPasswordController;
  v9 = -[SMUPasswordController init](&v13, sel_init);
  if (v9)
  {
    v10 = -[TVRAlertController initWithTitle:passcodeSize:]([SMUPasswordAlertController alloc], "initWithTitle:passcodeSize:", v8, a4);
    alertController = v9->_alertController;
    v9->_alertController = v10;

    -[TVRAlertController setDelegate:](v9->_alertController, "setDelegate:", v9);
    -[SMUPasswordAlertController setSupportedOrientations:](v9->_alertController, "setSupportedOrientations:", a5);
  }

  return v9;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_alertController;
}

- (void)dismiss
{
  -[SMUPasswordAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alertController:(id)a3 enteredText:(id)a4
{
  void (**passwordEnteredHandler)(id, id);

  passwordEnteredHandler = (void (**)(id, id))self->_passwordEnteredHandler;
  if (passwordEnteredHandler)
    passwordEnteredHandler[2](passwordEnteredHandler, a4);
}

- (void)alertControllerCancelled:(id)a3
{
  void (**passwordEntryCancelledHandler)(void);

  passwordEntryCancelledHandler = (void (**)(void))self->_passwordEntryCancelledHandler;
  if (passwordEntryCancelledHandler)
    passwordEntryCancelledHandler[2]();
}

- (id)passwordEnteredHandler
{
  return self->_passwordEnteredHandler;
}

- (void)setPasswordEnteredHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)passwordEntryCancelledHandler
{
  return self->_passwordEntryCancelledHandler;
}

- (void)setPasswordEntryCancelledHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passwordEntryCancelledHandler, 0);
  objc_storeStrong(&self->_passwordEnteredHandler, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end

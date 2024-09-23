@implementation PMTOTPMigrationController

- (PMTOTPMigrationController)initWithMigrationURL:(id)a3
{
  id v4;
  PMTOTPMigrationController *v5;
  _TtC17PasswordManagerUI26_PMTOTPMigrationController *v6;
  _TtC17PasswordManagerUI26_PMTOTPMigrationController *controller;
  PMTOTPMigrationController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PMTOTPMigrationController;
  v5 = -[PMTOTPMigrationController init](&v10, sel_init);
  if (v5
    && (v6 = -[_PMTOTPMigrationController initWithMigrationURL:delegate:]([_TtC17PasswordManagerUI26_PMTOTPMigrationController alloc], "initWithMigrationURL:delegate:", v4, v5), controller = v5->_controller, v5->_controller = v6, controller, v5->_controller))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (UIViewController)viewController
{
  return -[_PMTOTPMigrationController viewController](self->_controller, "viewController");
}

- (void)addGenerator:(id)a3 toSavedAccount:(id)a4
{
  -[_PMTOTPMigrationController addGenerator:toSavedAccount:](self->_controller, "addGenerator:toSavedAccount:", a3, a4);
}

- (int64_t)numberOfCodes
{
  return -[_PMTOTPMigrationController numberOfCodes](self->_controller, "numberOfCodes");
}

- (NSArray)totpGenerators
{
  return -[_PMTOTPMigrationController totpGenerators](self->_controller, "totpGenerators");
}

- (void)totpMigrationControllerFinishedImport:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "totpMigrationControllerFinishedImport:", self);

}

- (void)totpMigrationController:(id)a3 presentDetailsForSavedAccount:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "totpMigrationController:presentDetailsForSavedAccount:", self, v6);

}

- (void)totpMigrationController:(id)a3 presentPickerForGenerator:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "totpMigrationController:presentPickerForGenerator:", self, v6);

}

- (PMTOTPMigrationControllerDelegate)delegate
{
  return (PMTOTPMigrationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end

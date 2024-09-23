@implementation PKProvisioningWatchUICoordinator

- (PKProvisioningWatchUICoordinator)init
{

  return 0;
}

- (PKProvisioningWatchUICoordinator)initWithSetupContext:(int64_t)a3 provisioningController:(id)a4 credential:(id)a5
{
  id v8;
  id v9;
  _PKProvisioningWatchUICoordinator *v10;
  PKProvisioningWatchUICoordinator *v11;

  v8 = a5;
  v9 = a4;
  v10 = -[_PKProvisioningWatchUICoordinator initWithSetupContext:provisioningController:credential:]([_PKProvisioningWatchUICoordinator alloc], "initWithSetupContext:provisioningController:credential:", a3, v9, v8);

  v11 = -[PKProvisioningWatchUICoordinator _initWithCoordinator:](self, "_initWithCoordinator:", v10);
  return v11;
}

- (id)initManualEntryCoordinatorWithSetupContext:(int64_t)a3 provisioningController:(id)a4 skipRequirements:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _PKProvisioningWatchUICoordinator *v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = -[_PKProvisioningWatchUICoordinator initWithManualEntrySetupContext:provisioningController:skipRequirements:]([_PKProvisioningWatchUICoordinator alloc], "initWithManualEntrySetupContext:provisioningController:skipRequirements:", a3, v8, v5);

  v10 = -[PKProvisioningWatchUICoordinator _initWithCoordinator:](self, "_initWithCoordinator:", v9);
  return v10;
}

- (id)_initWithCoordinator:(id)a3
{
  id v5;
  PKProvisioningWatchUICoordinator *v6;
  PKProvisioningWatchUICoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningWatchUICoordinator;
  v6 = -[PKProvisioningWatchUICoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coordinator, a3);

  return v7;
}

- (PKProvisioningWatchUICoordinatorDelegate)delegate
{
  return -[_PKProvisioningWatchUICoordinator delegate](self->_coordinator, "delegate");
}

- (void)setDelegate:(id)a3
{
  -[_PKProvisioningWatchUICoordinator setDelegate:](self->_coordinator, "setDelegate:", a3);
}

- (void)continueWithFieldsModel:(id)a3
{
  -[_PKProvisioningWatchUICoordinator continueWithFieldsModel:](self->_coordinator, "continueWithFieldsModel:", a3);
}

- (void)preflightWithFieldsModel:(id)a3 completion:(id)a4
{
  -[_PKProvisioningWatchUICoordinator preflightWithFieldModel:completion:](self->_coordinator, "preflightWithFieldModel:completion:", a3, a4);
}

- (void)cancel
{
  -[_PKProvisioningWatchUICoordinator cancel](self->_coordinator, "cancel");
}

- (void)reset
{
  -[_PKProvisioningWatchUICoordinator reset](self->_coordinator, "reset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end

@implementation PKProvisioningSEStorageManager

- (PKProvisioningSEStorageManager)init
{
  void *v3;
  PKProvisioningSEStorageManager *v4;

  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKProvisioningSEStorageManager initWithWebService:](self, "initWithWebService:", v3);

  return v4;
}

- (PKProvisioningSEStorageManager)initWithWebService:(id)a3
{
  id v4;
  PKProvisioningSEStorageManager *v5;
  _PKProvisioningSEStorageManager *v6;
  _PKProvisioningSEStorageManager *manager;
  PKProvisioningSEStorageManager *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKProvisioningSEStorageManager;
    v5 = -[PKProvisioningSEStorageManager init](&v10, sel_init);
    if (v5)
    {
      v6 = -[_PKProvisioningSEStorageManager initWithWebService:]([_PKProvisioningSEStorageManager alloc], "initWithWebService:", v4);
      manager = v5->_manager;
      v5->_manager = v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  -[_PKProvisioningSEStorageManager reserveStorageFor:metadata:completion:](self->_manager, "reserveStorageFor:metadata:completion:", a3, a4, a5);
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  -[_PKProvisioningSEStorageManager deleteWithReservation:completion:](self->_manager, "deleteWithReservation:completion:", a3, a4);
}

- (void)debugReservationDescriptions:(id)a3
{
  -[_PKProvisioningSEStorageManager debugReservationDescriptionsWithCompletion:](self->_manager, "debugReservationDescriptionsWithCompletion:", a3);
}

- (void)debugPerformSECleanup:(id)a3
{
  -[_PKProvisioningSEStorageManager performDebugSECleanupWithCompletion:](self->_manager, "performDebugSECleanupWithCompletion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end

@implementation TRDeviceSetupCancelAction

- (TRDeviceSetupCancelAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupCancelAction;
  return (TRDeviceSetupCancelAction *)-[TRDeviceSetupAction _initWithActionType:parameters:](&v3, sel__initWithActionType_parameters_, CFSTR("cancel"), 0);
}

- (TRDeviceSetupCancelAction)initWithError:(id)a3
{
  id v5;
  TRDeviceSetupCancelAction *v6;
  TRDeviceSetupCancelAction *v7;

  v5 = a3;
  v6 = -[TRDeviceSetupCancelAction init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end

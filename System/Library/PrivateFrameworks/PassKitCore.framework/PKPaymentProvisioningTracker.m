@implementation PKPaymentProvisioningTracker

- (PKPaymentProvisioningTracker)initWithPaymentProvisioningController:(id)a3
{
  id v4;
  PKPaymentProvisioningTracker *v5;
  PKPaymentProvisioningTracker *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentProvisioningTracker;
  v5 = -[PKPaymentProvisioningTracker init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    objc_msgSend(v4, "_noteProvisioningDidBegin");
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_noteProvisioningDidEnd");

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentProvisioningTracker;
  -[PKPaymentProvisioningTracker dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  PKPaymentProvisioningController **p_controller;
  id WeakRetained;

  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_noteProvisioningDidEnd");

  objc_storeWeak((id *)p_controller, 0);
}

- (BOOL)isCanceled
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v3 = WeakRetained == 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end

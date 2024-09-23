@implementation PKPeerPaymentSetupFlowProvisionConfiguration

- (PKPeerPaymentSetupFlowProvisionConfiguration)initWithSetupDelegate:(id)a3
{
  id v4;
  PKPeerPaymentSetupFlowProvisionConfiguration *v5;
  PKPeerPaymentSetupFlowProvisionConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentSetupFlowProvisionConfiguration;
  v5 = -[PKPeerPaymentSetupFlowProvisionConfiguration init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_setupDelegate, v4);

  return v6;
}

- (unint64_t)peerPaymentSetupConfigurationType
{
  return 0;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
}

@end

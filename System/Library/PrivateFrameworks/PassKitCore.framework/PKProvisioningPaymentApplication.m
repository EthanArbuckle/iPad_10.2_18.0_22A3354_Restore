@implementation PKProvisioningPaymentApplication

- (PKProvisioningPaymentApplication)initWithAppletTypeIdentifier:(id)a3 paymentType:(unint64_t)a4
{
  id v7;
  PKProvisioningPaymentApplication *v8;
  PKProvisioningPaymentApplication *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKProvisioningPaymentApplication;
  v8 = -[PKProvisioningPaymentApplication init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appletTypeIdentifier, a3);
    v9->_paymentType = a4;
  }

  return v9;
}

- (PKProvisioningPaymentApplication)initWithDictionary:(id)a3
{
  id v4;
  PKProvisioningPaymentApplication *v5;
  uint64_t v6;
  NSString *appletTypeIdentifier;
  void *v8;
  uint64_t v9;
  NSString *applicationIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningPaymentApplication;
  v5 = -[PKProvisioningPaymentApplication init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("appletTypeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletTypeIdentifier = v5->_appletTypeIdentifier;
    v5->_appletTypeIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("paymentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentType = PKPaymentMethodTypeForString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("applicationIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v9;

    if (!v5->_appletTypeIdentifier || !v5->_paymentType)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSString)appletTypeIdentifier
{
  return self->_appletTypeIdentifier;
}

- (unint64_t)paymentType
{
  return self->_paymentType;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_appletTypeIdentifier, 0);
}

@end

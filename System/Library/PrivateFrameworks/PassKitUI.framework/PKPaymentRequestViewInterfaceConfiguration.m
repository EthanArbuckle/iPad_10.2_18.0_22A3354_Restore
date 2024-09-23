@implementation PKPaymentRequestViewInterfaceConfiguration

- (PKPaymentRequestViewInterfaceConfiguration)init
{
  PKPaymentRequestViewInterfaceConfiguration *v2;
  PKPaymentRequest *v3;
  PKPaymentRequest *request;
  NSString *applicationIdentifier;
  NSString *localizedApplicationName;
  NSString *bundleIdentifier;
  NSString *relevantPassUniqueID;
  PKPaymentHardwareStatus *v9;
  PKPaymentHardwareStatus *paymentHardwareStatus;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequestViewInterfaceConfiguration;
  v2 = -[PKPaymentRequestViewInterfaceConfiguration init](&v12, sel_init);
  if (v2)
  {
    v3 = (PKPaymentRequest *)objc_alloc_init(MEMORY[0x1E0D67260]);
    request = v2->_request;
    v2->_request = v3;

    applicationIdentifier = v2->_applicationIdentifier;
    v2->_applicationIdentifier = (NSString *)&stru_1E3E7D690;

    localizedApplicationName = v2->_localizedApplicationName;
    v2->_localizedApplicationName = (NSString *)&stru_1E3E7D690;

    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)&stru_1E3E7D690;

    relevantPassUniqueID = v2->_relevantPassUniqueID;
    v2->_relevantPassUniqueID = (NSString *)&stru_1E3E7D690;

    v9 = (PKPaymentHardwareStatus *)objc_alloc_init(MEMORY[0x1E0D67128]);
    paymentHardwareStatus = v2->_paymentHardwareStatus;
    v2->_paymentHardwareStatus = v9;

  }
  return v2;
}

- (PKPaymentSheetExperiment)paymentSheetExperiment
{
  PKPaymentSheetExperiment *paymentSheetExperiment;
  PKPaymentSheetExperiment *v4;
  PKPaymentSheetExperiment *v5;

  paymentSheetExperiment = self->_paymentSheetExperiment;
  if (!paymentSheetExperiment)
  {
    v4 = (PKPaymentSheetExperiment *)objc_alloc_init(MEMORY[0x1E0D67348]);
    v5 = self->_paymentSheetExperiment;
    self->_paymentSheetExperiment = v4;

    paymentSheetExperiment = self->_paymentSheetExperiment;
  }
  return paymentSheetExperiment;
}

- (PKPaymentRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSString)localizedApplicationName
{
  return self->_localizedApplicationName;
}

- (void)setLocalizedApplicationName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedApplicationName, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)relevantPassUniqueID
{
  return self->_relevantPassUniqueID;
}

- (void)setRelevantPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_relevantPassUniqueID, a3);
}

- (PKPaymentHardwareStatus)paymentHardwareStatus
{
  return self->_paymentHardwareStatus;
}

- (void)setPaymentHardwareStatus:(id)a3
{
  objc_storeStrong((id *)&self->_paymentHardwareStatus, a3);
}

- (void)setPaymentSheetExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetExperiment, a3);
}

- (PKPaymentAuthorizationPresenter)presenter
{
  return (PKPaymentAuthorizationPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_paymentSheetExperiment, 0);
  objc_storeStrong((id *)&self->_paymentHardwareStatus, 0);
  objc_storeStrong((id *)&self->_relevantPassUniqueID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedApplicationName, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end

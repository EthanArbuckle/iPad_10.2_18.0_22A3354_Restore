@implementation PKSimulatorPaymentPass

- (PKSimulatorPaymentPass)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  PKSimulatorPaymentPass *v7;
  uint64_t v8;
  NSDictionary *dictionary;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSimulatorPaymentPass;
  v7 = -[PKSecureElementPass initWithDictionary:bundle:](&v13, sel_initWithDictionary_bundle_, v6, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    dictionary = v7->_dictionary;
    v7->_dictionary = (NSDictionary *)v8;

    +[PKSecureElement primarySecureElementIdentifier](PKSecureElement, "primarySecureElementIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass updateDevicePaymentApplicationsWithSecureElementIdentifiers:](v7, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v11);

  }
  return v7;
}

- (id)devicePrimaryPaymentApplication
{
  void *v2;
  void *v3;

  -[PKSecureElementPass paymentApplications](self, "paymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedDescription
{
  return -[NSDictionary PKStringForKey:](self->_dictionary, "PKStringForKey:", CFSTR("description"));
}

- (id)primaryAccountNumberSuffix
{
  return CFSTR("1234");
}

- (id)primaryAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PKSecureElementPass paymentApplications](self, "paymentApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SimulatedIdentifier: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end

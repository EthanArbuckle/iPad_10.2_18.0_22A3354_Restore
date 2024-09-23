@implementation PKAccountServicePaymentMethod

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePaymentMethod)initWithBankAccountInformation:(id)a3 peerPaymentBalance:(id)a4 deviceSupportsPeerPaymentAccountPayment:(BOOL)a5 selectedMethods:(unint64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  PKAccountServicePaymentMethod *v12;
  PKAccountServicePaymentMethod *v13;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountServicePaymentMethod;
  v12 = -[PKAccountServicePaymentMethod init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PKAccountServicePaymentMethod setBankAccountInformation:](v12, "setBankAccountInformation:", v10);
    -[PKAccountServicePaymentMethod setPeerPaymentBalance:](v13, "setPeerPaymentBalance:", v11);
    -[PKAccountServicePaymentMethod setDeviceSupportsPeerPaymentAccountPayment:](v13, "setDeviceSupportsPeerPaymentAccountPayment:", v7);
    -[PKAccountServicePaymentMethod setSelectedMethods:](v13, "setSelectedMethods:", a6);
  }

  return v13;
}

- (PKAccountServicePaymentMethod)initWithCoder:(id)a3
{
  id v4;
  PKAccountServicePaymentMethod *v5;
  uint64_t v6;
  PKBankAccountInformation *bankAccountInformation;
  uint64_t v8;
  PKCurrencyAmount *peerPaymentBalance;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountServicePaymentMethod;
  v5 = -[PKAccountServicePaymentMethod init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankAccountInformation"));
    v6 = objc_claimAutoreleasedReturnValue();
    bankAccountInformation = v5->_bankAccountInformation;
    v5->_bankAccountInformation = (PKBankAccountInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentBalance"));
    v8 = objc_claimAutoreleasedReturnValue();
    peerPaymentBalance = v5->_peerPaymentBalance;
    v5->_peerPaymentBalance = (PKCurrencyAmount *)v8;

    v5->_deviceSupportsPeerPaymentAccountPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceSupportsPeerPaymentAccountPayment"));
    v5->_selectedMethods = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedMethod"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKAccountServicePaymentMethod bankAccountInformation](self, "bankAccountInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("bankAccountInformation"));

  -[PKAccountServicePaymentMethod peerPaymentBalance](self, "peerPaymentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("peerPaymentBalance"));

  objc_msgSend(v6, "encodeBool:forKey:", -[PKAccountServicePaymentMethod deviceSupportsPeerPaymentAccountPayment](self, "deviceSupportsPeerPaymentAccountPayment"), CFSTR("deviceSupportsPeerPaymentAccountPayment"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[PKAccountServicePaymentMethod selectedMethods](self, "selectedMethods"), CFSTR("selectedMethod"));

}

- (PKBankAccountInformation)bankAccountInformation
{
  return self->_bankAccountInformation;
}

- (void)setBankAccountInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKCurrencyAmount)peerPaymentBalance
{
  return self->_peerPaymentBalance;
}

- (void)setPeerPaymentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)deviceSupportsPeerPaymentAccountPayment
{
  return self->_deviceSupportsPeerPaymentAccountPayment;
}

- (void)setDeviceSupportsPeerPaymentAccountPayment:(BOOL)a3
{
  self->_deviceSupportsPeerPaymentAccountPayment = a3;
}

- (unint64_t)selectedMethods
{
  return self->_selectedMethods;
}

- (void)setSelectedMethods:(unint64_t)a3
{
  self->_selectedMethods = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
  objc_storeStrong((id *)&self->_bankAccountInformation, 0);
}

@end

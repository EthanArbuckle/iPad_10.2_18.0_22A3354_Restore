@implementation PKBusinessChatInstallmentPaymentContext

- (PKBusinessChatInstallmentPaymentContext)initWithAccount:(id)a3 paymentPass:(id)a4
{
  id v7;
  id v8;
  PKBusinessChatInstallmentPaymentContext *v9;
  PKBusinessChatInstallmentPaymentContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKBusinessChatInstallmentPaymentContext;
  v9 = -[PKBusinessChatInstallmentPaymentContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_paymentPass, a4);
  }

  return v10;
}

- (id)businessIdentifier
{
  return (id)-[PKPaymentPass businessChatIdentifier](self->_paymentPass, "businessChatIdentifier");
}

- (id)intentParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("wallet_installments_payment"), CFSTR("targetDialog"));
  -[PKPaymentPass uniqueID](self->_paymentPass, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("passUniqueId"));

  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_paymentPass, "associatedAccountServiceAccountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountID"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)groupParameters
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("domain");
  v3[1] = CFSTR("origin");
  v4[0] = CFSTR("apple_pay");
  v4[1] = CFSTR("Wallet");
  v3[2] = CFSTR("page");
  v4[2] = CFSTR("wallet::installments::payment");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  return (id)PKLocalizedBeekmanString(CFSTR("BILL_PAYMENT_MULTI_INSTALLMENT_PAYMENT_BUSINESS_CHAT_GENERIC"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end

@implementation PKPeerPaymentBankAccountInformation

- (PKPeerPaymentBankAccountInformation)init
{
  PKPeerPaymentBankAccountInformation *v2;
  PKPeerPaymentBankAccountInformation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentBankAccountInformation;
  v2 = -[PKBankAccountInformation init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKPeerPaymentBankAccountInformation updateToLatestKeychainData](v2, "updateToLatestKeychainData");
  return v3;
}

- (void)deleteAllBankInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentBankAccountInformation;
  -[PKBankAccountInformation deleteAllBankInformation](&v4, sel_deleteAllBankInformation);
  -[PKPeerPaymentBankAccountInformation _wrapperWithType:](self, "_wrapperWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetKeychainItem");

}

- (void)deleteAllLocalBankInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentBankAccountInformation;
  -[PKBankAccountInformation deleteAllLocalBankInformation](&v4, sel_deleteAllLocalBankInformation);
  -[PKPeerPaymentBankAccountInformation _wrapperWithType:](self, "_wrapperWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetLocalKeychainItem");

}

- (void)updateToLatestKeychainData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  -[PKPeerPaymentBankAccountInformation _bankAccountInformationInKeychain](self, "_bankAccountInformationInKeychain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bankName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentBankAccountInformation;
  -[PKBankAccountInformation setBankName:](&v11, sel_setBankName_, v4);

  objc_msgSend(v3, "accountNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentBankAccountInformation;
  -[PKBankAccountInformation setAccountNumber:](&v10, sel_setAccountNumber_, v5);

  objc_msgSend(v3, "routingNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentBankAccountInformation;
  -[PKBankAccountInformation setRoutingNumber:](&v9, sel_setRoutingNumber_, v6);

  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentBankAccountInformation;
  -[PKBankAccountInformation setIdentifier:](&v8, sel_setIdentifier_, v7);

}

- (id)_wrapperWithType:(unint64_t)a3
{
  PKKeychainItemWrapper *v3;

  v3 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:]([PKKeychainItemWrapper alloc], "initWithIdentifier:accessGroup:serviceName:type:invisible:", CFSTR("PKPeerPaymentUnitedStatesBankAccountInformationKeychainKey"), CFSTR("com.apple.Passbook.PeerPayment"), CFSTR("com.apple.passkit"), a3, 0);
  -[PKKeychainItemWrapper setLabel:](v3, "setLabel:", CFSTR("com.apple.passkit"));
  return v3;
}

- (void)_writeBankAccountInformationToKeychain
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  -[PKPeerPaymentBankAccountInformation _wrapperWithType:](self, "_wrapperWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, *MEMORY[0x1E0CD70D8]);

  if (v4)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error writing bank account information to keychain: %@", buf, 0xCu);
    }

  }
}

- (id)_bankAccountInformationInKeychain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  -[PKPeerPaymentBankAccountInformation _wrapperWithType:](self, "_wrapperWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CD70D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, 0);
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with keychain data.", v10, 2u);
    }

    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), *MEMORY[0x1E0CB2CD0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");
LABEL_11:

  return v7;
}

- (void)setBankName:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[PKBankAccountInformation bankName](self, "bankName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPeerPaymentBankAccountInformation;
    -[PKBankAccountInformation setBankName:](&v7, sel_setBankName_, v4);
    -[PKPeerPaymentBankAccountInformation _writeBankAccountInformationToKeychain](self, "_writeBankAccountInformationToKeychain");
  }

}

- (void)setAccountNumber:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[PKBankAccountInformation accountNumber](self, "accountNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPeerPaymentBankAccountInformation;
    -[PKBankAccountInformation setAccountNumber:](&v7, sel_setAccountNumber_, v4);
    -[PKPeerPaymentBankAccountInformation _writeBankAccountInformationToKeychain](self, "_writeBankAccountInformationToKeychain");
  }

}

- (void)setRoutingNumber:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[PKBankAccountInformation routingNumber](self, "routingNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPeerPaymentBankAccountInformation;
    -[PKBankAccountInformation setRoutingNumber:](&v7, sel_setRoutingNumber_, v4);
    -[PKPeerPaymentBankAccountInformation _writeBankAccountInformationToKeychain](self, "_writeBankAccountInformationToKeychain");
  }

}

- (void)setIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[PKBankAccountInformation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPeerPaymentBankAccountInformation;
    -[PKBankAccountInformation setIdentifier:](&v7, sel_setIdentifier_, v4);
    -[PKPeerPaymentBankAccountInformation _writeBankAccountInformationToKeychain](self, "_writeBankAccountInformationToKeychain");
  }

}

@end

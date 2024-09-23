@implementation RTWalletManagerNotificationPaymentUsed

- (RTWalletManagerNotificationPaymentUsed)initWithPassIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTWalletManagerNotificationPaymentUsed *v11;
  uint64_t v12;
  NSString *passIdentifier;
  uint64_t v14;
  NSString *transactionIdentifier;
  uint64_t v16;
  NSDate *date;
  uint64_t v18;
  CLLocation *location;
  uint64_t v20;
  NSNumber *muid;
  uint64_t v22;
  NSNumber *provider;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)RTWalletManagerNotificationPaymentUsed;
  v11 = -[RTNotification init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    passIdentifier = v11->_passIdentifier;
    v11->_passIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    transactionIdentifier = v11->_transactionIdentifier;
    v11->_transactionIdentifier = (NSString *)v14;

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6BB90]);
    v16 = objc_claimAutoreleasedReturnValue();
    date = v11->_date;
    v11->_date = (NSDate *)v16;

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6BBA0]);
    v18 = objc_claimAutoreleasedReturnValue();
    location = v11->_location;
    v11->_location = (CLLocation *)v18;

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6BB88]);
    v20 = objc_claimAutoreleasedReturnValue();
    muid = v11->_muid;
    v11->_muid = (NSNumber *)v20;

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6BB98]);
    v22 = objc_claimAutoreleasedReturnValue();
    provider = v11->_provider;
    v11->_provider = (NSNumber *)v22;

  }
  return v11;
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSNumber)muid
{
  return self->_muid;
}

- (NSNumber)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

@end

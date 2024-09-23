@implementation PKPaymentAvailableDevicesResponseCardItem

- (PKPaymentAvailableDevicesResponseCardItem)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentAvailableDevicesResponseCardItem *v5;
  PKPaymentAvailableDevicesResponseCardItem *v6;
  uint64_t v7;
  NSString *cardType;
  uint64_t v9;
  NSNumber *cardTypeCode;
  uint64_t v11;
  NSString *currentStatus;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentAvailableDevicesResponseCardItem;
  v5 = -[PKPaymentAvailableDevicesResponseCardItem init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardType"));
      v7 = objc_claimAutoreleasedReturnValue();
      cardType = v6->_cardType;
      v6->_cardType = (NSString *)v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cardTypeCode"));
      v9 = objc_claimAutoreleasedReturnValue();
      cardTypeCode = v6->_cardTypeCode;
      v6->_cardTypeCode = (NSNumber *)v9;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentStatus"));
      v11 = objc_claimAutoreleasedReturnValue();
      currentStatus = v6->_currentStatus;
      v6->_currentStatus = (NSString *)v11;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportsInApp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_supportsInApp = objc_msgSend(v13, "BOOLValue");
    }
    else
    {
      v13 = v5;
      v6 = 0;
    }

  }
  return v6;
}

- (NSString)cardType
{
  return self->_cardType;
}

- (void)setCardType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)cardTypeCode
{
  return self->_cardTypeCode;
}

- (void)setCardTypeCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)supportsInApp
{
  return self->_supportsInApp;
}

- (void)setSupportsInApp:(BOOL)a3
{
  self->_supportsInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_storeStrong((id *)&self->_cardTypeCode, 0);
  objc_storeStrong((id *)&self->_cardType, 0);
}

@end

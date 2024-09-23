@implementation PKSuicaPassProperties

+ (PKSuicaPassProperties)passPropertiesForPass:(PKPass *)pass
{
  PKPass *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v4 = pass;
  -[PKPass paymentPass](v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicePrimaryPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "paymentNetworkIdentifier");

  if (v7 == 103)
  {
    v8 = objc_alloc((Class)a1);
    +[PKFelicaPassProperties passPropertiesForPass:](PKFelicaPassProperties, "passPropertiesForPass:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "_initWithProperties:", v9);

  }
  else
  {
    v10 = 0;
  }

  return (PKSuicaPassProperties *)v10;
}

- (id)_initWithProperties:(id)a3
{
  id v4;
  PKSuicaPassProperties *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSuicaPassProperties;
  v5 = -[PKSuicaPassProperties init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "balance");
    v6 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "balanceAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currency");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = CFSTR("JPY");
    PKCurrencyAmountCreate(v7, &v11->isa, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStoredValuePassProperties setBalanceAmount:](v5, "setBalanceAmount:", v12);

    if (!v6)
    -[PKStoredValuePassProperties setBlocked:](v5, "setBlocked:", objc_msgSend(v4, "isBlocked"));
    objc_msgSend(v4, "enrouteTransitTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStoredValuePassProperties setEnrouteTransitTypes:](v5, "setEnrouteTransitTypes:", v13);

    v5->_greenCarTicketUsed = objc_msgSend(v4, "isGreenCarTicketUsed");
    v5->_balanceAllowedForCommute = objc_msgSend(v4, "isBalanceAllowedForCommute");
    v5->_lowBalanceGateNotificationEnabled = objc_msgSend(v4, "isLowBalanceGateNotificationEnabled");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKSuicaPassProperties;
  if (-[PKStoredValuePassProperties isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (unsigned __int8 *)v4;
    v6 = self->_greenCarTicketUsed == v5[66]
      && self->_balanceAllowedForCommute == v5[64]
      && self->_lowBalanceGateNotificationEnabled == v5[65];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSuicaPassProperties;
  v3 = -[PKStoredValuePassProperties hash](&v7, sel_hash);
  v4 = self->_greenCarTicketUsed - v3 + 32 * v3;
  v5 = self->_balanceAllowedForCommute - v4 + 32 * v4;
  return self->_lowBalanceGateNotificationEnabled - v5 + 32 * v5;
}

+ (Class)equalityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isInShinkansenStation
{
  void *v2;
  char v3;

  -[PKStoredValuePassProperties enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("TransitTrainShinkansen"));

  return v3;
}

- (BOOL)isInStation
{
  void *v2;
  char v3;

  -[PKStoredValuePassProperties enrouteTransitTypes](self, "enrouteTransitTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Transit"));

  return v3;
}

- (BOOL)isBalanceAllowedForCommute
{
  return self->_balanceAllowedForCommute;
}

- (BOOL)isLowBalanceGateNotificationEnabled
{
  return self->_lowBalanceGateNotificationEnabled;
}

- (BOOL)isGreenCarTicketUsed
{
  return self->_greenCarTicketUsed;
}

@end

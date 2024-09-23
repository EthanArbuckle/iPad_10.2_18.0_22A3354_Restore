@implementation SUCreditCardReaderOutput

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUCreditCardReaderOutput;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_75, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_75, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUCreditCardReaderOutput;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "1", self->_cancelled);
  MEMORY[0x220763094](v3, "2", self->_cardCardholderName);
  MEMORY[0x220763094](v3, "3", self->_cardExpirationDay);
  MEMORY[0x220763094](v3, "4", self->_cardExpirationMonth);
  MEMORY[0x220763094](v3, "5", self->_cardExpirationYear);
  MEMORY[0x220763094](v3, "7", self->_cardNumber);
  MEMORY[0x220763094](v3, "8", self->_error);
  xpc_dictionary_set_BOOL(v3, "9", self->_manualEntrySelected);
  return v3;
}

- (SUCreditCardReaderOutput)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SUCreditCardReaderOutput *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *cardCardholderName;
  uint64_t v11;
  uint64_t v12;
  NSNumber *cardExpirationDay;
  uint64_t v14;
  uint64_t v15;
  NSNumber *cardExpirationMonth;
  uint64_t v17;
  uint64_t v18;
  NSNumber *cardExpirationYear;
  uint64_t v20;
  uint64_t v21;
  NSString *cardNumber;
  id v23;
  void *v24;
  uint64_t v25;
  NSError *error;
  objc_super v27;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x2207637E4](v4) == MEMORY[0x24BDACFA0])
  {
    v27.receiver = self;
    v27.super_class = (Class)SUCreditCardReaderOutput;
    v6 = -[SUScriptObject init](&v27, sel_init);
    if (v6)
    {
      v6->_cancelled = xpc_dictionary_get_BOOL(v5, "1");
      v8 = objc_opt_class();
      v9 = MEMORY[0x220763088](v5, "2", v8);
      cardCardholderName = v6->_cardCardholderName;
      v6->_cardCardholderName = (NSString *)v9;

      v11 = objc_opt_class();
      v12 = MEMORY[0x220763088](v5, "3", v11);
      cardExpirationDay = v6->_cardExpirationDay;
      v6->_cardExpirationDay = (NSNumber *)v12;

      v14 = objc_opt_class();
      v15 = MEMORY[0x220763088](v5, "4", v14);
      cardExpirationMonth = v6->_cardExpirationMonth;
      v6->_cardExpirationMonth = (NSNumber *)v15;

      v17 = objc_opt_class();
      v18 = MEMORY[0x220763088](v5, "5", v17);
      cardExpirationYear = v6->_cardExpirationYear;
      v6->_cardExpirationYear = (NSNumber *)v18;

      v20 = objc_opt_class();
      v21 = MEMORY[0x220763088](v5, "7", v20);
      cardNumber = v6->_cardNumber;
      v6->_cardNumber = (NSString *)v21;

      v23 = objc_alloc(MEMORY[0x24BDD1540]);
      xpc_dictionary_get_value(v5, "8");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "initWithXPCEncoding:", v24);
      error = v6->_error;
      v6->_error = (NSError *)v25;

      v6->_manualEntrySelected = xpc_dictionary_get_BOOL(v5, "9");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 cancelled;
  id v5;

  cancelled = self->_cancelled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", cancelled, CFSTR("1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardCardholderName, CFSTR("2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardExpirationDay, CFSTR("3"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardExpirationMonth, CFSTR("4"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardExpirationYear, CFSTR("5"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardNumber, CFSTR("7"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("8"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_manualEntrySelected, CFSTR("9"));

}

- (SUCreditCardReaderOutput)initWithCoder:(id)a3
{
  id v4;
  SUCreditCardReaderOutput *v5;
  uint64_t v6;
  NSString *cardCardholderName;
  uint64_t v8;
  NSNumber *cardExpirationDay;
  uint64_t v10;
  NSNumber *cardExpirationMonth;
  uint64_t v12;
  NSNumber *cardExpirationYear;
  uint64_t v14;
  NSString *cardNumber;
  uint64_t v16;
  NSError *error;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUCreditCardReaderOutput;
  v5 = -[SUScriptObject init](&v19, sel_init);
  if (v5)
  {
    v5->_cancelled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("1"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("2"));
    v6 = objc_claimAutoreleasedReturnValue();
    cardCardholderName = v5->_cardCardholderName;
    v5->_cardCardholderName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("3"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardExpirationDay = v5->_cardExpirationDay;
    v5->_cardExpirationDay = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("4"));
    v10 = objc_claimAutoreleasedReturnValue();
    cardExpirationMonth = v5->_cardExpirationMonth;
    v5->_cardExpirationMonth = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("5"));
    v12 = objc_claimAutoreleasedReturnValue();
    cardExpirationYear = v5->_cardExpirationYear;
    v5->_cardExpirationYear = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("7"));
    v14 = objc_claimAutoreleasedReturnValue();
    cardNumber = v5->_cardNumber;
    v5->_cardNumber = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("8"));
    v16 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v16;

    v5->_manualEntrySelected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("9"));
  }

  return v5;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("cardNumber"), CFSTR("cardCardholderName"), CFSTR("cardCardholderName"), CFSTR("cardExpirationDay"), CFSTR("cardExpirationDay"), CFSTR("cardExpirationMonth"), CFSTR("cardExpirationMonth"), CFSTR("cardExpirationYear"), CFSTR("cardExpirationYear"), CFSTR("cardExpirationStringValue"), CFSTR("cardExpirationStringValue"), CFSTR("cancelled"), CFSTR("cancelled"), CFSTR("manualEntrySelected"), CFSTR("manualEntrySelected"), 0);
    v3 = (void *)__KeyMapping_75;
    __KeyMapping_75 = v2;

  }
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSString)cardCardholderName
{
  return self->_cardCardholderName;
}

- (void)setCardCardholderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)cardExpirationDay
{
  return self->_cardExpirationDay;
}

- (void)setCardExpirationDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)cardExpirationMonth
{
  return self->_cardExpirationMonth;
}

- (void)setCardExpirationMonth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)cardExpirationYear
{
  return self->_cardExpirationYear;
}

- (void)setCardExpirationYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)cardExpirationStringValue
{
  return self->_cardExpirationStringValue;
}

- (void)setCardExpirationStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)cardNumber
{
  return self->_cardNumber;
}

- (void)setCardNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)manualEntrySelected
{
  return self->_manualEntrySelected;
}

- (void)setManualEntrySelected:(BOOL)a3
{
  self->_manualEntrySelected = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cardNumber, 0);
  objc_storeStrong((id *)&self->_cardExpirationStringValue, 0);
  objc_storeStrong((id *)&self->_cardExpirationYear, 0);
  objc_storeStrong((id *)&self->_cardExpirationMonth, 0);
  objc_storeStrong((id *)&self->_cardExpirationDay, 0);
  objc_storeStrong((id *)&self->_cardCardholderName, 0);
}

@end

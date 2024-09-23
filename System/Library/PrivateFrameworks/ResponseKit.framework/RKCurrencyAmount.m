@implementation RKCurrencyAmount

- (RKCurrencyAmount)initWithString:(id)a3 currency:(id)a4 value:(double)a5
{
  id v9;
  id v10;
  RKCurrencyAmount *v11;
  RKCurrencyAmount *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RKCurrencyAmount;
  v11 = -[RKCurrencyAmount init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_string, a3);
    objc_storeStrong((id *)&v12->_currency, a4);
    v12->_value = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RKCurrencyAmount)initWithCoder:(id)a3
{
  id v4;
  RKCurrencyAmount *v5;
  uint64_t v6;
  NSString *string;
  uint64_t v8;
  NSString *currency;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RKCurrencyAmount;
  v5 = -[RKCurrencyAmount init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
    v6 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v8 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("value"));
    v5->_value = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *string;
  id v5;

  string = self->_string;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", string, CFSTR("string"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("value"), self->_value);

}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)currency
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end

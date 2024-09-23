@implementation PKCreditAccountRates

- (PKCreditAccountRates)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountRates *v5;
  uint64_t v6;
  NSDecimalNumber *aprForPurchases;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCreditAccountRates;
  v5 = -[PKCreditAccountRates init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("aprForPurchase"));
    v6 = objc_claimAutoreleasedReturnValue();
    aprForPurchases = v5->_aprForPurchases;
    v5->_aprForPurchases = (NSDecimalNumber *)v6;

  }
  return v5;
}

- (id)formattedAPRForPurchasesPercentageString
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v3, "setNumberStyle:", 3);
  if ((-[NSDecimalNumber pk_isIntegralNumber](self->_aprForPurchases, "pk_isIntegralNumber") & 1) == 0)
    objc_msgSend(v3, "setMinimumFractionDigits:", 2);
  objc_msgSend(v3, "stringFromNumber:", self->_aprForPurchases);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountRates)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountRates *v5;
  uint64_t v6;
  NSDecimalNumber *aprForPurchases;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCreditAccountRates;
  v5 = -[PKCreditAccountRates init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aprForPurchase"));
    v6 = objc_claimAutoreleasedReturnValue();
    aprForPurchases = v5->_aprForPurchases;
    v5->_aprForPurchases = (NSDecimalNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_aprForPurchases, CFSTR("aprForPurchase"));
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber stringValue](self->_aprForPurchases, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("aprForPurchases: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *aprForPurchases;
  NSDecimalNumber *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    aprForPurchases = self->_aprForPurchases;
    v6 = (NSDecimalNumber *)v4[1];
    if (aprForPurchases && v6)
      v7 = -[NSDecimalNumber isEqual:](aprForPurchases, "isEqual:");
    else
      v7 = aprForPurchases == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_aprForPurchases);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCreditAccountRates *v5;
  uint64_t v6;
  NSDecimalNumber *aprForPurchases;

  v5 = -[PKCreditAccountRates init](+[PKCreditAccountRates allocWithZone:](PKCreditAccountRates, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_aprForPurchases, "copyWithZone:", a3);
  aprForPurchases = v5->_aprForPurchases;
  v5->_aprForPurchases = (NSDecimalNumber *)v6;

  return v5;
}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber stringValue](self->_aprForPurchases, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("aprForPurchase"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (id)jsonString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[PKCreditAccountRates jsonDictionaryRepresentation](self, "jsonDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }

  return v7;
}

- (NSDecimalNumber)aprForPurchases
{
  return self->_aprForPurchases;
}

- (void)setAprForPurchases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aprForPurchases, 0);
}

@end

@implementation PKAutomaticReloadPaymentSummaryItem

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAutomaticReloadPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSDecimalNumber copyWithZone:](self->_thresholdAmount, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

- (PKAutomaticReloadPaymentSummaryItem)initWithCoder:(id)a3
{
  id v4;
  PKAutomaticReloadPaymentSummaryItem *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAutomaticReloadPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thresholdAmount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAutomaticReloadPaymentSummaryItem setThresholdAmount:](v5, "setThresholdAmount:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAutomaticReloadPaymentSummaryItem;
  v4 = a3;
  -[PKPaymentSummaryItem encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[PKAutomaticReloadPaymentSummaryItem thresholdAmount](self, "thresholdAmount", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("thresholdAmount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_thresholdAmount);
  v7.receiver = self;
  v7.super_class = (Class)PKAutomaticReloadPaymentSummaryItem;
  v4 = -[PKPaymentSummaryItem hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKAutomaticReloadPaymentSummaryItem *v4;
  PKAutomaticReloadPaymentSummaryItem *v5;
  BOOL v6;

  v4 = (PKAutomaticReloadPaymentSummaryItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAutomaticReloadPaymentSummaryItem isEqualToAutomaticReloadPaymentSummaryItem:](self, "isEqualToAutomaticReloadPaymentSummaryItem:", v5);

  return v6;
}

- (BOOL)isEqualToAutomaticReloadPaymentSummaryItem:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *thresholdAmount;
  NSDecimalNumber *v6;
  BOOL v7;
  char v8;

  v4 = a3;
  if (-[PKPaymentSummaryItem isEqualToPaymentSummaryItem:](self, "isEqualToPaymentSummaryItem:", v4))
  {
    thresholdAmount = self->_thresholdAmount;
    v6 = (NSDecimalNumber *)v4[7];
    if (thresholdAmount)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = thresholdAmount == v6;
    else
      v8 = -[NSDecimalNumber isEqual:](thresholdAmount, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKAutomaticReloadPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PKAutomaticReloadPaymentSummaryItem *v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKAutomaticReloadPaymentSummaryItem;
  v7 = -[PKPaymentSummaryItem initWithDictionary:error:](&v10, sel_initWithDictionary_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("thresholdAmount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_storeStrong((id *)&v7->_thresholdAmount, v8);

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSDecimalNumber *thresholdAmount;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAutomaticReloadPaymentSummaryItem;
  -[PKPaymentSummaryItem dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  thresholdAmount = self->_thresholdAmount;
  if (thresholdAmount)
  {
    -[NSDecimalNumber stringValue](thresholdAmount, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("thresholdAmount"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (NSDecimalNumber)thresholdAmount
{
  return self->_thresholdAmount;
}

- (void)setThresholdAmount:(NSDecimalNumber *)thresholdAmount
{
  objc_storeStrong((id *)&self->_thresholdAmount, thresholdAmount);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdAmount, 0);
}

@end

@implementation PKDeferredPaymentSummaryItem

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDeferredPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSDate copyWithZone:](self->_deferredDate, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

- (PKDeferredPaymentSummaryItem)initWithCoder:(id)a3
{
  id v4;
  PKDeferredPaymentSummaryItem *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDeferredPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deferredDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDeferredPaymentSummaryItem setDeferredDate:](v5, "setDeferredDate:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKDeferredPaymentSummaryItem;
  v4 = a3;
  -[PKPaymentSummaryItem encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[PKDeferredPaymentSummaryItem deferredDate](self, "deferredDate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deferredDate"));

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
  objc_msgSend(v3, "safelyAddObject:", self->_deferredDate);
  v7.receiver = self;
  v7.super_class = (Class)PKDeferredPaymentSummaryItem;
  v4 = -[PKPaymentSummaryItem hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKDeferredPaymentSummaryItem *v4;
  PKDeferredPaymentSummaryItem *v5;
  BOOL v6;

  v4 = (PKDeferredPaymentSummaryItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKDeferredPaymentSummaryItem isEqualToDeferredPaymentSummaryItem:](self, "isEqualToDeferredPaymentSummaryItem:", v5);

  return v6;
}

- (BOOL)isEqualToDeferredPaymentSummaryItem:(id)a3
{
  _QWORD *v4;
  NSDate *deferredDate;
  NSDate *v6;
  BOOL v7;
  char v8;

  v4 = a3;
  if (-[PKPaymentSummaryItem isEqualToPaymentSummaryItem:](self, "isEqualToPaymentSummaryItem:", v4))
  {
    deferredDate = self->_deferredDate;
    v6 = (NSDate *)v4[7];
    if (deferredDate)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = deferredDate == v6;
    else
      v8 = -[NSDate isEqual:](deferredDate, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKDeferredPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PKDeferredPaymentSummaryItem *v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDeferredPaymentSummaryItem;
  v7 = -[PKPaymentSummaryItem initWithDictionary:error:](&v10, sel_initWithDictionary_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKDateForKey:", CFSTR("deferredDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_storeStrong((id *)&v7->_deferredDate, v8);

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSDate *deferredDate;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDeferredPaymentSummaryItem;
  -[PKPaymentSummaryItem dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  deferredDate = self->_deferredDate;
  if (deferredDate)
  {
    PKW3CDateStringFromDate(deferredDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deferredDate"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (NSDate)deferredDate
{
  return self->_deferredDate;
}

- (void)setDeferredDate:(NSDate *)deferredDate
{
  objc_setProperty_nonatomic_copy(self, a2, deferredDate, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredDate, 0);
}

@end

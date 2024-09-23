@implementation PKRecurringPaymentSummaryItem

- (PKRecurringPaymentSummaryItem)init
{
  PKRecurringPaymentSummaryItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKRecurringPaymentSummaryItem;
  result = -[PKRecurringPaymentSummaryItem init](&v3, sel_init);
  if (result)
  {
    result->_intervalUnit = 8;
    result->_intervalCount = 1;
  }
  return result;
}

- (BOOL)intervalUnitSpecified
{
  return self->_intervalUnit != 8;
}

- (BOOL)intervalCountSpecified
{
  return self->_intervalCount != 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKRecurringPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem copyWithZone:](&v11, sel_copyWithZone_);
  v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  v9 = (void *)v5[10];
  v5[10] = v8;

  v5[8] = self->_intervalUnit;
  v5[9] = self->_intervalCount;
  return v5;
}

- (PKRecurringPaymentSummaryItem)initWithCoder:(id)a3
{
  id v4;
  PKRecurringPaymentSummaryItem *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKRecurringPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecurringPaymentSummaryItem setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecurringPaymentSummaryItem setEndDate:](v5, "setEndDate:", v7);

    -[PKRecurringPaymentSummaryItem setIntervalUnit:](v5, "setIntervalUnit:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("intervalUnit")));
    -[PKRecurringPaymentSummaryItem setIntervalCount:](v5, "setIntervalCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("intervalCount")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKRecurringPaymentSummaryItem;
  v4 = a3;
  -[PKPaymentSummaryItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[PKRecurringPaymentSummaryItem startDate](self, "startDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[PKRecurringPaymentSummaryItem endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKRecurringPaymentSummaryItem intervalUnit](self, "intervalUnit"), CFSTR("intervalUnit"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKRecurringPaymentSummaryItem intervalCount](self, "intervalCount"), CFSTR("intervalCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  v9.receiver = self;
  v9.super_class = (Class)PKRecurringPaymentSummaryItem;
  v4 = -[PKPaymentSummaryItem hash](&v9, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_intervalUnit - v5 + 32 * v5;
  v7 = self->_intervalCount - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKRecurringPaymentSummaryItem *v4;
  PKRecurringPaymentSummaryItem *v5;
  BOOL v6;

  v4 = (PKRecurringPaymentSummaryItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRecurringPaymentSummaryItem isEqualToRecurringPaymentSummaryItem:](self, "isEqualToRecurringPaymentSummaryItem:", v5);

  return v6;
}

- (BOOL)isEqualToRecurringPaymentSummaryItem:(id)a3
{
  _QWORD *v4;
  NSDate *startDate;
  NSDate *v6;
  BOOL v7;
  NSDate *endDate;
  NSDate *v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  if (!-[PKPaymentSummaryItem isEqualToPaymentSummaryItem:](self, "isEqualToPaymentSummaryItem:", v4))
    goto LABEL_20;
  startDate = self->_startDate;
  v6 = (NSDate *)v4[7];
  if (startDate)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (startDate != v6)
      goto LABEL_20;
  }
  else if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_20;
  }
  endDate = self->_endDate;
  v9 = (NSDate *)v4[10];
  if (endDate)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) != 0)
      goto LABEL_18;
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  if (endDate != v9)
    goto LABEL_20;
LABEL_18:
  if (self->_intervalUnit != v4[8])
    goto LABEL_20;
  v11 = self->_intervalCount == v4[9];
LABEL_21:

  return v11;
}

- (PKRecurringPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PKRecurringPaymentSummaryItem *v7;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKRecurringPaymentSummaryItem;
  v7 = -[PKPaymentSummaryItem initWithDictionary:error:](&v17, sel_initWithDictionary_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKDateForKey:", CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v7->_startDate;
    v7->_startDate = (NSDate *)v8;

    objc_msgSend(v6, "PKDateForKey:", CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v7->_endDate;
    v7->_endDate = (NSDate *)v10;

    v12 = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("intervalCount"));
    if (v12 >= 1)
      v7->_intervalCount = v12;
    objc_msgSend(v6, "PKStringForKey:", CFSTR("intervalUnit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = PKCalendarUnitForString(v13);
      if (v15)
        v7->_intervalUnit = v15;
    }

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSDate *startDate;
  void *v6;
  NSDate *endDate;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKRecurringPaymentSummaryItem;
  -[PKPaymentSummaryItem dictionaryRepresentation](&v13, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  startDate = self->_startDate;
  if (startDate)
  {
    PKW3CDateStringFromDate(startDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("startDate"));

  }
  endDate = self->_endDate;
  if (endDate)
  {
    PKW3CDateStringFromDate(endDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("endDate"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_intervalCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("intervalCount"));

  PKCalendarUnitString(self->_intervalUnit);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("intervalUnit"));
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(NSDate *)startDate
{
  objc_setProperty_nonatomic_copy(self, a2, startDate, 56);
}

- (NSCalendarUnit)intervalUnit
{
  return self->_intervalUnit;
}

- (void)setIntervalUnit:(NSCalendarUnit)intervalUnit
{
  self->_intervalUnit = intervalUnit;
}

- (NSInteger)intervalCount
{
  return self->_intervalCount;
}

- (void)setIntervalCount:(NSInteger)intervalCount
{
  self->_intervalCount = intervalCount;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(NSDate *)endDate
{
  objc_setProperty_nonatomic_copy(self, a2, endDate, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

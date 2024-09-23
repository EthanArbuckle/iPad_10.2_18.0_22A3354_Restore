@implementation PKPaymentSummaryItem

+ (PKPaymentSummaryItem)itemWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __objc2_class *v13;

  v4 = a3;
  if (objc_msgSend(v4, "hasRecurringPaymentSummaryItem"))
  {
    objc_msgSend(v4, "recurringPaymentSummaryItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_recurringSummaryItemWithProtobuf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (id)v6;

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "hasDeferredPaymentSummaryItem"))
  {
    objc_msgSend(v4, "deferredPaymentSummaryItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_deferredSummaryItemWithProtobuf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "hasShippingMethodSummaryItem"))
  {
    objc_msgSend(v4, "shippingMethodSummaryItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKShippingMethod shippingMethodWithProtobuf:](PKShippingMethod, "shippingMethodWithProtobuf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "hasAutomaticReloadPaymentSummaryItem"))
  {
    objc_msgSend(v4, "automaticReloadPaymentSummaryItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentSummaryItem _automaticReloadPaymentSummaryItemWithProtobuf:](PKAutomaticReloadPaymentSummaryItem, "_automaticReloadPaymentSummaryItemWithProtobuf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "hasInstantFundsOutFeeSummaryItem"))
  {
    v13 = PKInstantFundsOutFeeSummaryItem;
  }
  else if (objc_msgSend(v4, "hasDisbursementSummaryItem"))
  {
    v13 = PKDisbursementSummaryItem;
  }
  else
  {
    v13 = PKPaymentSummaryItem;
  }
  v7 = objc_alloc_init(v13);
LABEL_10:
  if (objc_msgSend(v4, "hasDecimalAmount"))
  {
    objc_msgSend(v4, "decimalAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKProtoSupportDecimalNumberFromProtobuf(v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "hasCustomPrecisionAmount"))
    {
      PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v4, "amount"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAmount:", v8);
      goto LABEL_16;
    }
    objc_msgSend(v4, "customPrecisionAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v8, "amount"), 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_msgSend(v7, "setAmount:", v9);

LABEL_16:
  objc_msgSend(v4, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabel:", v11);

  objc_msgSend(v7, "setType:", objc_msgSend(v4, "type"));
  return (PKPaymentSummaryItem *)v7;
}

- (id)summaryItemProtobuf
{
  PKProtobufPaymentSummaryItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKProtobufInstantFundsOutFeeSummaryItem *v10;

  v3 = objc_alloc_init(PKProtobufPaymentSummaryItem);
  -[PKPaymentSummaryItem amount](self, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentSummaryItem setAmount:](v3, "setAmount:", PKCurrencyDecimalToLegacyStorageInteger(v4, 0));

  -[PKPaymentSummaryItem amount](self, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DecimalToCustomPrecisionProtobuf(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentSummaryItem setCustomPrecisionAmount:](v3, "setCustomPrecisionAmount:", v6);

  -[PKPaymentSummaryItem amount](self, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKProtoSupportProtoDecimalNumberFromDecimalNumber(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentSummaryItem setDecimalAmount:](v3, "setDecimalAmount:", v8);

  -[PKPaymentSummaryItem label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentSummaryItem setLabel:](v3, "setLabel:", v9);

  -[PKProtobufPaymentSummaryItem setType:](v3, "setType:", -[PKPaymentSummaryItem type](self, "type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaymentSummaryItem _protobufRecurringSummaryItemForItem:](self, "_protobufRecurringSummaryItemForItem:", self);
    v10 = (PKProtobufInstantFundsOutFeeSummaryItem *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentSummaryItem setRecurringPaymentSummaryItem:](v3, "setRecurringPaymentSummaryItem:", v10);
LABEL_13:

    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaymentSummaryItem _protobufDeferredSummaryItemForItem:](self, "_protobufDeferredSummaryItemForItem:", self);
    v10 = (PKProtobufInstantFundsOutFeeSummaryItem *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentSummaryItem setDeferredPaymentSummaryItem:](v3, "setDeferredPaymentSummaryItem:", v10);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaymentSummaryItem shippingMethodProtobuf](self, "shippingMethodProtobuf");
    v10 = (PKProtobufInstantFundsOutFeeSummaryItem *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentSummaryItem setShippingMethodSummaryItem:](v3, "setShippingMethodSummaryItem:", v10);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaymentSummaryItem _protobufAutomaticReloadPaymentSummaryItemForItem:](self, "_protobufAutomaticReloadPaymentSummaryItemForItem:", self);
    v10 = (PKProtobufInstantFundsOutFeeSummaryItem *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentSummaryItem setAutomaticReloadPaymentSummaryItem:](v3, "setAutomaticReloadPaymentSummaryItem:", v10);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_alloc_init(PKProtobufInstantFundsOutFeeSummaryItem);
    -[PKProtobufPaymentSummaryItem setInstantFundsOutFeeSummaryItem:](v3, "setInstantFundsOutFeeSummaryItem:", v10);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_alloc_init(PKProtobufDisbursementSummaryItem);
    -[PKProtobufPaymentSummaryItem setDisbursementSummaryItem:](v3, "setDisbursementSummaryItem:", v10);
    goto LABEL_13;
  }
  return v3;
}

+ (id)_recurringSummaryItemWithProtobuf:(id)a3
{
  id v3;
  PKRecurringPaymentSummaryItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(PKRecurringPaymentSummaryItem);
  if (objc_msgSend(v3, "hasStartDate"))
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "startDate");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecurringPaymentSummaryItem setStartDate:](v4, "setStartDate:", v6);

  }
  if (objc_msgSend(v3, "hasEndDate"))
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "endDate");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecurringPaymentSummaryItem setEndDate:](v4, "setEndDate:", v8);

  }
  -[PKRecurringPaymentSummaryItem setIntervalUnit:](v4, "setIntervalUnit:", objc_msgSend(v3, "intervalUnit"));
  -[PKRecurringPaymentSummaryItem setIntervalCount:](v4, "setIntervalCount:", objc_msgSend(v3, "intervalCount"));

  return v4;
}

+ (id)_deferredSummaryItemWithProtobuf:(id)a3
{
  id v3;
  PKDeferredPaymentSummaryItem *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(PKDeferredPaymentSummaryItem);
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "deferredDate");
  v7 = v6;

  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDeferredPaymentSummaryItem setDeferredDate:](v4, "setDeferredDate:", v8);

  return v4;
}

+ (id)_automaticReloadPaymentSummaryItemWithProtobuf:(id)a3
{
  id v3;
  PKAutomaticReloadPaymentSummaryItem *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(PKAutomaticReloadPaymentSummaryItem);
  if (objc_msgSend(v3, "hasThresholdDecimalAmount"))
  {
    objc_msgSend(v3, "thresholdDecimalAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PKProtoSupportDecimalNumberFromProtobuf(v5);
  }
  else
  {
    objc_msgSend(v3, "thresholdAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v5, "amount"), 1);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutomaticReloadPaymentSummaryItem setThresholdAmount:](v4, "setThresholdAmount:", v6);

  return v4;
}

- (id)_protobufRecurringSummaryItemForItem:(id)a3
{
  id v3;
  PKProtobufRecurringPaymentSummaryItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(PKProtobufRecurringPaymentSummaryItem);
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    -[PKProtobufRecurringPaymentSummaryItem setStartDate:](v4, "setStartDate:");

  }
  objc_msgSend(v3, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    -[PKProtobufRecurringPaymentSummaryItem setEndDate:](v4, "setEndDate:");

  }
  -[PKProtobufRecurringPaymentSummaryItem setIntervalUnit:](v4, "setIntervalUnit:", objc_msgSend(v3, "intervalUnit"));
  -[PKProtobufRecurringPaymentSummaryItem setIntervalCount:](v4, "setIntervalCount:", objc_msgSend(v3, "intervalCount"));

  return v4;
}

- (id)_protobufDeferredSummaryItemForItem:(id)a3
{
  id v3;
  PKProtobufDeferredPaymentSummaryItem *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PKProtobufDeferredPaymentSummaryItem);
  objc_msgSend(v3, "deferredDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[PKProtobufDeferredPaymentSummaryItem setDeferredDate:](v4, "setDeferredDate:");

  return v4;
}

- (id)_protobufAutomaticReloadPaymentSummaryItemForItem:(id)a3
{
  id v3;
  PKProtobufAutomaticReloadPaymentSummaryItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(PKProtobufAutomaticReloadPaymentSummaryItem);
  objc_msgSend(v3, "thresholdAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DecimalToCustomPrecisionProtobuf(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAutomaticReloadPaymentSummaryItem setThresholdAmount:](v4, "setThresholdAmount:", v6);

  objc_msgSend(v3, "thresholdAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKProtoSupportProtoDecimalNumberFromDecimalNumber(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufAutomaticReloadPaymentSummaryItem setThresholdDecimalAmount:](v4, "setThresholdDecimalAmount:", v8);

  return v4;
}

+ (int64_t)version
{
  return 4;
}

+ (PKPaymentSummaryItem)summaryItemWithLabel:(NSString *)label amount:(NSDecimalNumber *)amount
{
  NSDecimalNumber *v5;
  NSString *v6;
  id v7;

  v5 = amount;
  v6 = label;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setLabel:", v6);

  objc_msgSend(v7, "setAmount:", v5);
  return (PKPaymentSummaryItem *)v7;
}

+ (PKPaymentSummaryItem)summaryItemWithLabel:(NSString *)label amount:(NSDecimalNumber *)amount type:(PKPaymentSummaryItemType)type
{
  NSDecimalNumber *v7;
  NSString *v8;
  void *v9;

  v7 = amount;
  v8 = label;
  objc_msgSend((id)objc_opt_class(), "summaryItemWithLabel:amount:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setType:", type);
  return (PKPaymentSummaryItem *)v9;
}

- (void)setAmount:(NSDecimalNumber *)amount
{
  NSDecimalNumber *v4;
  NSDecimalNumber *v5;

  PKCurrencyDecimalAmountRound(amount);
  v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v5 = self->_amount;
  self->_amount = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_localizedAmount, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  *((_BYTE *)v5 + 8) = self->_useDarkColor;
  *((_BYTE *)v5 + 9) = self->_useLargeFont;
  return v5;
}

- (PKPaymentSummaryItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSummaryItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSummaryItem;
  v5 = -[PKPaymentSummaryItem init](&v11, sel_init);
  if (v5)
  {
    PKCurrencyStorageIntegerToCurrencyDecimalWithPrecision(objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("amount")), 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSummaryItem setAmount:](v5, "setAmount:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSummaryItem setLabel:](v5, "setLabel:", v7);

    -[PKPaymentSummaryItem setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSummaryItem setLocalizedTitle:](v5, "setLocalizedTitle:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSummaryItem setLocalizedAmount:](v5, "setLocalizedAmount:", v9);

    -[PKPaymentSummaryItem setUseDarkColor:](v5, "setUseDarkColor:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useDarkColor")));
    -[PKPaymentSummaryItem setUseLargeFont:](v5, "setUseLargeFont:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLargeFont")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  void *v5;
  id v6;

  amount = self->_amount;
  v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", PKCurrencyDecimalToStorageIntegerWithPrecision(amount, 4), CFSTR("amount"));
  -[PKPaymentSummaryItem label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("label"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedAmount, CFSTR("localizedAmount"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_useDarkColor, CFSTR("useDarkColor"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_useLargeFont, CFSTR("useLargeFont"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_label);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentSummaryItem *v4;
  PKPaymentSummaryItem *v5;
  BOOL v6;

  v4 = (PKPaymentSummaryItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentSummaryItem isEqualToPaymentSummaryItem:](self, "isEqualToPaymentSummaryItem:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentSummaryItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDecimalNumber *amount;
  NSDecimalNumber *v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (self->_type != v4[4])
    goto LABEL_12;
  v6 = (void *)v4[2];
  v7 = self->_label;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_12;
  }
  amount = self->_amount;
  v12 = (NSDecimalNumber *)v5[3];
  if (amount && v12)
    v13 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
  else
    v13 = amount == v12;
LABEL_13:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSummaryItem label](self, "label");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("label: %@; "), v4);
  -[PKPaymentSummaryItem amount](self, "amount");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_msgSend(v3, "appendFormat:", CFSTR("amount: %@; "), v6);
  if (self->_type == 1)
    v8 = CFSTR("Pending");
  else
    v8 = CFSTR("Final");
  objc_msgSend(v3, "appendFormat:", CFSTR("type: %@; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (PKPaymentSummaryItem)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  PKPaymentSummaryItem *v6;
  void *v7;
  uint64_t v8;
  NSDecimalNumber *amount;
  uint64_t v10;
  NSString *label;
  void *v12;

  v5 = a3;
  v6 = -[PKPaymentSummaryItem init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("amount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      amount = v6->_amount;
      v6->_amount = (NSDecimalNumber *)v8;

    }
    objc_msgSend(v5, "PKStringForKey:", CFSTR("label"));
    v10 = objc_claimAutoreleasedReturnValue();
    label = v6->_label;
    v6->_label = (NSString *)v10;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("Pending")))
      v6->_type = 1;

  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  const __CFString *v5;
  NSString *label;
  NSDecimalNumber *amount;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  if (self->_type == 1)
    v5 = CFSTR("Pending");
  else
    v5 = CFSTR("Final");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", label, CFSTR("label"));
  amount = self->_amount;
  if (amount)
  {
    -[NSDecimalNumber stringValue](amount, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("amount"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 16);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (PKPaymentSummaryItemType)type
{
  return self->_type;
}

- (void)setType:(PKPaymentSummaryItemType)type
{
  self->_type = type;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedAmount
{
  return self->_localizedAmount;
}

- (void)setLocalizedAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)useDarkColor
{
  return self->_useDarkColor;
}

- (void)setUseDarkColor:(BOOL)a3
{
  self->_useDarkColor = a3;
}

- (BOOL)useLargeFont
{
  return self->_useLargeFont;
}

- (void)setUseLargeFont:(BOOL)a3
{
  self->_useLargeFont = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAmount, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

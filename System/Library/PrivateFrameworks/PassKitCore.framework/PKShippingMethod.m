@implementation PKShippingMethod

+ (PKShippingMethod)shippingMethodWithProtobuf:(id)a3
{
  id v3;
  PKShippingMethod *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(PKShippingMethod);
  if (objc_msgSend(v3, "hasDecimalAmount"))
  {
    objc_msgSend(v3, "decimalAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKProtoSupportDecimalNumberFromProtobuf(v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hasCustomPrecisionAmount"))
    {
      PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v3, "amount"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSummaryItem setAmount:](v4, "setAmount:", v5);
      goto LABEL_7;
    }
    objc_msgSend(v3, "customPrecisionAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v5, "amount"), 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  -[PKPaymentSummaryItem setAmount:](v4, "setAmount:", v6);

LABEL_7:
  objc_msgSend(v3, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSummaryItem setLabel:](v4, "setLabel:", v8);

  -[PKPaymentSummaryItem setType:](v4, "setType:", objc_msgSend(v3, "type"));
  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShippingMethod setIdentifier:](v4, "setIdentifier:", v9);

  objc_msgSend(v3, "detail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKShippingMethod setDetail:](v4, "setDetail:", v10);

  return v4;
}

- (id)shippingMethodProtobuf
{
  PKProtobufShippingMethod *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(PKProtobufShippingMethod);
  -[PKPaymentSummaryItem amount](self, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethod setAmount:](v3, "setAmount:", PKCurrencyDecimalToLegacyStorageInteger(v4, 0));

  -[PKPaymentSummaryItem amount](self, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DecimalToCustomPrecisionProtobuf(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethod setCustomPrecisionAmount:](v3, "setCustomPrecisionAmount:", v6);

  -[PKPaymentSummaryItem amount](self, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKProtoSupportProtoDecimalNumberFromDecimalNumber(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethod setDecimalAmount:](v3, "setDecimalAmount:", v8);

  -[PKPaymentSummaryItem label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethod setLabel:](v3, "setLabel:", v9);

  -[PKProtobufShippingMethod setType:](v3, "setType:", -[PKPaymentSummaryItem type](self, "type"));
  -[PKShippingMethod identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethod setIdentifier:](v3, "setIdentifier:", v10);

  -[PKShippingMethod detail](self, "detail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethod setDetail:](v3, "setDetail:", v11);

  return v3;
}

+ (int64_t)version
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKShippingMethod;
  v5 = -[PKPaymentSummaryItem copyWithZone:](&v13, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSString copyWithZone:](self->_detail, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[PKDateComponentsRange copyWithZone:](self->_dateComponentsRange, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  return v5;
}

- (PKShippingMethod)initWithCoder:(id)a3
{
  id v4;
  PKShippingMethod *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKShippingMethod;
  v5 = -[PKPaymentSummaryItem initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShippingMethod setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detail"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShippingMethod setDetail:](v5, "setDetail:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateComponentsRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShippingMethod setDateComponentsRange:](v5, "setDateComponentsRange:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKShippingMethod;
  v4 = a3;
  -[PKPaymentSummaryItem encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[PKShippingMethod identifier](self, "identifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[PKShippingMethod detail](self, "detail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("detail"));

  -[PKShippingMethod dateComponentsRange](self, "dateComponentsRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dateComponentsRange"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_detail);
  objc_msgSend(v3, "safelyAddObject:", self->_dateComponentsRange);
  v7.receiver = self;
  v7.super_class = (Class)PKShippingMethod;
  v4 = -[PKPaymentSummaryItem hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKShippingMethod *v4;
  PKShippingMethod *v5;
  BOOL v6;

  v4 = (PKShippingMethod *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKShippingMethod isEqualToShippingMethod:](self, "isEqualToShippingMethod:", v5);

  return v6;
}

- (BOOL)isEqualToShippingMethod:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  BOOL v13;
  BOOL v14;
  _BOOL4 v16;
  PKDateComponentsRange *dateComponentsRange;
  PKDateComponentsRange *v18;

  v4 = a3;
  if (!-[PKPaymentSummaryItem isEqualToPaymentSummaryItem:](self, "isEqualToPaymentSummaryItem:", v4))
    goto LABEL_17;
  v5 = (void *)v4[7];
  v6 = self->_identifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_16;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_17;
  }
  v11 = (void *)v4[8];
  v6 = self->_detail;
  v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_21;
  }
  v8 = v12;
  if (v6)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
LABEL_16:

LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

  if (!v16)
    goto LABEL_17;
LABEL_21:
  dateComponentsRange = self->_dateComponentsRange;
  v18 = (PKDateComponentsRange *)v4[9];
  if (dateComponentsRange && v18)
    v14 = -[PKDateComponentsRange isEqual:](dateComponentsRange, "isEqual:");
  else
    v14 = dateComponentsRange == v18;
LABEL_18:

  return v14;
}

- (PKShippingMethod)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PKShippingMethod *v7;
  uint64_t v8;
  NSString *detail;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKShippingMethod;
  v7 = -[PKPaymentSummaryItem initWithDictionary:error:](&v13, sel_initWithDictionary_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("detail"));
    v8 = objc_claimAutoreleasedReturnValue();
    detail = v7->_detail;
    v7->_detail = (NSString *)v8;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v10;

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *detail;
  NSString *identifier;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v10.receiver = self;
  v10.super_class = (Class)PKShippingMethod;
  -[PKPaymentSummaryItem dictionaryRepresentation](&v10, sel_dictionaryRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  detail = self->_detail;
  if (detail)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", detail, CFSTR("detail"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSString *)identifier
{
  objc_setProperty_nonatomic_copy(self, a2, identifier, 56);
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(NSString *)detail
{
  objc_setProperty_nonatomic_copy(self, a2, detail, 64);
}

- (PKDateComponentsRange)dateComponentsRange
{
  return self->_dateComponentsRange;
}

- (void)setDateComponentsRange:(PKDateComponentsRange *)dateComponentsRange
{
  objc_setProperty_nonatomic_copy(self, a2, dateComponentsRange, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponentsRange, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

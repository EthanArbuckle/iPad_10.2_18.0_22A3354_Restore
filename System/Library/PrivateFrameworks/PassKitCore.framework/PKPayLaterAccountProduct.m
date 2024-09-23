@implementation PKPayLaterAccountProduct

- (PKPayLaterAccountProduct)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAccountProduct *v5;
  void *v6;
  void *v7;
  PKPayLaterAccountProductDetails *v8;
  PKPayLaterAccountProductDetails *productDetails;
  void *v10;
  PKPayLaterAccountProductEligibleSpend *v11;
  PKPayLaterAccountProductEligibleSpend *eligibleSpend;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterAccountProduct;
  v5 = -[PKPayLaterAccountProduct init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("productType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_productType = objc_msgSend(v6, "isEqualToString:", CFSTR("bnpl"));

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("productDetails"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[PKPayLaterAccountProductDetails initWithDictionary:]([PKPayLaterAccountProductDetails alloc], "initWithDictionary:", v7);
      productDetails = v5->_productDetails;
      v5->_productDetails = v8;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("eligibleSpend"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[PKPayLaterAccountProductEligibleSpend initWithDictionary:]([PKPayLaterAccountProductEligibleSpend alloc], "initWithDictionary:", v10);
      eligibleSpend = v5->_eligibleSpend;
      v5->_eligibleSpend = v11;

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountProduct)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAccountProduct *v5;
  uint64_t v6;
  PKPayLaterAccountProductDetails *productDetails;
  uint64_t v8;
  PKPayLaterAccountProductEligibleSpend *eligibleSpend;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterAccountProduct;
  v5 = -[PKPayLaterAccountProduct init](&v11, sel_init);
  if (v5)
  {
    v5->_productType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productDetails"));
    v6 = objc_claimAutoreleasedReturnValue();
    productDetails = v5->_productDetails;
    v5->_productDetails = (PKPayLaterAccountProductDetails *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibleSpend"));
    v8 = objc_claimAutoreleasedReturnValue();
    eligibleSpend = v5->_eligibleSpend;
    v5->_eligibleSpend = (PKPayLaterAccountProductEligibleSpend *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t productType;
  id v5;

  productType = self->_productType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productDetails, CFSTR("productDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eligibleSpend, CFSTR("eligibleSpend"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKPayLaterAccountProductDetails *productDetails;
  PKPayLaterAccountProductDetails *v6;
  PKPayLaterAccountProductEligibleSpend *eligibleSpend;
  PKPayLaterAccountProductEligibleSpend *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  productDetails = self->_productDetails;
  v6 = (PKPayLaterAccountProductDetails *)v4[2];
  if (productDetails && v6)
  {
    if (!-[PKPayLaterAccountProductDetails isEqual:](productDetails, "isEqual:"))
      goto LABEL_12;
  }
  else if (productDetails != v6)
  {
    goto LABEL_12;
  }
  eligibleSpend = self->_eligibleSpend;
  v8 = (PKPayLaterAccountProductEligibleSpend *)v4[3];
  if (!eligibleSpend || !v8)
  {
    if (eligibleSpend == v8)
      goto LABEL_10;
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  if (!-[PKPayLaterAccountProductEligibleSpend isEqual:](eligibleSpend, "isEqual:"))
    goto LABEL_12;
LABEL_10:
  v9 = self->_productType == v4[1];
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_productDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_eligibleSpend);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_productType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_productType == 1)
    v5 = CFSTR("bnpl");
  else
    v5 = CFSTR("unknown");
  objc_msgSend(v3, "appendFormat:", CFSTR("productType: '%@'; "), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR("productDetails: '%@'; "), self->_productDetails);
  objc_msgSend(v4, "appendFormat:", CFSTR("productDetails: '%@'; "), self->_eligibleSpend);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAccountProduct *v5;
  PKPayLaterAccountProductDetails *v6;
  PKPayLaterAccountProductDetails *productDetails;
  PKPayLaterAccountProductDetails *v8;
  PKPayLaterAccountProductDetails *v9;

  v5 = -[PKPayLaterAccountProduct init](+[PKPayLaterAccountProduct allocWithZone:](PKPayLaterAccountProduct, "allocWithZone:"), "init");
  v6 = -[PKPayLaterAccountProductDetails copyWithZone:](self->_productDetails, "copyWithZone:", a3);
  productDetails = v5->_productDetails;
  v5->_productDetails = v6;

  v8 = -[PKPayLaterAccountProductEligibleSpend copyWithZone:](self->_eligibleSpend, "copyWithZone:", a3);
  v9 = v5->_productDetails;
  v5->_productDetails = v8;

  v5->_productType = self->_productType;
  return v5;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (PKPayLaterAccountProductDetails)productDetails
{
  return self->_productDetails;
}

- (void)setProductDetails:(id)a3
{
  objc_storeStrong((id *)&self->_productDetails, a3);
}

- (PKPayLaterAccountProductEligibleSpend)eligibleSpend
{
  return self->_eligibleSpend;
}

- (void)setEligibleSpend:(id)a3
{
  objc_storeStrong((id *)&self->_eligibleSpend, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleSpend, 0);
  objc_storeStrong((id *)&self->_productDetails, 0);
}

@end

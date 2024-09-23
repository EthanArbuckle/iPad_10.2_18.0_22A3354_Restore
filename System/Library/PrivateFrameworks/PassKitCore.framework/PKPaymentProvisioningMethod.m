@implementation PKPaymentProvisioningMethod

- (PKPaymentProvisioningMethod)init
{
  return -[PKPaymentProvisioningMethod initWithType:](self, "initWithType:", 0);
}

- (PKPaymentProvisioningMethod)initWithType:(unint64_t)a3
{
  PKPaymentProvisioningMethod *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethod;
  result = -[PKPaymentProvisioningMethod init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (PKPaymentProvisioningMethod)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentProvisioningMethod *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningMethod;
  v5 = -[PKPaymentProvisioningMethod init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("provisioningMethodType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentSetupProductSupportedProvisioningMethodsFromArray(v7);

  }
  return v5;
}

- (id)_inAppProvisioningURLWthScheme:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@://"), v5);
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "appendString:", v9);
      v6 = (id)v9;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_displayNameForCardType:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("credit")) & 1) != 0)
  {
    v4 = CFSTR("CARD_TYPE_CREDIT_CARD");
LABEL_9:
    PKLocalizedPaymentString(&v4->isa, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("debit")) & 1) != 0)
  {
    v4 = CFSTR("CARD_TYPE_DEBIT_CARD");
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("prepaid")) & 1) != 0)
  {
    v4 = CFSTR("CARD_TYPE_PREPAID_CARD");
    goto LABEL_9;
  }
  v5 = v3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("bankcard")))
  {
    v4 = CFSTR("CARD_TYPE_BANK_CARD");
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentProvisioningMethod _decorateDescription:](self, "_decorateDescription:", v6);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_decorateDescription:(id)a3
{
  unint64_t type;
  id v4;
  id v5;

  type = self->_type;
  v4 = a3;
  PKPaymentSupportedProvisioningMethodToString(type);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("type: '%@'; "), v5);

}

- (PKPaymentProvisioningMethod)initWithCoder:(id)a3
{
  id v4;
  PKPaymentProvisioningMethod *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningMethod;
  v5 = -[PKPaymentProvisioningMethod init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningMethodType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentSetupProductSupportedProvisioningMethodsFromArray(v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v4;
  id v5;

  type = self->_type;
  v4 = a3;
  PKPaymentSupportedProvisioningMethodToString(type);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("provisioningMethodType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentProvisioningMethod *v4;

  v4 = objc_alloc_init(PKPaymentProvisioningMethod);
  -[PKPaymentProvisioningMethod _copyInto:](self, "_copyInto:", v4);
  return v4;
}

- (void)_copyInto:(id)a3
{
  *((_QWORD *)a3 + 1) = self->_type;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end

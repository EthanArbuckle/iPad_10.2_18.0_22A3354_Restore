@implementation PKPaymentOfferDynamicContentCustomLayoutItem

- (PKPaymentOfferDynamicContentCustomLayoutItem)initWithDictionary:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  char v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  PKPaymentOfferDynamicContentCustomLayoutItem *v16;
  id *p_isa;
  PKPaymentOfferDynamicContentCustomLayoutItem *v18;
  objc_super v20;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_14;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != CFSTR("text"))
  {
    if (v5)
    {
      v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("text"));

      if ((v7 & 1) != 0)
        goto LABEL_5;
      v13 = v6;
      v14 = v13;
      if (v13 == CFSTR("divider")
        || (v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("divider")),
            v14,
            (v15 & 1) != 0))
      {

        v10 = 0;
        v11 = 0;
        v12 = 2;
        goto LABEL_10;
      }
    }

    goto LABEL_14;
  }
LABEL_5:

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("leadingText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("trailingText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails initWithDictionary:]([PKPaymentOfferDynamicContentCustomLayoutItemTextDetails alloc], "initWithDictionary:", v8);
  v11 = -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails initWithDictionary:]([PKPaymentOfferDynamicContentCustomLayoutItemTextDetails alloc], "initWithDictionary:", v9);

  if (!(v10 | v11))
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  v12 = 1;
LABEL_10:
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItem;
  v16 = -[PKPaymentOfferDynamicContentCustomLayoutItem init](&v20, sel_init);
  p_isa = (id *)&v16->super.isa;
  if (v16)
  {
    v16->_type = v12;
    objc_storeStrong((id *)&v16->_leadingText, (id)v10);
    objc_storeStrong(p_isa + 3, (id)v11);
  }
  self = p_isa;

  v18 = self;
LABEL_15:

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  type = self->_type;
  v6 = CFSTR("unknown");
  if (type == 1)
    v6 = CFSTR("text");
  if (type == 2)
    v7 = CFSTR("divider");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));
  -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails dictionaryRepresentation](self->_leadingText, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("leadingText"));

  -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails dictionaryRepresentation](self->_trailingText, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("trailingText"));

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferDynamicContentCustomLayoutItem *v4;
  PKPaymentOfferDynamicContentCustomLayoutItem *v5;
  PKPaymentOfferDynamicContentCustomLayoutItem *v6;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *leadingText;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v8;
  BOOL v9;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *trailingText;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v11;

  v4 = (PKPaymentOfferDynamicContentCustomLayoutItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        leadingText = self->_leadingText;
        v8 = v6->_leadingText;
        if (leadingText && v8)
        {
          if (!-[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails isEqual:](leadingText, "isEqual:"))
            goto LABEL_16;
        }
        else if (leadingText != v8)
        {
          goto LABEL_16;
        }
        trailingText = self->_trailingText;
        v11 = v6->_trailingText;
        if (trailingText && v11)
        {
          if (-[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails isEqual:](trailingText, "isEqual:"))
          {
LABEL_14:
            v9 = self->_type == v6->_type;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (trailingText == v11)
        {
          goto LABEL_14;
        }
LABEL_16:
        v9 = 0;
        goto LABEL_17;
      }
    }
    v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_leadingText);
  objc_msgSend(v3, "safelyAddObject:", self->_trailingText);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  type = self->_type;
  v5 = CFSTR("unknown");
  if (type == 1)
    v5 = CFSTR("text");
  if (type == 2)
    v6 = CFSTR("divider");
  else
    v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("leadingText: '%@'; "), self->_leadingText);
  objc_msgSend(v3, "appendFormat:", CFSTR("trailingText: '%@'; "), self->_trailingText);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentCustomLayoutItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContentCustomLayoutItem *v5;
  uint64_t v6;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *leadingText;
  uint64_t v8;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *trailingText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItem;
  v5 = -[PKPaymentOfferDynamicContentCustomLayoutItem init](&v11, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leadingText"));
    v6 = objc_claimAutoreleasedReturnValue();
    leadingText = v5->_leadingText;
    v5->_leadingText = (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingText"));
    v8 = objc_claimAutoreleasedReturnValue();
    trailingText = v5->_trailingText;
    v5->_trailingText = (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_leadingText, CFSTR("leadingText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trailingText, CFSTR("trailingText"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferDynamicContentCustomLayoutItem *v5;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v6;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *leadingText;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v8;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *trailingText;

  v5 = -[PKPaymentOfferDynamicContentCustomLayoutItem init](+[PKPaymentOfferDynamicContentCustomLayoutItem allocWithZone:](PKPaymentOfferDynamicContentCustomLayoutItem, "allocWithZone:"), "init");
  v6 = -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails copyWithZone:](self->_leadingText, "copyWithZone:", a3);
  leadingText = v5->_leadingText;
  v5->_leadingText = v6;

  v8 = -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails copyWithZone:](self->_trailingText, "copyWithZone:", a3);
  trailingText = v5->_trailingText;
  v5->_trailingText = v8;

  v5->_type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)leadingText
{
  return self->_leadingText;
}

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)trailingText
{
  return self->_trailingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end

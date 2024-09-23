@implementation PKPaymentOfferDynamicContentIconVariant

- (PKPaymentOfferDynamicContentIconVariant)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  PKPaymentOfferDynamicContentIconVariant *v7;
  id *p_isa;
  PKPaymentOfferDynamicContentIconVariant *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "PKURLForKey:", CFSTR("url2x"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKURLForKey:", CFSTR("url3x"));
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentOfferDynamicContentIconVariant;
    v7 = -[PKPaymentOfferDynamicContentIconVariant init](&v11, sel_init);
    p_isa = (id *)&v7->super.isa;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_url2x, (id)v5);
      objc_storeStrong(p_isa + 2, (id)v6);
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSURL absoluteString](self->_url2x, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("url2x"));

  -[NSURL absoluteString](self->_url3x, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("url3x"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)urlForScreenScale:(double)a3
{
  NSURL *v5;

  if (a3 >= 3.0)
    v5 = self->_url3x;
  else
    v5 = 0;
  if (a3 >= 2.0 && v5 == 0)
    v5 = self->_url2x;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferDynamicContentIconVariant *v4;
  PKPaymentOfferDynamicContentIconVariant *v5;
  PKPaymentOfferDynamicContentIconVariant *v6;
  NSURL *url2x;
  NSURL *v8;
  NSURL *url3x;
  NSURL *v10;
  char v11;

  v4 = (PKPaymentOfferDynamicContentIconVariant *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        url2x = self->_url2x;
        v8 = v6->_url2x;
        if (url2x && v8)
        {
          if ((-[NSURL isEqual:](url2x, "isEqual:") & 1) != 0)
          {
LABEL_7:
            url3x = self->_url3x;
            v10 = v6->_url3x;
            if (url3x && v10)
              v11 = -[NSURL isEqual:](url3x, "isEqual:");
            else
              v11 = url3x == v10;
            goto LABEL_15;
          }
        }
        else if (url2x == v8)
        {
          goto LABEL_7;
        }
        v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_url2x);
  objc_msgSend(v3, "safelyAddObject:", self->_url3x);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("url2x: '%@'; "), self->_url2x);
  objc_msgSend(v3, "appendFormat:", CFSTR("url3x: '%@'; "), self->_url3x);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentIconVariant)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContentIconVariant *v5;
  uint64_t v6;
  NSURL *url2x;
  uint64_t v8;
  NSURL *url3x;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferDynamicContentIconVariant;
  v5 = -[PKPaymentOfferDynamicContentIconVariant init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url2x"));
    v6 = objc_claimAutoreleasedReturnValue();
    url2x = v5->_url2x;
    v5->_url2x = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url3x"));
    v8 = objc_claimAutoreleasedReturnValue();
    url3x = v5->_url3x;
    v5->_url3x = (NSURL *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url2x;
  id v5;

  url2x = self->_url2x;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url2x, CFSTR("url2x"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url3x, CFSTR("url3x"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferDynamicContentIconVariant *v5;
  uint64_t v6;
  NSURL *url2x;
  uint64_t v8;
  NSURL *url3x;

  v5 = -[PKPaymentOfferDynamicContentIconVariant init](+[PKPaymentOfferDynamicContentIconVariant allocWithZone:](PKPaymentOfferDynamicContentIconVariant, "allocWithZone:"), "init");
  v6 = -[NSURL copyWithZone:](self->_url2x, "copyWithZone:", a3);
  url2x = v5->_url2x;
  v5->_url2x = (NSURL *)v6;

  v8 = -[NSURL copyWithZone:](self->_url3x, "copyWithZone:", a3);
  url3x = v5->_url3x;
  v5->_url3x = (NSURL *)v8;

  return v5;
}

- (NSURL)url2x
{
  return self->_url2x;
}

- (void)setUrl2x:(id)a3
{
  objc_storeStrong((id *)&self->_url2x, a3);
}

- (NSURL)url3x
{
  return self->_url3x;
}

- (void)setUrl3x:(id)a3
{
  objc_storeStrong((id *)&self->_url3x, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url3x, 0);
  objc_storeStrong((id *)&self->_url2x, 0);
}

@end

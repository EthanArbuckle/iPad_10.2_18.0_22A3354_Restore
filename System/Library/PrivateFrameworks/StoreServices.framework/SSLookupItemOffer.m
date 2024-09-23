@implementation SSLookupItemOffer

- (SSLookupItemOffer)initWithLookupDictionary:(id)a3
{
  SSLookupItemOffer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSLookupItemOffer;
  v4 = -[SSLookupItemOffer init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLookupItemOffer;
  -[SSLookupItemOffer dealloc](&v3, sel_dealloc);
}

- (id)actionTextForType:(id)a3
{
  id v4;
  void *v5;

  v4 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("actionText"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (void *)objc_msgSend(v4, "objectForKey:", a3);
  else
    v5 = 0;
  return v5;
}

- (NSString)buyParameters
{
  id v3;

  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("buyParams"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v3;
  v3 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("action-params"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v3;
  else
    return 0;
}

- (NSString)formattedPrice
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("priceFormatted"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSString)offerType
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSNumber)price
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("price"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSNumber *)v2;
  else
    return 0;
}

- (NSString)subscriptionType
{
  id v2;
  void *v3;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("subscription"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("type")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    return (NSString *)v3;
  }
  else
  {
    return 0;
  }
}

- (NSDictionary)lookupDictionary
{
  return self->_dictionary;
}

@end

@implementation SSVRedeemCodeItem

- (SSVRedeemCodeItem)initWithLookupItem:(id)a3
{
  id v4;
  SSVRedeemCodeItem *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *dictionary;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSVRedeemCodeItem;
  v5 = -[SSVRedeemCodeItem init](&v10, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;

    objc_msgSend(v4, "ITunesStoreIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[NSMutableDictionary setObject:forKey:](v5->_dictionary, "setObject:forKey:", v8, CFSTR("salableAdamId"));

  }
  return v5;
}

- (SSVRedeemCodeItem)initWithRedeemCodeDictionary:(id)a3
{
  id v4;
  SSVRedeemCodeItem *v5;
  void *v6;
  uint64_t v7;
  void *dictionary;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSVRedeemCodeItem;
  v5 = -[SSVRedeemCodeItem init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("salableAdamId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v4, "mutableCopy");
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSMutableDictionary *)v7;
    }
    else
    {
      dictionary = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (int64_t)itemIdentifier
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("salableAdamId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSDictionary)redeemCodeDictionary
{
  return &self->_dictionary->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end

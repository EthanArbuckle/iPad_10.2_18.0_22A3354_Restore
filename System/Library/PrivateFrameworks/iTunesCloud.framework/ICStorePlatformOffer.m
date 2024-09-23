@implementation ICStorePlatformOffer

- (ICStorePlatformOffer)initWithResponseDictionary:(id)a3
{
  id v4;
  ICStorePlatformOffer *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStorePlatformOffer;
  v5 = -[ICStorePlatformOffer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSArray)assets
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  ICStorePlatformOfferAsset *v10;
  ICStorePlatformOfferAsset *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("assets"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [ICStorePlatformOfferAsset alloc];
            v11 = -[ICStorePlatformOfferAsset initWithResponseDictionary:](v10, "initWithResponseDictionary:", v9, (_QWORD)v13);
            if (v11)
            {
              if (!v6)
                v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
              objc_msgSend(v6, "addObject:", v11);
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (NSString)buyParameters
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("buyParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("action-params"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_NSIsNSString() & 1) != 0)
    {
      v3 = v4;
    }
    else
    {

      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSString)formattedPrice
{
  void *v2;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("priceFormatted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)offerType
{
  void *v2;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSNumber)price
{
  void *v2;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("price"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSNumber *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end

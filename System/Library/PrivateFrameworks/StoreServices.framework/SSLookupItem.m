@implementation SSLookupItem

- (SSLookupItem)initWithLookupDictionary:(id)a3
{
  SSLookupItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSLookupItem;
  v4 = -[SSLookupItem init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLookupItem;
  -[SSLookupItem dealloc](&v3, sel_dealloc);
}

- (NSString)artistName
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("artistName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSArray)artwork
{
  NSArray *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SSLookupItemArtwork *v12;
  SSLookupItemArtwork *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("artwork"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = -[SSLookupItemArtwork initWithLookupDictionary:]([SSLookupItemArtwork alloc], "initWithLookupDictionary:", v11);
          if (v12)
          {
            v13 = v12;
            -[NSArray addObject:](v3, "addObject:", v12);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

- (NSString)bundleIdentifier
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("bundleId"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSArray)categoryNames
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("genreNames"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSArray *)v2;
  else
    return 0;
}

- (NSString)displayName
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("name"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (BOOL)isPOIBased
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("poiBased"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (NSString)itemKind
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("kind"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSNumber)ITunesStoreIdentifier
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("id"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
    else
      v2 = 0;
  }
  return (NSNumber *)v2;
}

- (int64_t)numberOfUserRatings
{
  id v2;
  void *v3;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("userRating"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("ratingCount"));
  else
    v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "integerValue");
  else
    return 0;
}

- (int64_t)numberOfUserRatingsForCurrentVersion
{
  id v2;
  void *v3;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("userRating"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("ratingCountCurrentVersion"));
  else
    v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "integerValue");
  else
    return 0;
}

- (NSArray)offers
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SSLookupItemOffer *v10;
  SSLookupItemOffer *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("offers"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = -[SSLookupItemOffer initWithLookupDictionary:]([SSLookupItemOffer alloc], "initWithLookupDictionary:", v9);
            if (v10)
            {
              v11 = v10;
              -[NSArray addObject:](v3, "addObject:", v10);

            }
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
  }
  return v3;
}

- (NSURL)productPageURL
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (float)userRating
{
  id v2;
  void *v3;
  float result;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("userRating"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("value"));
  else
    v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  objc_msgSend(v3, "floatValue");
  return result;
}

- (float)userRatingForCurrentVersion
{
  id v2;
  void *v3;
  float result;

  v2 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("userRating"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("valueCurrentVersion"));
  else
    v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  objc_msgSend(v3, "floatValue");
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = -[NSDictionary copy](self->_dictionary, "copy");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SSLookupItem)initWithCoder:(id)a3
{
  SSLookupItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSLookupItem;
  v4 = -[SSLookupItem init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("SSEncodingDictionary")), "copy");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionary, CFSTR("SSEncodingDictionary"));
}

- (NSDictionary)lookupDictionary
{
  return self->_dictionary;
}

@end

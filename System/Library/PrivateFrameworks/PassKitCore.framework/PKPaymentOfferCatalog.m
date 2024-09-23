@implementation PKPaymentOfferCatalog

- (PKPaymentOfferCatalog)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferCatalog *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *catalog;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentOfferCatalog;
  v5 = -[PKPaymentOfferCatalog init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentOfferCatalog"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          +[PKPaymentOfferCriteria paymentOfferCritieraWithDictionary:](PKPaymentOfferCriteria, "paymentOfferCritieraWithDictionary:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "safelyAddObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      v14 = objc_msgSend(v7, "copy");
      catalog = v5->_catalog;
      v5->_catalog = (NSArray *)v14;
    }
    else
    {
      catalog = v5->_catalog;
      v5->_catalog = 0;
    }

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  id v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_catalog, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_29);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("catalog"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

uint64_t __49__PKPaymentOfferCatalog_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferCatalog *v4;
  PKPaymentOfferCatalog *v5;
  PKPaymentOfferCatalog *v6;
  NSArray *catalog;
  NSArray *v8;
  NSDate *lastUpdated;
  NSDate *v10;
  char v11;

  v4 = (PKPaymentOfferCatalog *)a3;
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
        catalog = self->_catalog;
        v8 = v6->_catalog;
        if (catalog && v8)
        {
          if ((-[NSArray isEqual:](catalog, "isEqual:") & 1) != 0)
          {
LABEL_7:
            lastUpdated = self->_lastUpdated;
            v10 = v6->_lastUpdated;
            if (lastUpdated && v10)
              v11 = -[NSDate isEqual:](lastUpdated, "isEqual:");
            else
              v11 = lastUpdated == v10;
            goto LABEL_15;
          }
        }
        else if (catalog == v8)
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
  objc_msgSend(v3, "safelyAddObject:", self->_catalog);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("catalog: '%@'; "), self->_catalog);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferCatalog)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferCatalog *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *catalog;
  uint64_t v12;
  NSDate *lastUpdated;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOfferCatalog;
  v5 = -[PKPaymentOfferCatalog init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("catalog"));
    v10 = objc_claimAutoreleasedReturnValue();
    catalog = v5->_catalog;
    v5->_catalog = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *catalog;
  id v5;

  catalog = self->_catalog;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", catalog, CFSTR("catalog"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSArray copyWithZone:](self->_catalog, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
}

@end

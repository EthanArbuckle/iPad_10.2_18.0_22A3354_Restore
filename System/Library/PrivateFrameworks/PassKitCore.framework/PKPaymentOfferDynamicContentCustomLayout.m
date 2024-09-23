@implementation PKPaymentOfferDynamicContentCustomLayout

- (PKPaymentOfferDynamicContentCustomLayout)initWithArray:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PKPaymentOfferDynamicContentCustomLayoutItem *v11;
  PKPaymentOfferDynamicContentCustomLayout *v12;
  uint64_t v13;
  NSArray *items;
  PKPaymentOfferDynamicContentCustomLayout *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = -[PKPaymentOfferDynamicContentCustomLayoutItem initWithDictionary:]([PKPaymentOfferDynamicContentCustomLayoutItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10));
          objc_msgSend(v5, "safelyAddObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      v17.receiver = self;
      v17.super_class = (Class)PKPaymentOfferDynamicContentCustomLayout;
      v12 = -[PKPaymentOfferDynamicContentCustomLayout init](&v17, sel_init);
      if (v12)
      {
        v13 = objc_msgSend(v5, "copy");
        items = v12->_items;
        v12->_items = (NSArray *)v13;

      }
      self = v12;
      v15 = self;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_items, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_183);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("customLayout"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

uint64_t __68__PKPaymentOfferDynamicContentCustomLayout_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferDynamicContentCustomLayout *v4;
  PKPaymentOfferDynamicContentCustomLayout *v5;
  NSArray *items;
  NSArray *v7;
  char v8;

  v4 = (PKPaymentOfferDynamicContentCustomLayout *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    items = self->_items;
    v7 = v5->_items;
    if (items && v7)
      v8 = -[NSArray isEqual:](items, "isEqual:");
    else
      v8 = items == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_items);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("items: '%@'; "), self->_items);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentCustomLayout)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContentCustomLayout *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *items;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentOfferDynamicContentCustomLayout;
  v5 = -[PKPaymentOfferDynamicContentCustomLayout init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("customLayoutItem"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_items, CFSTR("customLayoutItem"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferDynamicContentCustomLayout *v5;
  uint64_t v6;
  NSArray *items;

  v5 = -[PKPaymentOfferDynamicContentCustomLayout init](+[PKPaymentOfferDynamicContentCustomLayout allocWithZone:](PKPaymentOfferDynamicContentCustomLayout, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end

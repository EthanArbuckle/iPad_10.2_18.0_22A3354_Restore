@implementation PKDigitalIssuanceServiceProviderProduct

- (PKDigitalIssuanceServiceProviderProduct)initWithDictionary:(id)a3
{
  id v4;
  PKDigitalIssuanceServiceProviderProduct *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *localizedDisplayName;
  uint64_t v11;
  NSString *localizedDescription;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  PKDigitalIssuanceServiceProviderItem *v21;
  PKDigitalIssuanceServiceProviderItem *v22;
  uint64_t v23;
  NSArray *items;
  PKDigitalIssuanceServiceProviderProduct *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v31.receiver = self;
    v31.super_class = (Class)PKDigitalIssuanceServiceProviderProduct;
    v5 = -[PKDigitalIssuanceServiceProviderProduct init](&v31, sel_init);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v7;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDisplayName"));
      v9 = objc_claimAutoreleasedReturnValue();
      localizedDisplayName = v5->_localizedDisplayName;
      v5->_localizedDisplayName = (NSString *)v9;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
      v11 = objc_claimAutoreleasedReturnValue();
      localizedDescription = v5->_localizedDescription;
      v5->_localizedDescription = (NSString *)v11;

      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("items"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            v21 = [PKDigitalIssuanceServiceProviderItem alloc];
            v22 = -[PKDigitalIssuanceServiceProviderItem initWithDictionary:](v21, "initWithDictionary:", v20, (_QWORD)v27);
            objc_msgSend(v14, "safelyAddObject:", v22);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v17);
      }

      v23 = objc_msgSend(v14, "copy");
      items = v5->_items;
      v5->_items = (NSArray *)v23;

    }
    self = v5;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

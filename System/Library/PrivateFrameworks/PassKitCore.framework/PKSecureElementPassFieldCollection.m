@implementation PKSecureElementPassFieldCollection

- (PKSecureElementPassFieldCollection)initWithPassDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKSecureElementPassField *v14;
  PKSecureElementPassFieldCollection *v15;
  void *v18;
  id obj;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v34[0] = CFSTR("balanceFields");
  v34[1] = CFSTR("commutePlans");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(v3, "PKDictionaryForKey:", CFSTR("paymentCard"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v5);
        objc_msgSend(v22, "PKArrayContaining:forKey:", objc_opt_class(), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v9 = v7;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v25;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v25 != v12)
                  objc_enumerationMutation(v9);
                v14 = -[PKSecureElementPassField initWithPaymentPassFieldDictionary:]([PKSecureElementPassField alloc], "initWithPaymentPassFieldDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13));
                objc_msgSend(v8, "safelyAddObject:", v14);

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v11);
          }

          objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, v6);
        }

        ++v5;
      }
      while (v5 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  v15 = -[PKSecureElementPassFieldCollection initWithFieldsDictionary:](self, "initWithFieldsDictionary:", v20);
  return v15;
}

- (PKSecureElementPassFieldCollection)initWithFieldsDictionary:(id)a3
{
  id v4;
  PKSecureElementPassFieldCollection *v5;
  uint64_t v6;
  NSDictionary *fieldsDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSecureElementPassFieldCollection;
  v5 = -[PKSecureElementPassFieldCollection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    fieldsDictionary = v5->_fieldsDictionary;
    v5->_fieldsDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (PKSecureElementPassFieldCollection)initWithBalanceFieldsFromPass:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  PKSecureElementPassFieldCollection *v8;

  objc_msgSend(a3, "balanceFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_161);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("balanceFields"));
  v8 = -[PKSecureElementPassFieldCollection initWithFieldsDictionary:](self, "initWithFieldsDictionary:", v7);

  return v8;
}

PKSecureElementPassField *__68__PKSecureElementPassFieldCollection_initWithBalanceFieldsFromPass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKSecureElementPassField *v3;

  v2 = a2;
  v3 = -[PKSecureElementPassField initWithPassField:]([PKSecureElementPassField alloc], "initWithPassField:", v2);

  return v3;
}

- (NSArray)balanceFields
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_fieldsDictionary, "objectForKeyedSubscript:", CFSTR("balanceFields"));
}

- (NSArray)commutePlans
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_fieldsDictionary, "objectForKeyedSubscript:", CFSTR("commutePlans"));
}

- (NSDictionary)fieldsDictionary
{
  return self->_fieldsDictionary;
}

- (void)setFieldsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldsDictionary, 0);
}

@end

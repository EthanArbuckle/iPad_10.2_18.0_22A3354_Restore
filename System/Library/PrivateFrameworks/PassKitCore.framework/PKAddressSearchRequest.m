@implementation PKAddressSearchRequest

- (PKAddressSearchRequest)initWithFullText:(id)a3
{
  id v4;
  PKAddressSearchRequest *v5;
  PKAddressSearchRequest *v6;
  uint64_t v7;
  NSString *fragment;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSArray *keysToFetch;
  void *v13;
  uint64_t v14;
  id contactFilter;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAddressSearchRequest;
  v5 = -[PKAddressSearchRequest init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    v7 = objc_msgSend(v4, "copy");
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", v4, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    -[PKAddressSearchRequest allKeys](v6, "allKeys");
    v11 = objc_claimAutoreleasedReturnValue();
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    -[PKAddressSearchRequest _contactPropertyFilterForKey:propertyName:](v6, "_contactPropertyFilterForKey:propertyName:", *MEMORY[0x1E0C967F0], CFSTR("postalAddresses"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    contactFilter = v6->_contactFilter;
    v6->_contactFilter = (id)v14;

  }
  return v6;
}

- (PKAddressSearchRequest)initWithNameComponents:(id)a3
{
  id v4;
  PKAddressSearchRequest *v5;
  PKAddressSearchRequest *v6;
  uint64_t v7;
  NSString *fragment;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSArray *keysToFetch;
  void *v13;
  uint64_t v14;
  id contactFilter;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAddressSearchRequest;
  v5 = -[PKAddressSearchRequest init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v4, 2, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:options:", v6->_fragment, 3);
    v9 = objc_claimAutoreleasedReturnValue();
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    -[PKAddressSearchRequest allKeys](v6, "allKeys");
    v11 = objc_claimAutoreleasedReturnValue();
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    -[PKAddressSearchRequest _contactPropertyFilterForKey:propertyName:](v6, "_contactPropertyFilterForKey:propertyName:", *MEMORY[0x1E0C967F0], CFSTR("postalAddresses"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    contactFilter = v6->_contactFilter;
    v6->_contactFilter = (id)v14;

  }
  return v6;
}

- (PKAddressSearchRequest)initWithPostalAddress:(id)a3
{
  id v4;
  PKAddressSearchRequest *v5;
  PKAddressSearchRequest *v6;
  uint64_t v7;
  NSString *fragment;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSArray *keysToFetch;
  void *v13;
  void *v14;
  uint64_t v15;
  id contactFilter;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearchRequest;
  v5 = -[PKAddressSearchRequest init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v4, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPostalAddress:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    -[PKAddressSearchRequest postalAddressKeys](v6, "postalAddressKeys");
    v11 = objc_claimAutoreleasedReturnValue();
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = (void *)*MEMORY[0x1E0C967F0];
    -[PKAddressSearchRequest _contactPropertyFilterForKey:propertyName:](v6, "_contactPropertyFilterForKey:propertyName:", *MEMORY[0x1E0C967F0], CFSTR("postalAddresses"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    contactFilter = v6->_contactFilter;
    v6->_contactFilter = (id)v15;

    objc_storeStrong((id *)&v6->_outputKey, v13);
  }

  return v6;
}

- (PKAddressSearchRequest)initWithEmailAddress:(id)a3
{
  id v4;
  PKAddressSearchRequest *v5;
  PKAddressSearchRequest *v6;
  uint64_t v7;
  NSString *fragment;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSArray *keysToFetch;
  void *v13;
  void *v14;
  uint64_t v15;
  id contactFilter;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearchRequest;
  v5 = -[PKAddressSearchRequest init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 3;
    v7 = objc_msgSend(v4, "copy");
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C97200], "pk_predicateForContactsMatchingEmailAddress:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    -[PKAddressSearchRequest contactKeys](v6, "contactKeys");
    v11 = objc_claimAutoreleasedReturnValue();
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = (void *)*MEMORY[0x1E0C966A8];
    -[PKAddressSearchRequest _contactPropertyFilterForKey:propertyName:](v6, "_contactPropertyFilterForKey:propertyName:", *MEMORY[0x1E0C966A8], CFSTR("emailAddresses"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    contactFilter = v6->_contactFilter;
    v6->_contactFilter = (id)v15;

    objc_storeStrong((id *)&v6->_outputKey, v13);
  }

  return v6;
}

- (PKAddressSearchRequest)initWithPhoneNumber:(id)a3
{
  id v4;
  PKAddressSearchRequest *v5;
  PKAddressSearchRequest *v6;
  uint64_t v7;
  NSString *fragment;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSArray *keysToFetch;
  void *v13;
  void *v14;
  uint64_t v15;
  id contactFilter;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearchRequest;
  v5 = -[PKAddressSearchRequest init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 4;
    objc_msgSend(v4, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C97200], "pk_predicateForContactsMatchingPhoneNumber:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    -[PKAddressSearchRequest contactKeys](v6, "contactKeys");
    v11 = objc_claimAutoreleasedReturnValue();
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = (void *)*MEMORY[0x1E0C967C0];
    -[PKAddressSearchRequest _contactPropertyFilterForKey:propertyName:](v6, "_contactPropertyFilterForKey:propertyName:", *MEMORY[0x1E0C967C0], CFSTR("phoneNumbers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    contactFilter = v6->_contactFilter;
    v6->_contactFilter = (id)v15;

    objc_storeStrong((id *)&v6->_outputKey, v13);
  }

  return v6;
}

- (id)allKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C967C0];
  v7[0] = *MEMORY[0x1E0C966A8];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0C967B8];
  v7[2] = *MEMORY[0x1E0C967F0];
  v7[3] = v3;
  v4 = *MEMORY[0x1E0C966D0];
  v7[4] = *MEMORY[0x1E0C966C0];
  v7[5] = v4;
  v5 = *MEMORY[0x1E0C967D8];
  v7[6] = *MEMORY[0x1E0C967D0];
  v7[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)postalAddressKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C966C0];
  v6[0] = *MEMORY[0x1E0C967F0];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0C967B8];
  v6[2] = *MEMORY[0x1E0C966D0];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0C967D8];
  v6[4] = *MEMORY[0x1E0C967D0];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)contactKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C967C0];
  v6[0] = *MEMORY[0x1E0C966A8];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0C966D0];
  v6[2] = *MEMORY[0x1E0C966C0];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0C967D0];
  v6[4] = *MEMORY[0x1E0C967B8];
  v6[5] = v4;
  v6[6] = *MEMORY[0x1E0C967D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_contactPropertyFilterForKey:(id)a3 propertyName:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PKAddressSearchRequest__contactPropertyFilterForKey_propertyName___block_invoke;
  v11[3] = &unk_1E2ACEFC8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(v11);

  return v9;
}

BOOL __68__PKAddressSearchRequest__contactPropertyFilterForKey_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "isKeyAvailable:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "valueForKey:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = ((objc_opt_isKindOfClass() & 1) != 0
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void)setKeysToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_keysToFetch, a3);
}

- (id)contactFilter
{
  return self->_contactFilter;
}

- (void)setContactFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)outputKey
{
  return self->_outputKey;
}

- (void)setOutputKey:(id)a3
{
  objc_storeStrong((id *)&self->_outputKey, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)fragment
{
  return self->_fragment;
}

- (void)setFragment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_fragment, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong(&self->_contactFilter, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
}

@end

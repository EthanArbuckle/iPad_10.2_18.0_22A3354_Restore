@implementation SSKeyValueStoreSession

- (SSKeyValueStoreSession)initWithDatabase:(id)a3
{
  SSKeyValueStoreSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSKeyValueStoreSession;
  v4 = -[SSKeyValueStoreSession init](&v6, sel_init);
  if (v4)
    v4->_database = (SSSQLiteDatabase *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSKeyValueStoreSession;
  -[SSKeyValueStoreSession dealloc](&v3, sel_dealloc);
}

- (id)copyAccountDictionaryForDomain:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountAvailableServiceTypes"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("AccountAvailableServiceTypes"));

  }
  v8 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountURLBagType"));
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("AccountURLBagType"));

  }
  v10 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AltDSID"));
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("AltDSID"));

  }
  v12 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AppleID"));
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("AppleID"));

  }
  v14 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountServiceTypes"));
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("AccountServiceTypes"));

  }
  v16 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountIsNewCustomer"));
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("AccountIsNewCustomer"));

  }
  v18 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountSocialEnabled"));
  if (v18)
  {
    v19 = v18;
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("AccountSocialEnabled"));

  }
  v20 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountKind"));
  if (v20)
  {
    v21 = v20;
    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("AccountKind"));

  }
  v22 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountSource"));
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("AccountSource"));

  }
  v24 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountStoreFront"));
  if (v24)
  {
    v25 = v24;
    objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("AccountStoreFront"));

  }
  v26 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("CreditDisplayString"));
  if (v26)
  {
    v27 = v26;
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("CreditDisplayString"));

  }
  v28 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("DidFallbackToPassword"));
  if (v28)
  {
    v29 = v28;
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("DidFallbackToPassword"));

  }
  v30 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("DSPersonID"));
  if (v30)
  {
    v31 = v30;
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("DSPersonID"));

  }
  v32 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("UserName"));
  if (v32)
  {
    v33 = v32;
    objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("UserName"));

  }
  v34 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountITunesPassSerial"));
  if (v34)
  {
    v35 = v34;
    objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("AccountITunesPassSerial"));

  }
  v36 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("FirstName"));
  if (v36)
  {
    v37 = v36;
    objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("FirstName"));

  }
  v38 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("LastName"));
  if (v38)
  {
    v39 = v38;
    objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("LastName"));

  }
  v40 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountFreeDownloadsPasswordSetting"));
  if (v40)
  {
    v41 = v40;
    objc_msgSend(v5, "setObject:forKey:", v40, CFSTR("AccountFreeDownloadsPasswordSetting"));

  }
  v42 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountPaidPurchasesPasswordSetting"));
  if (v42)
  {
    v43 = v42;
    objc_msgSend(v5, "setObject:forKey:", v42, CFSTR("AccountPaidPurchasesPasswordSetting"));

  }
  v44 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", a3, CFSTR("AccountIsManagedAppleID"));
  if (v44)
  {
    v45 = v44;
    objc_msgSend(v5, "setObject:forKey:", v44, CFSTR("AccountIsManagedAppleID"));

  }
  return v5;
}

- (id)copyDataForDomain:(id)a3 key:(id)a4
{
  SSSQLiteComparisonPredicate *v6;
  SSSQLiteComparisonPredicate *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__57;
  v16 = __Block_byref_object_dispose__57;
  v17 = 0;
  v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("domain"), a3);
  v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("key"), a4);
  v8 = +[SSSQLiteEntity queryWithDatabase:predicate:](SSKeyValueStoreValueEntity, "queryWithDatabase:predicate:", -[SSKeyValueStoreSession database](self, "database"), +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, v7, 0)));
  v18[0] = CFSTR("value");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__SSKeyValueStoreSession_copyDataForDomain_key___block_invoke;
  v11[3] = &unk_1E47BE8F0;
  v11[4] = &v12;
  objc_msgSend(v8, "enumeratePersistentIDsAndProperties:count:usingBlock:", v18, 1, v11);
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

id __48__SSKeyValueStoreSession_copyDataForDomain_key___block_invoke(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, _BYTE *a5)
{
  id result;

  result = *a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)copyValueForDomain:(id)a3 key:(id)a4
{
  id result;
  id v5;
  id v6;

  result = -[SSKeyValueStoreSession copyDataForDomain:key:](self, "copyDataForDomain:key:", a3, a4);
  if (result)
  {
    v5 = result;
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", result, 0, 0, 0);

    return v6;
  }
  return result;
}

- (id)existingEntityForDomain:(id)a3 key:(id)a4
{
  SSSQLiteComparisonPredicate *v6;
  SSSQLiteComparisonPredicate *v7;

  v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("domain"), a3);
  v7 = +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("key"), a4);
  return +[SSSQLiteEntity anyInDatabase:predicate:](SSKeyValueStoreValueEntity, "anyInDatabase:predicate:", -[SSKeyValueStoreSession database](self, "database"), +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:](SSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, v7, 0)));
}

- (id)iTunesValueForKey:(id)a3 usedDomain:(id *)a4
{
  __CFString *v7;
  id v8;

  v7 = CFSTR("com.apple.itunesstored");
  v8 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", CFSTR("com.apple.itunesstored"), a3);
  if (!v8)
  {
    v7 = CFSTR("com.apple.mobile.iTunes.store");
    v8 = -[SSKeyValueStoreSession copyValueForDomain:key:](self, "copyValueForDomain:key:", CFSTR("com.apple.mobile.iTunes.store"), a3);
  }
  if (a4 && v8)
    *a4 = v7;
  return v8;
}

- (SSSQLiteDatabase)database
{
  return self->_database;
}

@end

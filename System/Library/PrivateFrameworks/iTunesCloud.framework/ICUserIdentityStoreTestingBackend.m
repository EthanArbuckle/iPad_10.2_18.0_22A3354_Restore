@implementation ICUserIdentityStoreTestingBackend

- (ICUserIdentityStoreTestingBackend)init
{
  ICUserIdentityStoreTestingBackend *v2;
  ICUserIdentityStoreTestingBackend *v3;
  ICMutableLocalStoreAccountProperties *v4;
  uint64_t v5;
  ICLocalStoreAccountProperties *localStoreAccountProperties;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICUserIdentityStoreTestingBackend;
  v2 = -[ICUserIdentityStoreTestingBackend init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_activeAccountDSID, (id)sDefaultActiveAccountDSID);
    objc_storeStrong((id *)&v3->_activeLockerAccountDSID, (id)sDefaultActiveLockerAccountDSID);
    v4 = objc_alloc_init(ICMutableLocalStoreAccountProperties);
    -[ICMutableLocalStoreAccountProperties setStorefrontIdentifier:](v4, "setStorefrontIdentifier:", sDefaultStorefrontIdentifier);
    v5 = -[ICMutableLocalStoreAccountProperties copy](v4, "copy");
    localStoreAccountProperties = v3->_localStoreAccountProperties;
    v3->_localStoreAccountProperties = (ICLocalStoreAccountProperties *)v5;

  }
  return v3;
}

- (id)activeAccountDSIDWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return self->_activeAccountDSID;
}

- (BOOL)updateActiveAccountDSID:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&self->_activeAccountDSID, a3);
  if (a4)
    *a4 = 0;
  return 1;
}

- (id)activeLockerAccountDSIDWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return self->_activeLockerAccountDSID;
}

- (BOOL)updateActiveLockerAccountDSID:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&self->_activeLockerAccountDSID, a3);
  if (a4)
    *a4 = 0;
  return 1;
}

- (BOOL)disableLockerAccountDSID:(id)a3 error:(id *)a4
{
  id v6;
  NSNumber *activeLockerAccountDSID;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v6 = a3;
  if (-[NSNumber isEqualToNumber:](self->_activeLockerAccountDSID, "isEqualToNumber:", v6))
  {
    activeLockerAccountDSID = self->_activeLockerAccountDSID;
    self->_activeLockerAccountDSID = 0;

  }
  v14 = 0;
  -[ICUserIdentityStoreTestingBackend identityPropertiesForDSID:error:](self, "identityPropertiesForDSID:error:", v6, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v10 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v10)
  {
    objc_msgSend(v10, "setActiveLocker:", 0);
    v13 = v9;
    -[ICUserIdentityStoreTestingBackend setIdentityProperties:forDSID:error:](self, "setIdentityProperties:forDSID:error:", v10, v6, &v13);
    v11 = v13;

    v9 = v11;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return 1;
}

- (id)identityPropertiesForDSID:(id)a3 error:(id *)a4
{
  id result;

  result = (id)-[NSMutableDictionary objectForKey:](self->_identityProperties, "objectForKey:", a3);
  if (a4)
    *a4 = 0;
  return result;
}

- (BOOL)setIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *identityProperties;
  void *v12;

  v8 = a3;
  v9 = a4;
  if (!self->_identityProperties)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identityProperties = self->_identityProperties;
    self->_identityProperties = v10;

  }
  -[ICUserIdentityStoreTestingBackend _propertiesToSaveForProperties:](self, "_propertiesToSaveForProperties:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_identityProperties, "setObject:forKey:", v12, v9);
  if (a5)
    *a5 = 0;

  return 1;
}

- (id)identityPropertiesForPrimaryICloudAccountWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return 0;
}

- (void)removeIdentityForDSID:(id)a3 completion:(id)a4
{
  void (**v6)(id, BOOL, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, BOOL, _QWORD))a4;
  -[NSMutableDictionary objectForKey:](self->_identityProperties, "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[NSMutableDictionary removeObjectForKey:](self->_identityProperties, "removeObjectForKey:", v8);
  if (v6)
    v6[2](v6, v7 != 0, 0);

}

- (BOOL)replaceIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKey:](self->_identityProperties, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICUserIdentityStoreTestingBackend _propertiesToSaveForProperties:](self, "_propertiesToSaveForProperties:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_identityProperties, "setObject:forKey:", v11, v9);

  }
  if (a5)
    *a5 = 0;

  return v10 != 0;
}

- (id)verificationContextForAccountEstablishmentWithError:(id *)a3
{
  ICUserVerificationContext *v4;
  ICUserIdentityProperties *v5;

  v4 = objc_alloc_init(ICUserVerificationContext);
  v5 = objc_alloc_init(ICUserIdentityProperties);
  -[ICUserVerificationContext setIdentityProperties:](v4, "setIdentityProperties:", v5);
  if (a3)
    *a3 = 0;

  return v4;
}

- (id)verificationContextForDSID:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  ICUserVerificationContext *v7;
  BOOL v8;
  id v10;

  v10 = 0;
  -[ICUserIdentityStoreTestingBackend identityPropertiesForDSID:error:](self, "identityPropertiesForDSID:error:", a3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = 0;
  if (v6)
    v8 = 1;
  else
    v8 = v5 == 0;
  if (!v8)
  {
    v7 = objc_alloc_init(ICUserVerificationContext);
    -[ICUserVerificationContext setIdentityProperties:](v7, "setIdentityProperties:", v5);
  }
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v7;
}

- (id)localStoreAccountPropertiesWithError:(id *)a3
{
  return self->_localStoreAccountProperties;
}

- (BOOL)setLocalStoreAccountProperties:(id)a3 error:(id *)a4
{
  ICLocalStoreAccountProperties *v6;
  ICLocalStoreAccountProperties *localStoreAccountProperties;

  v6 = (ICLocalStoreAccountProperties *)objc_msgSend(a3, "copy");
  localStoreAccountProperties = self->_localStoreAccountProperties;
  self->_localStoreAccountProperties = v6;

  if (a4)
    *a4 = 0;
  return 1;
}

- (id)allStoreAccountDSIDsWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSNumber unsignedLongLongValue](self->_activeAccountDSID, "unsignedLongLongValue"))
    objc_msgSend(v5, "addObject:", self->_activeAccountDSID);
  if (a3)
    *a3 = 0;
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSNumber copyWithZone:](self->_activeAccountDSID, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSNumber copyWithZone:](self->_activeLockerAccountDSID, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSMutableDictionary mutableCopyWithZone:](self->_identityProperties, "mutableCopyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[ICLocalStoreAccountProperties copyWithZone:](self->_localStoreAccountProperties, "copyWithZone:", a3);
    v13 = (void *)v5[4];
    v5[4] = v12;

  }
  return v5;
}

- (ICUserIdentityStoreTestingBackend)initWithCoder:(id)a3
{
  id v4;
  ICUserIdentityStoreTestingBackend *v5;
  uint64_t v6;
  NSNumber *activeAccountDSID;
  uint64_t v8;
  NSNumber *activeLockerAccountDSID;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *identityProperties;
  uint64_t v16;
  ICLocalStoreAccountProperties *localStoreAccountProperties;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICUserIdentityStoreTestingBackend;
  v5 = -[ICUserIdentityStoreTestingBackend init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    activeAccountDSID = v5->_activeAccountDSID;
    v5->_activeAccountDSID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockerDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    activeLockerAccountDSID = v5->_activeLockerAccountDSID;
    v5->_activeLockerAccountDSID = (NSNumber *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v10, "initWithObjects:", v11, v12, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("ids"));
    v14 = objc_claimAutoreleasedReturnValue();
    identityProperties = v5->_identityProperties;
    v5->_identityProperties = (NSMutableDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localStoreAccountProperties"));
    v16 = objc_claimAutoreleasedReturnValue();
    localStoreAccountProperties = v5->_localStoreAccountProperties;
    v5->_localStoreAccountProperties = (ICLocalStoreAccountProperties *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *activeAccountDSID;
  id v5;

  activeAccountDSID = self->_activeAccountDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activeAccountDSID, CFSTR("activeDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeLockerAccountDSID, CFSTR("lockerDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityProperties, CFSTR("ids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localStoreAccountProperties, CFSTR("localStoreAccountProperties"));

}

- (id)_propertiesToSaveForProperties:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "setDelegated:", 0);
  objc_msgSend(v3, "setDelegateToken:", 0);
  return v3;
}

- (ICUserIdentityStoreBackendDelegate)delegate
{
  return (ICUserIdentityStoreBackendDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStoreAccountProperties, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);
  objc_storeStrong((id *)&self->_activeLockerAccountDSID, 0);
  objc_storeStrong((id *)&self->_activeAccountDSID, 0);
}

+ (NSNumber)defaultActiveAccountDSID
{
  return (NSNumber *)(id)sDefaultActiveAccountDSID;
}

+ (void)setDefaultActiveAccountDSID:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)sDefaultActiveAccountDSID != a3)
  {
    v3 = objc_msgSend(a3, "copy");
    v4 = (void *)sDefaultActiveAccountDSID;
    sDefaultActiveAccountDSID = v3;

  }
}

+ (NSNumber)defaultActiveLockerAccountDSID
{
  return (NSNumber *)(id)sDefaultActiveLockerAccountDSID;
}

+ (void)setDefaultActiveLockerAccountDSID:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)sDefaultActiveLockerAccountDSID != a3)
  {
    v3 = objc_msgSend(a3, "copy");
    v4 = (void *)sDefaultActiveLockerAccountDSID;
    sDefaultActiveLockerAccountDSID = v3;

  }
}

+ (NSString)defaultStorefrontIdentifier
{
  return (NSString *)(id)sDefaultStorefrontIdentifier;
}

+ (void)setDefaultStorefrontIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)sDefaultStorefrontIdentifier != a3)
  {
    v3 = objc_msgSend(a3, "copy");
    v4 = (void *)sDefaultStorefrontIdentifier;
    sDefaultStorefrontIdentifier = v3;

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

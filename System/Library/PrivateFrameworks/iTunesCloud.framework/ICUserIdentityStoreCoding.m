@implementation ICUserIdentityStoreCoding

- (int64_t)identityStoreStyle
{
  return self->_identityStoreStyle;
}

- (void)encodeWithCoder:(id)a3
{
  ICValueHistory *activeAccountHistory;
  id v5;

  activeAccountHistory = self->_activeAccountHistory;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activeAccountHistory, CFSTR("accountHistory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeLockerAccountHistory, CFSTR("lockerHistory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backend, CFSTR("backend"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_delegateAccountStoreOptions, CFSTR("delegationOptions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_identityStoreStyle, CFSTR("style"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_uniqueIdentifier, CFSTR("uid"));

}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (ICValueHistory)activeLockerAccountHistory
{
  return self->_activeLockerAccountHistory;
}

- (ICValueHistory)activeAccountHistory
{
  return self->_activeAccountHistory;
}

- (void)lock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  self = (ICUserIdentityStoreCoding *)((char *)self + 8);
  os_unfair_lock_lock((os_unfair_lock_t)self);
  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)self);

}

- (ICUserIdentityStoreCoding)initWithIdentityStoreStyle:(int64_t)a3
{
  ICUserIdentityStoreCoding *v4;
  ICUserIdentityStoreCoding *v5;
  const __CFUUID *v6;

  v4 = -[ICUserIdentityStoreCoding _initCommon](self, "_initCommon");
  v5 = v4;
  if (v4)
  {
    v4->_identityStoreStyle = a3;
    v6 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v5->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v6);
    CFRelease(v6);
  }
  return v5;
}

- (ICUserIdentityStoreCoding)initWithCoder:(id)a3
{
  id v4;
  ICUserIdentityStoreCoding *v5;
  uint64_t v6;
  ICValueHistory *activeAccountHistory;
  uint64_t v8;
  ICValueHistory *activeLockerAccountHistory;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  ICUserIdentityStoreBackend *backend;
  uint64_t v15;
  ICDelegateAccountStoreOptions *delegateAccountStoreOptions;

  v4 = a3;
  v5 = -[ICUserIdentityStoreCoding _initCommon](self, "_initCommon");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountHistory"));
    v6 = objc_claimAutoreleasedReturnValue();
    activeAccountHistory = v5->_activeAccountHistory;
    v5->_activeAccountHistory = (ICValueHistory *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockerHistory"));
    v8 = objc_claimAutoreleasedReturnValue();
    activeLockerAccountHistory = v5->_activeLockerAccountHistory;
    v5->_activeLockerAccountHistory = (ICValueHistory *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("backend"));
    v13 = objc_claimAutoreleasedReturnValue();
    backend = v5->_backend;
    v5->_backend = (ICUserIdentityStoreBackend *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delegationOptions"));
    v15 = objc_claimAutoreleasedReturnValue();
    delegateAccountStoreOptions = v5->_delegateAccountStoreOptions;
    v5->_delegateAccountStoreOptions = (ICDelegateAccountStoreOptions *)v15;

    v5->_identityStoreStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v5->_uniqueIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("uid"));

  }
  return v5;
}

- (id)_initCommon
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICUserIdentityStoreCoding;
  result = -[ICUserIdentityStoreCoding init](&v3, sel_init);
  if (result)
    *((_DWORD *)result + 2) = 0;
  return result;
}

- (void)setDelegateAccountStoreOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setActiveLockerAccountHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setActiveAccountHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateAccountStoreOptions, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_activeLockerAccountHistory, 0);
  objc_storeStrong((id *)&self->_activeAccountHistory, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICUserIdentityStoreBackend)backend
{
  return self->_backend;
}

- (void)setBackend:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ICDelegateAccountStoreOptions)delegateAccountStoreOptions
{
  return self->_delegateAccountStoreOptions;
}

@end

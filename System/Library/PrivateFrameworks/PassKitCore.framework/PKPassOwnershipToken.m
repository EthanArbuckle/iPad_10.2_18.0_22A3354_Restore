@implementation PKPassOwnershipToken

- (PKPassOwnershipToken)initWithIdentifier:(id)a3
{
  id v4;
  PKPassOwnershipToken *v5;
  uint64_t v6;
  NSString *ownershipTokenIdentifier;
  PKPassOwnershipToken *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPassOwnershipToken;
    v5 = -[PKPassOwnershipToken init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      ownershipTokenIdentifier = v5->_ownershipTokenIdentifier;
      v5->_ownershipTokenIdentifier = (NSString *)v6;

      -[PKPassOwnershipToken _readFromKeychain](v5, "_readFromKeychain");
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassOwnershipToken)initWithOwnershipToken:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPassOwnershipToken *v9;
  PKPassOwnershipToken *v10;
  uint64_t v11;
  NSString *ownershipTokenIdentifier;
  uint64_t v13;
  NSString *ownershipToken;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPassOwnershipToken;
    v10 = -[PKPassOwnershipToken init](&v16, sel_init);
    if (v10)
    {
      v11 = objc_msgSend(v8, "copy");
      ownershipTokenIdentifier = v10->_ownershipTokenIdentifier;
      v10->_ownershipTokenIdentifier = (NSString *)v11;

      v13 = objc_msgSend(v6, "copy");
      ownershipToken = v10->_ownershipToken;
      v10->_ownershipToken = (NSString *)v13;

      -[PKPassOwnershipToken _writeToKeychain](v10, "_writeToKeychain");
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (NSString)ownershipToken
{
  return self->_ownershipToken;
}

- (void)setOwnershipToken:(id)a3
{
  NSString *v4;
  NSString *ownershipToken;

  if (self->_ownershipToken != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    ownershipToken = self->_ownershipToken;
    self->_ownershipToken = v4;

    -[PKPassOwnershipToken _writeToKeychain](self, "_writeToKeychain");
  }
}

+ (void)queryKeychainForOwnershipTokens:(id)a3
{
  void (**v3)(id, _QWORD, id);
  id v4;
  uint64_t v5;
  const __CFDictionary *v6;
  OSStatus v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKPassOwnershipToken *v20;
  uint64_t v21;
  NSString *ownershipTokenIdentifier;
  uint64_t v23;
  NSString *ownershipToken;
  void *v25;
  NSObject *v26;
  id v27;
  const __CFDictionary *v28;
  id v29;
  void (**v30)(id, _QWORD, id);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CFTypeRef result;
  uint8_t v36[128];
  uint8_t buf[4];
  OSStatus v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, id))a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v4, "setObject:forKey:", CFSTR("com.apple.passd.pass-ownership-token"), *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v4, "setObject:forKey:", CFSTR("com.apple.passd"), *MEMORY[0x1E0CD6898]);
  v5 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD6B80]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CD7010]);
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CD7018]);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v7 = SecItemCopyMatching(v6, &result);
  if (!v7 && result)
  {
    v28 = v6;
    v29 = v4;
    v30 = v3;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = (id)result;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      v13 = *MEMORY[0x1E0CD68F8];
      v14 = *MEMORY[0x1E0CD70D8];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKey:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17 && objc_msgSend(v18, "length"))
          {
            v20 = objc_alloc_init(PKPassOwnershipToken);
            v21 = objc_msgSend(v17, "copy");
            ownershipTokenIdentifier = v20->_ownershipTokenIdentifier;
            v20->_ownershipTokenIdentifier = (NSString *)v21;

            v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v19, 4);
            ownershipToken = v20->_ownershipToken;
            v20->_ownershipToken = (NSString *)v23;

            objc_msgSend(v8, "addObject:", v20);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    if (result)
      CFRelease(result);
    v3 = v30;
    if (v30)
    {
      v25 = (void *)objc_msgSend(v8, "copy");
      ((void (**)(id, void *, id))v30)[2](v30, v25, 0);

    }
    v6 = v28;
    v4 = v29;
    goto LABEL_22;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v38 = v7;
    _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Error fetching pass ownership tokens from Keychain: %d", buf, 8u);
  }

  if (v3)
  {
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
    v3[2](v3, 0, v8);
LABEL_22:

  }
}

+ (void)deleteAllLocalKeychainOwnershipTokens
{
  objc_msgSend(a1, "queryKeychainForOwnershipTokens:", &__block_literal_global_151);
}

void __61__PKPassOwnershipToken_deleteAllLocalKeychainOwnershipTokens__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        PKLogFacilityTypeGetObject(6uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Deleting local keychain pass ownership token %@", buf, 0xCu);
        }

        objc_msgSend(v7, "deleteTokenFromLocalKeychain");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

- (void)deleteTokenFromKeychain
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Removing pass ownership token from Keychain", v5, 2u);
  }

  -[PKPassOwnershipToken _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_ownershipTokenIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetKeychainItem");

}

- (void)deleteTokenFromLocalKeychain
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Removing pass ownership token from Local Keychain", v5, 2u);
  }

  -[PKPassOwnershipToken _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_ownershipTokenIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetLocalKeychainItem");

}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", self->_ownershipTokenIdentifier, CFSTR("ownershipTokenIdentifier"));
  objc_msgSend(v3, "setObject:forKey:", self->_ownershipToken, CFSTR("ownershipToken"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString description](self->_ownershipTokenIdentifier, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ownershipTokenIdentifier: '%@'; "), v4);

  -[NSString description](self->_ownershipToken, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ownershipToken: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (void)_writeToKeychain
{
  void *v3;
  id v4;

  -[PKPassOwnershipToken _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_ownershipTokenIdentifier);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString dataUsingEncoding:](self->_ownershipToken, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, *MEMORY[0x1E0CD70D8]);

}

- (void)_readFromKeychain
{
  void *v3;
  NSString *v4;
  NSString *ownershipToken;
  id v6;

  -[PKPassOwnershipToken _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_ownershipTokenIdentifier);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CD70D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  ownershipToken = self->_ownershipToken;
  self->_ownershipToken = v4;

}

- (id)_wrapperWithType:(unint64_t)a3 identifier:(id)a4
{
  id v5;
  PKKeychainItemWrapper *v6;

  v5 = a4;
  v6 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:]([PKKeychainItemWrapper alloc], "initWithIdentifier:accessGroup:serviceName:type:invisible:", v5, CFSTR("com.apple.passd"), CFSTR("com.apple.passd.pass-ownership-token"), a3, 1);

  -[PKKeychainItemWrapper setLabel:](v6, "setLabel:", CFSTR("com.apple.passd.pass-ownership-token"));
  return v6;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
}

@end

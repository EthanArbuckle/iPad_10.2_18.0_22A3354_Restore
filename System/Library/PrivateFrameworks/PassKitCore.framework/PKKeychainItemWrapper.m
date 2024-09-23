@implementation PKKeychainItemWrapper

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setKeychainItemData:(id)a3
{
  objc_storeStrong((id *)&self->keychainItemData, a3);
}

- (id)secItemFormatToDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[8];
  CFTypeRef result;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CD7018];
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7018]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)v3, &result))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Serious error, no matching item found in the keychain.\n", v7, 2u);
    }

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", result, *MEMORY[0x1E0CD70D8]);
  }
  objc_msgSend(v3, "removeObjectForKey:", v4);
  if (result)
    CFRelease(result);
  return v3;
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->keychainItemData, "objectForKey:", a3);
}

- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5 type:(unint64_t)a6 invisible:(BOOL)a7 accessibility:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  PKKeychainItemWrapper *v17;
  PKKeychainItemWrapper *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *genericPasswordQuery;
  const __CFDictionary *v21;
  void *v22;
  CFTypeRef result;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKKeychainItemWrapper;
  v17 = -[PKKeychainItemWrapper init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_invisible = a7;
    v17->_accessibility = a8;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    genericPasswordQuery = v18->genericPasswordQuery;
    v18->genericPasswordQuery = v19;

    -[NSMutableDictionary setObject:forKey:](v18->genericPasswordQuery, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
    -[NSMutableDictionary setObject:forKey:](v18->genericPasswordQuery, "setObject:forKey:", v14, *MEMORY[0x1E0CD68F8]);
    v18->type = a6;
    -[PKKeychainItemWrapper applySynchronizableValueToDictionary:](v18, "applySynchronizableValueToDictionary:", v18->genericPasswordQuery);
    if (v16)
      -[NSMutableDictionary setObject:forKey:](v18->genericPasswordQuery, "setObject:forKey:", v16, *MEMORY[0x1E0CD6B58]);
    if (v15)
      -[NSMutableDictionary setObject:forKey:](v18->genericPasswordQuery, "setObject:forKey:", v15, *MEMORY[0x1E0CD6898]);
    -[NSMutableDictionary setObject:forKey:](v18->genericPasswordQuery, "setObject:forKey:", *MEMORY[0x1E0CD6F40], *MEMORY[0x1E0CD6F30]);
    -[NSMutableDictionary setObject:forKey:](v18->genericPasswordQuery, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7010]);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v18->genericPasswordQuery);
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    result = 0;
    if (SecItemCopyMatching(v21, &result) || !result)
    {
      -[PKKeychainItemWrapper resetKeychainItem](v18, "resetKeychainItem");
    }
    else
    {
      -[PKKeychainItemWrapper secItemFormatToDictionary:](v18, "secItemFormatToDictionary:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKKeychainItemWrapper setKeychainItemData:](v18, "setKeychainItemData:", v22);

    }
    if (result)
      CFRelease(result);

  }
  return v18;
}

- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5 type:(unint64_t)a6 invisible:(BOOL)a7
{
  return -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:accessibility:](self, "initWithIdentifier:accessGroup:serviceName:type:invisible:accessibility:", a3, a4, a5, a6, a7, 0);
}

- (void)applySynchronizableValueToDictionary:(id)a3
{
  id v4;
  unint64_t type;
  uint64_t v6;
  void *v7;
  void **v8;
  id v9;

  v4 = a3;
  type = self->type;
  switch(type)
  {
    case 2uLL:
      v8 = (void **)MEMORY[0x1E0CD6B88];
LABEL_7:
      v7 = *v8;
      v6 = *MEMORY[0x1E0CD6B80];
      v9 = v4;
      goto LABEL_8;
    case 1uLL:
      v8 = (void **)MEMORY[0x1E0C9AE50];
      goto LABEL_7;
    case 0uLL:
      v9 = v4;
      objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD70A8]);
      objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x1E0C9AE40], *MEMORY[0x1E0CD6B80]);
      v6 = *MEMORY[0x1E0CD6B90];
      v7 = &unk_1E2C3F898;
LABEL_8:
      objc_msgSend(v9, "setObject:forKey:", v7, v6);
      v4 = v9;
      break;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->genericPasswordQuery, 0);
  objc_storeStrong((id *)&self->keychainItemData, 0);
}

- (PKKeychainItemWrapper)initWithIdentifier:(id)a3 accessGroup:(id)a4 serviceName:(id)a5
{
  return -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:](self, "initWithIdentifier:accessGroup:serviceName:type:invisible:", a3, a4, a5, 1, 0);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->keychainItemData, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->keychainItemData, "setObject:forKey:", v8, v6);
      -[PKKeychainItemWrapper writeToKeychain](self, "writeToKeychain");
    }

  }
}

- (void)resetKeychainItem
{
  -[PKKeychainItemWrapper _resetKeychainItem:](self, "_resetKeychainItem:", 0);
}

- (void)resetLocalKeychainItem
{
  -[PKKeychainItemWrapper _resetKeychainItem:](self, "_resetKeychainItem:", 1);
}

- (void)_resetKeychainItem:(BOOL)a3
{
  NSMutableDictionary *keychainItemData;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OSStatus v9;
  OSStatus v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  OSStatus v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  keychainItemData = self->keychainItemData;
  if (keychainItemData)
  {
    v5 = a3;
    if (-[NSMutableDictionary count](keychainItemData, "count"))
    {
      -[PKKeychainItemWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", self->keychainItemData);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        v8 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD6BC0]);
        objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0CD70D0]);
      }
      v9 = SecItemDelete((CFDictionaryRef)v7);
      if (v9 != -25300 && v9 != 0)
      {
        v11 = v9;
        PKLogFacilityTypeGetObject(6uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v15 = v11;
          _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Problem deleting current dictionary (%d)", buf, 8u);
        }

      }
      -[NSMutableDictionary removeAllObjects](self->keychainItemData, "removeAllObjects");

    }
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PKKeychainItemWrapper setKeychainItemData:](self, "setKeychainItemData:");

  }
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *label;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CD68F8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->genericPasswordQuery, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

  }
  v8 = *MEMORY[0x1E0CD6898];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6898]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->genericPasswordQuery, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_7;
    -[NSMutableDictionary objectForKeyedSubscript:](self->genericPasswordQuery, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v8);
  }

LABEL_7:
  v11 = *MEMORY[0x1E0CD6B58];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->genericPasswordQuery, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_11;
    -[NSMutableDictionary objectForKeyedSubscript:](self->genericPasswordQuery, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
  }

LABEL_11:
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("com.apple.wallet.default.contact");
  objc_msgSend(v4, "setObject:forKey:", label, *MEMORY[0x1E0CD6A90]);
  return v4;
}

- (void)writeToKeychain
{
  void *v3;
  const __CFDictionary *v4;
  OSStatus v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)self->genericPasswordQuery, &result))
  {
    -[PKKeychainItemWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", self->keychainItemData);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKKeychainItemWrapper applySynchronizableValueToDictionary:](self, "applySynchronizableValueToDictionary:", v3);
    -[PKKeychainItemWrapper applyAccessibilityValueToDictionary:](self, "applyAccessibilityValueToDictionary:", v3);
    -[PKKeychainItemWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", v3);
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = SecItemAdd(v4, 0);

    if (!v5)
      goto LABEL_12;
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't add the Keychain Item (%d)", buf, 8u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", result);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CD6C98];
    -[NSMutableDictionary objectForKey:](self->genericPasswordQuery, "objectForKey:", *MEMORY[0x1E0CD6C98]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, v7);

    if (!self->type)
      objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD70A8]);
    -[PKKeychainItemWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", self->keychainItemData);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v6, "removeObjectForKey:", v7);
    -[PKKeychainItemWrapper applySynchronizableValueToDictionary:](self, "applySynchronizableValueToDictionary:", v6);
    -[PKKeychainItemWrapper applyAccessibilityValueToDictionary:](self, "applyAccessibilityValueToDictionary:", v6);
    v9 = SecItemUpdate((CFDictionaryRef)v3, (CFDictionaryRef)v6);
    if (v9)
    {
      v10 = v9;
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v14 = v10;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't update the Keychain Item (%d)", buf, 8u);
      }

    }
  }

LABEL_12:
  if (result)
    CFRelease(result);
}

- (void)applyAccessibilityValueToDictionary:(id)a3
{
  _QWORD *v3;

  if (self->_accessibility == 1)
  {
    v3 = (_QWORD *)MEMORY[0x1E0CD68B0];
    if (self->type)
      v3 = (_QWORD *)MEMORY[0x1E0CD68A8];
    objc_msgSend(a3, "setObject:forKey:", *v3, *MEMORY[0x1E0CD68A0]);
  }
}

- (NSMutableDictionary)keychainItemData
{
  return self->keychainItemData;
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
  objc_storeStrong((id *)&self->genericPasswordQuery, a3);
}

- (unint64_t)type
{
  return self->type;
}

- (void)setType:(unint64_t)a3
{
  self->type = a3;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)accessibility
{
  return self->_accessibility;
}

- (void)setAccessibility:(unint64_t)a3
{
  self->_accessibility = a3;
}

@end

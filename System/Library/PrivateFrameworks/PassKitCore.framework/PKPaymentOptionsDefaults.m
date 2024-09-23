@implementation PKPaymentOptionsDefaults

+ (id)defaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PKPaymentOptionsDefaults_defaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECF22A28 != -1)
    dispatch_once(&qword_1ECF22A28, block);
  return (id)_MergedGlobals_265;
}

void __36__PKPaymentOptionsDefaults_defaults__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)_MergedGlobals_265;
  _MergedGlobals_265 = (uint64_t)v0;

}

- (PKPaymentOptionsDefaults)init
{
  PKPaymentOptionsDefaults *v2;
  PKPaymentOptionsDefaults *v3;
  PKPaymentOptionsSynchronization *v4;
  PKPaymentOptionsSynchronization *optionsSynchronization;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentOptionsDefaults;
  v2 = -[PKPaymentOptionsDefaults init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_defaultsChangedNotifyToken = -1;
    -[PKPaymentOptionsDefaults _registerForChangeNotifications](v2, "_registerForChangeNotifications");
    v4 = objc_alloc_init(PKPaymentOptionsSynchronization);
    optionsSynchronization = v3->_optionsSynchronization;
    v3->_optionsSynchronization = v4;

    -[PKPaymentOptionsSynchronization setDelegate:](v3->_optionsSynchronization, "setDelegate:", v3);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentOptionsDefaults _unregisterForChangeNotifications](self, "_unregisterForChangeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentOptionsDefaults;
  -[PKPaymentOptionsDefaults dealloc](&v3, sel_dealloc);
}

- (void)_registerForChangeNotifications
{
  const char *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.passkit.paymentoptionsdefaultschanged"), "UTF8String");
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PKPaymentOptionsDefaults__registerForChangeNotifications__block_invoke;
  v6[3] = &unk_1E2ACA448;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_defaultsChangedNotifyToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __59__PKPaymentOptionsDefaults__registerForChangeNotifications__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[2];
    if (v2)
    {
      WeakRetained[2] = v2 - 1;
    }
    else
    {
      v3 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;
      v10 = WeakRetained;

      v4 = (void *)v10[6];
      v10[6] = 0;

      v5 = (void *)v10[7];
      v10[7] = 0;

      v6 = (void *)v10[9];
      v10[9] = 0;

      v7 = (void *)v10[8];
      v10[8] = 0;

      v8 = (void *)v10[4];
      v10[4] = 0;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("com.apple.passkit.paymentoptionsdefaultschanged"), v10);

      WeakRetained = v10;
    }
  }

}

- (void)optionsSynchronizationDidChangeTo:(BOOL)a3
{
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.passkit.paymentoptionsdefaultschanged"), "UTF8String", a3));
}

- (void)_unregisterForChangeNotifications
{
  int defaultsChangedNotifyToken;

  defaultsChangedNotifyToken = self->_defaultsChangedNotifyToken;
  if (defaultsChangedNotifyToken != -1)
  {
    notify_cancel(defaultsChangedNotifyToken);
    self->_defaultsChangedNotifyToken = -1;
  }
}

- (id)_keychainDataForKey:(id)a3
{
  PKPaymentOptionsSynchronization *optionsSynchronization;
  id v4;
  _BOOL4 v5;
  PKKeychainItemWrapper *v6;
  PKKeychainItemWrapper *v7;
  PKKeychainItemWrapper *v8;
  uint64_t v9;
  void *v10;

  optionsSynchronization = self->_optionsSynchronization;
  v4 = a3;
  v5 = -[PKPaymentOptionsSynchronization shouldSyncToCloud](optionsSynchronization, "shouldSyncToCloud");
  v6 = [PKKeychainItemWrapper alloc];
  v7 = v6;
  if (v5)
  {
    v8 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:](v6, "initWithIdentifier:accessGroup:serviceName:type:invisible:", v4, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 2, 0);
  }
  else
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("Local"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:](v7, "initWithIdentifier:accessGroup:serviceName:type:invisible:", v9, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 0, 0);
    v4 = (id)v9;
  }

  -[PKKeychainItemWrapper objectForKey:](v8, "objectForKey:", *MEMORY[0x1E0CD70D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_setKeychainData:(id)a3 forKey:(id)a4
{
  PKPaymentOptionsSynchronization *optionsSynchronization;
  id v7;
  id v8;
  _BOOL4 v9;
  PKKeychainItemWrapper *v10;
  PKKeychainItemWrapper *v11;
  uint64_t v12;
  PKKeychainItemWrapper *v13;

  optionsSynchronization = self->_optionsSynchronization;
  v7 = a4;
  v8 = a3;
  v9 = -[PKPaymentOptionsSynchronization shouldSyncToCloud](optionsSynchronization, "shouldSyncToCloud");
  v10 = [PKKeychainItemWrapper alloc];
  v11 = v10;
  if (v9)
  {
    v13 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:](v10, "initWithIdentifier:accessGroup:serviceName:type:invisible:", v7, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 1, 0);
  }
  else
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("Local"));
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:](v11, "initWithIdentifier:accessGroup:serviceName:type:invisible:", v12, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 0, 0);
    v7 = (id)v12;
  }

  -[PKKeychainItemWrapper setObject:forKey:](v13, "setObject:forKey:", v8, *MEMORY[0x1E0CD70D8]);
  ++self->_postedNotificationCount;
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.passkit.paymentoptionsdefaultschanged"), "UTF8String"));

}

- (void)_deleteKeychainDataForKey:(id)a3
{
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", a3, 0);
}

- (void)_deleteKeychainDataForKey:(id)a3 localOnly:(BOOL)a4
{
  _BOOL4 v4;
  PKPaymentOptionsSynchronization *optionsSynchronization;
  id v7;
  _BOOL4 v8;
  PKKeychainItemWrapper *v9;
  PKKeychainItemWrapper *v10;
  uint64_t v11;
  PKKeychainItemWrapper *v12;

  v4 = a4;
  optionsSynchronization = self->_optionsSynchronization;
  v7 = a3;
  v8 = -[PKPaymentOptionsSynchronization shouldSyncToCloud](optionsSynchronization, "shouldSyncToCloud");
  v9 = [PKKeychainItemWrapper alloc];
  v10 = v9;
  if (v8)
  {
    v12 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:](v9, "initWithIdentifier:accessGroup:serviceName:type:invisible:", v7, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 1, 0);
  }
  else
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("Local"));
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:](v10, "initWithIdentifier:accessGroup:serviceName:type:invisible:", v11, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), 0, 0);
    v7 = (id)v11;
  }

  if (v4)
    -[PKKeychainItemWrapper resetLocalKeychainItem](v12, "resetLocalKeychainItem");
  else
    -[PKKeychainItemWrapper resetKeychainItem](v12, "resetKeychainItem");
  ++self->_postedNotificationCount;
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.passkit.paymentoptionsdefaultschanged"), "UTF8String"));

}

- (void)_setContact:(id)a3 property:(id)a4 forKeychainKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "setContactSource:", 2);
  v11 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v10, "pkDictionaryForProperty:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v13, v8);
}

- (void)_setContact:(id)a3 forKeychainKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setContactSource:", 2);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v8, v6);
}

- (id)_contactForKeychainKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PKPaymentOptionsDefaults _keychainDataForKey:](self, "_keychainDataForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, objc_opt_class(), 0);
    v15 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v8, v3, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    if (v10)
    {
      PKLogFacilityTypeGetObject(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v10;
        _os_log_error_impl(&dword_18FC92000, v11, OS_LOG_TYPE_ERROR, "Error trying to read contact data from keychain. %{public}@", buf, 0xCu);
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C97200], "contactWithPkDictionary:", v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
        goto LABEL_13;
      }
      v12 = v9;
    }
    v13 = v12;
LABEL_13:

    goto LABEL_14;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (CNContact)defaultShippingAddress
{
  CNContact *defaultShippingAddress;
  CNContact *v4;
  CNContact *v5;

  defaultShippingAddress = self->_defaultShippingAddress;
  if (!defaultShippingAddress)
  {
    -[PKPaymentOptionsDefaults _contactForKeychainKey:](self, "_contactForKeychainKey:", CFSTR("PKShippingAddressKeychainKey"));
    v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultShippingAddress;
    self->_defaultShippingAddress = v4;

    defaultShippingAddress = self->_defaultShippingAddress;
    if (defaultShippingAddress)
    {
      -[CNContact setContactSource:](defaultShippingAddress, "setContactSource:", 2);
      defaultShippingAddress = self->_defaultShippingAddress;
    }
  }
  return defaultShippingAddress;
}

- (void)setDefaultShippingAddress:(id)a3
{
  id v5;

  v5 = a3;
  AnalyticsSendEvent();
  if (v5)
  {
    objc_storeStrong((id *)&self->_defaultShippingAddress, a3);
    -[PKPaymentOptionsDefaults _setContact:property:forKeychainKey:](self, "_setContact:property:forKeychainKey:", v5, *MEMORY[0x1E0C967F0], CFSTR("PKShippingAddressKeychainKey"));
  }
  else
  {
    -[PKPaymentOptionsDefaults deleteDefaultShippingAddress](self, "deleteDefaultShippingAddress");
  }

}

- (void)deleteDefaultShippingAddress
{
  CNContact *defaultShippingAddress;

  defaultShippingAddress = self->_defaultShippingAddress;
  if (defaultShippingAddress)
  {
    self->_defaultShippingAddress = 0;

  }
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:](self, "_deleteKeychainDataForKey:", CFSTR("PKShippingAddressKeychainKey"));
}

- (NSDictionary)defaultBillingAddresses
{
  NSDictionary *defaultBillingAddresses;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  _QWORD v11[4];
  id v12;

  defaultBillingAddresses = self->_defaultBillingAddresses;
  if (!defaultBillingAddresses)
  {
    -[PKPaymentOptionsDefaults _rawDefaultBillingAddresses](self, "_rawDefaultBillingAddresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__PKPaymentOptionsDefaults_defaultBillingAddresses__block_invoke;
    v11[3] = &unk_1E2AD71C0;
    v12 = v5;
    v6 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_176);

    v8 = (NSDictionary *)objc_msgSend(v6, "copy");
    v9 = self->_defaultBillingAddresses;
    self->_defaultBillingAddresses = v8;

    defaultBillingAddresses = self->_defaultBillingAddresses;
  }
  return defaultBillingAddresses;
}

void __51__PKPaymentOptionsDefaults_defaultBillingAddresses__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C97200], "contactWithPkDictionary:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);

}

uint64_t __51__PKPaymentOptionsDefaults_defaultBillingAddresses__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContactSource:", 2);
}

- (id)_rawDefaultBillingAddresses
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PKPaymentOptionsDefaults _keychainDataForKey:](self, "_keychainDataForKey:", CFSTR("PKBillingAddressesKeychainKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, objc_opt_class(), 0);
    v36 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v7, v2, &v36);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v36;

    if (v9)
    {
      PKLogFacilityTypeGetObject(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v9;
        _os_log_error_impl(&dword_18FC92000, v10, OS_LOG_TYPE_ERROR, "Error trying to read contact data from keychain. %{public}@", buf, 0xCu);
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v33;
        v26 = v9;
        v27 = v8;
        v24 = *(_QWORD *)v33;
        while (2)
        {
          v14 = 0;
          v25 = v12;
          do
          {
            if (*(_QWORD *)v33 != v13)
              objc_enumerationMutation(v11);
            v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_29;
            objc_msgSend(v11, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_28:

LABEL_29:
              v22 = 0;
              v9 = v26;
              v8 = v27;
              goto LABEL_30;
            }
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v29;
              while (2)
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v29 != v20)
                    objc_enumerationMutation(v17);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_28;
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
                if (v19)
                  continue;
                break;
              }
            }

            ++v14;
            v13 = v24;
          }
          while (v14 != v25);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          v9 = v26;
          v8 = v27;
          if (v12)
            continue;
          break;
        }
      }

      v22 = v11;
    }
    else
    {
      v22 = 0;
    }
LABEL_30:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)_setRawDefaultBillingAddresses:(id)a3
{
  void *v4;
  NSDictionary *defaultBillingAddresses;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v4, CFSTR("PKBillingAddressesKeychainKey"));

  defaultBillingAddresses = self->_defaultBillingAddresses;
  if (defaultBillingAddresses)
  {
    self->_defaultBillingAddresses = 0;

  }
}

- (id)defaultBillingAddressForPaymentPass:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "primaryAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsDefaults defaultBillingAddressForPrimaryAccountIdentifier:](self, "defaultBillingAddressForPrimaryAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultBillingAddressForBankInformation:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsDefaults defaultBillingAddressForBankAccountIdentifier:](self, "defaultBillingAddressForBankAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultBillingAddressForRemotePaymentInstrument:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "primaryAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsDefaults defaultBillingAddressForPrimaryAccountIdentifier:](self, "defaultBillingAddressForPrimaryAccountIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultBillingAddressForPrimaryAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[PKPaymentOptionsDefaults defaultBillingAddresses](self, "defaultBillingAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__62;
  v16 = __Block_byref_object_dispose__62;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PKPaymentOptionsDefaults_defaultBillingAddressForPrimaryAccountIdentifier___block_invoke;
  v9[3] = &unk_1E2AC7780;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __77__PKPaymentOptionsDefaults_defaultBillingAddressForPrimaryAccountIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (id)defaultBillingAddressForBankAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[PKPaymentOptionsDefaults defaultBillingAddresses](self, "defaultBillingAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__62;
  v16 = __Block_byref_object_dispose__62;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PKPaymentOptionsDefaults_defaultBillingAddressForBankAccountIdentifier___block_invoke;
  v9[3] = &unk_1E2AC7780;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __74__PKPaymentOptionsDefaults_defaultBillingAddressForBankAccountIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (void)setDefaultBillingAddress:(id)a3 forPaymentPass:(id)a4
{
  id v6;
  id v7;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      objc_msgSend(a4, "primaryAccountIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOptionsDefaults setDefaultBillingAddress:forPrimaryAccountIdentifier:](self, "setDefaultBillingAddress:forPrimaryAccountIdentifier:", v6, v7);

    }
  }
}

- (void)setDefaultBillingAddress:(id)a3 forRemotePaymentInstrument:(id)a4
{
  id v6;
  id v7;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      objc_msgSend(a4, "primaryAccountIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOptionsDefaults setDefaultBillingAddress:forPrimaryAccountIdentifier:](self, "setDefaultBillingAddress:forPrimaryAccountIdentifier:", v6, v7);

    }
  }
}

- (void)setDefaultBillingAddress:(id)a3 forBankInformation:(id)a4
{
  id v6;
  id v7;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      objc_msgSend(a4, "identifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOptionsDefaults setDefaultBillingAddress:forPrimaryAccountIdentifier:](self, "setDefaultBillingAddress:forPrimaryAccountIdentifier:", v6, v7);

    }
  }
}

- (void)setDefaultBillingAddress:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSDictionary *defaultBillingAddresses;
  void *v33;
  void *v34;
  uint8_t buf[16];
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v34 = v6;
    objc_msgSend(v6, "pkDictionaryForProperty:", *MEMORY[0x1E0C967F0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[PKPaymentOptionsDefaults _rawDefaultBillingAddresses](self, "_rawDefaultBillingAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDictionary:", v9);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v11 = (void *)objc_msgSend(v10, "copy");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v17 = objc_alloc(MEMORY[0x1E0C99E20]);
          objc_msgSend(v10, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithSet:", v18);

          if (objc_msgSend(v19, "containsObject:", v7))
          {
            objc_msgSend(v19, "removeObject:", v7);
            if (objc_msgSend(v19, "count"))
              objc_msgSend(v10, "setObject:forKey:", v19, v16);
            else
              objc_msgSend(v10, "removeObjectForKey:", v16);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v13);
    }

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __81__PKPaymentOptionsDefaults_setDefaultBillingAddress_forPrimaryAccountIdentifier___block_invoke;
    v36[3] = &unk_1E2AD7208;
    v20 = v33;
    v37 = v20;
    v6 = v34;
    v38 = v34;
    objc_msgSend(v10, "keysOfEntriesPassingTest:", v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "anyObject");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v10, "objectForKeyedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithSet:", v25);

      objc_msgSend(v26, "addObject:", v7);
      v27 = v10;
      v28 = v26;
      v29 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v10;
      v28 = v26;
      v29 = v20;
    }
    objc_msgSend(v27, "setObject:forKey:", v28, v29);

    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v30, CFSTR("PKBillingAddressesKeychainKey"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOptionsDefaults updateLastUpdatedDate:forPrimaryAccountIdentifier:](self, "updateLastUpdatedDate:forPrimaryAccountIdentifier:", v31, v7);

    defaultBillingAddresses = self->_defaultBillingAddresses;
    if (defaultBillingAddresses)
    {
      self->_defaultBillingAddresses = 0;

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(7uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FC92000, v20, OS_LOG_TYPE_ERROR, "Attempted to set a default billing address but didn't supply a primary account identifier. This is an error", buf, 2u);
    }
  }

}

uint64_t __81__PKPaymentOptionsDefaults_setDefaultBillingAddress_forPrimaryAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  v5 = *(id *)(a1 + 32);
  if (!v3 || !v5)
  {
    if (v5 == v3)
      goto LABEL_4;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C97200], "contactWithPkDictionary:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualIgnoringIdentifiers:", *(_QWORD *)(a1 + 40));

    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqual:") & 1) == 0)
    goto LABEL_6;
LABEL_4:
  v6 = 1;
LABEL_7:

  return v6;
}

- (void)deleteDefaultBillingAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *defaultBillingAddresses;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[PKPaymentOptionsDefaults _rawDefaultBillingAddresses](self, "_rawDefaultBillingAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PKPaymentOptionsDefaults_deleteDefaultBillingAddress___block_invoke;
  v13[3] = &unk_1E2AC3358;
  v12 = v4;
  v14 = v12;
  objc_msgSend(v7, "keysOfEntriesPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsForKeys:", v9);

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v10, CFSTR("PKBillingAddressesKeychainKey"));

  defaultBillingAddresses = self->_defaultBillingAddresses;
  if (defaultBillingAddresses)
  {
    self->_defaultBillingAddresses = 0;

  }
}

uint64_t __56__PKPaymentOptionsDefaults_deleteDefaultBillingAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C97200], "contactWithPkDictionary:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualIgnoringIdentifiers:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)deleteDefaultBillingAddressForPrimaryAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *defaultBillingAddresses;
  PKPaymentOptionsDefaults *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PKPaymentOptionsDefaults defaultBillingAddressForPrimaryAccountIdentifier:](self, "defaultBillingAddressForPrimaryAccountIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99E08]);
      v20 = self;
      -[PKPaymentOptionsDefaults _rawDefaultBillingAddresses](self, "_rawDefaultBillingAddresses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = (void *)objc_msgSend(v8, "copy");
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            v15 = objc_alloc(MEMORY[0x1E0C99E20]);
            objc_msgSend(v8, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v15, "initWithSet:", v16);

            if (objc_msgSend(v17, "containsObject:", v4))
            {
              objc_msgSend(v17, "removeObject:", v4);
              if (objc_msgSend(v17, "count"))
                objc_msgSend(v8, "setObject:forKey:", v17, v14);
              else
                objc_msgSend(v8, "removeObjectForKey:", v14);
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);
      }

      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOptionsDefaults _setKeychainData:forKey:](v20, "_setKeychainData:forKey:", v18, CFSTR("PKBillingAddressesKeychainKey"));

      defaultBillingAddresses = v20->_defaultBillingAddresses;
      if (defaultBillingAddresses)
      {
        v20->_defaultBillingAddresses = 0;

      }
    }
  }

}

- (void)_hardDeleteDefaultBillingAddress
{
  NSDictionary *defaultBillingAddresses;

  defaultBillingAddresses = self->_defaultBillingAddresses;
  if (defaultBillingAddresses)
  {
    self->_defaultBillingAddresses = 0;

  }
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:](self, "_deleteKeychainDataForKey:", CFSTR("PKBillingAddressesKeychainKey"));
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:](self, "_deleteKeychainDataForKey:", CFSTR("PKBillingAddressesUpdatesKeychainKey"));
}

- (id)lastUpdatedDateForPrimaryAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PKPaymentOptionsDefaults _lastUpdatedDatesForBillingAddresses](self, "_lastUpdatedDatesForBillingAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)updateLastUpdatedDate:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PKPaymentOptionsDefaults _lastUpdatedDatesForBillingAddresses](self, "_lastUpdatedDatesForBillingAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKey:", v12, v6);
  v9 = (void *)MEMORY[0x1E0CB36F8];
  v10 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v11, CFSTR("PKBillingAddressesUpdatesKeychainKey"));

}

- (id)_lastUpdatedDatesForBillingAddresses
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKPaymentOptionsDefaults _keychainDataForKey:](self, "_keychainDataForKey:", CFSTR("PKBillingAddressesUpdatesKeychainKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
    v14 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v8, v2, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (v10)
    {
      PKLogFacilityTypeGetObject(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v10;
        _os_log_error_impl(&dword_18FC92000, v11, OS_LOG_TYPE_ERROR, "Error trying to read update dates from keychain. %{public}@", buf, 0xCu);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v9;
LABEL_10:

        goto LABEL_11;
      }
    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (CNContact)defaultContactEmail
{
  CNContact *defaultContactEmail;
  CNContact *v4;
  CNContact *v5;

  defaultContactEmail = self->_defaultContactEmail;
  if (!defaultContactEmail)
  {
    -[PKPaymentOptionsDefaults _contactForKeychainKey:](self, "_contactForKeychainKey:", CFSTR("PKContactEmailKeychainKey"));
    v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultContactEmail;
    self->_defaultContactEmail = v4;

    defaultContactEmail = self->_defaultContactEmail;
    if (defaultContactEmail)
    {
      -[CNContact setContactSource:](defaultContactEmail, "setContactSource:", 2);
      defaultContactEmail = self->_defaultContactEmail;
    }
  }
  return defaultContactEmail;
}

- (void)setDefaultContactEmail:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_defaultContactEmail, a3);
    -[PKPaymentOptionsDefaults _setContact:property:forKeychainKey:](self, "_setContact:property:forKeychainKey:", v5, *MEMORY[0x1E0C966A8], CFSTR("PKContactEmailKeychainKey"));
  }
  else
  {
    -[PKPaymentOptionsDefaults deleteDefaultContactEmail](self, "deleteDefaultContactEmail");
  }

}

- (void)deleteDefaultContactEmail
{
  CNContact *defaultContactEmail;

  defaultContactEmail = self->_defaultContactEmail;
  if (defaultContactEmail)
  {
    self->_defaultContactEmail = 0;

  }
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:](self, "_deleteKeychainDataForKey:", CFSTR("PKContactEmailKeychainKey"));
}

- (BOOL)useHideMyEmail
{
  NSNumber *useHideMyEmailNumber;
  void *v4;
  void *v5;
  id v6;
  NSObject *p_super;
  NSNumber *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  useHideMyEmailNumber = self->_useHideMyEmailNumber;
  if (!useHideMyEmailNumber)
  {
    -[PKPaymentOptionsDefaults _keychainDataForKey:](self, "_keychainDataForKey:", CFSTR("PKUseHideMyEmailKeychainKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v10 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v10;
      if (v6)
      {
        PKLogFacilityTypeGetObject(0);
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v12 = v6;
          _os_log_error_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_ERROR, "Error trying to read number data from keychain. %{public}@", buf, 0xCu);
        }
      }
      else
      {
        v8 = v5;
        p_super = &self->_useHideMyEmailNumber->super.super;
        self->_useHideMyEmailNumber = v8;
      }

    }
    useHideMyEmailNumber = self->_useHideMyEmailNumber;
  }
  return -[NSNumber BOOLValue](useHideMyEmailNumber, "BOOLValue");
}

- (void)setUseHideMyEmail:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *useHideMyEmailNumber;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  useHideMyEmailNumber = self->_useHideMyEmailNumber;
  self->_useHideMyEmailNumber = v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_useHideMyEmailNumber, 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v6, CFSTR("PKUseHideMyEmailKeychainKey"));

}

- (void)deleteUseHideMyEmail
{
  NSNumber *useHideMyEmailNumber;

  useHideMyEmailNumber = self->_useHideMyEmailNumber;
  self->_useHideMyEmailNumber = 0;

  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:](self, "_deleteKeychainDataForKey:", CFSTR("PKUseHideMyEmailKeychainKey"));
}

- (CNContact)defaultContactPhone
{
  CNContact *defaultContactPhone;
  CNContact *v4;
  CNContact *v5;

  defaultContactPhone = self->_defaultContactPhone;
  if (!defaultContactPhone)
  {
    -[PKPaymentOptionsDefaults _contactForKeychainKey:](self, "_contactForKeychainKey:", CFSTR("PKContactPhoneKeychainKey"));
    v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultContactPhone;
    self->_defaultContactPhone = v4;

    defaultContactPhone = self->_defaultContactPhone;
    if (defaultContactPhone)
    {
      -[CNContact setContactSource:](defaultContactPhone, "setContactSource:", 2);
      defaultContactPhone = self->_defaultContactPhone;
    }
  }
  return defaultContactPhone;
}

- (void)setDefaultContactPhone:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_defaultContactPhone, a3);
    -[PKPaymentOptionsDefaults _setContact:property:forKeychainKey:](self, "_setContact:property:forKeychainKey:", v5, *MEMORY[0x1E0C967C0], CFSTR("PKContactPhoneKeychainKey"));
  }
  else
  {
    -[PKPaymentOptionsDefaults deleteDefaultContactPhone](self, "deleteDefaultContactPhone");
  }

}

- (void)deleteDefaultContactPhone
{
  CNContact *defaultContactPhone;

  defaultContactPhone = self->_defaultContactPhone;
  if (defaultContactPhone)
  {
    self->_defaultContactPhone = 0;

  }
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:](self, "_deleteKeychainDataForKey:", CFSTR("PKContactPhoneKeychainKey"));
}

- (CNContact)defaultContactName
{
  CNContact *defaultContactName;
  CNContact *v4;
  CNContact *v5;

  defaultContactName = self->_defaultContactName;
  if (!defaultContactName)
  {
    -[PKPaymentOptionsDefaults _contactForKeychainKey:](self, "_contactForKeychainKey:", CFSTR("PKContactNameKeychainKey"));
    v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultContactName;
    self->_defaultContactName = v4;

    defaultContactName = self->_defaultContactName;
  }
  return defaultContactName;
}

- (void)setDefaultContactName:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_defaultContactName, a3);
    -[PKPaymentOptionsDefaults _setContact:forKeychainKey:](self, "_setContact:forKeychainKey:", v5, CFSTR("PKContactNameKeychainKey"));
  }
  else
  {
    -[PKPaymentOptionsDefaults deleteDefaultContactName](self, "deleteDefaultContactName");
  }

}

- (void)deleteDefaultContactName
{
  CNContact *defaultContactName;

  defaultContactName = self->_defaultContactName;
  if (defaultContactName)
  {
    self->_defaultContactName = 0;

  }
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:](self, "_deleteKeychainDataForKey:", CFSTR("PKContactNameKeychainKey"));
}

- (void)deleteAllDefaults
{
  -[PKPaymentOptionsDefaults deleteDefaultContactName](self, "deleteDefaultContactName");
  -[PKPaymentOptionsDefaults deleteDefaultContactEmail](self, "deleteDefaultContactEmail");
  -[PKPaymentOptionsDefaults deleteUseHideMyEmail](self, "deleteUseHideMyEmail");
  -[PKPaymentOptionsDefaults deleteDefaultShippingAddress](self, "deleteDefaultShippingAddress");
  -[PKPaymentOptionsDefaults deleteDefaultContactPhone](self, "deleteDefaultContactPhone");
  -[PKPaymentOptionsDefaults _hardDeleteDefaultBillingAddress](self, "_hardDeleteDefaultBillingAddress");
}

- (void)deleteAllLocalDefaults
{
  CNContact *defaultContactName;
  CNContact *defaultContactEmail;
  NSNumber *useHideMyEmailNumber;
  CNContact *defaultShippingAddress;
  CNContact *defaultContactPhone;
  NSDictionary *defaultBillingAddresses;

  defaultContactName = self->_defaultContactName;
  self->_defaultContactName = 0;

  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", CFSTR("PKContactNameKeychainKey"), 1);
  defaultContactEmail = self->_defaultContactEmail;
  self->_defaultContactEmail = 0;

  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", CFSTR("PKContactEmailKeychainKey"), 1);
  useHideMyEmailNumber = self->_useHideMyEmailNumber;
  self->_useHideMyEmailNumber = 0;

  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", CFSTR("PKUseHideMyEmailKeychainKey"), 1);
  defaultShippingAddress = self->_defaultShippingAddress;
  self->_defaultShippingAddress = 0;

  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", CFSTR("PKShippingAddressKeychainKey"), 1);
  defaultContactPhone = self->_defaultContactPhone;
  self->_defaultContactPhone = 0;

  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", CFSTR("PKContactPhoneKeychainKey"), 1);
  defaultBillingAddresses = self->_defaultBillingAddresses;
  self->_defaultBillingAddresses = 0;

  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", CFSTR("PKBillingAddressesKeychainKey"), 1);
  -[PKPaymentOptionsDefaults _deleteKeychainDataForKey:localOnly:](self, "_deleteKeychainDataForKey:localOnly:", CFSTR("PKBillingAddressesUpdatesKeychainKey"), 1);
}

- (void)deleteDefaultForContactKey:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    -[PKPaymentOptionsDefaults deleteDefaultShippingAddress](self, "deleteDefaultShippingAddress");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    -[PKPaymentOptionsDefaults deleteDefaultContactEmail](self, "deleteDefaultContactEmail");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    -[PKPaymentOptionsDefaults deleteDefaultContactPhone](self, "deleteDefaultContactPhone");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966C0]) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966D0]))
  {
    -[PKPaymentOptionsDefaults deleteDefaultContactName](self, "deleteDefaultContactName");
  }

}

- (void)migrateToSyncable
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Migrating keychain to syncable items", buf, 2u);
  }

  -[PKPaymentOptionsDefaults defaultContactEmail](self, "defaultContactEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Migrating email to syncable items", v14, 2u);
    }

    -[PKPaymentOptionsDefaults deleteDefaultContactEmail](self, "deleteDefaultContactEmail");
    -[PKPaymentOptionsDefaults setDefaultContactEmail:](self, "setDefaultContactEmail:", v4);
  }
  -[PKPaymentOptionsDefaults defaultContactName](self, "defaultContactName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Migrating name to syncable items", v13, 2u);
    }

    -[PKPaymentOptionsDefaults deleteDefaultContactName](self, "deleteDefaultContactName");
    -[PKPaymentOptionsDefaults setDefaultContactName:](self, "setDefaultContactName:", v5);
  }
  -[PKPaymentOptionsDefaults defaultContactPhone](self, "defaultContactPhone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Migrating phone to syncable items", v12, 2u);
    }

    -[PKPaymentOptionsDefaults deleteDefaultContactPhone](self, "deleteDefaultContactPhone");
    -[PKPaymentOptionsDefaults setDefaultContactPhone:](self, "setDefaultContactPhone:", v6);
  }
  -[PKPaymentOptionsDefaults defaultShippingAddress](self, "defaultShippingAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Migrating shipping to syncable items", v11, 2u);
    }

    -[PKPaymentOptionsDefaults deleteDefaultShippingAddress](self, "deleteDefaultShippingAddress");
    -[PKPaymentOptionsDefaults setDefaultShippingAddress:](self, "setDefaultShippingAddress:", v7);
  }
  -[PKPaymentOptionsDefaults _rawDefaultBillingAddresses](self, "_rawDefaultBillingAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Migrating billing to syncable items", v10, 2u);
    }

    -[PKPaymentOptionsDefaults _hardDeleteDefaultBillingAddress](self, "_hardDeleteDefaultBillingAddress");
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentOptionsDefaults _setKeychainData:forKey:](self, "_setKeychainData:forKey:", v9, CFSTR("PKBillingAddressesKeychainKey"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultContactPhone, 0);
  objc_storeStrong((id *)&self->_defaultContactEmail, 0);
  objc_storeStrong((id *)&self->_defaultContactName, 0);
  objc_storeStrong((id *)&self->_defaultShippingAddress, 0);
  objc_storeStrong((id *)&self->_defaultBillingAddresses, 0);
  objc_storeStrong((id *)&self->_useHideMyEmailNumber, 0);
  objc_storeStrong((id *)&self->_optionsSynchronization, 0);
}

@end

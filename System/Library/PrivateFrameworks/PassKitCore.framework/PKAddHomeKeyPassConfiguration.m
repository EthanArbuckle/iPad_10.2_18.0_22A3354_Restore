@implementation PKAddHomeKeyPassConfiguration

- (PKAddHomeKeyPassConfiguration)init
{
  return (PKAddHomeKeyPassConfiguration *)-[PKAddHomeKeyPassConfiguration _initWithPaymentMethodTypes:](self, "_initWithPaymentMethodTypes:", &unk_1E2C3E3F8);
}

- (id)_initWithPaymentMethodTypes:(id)a3
{
  id v4;
  PKAddHomeKeyPassConfiguration *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *appletTypes;
  PKAddHomeKeyPassConfiguration *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAddHomeKeyPassConfiguration;
  v5 = -[PKAddSecureElementPassConfiguration initWithType:](&v25, sel_initWithType_, 3);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v21);
          if (v12 == 1004)
          {
            +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirAliro](PKProvisioningSEStorageSnapshot, "appletTypePurpleTrustAirAliro");
            v14 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = v12;
            if (v12 != 1003)
            {
              PKLogFacilityTypeGetObject(0);
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v27 = v13;
                _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Unrecognized payment method type: %ld", buf, 0xCu);
              }

              v18 = 0;
              goto LABEL_18;
            }
            +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirHome](PKProvisioningSEStorageSnapshot, "appletTypePurpleTrustAirHome");
            v14 = objc_claimAutoreleasedReturnValue();
          }
          v15 = (void *)v14;
          objc_msgSend(v6, "addObject:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        if (v9)
          continue;
        break;
      }
    }

    v16 = objc_msgSend(v6, "copy");
    appletTypes = v5->_appletTypes;
    v5->_appletTypes = (NSArray *)v16;

  }
  v18 = v5;
LABEL_18:

  return v18;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("appletTypes: '%@'; "), self->_appletTypes);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAddHomeKeyPassConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAddHomeKeyPassConfiguration *v5;
  uint64_t v6;
  NSArray *appletTypes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAddHomeKeyPassConfiguration;
  v5 = -[PKAddSecureElementPassConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("appletTypes"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletTypes = v5->_appletTypes;
    v5->_appletTypes = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddHomeKeyPassConfiguration;
  v4 = a3;
  -[PKAddSecureElementPassConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appletTypes, CFSTR("appletTypes"), v5.receiver, v5.super_class);

}

- (NSArray)appletTypes
{
  return self->_appletTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletTypes, 0);
}

@end

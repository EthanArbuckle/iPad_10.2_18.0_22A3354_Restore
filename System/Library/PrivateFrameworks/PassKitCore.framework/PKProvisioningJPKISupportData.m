@implementation PKProvisioningJPKISupportData

- (PKProvisioningJPKISupportData)initWithEncryptedSupportDataDictionary:(id)a3 sid:(id)a4
{
  PKProvisioningJPKISupportData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningJPKISupportData;
  result = -[PKProvisioningSupportData initWithEncryptedSupportDataDictionary:sid:](&v5, sel_initWithEncryptedSupportDataDictionary_sid_, a3, a4);
  if (result)
    result->_type = 1;
  return result;
}

- (PKProvisioningJPKISupportData)initWithPIN:(id)a3 password:(id)a4 type:(unint64_t)a5 sid:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  PKProvisioningJPKISupportData *v13;
  uint64_t v14;
  NSString *pin;
  uint64_t v16;
  NSString *password;
  PKProvisioningJPKISupportData *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a6;
  if (v10 | v11)
  {
    v21.receiver = self;
    v21.super_class = (Class)PKProvisioningJPKISupportData;
    v13 = -[PKProvisioningJPKISupportData init](&v21, sel_init);
    if (v13)
    {
      if (v10)
      {
        objc_msgSend((id)v10, "pk_zString");
        v14 = objc_claimAutoreleasedReturnValue();
        pin = v13->_pin;
        v13->_pin = (NSString *)v14;

      }
      if (v11)
      {
        objc_msgSend((id)v11, "pk_zString");
        v16 = objc_claimAutoreleasedReturnValue();
        password = v13->_password;
        v13->_password = (NSString *)v16;

      }
      v13->_type = a5;
      -[PKProvisioningSupportData setSid:](v13, "setSid:", v12);
    }
    self = v13;
    v18 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData failed init - PIN and Password not provided", buf, 0xCu);
    }

    v18 = 0;
  }

  return v18;
}

- (id)initByUnarchivingData:(id)a3 ofType:(unint64_t)a4 forPass:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  PKProvisioningJPKISupportData *v30;
  id v32;
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a3;
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v13, v11, &v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v32;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PKLogFacilityTypeGetObject(0x26uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v16;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData failed init - unarchiving archived data failed with error: %@", buf, 0x16u);
    }

  }
  if (!a4)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("userPIN"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("userPassword");
LABEL_24:
    objc_msgSend(v14, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (a4 != 1)
  {
    v25 = 0;
    v27 = 0;
LABEL_25:
    self = -[PKProvisioningJPKISupportData initWithPIN:password:type:sid:](self, "initWithPIN:password:type:sid:", v25, v27, a4, v16);

    v30 = self;
    goto LABEL_26;
  }
  objc_msgSend(v14, "PKDictionaryForKey:", CFSTR("EncryptedSupportDictionary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)objc_opt_class();
    objc_msgSend(v8, "longTermPrivacyKeyGroupIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_decryptEncryptedSupportDataDictionary:withGroupIdentifier:", v18, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v21;
    if (v21)
    {
LABEL_23:

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("temporaryPIN"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("temporaryPassword");
      goto LABEL_24;
    }
    if (!PKFallbackToStaticJPKITempPINAndPass())
    {
      v14 = 0;
      goto LABEL_23;
    }
    PKLogFacilityTypeGetObject(0x26uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v16;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData hitting temporary workaround to use known server hard coded TPIN/TPassword values", buf, 0xCu);
    }

    v23 = objc_alloc(MEMORY[0x1E0C99D80]);
    v33[0] = CFSTR("temporaryPIN");
    v33[1] = CFSTR("temporaryPassword");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v23, "initWithObjects:forKeys:", &unk_1E2C3DD80, v24);
LABEL_17:

    goto LABEL_23;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("temporaryPIN"));
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v24 = (void *)v28;
    goto LABEL_17;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("temporaryPassword"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    goto LABEL_23;
  PKLogFacilityTypeGetObject(0x26uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v16;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "[%@] PKProvisioningJPKISupportData failed init - temporary type lacked expected values", buf, 0xCu);
  }
  v30 = 0;
LABEL_26:

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningJPKISupportData)initWithCoder:(id)a3
{
  id v4;
  PKProvisioningJPKISupportData *v5;
  void *v6;
  uint64_t v7;
  NSString *pin;
  void *v9;
  uint64_t v10;
  NSString *password;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKProvisioningJPKISupportData;
  v5 = -[PKProvisioningSupportData initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("JPKIPIN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_zString");
    v7 = objc_claimAutoreleasedReturnValue();
    pin = v5->_pin;
    v5->_pin = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("JPKIpassword"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_zString");
    v10 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v10;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("JPKISupportDataType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningJPKISupportData;
  v4 = a3;
  -[PKProvisioningSupportData encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pin, CFSTR("JPKIPIN"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_password, CFSTR("JPKIpassword"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("JPKISupportDataType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKProvisioningJPKISupportData;
  v4 = -[PKProvisioningSupportData copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[NSString pk_zString](self->_pin, "pk_zString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  -[NSString pk_zString](self->_password, "pk_zString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[4];
  v4[4] = v7;

  v4[5] = self->_type;
  return v4;
}

- (unint64_t)supportDataType
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningJPKISupportData;
  -[PKProvisioningSupportData _dictionaryRepresentation](&v12, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (self->_type)
    v7 = CFSTR("temporaryPIN");
  else
    v7 = CFSTR("userPIN");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_pin, v7);
  if (self->_type)
    v8 = CFSTR("temporaryPassword");
  else
    v8 = CFSTR("userPassword");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_password, v8);
  if (objc_msgSend(v6, "count"))
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

+ (id)_decryptEncryptedSupportDataDictionary:(id)a3 withGroupIdentifier:(id)a4
{
  id v5;
  id v6;
  PKDAManager *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PKDAManager);
  v19 = 0;
  -[PKDAManager decryptPayload:groupIdentifier:outError:](v7, "decryptPayload:groupIdentifier:outError:", v5, v6, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v19;
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (v13)
      v15 = v14 == 0;
    else
      v15 = 0;
    if (v15)
    {
      v16 = 0;
      goto LABEL_16;
    }
    v11 = v14;
    PKLogFacilityTypeGetObject(0x23uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKProvisioningJPKISupportData - Issue serializing decrypted data: %@", buf, 0xCu);
    }
  }
  else
  {
    v11 = v9;
    PKLogFacilityTypeGetObject(0x23uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKProvisioningJPKISupportData - Unable to decrypt encrypted support data dict %@ with error: %@", buf, 0x16u);
    }
    v13 = 0;
  }

  v16 = v11;
LABEL_16:

  return v13;
}

- (NSString)pin
{
  return self->_pin;
}

- (NSString)password
{
  return self->_password;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pin, 0);
}

@end

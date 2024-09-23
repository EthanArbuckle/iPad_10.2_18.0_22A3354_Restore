@implementation OTCustodianRecoveryKey

- (BOOL)generateWrappingWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSData *v8;
  NSData *wrappingKey;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C930]), "initWithBitSize:", 2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C928]), "initRandomKeyWithSpecifier:error:", v5, a3);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "keyData");
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    wrappingKey = self->_wrappingKey;
    self->_wrappingKey = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C940]), "initWithKeySpecifier:", v5);
    -[NSString dataUsingEncoding:](self->_recoveryString, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encrypt:withKey:additionalAuthenticatedData:error:", v11, v7, v12, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;
      if (v14)
        objc_storeStrong((id *)&self->_wrappedKey, v14);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (OTCustodianRecoveryKey)initWithUUID:(id)a3 recoveryString:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  OTCustodianRecoveryKey *v11;
  id *p_isa;
  char v13;
  id v14;
  void *v15;
  OTCustodianRecoveryKey *v16;
  id v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)OTCustodianRecoveryKey;
  v11 = -[OTCustodianRecoveryKey init](&v19, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (!v11)
    goto LABEL_4;
  objc_storeStrong((id *)&v11->_uuid, a3);
  objc_storeStrong(p_isa + 4, a4);
  v18 = 0;
  v13 = objc_msgSend(p_isa, "generateWrappingWithError:", &v18);
  v14 = v18;
  v15 = v14;
  if ((v13 & 1) != 0)
  {

LABEL_4:
    v16 = p_isa;
    goto LABEL_8;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)unwrapWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSString *v11;
  NSString *recoveryString;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C930]), "initWithBitSize:", 2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C928]), "initWithData:specifier:error:", self->_wrappingKey, v5, a3);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C940]), "initWithKeySpecifier:", v5);
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), self->_wrappedKey, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "decrypt:withKey:error:", v8, v6, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;
      if (v9)
      {
        v11 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
        recoveryString = self->_recoveryString;
        self->_recoveryString = v11;

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (OTCustodianRecoveryKey)initWithWrappedKey:(id)a3 wrappingKey:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  OTCustodianRecoveryKey *v14;
  id *p_isa;
  OTCustodianRecoveryKey *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)OTCustodianRecoveryKey;
  v14 = -[OTCustodianRecoveryKey init](&v18, sel_init);
  p_isa = (id *)&v14->super.isa;
  if (v14
    && (objc_storeStrong((id *)&v14->_uuid, a5),
        objc_storeStrong(p_isa + 3, a3),
        objc_storeStrong(p_isa + 2, a4),
        !objc_msgSend(p_isa, "unwrapWithError:", a6)))
  {
    v16 = 0;
  }
  else
  {
    v16 = p_isa;
  }

  return v16;
}

- (BOOL)isEqualToCustodianRecoveryKey:(id)a3
{
  OTCustodianRecoveryKey *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (OTCustodianRecoveryKey *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    -[OTCustodianRecoveryKey uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTCustodianRecoveryKey uuid](v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[OTCustodianRecoveryKey wrappingKey](self, "wrappingKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OTCustodianRecoveryKey wrappingKey](v4, "wrappingKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToData:", v8))
      {
        -[OTCustodianRecoveryKey wrappedKey](self, "wrappedKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTCustodianRecoveryKey wrappedKey](v4, "wrappedKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToData:", v10))
        {
          -[OTCustodianRecoveryKey recoveryString](self, "recoveryString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTCustodianRecoveryKey recoveryString](v4, "recoveryString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  OTCustodianRecoveryKey *v4;
  BOOL v5;

  v4 = (OTCustodianRecoveryKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[OTCustodianRecoveryKey isEqualToCustodianRecoveryKey:](self, "isEqualToCustodianRecoveryKey:", v4);
  }

  return v5;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("uuid");
  -[OTCustodianRecoveryKey uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("recoveryString");
  -[OTCustodianRecoveryKey recoveryString](self, "recoveryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("wrappingKey");
  -[OTCustodianRecoveryKey wrappingKey](self, "wrappingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("wrappedKey");
  -[OTCustodianRecoveryKey wrappedKey](self, "wrappedKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (OTCustodianRecoveryKey)initWithCoder:(id)a3
{
  id v4;
  OTCustodianRecoveryKey *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSData *wrappingKey;
  uint64_t v10;
  NSData *wrappedKey;
  uint64_t v12;
  NSString *recoveryString;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OTCustodianRecoveryKey;
  v5 = -[OTCustodianRecoveryKey init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    wrappingKey = v5->_wrappingKey;
    v5->_wrappingKey = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    wrappedKey = v5->_wrappedKey;
    v5->_wrappedKey = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recoveryString"));
    v12 = objc_claimAutoreleasedReturnValue();
    recoveryString = v5->_recoveryString;
    v5->_recoveryString = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKey, CFSTR("wrappingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappedKey, CFSTR("wrappedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoveryString, CFSTR("recoveryString"));

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (NSString)recoveryString
{
  return self->_recoveryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryString, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation VMAccount

- (VMAccount)init
{
  -[VMAccount doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (VMAccount)initWithUUID:(id)a3
{
  id v5;
  VMAccount *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VMAccount;
  v6 = -[VMAccount init](&v8, sel_init);
  if (v6)
  {
    if (!v5)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s: parameter '%@' cannot be nil"), "-[VMAccount initWithUUID:]", CFSTR("UUID"));
    objc_storeStrong((id *)&v6->_UUID, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VMAccount *v5;

  v5 = -[VMAccount initWithUUID:](+[VMAccount allocWithZone:](VMAccount, "allocWithZone:"), "initWithUUID:", self->_UUID);
  -[VMAccount copyPropertiesWithZone:toAccount:](self, "copyPropertiesWithZone:toAccount:", a3, v5);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  VMMutableAccount *v5;

  v5 = -[VMAccount initWithUUID:]([VMMutableAccount alloc], "initWithUUID:", self->_UUID);
  -[VMAccount copyPropertiesWithZone:toAccount:](self, "copyPropertiesWithZone:toAccount:", a3, v5);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMAccount)initWithCoder:(id)a3
{
  id v4;
  VMAccount *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *abbreviatedAccountDescription;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *accountDescription;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  VMHandle *handle;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *isoCountryCode;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSString *serviceName;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSUUID *UUID;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VMAccount;
  v5 = -[VMAccount init](&v32, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_abbreviatedAccountDescription);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    abbreviatedAccountDescription = v5->_abbreviatedAccountDescription;
    v5->_abbreviatedAccountDescription = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_accountDescription);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    accountDescription = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (VMHandle *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_isoCountryCode);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v20;

    NSStringFromSelector(sel_isProvisioned);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_provisioned = objc_msgSend(v4, "decodeBoolForKey:", v22);

    v23 = objc_opt_class();
    NSStringFromSelector(sel_serviceName);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[VMAccount abbreviatedAccountDescription](self, "abbreviatedAccountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_abbreviatedAccountDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[VMAccount accountDescription](self, "accountDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[VMAccount handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[VMAccount isoCountryCode](self, "isoCountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isoCountryCode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[VMAccount isProvisioned](self, "isProvisioned");
  NSStringFromSelector(sel_isProvisioned);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  -[VMAccount serviceName](self, "serviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_serviceName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[VMAccount UUID](self, "UUID");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, v17);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_UUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMAccount UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_handle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMAccount handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isoCountryCode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMAccount isoCountryCode](self, "isoCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v8, v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_abbreviatedAccountDescription);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMAccount abbreviatedAccountDescription](self, "abbreviatedAccountDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v10, v11);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_accountDescription);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMAccount accountDescription](self, "accountDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v12, v13);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_serviceName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMAccount serviceName](self, "serviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v14, v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_isProvisioned);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VMAccount isProvisioned](self, "isProvisioned"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v16, v17);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[VMAccount isEqualToAccount:](self, "isEqualToAccount:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  -[VMAccount abbreviatedAccountDescription](self, "abbreviatedAccountDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[VMAccount accountDescription](self, "accountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[VMAccount isoCountryCode](self, "isoCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[VMAccount handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  if (-[VMAccount isProvisioned](self, "isProvisioned"))
    v11 = 1231;
  else
    v11 = 1237;
  -[VMAccount serviceName](self, "serviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10 ^ v11 ^ objc_msgSend(v12, "hash");
  -[VMAccount UUID](self, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (void)copyPropertiesWithZone:(_NSZone *)a3 toAccount:(id)a4
{
  NSString *abbreviatedAccountDescription;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  abbreviatedAccountDescription = self->_abbreviatedAccountDescription;
  v7 = a4;
  v8 = -[NSString copyWithZone:](abbreviatedAccountDescription, "copyWithZone:", a3);
  v9 = (void *)v7[4];
  v7[4] = v8;

  v10 = -[NSString copyWithZone:](self->_accountDescription, "copyWithZone:", a3);
  v11 = (void *)v7[3];
  v7[3] = v10;

  v12 = -[VMHandle copyWithZone:](self->_handle, "copyWithZone:", a3);
  v13 = (void *)v7[5];
  v7[5] = v12;

  v14 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3);
  v15 = (void *)v7[6];
  v7[6] = v14;

  *((_BYTE *)v7 + 8) = self->_provisioned;
  v16 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v17 = (id)v7[7];
  v7[7] = v16;

}

- (BOOL)isEqualToAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  unint64_t v47;

  v4 = a3;
  -[VMAccount abbreviatedAccountDescription](self, "abbreviatedAccountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abbreviatedAccountDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  v9 = (void *)v8;
  if (!(v7 | v8))
    goto LABEL_4;
  if (!v8)
  {
    v29 = 0;
    v13 = v7;
LABEL_37:

    goto LABEL_38;
  }
  v10 = objc_msgSend((id)v7, "isEqualToString:", v8);

  if (v10)
  {
LABEL_4:
    -[VMAccount accountDescription](self, "accountDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v14 = v12;
    v15 = (void *)v14;
    if (v13 | v14)
    {
      if (!v14)
      {
        v29 = 0;
        v19 = v13;
LABEL_35:

        goto LABEL_36;
      }
      v16 = objc_msgSend((id)v13, "isEqualToString:", v14);

      if (!v16)
      {
        v29 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    -[VMAccount isoCountryCode](self, "isoCountryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isoCountryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    v20 = v18;
    v21 = (void *)v20;
    if (v19 | v20)
    {
      if (!v20)
      {
        v29 = 0;
        v25 = v19;
LABEL_33:

        goto LABEL_34;
      }
      v22 = objc_msgSend((id)v19, "isEqualToString:", v20);

      if (!v22)
      {
        v29 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[VMAccount handle](self, "handle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    v26 = v24;
    v27 = (void *)v26;
    v47 = v25;
    if (v25 | v26)
    {
      if (!v26)
      {
        v29 = 0;
        v39 = (void *)v25;
LABEL_31:

        goto LABEL_32;
      }
      v44 = objc_msgSend((id)v25, "isEqual:", v26);

      if (!v44)
      {
LABEL_14:
        v29 = 0;
        v25 = v47;
LABEL_32:

        goto LABEL_33;
      }
    }
    v28 = -[VMAccount isProvisioned](self, "isProvisioned");
    if (v28 != objc_msgSend(v4, "isProvisioned"))
      goto LABEL_14;
    -[VMAccount serviceName](self, "serviceName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = v45;
    v33 = (void *)v32;
    v46 = (void *)v31;
    if (v31 | v32)
    {
      if (!v32)
      {
        v43 = 0;
        v29 = 0;
        v38 = (void *)v31;
        v25 = v47;
LABEL_29:

        v33 = v43;
LABEL_30:

        v39 = v46;
        goto LABEL_31;
      }
      v34 = (void *)v32;
      LODWORD(v41) = objc_msgSend(v46, "isEqualToString:", v32);

      v33 = v34;
      if (!(_DWORD)v41)
      {
        v29 = 0;
        v25 = v47;
        goto LABEL_30;
      }
    }
    v43 = v33;
    -[VMAccount UUID](self, "UUID", v41);
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v35;
    v29 = (v35 | v36) == 0;
    v42 = v37;
    if (v36)
      v29 = objc_msgSend(v37, "isEqual:", v36);

    v25 = v47;
    v38 = v42;
    goto LABEL_29;
  }
  v29 = 0;
LABEL_38:

  return v29;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)abbreviatedAccountDescription
{
  return self->_abbreviatedAccountDescription;
}

- (void)setAbbreviatedAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (VMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isProvisioned
{
  return self->_provisioned;
}

- (void)setProvisioned:(BOOL)a3
{
  self->_provisioned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_abbreviatedAccountDescription, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end

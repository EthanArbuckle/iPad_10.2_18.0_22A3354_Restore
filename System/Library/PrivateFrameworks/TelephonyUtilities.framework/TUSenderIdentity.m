@implementation TUSenderIdentity

- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 localizedName:(id)a5 localizedShortName:(id)a6 handle:(id)a7
{
  return -[TUSenderIdentity initWithUUID:accountUUID:localizedName:localizedShortName:localizedServiceName:handle:](self, "initWithUUID:accountUUID:localizedName:localizedShortName:localizedServiceName:handle:", a3, a4, a5, a6, &stru_1E38A53C8, a7);
}

- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 localizedName:(id)a5 localizedShortName:(id)a6 localizedServiceName:(id)a7 handle:(id)a8
{
  return -[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:](self, "initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:", a3, a4, CFSTR("xw"), a5, a6, a7, a8);
}

- (TUSenderIdentity)initWithUUID:(id)a3 accountUUID:(id)a4 ISOCountryCode:(id)a5 localizedName:(id)a6 localizedShortName:(id)a7 localizedServiceName:(id)a8 handle:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TUSenderIdentity *v23;
  uint64_t v24;
  NSString *ISOCountryCode;
  uint64_t v26;
  NSString *localizedName;
  uint64_t v28;
  NSString *localizedShortName;
  uint64_t v30;
  NSString *localizedServiceName;
  id obj;
  id v34;
  objc_super v35;

  v16 = a3;
  obj = a4;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v34 = a9;
  v22 = a9;
  v35.receiver = self;
  v35.super_class = (Class)TUSenderIdentity;
  v23 = -[TUSenderIdentity init](&v35, sel_init);
  if (v23)
  {
    if (v16)
    {
      if (v17)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", CFSTR("UUID"), obj, a9);
      if (v17)
      {
LABEL_4:
        if (v18)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", CFSTR("accountUUID"));
    if (v18)
    {
LABEL_5:
      if (v19)
        goto LABEL_6;
      goto LABEL_13;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", CFSTR("ISOCountryCode"));
    if (v19)
    {
LABEL_6:
      if (v20)
        goto LABEL_7;
      goto LABEL_14;
    }
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", CFSTR("localizedName"));
    if (v20)
    {
LABEL_7:
      if (v21)
      {
LABEL_8:
        objc_storeStrong((id *)&v23->_UUID, a3);
        objc_storeStrong((id *)&v23->_accountUUID, obj);
        v24 = objc_msgSend(v18, "copy");
        ISOCountryCode = v23->_ISOCountryCode;
        v23->_ISOCountryCode = (NSString *)v24;

        v26 = objc_msgSend(v19, "copy");
        localizedName = v23->_localizedName;
        v23->_localizedName = (NSString *)v26;

        v28 = objc_msgSend(v20, "copy");
        localizedShortName = v23->_localizedShortName;
        v23->_localizedShortName = (NSString *)v28;

        v30 = objc_msgSend(v21, "copy");
        localizedServiceName = v23->_localizedServiceName;
        v23->_localizedServiceName = (NSString *)v30;

        objc_storeStrong((id *)&v23->_handle, v34);
        goto LABEL_9;
      }
LABEL_15:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", CFSTR("localizedServiceName"));
      goto LABEL_8;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUSenderIdentity initWithUUID:accountUUID:ISOCountryCode:localizedName:localizedShortName:localizedServiceName:handle:]", CFSTR("localizedShortName"));
    if (v21)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_9:

  return v23;
}

- (TUSenderIdentity)initWithSenderIdentity:(id)a3
{
  id *v4;
  TUSenderIdentity *v5;
  TUSenderIdentity *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TUSenderIdentity;
  v5 = -[TUSenderIdentity init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_accountUUID, v4[2]);
    objc_storeStrong((id *)&v6->_handle, v4[3]);
    objc_storeStrong((id *)&v6->_ISOCountryCode, v4[4]);
    objc_storeStrong((id *)&v6->_localizedName, v4[5]);
    objc_storeStrong((id *)&v6->_localizedShortName, v4[6]);
    objc_storeStrong((id *)&v6->_localizedServiceName, v4[7]);
    objc_storeStrong((id *)&v6->_UUID, v4[1]);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUSenderIdentity initWithSenderIdentity:](+[TUSenderIdentity allocWithZone:](TUSenderIdentity, "allocWithZone:", a3), "initWithSenderIdentity:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUSenderIdentity)initWithCoder:(id)a3
{
  id v4;
  TUSenderIdentity *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *accountUUID;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TUHandle *handle;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *ISOCountryCode;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *localizedName;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *localizedShortName;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *localizedServiceName;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSUUID *UUID;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TUSenderIdentity;
  v5 = -[TUSenderIdentity init](&v35, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_accountUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    accountUUID = v5->_accountUUID;
    v5->_accountUUID = (NSUUID *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_ISOCountryCode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    ISOCountryCode = v5->_ISOCountryCode;
    v5->_ISOCountryCode = (NSString *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_localizedName);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_localizedShortName);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    localizedShortName = v5->_localizedShortName;
    v5->_localizedShortName = (NSString *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_localizedServiceName);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    localizedServiceName = v5->_localizedServiceName;
    v5->_localizedServiceName = (NSString *)v28;

    v30 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v32;

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[TUSenderIdentity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUSenderIdentity accountUUID](self, "accountUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUSenderIdentity handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUSenderIdentity ISOCountryCode](self, "ISOCountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ISOCountryCode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUSenderIdentity localizedName](self, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUSenderIdentity localizedShortName](self, "localizedShortName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedShortName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUSenderIdentity localizedServiceName](self, "localizedServiceName");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedServiceName);
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

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_UUID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_accountUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentity accountUUID](self, "accountUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_ISOCountryCode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentity ISOCountryCode](self, "ISOCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v8, v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_localizedName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentity localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v10, v11);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_localizedShortName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentity localizedShortName](self, "localizedShortName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v12, v13);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_localizedServiceName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentity localizedServiceName](self, "localizedServiceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v14, v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_handle);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSenderIdentity handle](self, "handle");
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
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUSenderIdentity isEqualToSenderIdentity:](self, "isEqualToSenderIdentity:", v4);

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
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[TUSenderIdentity UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUSenderIdentity accountUUID](self, "accountUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TUSenderIdentity handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[TUSenderIdentity ISOCountryCode](self, "ISOCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[TUSenderIdentity localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[TUSenderIdentity localizedShortName](self, "localizedShortName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[TUSenderIdentity localizedServiceName](self, "localizedServiceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqualToSenderIdentity:(id)a3
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
  void *v13;
  void *v14;
  int v15;
  char v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  -[TUSenderIdentity UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUSenderIdentity accountUUID](self, "accountUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TUSenderIdentity handle](self, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        -[TUSenderIdentity ISOCountryCode](self, "ISOCountryCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ISOCountryCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          v23 = v11;
          -[TUSenderIdentity localizedName](self, "localizedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedName");
          v24 = v13;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            -[TUSenderIdentity localizedShortName](self, "localizedShortName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "localizedShortName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v14;
            v15 = objc_msgSend(v14, "isEqualToString:");
            v11 = v23;
            if (v15)
            {
              -[TUSenderIdentity localizedServiceName](self, "localizedServiceName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "localizedServiceName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v19, "isEqualToString:", v18);

            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            v16 = 0;
            v11 = v23;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)accountUUID
{
  return self->_accountUUID;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)ISOCountryCode
{
  return self->_ISOCountryCode;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (NSString)localizedServiceName
{
  return self->_localizedServiceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedServiceName, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_accountUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end

@implementation TUNearbyDeviceHandle

- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4 deviceModel:(int64_t)a5 capabilities:(id)a6
{
  id v10;
  id v11;
  id v12;
  TUNearbyDeviceHandle *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSDictionary *knownIdentifiersByHandleType;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TUNearbyDeviceHandle;
  v13 = -[TUNearbyDeviceHandle init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    knownIdentifiersByHandleType = v13->_knownIdentifiersByHandleType;
    v13->_knownIdentifiersByHandleType = (NSDictionary *)v16;

    v13->_deviceModel = a5;
    objc_storeStrong((id *)&v13->_capabilities, a6);
  }

  return v13;
}

- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4 deviceModel:(int64_t)a5
{
  id v8;
  id v9;
  TUNearbyDeviceHandleCapabilities *v10;
  TUNearbyDeviceHandle *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(TUNearbyDeviceHandleCapabilities);
  v11 = -[TUNearbyDeviceHandle initWithName:knownIdentifiers:deviceModel:capabilities:](self, "initWithName:knownIdentifiers:deviceModel:capabilities:", v9, v8, a5, v10);

  return v11;
}

- (TUNearbyDeviceHandle)initWithName:(id)a3 knownIdentifiers:(id)a4
{
  id v6;
  id v7;
  TUNearbyDeviceHandleCapabilities *v8;
  TUNearbyDeviceHandle *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(TUNearbyDeviceHandleCapabilities);
  v9 = -[TUNearbyDeviceHandle initWithName:knownIdentifiers:deviceModel:capabilities:](self, "initWithName:knownIdentifiers:deviceModel:capabilities:", v7, v6, 0, v8);

  return v9;
}

- (TUNearbyDeviceHandle)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  TUNearbyDeviceHandleCapabilities *v14;
  TUNearbyDeviceHandle *v15;

  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObject:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(TUNearbyDeviceHandleCapabilities);
  v15 = -[TUNearbyDeviceHandle initWithName:knownIdentifiers:deviceModel:capabilities:](self, "initWithName:knownIdentifiers:deviceModel:capabilities:", v10, v13, 0, v14);

  return v15;
}

- (TUNearbyDeviceHandle)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5 capabilities:(id)a6
{
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  TUNearbyDeviceHandle *v17;

  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v11, "numberWithInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObject:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[TUNearbyDeviceHandle initWithName:knownIdentifiers:deviceModel:capabilities:](self, "initWithName:knownIdentifiers:deviceModel:capabilities:", v13, v16, 0, v12);
  return v17;
}

- (id)identifierDescription
{
  id v3;
  NSDictionary *knownIdentifiersByHandleType;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__TUNearbyDeviceHandle_identifierDescription__block_invoke;
  v7[3] = &unk_1E38A4920;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](knownIdentifiersByHandleType, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __45__TUNearbyDeviceHandle_identifierDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v8 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = CFSTR("Effective identifier");
  if (v5 == 1)
    v6 = CFSTR("Media route identifier");
  if (v5 == 2)
    v7 = CFSTR("IDS device identifier");
  else
    v7 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);

}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *name;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12.receiver = self;
  v12.super_class = (Class)TUNearbyDeviceHandle;
  -[TUNearbyDeviceHandle description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = CFSTR("<nil>");
  -[TUNearbyDeviceHandle identifierDescription](self, "identifierDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceModel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUNearbyDeviceHandleCapabilities description](self->_capabilities, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@: %@ - %@ - %@ - %@"), v4, name, v6, v8, v9);

  return v10;
}

- (NSDictionary)plistRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("name");
  -[TUNearbyDeviceHandle name](self, "name");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("<nil>");
  v15[0] = v5;
  v14[1] = CFSTR("deviceModel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TUNearbyDeviceHandle deviceModel](self, "deviceModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("identifiers");
  -[TUNearbyDeviceHandle identifierDescription](self, "identifierDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("capabilities");
  -[TUNearbyDeviceHandle capabilities](self, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("<nil>");
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (id)identifierWithType:(int64_t)a3
{
  NSDictionary *knownIdentifiersByHandleType;
  void *v4;
  void *v5;

  knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](knownIdentifiersByHandleType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEquivalentToDeviceHandle:(id)a3
{
  id v4;
  NSDictionary *knownIdentifiersByHandleType;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, _BYTE *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __51__TUNearbyDeviceHandle_isEquivalentToDeviceHandle___block_invoke;
    v17 = &unk_1E38A4948;
    v6 = v4;
    v18 = v6;
    v19 = &v20;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](knownIdentifiersByHandleType, "enumerateKeysAndObjectsUsingBlock:", &v14);
    if (*((_BYTE *)v21 + 24))
    {
      v7 = 1;
LABEL_11:

      _Block_object_dispose(&v20, 8);
      goto LABEL_12;
    }
    -[NSDictionary objectForKeyedSubscript:](self->_knownIdentifiersByHandleType, "objectForKeyedSubscript:", &unk_1E38E9400, v14, v15, v16, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "knownIdentifiersByHandleType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E38E9400);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "knownIdentifiersByHandleType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1E38E9418);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v12, "isEqualToString:", v8);

    }
    else
    {
      if (!v10)
      {
        v7 = 0;
        goto LABEL_10;
      }
      -[NSDictionary objectForKeyedSubscript:](self->_knownIdentifiersByHandleType, "objectForKeyedSubscript:", &unk_1E38E9418);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "isEqualToString:", v10);
    }

LABEL_10:
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

void __51__TUNearbyDeviceHandle_isEquivalentToDeviceHandle___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "knownIdentifiersByHandleType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v11, "isEqual:", v8);
  if ((_DWORD)v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isEqualToDeviceHandle:(id)a3
{
  id v4;
  NSDictionary *knownIdentifiersByHandleType;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
    objc_msgSend(v4, "knownIdentifiersByHandleType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSDictionary isEqual:](knownIdentifiersByHandleType, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSDictionary isEqualToDictionary:](self->_knownIdentifiersByHandleType, "isEqualToDictionary:", v4[4]);

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_knownIdentifiersByHandleType, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUNearbyDeviceHandle name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[TUNearbyDeviceHandle knownIdentifiersByHandleType](self, "knownIdentifiersByHandleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = -[TUNearbyDeviceHandle deviceModel](self, "deviceModel");
  -[TUNearbyDeviceHandle capabilities](self, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  v13 = (void *)objc_msgSend(v5, "initWithName:knownIdentifiers:deviceModel:capabilities:", v7, v9, v10, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbyDeviceHandle)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  TUNearbyDeviceHandle *v21;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_knownIdentifiersByHandleType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_deviceModel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = objc_msgSend(v16, "integerValue");
  else
    v17 = 0;
  v18 = objc_opt_class();
  NSStringFromSelector(sel_capabilities);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[TUNearbyDeviceHandle initWithName:knownIdentifiers:deviceModel:capabilities:](self, "initWithName:knownIdentifiers:deviceModel:capabilities:", v7, v13, v17, v20);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  NSDictionary *knownIdentifiersByHandleType;
  void *v8;
  void *v9;
  void *v10;
  TUNearbyDeviceHandleCapabilities *capabilities;
  id v12;

  name = self->_name;
  v5 = a3;
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", name, v6);

  knownIdentifiersByHandleType = self->_knownIdentifiersByHandleType;
  NSStringFromSelector(sel_knownIdentifiersByHandleType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", knownIdentifiersByHandleType, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceModel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceModel);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, v10);

  capabilities = self->_capabilities;
  NSStringFromSelector(sel_capabilities);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", capabilities, v12);

}

- (NSString)name
{
  return self->_name;
}

- (int64_t)deviceModel
{
  return self->_deviceModel;
}

- (TUNearbyDeviceHandleCapabilities)capabilities
{
  return self->_capabilities;
}

- (NSDictionary)knownIdentifiersByHandleType
{
  return self->_knownIdentifiersByHandleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownIdentifiersByHandleType, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

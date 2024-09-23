@implementation FMDBLEBeaconIdentifier

- (FMDBLEBeaconIdentifier)initWithBLEDevice:(id)a3 other:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FMDBLEBeaconIdentifier *v7;
  void *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDBLEBeaconIdentifier;
  v7 = -[FMDBLEBeaconIdentifier init](&v10, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDBLEBeaconIdentifier identifierBLEDevice:other:](FMDBLEBeaconIdentifier, "identifierBLEDevice:other:", v6, v4));
    -[FMDBLEBeaconIdentifier setString:](v7, "setString:", v8);

  }
  return v7;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeaconIdentifier string](self, "string"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeaconIdentifier string](self, "string"));
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeaconIdentifier string](self, "string"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  FMDBLEBeaconIdentifier *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = (FMDBLEBeaconIdentifier *)a3;
  if (v5 == self)
  {
    v9 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeaconIdentifier string](v5, "string"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeaconIdentifier string](self, "string"));
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FMDBLEBeaconIdentifier *v4;
  void *v5;

  v4 = -[FMDBLEBeaconIdentifier init](+[FMDBLEBeaconIdentifier allocWithZone:](FMDBLEBeaconIdentifier, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEBeaconIdentifier string](self, "string"));
  -[FMDBLEBeaconIdentifier setString:](v4, "setString:", v5);

  return v4;
}

+ (id)identifierBLEDevice:(id)a3 other:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothAddress"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_MACAddressString"));

  }
  else
  {
    v8 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advertisementFields"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("hsStatus")));

  if (v10)
  {
    v11 = objc_msgSend(v10, "unsignedIntValue");
    if ((dword_100304C2C & v11) != 0)
      v12 = CFSTR("_l");
    else
      v12 = CFSTR("_r");
    v13 = v12;
    if (v4)
    {
      if ((dword_100304C2C & v11) != 0)
        v14 = CFSTR("_r");
      else
        v14 = CFSTR("_l");
      v15 = v14;

      v13 = v15;
    }
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", v13));

    v8 = (void *)v16;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDBLEBeaconIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDBLEBeaconIdentifier *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDBLEBeaconIdentifier;
  v6 = -[FMDBLEBeaconIdentifier init](&v12, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("string");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDBLEBeaconIdentifier setString:](v6, "setString:", v10);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDBLEBeaconIdentifier string](self, "string"));
  v5 = NSStringFromSelector("string");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "encodeObject:forKey:", v7, v6);

}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end

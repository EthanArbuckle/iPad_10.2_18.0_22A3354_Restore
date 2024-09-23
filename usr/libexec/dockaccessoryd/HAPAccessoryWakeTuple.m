@implementation HAPAccessoryWakeTuple

- (HAPAccessoryWakeTuple)initWithPort:(int64_t)a3 wakeAddress:(id)a4 wakePattern:(id)a5
{
  id v9;
  id v10;
  HAPAccessoryWakeTuple *v11;
  HAPAccessoryWakeTuple *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HAPAccessoryWakeTuple;
  v11 = -[HAPAccessoryWakeTuple init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_wakePort = a3;
    objc_storeStrong((id *)&v11->_wakeAddress, a4);
    objc_storeStrong((id *)&v12->_wakePattern, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryWakeTuple wakeAddress](self, "wakeAddress"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryWakeTuple wakePattern](self, "wakePattern"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[HAPAccessoryWakeTuple wakePort](self, "wakePort");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPAccessoryWakeTuple *v5;
  uint64_t v6;
  HAPAccessoryWakeTuple *v7;
  HAPAccessoryWakeTuple *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  v5 = (HAPAccessoryWakeTuple *)a3;
  if (self == v5)
  {
    v15 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPAccessoryWakeTuple, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if (v8
      && (v9 = -[HAPAccessoryWakeTuple wakePort](self, "wakePort"),
          v9 == (id)-[HAPAccessoryWakeTuple wakePort](v8, "wakePort"))
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryWakeTuple wakeAddress](self, "wakeAddress")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryWakeTuple wakeAddress](v8, "wakeAddress")),
          v12 = HMFEqualObjects(v10, v11),
          v11,
          v10,
          v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryWakeTuple wakePattern](self, "wakePattern"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryWakeTuple wakePattern](v8, "wakePattern"));
      v15 = HMFEqualObjects(v13, v14);

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (NSString)wakeAddress
{
  return self->_wakeAddress;
}

- (int64_t)wakePort
{
  return self->_wakePort;
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakePattern, 0);
  objc_storeStrong((id *)&self->_wakeAddress, 0);
}

@end

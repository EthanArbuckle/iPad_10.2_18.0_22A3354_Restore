@implementation HAPDeviceID

- (HAPDeviceID)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (HAPDeviceID)initWithDeviceIDString:(id)a3
{
  id v4;
  uint64_t v5;
  uint8_t *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  HAPDeviceID *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = HAPDeviceIDLength;
  v6 = &buf[-((HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "UTF8String");
  v9 = objc_msgSend(v7, "length");
  if (TextToHardwareAddress(v8, v9, HAPDeviceIDLength, v6))
  {
    v11 = sub_10007CCE4(0, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sub_10007CD2C(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier string: %@", buf, 0x16u);

    }
    v15 = 0;
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, v5));
    self = -[HAPDeviceID initWithDeviceIDData:](self, "initWithDeviceIDData:", v12);
    v15 = self;
  }

  return v15;
}

- (HAPDeviceID)initWithDeviceIDData:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  HAPDeviceID *v7;
  NSData *v8;
  NSData *data;
  HAPDeviceID *v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 == (id)HAPDeviceIDLength)
  {
    v16.receiver = self;
    v16.super_class = (Class)HAPDeviceID;
    v7 = -[HAPDeviceID init](&v16, "init");
    if (v7)
    {
      v8 = (NSData *)objc_msgSend(v4, "copy");
      data = v7->_data;
      v7->_data = v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v11 = sub_10007CCE4(0, v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sub_10007CD2C(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier data: %@", buf, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

- (id)debugDescription
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDeviceID deviceIDString](self, "deviceIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: %@>"), v3, self, v4));

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDeviceID data](self, "data"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPDeviceID *v5;
  uint64_t v6;
  HAPDeviceID *v7;
  HAPDeviceID *v8;
  BOOL v9;

  v5 = (HAPDeviceID *)a3;
  if (self == v5)
  {
    v9 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPDeviceID, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if (v8)
      v9 = -[HAPDeviceID isEqualToDeviceID:](self, "isEqualToDeviceID:", v8);
    else
      v9 = 0;

  }
  return v9;
}

- (BOOL)isEqualToDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDeviceID data](self, "data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToData:", v6);
  return (char)v4;
}

- (NSString)deviceIDString
{
  char *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v3 = (char *)&v8 - ((3 * HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[HAPDeviceID data](self, "data")));
  v5 = objc_msgSend(v4, "bytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDeviceID data](self, "data"));
  HardwareAddressToCString(v5, objc_msgSend(v6, "length"), v3);

  return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPDeviceID)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  HAPDeviceID *v8;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("HAP.data"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    self = -[HAPDeviceID initWithDeviceIDData:](self, "initWithDeviceIDData:", v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDeviceID data](self, "data"));
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("HAP.data"));

  }
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

@implementation NFTrustSignResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rawData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustSignResponse trustObjectInternalRawNSData](self, "trustObjectInternalRawNSData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "NF_asHexString"));

  return (NSString *)v3;
}

- (NFTrustSignResponse)initWithCoder:(id)a3
{
  id v4;
  NFTrustSignResponse *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFTrustSignResponse;
  v5 = -[NFTrustObject initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("trustObjectInternalRawNSData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NFTrustSignResponse setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("trustObjectInternalRawNSData"));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NFTrustKey), CFSTR("key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NFTrustSignResponse setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("key"));

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("counterValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NFTrustSignResponse setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("counterValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustSignResponse trustObjectInternalRawNSData](self, "trustObjectInternalRawNSData"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("trustObjectInternalRawNSData"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustSignResponse key](self, "key"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("key"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[NFTrustSignResponse counterValue](self, "counterValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("counterValue"));

}

+ (id)signResponseWithRawData:(id)a3 counterValueData:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *Name;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_alloc((Class)a1);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setTrustObjectInternalRawNSData:", v7);
      if (v8)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", bswap32(*(_DWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes"))));
        objc_msgSend(v10, "setCounterValue:", v11);

      }
    }
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Could not create SignResponse with nil data", v18, ClassName, Name, 407);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(a1);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      *(_DWORD *)buf = 67109890;
      v27 = v23;
      v28 = 2082;
      v29 = object_getClassName(a1);
      v30 = 2082;
      v31 = sel_getName(a2);
      v32 = 1024;
      v33 = 407;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create SignResponse with nil data", buf, 0x22u);
    }

    v10 = 0;
  }

  return v10;
}

- (NSNumber)counterValue
{
  return self->_counterValue;
}

- (void)setCounterValue:(id)a3
{
  objc_storeStrong((id *)&self->_counterValue, a3);
}

- (NFTrustKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)trustObjectInternalRawNSData
{
  return self->_trustObjectInternalRawNSData;
}

- (void)setTrustObjectInternalRawNSData:(id)a3
{
  objc_storeStrong((id *)&self->_trustObjectInternalRawNSData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustObjectInternalRawNSData, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
}

@end

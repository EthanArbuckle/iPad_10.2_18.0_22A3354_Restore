@implementation NIDiscoveryToken

- (NIDiscoveryToken)initWithBytes:(id)a3
{
  id v6;
  NIDiscoveryToken *v7;
  NIDiscoveryToken *v8;
  uint64_t v9;
  NSData *identifyingSequence;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytes"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NIDiscoveryToken;
  v7 = -[NIDiscoveryToken init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_rawToken, a3);
    v9 = objc_claimAutoreleasedReturnValue(+[NIDiscoveryToken _identifyingSequenceFromBytes:](NIDiscoveryToken, "_identifyingSequenceFromBytes:", v6));
    identifyingSequence = v8->_identifyingSequence;
    v8->_identifyingSequence = (NSData *)v9;

  }
  return v8;
}

+ (id)_identifyingSequenceFromBytes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  NSMutableData *v21;

  v3 = a3;
  v4 = v3;
  if (!v3)
    __assert_rtn("+[NIDiscoveryToken _identifyingSequenceFromBytes:]", "NIConfiguration.mm", 67, "bytes");
  v5 = objc_msgSend(v3, "copy");
  v7 = (void *)OPACKDecodeData(v4, 8, 0);
  if (v7 && (v8 = objc_opt_class(NSDictionary, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_1001A423C;
    v20 = sub_1001A424C;
    v21 = objc_opt_new(NSMutableData);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001A4254;
    v13[3] = &unk_10080B648;
    v14 = v7;
    v15 = &v16;
    objc_msgSend(&off_10082BD40, "enumerateObjectsUsingBlock:", v13);
    v9 = objc_msgSend((id)v17[5], "length");
    v10 = v5;
    if (v9)
      v10 = (void *)v17[5];
    v11 = v10;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (id)objectInRawTokenOPACKDictForKey:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v7 = (void *)OPACKDecodeData(self->_rawToken, 8, 0);
  if (v7 && (v8 = objc_opt_class(NSDictionary, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));
  else
    v9 = 0;

  return v9;
}

- (int64_t)tokenVariant
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken objectInRawTokenOPACKDictForKey:](self, "objectInRawTokenOPACKDictForKey:", &off_10082BF98));
  if (v3
    && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && (unint64_t)objc_msgSend(v3, "integerValue") <= 1)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    v5 = 0;
  }

  return (int64_t)v5;
}

- (id)deviceCapabilities
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NIDeviceCapabilities *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken objectInRawTokenOPACKDictForKey:](self, "objectInRawTokenOPACKDictForKey:", &off_10082BFB0));
  if (v3 && (v4 = objc_opt_class(NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = -[NIDeviceCapabilities initWithBitmap:]([NIDeviceCapabilities alloc], "initWithBitmap:", objc_msgSend(v3, "unsignedCharValue"));
  else
    v5 = 0;

  return v5;
}

- (id)getIRK
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken rawToken](self, "rawToken"));
  v3 = (void *)OPACKDecodeData(v2, 8, &v10);

  if (v3 && (v5 = objc_opt_class(NSDictionary, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", &off_10082BF38));
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length") == (id)16)
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getSessionIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken rawToken](self, "rawToken"));
  v3 = (void *)OPACKDecodeData(v2, 8, &v10);

  if (v3 && (v5 = objc_opt_class(NSDictionary, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", &off_10082BF20));
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length") == (id)3)
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)serialize:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  NSMutableData *v12;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 0x3E8)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = sub_1001A423C;
    v11 = sub_1001A424C;
    v12 = objc_opt_new(NSMutableData);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001A47E8;
    v6[3] = &unk_10080B670;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)deserialize:(id)a3
{
  id v3;
  NSMutableSet *v4;
  unint64_t v5;
  id v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  NIDiscoveryToken *v11;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0xF4240)
  {
    v4 = objc_opt_new(NSMutableSet);
    v5 = 0;
    do
    {
      if (v5 >= (unint64_t)objc_msgSend(v3, "length"))
        break;
      v6 = objc_retainAutorelease(v3);
      v7 = objc_msgSend(v6, "bytes");
      v8 = v7[v5];
      v9 = v5 + 1;
      if (v7[v5])
      {
        if (v5 + v8 >= (unint64_t)objc_msgSend(v6, "length"))
          break;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", v5 + 1, v8));
        v11 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", v10);
        -[NSMutableSet addObject:](v4, "addObject:", v11);
        v9 += v8;

      }
      v5 = v9;
    }
    while (v9 < 0xF4240);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)rawTokenAsString
{
  return (NSString *)sub_10002D250(self->_rawToken, 0);
}

- (NIDiscoveryToken)initWithDeviceAddress:(unsigned __int16)a3
{
  void *v4;
  NIDiscoveryToken *v5;
  uint64_t v6;
  NSNumber *shortDeviceAddress;
  unsigned __int16 v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 2));
  v5 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", v4);

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v9));
    shortDeviceAddress = v5->_shortDeviceAddress;
    v5->_shortDeviceAddress = (NSNumber *)v6;

  }
  return v5;
}

- (id)shortDeviceAddress
{
  return self->_shortDeviceAddress;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSNumber *shortDeviceAddress;
  id v5;

  shortDeviceAddress = self->_shortDeviceAddress;
  v5 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  if (shortDeviceAddress)
    return objc_msgSend(v5, "initWithDeviceAddress:", (unsigned __int16)-[NSNumber intValue](self->_shortDeviceAddress, "intValue"));
  else
    return objc_msgSend(v5, "initWithBytes:", self->_rawToken);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawToken, CFSTR("rawToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shortDeviceAddress, CFSTR("shortDeviceAddress"));

}

- (NIDiscoveryToken)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NIDiscoveryToken *v15;
  NIDiscoveryToken *v16;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("rawToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    v9 = objc_opt_class(NSData, v7);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("shortDeviceAddress"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (v13)
      {
        v14 = objc_opt_class(NSNumber, v12);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
        {
          v16 = 0;
          goto LABEL_10;
        }
        v15 = -[NIDiscoveryToken initWithDeviceAddress:](self, "initWithDeviceAddress:", (unsigned __int16)objc_msgSend(v13, "intValue"));
      }
      else
      {
        v15 = -[NIDiscoveryToken initWithBytes:](self, "initWithBytes:", v8);
      }
      self = v15;
      v16 = self;
LABEL_10:

      goto LABEL_11;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  NIDiscoveryToken *v5;
  uint64_t v6;
  BOOL v7;

  v5 = (NIDiscoveryToken *)a3;
  if (v5 && (v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    if (v5 == self)
      v7 = 1;
    else
      v7 = -[NSData isEqualToData:](self->_identifyingSequence, "isEqualToData:", v5->_identifyingSequence);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_identifyingSequence, "hash");
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  return (id)CUPrintNSObjectMasked(self->_identifyingSequence, a2);
}

- (NSData)rawToken
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifyingSequence, 0);
  objc_storeStrong((id *)&self->_shortDeviceAddress, 0);
  objc_storeStrong((id *)&self->_rawToken, 0);
}

+ (id)generateFindingTokenWithIRK:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *Data;
  NIDiscoveryToken *v9;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v5 = a3;
  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NIFindingSupport.mm"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IRK"));

  }
  if (objc_msgSend(v5, "length") != (id)16)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NIFindingSupport.mm"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IRK.length == NIDiscoveryTokenIRKLengthBytes"));

  }
  v14[0] = &off_10082C268;
  v14[1] = &off_10082C298;
  v15[0] = &off_10082C280;
  v15[1] = v5;
  v14[2] = &off_10082C2B0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &unk_100477AA4, 3));
  v15[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  Data = (void *)OPACKEncoderCreateData(v7, 8, 0);
  if (!Data)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NIFindingSupport.mm"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenData"));

  }
  v9 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", Data);

  return v9;
}

+ (id)generateFindingTokenWithIRK:(id)a3 forExternalUse:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[NIDiscoveryToken generateFindingTokenWithIRK:](NIDiscoveryToken, "generateFindingTokenWithIRK:", a3, a4));
}

@end

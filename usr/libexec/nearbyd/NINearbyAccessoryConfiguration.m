@implementation NINearbyAccessoryConfiguration

- (NINearbyAccessoryConfiguration)initWithData:(NSData *)data error:(NSError *)error
{
  NSData *v7;
  _QWORD *v8;
  NSData *v9;
  id v10;
  int64_t v11;
  size_t v12;
  id v13;
  char v14;
  uint64_t v15;
  unsigned int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  unsigned int v19;
  uint64_t v20;
  NINearbyAccessoryConfiguration *v21;
  int v23;
  BOOL v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  id v29;
  void *v30;
  NIDiscoveryToken *v31;
  void *v32;
  void *v33;
  void *__p;
  _BYTE *v35;
  uint64_t v36;
  objc_super v37;
  int __dst;
  unsigned __int8 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  unsigned __int8 v43;
  unsigned __int16 v44;
  int v45;

  v7 = data;
  if (!v7)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v37.receiver = self;
  v37.super_class = (Class)NINearbyAccessoryConfiguration;
  v8 = -[NIConfiguration initInternal](&v37, "initInternal");
  if (!v8)
    goto LABEL_22;
  v9 = objc_retainAutorelease(v7);
  v10 = -[NSData bytes](v9, "bytes");
  v11 = -[NSData length](v9, "length");
  __p = 0;
  v35 = 0;
  v36 = 0;
  sub_10003A474(&__p, v10, (uint64_t)v10 + v11, v11);
  v12 = v35 - (_BYTE *)__p;
  if ((unint64_t)(v35 - (_BYTE *)__p) < 0x14)
    goto LABEL_5;
  v15 = 0;
  v16 = *(unsigned __int16 *)__p;
  v17 = !*((_WORD *)__p + 1) && v16 == 1;
  v18 = *((_WORD *)__p + 1) && v16 == 1;
  v19 = *((unsigned __int16 *)__p + 8);
  v20 = *((unsigned __int16 *)__p + 9);
  do
  {
    if (__PAIR64__(v20, v19) == __PAIR64__((unsigned __int16)word_10046F048[v15 + 1], (unsigned __int16)word_10046F048[v15]))
    {
      v23 = 1;
      goto LABEL_25;
    }
    v15 += 2;
  }
  while (v15 != 6);
  v23 = 0;
LABEL_25:
  v24 = v19 == 1 && v20 > 2;
  v25 = v24;
  v26 = v19 <= 1 ? v25 : 1;
  v27 = v16 > 1 || v17;
  if ((v27 | v18) != 1 || !(v23 | v26))
    goto LABEL_5;
  if (v23)
  {
    if (v19 != 1 || v20 >= 3)
      __assert_rtn("UWBConfigDataTotalLengthBytes", "NIFiRaDefinitions.h", 375, "false");
    if (v12 != 2 * v20 + 35 || *((unsigned __int8 *)__p + 15) != (2 * v20 + 19))
      goto LABEL_5;
  }
  else if (v26)
  {
    if (v12 < 0x27 || *((unsigned __int8 *)__p + 15) < 0x17u)
      goto LABEL_5;
    v12 = 39;
  }
  else
  {
    v12 = 0;
  }
  __dst = 0;
  v42 = 0;
  v45 = 0;
  v40 = 0;
  v41 = 0;
  memcpy(&__dst, __p, v12);
  if (v39 <= 0x14u
    && ((1 << v39) & 0x100401) != 0
    && v43 <= 1u
    && BYTE2(v45) <= 1u
    && HIBYTE(v45) <= 8u
    && ((1 << SHIBYTE(v45)) & 0x10D) != 0)
  {
    v28 = v44;
    v29 = -[NSData copy](v9, "copy");
    v30 = (void *)v8[4];
    v8[4] = v29;

    v31 = -[NIDiscoveryToken initWithDeviceAddress:]([NIDiscoveryToken alloc], "initWithDeviceAddress:", v28);
    v32 = (void *)v8[6];
    v8[6] = v31;

    *((_BYTE *)v8 + 40) = 0;
    v8[9] = 0;
    v14 = 1;
    goto LABEL_19;
  }
LABEL_5:
  if (error)
  {
    v13 = sub_1001B9D34(-5888, 0);
    v14 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue(v13);
  }
  else
  {
    v14 = 0;
  }
LABEL_19:
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
  if ((v14 & 1) == 0)
  {
    v21 = 0;
    goto LABEL_24;
  }
LABEL_22:
  v21 = v8;
LABEL_24:

  return v21;
}

- (NINearbyAccessoryConfiguration)initWithAccessoryData:(NSData *)accessoryData bluetoothPeerIdentifier:(NSUUID *)identifier error:(NSError *)error
{
  NSData *v9;
  NSUUID *v10;
  NSUUID *v11;
  NINearbyAccessoryConfiguration *v12;
  NINearbyAccessoryConfiguration *v13;
  NINearbyAccessoryConfiguration *v14;
  void *v16;
  void *v17;

  v9 = accessoryData;
  v10 = identifier;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryData"));

    if (v11)
      goto LABEL_3;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 676, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  v12 = -[NINearbyAccessoryConfiguration initWithData:error:](self, "initWithData:error:", v9, error);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bluetoothDeviceIdentifier, identifier);
    v13->_backgroundMode = 2;
    v14 = v13;
  }

  return v13;
}

- (NINearbyAccessoryConfiguration)initWithDataExchangeDisabledAndUsingParameterOverrides:(id)a3
{
  id v5;
  NINearbyAccessoryConfiguration *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  NSData *rawData;
  NIDiscoveryToken *v16;
  void *v17;
  NIDiscoveryToken *v18;
  NIDiscoveryToken *accessoryDiscoveryToken;
  void *v21;
  unint64_t v22;
  objc_super v23;

  v5 = a3;
  if (!v5)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIConfiguration.mm"), 697, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterOverrides"));

  }
  v23.receiver = self;
  v23.super_class = (Class)NINearbyAccessoryConfiguration;
  v6 = -[NIConfiguration initInternal](&v23, "initInternal");
  if (v6)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("DisableDataExchangeAndUseParameterOverrides"));
    -[NSMutableDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v5);
    objc_storeStrong((id *)&v6->_debugParameters, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("UWBSessionIdOverride")));
    v9 = objc_msgSend(v8, "unsignedLongLongValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("LocalAddressOverride")));
    v11 = objc_msgSend(v10, "unsignedLongLongValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("PeerAddressOverride")));
    v13 = ((_QWORD)v9 << 32) | ((_QWORD)v11 << 16) | (unint64_t)objc_msgSend(v12, "unsignedLongLongValue");

    v22 = v13;
    v14 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v22, 8));
    rawData = v6->_rawData;
    v6->_rawData = (NSData *)v14;

    v16 = [NIDiscoveryToken alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v6->_debugParameters, "objectForKeyedSubscript:", CFSTR("PeerAddressOverride")));
    v18 = -[NIDiscoveryToken initWithDeviceAddress:](v16, "initWithDeviceAddress:", objc_msgSend(v17, "unsignedShortValue"));
    accessoryDiscoveryToken = v6->_accessoryDiscoveryToken;
    v6->_accessoryDiscoveryToken = v18;

    v6->_cameraAssistanceEnabled = 0;
    v6->_backgroundMode = 0;

  }
  return v6;
}

- (BOOL)dataExchangeDisabledAndUsingParameterOverrides
{
  void *v3;
  unsigned __int8 v4;

  if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_debugParameters, "objectForKeyedSubscript:", CFSTR("DisableDataExchangeAndUseParameterOverrides")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSData)accessoryConfigData
{
  return self->_rawData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NINearbyAccessoryConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v13, "copyWithZone:");
  objc_msgSend(v5, "setBluetoothDeviceIdentifier:", self->_bluetoothDeviceIdentifier);
  objc_msgSend(v5, "setCameraAssistanceEnabled:", self->_cameraAssistanceEnabled);
  objc_msgSend(v5, "setBackgroundMode:", self->_backgroundMode);
  v6 = -[NSData copyWithZone:](self->_rawData, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NIDiscoveryToken copyWithZone:](self->_accessoryDiscoveryToken, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  if (self->_debugParameters)
  {
    v10 = -[NSDictionary initWithDictionary:copyItems:](+[NSDictionary allocWithZone:](NSDictionary, "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugParameters, 1);
    v11 = (void *)v5[8];
    v5[8] = v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NINearbyAccessoryConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawData, CFSTR("rawData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessoryDiscoveryToken, CFSTR("accessoryDiscoveryToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bluetoothDeviceIdentifier, CFSTR("bluetoothDeviceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_debugParameters, CFSTR("debugParameters"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cameraAssistanceEnabled, CFSTR("cameraAssistanceEnabled"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_backgroundMode, CFSTR("backgroundMode"));

}

- (NINearbyAccessoryConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NINearbyAccessoryConfiguration *v23;
  NINearbyAccessoryConfiguration *v24;
  int64_t v25;
  id v27;
  id obj;
  objc_super v29;
  _QWORD v30[3];
  uint64_t v31;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIDiscoveryToken, v5), CFSTR("accessoryDiscoveryToken"));
  obj = (id)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v7), CFSTR("rawData"));
  v27 = (id)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v9), CFSTR("bluetoothDeviceIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v31 = objc_opt_class(NSString, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

  v30[0] = objc_opt_class(NSString, v15);
  v30[1] = objc_opt_class(NSNumber, v16);
  v30[2] = objc_opt_class(NSData, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v14, v19, CFSTR("debugParameters")));
  v21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cameraAssistanceEnabled"));
  v22 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundMode"));
  v29.receiver = self;
  v29.super_class = (Class)NINearbyAccessoryConfiguration;
  v23 = -[NIConfiguration initWithCoder:](&v29, "initWithCoder:", v4);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_accessoryDiscoveryToken, obj);
    objc_storeStrong((id *)&v24->_debugParameters, v20);
    objc_storeStrong((id *)&v24->_rawData, v27);
    objc_storeStrong((id *)&v24->_bluetoothDeviceIdentifier, v11);
    v24->_cameraAssistanceEnabled = v21;
    if ((unint64_t)v22 >= 3)
      v25 = 0;
    else
      v25 = (int64_t)v22;
    v24->_backgroundMode = v25;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NINearbyAccessoryConfiguration *v7;
  NINearbyAccessoryConfiguration *v8;
  NSData *rawData;
  void *v10;
  unsigned int v11;
  void *v12;
  _BOOL4 v13;
  char v14;
  void *v15;
  unsigned int v16;
  int cameraAssistanceEnabled;
  unsigned int v18;
  int64_t backgroundMode;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned __int8 v23;
  BOOL v25;
  id v26;
  id v27;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NINearbyAccessoryConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v14 = 1;
    }
    else
    {
      rawData = self->_rawData;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration accessoryConfigData](v7, "accessoryConfigData"));
      v11 = -[NSData isEqualToData:](rawData, "isEqualToData:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](v8, "bluetoothDeviceIdentifier"));
      if (v12)
        v13 = 0;
      else
        v13 = self->_bluetoothDeviceIdentifier == 0;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration bluetoothDeviceIdentifier](v8, "bluetoothDeviceIdentifier"));
      v16 = objc_msgSend(v15, "isEqual:", self->_bluetoothDeviceIdentifier);

      cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      v18 = -[NINearbyAccessoryConfiguration isCameraAssistanceEnabled](v8, "isCameraAssistanceEnabled");
      backgroundMode = self->_backgroundMode;
      v26 = -[NINearbyAccessoryConfiguration backgroundMode](v8, "backgroundMode");
      v27 = (id)backgroundMode;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration debugParameters](v8, "debugParameters"));
      v21 = v11;
      if (v20)
        v25 = 0;
      else
        v25 = self->_debugParameters == 0;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration debugParameters](v8, "debugParameters"));
      v23 = objc_msgSend(v22, "isEqualToDictionary:", self->_debugParameters);

      v14 = 0;
      if ((v21 & (v13 | v16)) == 1 && cameraAssistanceEnabled == v18)
      {
        if (v27 == v26)
          v14 = v25 | v23;
        else
          v14 = 0;
      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = (unint64_t)-[NSData hash](self->_rawData, "hash");
  v4 = -[NIDiscoveryToken hash](self->_accessoryDiscoveryToken, "hash");
  return v3 ^ v4 ^ (unint64_t)-[NSUUID hash](self->_bluetoothDeviceIdentifier, "hash") ^ self->_cameraAssistanceEnabled ^ self->_backgroundMode ^ 0x1F;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyAccessoryConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  id v3;
  NIDiscoveryToken *accessoryDiscoveryToken;
  void *v5;
  NSUUID *bluetoothDeviceIdentifier;
  void *v7;
  const char *v8;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_10081D5E0);
  accessoryDiscoveryToken = self->_accessoryDiscoveryToken;
  if (accessoryDiscoveryToken)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](accessoryDiscoveryToken, "descriptionInternal"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Device Token: %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("Device Token: null"));
  }
  bluetoothDeviceIdentifier = self->_bluetoothDeviceIdentifier;
  if (bluetoothDeviceIdentifier)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](bluetoothDeviceIdentifier, "UUIDString"));
    objc_msgSend(v3, "appendFormat:", CFSTR(", Bluetooth Device: %@"), v7);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(", Bluetooth Device: null"));
  }
  if (self->_cameraAssistanceEnabled)
    v8 = "Yes";
  else
    v8 = "No";
  objc_msgSend(v3, "appendFormat:", CFSTR(", isCameraAssistanceEnabled: %s"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(", backgroundMode: %s"), +[NIUtils NISessionBackgroundModeToString:](NIUtils, "NISessionBackgroundModeToString:", self->_backgroundMode));
  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (NIDiscoveryToken)accessoryDiscoveryToken
{
  return self->_accessoryDiscoveryToken;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (NSUUID)bluetoothDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBluetoothDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDebugParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_backgroundMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end

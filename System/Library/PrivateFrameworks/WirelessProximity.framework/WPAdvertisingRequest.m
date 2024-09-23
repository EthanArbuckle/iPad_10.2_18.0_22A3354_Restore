@implementation WPAdvertisingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)requestForClientType:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setClientType:", v3);
  return v4;
}

- (WPAdvertisingRequest)init
{
  WPAdvertisingRequest *v2;
  WPAdvertisingRequest *v3;
  uint64_t v4;
  NSData *advertisingData;
  uint64_t v6;
  NSDictionary *advertisingOptions;
  NSNumber *advertisementRequestedAt;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WPAdvertisingRequest;
  v2 = -[WPAdvertisingRequest init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_advertisingRate = 290;
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v4 = objc_claimAutoreleasedReturnValue();
    advertisingData = v3->_advertisingData;
    v3->_advertisingData = (NSData *)v4;

    *(_WORD *)&v3->_clientType = 27;
    v3->_stopOnAdvertisingAddressChange = 0;
    v3->_priorityValue = 0;
    v3->_updateTime = 0.0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    advertisingOptions = v3->_advertisingOptions;
    v3->_advertisingOptions = (NSDictionary *)v6;

    v3->_holdVoucher = 0;
    advertisementRequestedAt = v3->_advertisementRequestedAt;
    v3->_advertisementRequestedAt = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setClientType:", -[WPAdvertisingRequest clientType](self, "clientType"));
    -[WPAdvertisingRequest advertisingData](self, "advertisingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAdvertisingData:", v5);

    objc_msgSend(v4, "setAdvertisingRate:", -[WPAdvertisingRequest advertisingRate](self, "advertisingRate"));
    objc_msgSend(v4, "setPriorityValue:", -[WPAdvertisingRequest priorityValue](self, "priorityValue"));
    -[WPAdvertisingRequest updateTime](self, "updateTime");
    objc_msgSend(v4, "setUpdateTime:");
    objc_msgSend(v4, "setConnectable:", -[WPAdvertisingRequest connectable](self, "connectable"));
    -[WPAdvertisingRequest advertisingOptions](self, "advertisingOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAdvertisingOptions:", v6);

    objc_msgSend(v4, "setStopOnAdvertisingAddressChange:", -[WPAdvertisingRequest stopOnAdvertisingAddressChange](self, "stopOnAdvertisingAddressChange"));
    objc_msgSend(v4, "setHoldVoucher:", -[WPAdvertisingRequest holdVoucher](self, "holdVoucher"));
    -[WPAdvertisingRequest advertisementRequestedAt](self, "advertisementRequestedAt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAdvertisementRequestedAt:", v7);

  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  double v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[WPAdvertisingRequest clientType](self, "clientType");
  v5 = -[WPAdvertisingRequest priorityValue](self, "priorityValue");
  v6 = -[WPAdvertisingRequest advertisingRate](self, "advertisingRate");
  v7 = (double)-[WPAdvertisingRequest advertisingRate](self, "advertisingRate") * 0.625;
  -[WPAdvertisingRequest advertisingData](self, "advertisingData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WPAdvertisingRequest connectable](self, "connectable");
  v10 = -[WPAdvertisingRequest stopOnAdvertisingAddressChange](self, "stopOnAdvertisingAddressChange");
  -[WPAdvertisingRequest advertisingOptions](self, "advertisingOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPAdvertisingRequest advertisementRequestedAt](self, "advertisementRequestedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("advertising request of type %ld, priority %ld, UseFG %ld (%.2f ms), data %@, connectable %d, addr change %d, options %@, advertisementRequestedAt %llu"), v4, v5, v6, *(_QWORD *)&v7, v8, v9, v10, v11, objc_msgSend(v12, "longLongValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (WPAdvertisingRequest)initWithCoder:(id)a3
{
  id v4;
  WPAdvertisingRequest *v5;
  uint64_t v6;
  NSData *advertisingData;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *advertisingOptions;
  uint64_t v14;
  NSNumber *advertisementRequestedAt;
  objc_super v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WPAdvertisingRequest;
  v5 = -[WPAdvertisingRequest init](&v17, sel_init);
  if (v5)
  {
    v5->_clientType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kClientType"));
    v5->_advertisingRate = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kAdvertisingRate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAdvertisingData"));
    v6 = objc_claimAutoreleasedReturnValue();
    advertisingData = v5->_advertisingData;
    v5->_advertisingData = (NSData *)v6;

    v5->_priorityValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kPriorityValue"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kUpdateTime"));
    v5->_updateTime = v8;
    v5->_connectable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kConnectableAdvert"));
    v9 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kAdvertisingOptions"));
    v12 = objc_claimAutoreleasedReturnValue();
    advertisingOptions = v5->_advertisingOptions;
    v5->_advertisingOptions = (NSDictionary *)v12;

    v5->_stopOnAdvertisingAddressChange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kStopOnAddressChange"));
    v5->_holdVoucher = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHoldVoucher"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAdvertisingRequestedAt"));
    v14 = objc_claimAutoreleasedReturnValue();
    advertisementRequestedAt = v5->_advertisementRequestedAt;
    v5->_advertisementRequestedAt = (NSNumber *)v14;

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
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPAdvertisingRequest clientType](self, "clientType"), CFSTR("kClientType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPAdvertisingRequest advertisingRate](self, "advertisingRate"), CFSTR("kAdvertisingRate"));
  -[WPAdvertisingRequest advertisingData](self, "advertisingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAdvertisingData"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WPAdvertisingRequest priorityValue](self, "priorityValue"), CFSTR("kPriorityValue"));
  -[WPAdvertisingRequest updateTime](self, "updateTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kUpdateTime"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPAdvertisingRequest connectable](self, "connectable"), CFSTR("kConnectableAdvert"));
  -[WPAdvertisingRequest advertisingOptions](self, "advertisingOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kAdvertisingOptions"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WPAdvertisingRequest stopOnAdvertisingAddressChange](self, "stopOnAdvertisingAddressChange"), CFSTR("kStopOnAddressChange"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPAdvertisingRequest holdVoucher](self, "holdVoucher"), CFSTR("kHoldVoucher"));
  -[WPAdvertisingRequest advertisementRequestedAt](self, "advertisementRequestedAt");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kAdvertisingRequestedAt"));

}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "priorityValue");
  if (v5 <= -[WPAdvertisingRequest priorityValue](self, "priorityValue"))
  {
    v7 = objc_msgSend(v4, "priorityValue");
    if (v7 == -[WPAdvertisingRequest priorityValue](self, "priorityValue"))
    {
      v6 = 0;
    }
    else
    {
      v8 = objc_msgSend(v4, "priorityValue");
      if (v8 >= -[WPAdvertisingRequest priorityValue](self, "priorityValue"))
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("PriorityValueError"), CFSTR("There was an error comparing the priority values. Are you sure it was set for the advertising request?"), 0);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_exception_throw(v10);
      }
      v6 = -1;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)setAdvertisingData:(id)a3
{
  NSData *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  NSData *advertisingData;
  id v11;

  v4 = (NSData *)a3;
  v5 = -[WPAdvertisingRequest clientType](self, "clientType");
  v6 = -[NSData length](v4, "length");
  v7 = v5 == 18;
  v8 = 28;
  if (v5 == 18)
    v9 = 31;
  else
    v9 = 28;
  if (v7)
    v8 = 31;
  if (v6 + 6 > v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data that was provided is too large (%ld) to fit in a BTLE advertising packet (%d)"), -[NSData length](v4, "length") + 6, v9);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("WPBadData"), objc_claimAutoreleasedReturnValue(), 0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_exception_throw(v11);
  }
  advertisingData = self->_advertisingData;
  self->_advertisingData = v4;

}

- (void)setClientType:(unsigned __int8)a3
{
  uint64_t v5;

  switch(a3)
  {
    case 0u:
    case 1u:
    case 3u:
    case 6u:
    case 7u:
    case 0x11u:
    case 0x1Bu:
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Advertising not supported"), CFSTR("Advertising is not supported for client type %hhu"), a3);
      break;
    case 2u:
      v5 = 9;
      goto LABEL_23;
    case 4u:
      v5 = 6;
      goto LABEL_23;
    case 5u:
      v5 = 15;
      goto LABEL_23;
    case 8u:
      v5 = 17;
      goto LABEL_23;
    case 9u:
      v5 = 8;
      goto LABEL_23;
    case 0xAu:
      v5 = 10;
      goto LABEL_23;
    case 0xBu:
      v5 = 5;
      goto LABEL_23;
    case 0xCu:
      v5 = 7;
      goto LABEL_23;
    case 0xDu:
      v5 = 12;
      goto LABEL_23;
    case 0xEu:
      v5 = 11;
      goto LABEL_23;
    case 0xFu:
      v5 = 14;
      goto LABEL_23;
    case 0x10u:
      v5 = 3;
      goto LABEL_23;
    case 0x12u:
      v5 = 99;
      goto LABEL_23;
    case 0x13u:
      v5 = 13;
      goto LABEL_23;
    case 0x14u:
    case 0x17u:
    case 0x19u:
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("WPClientType not used"), CFSTR("WPClientType: %hhu not used in advertising"), a3);
      break;
    case 0x15u:
      v5 = 16;
      goto LABEL_23;
    case 0x16u:
      v5 = 1;
      goto LABEL_23;
    case 0x18u:
      v5 = 2;
      goto LABEL_23;
    case 0x1Au:
      v5 = 4;
LABEL_23:
      -[WPAdvertisingRequest setPriorityValue:](self, "setPriorityValue:", v5);
      break;
    default:
      break;
  }
  self->_clientType = a3;
}

- (void)changePriorityValue:(int64_t)a3
{
  if (a3 == 1)
  {
    -[WPAdvertisingRequest setPriorityValue:](self, "setPriorityValue:", 99);
  }
  else if (!a3)
  {
    -[WPAdvertisingRequest setClientType:](self, "setClientType:", -[WPAdvertisingRequest clientType](self, "clientType"));
  }
}

- (BOOL)isValidOnConnectableInstance
{
  return (self->_clientType > 0x16uLL) | (0x37FBFFu >> self->_clientType) & 1;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (NSData)advertisingData
{
  return self->_advertisingData;
}

- (int64_t)advertisingRate
{
  return self->_advertisingRate;
}

- (void)setAdvertisingRate:(int64_t)a3
{
  self->_advertisingRate = a3;
}

- (int64_t)priorityValue
{
  return self->_priorityValue;
}

- (void)setPriorityValue:(int64_t)a3
{
  self->_priorityValue = a3;
}

- (double)updateTime
{
  return self->_updateTime;
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (BOOL)connectable
{
  return self->_connectable;
}

- (void)setConnectable:(BOOL)a3
{
  self->_connectable = a3;
}

- (NSDictionary)advertisingOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAdvertisingOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (BOOL)stopOnAdvertisingAddressChange
{
  return self->_stopOnAdvertisingAddressChange;
}

- (void)setStopOnAdvertisingAddressChange:(BOOL)a3
{
  self->_stopOnAdvertisingAddressChange = a3;
}

- (BOOL)holdVoucher
{
  return self->_holdVoucher;
}

- (void)setHoldVoucher:(BOOL)a3
{
  self->_holdVoucher = a3;
}

- (BOOL)enableEPAForAdvertising
{
  return self->_enableEPAForAdvertising;
}

- (void)setEnableEPAForAdvertising:(BOOL)a3
{
  self->_enableEPAForAdvertising = a3;
}

- (NSNumber)advertisementRequestedAt
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdvertisementRequestedAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementRequestedAt, 0);
  objc_storeStrong((id *)&self->_advertisingOptions, 0);
  objc_storeStrong((id *)&self->_advertisingData, 0);
}

@end

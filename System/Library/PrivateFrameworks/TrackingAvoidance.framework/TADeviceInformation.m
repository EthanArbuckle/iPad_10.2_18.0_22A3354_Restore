@implementation TADeviceInformation

- (TADeviceInformation)initWithTASPAdvertisement:(id)a3 deviceType:(unint64_t)a4 notificationState:(unint64_t)a5 date:(id)a6
{
  id v10;
  id v11;
  TADeviceInformation *v12;
  TADeviceInformation *v13;
  uint64_t v14;
  TASPAdvertisement *advertisement;
  uint64_t v16;
  NSDate *date;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TADeviceInformation;
  v12 = -[TADeviceInformation init](&v19, sel_init);
  if (!v12)
    goto LABEL_5;
  v13 = 0;
  if (v10 && v11)
  {
    v14 = objc_msgSend(v10, "copy");
    advertisement = v12->_advertisement;
    v12->_advertisement = (TASPAdvertisement *)v14;

    v12->_deviceType = a4;
    v12->_notificationState = a5;
    v16 = objc_msgSend(v11, "copy");
    date = v12->_date;
    v12->_date = (NSDate *)v16;

LABEL_5:
    v13 = v12;
  }

  return v13;
}

+ (id)deviceTypeToString:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Invalid");
  else
    return off_24D8153D8[a3];
}

+ (id)notificationStateToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Invalid");
  else
    return off_24D815400[a3];
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[TADeviceInformation advertisement](self, "advertisement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[TADeviceInformation deviceType](self, "deviceType");
  v6 = v5 ^ -[TADeviceInformation notificationState](self, "notificationState") ^ v4;
  -[TADeviceInformation date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TADeviceInformation *v6;
  TADeviceInformation *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (TADeviceInformation *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[TADeviceInformation advertisement](self, "advertisement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TADeviceInformation advertisement](v7, "advertisement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[TADeviceInformation advertisement](self, "advertisement"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[TADeviceInformation advertisement](v7, "advertisement"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v11 = -[TADeviceInformation deviceType](self, "deviceType");
        if (v11 == -[TADeviceInformation deviceType](v7, "deviceType")
          && (v12 = -[TADeviceInformation notificationState](self, "notificationState"),
              v12 == -[TADeviceInformation notificationState](v7, "notificationState")))
        {
          -[TADeviceInformation date](self, "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TADeviceInformation date](v7, "date");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v13 == (void *)v14)
          {

            v10 = 1;
          }
          else
          {
            v15 = (void *)v14;
            -[TADeviceInformation date](self, "date");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[TADeviceInformation date](v7, "date");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v18, "isEqual:", v16);

          }
        }
        else
        {
          v10 = 0;
        }
        if (v8 == v9)
          goto LABEL_15;
      }
      else
      {
        v10 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("Advertisement");
  -[TADeviceInformation advertisement](self, "advertisement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("DeviceType");
  +[TADeviceInformation deviceTypeToString:](TADeviceInformation, "deviceTypeToString:", self->_deviceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("NotificationState");
  +[TADeviceInformation notificationStateToString:](TADeviceInformation, "notificationStateToString:", self->_notificationState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("Date");
  -[TADeviceInformation date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getDateString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[TADeviceInformation descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TADeviceInformation initWithTASPAdvertisement:deviceType:notificationState:date:]([TADeviceInformation alloc], "initWithTASPAdvertisement:deviceType:notificationState:date:", self->_advertisement, self->_deviceType, self->_notificationState, self->_date);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TADeviceInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  TADeviceInformation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Advertisement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DeviceType"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NotificationState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TADeviceInformation initWithTASPAdvertisement:deviceType:notificationState:date:](self, "initWithTASPAdvertisement:deviceType:notificationState:date:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  TASPAdvertisement *advertisement;
  id v5;

  advertisement = self->_advertisement;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", advertisement, CFSTR("Advertisement"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("DeviceType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationState, CFSTR("NotificationState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("Date"));

}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x219A13570]();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v6);
}

- (id)getDate
{
  return self->_date;
}

- (TASPAdvertisement)advertisement
{
  return self->_advertisement;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
}

@end

@implementation DeviceRegionCodeInput

- (DeviceRegionCodeInput)init
{
  DeviceRegionCodeInput *v2;
  uint64_t v3;
  NSString *deviceRegionCode;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DeviceRegionCodeInput;
  v2 = -[EligibilityInput initWithInputType:status:process:](&v6, "initWithInputType:status:process:", 6, 0, CFSTR("eligibilityd"));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DeviceRegionCodeInput _mgDeviceRegionCode](DeviceRegionCodeInput, "_mgDeviceRegionCode"));
    deviceRegionCode = v2->_deviceRegionCode;
    v2->_deviceRegionCode = (NSString *)v3;

  }
  return v2;
}

- (BOOL)isChinaSKU
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CH"));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeviceRegionCodeInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (DeviceRegionCodeInput)initWithCoder:(id)a3
{
  DeviceRegionCodeInput *v3;
  uint64_t v4;
  NSString *deviceRegionCode;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceRegionCodeInput;
  v3 = -[EligibilityInput initWithInputType:status:process:](&v7, "initWithInputType:status:process:", 6, 0, CFSTR("eligibilityd"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[DeviceRegionCodeInput _mgDeviceRegionCode](DeviceRegionCodeInput, "_mgDeviceRegionCode"));
    deviceRegionCode = v3->_deviceRegionCode;
    v3->_deviceRegionCode = (NSString *)v4;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DeviceRegionCodeInput;
  v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceRegionCode:", v7);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceRegionCodeInput;
  v3 = -[EligibilityInput hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DeviceRegionCodeInput *v4;
  uint64_t v5;
  DeviceRegionCodeInput *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = (DeviceRegionCodeInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)DeviceRegionCodeInput;
  if (!-[EligibilityInput isEqual:](&v13, "isEqual:", v4))
    goto LABEL_9;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_11;
  }
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](v6, "deviceRegionCode"));
    v9 = sub_1000163A4(v7, v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_10000C5FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[DeviceRegionCodeInput isEqual:]";
        v16 = 2080;
        v17 = "deviceRegionCode";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }

    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  v8.receiver = self;
  v8.super_class = (Class)DeviceRegionCodeInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[DeviceRegionCodeInput deviceRegionCode:\"%@\" %@]"), v3, v5));

  return v6;
}

- (NSString)deviceRegionCode
{
  return self->_deviceRegionCode;
}

- (void)setDeviceRegionCode:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRegionCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRegionCode, 0);
}

+ (id)_mgDeviceRegionCode
{
  return (id)MGGetStringAnswer(CFSTR("RegionCode"), a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

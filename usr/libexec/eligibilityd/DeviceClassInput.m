@implementation DeviceClassInput

- (DeviceClassInput)init
{
  DeviceClassInput *v2;
  uint64_t v3;
  NSString *deviceClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DeviceClassInput;
  v2 = -[EligibilityInput initWithInputType:status:process:](&v6, "initWithInputType:status:process:", 3, 0, CFSTR("eligibilityd"));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DeviceClassInput _mgDeviceClass](DeviceClassInput, "_mgDeviceClass"));
    deviceClass = v2->_deviceClass;
    v2->_deviceClass = (NSString *)v3;

  }
  return v2;
}

- (BOOL)isiPad
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

- (BOOL)isiPhone
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeviceClassInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (DeviceClassInput)initWithCoder:(id)a3
{
  DeviceClassInput *v3;
  uint64_t v4;
  NSString *deviceClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceClassInput;
  v3 = -[EligibilityInput initWithInputType:status:process:](&v7, "initWithInputType:status:process:", 3, 0, CFSTR("eligibilityd"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[DeviceClassInput _mgDeviceClass](DeviceClassInput, "_mgDeviceClass"));
    deviceClass = v3->_deviceClass;
    v3->_deviceClass = (NSString *)v4;

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
  v9.super_class = (Class)DeviceClassInput;
  v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceClass:", v7);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceClassInput;
  v3 = -[EligibilityInput hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DeviceClassInput *v4;
  uint64_t v5;
  DeviceClassInput *v6;
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

  v4 = (DeviceClassInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)DeviceClassInput;
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](v6, "deviceClass"));
    v9 = sub_1000163A4(v7, v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_10000C5FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[DeviceClassInput isEqual:]";
        v16 = 2080;
        v17 = "deviceClass";
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  v8.receiver = self;
  v8.super_class = (Class)DeviceClassInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[DeviceClassInput deviceClass:\"%@\" %@]"), v3, v5));

  return v6;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

+ (id)_mgDeviceClass
{
  return (id)MGGetStringAnswer(CFSTR("DeviceClass"), a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

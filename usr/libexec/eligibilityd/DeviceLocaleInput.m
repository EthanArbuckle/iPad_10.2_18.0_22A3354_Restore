@implementation DeviceLocaleInput

- (NSString)deviceLocale
{
  return self->_deviceLocale;
}

- (DeviceLocaleInput)initWithDeviceLocale:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8;
  __CFString *v9;
  xpc_type_t type;
  const _xpc_type_s *v11;
  id v12;
  NSObject *v13;
  DeviceLocaleInput *v14;
  DeviceLocaleInput *v15;
  DeviceLocaleInput *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *name;

  v8 = a3;
  v9 = (__CFString *)a5;
  if (v8)
  {
    type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_string)
    {
      v11 = type;
      v12 = sub_10000C5FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[DeviceLocaleInput initWithDeviceLocale:status:process:]";
        v21 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Device locale input is wrong data type: %s", buf, 0x16u);
      }
      v14 = 0;
      goto LABEL_14;
    }
    v13 = _CFXPCCreateCFObjectFromXPCObject(v8);
  }
  else
  {
    v13 = 0;
  }
  if (a4 == 1 && !v13)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[DeviceLocaleInput fallbackDeviceLocale](DeviceLocaleInput, "fallbackDeviceLocale"));

    a4 = 0;
    v9 = CFSTR("eligibilityd");
  }
  v18.receiver = self;
  v18.super_class = (Class)DeviceLocaleInput;
  v15 = -[EligibilityInput initWithInputType:status:process:](&v18, "initWithInputType:status:process:", 4, a4, v9);
  v16 = v15;
  if (v15)
    objc_storeStrong((id *)&v15->_deviceLocale, v13);
  self = v16;
  v14 = self;
LABEL_14:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DeviceLocaleInput;
  v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceLocale"));

}

- (DeviceLocaleInput)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  DeviceLocaleInput *v8;
  objc_super v10;
  objc_super v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("deviceLocale"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)DeviceLocaleInput;
    v8 = -[EligibilityInput initWithInputType:status:process:](&v10, "initWithInputType:status:process:", 4, 0, CFSTR("eligibilityd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceLocaleInput fallbackDeviceLocale](DeviceLocaleInput, "fallbackDeviceLocale"));
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = (void *)v6;
  v11.receiver = self;
  v11.super_class = (Class)DeviceLocaleInput;
  v8 = -[EligibilityInput initWithCoder:](&v11, "initWithCoder:", v4);
  if (v8)
LABEL_3:
    objc_storeStrong((id *)&v8->_deviceLocale, v7);
LABEL_4:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DeviceLocaleInput;
  v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceLocale:", v7);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceLocaleInput;
  v3 = -[EligibilityInput hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DeviceLocaleInput *v4;
  uint64_t v5;
  DeviceLocaleInput *v6;
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

  v4 = (DeviceLocaleInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)DeviceLocaleInput;
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](v6, "deviceLocale"));
    v9 = sub_1000163A4(v7, v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_10000C5FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[DeviceLocaleInput isEqual:]";
        v16 = 2080;
        v17 = "deviceLocale";
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
  v8.receiver = self;
  v8.super_class = (Class)DeviceLocaleInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[DeviceLocaleInput deviceLocale:\"%@\" %@]"), v3, v5));

  return v6;
}

- (void)setDeviceLocale:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLocale, 0);
}

+ (id)fallbackDeviceLocale
{
  void *v2;
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUsername"));

  if (v3)
  {
    v4 = (void *)CFPreferencesCopyValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication, v3, kCFPreferencesAnyHost);
    if (v4)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "regionCode"));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

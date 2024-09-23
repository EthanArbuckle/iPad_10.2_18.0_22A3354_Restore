@implementation ChinaCellularInput

- (ChinaCellularInput)init
{
  ChinaCellularInput *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ChinaCellularInput;
  v2 = -[EligibilityInput initWithInputType:status:process:](&v4, "initWithInputType:status:process:", 5, 0, CFSTR("eligibilityd"));
  if (v2)
    v2->_chinaCellularDevice = +[ChinaCellularInput _isGreenTeaDeviceCapable](ChinaCellularInput, "_isGreenTeaDeviceCapable");
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ChinaCellularInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (ChinaCellularInput)initWithCoder:(id)a3
{
  ChinaCellularInput *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ChinaCellularInput;
  v3 = -[EligibilityInput initWithInputType:status:process:](&v5, "initWithInputType:status:process:", 5, 0, CFSTR("eligibilityd"));
  if (v3)
    v3->_chinaCellularDevice = +[ChinaCellularInput _isGreenTeaDeviceCapable](ChinaCellularInput, "_isGreenTeaDeviceCapable");
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ChinaCellularInput;
  v4 = -[EligibilityInput copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setChinaCellularDevice:", -[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice"));
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ChinaCellularInput;
  v3 = -[EligibilityInput hash](&v5, "hash");
  return v3 ^ -[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice");
}

- (BOOL)isEqual:(id)a3
{
  ChinaCellularInput *v4;
  uint64_t v5;
  ChinaCellularInput *v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  char v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = (ChinaCellularInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)ChinaCellularInput;
  if (!-[EligibilityInput isEqual:](&v13, "isEqual:", v4))
    goto LABEL_9;
  if (v4 == self)
  {
    v11 = 1;
    goto LABEL_11;
  }
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = -[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice");
    v8 = v7 ^ -[ChinaCellularInput chinaCellularDevice](v6, "chinaCellularDevice");
    if (v8 == 1)
    {
      v9 = sub_10000C5FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[ChinaCellularInput isEqual:]";
        v16 = 2080;
        v17 = "chinaCellularDevice";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }

    }
    v11 = v8 ^ 1;

  }
  else
  {
LABEL_9:
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)description
{
  const __CFString *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice"))
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v8.receiver = self;
  v8.super_class = (Class)ChinaCellularInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[ChinaCellularInput chinaCellularDevice:%@ %@]"), v3, v5));

  return v6;
}

- (BOOL)chinaCellularDevice
{
  return self->_chinaCellularDevice;
}

- (void)setChinaCellularDevice:(BOOL)a3
{
  self->_chinaCellularDevice = a3;
}

+ (BOOL)_isGreenTeaDeviceCapable
{
  return MGGetBoolAnswer(CFSTR("green-tea"), a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

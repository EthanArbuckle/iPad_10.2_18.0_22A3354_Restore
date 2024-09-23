@implementation GenerativeModelSystemInput

- (GenerativeModelSystemInput)init
{
  GenerativeModelSystemInput *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GenerativeModelSystemInput;
  v2 = -[EligibilityInput initWithInputType:status:process:](&v4, "initWithInputType:status:process:", 8, 0, CFSTR("eligibilityd"));
  if (v2)
    v2->_supportsGenerativeModelSystems = +[GenerativeModelSystemInput _mgSupportsGenerativeModelSystems](GenerativeModelSystemInput, "_mgSupportsGenerativeModelSystems");
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GenerativeModelSystemInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (GenerativeModelSystemInput)initWithCoder:(id)a3
{
  GenerativeModelSystemInput *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GenerativeModelSystemInput;
  v3 = -[EligibilityInput initWithInputType:status:process:](&v5, "initWithInputType:status:process:", 8, 0, CFSTR("eligibilityd"));
  if (v3)
    v3->_supportsGenerativeModelSystems = +[GenerativeModelSystemInput _mgSupportsGenerativeModelSystems](GenerativeModelSystemInput, "_mgSupportsGenerativeModelSystems");
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GenerativeModelSystemInput;
  v4 = -[EligibilityInput copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setSupportsGenerativeModelSystems:", -[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems"));
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GenerativeModelSystemInput;
  v3 = -[EligibilityInput hash](&v5, "hash");
  return v3 ^ -[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems");
}

- (BOOL)isEqual:(id)a3
{
  GenerativeModelSystemInput *v4;
  uint64_t v5;
  GenerativeModelSystemInput *v6;
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

  v4 = (GenerativeModelSystemInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GenerativeModelSystemInput;
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
    v7 = -[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems");
    v8 = v7 ^ -[GenerativeModelSystemInput supportsGenerativeModelSystems](v6, "supportsGenerativeModelSystems");
    if (v8 == 1)
    {
      v9 = sub_10000C5FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[GenerativeModelSystemInput isEqual:]";
        v16 = 2080;
        v17 = "supportsGenerativeModelSystems";
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

  if (-[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems"))
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v8.receiver = self;
  v8.super_class = (Class)GenerativeModelSystemInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[GenerativeModelSystemInput supportsGenerativeModelSystems:%@ %@]"), v3, v5));

  return v6;
}

- (BOOL)supportsGenerativeModelSystems
{
  return self->_supportsGenerativeModelSystems;
}

- (void)setSupportsGenerativeModelSystems:(BOOL)a3
{
  self->_supportsGenerativeModelSystems = a3;
}

+ (BOOL)_mgSupportsGenerativeModelSystems
{
  return MGGetBoolAnswer(CFSTR("DeviceSupportsGenerativeModelSystems"), a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation EligibilityInput

- (EligibilityInput)initWithInputType:(unint64_t)a3 status:(unint64_t)a4 process:(id)a5
{
  id v9;
  EligibilityInput *v10;
  EligibilityInput *v11;
  uint64_t v12;
  NSDate *setTime;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EligibilityInput;
  v10 = -[EligibilityInput init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_status = a4;
    v12 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    setTime = v11->_setTime;
    v11->_setTime = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_settingProccessName, a5);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[EligibilityInput type](self, "type")));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[EligibilityInput status](self, "status")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("status"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("setTime"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("settingProccessName"));

}

- (EligibilityInput)initWithCoder:(id)a3
{
  id v4;
  EligibilityInput *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSDate *setTime;
  id v15;
  uint64_t v16;
  NSString *settingProccessName;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EligibilityInput;
  v5 = -[EligibilityInput init](&v19, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_type = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_status = (unint64_t)objc_msgSend(v9, "unsignedIntegerValue");

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("setTime"));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!v11)
    {
      v12 = sub_10000C5FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[EligibilityInput initWithCoder:]";
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize setTime, setting to default value", buf, 0xCu);
      }

      v11 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    }
    setTime = v5->_setTime;
    v5->_setTime = (NSDate *)v11;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("settingProccessName"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    settingProccessName = v5->_settingProccessName;
    v5->_settingProccessName = (NSString *)v16;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = -[EligibilityInput type](self, "type");
  v6 = -[EligibilityInput status](self, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  v8 = objc_msgSend(v4, "initWithInputType:status:process:", v5, v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  objc_msgSend(v8, "setSetTime:", v9);

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[EligibilityInput type](self, "type");
  v4 = -[EligibilityInput status](self, "status") ^ v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  v6 = v4 ^ (unint64_t)objc_msgSend(v5, "hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  EligibilityInput *v4;
  uint64_t v5;
  EligibilityInput *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;

  v4 = (EligibilityInput *)a3;
  v22.receiver = self;
  v22.super_class = (Class)EligibilityInput;
  if (-[EligibilityInput isEqual:](&v22, "isEqual:", v4))
  {
    if (v4 == self)
    {
      v15 = 1;
      goto LABEL_22;
    }
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[EligibilityInput type](self, "type");
      if (v7 == (id)-[EligibilityInput type](v6, "type"))
      {
        v8 = -[EligibilityInput status](self, "status");
        if (v8 == (id)-[EligibilityInput status](v6, "status"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](v6, "setTime"));
          v11 = sub_1000163A4(v9, v10);

          if ((v11 & 1) != 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](v6, "settingProccessName"));
            v14 = sub_1000163A4(v12, v13);

            if ((v14 & 1) != 0)
            {
              v15 = 1;
LABEL_21:

              goto LABEL_22;
            }
            v20 = sub_10000C5FC();
            v17 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "-[EligibilityInput isEqual:]";
              v25 = 2080;
              v26 = "settingProccessName";
              goto LABEL_19;
            }
LABEL_20:

            v15 = 0;
            goto LABEL_21;
          }
          v19 = sub_10000C5FC();
          v17 = objc_claimAutoreleasedReturnValue(v19);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          *(_DWORD *)buf = 136315394;
          v24 = "-[EligibilityInput isEqual:]";
          v25 = 2080;
          v26 = "setTime";
        }
        else
        {
          v18 = sub_10000C5FC();
          v17 = objc_claimAutoreleasedReturnValue(v18);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          *(_DWORD *)buf = 136315394;
          v24 = "-[EligibilityInput isEqual:]";
          v25 = 2080;
          v26 = "status";
        }
      }
      else
      {
        v16 = sub_10000C5FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        *(_DWORD *)buf = 136315394;
        v24 = "-[EligibilityInput isEqual:]";
        v25 = 2080;
        v26 = "type";
      }
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      goto LABEL_20;
    }
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unint64_t v18;

  v3 = sub_10000C5A4(-[EligibilityInput type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[EligibilityInput status](self, "status");
  if (v5 >= 8)
  {
    v7 = sub_10000C5FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "eligibility_input_status_to_str";
      v17 = 2048;
      v18 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Unsupported input status: %llu", buf, 0x16u);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %llu>"), v5));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_100030AC0)[v5]));
  }
  v9 = (void *)v6;
  v10 = objc_claimAutoreleasedReturnValue(-[EligibilityInput settingProccessName](self, "settingProccessName"));
  if (v10)
    v11 = (__CFString *)v10;
  else
    v11 = CFSTR("<NULL>");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityInput setTime](self, "setTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[EligibilityInput type:%@ status:%@ setTime:%@ settingProcess:%@]"), v4, v9, v12, v11));

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSDate)setTime
{
  return self->_setTime;
}

- (void)setSetTime:(id)a3
{
  objc_storeStrong((id *)&self->_setTime, a3);
}

- (NSString)settingProccessName
{
  return self->_settingProccessName;
}

- (void)setSettingProccessName:(id)a3
{
  objc_storeStrong((id *)&self->_settingProccessName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingProccessName, 0);
  objc_storeStrong((id *)&self->_setTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

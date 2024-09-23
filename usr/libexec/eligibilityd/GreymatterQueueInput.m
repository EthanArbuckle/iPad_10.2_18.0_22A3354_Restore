@implementation GreymatterQueueInput

- (id)initOnQueue:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8;
  id v9;
  xpc_type_t type;
  const _xpc_type_s *v11;
  id v12;
  NSObject *v13;
  GreymatterQueueInput *v14;
  BOOL value;
  GreymatterQueueInput *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *name;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_BOOL)
    {
      v11 = type;
      v12 = sub_10000C5FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[GreymatterQueueInput initOnQueue:status:process:]";
        v21 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Greymatter Queue state input is wrong data type: %s", buf, 0x16u);
      }

      v14 = 0;
      goto LABEL_11;
    }
    value = xpc_BOOL_get_value(v8);
  }
  else
  {
    value = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)GreymatterQueueInput;
  v16 = -[EligibilityInput initWithInputType:status:process:](&v18, "initWithInputType:status:process:", 9, a4, v9);
  if (v16)
    v16->_onGreymatterQueue = value;
  self = v16;
  v14 = self;
LABEL_11:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GreymatterQueueInput;
  v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[GreymatterQueueInput onGreymatterQueue](self, "onGreymatterQueue", v5.receiver, v5.super_class), CFSTR("onGreymatterQueue"));

}

- (GreymatterQueueInput)initWithCoder:(id)a3
{
  id v4;
  GreymatterQueueInput *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GreymatterQueueInput;
  v5 = -[EligibilityInput initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_onGreymatterQueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onGreymatterQueue"));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GreymatterQueueInput;
  v4 = -[EligibilityInput copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setOnGreymatterQueue:", -[GreymatterQueueInput onGreymatterQueue](self, "onGreymatterQueue"));
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GreymatterQueueInput;
  v3 = -[EligibilityInput hash](&v5, "hash");
  return v3 ^ -[GreymatterQueueInput onGreymatterQueue](self, "onGreymatterQueue");
}

- (BOOL)isEqual:(id)a3
{
  GreymatterQueueInput *v4;
  uint64_t v5;
  GreymatterQueueInput *v6;
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

  v4 = (GreymatterQueueInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GreymatterQueueInput;
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
    v7 = -[GreymatterQueueInput onGreymatterQueue](self, "onGreymatterQueue");
    v8 = v7 ^ -[GreymatterQueueInput onGreymatterQueue](v6, "onGreymatterQueue");
    if (v8 == 1)
    {
      v9 = sub_10000C5FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[GreymatterQueueInput isEqual:]";
        v16 = 2080;
        v17 = "onGreymatterQueue";
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

  if (-[GreymatterQueueInput onGreymatterQueue](self, "onGreymatterQueue"))
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v8.receiver = self;
  v8.super_class = (Class)GreymatterQueueInput;
  v4 = -[EligibilityInput description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[GreymatterQueueInput onQueue: %@ %@]"), v3, v5));

  return v6;
}

- (BOOL)onGreymatterQueue
{
  return self->_onGreymatterQueue;
}

- (void)setOnGreymatterQueue:(BOOL)a3
{
  self->_onGreymatterQueue = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

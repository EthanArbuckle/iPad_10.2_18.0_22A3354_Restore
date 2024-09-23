@implementation LocalizedUnregisterErrorKey

- (LocalizedUnregisterErrorKey)initWithUnregisterError:(int64_t)a3 context:(unint64_t)a4 deviceClass:(int64_t)a5
{
  LocalizedUnregisterErrorKey *v8;
  LocalizedUnregisterErrorKey *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LocalizedUnregisterErrorKey;
  v8 = -[LocalizedUnregisterErrorKey init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[LocalizedUnregisterErrorKey setResponseErrorType:](v8, "setResponseErrorType:", a3);
    -[LocalizedUnregisterErrorKey setContext:](v9, "setContext:", a4);
    -[LocalizedUnregisterErrorKey setDeviceClass:](v9, "setDeviceClass:", a5);
  }
  return v9;
}

- (NSString)okButtonKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey errorContextStringForDisableContext:](self, "errorContextStringForDisableContext:", -[LocalizedUnregisterErrorKey context](self, "context")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey errorTypeString](self, "errorTypeString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@"), v3, v4, CFSTR("OK_BUTTON")));

  return (NSString *)v5;
}

- (NSString)titleKey
{
  return (NSString *)-[LocalizedUnregisterErrorKey keyForType:](self, "keyForType:", CFSTR("TITLE"));
}

- (NSString)textKey
{
  return (NSString *)-[LocalizedUnregisterErrorKey keyForType:](self, "keyForType:", CFSTR("TEXT"));
}

- (id)keyForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey deviceTypeStringForDeviceClass:](self, "deviceTypeStringForDeviceClass:", -[LocalizedUnregisterErrorKey deviceClass](self, "deviceClass")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey errorContextStringForDisableContext:](self, "errorContextStringForDisableContext:", -[LocalizedUnregisterErrorKey context](self, "context")));
  v7 = objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey errorTypeString](self, "errorTypeString"));
  v8 = (void *)v7;
  if (v5)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@_%@"), v6, v7, v5, v4);
  else
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@"), v6, v7, v4, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)errorTypeString
{
  if ((-[LocalizedUnregisterErrorKey responseErrorType](self, "responseErrorType") & 0x200) != 0)
    return CFSTR("NETWORK_ERROR");
  else
    return CFSTR("GENERIC_ERROR");
}

- (id)errorContextStringForDisableContext:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return *(&off_1002C1E88 + a3 - 1);
}

- (id)deviceTypeStringForDeviceClass:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 0;
  else
    return *(&off_1002C1EC0 + a3);
}

- (int64_t)responseErrorType
{
  return self->_responseErrorType;
}

- (void)setResponseErrorType:(int64_t)a3
{
  self->_responseErrorType = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int64_t)a3
{
  self->_deviceClass = a3;
}

@end

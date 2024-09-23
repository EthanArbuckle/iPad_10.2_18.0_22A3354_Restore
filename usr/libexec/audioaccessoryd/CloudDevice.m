@implementation CloudDevice

+ (CloudDevice)deviceWithIDSDevice:(id)a3
{
  id v3;
  CloudDevice *v4;

  v3 = a3;
  v4 = -[CloudDevice initWithIDSDevice:]([CloudDevice alloc], "initWithIDSDevice:", v3);

  return v4;
}

- (CloudDevice)initWithIDSDevice:(id)a3
{
  id v5;
  CloudDevice *v6;
  CloudDevice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CloudDevice;
  v6 = -[CloudDevice init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_idsDevice, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = objc_opt_class(CloudDevice);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDevice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudDevice idsDevice](self, "idsDevice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudDevice idsDevice](self, "idsDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueID"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudDevice idsDevice](self, "idsDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cpDescription"));

  return v3;
}

- (id)stateString
{
  unint64_t state;

  state = self->_state;
  if (state > 6)
    return CFSTR("unknown");
  else
    return (id)*((_QWORD *)&off_1001E52C0 + state);
}

- (CloudDevice)initWithCoder:(id)a3
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CloudDevice init](+[CloudDevice allocWithZone:](CloudDevice, "allocWithZone:", a3), "init");
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDevice, 0);
}

@end

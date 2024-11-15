@implementation NRDEphemeralDevice

- (id)description
{
  id v3;
  NSUUID *v4;
  OS_xpc_object *connection;
  id v6;

  v3 = objc_alloc((Class)NSString);
  if (self)
  {
    v4 = self->super._nrUUID;
    connection = self->super._connection;
  }
  else
  {
    v4 = 0;
    connection = 0;
  }
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("[NRDEphemeralDevices:%@,%@]"), v4, connection);

  return v6;
}

@end

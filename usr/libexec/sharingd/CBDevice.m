@implementation CBDevice

- (NSUUID)deviceIdentifier
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
  if (v3)
  {
    v4 = objc_alloc((Class)NSUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
    v6 = objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return (NSUUID *)v6;
}

- (NSUUID)pairingAgentDeviceIdentifier
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
  if (v3)
  {
    v4 = objc_alloc((Class)NSUUID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self, "identifier"));
    v6 = objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return (NSUUID *)v6;
}

- (char)channel
{
  return -[CBDevice bleChannel](self, "bleChannel");
}

- (unsigned)deviceActionType
{
  return -[CBDevice nearbyActionType](self, "nearbyActionType");
}

- (BOOL)needsSetup
{
  return 0;
}

@end

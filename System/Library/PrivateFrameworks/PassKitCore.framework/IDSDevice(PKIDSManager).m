@implementation IDSDevice(PKIDSManager)

- (id)pk_idsDestination
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)IDSCopyIDForDevice();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKIDSDestination destinationWithDeviceIdentifier:name:](PKIDSDestination, "destinationWithDeviceIdentifier:name:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)pk_isApplePayCapable
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "nsuuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_msgSend(a1, "pk_isValidHandoffDevice");
  else
    v3 = 0;

  return v3;
}

- (BOOL)pk_isValidHandoffDevice
{
  PKRemoteDevice *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "supportsApplePay"))
    return 0;
  v2 = -[PKRemoteDevice initWithIDSDevice:]([PKRemoteDevice alloc], "initWithIDSDevice:", a1);
  v3 = (unint64_t)-[PKRemoteDevice type](v2, "type") < 2;

  return v3;
}

@end

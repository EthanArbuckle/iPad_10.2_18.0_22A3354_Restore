@implementation RPCompanionLinkDevice

- (NSString)bm_companionLinkDeviceIdentifier
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice idsDeviceIdentifier](self, "idsDeviceIdentifier"));
  v3 = objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

@end

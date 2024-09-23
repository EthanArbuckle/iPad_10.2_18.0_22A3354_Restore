@implementation STUAvailableBytesPropertyProvider_iOS

- (id)key
{
  return CRKDeviceAvailableBytesKey;
}

- (id)value
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRKMobileGestalt sharedGestalt](CRKMobileGestalt, "sharedGestalt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "availableBytes")));

  return v3;
}

@end

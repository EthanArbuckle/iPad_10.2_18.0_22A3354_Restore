@implementation MSPMutableHistoryEntry

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMutableHistoryEntry usageDate](self, "usageDate"));
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMutableHistoryEntry storageIdentifier](self, "storageIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  return (NSString *)v3;
}

@end

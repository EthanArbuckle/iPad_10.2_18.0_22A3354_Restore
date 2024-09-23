@implementation MKMapItemIdentifier

- (id)_maps_diffableDataSourceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItemIdentifier geoMapItemIdentifier](self, "geoMapItemIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "comparableRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));

  return v4;
}

@end

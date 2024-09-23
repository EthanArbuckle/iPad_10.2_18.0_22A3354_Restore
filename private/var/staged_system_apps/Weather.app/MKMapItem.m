@implementation MKMapItem

- (NSString)wc_localityName
{
  MKMapItem *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  MKMapItem *v9;
  void *v10;

  v3 = (MKMapItem *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem locality](v3, "locality"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[MKMapItem locality](v3, "locality"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](v3, "name"));
    v8 = objc_msgSend(v7, "length");

    if (v8)
      v9 = v3;
    else
      v9 = self;
    v6 = objc_claimAutoreleasedReturnValue(-[MKMapItem name](v9, "name"));
  }
  v10 = (void *)v6;

  return (NSString *)v10;
}

- (NSString)wc_weatherDisplayName
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _weatherDisplayName](self, "_weatherDisplayName"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MKMapItem _weatherDisplayName](self, "_weatherDisplayName"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem placemark](self, "placemark"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));

      return (NSString *)v6;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[MKMapItem name](self, "name"));
  }
  v6 = (void *)v5;
  return (NSString *)v6;
}

- (NSString)wc_weatherLocationName
{
  return (NSString *)-[MKMapItem _weatherLocationName](self, "_weatherLocationName");
}

@end

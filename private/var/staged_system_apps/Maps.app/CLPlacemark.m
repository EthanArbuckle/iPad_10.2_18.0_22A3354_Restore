@implementation CLPlacemark

- (NSString)_maps_sha1Hash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CLPlacemark _geoMapItem](self, "_geoMapItem"));
  if (objc_msgSend(v2, "_hasMUID"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("muid=%llu"), objc_msgSend(v2, "_muid")));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addressObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullAddressWithMultiline:", 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("address=%@"), v5));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_sha1Hash"));

  return (NSString *)v6;
}

@end

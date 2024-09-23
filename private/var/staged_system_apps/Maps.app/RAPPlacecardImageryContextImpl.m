@implementation RAPPlacecardImageryContextImpl

- (RAPPlacecardImageryContextImpl)initWithMapItem:(id)a3 photo:(id)a4 selectedPhotoURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPPlacecardImageryContextImpl *v12;
  RAPPlacecardImageryContextImpl *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RAPPlacecardImageryContextImpl;
  v12 = -[RAPPlacecardImageryContextImpl init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_selectedPhotoURL, a5);
    objc_storeStrong((id *)&v13->_mapItem, a3);
    objc_storeStrong((id *)&v13->_geoMapItemPhoto, a4);
  }

  return v13;
}

- (NSString)vendorIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemPhoto attribution](self->_geoMapItemPhoto, "attribution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "providerID"));

  return (NSString *)v3;
}

- (NSString)photoIdentifier
{
  return (NSString *)-[GEOMapItemPhoto uid](self->_geoMapItemPhoto, "uid");
}

- (NSString)photoURL
{
  return self->_selectedPhotoURL;
}

- (GEOPDPlace)reportedPlace
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_placeData"));

  return (GEOPDPlace *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPhotoURL, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_geoMapItemPhoto, 0);
}

@end

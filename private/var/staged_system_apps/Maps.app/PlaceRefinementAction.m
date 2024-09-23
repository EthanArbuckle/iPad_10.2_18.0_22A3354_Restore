@implementation PlaceRefinementAction

- (PlaceRefinementAction)initWithLabel:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4 address:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  PlaceRefinementAction *v10;
  NSString *v11;
  NSString *address;
  objc_super v14;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PlaceRefinementAction;
  v10 = -[ReverseGeocodeAction initWithLabel:atCoordinate:](&v14, "initWithLabel:atCoordinate:", a3, latitude, longitude);
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v9, "copy");
    address = v10->_address;
    v10->_address = v11;

  }
  return v10;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CLLocationDegrees v21;
  CLLocationDegrees v22;
  CLLocationCoordinate2D v23;

  v6 = a4;
  v7 = a3;
  -[ReverseGeocodeAction coordinate](self, "coordinate");
  v9 = v8;
  v11 = v10;
  v23 = CLLocationCoordinate2DMake(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReverseGeocodeAction label](self, "label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceRefinementAction address](self, "address"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ticketForPlaceRefinementRequestWithCoordinate:addressLine:placeName:traits:", &v23, v14, v12, v7));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A8AE98;
  v18[3] = &unk_1011DFCC8;
  v21 = v9;
  v22 = v11;
  v19 = v12;
  v20 = v6;
  v16 = v6;
  v17 = v12;
  objc_msgSend(v15, "submitWithHandler:networkActivity:", v18, 0);

}

- (int)analyticsLaunchActionType
{
  return 14;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

@end

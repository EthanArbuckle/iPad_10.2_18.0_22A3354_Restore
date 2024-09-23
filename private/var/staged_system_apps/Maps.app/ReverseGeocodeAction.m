@implementation ReverseGeocodeAction

- (ReverseGeocodeAction)initWithLabel:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v8;
  ReverseGeocodeAction *v9;
  ReverseGeocodeAction *v10;
  objc_super v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ReverseGeocodeAction;
  v9 = -[ReverseGeocodeAction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    v10->_coordinate.latitude = latitude;
    v10->_coordinate.longitude = longitude;
  }

  return v10;
}

- (void)resolveMapItemWithTraits:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  double v8;
  CLLocationDegrees v9;
  double v10;
  CLLocationDegrees v11;
  void *v12;
  void *v13;
  CLLocationCoordinate2D v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CLLocationDegrees v21;
  CLLocationDegrees v22;

  v6 = a4;
  v7 = a3;
  -[ReverseGeocodeAction coordinate](self, "coordinate");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReverseGeocodeAction label](self, "label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v14 = CLLocationCoordinate2DMake(v9, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ticketForReverseGeocodeCoordinate:traits:", v7, v14.latitude, v14.longitude));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A1E78C;
  v18[3] = &unk_1011DFCC8;
  v21 = v9;
  v22 = v11;
  v19 = v12;
  v20 = v6;
  v16 = v6;
  v17 = v12;
  objc_msgSend(v15, "submitWithHandler:networkActivity:", v18, 0);

}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 27;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

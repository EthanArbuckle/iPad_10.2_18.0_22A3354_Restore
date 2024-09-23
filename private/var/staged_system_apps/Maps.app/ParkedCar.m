@implementation ParkedCar

+ (id)personalizedItemKey
{
  return CFSTR("parkedcar");
}

- (ParkedCar)init
{

  return 0;
}

- (ParkedCar)initWithVehicleEvent:(id)a3 geoMapItem:(id)a4
{
  id v6;
  id v7;
  ParkedCar *v8;
  ParkedCar *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)ParkedCar,
        v8 = -[ParkedCar init](&v11, "init"),
        (self = v8) != 0))
  {
    -[ParkedCar updateFromVehicleEvent:geoMapItem:](v8, "updateFromVehicleEvent:geoMapItem:", v6, v7);
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateFromVehicleEvent:(id)a3 geoMapItem:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  void *v14;
  CLLocationDegrees v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSDate *v20;
  NSDate *date;
  void *v22;
  id v23;
  UIImage *v24;
  UIImage *v25;
  UIImage *image;
  MKMapItem *v27;
  MKMapItem *mapItem;
  id v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  MKMapItem *v35;
  MKMapItem *v36;
  void *v37;
  id v38;

  v38 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_vehicleEvent, a3);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "notes"));
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_1011EB268;
  objc_storeStrong((id *)&self->_notes, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent location](self->_vehicleEvent, "location"));
  objc_msgSend(v11, "latitude");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent location](self->_vehicleEvent, "location"));
  objc_msgSend(v14, "longitude");
  self->_coordinate = CLLocationCoordinate2DMake(v13, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "location"));
  self->_referenceFrame = objc_msgSend(v16, "referenceFrame");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent location](self->_vehicleEvent, "location"));
  objc_msgSend(v17, "horizontalUncertainty");
  self->_horizontalAccuracy = v18;

  v19 = fabs(self->_horizontalAccuracy);
  if (v19 >= INFINITY && v19 <= INFINITY)
    self->_horizontalAccuracy = -1.0;
  v20 = (NSDate *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent date](self->_vehicleEvent, "date"));
  date = self->_date;
  self->_date = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "photo"));
  if (v22)
  {
    v23 = objc_alloc((Class)UIImage);
    v24 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "photo"));
    v25 = (UIImage *)objc_msgSend(v23, "initWithData:", v24);
    image = self->_image;
    self->_image = v25;

  }
  else
  {
    v24 = self->_image;
    self->_image = 0;
  }

  if (v7)
  {
    v27 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v7, 0);
    mapItem = self->_mapItem;
    self->_mapItem = v27;
  }
  else
  {
    v29 = objc_alloc((Class)CLLocation);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent location](self->_vehicleEvent, "location"));
    objc_msgSend(v30, "latitude");
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent location](self->_vehicleEvent, "location"));
    objc_msgSend(v33, "longitude");
    mapItem = (MKMapItem *)objc_msgSend(v29, "initWithLatitude:longitude:", v32, v34);

    v35 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", mapItem);
    v36 = self->_mapItem;
    self->_mapItem = v35;

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar title](self, "title"));
  -[MKMapItem setName:](self->_mapItem, "setName:", v37);

}

- (void)setMapItem:(id)a3
{
  MKMapItem *v4;
  id v5;
  void *v6;
  MKMapItem *mapItem;

  v4 = (MKMapItem *)a3;
  if (!v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", self->_coordinate.latitude, self->_coordinate.longitude);
    v4 = (MKMapItem *)objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar title](self, "title"));
  -[MKMapItem setName:](v4, "setName:", v6);

  mapItem = self->_mapItem;
  self->_mapItem = v4;

}

- (NSString)title
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "title");
}

+ (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Parked Car [FindMyCar]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (NSString)locationDisplayString
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCar locationName](self, "locationName"));
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Near %@ [Widget/Proactive Tray FmC row subtitle, with address]"), CFSTR("localized string not found"), 0));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v2));

  }
  else
  {
    v5 = &stru_1011EB268;
  }

  return (NSString *)v5;
}

- (NSString)locationName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent nearbyLocationOfInterest](self->_vehicleEvent, "nearbyLocationOfInterest"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent nearbyLocationOfInterest](self->_vehicleEvent, "nearbyLocationOfInterest"));
    v5 = objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTVehicleEvent nearbyLocationOfInterest](self->_vehicleEvent, "nearbyLocationOfInterest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "customLabel"));
    v8 = MapsSuggestionsRoutineLocalizedLabelLOIType(v5, v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  v10 = sub_10093874C(v9, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return (NSString *)v11;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)locationQuality
{
  return (unint64_t)-[RTVehicleEvent locationQuality](self->_vehicleEvent, "locationQuality");
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (RTVehicleEvent)vehicleEvent
{
  return self->_vehicleEvent;
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

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_vehicleEvent, 0);
}

@end

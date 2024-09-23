@implementation RAPAddressLocation

- (RAPAddressLocation)initWithCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  RAPAddressLocation *result;
  objc_super v6;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6.receiver = self;
  v6.super_class = (Class)RAPAddressLocation;
  result = -[RAPAddressLocation init](&v6, "init");
  if (result)
  {
    result->_coordinate.latitude = latitude;
    result->_coordinate.longitude = longitude;
  }
  return result;
}

- (void)processWithGeocoderIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, RAPAddressLocation *, uint64_t);
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *completionBlocks;
  NSMutableArray *v8;
  id v9;
  CLGeocoder *v10;
  CLGeocoder *geocoder;
  CLGeocoder *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];

  v4 = (void (**)(id, RAPAddressLocation *, uint64_t))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddressLocation placemark](self, "placemark"));

  if (v5)
  {
    if (v4)
      v4[2](v4, self, 1);
  }
  else
  {
    if (!self->_completionBlocks)
    {
      v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      completionBlocks = self->_completionBlocks;
      self->_completionBlocks = v6;

    }
    if (v4)
    {
      v8 = self->_completionBlocks;
      v9 = objc_msgSend(v4, "copy");
      -[NSMutableArray addObject:](v8, "addObject:", v9);

    }
    if (!self->_geocoder)
    {
      v10 = (CLGeocoder *)objc_alloc_init((Class)CLGeocoder);
      geocoder = self->_geocoder;
      self->_geocoder = v10;

      v12 = self->_geocoder;
      v13 = objc_alloc((Class)CLLocation);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v15 = objc_msgSend(v13, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v14, self->_coordinate.latitude, self->_coordinate.longitude, 0.0, 0.0, 0.0);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100264D0C;
      v16[3] = &unk_1011AE168;
      v16[4] = self;
      -[CLGeocoder reverseGeocodeLocation:completionHandler:](v12, "reverseGeocodeLocation:completionHandler:", v15, v16);

    }
  }

}

- (void)cancelProcessing
{
  CLGeocoder *geocoder;

  -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
  geocoder = self->_geocoder;
  self->_geocoder = 0;

  -[RAPAddressLocation _invokeCompletionBlocksWithFinishedFlag:](self, "_invokeCompletionBlocksWithFinishedFlag:", 0);
}

- (void)_invokeCompletionBlocksWithFinishedFlag:(BOOL)a3
{
  id v4;
  NSMutableArray *completionBlocks;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = -[NSMutableArray copy](self->_completionBlocks, "copy");
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

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

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
}

@end

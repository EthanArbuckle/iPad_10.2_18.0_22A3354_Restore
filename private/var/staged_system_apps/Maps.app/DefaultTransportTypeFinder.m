@implementation DefaultTransportTypeFinder

- (void)transportTypeForDirectionItem:(id)a3 ignoreMapType:(BOOL)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t *v10;
  char *v11;
  CLLocationCoordinate2D *v12;
  void *v13;
  void *v14;
  CLLocationDegrees v15;
  double v16;
  CLLocationDegrees v17;
  CLLocationDegrees v18;
  uint64_t v19;
  DefaultTransportTypeFinder *v20;
  _BOOL4 v21;

  v21 = a4;
  v20 = self;
  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "items"));
  v8 = objc_msgSend(v7, "count");
  v9 = (char *)v8;
  v10 = &v19 - 2 * (_QWORD)v8;
  if (v8)
  {
    v11 = 0;
    v12 = (CLLocationCoordinate2D *)(&v19 - 2 * (_QWORD)v8);
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v11));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "waypoint"));
      objc_msgSend(v14, "coordinate");
      if (v14 && (v17 = v15, v18 = v16, CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v15)))
      {
        v12->latitude = v17;
        v12->longitude = v18;
      }
      else
      {
        *v12 = kCLLocationCoordinate2DInvalid;
      }

      ++v11;
      ++v12;
    }
    while (v9 != v11);
  }
  -[DefaultTransportTypeFinder transportTypeForCoordinates:count:ignoreMapType:completion:](v20, "transportTypeForCoordinates:count:ignoreMapType:completion:", v10, v9, v21, v6);

}

- (DefaultTransportTypeFinder)initWithMapTypeSource:(id)a3
{
  id v4;
  DefaultTransportTypeFinder *v5;
  DefaultTransportTypeFinder *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *transportTypeFinderQueue;
  DefaultTransportTypeFinder *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DefaultTransportTypeFinder;
  v5 = -[DefaultTransportTypeFinder init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapTypeSource, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("transportTypeFinderQueue", v8);
    transportTypeFinderQueue = v6->_transportTypeFinderQueue;
    v6->_transportTypeFinderQueue = (OS_dispatch_queue *)v9;

    v11 = v6;
  }

  return v6;
}

- (int)geoIdealTransportTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5
{
  CLLocationCoordinate2D v6[2];

  v6[0] = a3;
  v6[1] = a4;
  return -[DefaultTransportTypeFinder geoIdealTransportTypeForCoordinates:count:ignoreMapType:](self, "geoIdealTransportTypeForCoordinates:count:ignoreMapType:", v6, 2, a5);
}

- (int)geoIdealTransportTypeForCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 ignoreMapType:(BOOL)a5
{
  id v7;
  void *v8;
  double v9;
  CLLocationDegrees *p_longitude;
  CLLocationDegrees *v11;
  unint64_t v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  uint64_t v16;
  CLLocationCoordinate2D v17;

  if (a5)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DefaultTransportTypeFinder mapTypeSource](self, "mapTypeSource"));
    v7 = objc_msgSend(v8, "displayedMapType");

  }
  *(_QWORD *)&v9 = __chkstk_darwin(self).n128_u64[0];
  if (a4)
  {
    p_longitude = &a3->longitude;
    v11 = (CLLocationDegrees *)(&v16 - 2 * a4);
    v12 = a4;
    do
    {
      v13 = *(p_longitude - 1);
      v14 = *p_longitude;
      v17.latitude = v13;
      v17.longitude = *p_longitude;
      if (CLLocationCoordinate2DIsValid(v17))
      {
        *v11 = v13;
        v11[1] = v14;
      }
      else
      {
        v9 = -180.0;
        *(_OWORD *)v11 = xmmword_100E3EE40;
      }
      v11 += 2;
      p_longitude += 2;
      --v12;
    }
    while (v12);
  }
  return GEOTransportTypeFromGEOTransportTypePreference(+[GEOIdealTransportTypeFinder idealTransportTypeForCoordinates:count:mapType:](GEOIdealTransportTypeFinder, "idealTransportTypeForCoordinates:count:mapType:", &v16 - 2 * a4, a4, v7, v9));
}

- (void)mkDirectionsTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  double longitude;
  double latitude;
  double v9;
  double v10;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a5;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3.longitude;
  v10 = a3.latitude;
  v12 = a6;
  v13 = v12;
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100B2CBA8;
    v14[3] = &unk_1011DB340;
    v15 = v12;
    -[DefaultTransportTypeFinder transportTypeForOrigin:destination:ignoreMapType:completion:](self, "transportTypeForOrigin:destination:ignoreMapType:completion:", v6, v14, v10, v9, latitude, longitude);

  }
}

- (void)transportTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5 completion:(id)a6
{
  CLLocationCoordinate2D v6[2];

  v6[0] = a3;
  v6[1] = a4;
  -[DefaultTransportTypeFinder transportTypeForCoordinates:count:ignoreMapType:completion:](self, "transportTypeForCoordinates:count:ignoreMapType:completion:", v6, 2, a5, a6);
}

- (void)transportTypeForCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 ignoreMapType:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t Log;
  NSObject *v15;
  const CLLocationCoordinate2D *v16;
  CLLocationCoordinate2D *v17;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  CLLocationDegrees v20;
  CLLocationDegrees v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *transportTypeFinderQueue;
  _QWORD block[4];
  _QWORD *v40;
  CLLocationDegrees v41;
  CLLocationDegrees v42;
  CLLocationDegrees v43;
  CLLocationDegrees v44;
  uint64_t v45;
  int v46;
  _QWORD v47[4];
  NSObject *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const char *v52;
  CLLocationCoordinate2D v53;

  v6 = a5;
  v10 = a6;
  v11 = v10;
  if (v10)
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100B2D030;
    v47[3] = &unk_1011E3388;
    v48 = v10;
    v12 = objc_retainBlock(v47);
    v13 = MapsSuggestionsLoggingSubsystem;
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsSuggestionsTransportMode");
    v15 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Will determine transport type...", buf, 2u);
    }

    v16 = &kCLLocationCoordinate2DInvalid;
    if (a4)
      v17 = a3;
    else
      v17 = (CLLocationCoordinate2D *)&kCLLocationCoordinate2DInvalid;
    latitude = v17->latitude;
    longitude = v17->longitude;
    if (a4)
      v16 = &a3[a4 - 1];
    v20 = v16->latitude;
    v21 = v16->longitude;
    v22 = CLLocationCoordinate2DIsValid(*v17);
    v53.latitude = v20;
    v53.longitude = v21;
    v23 = CLLocationCoordinate2DIsValid(v53);
    v24 = v23;
    if (v22 && v23)
    {
      v25 = -[DefaultTransportTypeFinder geoIdealTransportTypeForCoordinates:count:ignoreMapType:](self, "geoIdealTransportTypeForCoordinates:count:ignoreMapType:", a3, a4, v6);
      v26 = GEOFindOrCreateLog(v13, "MapsSuggestionsTransportMode");
      v27 = (id)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        if (v25 >= 7)
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v25));
        else
          v28 = off_1011E3408[(int)v25];
        *(_DWORD *)buf = 138543362;
        v50 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "\tFetched Geo ideal default transport mode %{public}@", buf, 0xCu);

      }
      v35 = GEOFindOrCreateLog(v13, "MapsSuggestionsTransportMode");
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "\tWill fetch MSg default transport mode", buf, 2u);
      }

      v37 = objc_opt_class(self);
      transportTypeFinderQueue = self->_transportTypeFinderQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100B2D1D0;
      block[3] = &unk_1011E33B0;
      v41 = latitude;
      v42 = longitude;
      v43 = v20;
      v44 = v21;
      v46 = v25;
      v45 = v37;
      v40 = v12;
      dispatch_async(transportTypeFinderQueue, block);

    }
    else
    {
      v31 = GEOFindOrCreateLog(v13, "MapsSuggestionsTransportMode");
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v33 = "invalid";
        if (v22)
          v34 = "valid";
        else
          v34 = "invalid";
        if (v24)
          v33 = "valid";
        *(_DWORD *)buf = 136315394;
        v50 = (void *)v34;
        v51 = 2080;
        v52 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "\tWill return Undefined transport type for invalid origin (%s) or destination (%s)", buf, 0x16u);
      }

      ((void (*)(_QWORD *, uint64_t))v12[2])(v12, 4);
    }

    v30 = v48;
  }
  else
  {
    v29 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsSuggestionsTransportMode");
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Completion block missing for async transport type finder", buf, 2u);
    }
  }

}

- (void)findDirectionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude;
  double latitude;
  double v7;
  double v8;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3.longitude;
  v8 = a3.latitude;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100B2D4A0;
    v12[3] = &unk_1011BB4D8;
    v13 = v10;
    -[DefaultTransportTypeFinder mkDirectionsTypeForOrigin:destination:ignoreMapType:completion:](self, "mkDirectionsTypeForOrigin:destination:ignoreMapType:completion:", 0, v12, v8, v7, latitude, longitude);

  }
}

- (MapTypeSource)mapTypeSource
{
  return (MapTypeSource *)objc_loadWeakRetained((id *)&self->_mapTypeSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapTypeSource);
  objc_storeStrong((id *)&self->_transportTypeFinderQueue, 0);
}

@end

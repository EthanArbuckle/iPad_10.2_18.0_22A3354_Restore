@implementation UGCNearbyPhotosAvailibility

+ (void)numberOfPhotosTakenForMapItem:(id)a3 lastVisitedDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = sub_10043310C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_10043310C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_signpost_id_generate(v14);

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, v15, "NumberOfPhotosTakenForMapItem", ", buf, 2u);
    }

    v16 = dispatch_queue_create("com.apple.maps.UGCNearbyPhotosAvailibility", 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1008AD0CC;
    v17[3] = &unk_1011C0B40;
    v18 = v9;
    v21 = a1;
    v19 = v8;
    v20 = v10;
    dispatch_async(v16, v17);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }

}

+ (void)hasTakenPhotosForMapItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_queue_create("com.apple.maps.UGCNearbyPhotosAvailibility", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008AD3A0;
  block[3] = &unk_1011B2188;
  v12 = v6;
  v13 = v7;
  v14 = a1;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

+ (id)fetchNearbyAssetsForMapItemCoordinate:(CLLocationCoordinate2D)a3 withOptions:(id)a4
{
  double longitude;
  double latitude;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t UInteger;
  double latitudeDelta;
  double longitudeDelta;
  CLLocationCoordinate2D v12;
  CLLocationCoordinate2D v13;
  id v14;
  id v15;
  void *v16;
  CLLocationCoordinate2D v18;
  MKCoordinateRegion v19;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = MapsConfig_UGCNearbyPhotoTakenThresholdInMeters;
  v7 = off_1014B3738;
  v8 = a4;
  UInteger = GEOConfigGetUInteger(v6, v7);
  v18.latitude = latitude;
  v18.longitude = longitude;
  v19 = MKCoordinateRegionMakeWithDistance(v18, (double)UInteger, (double)UInteger);
  latitudeDelta = v19.span.latitudeDelta;
  longitudeDelta = v19.span.longitudeDelta;
  v12 = CLLocationCoordinate2DMake(latitude + v19.span.latitudeDelta, longitude - v19.span.longitudeDelta);
  v13 = CLLocationCoordinate2DMake(latitude - latitudeDelta, longitude + longitudeDelta);
  v14 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v12.latitude, v12.longitude);
  v15 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", v13.latitude, v13.longitude);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsInBoundingBoxWithTopLeftLocation:bottomRightLocation:options:](PHAsset, "fetchAssetsInBoundingBoxWithTopLeftLocation:bottomRightLocation:options:", v14, v15, v8));

  return v16;
}

@end

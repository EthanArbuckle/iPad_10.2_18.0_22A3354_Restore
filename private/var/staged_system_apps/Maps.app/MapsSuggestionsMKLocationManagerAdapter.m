@implementation MapsSuggestionsMKLocationManagerAdapter

- (MapsSuggestionsMKLocationManagerAdapter)init
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  MapsSuggestionsMKLocationManagerAdapter *v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("MapsSuggestionsMKLocationManagerAdapterQueue", v4);
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsMKLocationManagerAdapter;
  v6 = -[MapsSuggestionsMKLocationManagerAdapter initWithName:queue:](&v11, "initWithName:queue:", CFSTR("MapsSuggestionsMKLocationManagerAdapter"), v5);

  if (v6)
  {
    objc_initWeak(&location, v6);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100601274;
    v8[3] = &unk_1011AD260;
    objc_copyWeak(&v9, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)onStartImplementation
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100601420;
  v2[3] = &unk_1011AD260;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)onStopImplementation
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100601604;
  v2[3] = &unk_1011AD260;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MapsSuggestionsMKLocationManagerAdapter considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", objc_msgSend(v4, "isAuthorizedForPreciseLocation") ^ 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

  -[MapsSuggestionsMKLocationManagerAdapter considerMyNewLocation:](self, "considerMyNewLocation:", v5);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return -[MapsSuggestionsMKLocationManagerAdapter hasObservers](self, "hasObservers", a3) ^ 1;
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a4;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MKLocationManagerAdapter");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed updating location: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)locationManagerApprovalDidChange:(id)a3
{
  -[MapsSuggestionsMKLocationManagerAdapter considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", -[MKLocationManager isAuthorizedForPreciseLocation](self->_mkLocationManager, "isAuthorizedForPreciseLocation", a3) ^ 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mkLocationManager, 0);
}

@end

@implementation NanoRoutePlanningLocationUpdateState

- (NanoRoutePlanningLocationUpdateState)initWithStateManager:(id)a3 isolationQueue:(id)a4
{
  NanoRoutePlanningLocationUpdateState *v4;
  SingleLocationUpdate *v5;
  SingleLocationUpdate *locationUpdater;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NanoRoutePlanningLocationUpdateState;
  v4 = -[NanoRoutePlanningState initWithStateManager:isolationQueue:](&v8, "initWithStateManager:isolationQueue:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(SingleLocationUpdate);
    locationUpdater = v4->_locationUpdater;
    v4->_locationUpdater = v5;

  }
  return v4;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SingleLocationUpdate *locationUpdater;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningState manager](self, "manager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traits"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceLocation"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningState manager](self, "manager"));
    objc_msgSend(v7, "updateWithBlock:", &stru_1011DA168);

  }
  else
  {
    locationUpdater = self->_locationUpdater;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100898554;
    v9[3] = &unk_1011B5420;
    objc_copyWeak(&v10, &location);
    -[SingleLocationUpdate requestSingleLocationUpdateWithCompletionHandler:](locationUpdater, "requestSingleLocationUpdateWithCompletionHandler:", v9);
    objc_destroyWeak(&v10);
  }

  objc_destroyWeak(&location);
}

- (void)_handleLocation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (-[NanoRoutePlanningState isActive](self, "isActive"))
  {
    v8 = sub_10043214C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Handle location:%{private}@, error:%@", buf, 0x16u);
    }

    if (v6)
      v10 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v6);
    else
      v10 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningState manager](self, "manager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1008987F4;
    v13[3] = &unk_1011DA190;
    v14 = v7;
    v15 = v10;
    v12 = v10;
    objc_msgSend(v11, "updateWithBlock:", v13);

  }
}

- (void)stop
{
  SingleLocationUpdate *locationUpdater;

  -[SingleLocationUpdate cancel](self->_locationUpdater, "cancel");
  locationUpdater = self->_locationUpdater;
  self->_locationUpdater = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationUpdater, 0);
}

@end

@implementation SingleLocationUpdate

- (void)dealloc
{
  objc_super v3;

  -[SingleLocationUpdate _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)SingleLocationUpdate;
  -[SingleLocationUpdate dealloc](&v3, "dealloc");
}

- (void)requestSingleLocationUpdateWithCompletionHandler:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003FB91C;
  v4[3] = &unk_1011AE240;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)cancel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003FBBD0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)desiredAccuracy
{
  double result;

  result = self->_desiredAccuracy;
  if (result <= 0.0)
    return 35.0;
  return result;
}

- (void)setDesiredAccuracy:(double)a3
{
  if (!self->_active)
    self->_desiredAccuracy = a3;
}

- (double)acceptableAccuracy
{
  double result;

  result = self->_acceptableAccuracy;
  if (result <= 0.0)
    return 65.0;
  return result;
}

- (void)setAcceptableAccuracy:(double)a3
{
  if (!self->_active)
    self->_acceptableAccuracy = a3;
}

- (double)_timeSinceStart
{
  double v2;

  -[NSDate timeIntervalSinceNow](self->_startDate, "timeIntervalSinceNow");
  return fabs(v2);
}

- (void)_firstTimeout
{
  double v3;

  -[SingleLocationUpdate _timeSinceStart](self, "_timeSinceStart");
  -[SingleLocationUpdate _timeoutWithForcedCompletion:rescheduleInterval:selector:](self, "_timeoutWithForcedCompletion:rescheduleInterval:selector:", 0, "_finalTimeout", 10.0 - v3);
}

- (void)_finalTimeout
{
  -[SingleLocationUpdate _timeoutWithForcedCompletion:rescheduleInterval:selector:](self, "_timeoutWithForcedCompletion:rescheduleInterval:selector:", 1, 0, -1.0);
}

- (void)_timeoutWithForcedCompletion:(BOOL)a3 rescheduleInterval:(double)a4 selector:(SEL)a5
{
  _BOOL4 v7;
  CLLocation *lastLocation;
  CLLocation *v10;
  CLLocation *v11;
  NSTimer *v12;
  NSTimer *timeout;
  _QWORD v14[5];
  NSTimer *v15;

  v7 = a3;
  -[NSTimer invalidate](self->_timeout, "invalidate");
  if (-[SingleLocationUpdate _isLocationGoodEnough:](self, "_isLocationGoodEnough:", self->_lastLocation))
    lastLocation = self->_lastLocation;
  else
    lastLocation = 0;
  v10 = lastLocation;
  v11 = v10;
  if (v10 || v7)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003FBE48;
    v14[3] = &unk_1011AC8B0;
    v14[4] = self;
    v15 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    timeout = v15;
    goto LABEL_10;
  }
  if (a4 >= 0.0 && a5)
  {
    v12 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, a5, 0, 0, a4));
    timeout = self->_timeout;
    self->_timeout = v12;
LABEL_10:

  }
}

- (void)_cleanup
{
  CLLocation *lastLocation;
  id completionHandler;
  NSTimer *timeout;
  CLLocationManager *v6;
  CLInUseAssertion *v7;
  CLInUseAssertion *v8;
  CLLocationManager *v9;
  _QWORD *v10;
  _QWORD v11[4];
  CLLocationManager *v12;
  CLInUseAssertion *v13;

  self->_active = 0;
  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  -[NSTimer invalidate](self->_timeout, "invalidate");
  timeout = self->_timeout;
  self->_timeout = 0;

  v6 = self->_locationManager;
  v7 = self->_assertion;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003FBF40;
  v11[3] = &unk_1011AC8B0;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = objc_retainBlock(v11);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "authorizationStatus");
  if (self->_active && v4 - 3 <= 1)
    objc_msgSend(v6, "startUpdatingLocation");

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lastObject", a3));
  objc_storeStrong((id *)&self->_lastLocation, v5);
  if (-[SingleLocationUpdate _isLocationGoodEnough:](self, "_isLocationGoodEnough:", v5))
    -[SingleLocationUpdate _completeWithLocation:error:](self, "_completeWithLocation:error:", v5, 0);

}

- (BOOL)_isLocationGoodEnough:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(v4, "horizontalAccuracy");
  v7 = v6;
  -[SingleLocationUpdate desiredAccuracy](self, "desiredAccuracy");
  if (v7 <= v8)
  {
    v12 = 1;
    goto LABEL_9;
  }
  -[SingleLocationUpdate _timeSinceStart](self, "_timeSinceStart");
  v10 = v9;
  if (v9 > 5.0)
  {
    -[SingleLocationUpdate acceptableAccuracy](self, "acceptableAccuracy");
    v12 = v7 <= v11 || v10 >= 10.0;
  }
  else
  {
LABEL_7:
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  unsigned __int8 v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "code")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain")),
        v6 = objc_msgSend(v5, "isEqualToString:", kCLErrorDomain),
        v5,
        (v6 & 1) == 0))
  {
    -[SingleLocationUpdate _completeWithLocation:error:](self, "_completeWithLocation:error:", 0, v7);
  }

}

- (void)_completeWithLocation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  id v21;
  _BOOL4 v22;
  uint64_t v23;
  void (**v24)(id, id, id);
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  SingleLocationUpdate *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;

  v6 = a3;
  v7 = a4;
  -[NSTimer invalidate](self->_timeout, "invalidate");
  if (v6)
  {
    v8 = sub_1003FBB38();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[SingleLocationUpdate _timeSinceStart](self, "_timeSinceStart");
      v11 = v10;
      objc_msgSend(v6, "horizontalAccuracy");
      v13 = v12;
      -[SingleLocationUpdate desiredAccuracy](self, "desiredAccuracy");
      v15 = v14;
      -[SingleLocationUpdate acceptableAccuracy](self, "acceptableAccuracy");
      v32 = 134219008;
      v33 = self;
      v34 = 2048;
      v35 = v11;
      v36 = 2048;
      v37 = v13;
      v38 = 2048;
      v39 = v15;
      v40 = 2048;
      v41 = v16;
      v17 = "Single location update %p got a good-enough location after %#.3lfs (accuracy: ±%#.2lfm, desired: ±%#.2lfm, a"
            "cceptable: ±%#.2lfm)";
      v18 = v9;
      v19 = OS_LOG_TYPE_INFO;
      v20 = 52;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, (uint8_t *)&v32, v20);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v21 = sub_1003FBB38();
  v9 = objc_claimAutoreleasedReturnValue(v21);
  v22 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v22)
    {
      -[SingleLocationUpdate _timeSinceStart](self, "_timeSinceStart");
      v32 = 134218498;
      v33 = self;
      v34 = 2048;
      v35 = v23;
      v36 = 2112;
      v37 = v7;
      v17 = "Single location update %p failed after %#.3lfs with error: %@";
      v18 = v9;
      v19 = OS_LOG_TYPE_ERROR;
      v20 = 32;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v22)
  {
    -[SingleLocationUpdate _timeSinceStart](self, "_timeSinceStart");
    v26 = v25;
    -[CLLocation horizontalAccuracy](self->_lastLocation, "horizontalAccuracy");
    v28 = v27;
    -[SingleLocationUpdate desiredAccuracy](self, "desiredAccuracy");
    v30 = v29;
    -[SingleLocationUpdate acceptableAccuracy](self, "acceptableAccuracy");
    v32 = 134219008;
    v33 = self;
    v34 = 2048;
    v35 = v26;
    v36 = 2048;
    v37 = v28;
    v38 = 2048;
    v39 = v30;
    v40 = 2048;
    v41 = v31;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Single location update %p never got a good-enough location after %#.3lfs (best received: ±%#.2lfm, desired: ±%#.2lfm, acceptable: ±%#.2lfm)", (uint8_t *)&v32, 0x34u);
  }

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomain, 0, 0));
LABEL_9:
  v24 = (void (**)(id, id, id))objc_retainBlock(self->_completionHandler);
  -[SingleLocationUpdate _cleanup](self, "_cleanup");
  if (v24)
    v24[2](v24, v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end

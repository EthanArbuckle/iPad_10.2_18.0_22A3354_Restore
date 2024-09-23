@implementation DetailsViewAnalytics

- (DetailsViewAnalytics)initWithCurrentTime:(double)a3
{
  DetailsViewAnalytics *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DetailsViewAnalytics;
  v4 = -[DetailsViewAnalytics init](&v6, "init");
  -[DetailsViewAnalytics resetAnalytics](v4, "resetAnalytics");
  v4->_timeAtContainerCreation = a3;
  return v4;
}

- (void)updateDistanceAnalytics:(int)a3
{
  double distanceAtFindButtonAvailable;
  double distanceAtEndFinding;
  double distanceAtFindButtonPressed;

  switch(a3)
  {
    case 3:
      distanceAtEndFinding = self->_distanceAtEndFinding;
      if (distanceAtEndFinding == -1.0)
        distanceAtEndFinding = self->_mostRecentDistance;
      self->_distanceAtEndFinding = distanceAtEndFinding;
      break;
    case 2:
      distanceAtFindButtonPressed = self->_distanceAtFindButtonPressed;
      if (distanceAtFindButtonPressed == -1.0)
        distanceAtFindButtonPressed = self->_mostRecentDistance;
      self->_distanceAtFindButtonPressed = distanceAtFindButtonPressed;
      break;
    case 1:
      distanceAtFindButtonAvailable = self->_distanceAtFindButtonAvailable;
      if (distanceAtFindButtonAvailable == -1.0)
        distanceAtFindButtonAvailable = self->_mostRecentDistance;
      self->_distanceAtFindButtonAvailable = distanceAtFindButtonAvailable;
      break;
  }
}

- (void)updateTimeAnalytics:(int)a3 currentTime:(double)a4
{
  double *v4;

  if (a3 <= 3)
  {
    v4 = (double *)(&self->super.isa + a3);
    if (v4[2] != -1.0)
      a4 = v4[2];
    v4[2] = a4;
  }
}

- (void)updateWithMostRecentDistance:(double)a3
{
  self->_mostRecentDistance = a3;
}

- (void)updateWithMostRecentRawDistance:(double)a3
{
  if (self->_distanceAtDiscovery == -1.0)
    self->_distanceAtDiscovery = a3;
}

- (void)setEnteredFromActiveFindingUI:(BOOL)a3
{
  self->_enteredFromActiveFindingUI = a3;
}

- (void)resetAnalytics
{
  NSObject *v3;
  uint8_t v9[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-ca,CoreAnalytics: resetting analytics", v9, 2u);
  }
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_distanceAtDiscovery = _Q0;
  *(_OWORD *)&self->_distanceAtFindButtonPressed = _Q0;
  *(_OWORD *)&self->_timeAtDiscovery = _Q0;
  *(_OWORD *)&self->_timeAtFindButtonPressed = _Q0;
  self->_mostRecentDistance = -1.0;
  self->_enteredFromActiveFindingUI = 0;
}

- (void)submitAnalytics
{
  id v3;
  void *v4;
  double timeAtDiscovery;
  double v6;
  void *v7;
  double timeAtFindButtonAvailable;
  double v9;
  void *v10;
  double timeAtFindButtonPressed;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double distanceAtEndFinding;
  double v24;
  void *v25;
  double timeAtFindingSessionEnd;
  double v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_enteredFromActiveFindingUI));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("EnteredFromActiveFindingUI"));

  timeAtDiscovery = self->_timeAtDiscovery;
  v6 = -1.0;
  if (timeAtDiscovery != -1.0)
    v6 = timeAtDiscovery - self->_timeAtContainerCreation;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("DeltaTimeFromContainerCreationToDiscovery"));

  timeAtFindButtonAvailable = self->_timeAtFindButtonAvailable;
  v9 = -1.0;
  if (timeAtFindButtonAvailable != -1.0)
    v9 = timeAtFindButtonAvailable - self->_timeAtContainerCreation;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("DeltaTimeFromContainerCreationToFindButtonAvailable"));

  timeAtFindButtonPressed = self->_timeAtFindButtonPressed;
  v12 = -1.0;
  if (timeAtFindButtonPressed != -1.0)
    v12 = timeAtFindButtonPressed - self->_timeAtContainerCreation;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("DeltaTimeFromContainerCreationToFindButtonPressed"));

  v14 = self->_timeAtFindButtonAvailable;
  v15 = -1.0;
  if (v14 != -1.0)
    v15 = v14 - self->_timeAtDiscovery;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("DeltaTimeFromDiscoveryToFindButtonAvailable"));

  v17 = self->_timeAtFindButtonPressed;
  v18 = -1.0;
  if (v17 != -1.0)
    v18 = v17 - self->_timeAtFindButtonAvailable;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("DeltaTimeFromFindButtonAvailableToFindButtonPressed"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distanceAtDiscovery));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("DistanceAtDiscovery"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distanceAtFindButtonAvailable));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("DistanceAtFindButtonAvailable"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_distanceAtFindButtonPressed));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("DistanceAtPressFind"));

  distanceAtEndFinding = self->_distanceAtEndFinding;
  v24 = -1.0;
  if (distanceAtEndFinding != -1.0)
    v24 = vabdd_f64(distanceAtEndFinding, self->_distanceAtFindButtonPressed);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("DistanceBetweenStartAndEndFinding"));

  timeAtFindingSessionEnd = self->_timeAtFindingSessionEnd;
  v27 = -1.0;
  if (timeAtFindingSessionEnd != -1.0)
    v27 = timeAtFindingSessionEnd - self->_timeAtFindButtonPressed;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("FindingTime"));

  v29 = objc_msgSend(v3, "mutableCopy");
  v30 = (id)qword_10085F520;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "description"));
    *(_DWORD *)buf = 138412290;
    v36 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#ni-ca,send find button availability analytics event:\n%@\n", buf, 0xCu);

  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100039C80;
  v33[3] = &unk_1007FA568;
  v32 = v29;
  v34 = v32;
  AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.peopleFindingSession.DetailsViewBehavior"), v33);
  -[DetailsViewAnalytics resetAnalytics](self, "resetAnalytics");

}

@end

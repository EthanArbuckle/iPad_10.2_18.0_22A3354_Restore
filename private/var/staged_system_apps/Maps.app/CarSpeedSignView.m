@implementation CarSpeedSignView

- (void)dealloc
{
  objc_super v3;

  -[CarSpeedSignView _deactivate](self, "_deactivate");
  v3.receiver = self;
  v3.super_class = (Class)CarSpeedSignView;
  -[CarSpeedSignView dealloc](&v3, "dealloc");
}

- (CarSpeedSignView)initWithCarSceneType:(int64_t)a3
{
  CarSpeedSignView *v4;
  CarSpeedSignView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarSpeedSignView;
  v4 = -[SpeedLimitView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_carSceneType = a3;
    v4->_active = 0;
    v4->_contentsHidden = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5->_isNavigating = objc_msgSend(v6, "isInNavigatingState");

    -[CarSpeedSignView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("CarSpeedSignView"));
  }
  return v5;
}

- (int64_t)shieldIdiom
{
  return 1;
}

- (int64_t)shieldSize
{
  return 3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    if (a3)
      -[CarSpeedSignView _activate](self, "_activate");
    else
      -[CarSpeedSignView _deactivate](self, "_deactivate");
  }
}

- (void)refreshSpeedLimit
{
  void *v3;
  id v4;

  if (self->_isNavigating)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));

  }
  else
  {
    v4 = 0;
  }
  -[CarSpeedSignView _setLocation:](self, "_setLocation:", v4);

}

- (void)setContentsHidden:(BOOL)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  __CFString *v11;

  if (self->_contentsHidden != a3)
  {
    self->_contentsHidden = a3;
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = -[CarSpeedSignView contentsHidden](self, "contentsHidden");
      v7 = CFSTR("NO");
      if (v6)
        v7 = CFSTR("YES");
      v8 = v7;
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[SpeedSign] Will post visibility changed notification (contentsHidden: %@)", (uint8_t *)&v10, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("CarSpeedSignViewDidChangeVisibility"), self);

  }
}

- (double)dynamicScale
{
  void *v3;
  void *v4;
  int64_t carSceneType;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double result;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpeedSignView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  if (v4)
  {
    carSceneType = self->_carSceneType;

    if (carSceneType == 7)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSpeedSignView window](self, "window"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
      objc_msgSend(v7, "_car_dynamicPointScaleValue");
      v9 = v8;

      return v9;
    }
  }
  else
  {

  }
  v11.receiver = self;
  v11.super_class = (Class)CarSpeedSignView;
  -[SpeedLimitView dynamicScale](&v11, "dynamicScale");
  return result;
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  double v13;
  _QWORD v14[5];
  BOOL v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  __CFString *v19;

  if (self->_dimmed != a3)
  {
    v4 = a3;
    self->_dimmed = a3;
    if (a4)
      v6 = !+[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters");
    else
      v6 = 0;
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v4)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      if (v6)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[SpeedSign] (dimmed: %@, animated: %@)", buf, 0x16u);

    }
    v13 = 0.0;
    if (v6)
      v13 = 0.25;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100B51E84;
    v14[3] = &unk_1011ACE58;
    v14[4] = self;
    v15 = v4;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v14, v13);
  }
}

- (void)_updateLocationSource
{
  id v3;
  NSObject *v4;
  GEORoadMatcher *roadMatcher;
  void *v6;
  id v7;
  NSObject *v8;
  GEORoadMatcher *v9;
  GEORoadMatcher *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (!self->_active
    || self->_isNavigating
    || (GEOConfigGetBOOL(MapsConfig_EnableSpeedSignRoadMatcher, off_1014B4C58) & 1) == 0
    && (CarDisplayIsDriveCameraEnabled() & 1) == 0)
  {
    if (!self->_roadMatcher)
      return;
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SpeedSign] Stopping road matcher", buf, 2u);
    }

    roadMatcher = self->_roadMatcher;
    self->_roadMatcher = 0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v6, "stopListeningForLocationUpdates:", self);
    goto LABEL_7;
  }
  if (!self->_roadMatcher)
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[SpeedSign] Starting road mather", v11, 2u);
    }

    v9 = (GEORoadMatcher *)objc_msgSend(objc_alloc((Class)GEORoadMatcher), "initWithAuditToken:", 0);
    v10 = self->_roadMatcher;
    self->_roadMatcher = v9;

    -[GEORoadMatcher setSearchRadius:](self->_roadMatcher, "setSearchRadius:", GEOConfigGetDouble(MapsConfig_SpeedSignRoadMatcherRadius, off_1014B4C68));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v6, "listenForLocationUpdates:", self);
LABEL_7:

  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  self->_isNavigating = MNNavigationServiceStateIsNavigating(a5, a2);
  -[CarSpeedSignView _updateLocationSource](self, "_updateLocationSource");
  -[CarSpeedSignView refreshSpeedLimit](self, "refreshSpeedLimit");
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  -[CarSpeedSignView _setLocation:](self, "_setLocation:", a4);
}

- (void)_setLocation:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "speedLimit");
  v6 = objc_msgSend(v4, "speedLimitShieldType");

  -[SpeedLimitView setSpeedLimit:shieldType:](self, "setSpeedLimit:shieldType:", v5, v6);
  -[CarSpeedSignView setContentsHidden:](self, "setContentsHidden:", -[SpeedLimitView hasContent](self, "hasContent") ^ 1);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  GEORoadMatcher *roadMatcher;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  unsigned int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  id v17;
  __int16 v18;
  __CFString *v19;

  roadMatcher = self->_roadMatcher;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEORoadMatcher matchLocation:forTransportType:](roadMatcher, "matchLocation:forTransportType:", v6, 0));

  v8 = objc_alloc((Class)MNLocation);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));

  v10 = objc_msgSend(v8, "initWithRoadMatch:rawLocation:locationMatchType:", v7, v9, 2);
  v11 = sub_10043364C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(v10, "locationUnreliable");
    v14 = CFSTR("NO");
    if (v13)
      v14 = CFSTR("YES");
    v15 = v14;
    v16 = 138478083;
    v17 = v10;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[SpeedSign] matched location: %{private}@ (unreliable: %@)", (uint8_t *)&v16, 0x16u);

  }
  -[CarSpeedSignView _setLocation:](self, "_setLocation:", v10);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)_activate
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  self->_active = 1;
  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will activate speed sign view", v6, 2u);
  }

  -[CarSpeedSignView refreshSpeedLimit](self, "refreshSpeedLimit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v5, "registerObserver:", self);

  -[CarSpeedSignView _updateLocationSource](self, "_updateLocationSource");
}

- (void)_deactivate
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  self->_active = 0;
  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will deactivate speed sign view", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v5, "unregisterObserver:", self);

  -[SpeedLimitView setSpeedLimit:shieldType:](self, "setSpeedLimit:shieldType:", 0, 0);
  -[CarSpeedSignView _updateLocationSource](self, "_updateLocationSource");
}

- (BOOL)contentsHidden
{
  return self->_contentsHidden;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadMatch, 0);
  objc_storeStrong((id *)&self->_roadMatcher, 0);
}

@end

@implementation VLFPuckAnimationTask

- (VLFPuckAnimationTask)initWithPlatformController:(id)a3
{
  id v4;
  VLFPuckAnimationTask *v5;
  VLFPuckAnimationTask *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v4 = a3;
  if (!v4)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[VLFPuckAnimationTask initWithPlatformController:]";
      v19 = 2080;
      v20 = "VLFPuckAnimationTask.m";
      v21 = 1024;
      v22 = 41;
      v23 = 2080;
      v24 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)VLFPuckAnimationTask;
  v5 = -[VLFPuckAnimationTask init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "userTrackingViewModeDidChangeNotification:", MKUserTrackingViewModeDidChangeNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, "vlfSessionTaskWillShowVLFUINotification:", CFSTR("VLFSessionTaskWillShowVLFUINotification"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "vlfSessionTaskDidHideVLFUINotification:", CFSTR("VLFSessionTaskDidHideVLFUINotification"), 0);

  }
  return v6;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)animateVLFPuckOnceIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[2];
  __int16 v17;
  __int16 v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckAnimationTask currentNavigationSession](self, "currentNavigationSession"));

  if (v3)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[VLFPuckAnimationTask currentNavigationSession](self, "currentNavigationSession"));
    if (!+[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", objc_msgSend(v15, "currentTransportType")))
    {

      return;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckAnimationTask currentNavigationSession](self, "currentNavigationSession"));
    v5 = objc_msgSend(v4, "navigationType");

    if (v5 != (id)3)
      return;
    v6 = sub_10074F394();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v18 = 0;
      v8 = "Animating VLF puck during TbT navigation";
      v9 = (uint8_t *)&v18;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckAnimationTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckAnimationTask currentRoutePlanningSession](self, "currentRoutePlanningSession"));
      v12 = +[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", objc_msgSend(v11, "currentTransportType"));

      if (!v12)
        return;
      v13 = sub_10074F394();
      v7 = objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      v17 = 0;
      v8 = "Animating VLF puck during route planning";
      v9 = (uint8_t *)&v17;
      goto LABEL_13;
    }
    v14 = sub_10074F394();
    v7 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "Animating VLF puck while neither in route planning nor navigation";
      v9 = buf;
      goto LABEL_13;
    }
  }
LABEL_14:

  -[VLFPuckAnimationTask animateVLFPuckOnce](self, "animateVLFPuckOnce");
}

- (void)animateVLFPuckOnce
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[16];

  if (-[VLFPuckAnimationTask isShowingVLF](self, "isShowingVLF"))
  {
    v3 = sub_10074F394();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Asked to animate the VLF puck once but we're currently showing VLF; ignoring",
        buf,
        2u);
    }

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckAnimationTask platformController](self, "platformController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));

    v7 = objc_opt_class(IOSBasedChromeViewController);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v11 = v8;

    v9 = v11;
    if (v11)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userLocationView"));
      objc_msgSend(v10, "animateVLFPuckOnce");

      v9 = v11;
    }

  }
}

- (void)setCurrentRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *currentRoutePlanningSession;
  RoutePlanningSession *v7;
  id v8;
  NSObject *v9;
  int64_t v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;

  v5 = (RoutePlanningSession *)a3;
  currentRoutePlanningSession = self->_currentRoutePlanningSession;
  if (currentRoutePlanningSession != v5)
  {
    -[RoutePlanningSession removeObserver:](currentRoutePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_currentRoutePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_currentRoutePlanningSession, "addObserver:", self);
    v7 = self->_currentRoutePlanningSession;
    if (v7)
    {
      if (+[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", -[RoutePlanningSession currentTransportType](v7, "currentTransportType")))
      {
        v8 = sub_10074F394();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = -[RoutePlanningSession currentTransportType](self->_currentRoutePlanningSession, "currentTransportType");
          if ((unint64_t)(v10 - 1) > 4)
            v11 = CFSTR("Undefined");
          else
            v11 = *(&off_1011C5758 + v10 - 1);
          v12 = 138412290;
          v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Started route planning with a supported VLF transport type (%@); animating the puck",
            (uint8_t *)&v12,
            0xCu);
        }

        -[VLFPuckAnimationTask animateVLFPuckOnce](self, "animateVLFPuckOnce");
      }
    }
  }

}

- (void)setCurrentNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *currentNavigationSession;
  NavigationSession **p_currentNavigationSession;
  NavigationSession *v8;
  id v9;
  NSObject *v10;
  char *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;

  v5 = (NavigationSession *)a3;
  p_currentNavigationSession = &self->_currentNavigationSession;
  currentNavigationSession = self->_currentNavigationSession;
  if (currentNavigationSession != v5)
  {
    -[NavigationSession removeObserver:](currentNavigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_currentNavigationSession, a3);
    -[NavigationSession addObserver:](self->_currentNavigationSession, "addObserver:", self);
    v8 = self->_currentNavigationSession;
    if (v8)
    {
      if (+[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", -[NavigationSession currentTransportType](v8, "currentTransportType"))&& (id)-[NavigationSession navigationType](*p_currentNavigationSession, "navigationType") == (id)3)
      {
        v9 = sub_10074F394();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = -[NavigationSession currentTransportType](*p_currentNavigationSession, "currentTransportType");
          if ((unint64_t)(v11 - 1) > 4)
            v12 = CFSTR("Undefined");
          else
            v12 = *(&off_1011C5758 + (_QWORD)(v11 - 1));
          v13 = 138412290;
          v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Started TbT navigation with a supported VLF transport type (%@); animating the puck",
            (uint8_t *)&v13,
            0xCu);
        }

        -[VLFPuckAnimationTask animateVLFPuckOnce](self, "animateVLFPuckOnce");
      }
    }
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v6 = a5;
  v7 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[VLFPuckAnimationTask setCurrentRoutePlanningSession:](self, "setCurrentRoutePlanningSession:", v9);

  v13 = v6;
  v10 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
    v11 = v13;
  else
    v11 = 0;
  v12 = v11;

  -[VLFPuckAnimationTask setCurrentNavigationSession:](self, "setCurrentNavigationSession:", v12);
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;

  if (+[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", a4))
  {
    v7 = sub_10074F394();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(a4 - 1) > 4)
        v9 = CFSTR("Undefined");
      else
        v9 = *(&off_1011C5758 + a4 - 1);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Changed transport types during route planning to a supported VLF transport type (%@); animating the puck",
        (uint8_t *)&v10,
        0xCu);
    }

    -[VLFPuckAnimationTask animateVLFPuckOnce](self, "animateVLFPuckOnce");
  }
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  if (+[VLFSessionTask isSupportedForTransportType:](VLFSessionTask, "isSupportedForTransportType:", a4))
  {
    v6 = sub_10074F394();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(a4 - 1) > 4)
        v8 = CFSTR("Undefined");
      else
        v8 = *(&off_1011C5758 + a4 - 1);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Changed transport types during navigation to a supported VLF transport type (%@); animating the puck",
        (uint8_t *)&v9,
        0xCu);
    }

    -[VLFPuckAnimationTask animateVLFPuckOnce](self, "animateVLFPuckOnce");
  }
}

- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3
{
  -[VLFPuckAnimationTask setShowingVLF:](self, "setShowingVLF:", 1);
}

- (void)vlfSessionTaskDidHideVLFUINotification:(id)a3
{
  -[VLFPuckAnimationTask setShowingVLF:](self, "setShowingVLF:", 0);
}

- (void)userTrackingViewModeDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v4 = a3;
  if (-[VLFPuckAnimationTask isShowingVLF](self, "isShowingVLF"))
  {
    v5 = sub_10074F394();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "User tracking mode changed but we're currently showing vlf; ignoring",
        buf,
        2u);
    }
    goto LABEL_15;
  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = objc_opt_class(MKMapView);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    goto LABEL_15;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = MKMapViewDidFinishInitialUserTrackingModeAnimationNotification;
  objc_msgSend(v8, "removeObserver:name:object:", self, MKMapViewDidFinishInitialUserTrackingModeAnimationNotification, 0);

  if (!-[NSObject userTrackingMode](v6, "userTrackingMode"))
    goto LABEL_15;
  -[NSObject centerCoordinate](v6, "centerCoordinate");
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userLocation](v6, "userLocation"));
  objc_msgSend(v14, "coordinate");
  if (vabdd_f64(v11, v16) >= 0.00000000999999994)
  {

  }
  else
  {
    v17 = vabdd_f64(v13, v15);

    if (v17 < 0.00000000999999994)
    {
      v18 = sub_10074F394();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "User tapped on My Location but they're already close to their location; animating the puck",
          v24,
          2u);
      }

      -[VLFPuckAnimationTask animateVLFPuckOnceIfNecessary](self, "animateVLFPuckOnceIfNecessary");
      goto LABEL_15;
    }
  }
  v20 = sub_10074F394();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "User tapped on My Location but they're far from their location; waiting for tracking animation to end before animating the puck",
      v23,
      2u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "mapViewDidFinishInitialUserTrackingModeAnimationNotification:", v9, 0);

LABEL_15:
}

- (void)mapViewDidFinishInitialUserTrackingModeAnimationNotification:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, MKMapViewDidFinishInitialUserTrackingModeAnimationNotification, 0);

  v5 = sub_10074F394();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "User tracking animation ended; animating the puck",
      v7,
      2u);
  }

  -[VLFPuckAnimationTask animateVLFPuckOnceIfNecessary](self, "animateVLFPuckOnceIfNecessary");
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (RoutePlanningSession)currentRoutePlanningSession
{
  return self->_currentRoutePlanningSession;
}

- (NavigationSession)currentNavigationSession
{
  return self->_currentNavigationSession;
}

- (BOOL)isShowingVLF
{
  return self->_showingVLF;
}

- (void)setShowingVLF:(BOOL)a3
{
  self->_showingVLF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNavigationSession, 0);
  objc_storeStrong((id *)&self->_currentRoutePlanningSession, 0);
  objc_destroyWeak((id *)&self->_platformController);
}

@end

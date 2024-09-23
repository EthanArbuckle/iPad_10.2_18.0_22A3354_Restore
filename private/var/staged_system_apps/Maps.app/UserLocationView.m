@implementation UserLocationView

- (UserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  UserLocationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  v4 = -[UserLocationView initWithAnnotation:reuseIdentifier:](&v6, "initWithAnnotation:reuseIdentifier:", a3, a4);
  v4->_mode = 0;
  -[UserLocationView _updateForMode:animated:](v4, "_updateForMode:animated:", 0, 0);
  return v4;
}

- (void)setMode:(int64_t)a3
{
  -[UserLocationView setMode:animated:](self, "setMode:animated:", a3, 0);
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[UserLocationView _updateForMode:animated:](self, "_updateForMode:animated:");
  }
}

- (void)_updateForMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;

  v4 = a4;
  v7 = sub_100B08220();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating for UserLocationMarkerMode: %ld", (uint8_t *)&v12, 0xCu);
  }

  v9 = -[UserLocationView _shouldRotateForCourseWithMode:](self, "_shouldRotateForCourseWithMode:", a3);
  -[UserLocationView setAllowsAccuracyRing:](self, "setAllowsAccuracyRing:", a3 != 1);
  -[UserLocationView setShouldInnerPulse:](self, "setShouldInnerPulse:", a3 != 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v10, "setMode:", a3 == 2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v11, "setShowCourse:", v9);

  -[UserLocationView _updateNavPuckAnimated:](self, "_updateNavPuckAnimated:", v4);
}

- (BOOL)_shouldRotateForCourseWithMode:(int64_t)a3
{
  return a3 == 1;
}

- (void)setInNavMode:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;

  if (self->_inNavMode != a3)
  {
    v4 = a4;
    v5 = a3;
    v7 = sub_100B08220();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v5)
        v9 = CFSTR("YES");
      v10 = v9;
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting is in nav mode: %@", (uint8_t *)&v11, 0xCu);

    }
    self->_inNavMode = v5;
    -[UserLocationView _updateNavPuckAnimated:](self, "_updateNavPuckAnimated:", v4);
  }
}

- (void)setViewMode:(int64_t)a3
{
  id v5;
  NSObject *v6;
  int v7;
  int64_t v8;

  if (self->_viewMode != a3)
  {
    v5 = sub_100B08220();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting view mode: %ld", (uint8_t *)&v7, 0xCu);
    }

    self->_inNavigationMapMode = 0;
    self->_viewMode = a3;
    -[UserLocationView _updateNavPuckAnimated:](self, "_updateNavPuckAnimated:", 0);
  }
}

- (BOOL)_shouldUseNavPuck
{
  return self->_mode == 1;
}

- (void)_updateNavPuckAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  double v9;
  double v10;
  int v11;
  _BOOL4 v12;

  v3 = a3;
  v5 = -[UserLocationView _shouldUseNavPuck](self, "_shouldUseNavPuck");
  v6 = sub_100B08220();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      v11 = 67109120;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_updateNavPuckAnimated: to nav puck, animated: %d", (uint8_t *)&v11, 8u);
    }

    v9 = 0.0;
    if (v3)
      v9 = 1.0;
    -[UserLocationView _transitionToNavPuckWithDuration:](self, "_transitionToNavPuckWithDuration:", v9);
  }
  else
  {
    if (v8)
    {
      v11 = 67109120;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_updateNavPuckAnimated: to normal puck, animated: %d", (uint8_t *)&v11, 8u);
    }

    v10 = 0.0;
    if (v3)
      v10 = 1.0;
    -[UserLocationView _transitionToNormalPuckWithDuration:](self, "_transitionToNormalPuckWithDuration:", v10);
  }
}

- (void)_setVKNavigationPuckMarker:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v5 = sub_100B08220();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_setVKNavigationPuckMarker: %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)UserLocationView;
  -[UserLocationView _setVKNavigationPuckMarker:](&v7, "_setVKNavigationPuckMarker:", v4);
  -[UserLocationView _updateVKNavigationPuckMarkerFromCurrentState](self, "_updateVKNavigationPuckMarkerFromCurrentState");

}

- (void)_updateVKNavigationPuckMarkerFromCurrentState
{
  id v3;
  NSObject *v4;
  int64_t mode;
  _BOOL4 isNavPuckActive;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  double v27;
  _BOOL8 v28;
  void *v29;
  int v30;
  int64_t v31;
  __int16 v32;
  _BOOL4 v33;

  v3 = sub_100B08220();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    mode = self->_mode;
    isNavPuckActive = self->_isNavPuckActive;
    v30 = 134218240;
    v31 = mode;
    v32 = 1024;
    v33 = isNavPuckActive;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_updateVKNavigationPuckMarkerFromCurrentState _mode: %ld _isNavPuckActive: %d", (uint8_t *)&v30, 0x12u);
  }

  v7 = self->_mode == 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v8, "setMode:", v7);

  v9 = -[UserLocationView _shouldRotateForCourseWithMode:](self, "_shouldRotateForCourseWithMode:", self->_mode);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v10, "setShowCourse:", v9);

  v11 = -[UserLocationView _isTracking](self, "_isTracking");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v12, "setTracking:", v11);

  -[UserLocationView _presentationCourse](self, "_presentationCourse");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v15, "setPresentationCourse:", v14);

  -[UserLocationView _presentationCoordinate](self, "_presentationCoordinate");
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v20, "setPresentationCoordinate:", v17, v19);

  v21 = -[UserLocationView _isAnimatingToCoordinate](self, "_isAnimatingToCoordinate");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v22, "setAnimatingToCoordinate:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView annotation](self, "annotation"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v24, "setAnnotation:", v23);

  if (self->_isNavPuckActive)
    v25 = 1.0;
  else
    v25 = 0.0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  *(float *)&v27 = v25;
  objc_msgSend(v26, "setScale:", v27);

  v28 = self->_isNavPuckActive;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v29, "setEnabled:", v28);

  -[UserLocationView _updateNavPuckAnimated:](self, "_updateNavPuckAnimated:", 0);
}

- (void)_setTracking:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  -[UserLocationView _setTracking:](&v6, "_setTracking:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v5, "setTracking:", v3);

}

- (void)_setPresentationCourse:(double)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  -[UserLocationView _setPresentationCourse:](&v6, "_setPresentationCourse:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v5, "setPresentationCourse:", a3);

}

- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  objc_super v7;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7.receiver = self;
  v7.super_class = (Class)UserLocationView;
  -[UserLocationView _setPresentationCoordinate:](&v7, "_setPresentationCoordinate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v6, "setPresentationCoordinate:", latitude, longitude);

}

- (void)_setAnimatingToCoordinate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  -[UserLocationView _setAnimatingToCoordinate:](&v6, "_setAnimatingToCoordinate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v5, "setAnimatingToCoordinate:", v3);

}

- (void)setAnnotation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  v4 = a3;
  -[UserLocationView setAnnotation:](&v6, "setAnnotation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker", v6.receiver, v6.super_class));
  objc_msgSend(v5, "setAnnotation:", v4);

}

- (void)_transitionToNavPuckWithDuration:(double)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  VKTimedAnimation *v16;
  VKTimedAnimation *transitionAnimation;
  id v18;
  NSObject *v19;
  VKTimedAnimation *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  double v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  uint8_t buf[4];
  VKTimedAnimation *v35;
  __int16 v36;
  void *v37;

  if (self->_isNavPuckActive
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker")),
        v10,
        !v10))
  {
    v4 = sub_100B08220();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_isNavPuckActive)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
      *(_DWORD *)buf = 138412546;
      v35 = (VKTimedAnimation *)v7;
      v36 = 2048;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not transitioning to navigation puck because either the nav puck is already active (%@) or vkNavigationPuckMarker is nil (%p)", buf, 0x16u);

    }
  }
  else
  {
    v11 = sub_100B08220();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Transitioning to navigation puck", buf, 2u);
    }

    self->_isNavPuckActive = 1;
    -[UserLocationView setEnabled:](self, "setEnabled:", 0);
    -[VKTimedAnimation stop](self->_transitionAnimation, "stop");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
    objc_msgSend(v13, "setEnabled:", 1);

    if (a3 <= 0.0
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView superview](self, "superview")),
          v15 = v14 == 0,
          v14,
          v15))
    {
      v22 = sub_100B08220();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Transitioning to navigation puck un-animated", buf, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
      LODWORD(v25) = 1.0;
      objc_msgSend(v24, "setScale:", v25);

      CGAffineTransformMakeScale(&v27, 0.0, 0.0);
      v26 = v27;
      -[UserLocationView setTransform:](self, "setTransform:", &v26);
      -[UserLocationView setAlpha:](self, "setAlpha:", 0.0);
    }
    else
    {
      objc_initWeak(&location, self);
      v16 = (VKTimedAnimation *)objc_msgSend(objc_alloc((Class)VKTimedAnimation), "initWithDuration:", a3);
      transitionAnimation = self->_transitionAnimation;
      self->_transitionAnimation = v16;

      v18 = sub_100B08220();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = self->_transitionAnimation;
        *(_DWORD *)buf = 138412290;
        v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Transitioning to navigation puck animated with animation: %@", buf, 0xCu);
      }

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100B08F00;
      v31[3] = &unk_1011C3118;
      v21 = (id)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
      v32 = v21;
      -[VKTimedAnimation setStepHandler:](self->_transitionAnimation, "setStepHandler:", v31);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100B08F10;
      v29[3] = &unk_1011AD4F0;
      objc_copyWeak(&v30, &location);
      -[VKTimedAnimation setCompletionHandler:](self->_transitionAnimation, "setCompletionHandler:", v29);
      objc_msgSend(v21, "runAnimation:", self->_transitionAnimation);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100B09020;
      v28[3] = &unk_1011AC860;
      v28[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v28, a3);
      objc_destroyWeak(&v30);

      objc_destroyWeak(&location);
    }
  }
}

- (void)_transitionToNormalPuckWithDuration:(double)a3
{
  _BOOL4 isNavPuckActive;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  BOOL v10;
  VKTimedAnimation *v11;
  VKTimedAnimation *transitionAnimation;
  id v13;
  NSObject *v14;
  VKTimedAnimation *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  double v21;
  void *v22;
  __int128 v23;
  _OWORD v24[3];
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  uint8_t buf[4];
  VKTimedAnimation *v33;

  isNavPuckActive = self->_isNavPuckActive;
  v6 = sub_100B08220();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (isNavPuckActive)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Transitioning to normal puck", buf, 2u);
    }

    self->_isNavPuckActive = 0;
    -[UserLocationView setEnabled:](self, "setEnabled:", 1);
    -[VKTimedAnimation stop](self->_transitionAnimation, "stop");
    if (a3 <= 0.0
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView superview](self, "superview")),
          v10 = v9 == 0,
          v9,
          v10))
    {
      v18 = sub_100B08220();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Transitioning to normal puck un-animated", buf, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
      LODWORD(v21) = 0;
      objc_msgSend(v20, "setScale:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
      objc_msgSend(v22, "setEnabled:", 0);

      v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v24[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v24[1] = v23;
      v24[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      -[UserLocationView setTransform:](self, "setTransform:", v24);
      -[UserLocationView setAlpha:](self, "setAlpha:", 1.0);
    }
    else
    {
      objc_initWeak(&location, self);
      v11 = (VKTimedAnimation *)objc_msgSend(objc_alloc((Class)VKTimedAnimation), "initWithDuration:", a3);
      transitionAnimation = self->_transitionAnimation;
      self->_transitionAnimation = v11;

      v13 = sub_100B08220();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = self->_transitionAnimation;
        *(_DWORD *)buf = 138412290;
        v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Transitioning to normal puck animated with animation: %@", buf, 0xCu);
      }

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100B09420;
      v29[3] = &unk_1011C3118;
      v16 = (id)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
      v30 = v16;
      -[VKTimedAnimation setStepHandler:](self->_transitionAnimation, "setStepHandler:", v29);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100B09430;
      v26[3] = &unk_1011AC888;
      objc_copyWeak(&v28, &location);
      v17 = v16;
      v27 = v17;
      -[VKTimedAnimation setCompletionHandler:](self->_transitionAnimation, "setCompletionHandler:", v26);
      objc_msgSend(v17, "runAnimation:", self->_transitionAnimation);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100B09540;
      v25[3] = &unk_1011AC860;
      v25[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v25, a3);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Not transitioning to normal puck because the nav puck is not currently active", buf, 2u);
    }

  }
}

- (void)_transitionTo:(int64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  _BOOL4 v8;
  objc_super v9;
  uint8_t buf[4];
  const __CFString *v11;

  v9.receiver = self;
  v9.super_class = (Class)UserLocationView;
  -[UserLocationView _transitionTo:](&v9, "_transitionTo:");
  v5 = sub_100B08220();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 + 1) > 5)
      v7 = &stru_1011EB268;
    else
      v7 = *(&off_1011E2968 + a3 + 1);
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Transitioning to VKMapMode: %@", buf, 0xCu);
  }

  v8 = a3 == 1;
  if (self->_inNavigationMapMode != v8)
  {
    self->_inNavigationMapMode = v8;
    -[UserLocationView _updateNavPuckAnimated:](self, "_updateNavPuckAnimated:", 1);
  }
}

- (void)updateStateFromLocation:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  char isKindOfClass;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UserLocationView;
  -[UserLocationView updateStateFromLocation:duration:](&v15, "updateStateFromLocation:duration:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v7, "currentVehicleHeading");
  v9 = v8;
  v10 = objc_opt_class(CarUserLocationView);
  isKindOfClass = objc_opt_isKindOfClass(self, v10);
  v12 = -[UserLocationView isStale](self, "isStale");
  if ((isKindOfClass & 1) != 0)
  {
    if ((v12 & 1) == 0)
      goto LABEL_10;
LABEL_5:
    -[UserLocationView locationManagerFailedToUpdateLocation](self, "locationManagerFailedToUpdateLocation");
    v13 = 1;
    goto LABEL_11;
  }
  if ((v12 & 1) != 0)
    goto LABEL_5;
  if (self->_mode != 1)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 0;
  if ((objc_msgSend(v6, "_navigation_hasValidCourse") & 1) == 0 && v9 < 0.0)
    goto LABEL_5;
LABEL_11:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v14, "setStale:", v13);

}

- (void)locationManagerFailedToUpdateLocation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UserLocationView;
  -[UserLocationView locationManagerFailedToUpdateLocation](&v4, "locationManagerFailedToUpdateLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserLocationView _vkNavigationPuckMarker](self, "_vkNavigationPuckMarker"));
  objc_msgSend(v3, "setStale:", -[UserLocationView isStale](self, "isStale"));

}

- (BOOL)isPersistent
{
  return (unint64_t)(self->_mode - 1) < 2;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionAnimation, 0);
}

@end

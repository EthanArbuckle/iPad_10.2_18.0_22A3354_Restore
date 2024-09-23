@implementation PedestrianARRenderingView

- (PedestrianARRenderingView)initWithGuidanceObserver:(id)a3 navigationService:(id)a4
{
  id v6;
  id v7;
  PedestrianARRenderingView *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  VKMapView *v15;
  VKMapView *vkMapView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PedestrianARVKMapViewMapDelegate *v22;
  PedestrianARVKMapViewMapDelegate *mapViewDelegate;
  PedestrianARVKRenderer *v24;
  PedestrianARVKRenderer *vkRenderer;
  void *v26;
  id v27;
  void *v28;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  char *v39;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARRenderingView initWithGuidanceObserver:navigationService:]";
      v43 = 2080;
      v44 = "PedestrianARRenderingView.m";
      v45 = 1024;
      v46 = 48;
      v47 = 2080;
      v48 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v35 = sub_1004318FC();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARRenderingView initWithGuidanceObserver:navigationService:]";
      v43 = 2080;
      v44 = "PedestrianARRenderingView.m";
      v45 = 1024;
      v46 = 49;
      v47 = 2080;
      v48 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PedestrianARRenderingView;
  v8 = -[PedestrianARRenderingView initWithFrame:](&v40, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = sub_100994E50();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v42 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    v12 = objc_msgSend(v11, "requiresRTT");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v13, "nativeScale");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[VKMapViewDescriptor descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:](VKMapViewDescriptor, "descriptorWithShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:", v12, 0, 0, 0, 1));

    v15 = (VKMapView *)objc_msgSend(objc_alloc((Class)VKMapView), "initWithDescriptor:", v14);
    vkMapView = v8->_vkMapView;
    v8->_vkMapView = v15;

    -[VKMapView setDesiredMapMode:](v8->_vkMapView, "setDesiredMapMode:", 4);
    -[VKMapView setMapType:](v8->_vkMapView, "setMapType:", 9);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VKMapView userLocationAnimator](v8->_vkMapView, "userLocationAnimator"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "routeMatch"));
      objc_msgSend(v18, "updateLocation:routeMatch:", v19, v21);

    }
    v22 = -[PedestrianARVKMapViewMapDelegate initWithMapView:]([PedestrianARVKMapViewMapDelegate alloc], "initWithMapView:", v8->_vkMapView);
    mapViewDelegate = v8->_mapViewDelegate;
    v8->_mapViewDelegate = v22;

    v24 = -[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]([PedestrianARVKRenderer alloc], "initWithMapView:navigationService:mapViewDelegate:guidanceObserver:", v8->_vkMapView, v7, v8->_mapViewDelegate, v6);
    vkRenderer = v8->_vkRenderer;
    v8->_vkRenderer = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView layer](v8, "layer"));
    objc_msgSend(v26, "addSublayer:", v8->_vkMapView);

    v27 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v8, "tapGestureRecognizerFired:");
    objc_msgSend(v27, "setDelaysTouchesEnded:", 0);
    -[PedestrianARRenderingView addGestureRecognizer:](v8, "addGestureRecognizer:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v8, "deviceOrientationDidChange:", UIDeviceOrientationDidChangeNotification, 0);

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  objc_super v6;
  uint8_t buf[4];
  PedestrianARRenderingView *v8;

  v3 = sub_100994E50();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  objc_msgSend(WeakRetained, "_removeObserver:", self);

  -[VKMapView setARSession:](self->_vkMapView, "setARSession:", 0);
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARRenderingView;
  -[PedestrianARRenderingView dealloc](&v6, "dealloc");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PedestrianARRenderingView;
  -[PedestrianARRenderingView layoutSubviews](&v12, "layoutSubviews");
  -[PedestrianARRenderingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkMapView](self, "vkMapView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PedestrianARRenderingView;
  -[PedestrianARRenderingView didMoveToWindow](&v8, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkMapView](self, "vkMapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView window](self, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (unint64_t)objc_msgSend(v5, "interfaceOrientation") - 1;
  if (v6 > 3)
    v7 = 0;
  else
    v7 = qword_100E3CC48[v6];
  objc_msgSend(v3, "setARInterfaceOrientation:", v7);

}

- (void)setSession:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  int v10;
  PedestrianARRenderingView *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained != v4)
  {
    v6 = sub_100994E50();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 134349314;
      v11 = self;
      v12 = 2112;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got a new ARSession: %@", (uint8_t *)&v10, 0x16u);
    }

    v8 = objc_loadWeakRetained((id *)&self->_session);
    objc_msgSend(v8, "_removeObserver:", self);

    v9 = objc_storeWeak((id *)&self->_session, v4);
    objc_msgSend(v4, "_addObserver:", self);

    self->_gotFirstFrame = 0;
  }

}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  PedestrianARRenderingView *v10;
  __int16 v11;
  GEOComposedRoute *v12;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, a3);
    v6 = sub_100994E50();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 134349314;
      v10 = self;
      v11 = 2112;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got a new route: %@", (uint8_t *)&v9, 0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkRenderer](self, "vkRenderer"));
    objc_msgSend(v8, "setRoute:", v5);

  }
}

- (BOOL)shouldGenerateFeatures
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkRenderer](self, "vkRenderer"));
  v3 = objc_msgSend(v2, "shouldGenerateFeatures");

  return v3;
}

- (void)setShouldGenerateFeatures:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  PedestrianARRenderingView *v11;
  __int16 v12;
  __CFString *v13;

  v3 = a3;
  v5 = sub_100994E50();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = v7;
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Should generate features: %@", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkRenderer](self, "vkRenderer"));
  objc_msgSend(v9, "setShouldGenerateFeatures:", v3);

}

- (BOOL)shouldShowFeatures
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkRenderer](self, "vkRenderer"));
  v3 = objc_msgSend(v2, "shouldShowFeatures");

  return v3;
}

- (void)setShouldShowFeatures:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  PedestrianARRenderingView *v11;
  __int16 v12;
  __CFString *v13;

  v3 = a3;
  v5 = sub_100994E50();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = v7;
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Should show features: %@", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkRenderer](self, "vkRenderer"));
  objc_msgSend(v9, "setShouldShowFeatures:", v3);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  PedestrianARRenderingView *v11;

  v5 = sub_100994E50();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got first frame from ARKit", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView session](self, "session"));
  objc_msgSend(v7, "_removeObserver:", self);

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100995670;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)deviceOrientationDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView window](self, "window", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  if (v5)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkMapView](self, "vkMapView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView window](self, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
    v8 = (unint64_t)objc_msgSend(v7, "interfaceOrientation") - 1;
    if (v8 > 3)
      v9 = 0;
    else
      v9 = qword_100E3CC48[v8];
    objc_msgSend(v10, "setARInterfaceOrientation:", v9);

  }
}

- (void)tapGestureRecognizerFired:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkMapView](self, "vkMapView"));
  v5 = objc_msgSend(v4, "enableDebugLabelHighlighting");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARRenderingView vkMapView](self, "vkMapView"));
    objc_msgSend(v7, "locationInView:", self);
    objc_msgSend(v6, "debugHighlightLabelAtPoint:");

  }
}

- (ARSession)session
{
  return (ARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  return self->_mapViewDelegate;
}

- (void)setMapViewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewDelegate, a3);
}

- (PedestrianARVKRenderer)vkRenderer
{
  return self->_vkRenderer;
}

- (void)setVkRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_vkRenderer, a3);
}

- (VKMapView)vkMapView
{
  return self->_vkMapView;
}

- (void)setVkMapView:(id)a3
{
  objc_storeStrong((id *)&self->_vkMapView, a3);
}

- (BOOL)gotFirstFrame
{
  return self->_gotFirstFrame;
}

- (void)setGotFirstFrame:(BOOL)a3
{
  self->_gotFirstFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vkMapView, 0);
  objc_storeStrong((id *)&self->_vkRenderer, 0);
  objc_storeStrong((id *)&self->_mapViewDelegate, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end

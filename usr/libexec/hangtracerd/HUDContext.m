@implementation HUDContext

+ (id)displayNameForHangInfo:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSErrorDomain v15;
  NSErrorDomain v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;

  v3 = a3;
  v4 = objc_opt_class(HTHangHUDInfo);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    if (qword_10005FC38 != -1)
      dispatch_once(&qword_10005FC38, &stru_10004D200);
    v5 = (void *)qword_10005FC40;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

    if (v7)
    {
      v8 = v7;
      v9 = (__CFString *)v8;
      goto LABEL_28;
    }
    v11 = objc_alloc((Class)LSApplicationRecord);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
    v35 = 0;
    v13 = objc_msgSend(v11, "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, &v35);
    v14 = v35;

    if (!v14)
    {
      if ((sub_100028370() & 1) != 0)
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](HUDConfiguration, "sharedInstance"));
      else
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v28 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "thirdPartyDevPreferredLanguages"));

      if (objc_msgSend(v29, "count"))
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedNameWithPreferredLocalizations:", v29));
      else
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedName"));
      v31 = (void *)v30;
      v32 = (void *)qword_10005FC40;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
      objc_msgSend(v32, "setObject:forKey:", v31, v33);

      v8 = v31;
      v9 = (__CFString *)v8;
      goto LABEL_27;
    }
    v15 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
    v16 = v15;
    if (v15 == NSOSStatusErrorDomain)
    {
      v18 = objc_msgSend(v14, "code");

      if (v18 == (id)-10814)
      {
        v19 = sub_100024FF4();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
          *(_DWORD *)buf = 138412290;
          v37 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "There is no LS application record for bundle id %@", buf, 0xCu);

        }
        v22 = (void *)qword_10005FC40;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortenedBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
        objc_msgSend(v22, "setObject:forKey:", v23, v24);

        goto LABEL_21;
      }
    }
    else
    {

    }
    v25 = sub_100024FF4();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
      *(_DWORD *)buf = 138412546;
      v37 = v27;
      v38 = 2112;
      v39 = v14;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Unable to create an LS application record from bundle id %@: %@", buf, 0x16u);

    }
LABEL_21:
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortenedBundle"));
    v8 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v10 = sub_100024FF4();
  v8 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "This function should be called for HTHangHUDInfo only.", buf, 2u);
  }
  v9 = &stru_10004F0D8;
LABEL_28:

  return v9;
}

- (HUDContext)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  HUDContext *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  v13[0] = &__kCFBooleanTrue;
  v12[0] = kCAContextDisplayable;
  v12[1] = kCAContextDisplayId;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "displayId")));
  v12[2] = kCAContextIgnoresHitTest;
  v13[1] = v6;
  v13[2] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAContext remoteContextWithOptions:](CAContext, "remoteContextWithOptions:", v7));

  LODWORD(v9) = 1343554297;
  objc_msgSend(v8, "setLevel:", v9);
  objc_msgSend(v8, "setSecure:", 1);
  -[HUDContext setHangHUD_updater_latency_in_ms:](self, "setHangHUD_updater_latency_in_ms:", 0.0);
  -[HUDContext setHUD_background_opacity:](self, "setHUD_background_opacity:", 1.0);
  v10 = -[HUDContext initWithRenderContext:queue:](self, "initWithRenderContext:queue:", v8, v4);

  return v10;
}

- (void)setRenderParametersFromMonitoredStates:(id)a3
{
  unsigned int v4;
  double v5;
  id v6;
  NSObject *v7;

  v4 = objc_msgSend(a3, "isImmersionLevelControllerPresentOnScreen");
  v5 = 0.95;
  if (!v4)
    v5 = 1.0;
  -[HUDContext setHUD_background_opacity:](self, "setHUD_background_opacity:", v5);
  v6 = sub_100026064();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10002E05C(self, v7);

}

- (HUDContext)initWithRenderContext:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  HUDContext *v9;
  id v10;
  UISCurrentUserInterfaceStyleValue *v11;
  UISCurrentUserInterfaceStyleValue *userInterfaceStyleObserver;
  uint64_t v13;
  NSMutableDictionary *hudLines;
  uint64_t v15;
  CALayer *rootLayer;
  void *v17;
  NSDictionary *lastKnownHangs;
  uint64_t v19;
  NSMutableSet *hudContentWithPendingAnimations;
  HTHangHUDInfo *v21;
  HangHUDLine *v22;
  HUDTheme *currentTheme;
  OS_dispatch_queue *queue;
  HangHUDLine *v25;
  HUDContext *v26;
  HTHangHUDInfo *v27;
  HangHUDLine *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  _QWORD v33[4];
  HUDContext *v34;
  HTHangHUDInfo *v35;
  HangHUDLine *v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v7 = a3;
  v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)HUDContext;
  v9 = -[HUDContext init](&v40, "init");
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = objc_alloc((Class)UISCurrentUserInterfaceStyleValue);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000F7AC;
    v37[3] = &unk_10004D228;
    objc_copyWeak(&v38, &location);
    v11 = (UISCurrentUserInterfaceStyleValue *)objc_msgSend(v10, "initWithChangesDeliveredOnQueue:toBlock:", v8, v37);
    userInterfaceStyleObserver = v9->_userInterfaceStyleObserver;
    v9->_userInterfaceStyleObserver = v11;

    -[HUDContext updateCurrentTheme](v9, "updateCurrentTheme");
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    hudLines = v9->_hudLines;
    v9->_hudLines = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v9->_hudRenderContext, a3);
    objc_storeStrong((id *)&v9->_queue, a4);
    v15 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    rootLayer = v9->_rootLayer;
    v9->_rootLayer = (CALayer *)v15;

    -[CALayer setName:](v9->_rootLayer, "setName:", CFSTR("hangtracerd HUD root layer"));
    -[HUDContext createContainerLayer](v9, "createContainerLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext rootLayer](v9, "rootLayer"));
    -[CAContext setLayer:](v9->_hudRenderContext, "setLayer:", v17);

    lastKnownHangs = v9->_lastKnownHangs;
    v9->_lastKnownHangs = (NSDictionary *)&__NSDictionary0__struct;

    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    hudContentWithPendingAnimations = v9->_hudContentWithPendingAnimations;
    v9->_hudContentWithPendingAnimations = (NSMutableSet *)v19;

    v9->_sidePadding = 0.0;
    v9->_lastKnownFirstKeyLayerHeight = 0.0;
    LOBYTE(v32) = 0;
    v21 = -[HTHangHUDInfo initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:]([HTHangHUDInfo alloc], "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:", 0, 0, 0, &stru_10004F0D8, &stru_10004F0D8, CFSTR("com.apple.HangHUD"), 10000.0, v32);
    v22 = [HangHUDLine alloc];
    queue = v9->_queue;
    currentTheme = v9->_currentTheme;
    sub_100027880();
    v25 = -[HangHUDLine initWithQueue:processName:theme:fontSize:lineDelegate:](v22, "initWithQueue:processName:theme:fontSize:lineDelegate:", queue, &stru_10004F0D8, currentTheme, 0);
    -[HangHUDLine update:options:](v25, "update:options:", v21, 0);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000F7D8;
    v33[3] = &unk_10004D250;
    v26 = v9;
    v34 = v26;
    v27 = v21;
    v35 = v27;
    v28 = v25;
    v36 = v28;
    -[HUDContext performHUDUpdate:](v26, "performHUDUpdate:", v33);
    -[HUDContext clearHUDLinesAnimated:](v26, "clearHUDLinesAnimated:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    objc_msgSend(v29, "addObserver:forKeyPath:options:context:", v26, CFSTR("currentOrientation"), 3, 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
    objc_msgSend(v30, "addObserver:forKeyPath:options:context:", v26, CFSTR("bounds"), 3, 0);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)createContainerLayer
{
  CALayer *v3;
  CALayer *containerLayer;
  double v5;

  -[CALayer removeFromSuperlayer](self->_containerLayer, "removeFromSuperlayer");
  v3 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  containerLayer = self->_containerLayer;
  self->_containerLayer = v3;

  -[CALayer setName:](self->_containerLayer, "setName:", CFSTR("hangtracerd HUD container layer"));
  -[CALayer setHidden:](self->_containerLayer, "setHidden:", 1);
  LODWORD(v5) = 1036831949;
  -[CALayer setShadowOpacity:](self->_containerLayer, "setShadowOpacity:", v5);
  -[CALayer setShadowPathIsBounds:](self->_containerLayer, "setShadowPathIsBounds:", 1);
  -[CALayer setAllowsGroupOpacity:](self->_containerLayer, "setAllowsGroupOpacity:", 1);
  -[HUDContext setDisplayScaleDependentPropertiesOnLayers](self, "setDisplayScaleDependentPropertiesOnLayers");
  -[CALayer addSublayer:](self->_rootLayer, "addSublayer:", self->_containerLayer);
  -[HUDContext reloadThemeColors](self, "reloadThemeColors");
}

- (void)invalidate
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudRenderContext](self, "hudRenderContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugDescription"));
    v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Invalidating current HUD Context. Debug description: %@", (uint8_t *)&v9, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
  objc_msgSend(v7, "removeFromSuperlayer");

  -[HUDContext setContainerLayer:](self, "setContainerLayer:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudRenderContext](self, "hudRenderContext"));
  objc_msgSend(v8, "invalidate");

  -[HUDContext setHudRenderContext:](self, "setHudRenderContext:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSObject *queue;
  id *v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD v15[4];
  _QWORD v16[2];

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("currentOrientation")))
  {
    queue = self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000FB38;
    v15[3] = &unk_10004CD00;
    v11 = (id *)v16;
    v16[0] = v9;
    v16[1] = self;
    v12 = v15;
LABEL_5:
    dispatch_async(queue, v12);

    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("bounds")))
  {
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000FD00;
    v13[3] = &unk_10004CD00;
    v11 = (id *)v14;
    v14[0] = v9;
    v14[1] = self;
    v12 = v13;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10002E0E4(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("currentOrientation"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  v7.receiver = self;
  v7.super_class = (Class)HUDContext;
  -[HUDContext dealloc](&v7, "dealloc");
}

- (void)performHUDUpdate:(id)a3
{
  NSObject *queue;
  void (**v4)(_QWORD);

  queue = self->_queue;
  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(queue);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v4[2](v4);

  +[CATransaction commit](CATransaction, "commit");
  +[CATransaction flush](CATransaction, "flush");
}

- (void)performHUDUpdate:(id)a3 withCompletion:(id)a4
{
  NSObject *queue;
  id v6;
  void (**v7)(_QWORD);

  queue = self->_queue;
  v6 = a4;
  v7 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(queue);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction addCommitHandler:forPhase:](CATransaction, "addCommitHandler:forPhase:", v6, 2);

  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v7[2](v7);

  +[CATransaction commit](CATransaction, "commit");
  +[CATransaction flush](CATransaction, "flush");
}

- (void)setDisplayScaleDependentPropertiesOnLayers
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000101D8;
  v2[3] = &unk_10004D278;
  v2[4] = self;
  -[HUDContext performHUDUpdate:](self, "performHUDUpdate:", v2);
}

- (void)clearHUDLinesAnimated:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  _QWORD v18[5];
  _BYTE buf[24];
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22[2];

  v6 = a4;
  v7 = sub_100024FF4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v9, "count");
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[HUDContext clearHUDLinesAnimated:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing %lu HUD lines @ %s", buf, 0x16u);

  }
  -[HUDContext setLastKnownMaxKeyLayerWidth:](self, "setLastKnownMaxKeyLayerWidth:", 0.0);
  +[CATransaction begin](CATransaction, "begin");
  if (v6)
    +[CATransaction addCommitHandler:forPhase:](CATransaction, "addCommitHandler:forPhase:", v6, 2);
  if (a3)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3042000000;
    v20 = sub_1000105E0;
    v21 = sub_1000105EC;
    objc_initWeak(v22, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000105F4;
    v18[3] = &unk_10004CC00;
    v18[4] = buf;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v10, "setRemovedOnCompletion:", 0);
    objc_msgSend(v10, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v10, "setToValue:", &off_1000554D8);
    objc_msgSend(v10, "setDuration:", 0.2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
    objc_msgSend(v11, "addAnimation:forKey:", v10, 0);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(v22);
  }
  else
  {
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &stru_10004D2B8);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
    objc_msgSend(v13, "removeAllObjects");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
    objc_msgSend(v14, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
    LODWORD(v16) = 0;
    objc_msgSend(v15, "setOpacity:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext rootLayer](self, "rootLayer"));
    objc_msgSend(v17, "setHidden:", 1);

  }
  +[CATransaction commit](CATransaction, "commit");
  +[CATransaction flush](CATransaction, "flush");

}

- (void)clearHUDLinesAnimated:(BOOL)a3
{
  -[HUDContext clearHUDLinesAnimated:withCompletion:](self, "clearHUDLinesAnimated:withCompletion:", a3, 0);
}

- (void)updateHangs:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;

  v6 = a3;
  v7 = a4;
  -[HUDContext setLastKnownHangs:](self, "setLastKnownHangs:", v6);
  v8 = sub_100024FF4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating HUD with %lu hangs", buf, 0xCu);
  }

  v10 = sub_10002801C(v6, 5u);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v11, "count");
  if (objc_msgSend(v6, "count") && v12)
  {
    v13 = mach_absolute_time();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010970;
    v18[3] = &unk_10004D328;
    v18[4] = self;
    v19 = v6;
    v20 = v11;
    v21 = v12;
    v22 = v13;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100010D60;
    v16[3] = &unk_10004D350;
    v17 = v7;
    -[HUDContext performHUDUpdate:withCompletion:](self, "performHUDUpdate:withCompletion:", v18, v16);

  }
  else
  {
    v14 = sub_100024FF4();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Passed 0 hangs, removing the HUD from screen", buf, 2u);
    }

    -[HUDContext clearHUDLinesAnimated:](self, "clearHUDLinesAnimated:", 1);
  }

}

- (void)updateHUD:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = sub_100028128(v8, 5u);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "count");
  if (objc_msgSend(v8, "count") && v11)
  {
    v12 = mach_absolute_time();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010F10;
    v18[3] = &unk_10004D328;
    v18[4] = self;
    v19 = v8;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000113A0;
    v16[3] = &unk_10004D350;
    v17 = v7;
    -[HUDContext performHUDUpdate:withCompletion:](self, "performHUDUpdate:withCompletion:", v18, v16);

  }
  else
  {
    v13 = sub_100024FF4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Passed 0 HUD content, removing the HUD from screen", buf, 2u);
    }

    -[HUDContext clearHUDLinesAnimated:withCompletion:](self, "clearHUDLinesAnimated:withCompletion:", 1, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[HangDataStreamStatusTracker sharedInstance](HangDataStreamStatusTracker, "sharedInstance"));
    objc_msgSend(v15, "initializeStatus");

  }
}

- (void)determineNewFrameForRootLayer:(CGSize)a3 numberOfLines:(unint64_t)a4
{
  double height;
  double width;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v13;
  double y;
  double v15;
  double v16;
  void *v17;
  void *v18;
  CGAffineTransform *v19;
  double v20;
  __int128 v21;
  void *v22;
  void *v23;
  CATransform3D v24;
  CATransform3D v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  _OWORD v32[3];

  height = a3.height;
  width = a3.width;
  x = sub_1000278C4();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentOrientation"));

  v10 = (void *)kCADisplayOrientationRotation0;
  v11 = (void *)kCADisplayOrientationRotation180;
  if (v9 != (void *)kCADisplayOrientationRotation0 && v9 != (void *)kCADisplayOrientationRotation180)
  {
    v15 = height + sub_100027B74();
    v16 = width + self->_sidePadding * 2.0;
    y = (sub_100027C40() - v16) * 0.5;
    if (v9 == (void *)kCADisplayOrientationRotation270)
    {
      x = sub_100027728() - v15 - x;
      CGAffineTransformMakeRotation(&v29, 1.57079633);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      v18 = v17;
      v28 = v29;
      v19 = &v28;
    }
    else
    {
      CGAffineTransformMakeRotation(&v27, -1.57079633);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      v18 = v17;
      v26 = v27;
      v19 = &v26;
    }
    objc_msgSend(v17, "setAffineTransform:", v19);
    goto LABEL_16;
  }
  v15 = width + self->_sidePadding * 2.0;
  v16 = height + sub_100027B74();
  v13 = sub_100027728();
  if (v9 == v10)
  {
    v20 = (v13 - v15) * 0.5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
    v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v32[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v32[1] = v21;
    v32[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v18, "setAffineTransform:", v32);
    y = x;
LABEL_15:
    x = v20;
LABEL_16:

    goto LABEL_17;
  }
  if (v9 == v11)
  {
    v20 = (v13 - v15) * 0.5;
    y = sub_100027C40() - x - v16;
    CGAffineTransformMakeRotation(&v31, 3.14159265);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
    v30 = v31;
    objc_msgSend(v18, "setAffineTransform:", &v30);
    goto LABEL_15;
  }
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
LABEL_17:
  CATransform3DMakeTranslation(&v25, x, y, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext rootLayer](self, "rootLayer"));
  v24 = v25;
  objc_msgSend(v22, "setSublayerTransform:", &v24);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v15, v16);

}

- (void)updateHUDLineWithId:(id)a3 content:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  HangHUDLine *v14;
  OS_dispatch_queue *queue;
  HUDTheme *currentTheme;
  ProcExitHUDLine *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

  if (!v11)
  {
    v12 = objc_opt_class(HTHangHUDInfo);
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[HUDContext displayNameForHangInfo:](HUDContext, "displayNameForHangInfo:", v9));
      v14 = [HangHUDLine alloc];
      queue = self->_queue;
      currentTheme = self->_currentTheme;
      sub_100027880();
      v17 = -[HangHUDLine initWithQueue:processName:theme:fontSize:lineDelegate:](v14, "initWithQueue:processName:theme:fontSize:lineDelegate:", queue, v13, currentTheme, self);
      v18 = sub_100026064();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138412802;
        v28 = v13;
        v29 = 2048;
        v30 = objc_msgSend(v9, "hangStartTime");
        v31 = 2112;
        v32 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "A new HUD line is created for %@ with HANG start timestamp of %llu in mach absolute time. contentId:%@", (uint8_t *)&v27, 0x20u);
      }
    }
    else
    {
      v20 = objc_opt_class(HTProcessLaunchExitRecord);
      if ((objc_opt_isKindOfClass(v9, v20) & 1) == 0)
        goto LABEL_10;
      v13 = v9;
      v17 = -[ProcExitHUDLine initWithProcExitRecord:theme:lineDelegate:]([ProcExitHUDLine alloc], "initWithProcExitRecord:theme:lineDelegate:", v13, self->_currentTheme, self);
      v21 = sub_100026064();
      v19 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "processName"));
        v27 = 138412546;
        v28 = v22;
        v29 = 2048;
        v30 = objc_msgSend(v13, "exitTimestamp");
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "A new HUD line is created for %@ with EXIT timestamp of %llu in mach absolute time.", (uint8_t *)&v27, 0x16u);

      }
    }

    if (v17)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, v8);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext containerLayer](self, "containerLayer"));
      objc_msgSend(v24, "addSublayer:", v17);

    }
  }
LABEL_10:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v8));
  objc_msgSend(v26, "update:options:", v9, a5);

}

- (CGSize)layoutHUDLines:(unint64_t)a3 ids:(id)a4
{
  void *v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double sidePadding;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[6];
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  CGSize result;

  v7 = a4;
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  -[HUDContext lastKnownMaxKeyLayerWidth](self, "lastKnownMaxKeyLayerWidth");
  v38 = v8;
  v31 = 0;
  v32 = (double *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[HUDContext minimumValueLayerWidth](self, "minimumValueLayerWidth");
  v34 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100011BE8;
  v30[3] = &unk_10004D378;
  v30[4] = &v35;
  v30[5] = &v31;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v30);

  -[HUDContext setLastKnownMaxKeyLayerWidth:](self, "setLastKnownMaxKeyLayerWidth:", v36[3]);
  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v4));
  }
  else
  {
    v11 = 0;
  }
  -[HUDContext updateCornerRadiusAndSidePaddingIfNecessary:](self, "updateCornerRadiusAndSidePaddingIfNecessary:", v11);
  if (a3)
  {

  }
  v12 = v36[3];
  v13 = sub_100027D34();
  v14 = v32[3];
  sub_100027CE4();
  v16 = v15;
  sidePadding = self->_sidePadding;
  v18 = sub_100027B74();
  v19 = fmin(v12 + v13 + v14, v16 + sidePadding * -2.0);
  if (a3)
  {
    v20 = 0;
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v20));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));

      objc_msgSend(v23, "setPreferredKeyLayerWidth:", v36[3]);
      objc_msgSend(v23, "setPreferredValueLayerWidth:", v32[3]);
      v24 = self->_sidePadding;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "keyLayer"));
      objc_msgSend(v25, "preferredFrameSize");
      objc_msgSend(v23, "setFrame:", v24, v18, v19, v26);

      objc_msgSend(v23, "frame");
      if (v20 >= a3 - 1)
        v18 = v18 + v27;
      else
        v18 = v18 + v27 + 5.0;

      ++v20;
    }
    while (a3 != v20);
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  v28 = v19;
  v29 = v18;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)updateCornerRadiusAndSidePaddingIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double lastKnownFirstKeyLayerHeight;
  double v9;
  id v10;
  NSObject *v11;
  int v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;

  v4 = a3;
  v5 = v4;
  if (self->_sidePadding == 0.0)
  {
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyLayer"));
      objc_msgSend(v6, "preferredFrameSize");
      lastKnownFirstKeyLayerHeight = v7;

      self->_lastKnownFirstKeyLayerHeight = lastKnownFirstKeyLayerHeight;
    }
    else
    {
      lastKnownFirstKeyLayerHeight = self->_lastKnownFirstKeyLayerHeight;
    }
    v9 = sub_100027B74();
    -[CALayer setCornerRadius:](self->_containerLayer, "setCornerRadius:", v9 + lastKnownFirstKeyLayerHeight * 0.5);
    self->_sidePadding = v9 + lastKnownFirstKeyLayerHeight * 0.5;
    v10 = sub_100024FF4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218496;
      v13 = v9 + lastKnownFirstKeyLayerHeight * 0.5;
      v14 = 2048;
      v15 = v9;
      v16 = 2048;
      v17 = lastKnownFirstKeyLayerHeight;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HangTracer HUD changed corner radius to %lf for padding %lf & line height %lf", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (void)updateCurrentTheme
{
  id v3;
  HUDTheme *v4;
  HUDTheme *currentTheme;

  v3 = sub_10000EE20((uint64_t)-[UISCurrentUserInterfaceStyleValue userInterfaceStyle](self->_userInterfaceStyleObserver, "userInterfaceStyle"));
  v4 = (HUDTheme *)objc_claimAutoreleasedReturnValue(v3);
  currentTheme = self->_currentTheme;
  self->_currentTheme = v4;

}

- (void)reloadThemeColors
{
  -[HUDContext updateCurrentTheme](self, "updateCurrentTheme");
  -[HUDContext applyThemeColors](self, "applyThemeColors");
}

- (void)applyThemeColors
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100011ED8;
  v2[3] = &unk_10004D278;
  v2[4] = self;
  -[HUDContext performHUDUpdate:](self, "performHUDUpdate:", v2);
}

- (BOOL)isValid
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudRenderContext](self, "hudRenderContext"));
  v3 = objc_msgSend(v2, "valid");

  return v3;
}

- (id)getKeyForLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudLines](self, "hudLines"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeysForObject:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (!v7)
  {
    v8 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = 0;
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "A key %@ was not found for line %@, this should not happen!", (uint8_t *)&v11, 0x16u);
    }

  }
  return v7;
}

- (BOOL)hangHasPendingAnimation:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HUDContext hudContentWithPendingAnimations](self, "hudContentWithPendingAnimations"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)animationDidStopOnLine:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012240;
  v7[3] = &unk_10004CD00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)animationDidStartOnLine:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012344;
  v7[3] = &unk_10004CD00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)clearBundleNameCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HUDContext bundleIdToAppNameCache](self, "bundleIdToAppNameCache"));
  objc_msgSend(v2, "removeAllObjects");

}

- (HUDTheme)currentTheme
{
  return self->_currentTheme;
}

- (void)setCurrentTheme:(id)a3
{
  objc_storeStrong((id *)&self->_currentTheme, a3);
}

- (CAContext)hudRenderContext
{
  return self->_hudRenderContext;
}

- (void)setHudRenderContext:(id)a3
{
  objc_storeStrong((id *)&self->_hudRenderContext, a3);
}

- (UISCurrentUserInterfaceStyleValue)userInterfaceStyleObserver
{
  return self->_userInterfaceStyleObserver;
}

- (void)setUserInterfaceStyleObserver:(id)a3
{
  objc_storeStrong((id *)&self->_userInterfaceStyleObserver, a3);
}

- (NSMutableDictionary)hudLines
{
  return self->_hudLines;
}

- (void)setHudLines:(id)a3
{
  objc_storeStrong((id *)&self->_hudLines, a3);
}

- (NSCache)bundleIdToAppNameCache
{
  return self->_bundleIdToAppNameCache;
}

- (void)setBundleIdToAppNameCache:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdToAppNameCache, a3);
}

- (double)sidePadding
{
  return self->_sidePadding;
}

- (void)setSidePadding:(double)a3
{
  self->_sidePadding = a3;
}

- (double)minimumValueLayerWidth
{
  return self->_minimumValueLayerWidth;
}

- (void)setMinimumValueLayerWidth:(double)a3
{
  self->_minimumValueLayerWidth = a3;
}

- (double)lastKnownMaxKeyLayerWidth
{
  return self->_lastKnownMaxKeyLayerWidth;
}

- (void)setLastKnownMaxKeyLayerWidth:(double)a3
{
  self->_lastKnownMaxKeyLayerWidth = a3;
}

- (double)lastKnownFirstKeyLayerHeight
{
  return self->_lastKnownFirstKeyLayerHeight;
}

- (void)setLastKnownFirstKeyLayerHeight:(double)a3
{
  self->_lastKnownFirstKeyLayerHeight = a3;
}

- (NSDictionary)lastKnownHangs
{
  return self->_lastKnownHangs;
}

- (void)setLastKnownHangs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_containerLayer, a3);
}

- (NSMutableSet)hudContentWithPendingAnimations
{
  return self->_hudContentWithPendingAnimations;
}

- (void)setHudContentWithPendingAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_hudContentWithPendingAnimations, a3);
}

- (double)HangHUD_updater_latency_in_ms
{
  return self->_HangHUD_updater_latency_in_ms;
}

- (void)setHangHUD_updater_latency_in_ms:(double)a3
{
  self->_HangHUD_updater_latency_in_ms = a3;
}

- (double)HUD_background_opacity
{
  return self->_HUD_background_opacity;
}

- (void)setHUD_background_opacity:(double)a3
{
  self->_HUD_background_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hudContentWithPendingAnimations, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_lastKnownHangs, 0);
  objc_storeStrong((id *)&self->_bundleIdToAppNameCache, 0);
  objc_storeStrong((id *)&self->_hudLines, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleObserver, 0);
  objc_storeStrong((id *)&self->_hudRenderContext, 0);
  objc_storeStrong((id *)&self->_currentTheme, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

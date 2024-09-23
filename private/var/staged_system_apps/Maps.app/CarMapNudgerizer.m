@implementation CarMapNudgerizer

- (CarMapNudgerizer)init
{
  CarMapNudgerizer *v2;
  CarMapNudgerizer *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarMapNudgerizer;
  v2 = -[CarMapNudgerizer init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    -[CarMapNudgerizer _userDefaultsCGFloatForKey:defaultValue:](v2, "_userDefaultsCGFloatForKey:defaultValue:", CFSTR("CarMapNudgerizerMagnitudeHold"), 0.25);
    v5 = v4;
    -[CarMapNudgerizer _userDefaultsCGFloatForKey:defaultValue:](v3, "_userDefaultsCGFloatForKey:defaultValue:", CFSTR("CarMapNudgerizerMagnitudeImpulse"), 0.300000012);
    v7 = v6;
    -[CarMapNudgerizer _userDefaultsCGFloatForKey:defaultValue:](v3, "_userDefaultsCGFloatForKey:defaultValue:", CFSTR("CarMapNudgerizerMagnitudeImpulseAcceleration"), 0.100000001);
    v9 = v8;
    -[CarMapNudgerizer _userDefaultsCGFloatForKey:defaultValue:](v3, "_userDefaultsCGFloatForKey:defaultValue:", CFSTR("CarMapNudgerizerMagnitudeImpulseMax"), 0.699999988);
    v11 = v10;
    -[CarMapNudgerizer _userDefaultsDoubleForKey:defaultValue:](v3, "_userDefaultsDoubleForKey:defaultValue:", CFSTR("CarMapNudgerizerImpulseAccelerationTimeout"), 5.0);
    v3->_panningMetrics.holdTime = 0.25;
    v3->_panningMetrics.holdMagnitude = v5;
    v3->_panningMetrics.impulseMagnitude = v7;
    v3->_panningMetrics.impulseMagnitudeAccelerationFactor = v9;
    v3->_panningMetrics.impulseMagnitudeMax = v11;
    v3->_panningMetrics.impulseAccelerationTimeout = v12;
    v3->_panningMetrics.stopTimer = 0.5;
  }
  return v3;
}

- (void)_configureAnimator
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIDynamicBehavior *v12;
  UIDynamicBehavior *panBehavior;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  UIPushBehavior *v19;
  UIPushBehavior *leftPush;
  id v21;
  void *v22;
  UIPushBehavior *v23;
  UIPushBehavior *rightPush;
  id v25;
  void *v26;
  UIPushBehavior *v27;
  UIPushBehavior *upPush;
  id v29;
  void *v30;
  UIPushBehavior *v31;
  UIPushBehavior *downPush;
  id v33;
  id v34;
  UIDynamicAnimator *v35;
  UIDynamicAnimator *animator;
  UIDynamicBehavior *v37;
  CarImpulsePanningDynamicItem *v38;
  id *location;
  _QWORD v40[4];
  id v41;
  id from;
  CarImpulsePanningDynamicItem *v43;
  CarImpulsePanningDynamicItem *v44;
  CarImpulsePanningDynamicItem *v45;
  CarImpulsePanningDynamicItem *v46;
  CarImpulsePanningDynamicItem *item;

  location = (id *)&self->_mapView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_msgSend(WeakRetained, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v38 = -[CarImpulsePanningDynamicItem initWithBounds:]([CarImpulsePanningDynamicItem alloc], "initWithBounds:", v5, v7, v9, v11);
  objc_storeStrong((id *)&self->_item, v38);
  -[CarImpulsePanningDynamicItem setCenter:](self->_item, "setCenter:", CGPointZero.x, CGPointZero.y);
  v12 = (UIDynamicBehavior *)objc_alloc_init((Class)UIDynamicBehavior);
  panBehavior = self->_panBehavior;
  self->_panBehavior = v12;

  v14 = objc_alloc((Class)UIDynamicItemBehavior);
  item = self->_item;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &item, 1));
  v16 = objc_msgSend(v14, "initWithItems:", v15);

  objc_msgSend(v16, "setResistance:", 5.0);
  -[UIDynamicBehavior addChildBehavior:](self->_panBehavior, "addChildBehavior:", v16);
  v17 = objc_alloc((Class)UIPushBehavior);
  v46 = self->_item;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  v19 = (UIPushBehavior *)objc_msgSend(v17, "initWithItems:mode:", v18, 0);
  leftPush = self->_leftPush;
  self->_leftPush = v19;

  -[UIPushBehavior setAngle:](self->_leftPush, "setAngle:", 0.0);
  v21 = objc_alloc((Class)UIPushBehavior);
  v45 = self->_item;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v23 = (UIPushBehavior *)objc_msgSend(v21, "initWithItems:mode:", v22, 0);
  rightPush = self->_rightPush;
  self->_rightPush = v23;

  -[UIPushBehavior setAngle:](self->_rightPush, "setAngle:", 3.14159265);
  v25 = objc_alloc((Class)UIPushBehavior);
  v44 = self->_item;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v27 = (UIPushBehavior *)objc_msgSend(v25, "initWithItems:mode:", v26, 0);
  upPush = self->_upPush;
  self->_upPush = v27;

  -[UIPushBehavior setAngle:](self->_upPush, "setAngle:", 1.57079633);
  v29 = objc_alloc((Class)UIPushBehavior);
  v43 = self->_item;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
  v31 = (UIPushBehavior *)objc_msgSend(v29, "initWithItems:mode:", v30, 0);
  downPush = self->_downPush;
  self->_downPush = v31;

  -[UIPushBehavior setAngle:](self->_downPush, "setAngle:", 4.71238898);
  -[UIDynamicBehavior addChildBehavior:](self->_panBehavior, "addChildBehavior:", self->_leftPush);
  -[UIDynamicBehavior addChildBehavior:](self->_panBehavior, "addChildBehavior:", self->_rightPush);
  -[UIDynamicBehavior addChildBehavior:](self->_panBehavior, "addChildBehavior:", self->_downPush);
  -[UIDynamicBehavior addChildBehavior:](self->_panBehavior, "addChildBehavior:", self->_upPush);
  v33 = objc_alloc((Class)UIDynamicAnimator);
  v34 = objc_loadWeakRetained(location);
  v35 = (UIDynamicAnimator *)objc_msgSend(v33, "initWithReferenceView:", v34);
  animator = self->_animator;
  self->_animator = v35;

  -[UIDynamicAnimator addBehavior:](self->_animator, "addBehavior:", self->_panBehavior);
  -[UIDynamicAnimator setDelegate:](self->_animator, "setDelegate:", self);
  objc_initWeak(&from, self);
  v37 = self->_panBehavior;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10062FCBC;
  v40[3] = &unk_1011AD260;
  objc_copyWeak(&v41, &from);
  -[UIDynamicBehavior setAction:](v37, "setAction:", v40);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&from);

}

- (void)dynamicAnimatorDidPause:(id)a3
{
  -[CarMapNudgerizer _endAnimatingIfNeeded](self, "_endAnimatingIfNeeded", a3);
}

- (void)_beginAnimatingIfNeeded
{
  id WeakRetained;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat MidX;
  CGFloat MidY;
  id v14;
  CGRect v15;
  CGRect v16;

  if (!self->_animating)
  {
    -[CarMapNudgerizer _configureAnimator](self, "_configureAnimator");
    -[CarImpulsePanningDynamicItem setCenter:](self->_item, "setCenter:", CGPointZero.x, CGPointZero.y);
    self->_animating = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    MidX = CGRectGetMidX(v15);
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    MidY = CGRectGetMidY(v16);
    self->_initialPanPoint.x = MidX;
    self->_initialPanPoint.y = MidY;
    v14 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v14, "_startPanningAtPoint:", self->_initialPanPoint.x, self->_initialPanPoint.y);

  }
}

- (void)_endAnimating
{
  UIDynamicAnimator *animator;
  CarImpulsePanningDynamicItem *item;
  id WeakRetained;

  -[UIDynamicAnimator removeAllBehaviors](self->_animator, "removeAllBehaviors");
  animator = self->_animator;
  self->_animator = 0;

  item = self->_item;
  self->_item = 0;

  if (self->_animating)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_stopPanningAtPoint:", self->_initialPanPoint.x, self->_initialPanPoint.y);

  }
  self->_animating = 0;
}

- (void)_endAnimatingIfNeeded
{
  if (self->_animating && !-[UIDynamicAnimator isRunning](self->_animator, "isRunning"))
    -[CarMapNudgerizer _endAnimating](self, "_endAnimating");
}

- (void)_beginImpulseUp
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseUp", 0);
  -[CarMapNudgerizer holdMagnitudeForDirection:](self, "holdMagnitudeForDirection:", 1);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 1);
}

- (void)_endImpulseUp
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapNudgerizer _behaviorForDirection:](self, "_behaviorForDirection:", 1));
  objc_msgSend(v3, "setMagnitude:", 0.0);

  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 0, 1);
}

- (void)_momentaryImpulseUp
{
  double v3;

  -[CarMapNudgerizer impulseMagnitudeForDirection:](self, "impulseMagnitudeForDirection:", 1);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 1);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseUp", 0);
  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 1, 1);
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[CarMapNudgerizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_endImpulseUp", 0, v3);
}

- (void)_beginImpulseDown
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseDown", 0);
  -[CarMapNudgerizer holdMagnitudeForDirection:](self, "holdMagnitudeForDirection:", 2);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 2);
}

- (void)_endImpulseDown
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapNudgerizer _behaviorForDirection:](self, "_behaviorForDirection:", 2));
  objc_msgSend(v3, "setMagnitude:", 0.0);

  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 0, 2);
}

- (void)_momentaryImpulseDown
{
  double v3;

  -[CarMapNudgerizer impulseMagnitudeForDirection:](self, "impulseMagnitudeForDirection:", 2);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 2);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseDown", 0);
  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 1, 2);
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[CarMapNudgerizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_endImpulseDown", 0, v3);
}

- (void)_beginImpulseLeft
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseLeft", 0);
  -[CarMapNudgerizer holdMagnitudeForDirection:](self, "holdMagnitudeForDirection:", 3);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 3);
}

- (void)_endImpulseLeft
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapNudgerizer _behaviorForDirection:](self, "_behaviorForDirection:", 3));
  objc_msgSend(v3, "setMagnitude:", 0.0);

  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 0, 3);
}

- (void)_momentaryImpulseLeft
{
  double v3;

  -[CarMapNudgerizer impulseMagnitudeForDirection:](self, "impulseMagnitudeForDirection:", 3);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 3);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseLeft", 0);
  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 1, 3);
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[CarMapNudgerizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_endImpulseLeft", 0, v3);
}

- (void)_beginImpulseRight
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseRight", 0);
  -[CarMapNudgerizer holdMagnitudeForDirection:](self, "holdMagnitudeForDirection:", 4);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 4);
}

- (void)_endImpulseRight
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapNudgerizer _behaviorForDirection:](self, "_behaviorForDirection:", 4));
  objc_msgSend(v3, "setMagnitude:", 0.0);

  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 0, 4);
}

- (void)_momentaryImpulseRight
{
  double v3;

  -[CarMapNudgerizer impulseMagnitudeForDirection:](self, "impulseMagnitudeForDirection:", 4);
  -[CarMapNudgerizer _beginImpulseInDirection:withMagnitude:](self, "_beginImpulseInDirection:withMagnitude:", 4);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_endImpulseRight", 0);
  -[CarMapNudgerizer _setHasBegunMomentaryImpulse:inDirection:](self, "_setHasBegunMomentaryImpulse:inDirection:", 1, 4);
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[CarMapNudgerizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_endImpulseRight", 0, v3);
}

- (double)holdMagnitudeForDirection:(int64_t)a3
{
  CarMapNudgerizer *v3;
  id WeakRetained;
  double Height;
  id v6;
  double v7;
  double v9;
  CGRect v10;
  CGRect v11;

  v3 = self;
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics", a3);
  v3 = (CarMapNudgerizer *)((char *)v3 + 168);
  WeakRetained = objc_loadWeakRetained((id *)&v3->super.isa);
  objc_msgSend(WeakRetained, "bounds");
  Height = CGRectGetHeight(v10);
  v6 = objc_loadWeakRetained((id *)&v3->super.isa);
  objc_msgSend(v6, "bounds");
  v7 = v9 * fmax(Height, CGRectGetWidth(v11));

  return v7;
}

- (double)impulseMagnitudeForDirection:(int64_t)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  id WeakRetained;
  uint64_t v12;
  double Width;
  double v17;
  double v19;
  double v20;
  double v21;
  double v22;

  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  v5 = v22;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapNudgerizer lastImpulseDate](self, "lastImpulseDate"));
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", v21));
  v9 = objc_msgSend(v8, "compare:", v6);

  if (-[CarMapNudgerizer lastImpulseDirection](self, "lastImpulseDirection") == a3 && v9 == (id)1)
  {
    v10 = (double)-[CarMapNudgerizer impulseCount](self, "impulseCount");
    -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
    -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
    v5 = fmin(v22 + v10 * v20, v19);
  }
  else
  {
    -[CarMapNudgerizer setLastImpulseDirection:](self, "setLastImpulseDirection:", a3);
    -[CarMapNudgerizer setImpulseCount:](self, "setImpulseCount:", 0);
  }
  -[CarMapNudgerizer setLastImpulseDate:](self, "setLastImpulseDate:", v6);
  -[CarMapNudgerizer setImpulseCount:](self, "setImpulseCount:", (char *)-[CarMapNudgerizer impulseCount](self, "impulseCount") + 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_msgSend(WeakRetained, "bounds");
  if ((unint64_t)(a3 - 1) > 1)
    Width = CGRectGetWidth(*(CGRect *)&v12);
  else
    Width = CGRectGetHeight(*(CGRect *)&v12);
  v17 = Width;

  return v5 * v17;
}

- (void)_beginImpulseInDirection:(int64_t)a3 withMagnitude:(double)a4
{
  MKMapView **p_mapView;
  id WeakRetained;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  NSString *v35;
  void *v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  void *v40;
  CGRect v41;

  p_mapView = &self->_mapView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  if (!WeakRetained)
    goto LABEL_11;
  v9 = WeakRetained;
  v10 = objc_loadWeakRetained((id *)p_mapView);
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  height = CGSizeZero.height;

  if (v12 == CGSizeZero.width && v14 == height)
  {
LABEL_11:
    v24 = sub_10043364C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
LABEL_21:

      return;
    }
    v26 = objc_loadWeakRetained((id *)p_mapView);
    v27 = v26;
    if (!v26)
    {
      v33 = CFSTR("<nil>");
      goto LABEL_20;
    }
    v28 = (objc_class *)objc_opt_class(v26);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        goto LABEL_18;
      }

    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_18:

LABEL_20:
    v34 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v34, "bounds");
    v35 = NSStringFromCGRect(v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    *(_DWORD *)buf = 138412546;
    v38 = v33;
    v39 = 2112;
    v40 = v36;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Cannot begin map panning impulse with mapView:%@ bounds:%@", buf, 0x16u);

    goto LABEL_21;
  }
  v17 = objc_loadWeakRetained((id *)p_mapView);
  v18 = objc_msgSend(v17, "userTrackingMode");

  if (v18)
  {
    v19 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v19, "_setUserTrackingMode:animated:fromTrackingButton:", 0, 0, 0);

  }
  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = objc_opt_respondsToSelector(v20, "nudgerizer:didGestureMapView:inDirection:");

  if ((v21 & 1) != 0)
  {
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v22, "nudgerizer:didGestureMapView:inDirection:", self, v23, a3);

  }
  -[CarMapNudgerizer _setImpulseInDirection:magnitude:](self, "_setImpulseInDirection:magnitude:", a3, a4);
}

- (id)_behaviorForDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return *(id *)((char *)&self->super.isa + qword_100E39AC0[a3 - 1]);
}

- (void)_setImpulseInDirection:(int64_t)a3 magnitude:(double)a4
{
  id v7;

  -[CarMapNudgerizer _beginAnimatingIfNeeded](self, "_beginAnimatingIfNeeded");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarMapNudgerizer _behaviorForDirection:](self, "_behaviorForDirection:", a3));
  objc_msgSend(v7, "setMagnitude:", a4);

}

- (BOOL)_hasBegunMomentaryImpulseInDirection:(int64_t)a3
{
  return *((_BYTE *)&self->super.isa + a3 + 7);
}

- (void)_setHasBegunMomentaryImpulse:(BOOL)a3 inDirection:(int64_t)a4
{
  *((_BYTE *)&self->super.isa + a4 + 7) = a3;
}

- (void)beginImpulseInDirection:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      -[CarMapNudgerizer _beginImpulseUp](self, "_beginImpulseUp");
      break;
    case 2:
      -[CarMapNudgerizer _beginImpulseDown](self, "_beginImpulseDown");
      break;
    case 3:
      -[CarMapNudgerizer _beginImpulseLeft](self, "_beginImpulseLeft");
      break;
    case 4:
      -[CarMapNudgerizer _beginImpulseRight](self, "_beginImpulseRight");
      break;
    default:
      return;
  }
}

- (void)endImpluseInDirection:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      -[CarMapNudgerizer _endImpulseUp](self, "_endImpulseUp");
      break;
    case 2:
      -[CarMapNudgerizer _endImpulseDown](self, "_endImpulseDown");
      break;
    case 3:
      -[CarMapNudgerizer _endImpulseLeft](self, "_endImpulseLeft");
      break;
    case 4:
      -[CarMapNudgerizer _endImpulseRight](self, "_endImpulseRight");
      break;
    default:
      return;
  }
}

- (void)momentaryImpulseInDirection:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      -[CarMapNudgerizer _momentaryImpulseUp](self, "_momentaryImpulseUp");
      break;
    case 2:
      -[CarMapNudgerizer _momentaryImpulseDown](self, "_momentaryImpulseDown");
      break;
    case 3:
      -[CarMapNudgerizer _momentaryImpulseLeft](self, "_momentaryImpulseLeft");
      break;
    case 4:
      -[CarMapNudgerizer _momentaryImpulseRight](self, "_momentaryImpulseRight");
      break;
    default:
      return;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[CarMapNudgerizer _addPanRecognizers](self, "_addPanRecognizers");
    else
      -[CarMapNudgerizer _removePanRecognizers](self, "_removePanRecognizers");
  }
}

- (void)_addPanRecognizers
{
  void *v3;
  void *v4;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *leftLongPressRecognizer;
  UILongPressGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *leftTapRecognizer;
  UILongPressGestureRecognizer *v10;
  UILongPressGestureRecognizer *rightLongPressRecognizer;
  UILongPressGestureRecognizer *v12;
  UITapGestureRecognizer *v13;
  UITapGestureRecognizer *rightTapRecognizer;
  UILongPressGestureRecognizer *v15;
  UILongPressGestureRecognizer *upLongPressRecognizer;
  UILongPressGestureRecognizer *v17;
  UITapGestureRecognizer *v18;
  UITapGestureRecognizer *upTapRecognizer;
  UILongPressGestureRecognizer *v20;
  UILongPressGestureRecognizer *downLongPressRecognizer;
  UILongPressGestureRecognizer *v22;
  UITapGestureRecognizer *v23;
  UITapGestureRecognizer *downTapRecognizer;
  id WeakRetained;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  objc_storeWeak((id *)&self->_gestureRecognizerView, v4);

  v5 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleLongPress:");
  leftLongPressRecognizer = self->_leftLongPressRecognizer;
  self->_leftLongPressRecognizer = v5;

  -[UILongPressGestureRecognizer setAllowedPressTypes:](self->_leftLongPressRecognizer, "setAllowedPressTypes:", &off_101273950);
  v7 = self->_leftLongPressRecognizer;
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v7, "setMinimumPressDuration:", v36);
  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
  leftTapRecognizer = self->_leftTapRecognizer;
  self->_leftTapRecognizer = v8;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_leftTapRecognizer, "setAllowedPressTypes:", &off_101273968);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_leftTapRecognizer, "requireGestureRecognizerToFail:", self->_leftLongPressRecognizer);
  v10 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleLongPress:");
  rightLongPressRecognizer = self->_rightLongPressRecognizer;
  self->_rightLongPressRecognizer = v10;

  -[UILongPressGestureRecognizer setAllowedPressTypes:](self->_rightLongPressRecognizer, "setAllowedPressTypes:", &off_101273980);
  v12 = self->_rightLongPressRecognizer;
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v12, "setMinimumPressDuration:", v35);
  v13 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
  rightTapRecognizer = self->_rightTapRecognizer;
  self->_rightTapRecognizer = v13;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_rightTapRecognizer, "setAllowedPressTypes:", &off_101273998);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_rightTapRecognizer, "requireGestureRecognizerToFail:", self->_rightLongPressRecognizer);
  v15 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleLongPress:");
  upLongPressRecognizer = self->_upLongPressRecognizer;
  self->_upLongPressRecognizer = v15;

  -[UILongPressGestureRecognizer setAllowedPressTypes:](self->_upLongPressRecognizer, "setAllowedPressTypes:", &off_1012739B0);
  v17 = self->_upLongPressRecognizer;
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v17, "setMinimumPressDuration:", v34);
  v18 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
  upTapRecognizer = self->_upTapRecognizer;
  self->_upTapRecognizer = v18;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_upTapRecognizer, "setAllowedPressTypes:", &off_1012739C8);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_upTapRecognizer, "requireGestureRecognizerToFail:", self->_upLongPressRecognizer);
  v20 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleLongPress:");
  downLongPressRecognizer = self->_downLongPressRecognizer;
  self->_downLongPressRecognizer = v20;

  -[UILongPressGestureRecognizer setAllowedPressTypes:](self->_downLongPressRecognizer, "setAllowedPressTypes:", &off_1012739E0);
  v22 = self->_downLongPressRecognizer;
  -[CarMapNudgerizer panningMetrics](self, "panningMetrics");
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v22, "setMinimumPressDuration:", v33);
  v23 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTap:");
  downTapRecognizer = self->_downTapRecognizer;
  self->_downTapRecognizer = v23;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_downTapRecognizer, "setAllowedPressTypes:", &off_1012739F8);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_downTapRecognizer, "requireGestureRecognizerToFail:", self->_downLongPressRecognizer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(WeakRetained, "addGestureRecognizer:", self->_leftTapRecognizer);

  v26 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(v26, "addGestureRecognizer:", self->_leftLongPressRecognizer);

  v27 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(v27, "addGestureRecognizer:", self->_rightTapRecognizer);

  v28 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(v28, "addGestureRecognizer:", self->_rightLongPressRecognizer);

  v29 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(v29, "addGestureRecognizer:", self->_upTapRecognizer);

  v30 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(v30, "addGestureRecognizer:", self->_upLongPressRecognizer);

  v31 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(v31, "addGestureRecognizer:", self->_downTapRecognizer);

  v32 = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(v32, "addGestureRecognizer:", self->_downLongPressRecognizer);

}

- (void)_removePanRecognizers
{
  UIView **p_gestureRecognizerView;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  UITapGestureRecognizer *leftTapRecognizer;
  UILongPressGestureRecognizer *leftLongPressRecognizer;
  UITapGestureRecognizer *rightTapRecognizer;
  UILongPressGestureRecognizer *rightLongPressRecognizer;
  UITapGestureRecognizer *upTapRecognizer;
  UILongPressGestureRecognizer *upLongPressRecognizer;
  UITapGestureRecognizer *downTapRecognizer;
  UILongPressGestureRecognizer *downLongPressRecognizer;

  p_gestureRecognizerView = &self->_gestureRecognizerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
  objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_leftTapRecognizer);

  v5 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  objc_msgSend(v5, "removeGestureRecognizer:", self->_leftLongPressRecognizer);

  v6 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  objc_msgSend(v6, "removeGestureRecognizer:", self->_rightTapRecognizer);

  v7 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  objc_msgSend(v7, "removeGestureRecognizer:", self->_rightLongPressRecognizer);

  v8 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  objc_msgSend(v8, "removeGestureRecognizer:", self->_upTapRecognizer);

  v9 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  objc_msgSend(v9, "removeGestureRecognizer:", self->_upLongPressRecognizer);

  v10 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  objc_msgSend(v10, "removeGestureRecognizer:", self->_downTapRecognizer);

  v11 = objc_loadWeakRetained((id *)p_gestureRecognizerView);
  objc_msgSend(v11, "removeGestureRecognizer:", self->_downLongPressRecognizer);

  leftTapRecognizer = self->_leftTapRecognizer;
  self->_leftTapRecognizer = 0;

  leftLongPressRecognizer = self->_leftLongPressRecognizer;
  self->_leftLongPressRecognizer = 0;

  rightTapRecognizer = self->_rightTapRecognizer;
  self->_rightTapRecognizer = 0;

  rightLongPressRecognizer = self->_rightLongPressRecognizer;
  self->_rightLongPressRecognizer = 0;

  upTapRecognizer = self->_upTapRecognizer;
  self->_upTapRecognizer = 0;

  upLongPressRecognizer = self->_upLongPressRecognizer;
  self->_upLongPressRecognizer = 0;

  downTapRecognizer = self->_downTapRecognizer;
  self->_downTapRecognizer = 0;

  downLongPressRecognizer = self->_downLongPressRecognizer;
  self->_downLongPressRecognizer = 0;

}

- (void)_clearGesture:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = objc_msgSend(v4, "isEnabled");
  objc_msgSend(v4, "setEnabled:", 0);
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_clearGestureRecognizersInFlight
{
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_leftTapRecognizer);
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_leftLongPressRecognizer);
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_rightTapRecognizer);
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_rightLongPressRecognizer);
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_upTapRecognizer);
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_upLongPressRecognizer);
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_downTapRecognizer);
  -[CarMapNudgerizer _clearGesture:](self, "_clearGesture:", self->_downLongPressRecognizer);
}

- (void)_clearGesturesAndAnimations
{
  -[CarMapNudgerizer _clearGestureRecognizersInFlight](self, "_clearGestureRecognizersInFlight");
  -[CarMapNudgerizer _endImpulseUp](self, "_endImpulseUp");
  -[CarMapNudgerizer _endImpulseDown](self, "_endImpulseDown");
  -[CarMapNudgerizer _endImpulseLeft](self, "_endImpulseLeft");
  -[CarMapNudgerizer _endImpulseRight](self, "_endImpulseRight");
  -[CarMapNudgerizer _endAnimating](self, "_endAnimating");
}

- (int64_t)_eventDirectionForButtonType:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (void)handleTap:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allowedPressTypes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = -[CarMapNudgerizer _eventDirectionForButtonType:](self, "_eventDirectionForButtonType:", objc_msgSend(v5, "integerValue"));

    -[CarMapNudgerizer momentaryImpulseInDirection:](self, "momentaryImpulseInDirection:", v6);
  }

}

- (void)handleLongPress:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allowedPressTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = -[CarMapNudgerizer _eventDirectionForButtonType:](self, "_eventDirectionForButtonType:", objc_msgSend(v5, "integerValue"));

  if (objc_msgSend(v7, "state") == (id)1)
  {
    -[CarMapNudgerizer beginImpulseInDirection:](self, "beginImpulseInDirection:", v6);
  }
  else if (objc_msgSend(v7, "state") == (id)3 || objc_msgSend(v7, "state") == (id)4)
  {
    -[CarMapNudgerizer endImpluseInDirection:](self, "endImpluseInDirection:", v6);
  }

}

- (double)_userDefaultsDoubleForKey:(id)a3 defaultValue:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v8, "doubleForKey:", v5);
    a4 = v9;

  }
  return a4;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (CarMapNudgerizerDelegate)delegate
{
  return (CarMapNudgerizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (CarImpulsePanningDynamicItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- ($29727DC6989B69F22950FCD998EA20D4)panningMetrics
{
  $29727DC6989B69F22950FCD998EA20D4 *result;

  objc_copyStruct(retstr, &self->_panningMetrics, 56, 1, 0);
  return result;
}

- (void)setPanningMetrics:(id *)a3
{
  objc_copyStruct(&self->_panningMetrics, a3, 56, 1, 0);
}

- (int64_t)lastImpulseDirection
{
  return self->_lastImpulseDirection;
}

- (void)setLastImpulseDirection:(int64_t)a3
{
  self->_lastImpulseDirection = a3;
}

- (NSDate)lastImpulseDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastImpulseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (unint64_t)impulseCount
{
  return self->_impulseCount;
}

- (void)setImpulseCount:(unint64_t)a3
{
  self->_impulseCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImpulseDate, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_gestureRecognizerView);
  objc_storeStrong((id *)&self->_downLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_downTapRecognizer, 0);
  objc_storeStrong((id *)&self->_upLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_upTapRecognizer, 0);
  objc_storeStrong((id *)&self->_rightLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_rightTapRecognizer, 0);
  objc_storeStrong((id *)&self->_leftLongPressRecognizer, 0);
  objc_storeStrong((id *)&self->_leftTapRecognizer, 0);
  objc_storeStrong((id *)&self->_downPush, 0);
  objc_storeStrong((id *)&self->_upPush, 0);
  objc_storeStrong((id *)&self->_rightPush, 0);
  objc_storeStrong((id *)&self->_leftPush, 0);
  objc_storeStrong((id *)&self->_panBehavior, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

@end

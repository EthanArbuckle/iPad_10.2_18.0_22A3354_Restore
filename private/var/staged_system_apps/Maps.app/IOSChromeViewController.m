@implementation IOSChromeViewController

- (void)initKeyCommand
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("_"), 0x100000, "zoomOut"));
  -[IOSChromeViewController addKeyCommand:](self, "addKeyCommand:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("="), 0x100000, "zoomIn"));

  -[IOSChromeViewController addKeyCommand:](self, "addKeyCommand:", v4);
}

- (id)keyCommands
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IOSChromeViewController;
  v3 = -[IOSChromeViewController keyCommands](&v17, "keyCommands");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &__NSArray0__struct;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v9 = objc_msgSend(v8, "isFocused");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    if ((objc_opt_respondsToSelector(v10, "fullscreenViewController") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fullscreenViewController"));

    }
    else
    {
      v12 = 0;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyCommands"));
    v14 = v13;
    if (!v13)
      v13 = &__NSArray0__struct;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v7));

    v7 = (id)v15;
  }
  return v7;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v7, "fullscreenViewController") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fullscreenViewController"));

  }
  else
  {
    v9 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "targetForAction:withSender:", a3, v6));
  if (!v10)
  {
    v13.receiver = self;
    v13.super_class = (Class)IOSChromeViewController;
    v11 = -[IOSChromeViewController targetForAction:withSender:](&v13, "targetForAction:withSender:", a3, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOSChromeViewController;
  -[IOSBasedChromeViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  self->_forceStaleMapEffect = objc_msgSend(v3, "BOOLForKey:", CFSTR("__internal_MapsDebugForceChromeStaleMapEffect"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v4, "addObserver:", self);

  -[IOSChromeViewController initKeyCommand](self, "initKeyCommand");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSChromeViewController;
  -[IOSBasedChromeViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_staleMapEffectDimmingOverlayView, "setFrame:");

}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOSChromeViewController;
  v8 = a5;
  -[IOSBasedChromeViewController contextStackWillUpdateFrom:to:withAnimation:](&v10, "contextStackWillUpdateFrom:to:withAnimation:", a3, a4, v8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C5E638;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  objc_msgSend(v8, "addPreparation:", v9);

}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IOSChromeViewController;
  v8 = a5;
  v9 = a4;
  -[IOSBasedChromeViewController contextStackDidUpdateFrom:to:withAnimation:](&v14, "contextStackDidUpdateFrom:to:withAnimation:", a3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100C5E778;
  v12[3] = &unk_1011ACCB8;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  objc_msgSend(v8, "addCompletion:", v12);

}

- (id)allComponents
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSChromeViewController;
  v2 = -[IOSBasedChromeViewController allComponents](&v6, "allComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", CFSTR("StaleMapEffect")));

  return v4;
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == CFSTR("StaleMapEffect"))
  {
    -[IOSChromeViewController _updateStaleMapEffectWithAnimation:](self, "_updateStaleMapEffectWithAnimation:", a5, a4);
  }
  else
  {
    v8 = v5;
    v9 = v6;
    v7.receiver = self;
    v7.super_class = (Class)IOSChromeViewController;
    -[IOSBasedChromeViewController updateComponent:forTiming:withAnimation:](&v7, "updateComponent:forTiming:withAnimation:", a3, a4, a5);
  }
}

- (void)_updateStaleMapEffectWithAnimation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  IOSChromeViewController *v7;
  IOSChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _BYTE buf[24];
  id v19;

  v4 = a3;
  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[IOSChromeViewController _updateStaleMapEffectWithAnimation:]";
    *(_WORD *)&buf[22] = 2114;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %s %{public}@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v19) = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100C5EBD0;
  v17[3] = &unk_1011AD318;
  v17[4] = self;
  v17[5] = buf;
  objc_msgSend(v4, "addPreparation:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100C5F19C;
  v16[3] = &unk_1011AD318;
  v16[4] = self;
  v16[5] = buf;
  objc_msgSend(v4, "addAnimations:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100C5F404;
  v15[3] = &unk_1011E8F28;
  v15[4] = self;
  v15[5] = buf;
  objc_msgSend(v4, "addCompletion:", v15);
  _Block_object_dispose(buf, 8);

}

- (void)didBecomeInactive:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSChromeViewController;
  -[ChromeViewController didBecomeInactive:](&v4, "didBecomeInactive:", a3);
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("StaleMapEffect"), 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IOSChromeViewController;
  v4 = a3;
  -[IOSChromeViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = sub_1002A8A0C(v4, v5);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StaleMapEffectView superview](self->_staleMapEffectView, "superview"));

    if (v7)
      -[IOSChromeViewController _updateStaleMapEffectViewForLuminanceChange](self, "_updateStaleMapEffectViewForLuminanceChange");
  }
  else
  {

  }
}

- (void)_updateStaleMapEffectViewForLuminanceChange
{
  void *v3;
  unsigned int v4;
  double v5;
  double v6;
  _QWORD *v7;
  int64_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  IOSChromeViewController *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  id v22;
  IOSChromeViewController *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  _QWORD block[5];
  id v31;
  char v32;
  _QWORD v33[6];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  _BOOL4 v39;

  if (!self->_staleMapEffectView)
  {
    v11 = sub_10043196C();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_25;
    v12 = self;
    v13 = (objc_class *)objc_opt_class(v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_16;
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_16:

    *(_DWORD *)buf = 138543362;
    v35 = v18;
    v19 = "[%{public}@] No stale map effect";
    v20 = v10;
    v21 = 12;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, buf, v21);

    goto LABEL_25;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "isLuminanceReduced");

  if (v4)
    v5 = 1.0;
  else
    v5 = 0.0;
  -[StaleMapEffectView alpha](self->_staleMapEffectView, "alpha");
  if (vabdd_f64(v5, v6) <= 2.22044605e-16)
  {
    v22 = sub_10043196C();
    v10 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_25;
    v23 = self;
    v24 = (objc_class *)objc_opt_class(v23);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_23;
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_23:

    v29 = v23->_luminanceChromeDeactivationToken != 0;
    *(_DWORD *)buf = 138543874;
    v35 = v18;
    v36 = 2048;
    v37 = v5;
    v38 = 1024;
    v39 = v29;
    v19 = "[%{public}@] Stale map effect alpha already equals: %f, hasDeactivationToken: %d";
    v20 = v10;
    v21 = 28;
    goto LABEL_24;
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100C5FAB0;
  v33[3] = &unk_1011AD518;
  v33[4] = self;
  *(double *)&v33[5] = v5;
  v7 = objc_retainBlock(v33);
  if (v4)
    v8 = 1000000;
  else
    v8 = 0;
  v9 = dispatch_time(0, v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C5FAF8;
  block[3] = &unk_1011B3E48;
  v32 = v4;
  block[4] = self;
  v31 = v7;
  v10 = v7;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

LABEL_25:
}

- (void)_acquireChromeDeactivationTokenForLuminanceIfNeeded
{
  void *v3;
  unsigned int v4;
  id luminanceChromeDeactivationToken;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "isLuminanceReduced");

  luminanceChromeDeactivationToken = self->_luminanceChromeDeactivationToken;
  if (!v4)
  {
    v6 = 0;
LABEL_6:
    self->_luminanceChromeDeactivationToken = v6;

    return;
  }
  if (!luminanceChromeDeactivationToken)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController acquireChromeDeactivationTokenForReason:](self, "acquireChromeDeactivationTokenForReason:", CFSTR("reduced")));
    luminanceChromeDeactivationToken = self->_luminanceChromeDeactivationToken;
    goto LABEL_6;
  }
}

- (void)handleMoveToOrFromSecureLockscreenUI:(BOOL)a3
{
  StaleMapEffectView *staleMapEffectView;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;

  staleMapEffectView = self->_staleMapEffectView;
  if (staleMapEffectView)
    v6 = !a3;
  else
    v6 = 1;
  if (!v6)
  {
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v10 = CFSTR("kBacklightLuminanceInitialSetupDoneKey");
      v11 = &__kCFBooleanTrue;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("BacklightLuminanceDidChangeNotification"), self, v8);

      return;
    }
    staleMapEffectView = self->_staleMapEffectView;
  }
  if ((!staleMapEffectView || !a3) && !+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("BacklightLuminanceDidChangeNotification"), self);

  }
}

- (id)createMapReplacementView
{
  return 0;
}

- (BOOL)isDisplayingNavigation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController pendingContexts](self, "pendingContexts"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v6 = v5;

  v7 = objc_msgSend(v6, "_maps_firstContextOfClass:", objc_opt_class(NavModeController));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = 1;
  }
  else
  {
    v10 = objc_msgSend(v6, "_maps_firstContextOfClass:", objc_opt_class(IOSTransitNavigationContext));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v9 = v11 != 0;

  }
  return v9;
}

- (void)_updateOverlayVisibilityWithCurrentContainerStyle:(unint64_t)a3 progress:(double)a4
{
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned int v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    if (objc_msgSend(v6, "userTrackingMode") == (id)1)
      objc_msgSend(v6, "setUserTrackingMode:", 0);
    v7 = -[IOSBasedChromeViewController _internal_isChromeDisabled](self, "_internal_isChromeDisabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    v9 = objc_msgSend(v8, "isHidden");

    v10 = -[IOSBasedChromeViewController _internal_topContextWantsCompassLayoutControl](self, "_internal_topContextWantsCompassLayoutControl");
    v11 = v9 ^ 1;
    if (a4 > 0.0)
      v11 = 0;
    if ((v10 & 1) != 0)
      v11 = v7 ^ 1;
    if ((v7 & 1) != 0)
      v12 = v7 ^ 1;
    else
      v12 = v11;
    objc_msgSend(v6, "setCompassEnabled:", v12);
    v13 = 1.0;
    v14 = 1.0 - a4;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext"));
    if ((objc_opt_respondsToSelector(v15, "shouldResizingCardDimFloatingControls") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext"));
      v17 = objc_msgSend(v16, "shouldResizingCardDimFloatingControls");

      if (v17)
        v13 = v14;
      else
        v13 = 1.0;
    }
    else
    {

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    objc_msgSend(v22, "setAlpha:", v13);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherOverlay](self, "weatherOverlay"));
    objc_msgSend(v23, "setAlpha:", v14);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundOverlay](self, "lookAroundOverlay"));
    objc_msgSend(v24, "setAlpha:", v14);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController redoSearchOverlay](self, "redoSearchOverlay"));
    objc_msgSend(v25, "setAlpha:", v14);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController userLocationView](self, "userLocationView"));
    objc_msgSend(v26, "setVlfCalloutAlpha:", v14);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherOverlay](self, "weatherOverlay", a4));
    objc_msgSend(v18, "setAlpha:", 1.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundOverlay](self, "lookAroundOverlay"));
    objc_msgSend(v19, "setAlpha:", 1.0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController redoSearchOverlay](self, "redoSearchOverlay"));
    objc_msgSend(v20, "setAlpha:", 1.0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    objc_msgSend(v21, "setAlpha:", 1.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController userLocationView](self, "userLocationView"));
    objc_msgSend(v6, "setVlfCalloutAlpha:", 1.0);
  }

  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "floatingControlsViewController"));
    +[VLFCalloutVisibilityHelper updateVLFBannerVisibilityWithChromeViewController:floatingControlsViewController:](VLFCalloutVisibilityHelper, "updateVLFBannerVisibilityWithChromeViewController:floatingControlsViewController:", self, v28);

  }
  if (sub_1002A8AA0(self) == 1)
    -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), 1);
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  IOSChromeViewController *v13;
  __int16 v14;
  id v15;

  v5 = sub_1004317AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSChromeViewController traitCollection](self, "traitCollection"));
    v10 = 138412802;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2048;
    v15 = objc_msgSend(v9, "userInterfaceStyle");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "<%@:%p>: current interface style is %ld", (uint8_t *)&v10, 0x20u);

  }
  -[IOSBasedChromeViewController updateThemeViewAndControllers](self, "updateThemeViewAndControllers");
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSChromeViewController;
  -[IOSChromeViewController mapViewDidChangeVisibleRegion:](&v6, "mapViewDidChangeVisibleRegion:", a3);
  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "floatingControlsViewController"));
    +[VLFCalloutVisibilityHelper updateVLFBannerVisibilityWithChromeViewController:floatingControlsViewController:](VLFCalloutVisibilityHelper, "updateVLFBannerVisibilityWithChromeViewController:floatingControlsViewController:", self, v5);

  }
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOSChromeViewController;
  -[IOSChromeViewController mapView:didUpdateUserLocation:](&v7, "mapView:didUpdateUserLocation:", a3, a4);
  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "floatingControlsViewController"));
    +[VLFCalloutVisibilityHelper updateVLFBannerVisibilityWithChromeViewController:floatingControlsViewController:](VLFCalloutVisibilityHelper, "updateVLFBannerVisibilityWithChromeViewController:floatingControlsViewController:", self, v6);

  }
}

- (UIEdgeInsets)mapAttributionInsets
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat top;
  double v9;
  CGFloat left;
  double v11;
  CGFloat bottom;
  double v13;
  CGFloat right;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext"));
  if ((objc_opt_respondsToSelector(v3, "fullscreenViewController") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullscreenViewController"));

  }
  else
  {
    v5 = 0;
  }

  v6 = objc_opt_class(ContainerViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    objc_msgSend(v5, "mapAttributionInsets");
    top = v7;
    left = v9;
    bottom = v11;
    right = v13;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }

  v15 = top;
  v16 = left;
  v17 = bottom;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)userDefaultsDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSChromeViewController;
  -[ChromeViewController userDefaultsDidChange:](&v6, "userDefaultsDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("__internal_MapsDebugForceChromeStaleMapEffect"));

  if (self->_forceStaleMapEffect != v5)
  {
    self->_forceStaleMapEffect = v5;
    -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("StaleMapEffect"), 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_luminanceChromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_staleMapEffectDimmingOverlayView, 0);
  objc_storeStrong((id *)&self->_staleMapEffectView, 0);
}

@end

@implementation EVOnboardingController

- (EVOnboardingController)initWithUnpairedVehicles:(id)a3
{
  id v5;
  EVOnboardingController *v6;
  EVOnboardingController *v7;
  uint64_t v8;
  NSMutableDictionary *viewControllersByState;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EVOnboardingController;
  v6 = -[EVOnboardingController init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    viewControllersByState = v7->_viewControllersByState;
    v7->_viewControllersByState = (NSMutableDictionary *)v8;

    objc_storeStrong((id *)&v7->_unpairedVehicles, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v10, "registerObserver:", v7);

  }
  return v7;
}

- (void)setState:(int64_t)a3
{
  int64_t state;
  id v6;
  NSObject *v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  const __CFString *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  char *v29;
  const __CFString *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  char *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  char *v40;
  int v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;

  state = self->_state;
  if (state != a3)
  {
    if (-[EVOnboardingController _validateStateTransitionFromState:toState:](self, "_validateStateTransitionFromState:toState:", state, a3))
    {
      v6 = sub_10043173C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = self->_state;
        if (v8 >= 6)
        {
          v19 = sub_1004318FC();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            v43 = 2080;
            v44 = "EVOnboardingController.m";
            v45 = 1024;
            v46 = 51;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v21 = sub_1004318FC();
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v41 = 138412290;
              v42 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

            }
          }
          v9 = CFSTR("Unknown");
        }
        else
        {
          v9 = *(&off_1011DD868 + v8);
        }
        if ((unint64_t)a3 >= 6)
        {
          v31 = sub_1004318FC();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            v43 = 2080;
            v44 = "EVOnboardingController.m";
            v45 = 1024;
            v46 = 51;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v33 = sub_1004318FC();
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v41 = 138412290;
              v42 = v35;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

            }
          }
          v24 = CFSTR("Unknown");
        }
        else
        {
          v24 = *(&off_1011DD868 + a3);
        }
        v41 = 138412546;
        v42 = (const char *)v9;
        v43 = 2112;
        v44 = (const char *)v24;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Setting state from: %@, to: %@", (uint8_t *)&v41, 0x16u);
      }

      self->_state = a3;
    }
    else
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v41 = 136315650;
        v42 = "-[EVOnboardingController setState:]";
        v43 = 2080;
        v44 = "EVOnboardingController.m";
        v45 = 1024;
        v46 = 108;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v41 = 138412290;
          v42 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

        }
      }
      v15 = sub_10043173C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = self->_state;
        if (v17 >= 6)
        {
          v25 = sub_1004318FC();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            v43 = 2080;
            v44 = "EVOnboardingController.m";
            v45 = 1024;
            v46 = 51;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v27 = sub_1004318FC();
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v41 = 138412290;
              v42 = v29;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

            }
          }
          v18 = CFSTR("Unknown");
        }
        else
        {
          v18 = *(&off_1011DD868 + v17);
        }
        if ((unint64_t)a3 >= 6)
        {
          v36 = sub_1004318FC();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            v43 = 2080;
            v44 = "EVOnboardingController.m";
            v45 = 1024;
            v46 = 51;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v41, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v38 = sub_1004318FC();
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v41 = 138412290;
              v42 = v40;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

            }
          }
          v30 = CFSTR("Unknown");
        }
        else
        {
          v30 = *(&off_1011DD868 + a3);
        }
        v41 = 138412546;
        v42 = (const char *)v18;
        v43 = 2112;
        v44 = (const char *)v30;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Tried to set state from: %@, to: %@, which is not supported", (uint8_t *)&v41, 0x16u);
      }

    }
  }
}

- (BOOL)_validateStateTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  int64_t v4;
  BOOL v6;
  BOOL v7;

  v4 = a4 - a3;
  if (a4 - a3 < 0)
    v4 = a3 - a4;
  v6 = a3 == 2 && a4 == 4;
  v7 = v4 == 1 || v6;
  return a4 == 5 || v7;
}

- (void)presentInViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  UINavigationController *v14;
  UINavigationController *navigationController;
  UINavigationController *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  id v26;
  unint64_t state;
  const __CFString *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  char *v33;
  int v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

  if (v10)
  {
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));
      v8 = v11;
    }
    while (v12);
    if (v11)
    {
LABEL_4:
      if (self->_state)
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v34 = 136315906;
          v35 = "-[EVOnboardingController presentInViewController:animated:completion:]";
          v36 = 2080;
          v37 = "EVOnboardingController.m";
          v38 = 1024;
          v39 = 146;
          v40 = 2080;
          v41 = "_state == EVOnboardingControllerStateNone";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v34, 0x26u);
        }

        if (sub_100A70734())
        {
          v23 = sub_1004318FC();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v34 = 138412290;
            v35 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v34, 0xCu);

          }
        }
        if (self->_state)
        {
          v26 = sub_10043173C();
          v13 = objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_10;
          state = self->_state;
          if (state >= 6)
          {
            v29 = sub_1004318FC();
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v34 = 136315650;
              v35 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
              v36 = 2080;
              v37 = "EVOnboardingController.m";
              v38 = 1024;
              v39 = 51;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v34, 0x1Cu);
            }

            if (sub_100A70734())
            {
              v31 = sub_1004318FC();
              v32 = objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                v34 = 138412290;
                v35 = v33;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v34, 0xCu);

              }
            }
            v28 = CFSTR("Unknown");
          }
          else
          {
            v28 = *(&off_1011DD868 + state);
          }
          v34 = 138412290;
          v35 = (const char *)v28;
          v18 = "Tried to present welcome onboarding VC, but state of the controller was: %@.";
          v19 = v13;
          v20 = 12;
          goto LABEL_9;
        }
      }
      objc_storeStrong((id *)&self->_presentingViewController, v11);
      -[EVOnboardingController setState:](self, "setState:", 1);
      v13 = objc_claimAutoreleasedReturnValue(-[EVOnboardingController _viewControllerForState:](self, "_viewControllerForState:", self->_state));
      v14 = (UINavigationController *)objc_msgSend(objc_alloc((Class)OBNavigationController), "initWithRootViewController:", v13);
      -[UINavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 2);
      navigationController = self->_navigationController;
      self->_navigationController = v14;
      v16 = v14;

      objc_msgSend(v11, "presentViewController:animated:completion:", v16, v6, v9);
      goto LABEL_10;
    }
  }
  else
  {
    v11 = v8;
    if (v8)
      goto LABEL_4;
  }
  v17 = sub_10043173C();
  v13 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v34) = 0;
    v18 = "Tried to present on a nil presenting VC.";
    v19 = v13;
    v20 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v34, v20);
  }
LABEL_10:

}

- (id)_viewControllerForState:(int64_t)a3
{
  NSMutableDictionary *viewControllersByState;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  id v12;
  EVOnboardingWelcomeViewController *v13;
  const __CFString *v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  id v35;
  char *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  char *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  char *v46;
  int v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;

  viewControllersByState = self->_viewControllersByState;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));

  switch(a3)
  {
    case 0:
    case 5:
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v47 = 136315906;
        v48 = "-[EVOnboardingController _viewControllerForState:]";
        v49 = 2080;
        v50 = "EVOnboardingController.m";
        v51 = 1024;
        v52 = 170;
        v53 = 2080;
        v54 = "state != EVOnboardingControllerStateNone && state != EVOnboardingControllerStateDismissed";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v47, 0x26u);
      }

      if (sub_100A70734())
      {
        v9 = sub_1004318FC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v47 = 138412290;
          v48 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v47, 0xCu);

        }
      }
      v12 = sub_10043173C();
      v13 = (EVOnboardingWelcomeViewController *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(&v13->super.super.super.super, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)a3 >= 6)
        {
          v24 = sub_1004318FC();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v47 = 136315650;
            v48 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            v49 = 2080;
            v50 = "EVOnboardingController.m";
            v51 = 1024;
            v52 = 51;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v47, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v26 = sub_1004318FC();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v47 = 138412290;
              v48 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v47, 0xCu);

            }
          }
          v14 = CFSTR("Unknown");
        }
        else
        {
          v14 = *(&off_1011DD868 + a3);
        }
        v47 = 138412290;
        v48 = (const char *)v14;
        _os_log_impl((void *)&_mh_execute_header, &v13->super.super.super.super, OS_LOG_TYPE_FAULT, "Tried to get a VC for %@ state", (uint8_t *)&v47, 0xCu);
      }
      goto LABEL_26;
    case 1:
      v13 = -[EVOnboardingWelcomeViewController initWithVehicles:delegate:]([EVOnboardingWelcomeViewController alloc], "initWithVehicles:delegate:", self->_unpairedVehicles, self);
      v15 = self->_viewControllersByState;
      v16 = 1;
      goto LABEL_14;
    case 2:
      v13 = -[EVOnboardingPrivacyViewController initWithDelegate:]([EVOnboardingPrivacyViewController alloc], "initWithDelegate:", self);
      v15 = self->_viewControllersByState;
      v16 = 2;
      goto LABEL_14;
    case 3:
      v13 = -[EVOnboardingVehicleSelectionViewController initWithVehicles:delegate:]([EVOnboardingVehicleSelectionViewController alloc], "initWithVehicles:delegate:", self->_unpairedVehicles, self);
      v15 = self->_viewControllersByState;
      v16 = 3;
LABEL_14:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, v17);

LABEL_26:
      goto LABEL_27;
    case 4:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingController currentSingleVehicleOnboardingController](self, "currentSingleVehicleOnboardingController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentViewController"));

      if (!v19)
      {
        v42 = sub_1004318FC();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v47 = 136315906;
          v48 = "-[EVOnboardingController _viewControllerForState:]";
          v49 = 2080;
          v50 = "EVOnboardingController.m";
          v51 = 1024;
          v52 = 183;
          v53 = 2080;
          v54 = "self.currentSingleVehicleOnboardingController.currentViewController";
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v47, 0x26u);
        }

        if (sub_100A70734())
        {
          v44 = sub_1004318FC();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v47 = 138412290;
            v48 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v47, 0xCu);

          }
        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingController currentSingleVehicleOnboardingController](self, "currentSingleVehicleOnboardingController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentViewController"));

      if (v21)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[EVOnboardingController currentSingleVehicleOnboardingController](self, "currentSingleVehicleOnboardingController"));
        v23 = objc_claimAutoreleasedReturnValue(-[NSObject currentViewController](v22, "currentViewController"));
LABEL_29:
        v33 = (void *)v23;
      }
      else
      {
        v35 = sub_10043173C();
        v22 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v36 = (char *)objc_claimAutoreleasedReturnValue(-[EVOnboardingController currentSingleVehicleOnboardingController](self, "currentSingleVehicleOnboardingController"));
          v47 = 138412290;
          v48 = v36;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Tried to get a single vehicle onboarding VC, but failed. Current onboarding controller: %@", (uint8_t *)&v47, 0xCu);

        }
        v33 = 0;
      }

      return v33;
    default:
LABEL_27:
      v29 = self->_viewControllersByState;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v30));

      if (!v31)
      {
        v37 = sub_1004318FC();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v47 = 136315906;
          v48 = "-[EVOnboardingController _viewControllerForState:]";
          v49 = 2080;
          v50 = "EVOnboardingController.m";
          v51 = 1024;
          v52 = 192;
          v53 = 2080;
          v54 = "_viewControllersByState[@(state)]";
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v47, 0x26u);
        }

        if (sub_100A70734())
        {
          v39 = sub_1004318FC();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v47 = 138412290;
            v48 = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v47, 0xCu);

          }
        }
      }
      v32 = self->_viewControllersByState;
      v22 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v23 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v22));
      goto LABEL_29;
  }
}

- (SingleVehicleOnboardingController)currentSingleVehicleOnboardingController
{
  return self->_currentSingleVehicleOnboardingController;
}

- (void)_dismissOnboarding
{
  void *v3;
  void *v4;
  void *v5;
  UIViewController *presentingViewController;
  _QWORD v7[5];

  if (MapsFeature_IsEnabled_EVRoutingEnhancements(self, a2)
    && -[NSArray count](self->_onboardedVehicles, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_onboardedVehicleCount));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 2107, 660, v5);

  }
  presentingViewController = self->_presentingViewController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10099FC84;
  v7[3] = &unk_1011AC860;
  v7[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](presentingViewController, "dismissViewControllerAnimated:completion:", 1, v7);
}

- (void)_cleanUp
{
  SingleVehicleOnboardingController *currentSingleVehicleOnboardingController;
  NSMutableDictionary *viewControllersByState;
  UIViewController *presentingViewController;

  currentSingleVehicleOnboardingController = self->_currentSingleVehicleOnboardingController;
  self->_currentSingleVehicleOnboardingController = 0;

  -[EVOnboardingController setState:](self, "setState:", 5);
  viewControllersByState = self->_viewControllersByState;
  self->_viewControllersByState = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

}

- (void)_proceedToNextState
{
  unint64_t v3;
  unint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  char *v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  const __CFString *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;

  v3 = -[EVOnboardingController state](self, "state");
  v4 = v3;
  if (v3 >= 4)
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[EVOnboardingController _proceedToNextState]";
      v22 = 2080;
      v23 = "EVOnboardingController.m";
      v24 = 1024;
      v25 = 223;
      v26 = 2080;
      v27 = "canPresentViewControllerForState";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v10 = sub_10043173C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = (_QWORD *)&unk_100E25000;
      if (v4 == -1)
      {
        v13 = CFSTR("None");
      }
      else if (v4 == 4)
      {
        v13 = CFSTR("Dismissed");
      }
      else
      {
        v14 = sub_1004318FC();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
          v22 = 2080;
          v23 = "EVOnboardingController.m";
          v24 = 1024;
          v25 = 51;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v16 = sub_1004318FC();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v21 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
        v13 = CFSTR("Unknown");
        v12 = &unk_100E25000;
      }
      *(_DWORD *)buf = v12[273];
      v21 = (const char *)v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Tried to proceed to next state (%@) in EV onboarding, but that was not possible.", buf, 0xCu);
    }

  }
  else
  {
    -[EVOnboardingController setState:](self, "setState:", v3 + 1);
    v19 = (id)objc_claimAutoreleasedReturnValue(-[EVOnboardingController _viewControllerForState:](self, "_viewControllerForState:", -[EVOnboardingController state](self, "state")));
    -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:");

  }
}

- (void)_onboardVehicles:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSArray *v11;
  NSArray *onboardedVehicles;
  dispatch_time_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  __CFString *v30;

  v4 = a3;
  v5 = sub_10043173C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v4;
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v8, v9));

      }
      else
      {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v8));
      }
    }
    else
    {
      v10 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Onboarding vehicles: %@", buf, 0xCu);

  }
  v11 = (NSArray *)objc_msgSend(v4, "copy");
  onboardedVehicles = self->_onboardedVehicles;
  self->_onboardedVehicles = v11;

  self->_onboardedVehicleCount = (unint64_t)objc_msgSend(v4, "count");
  objc_storeStrong(&self->_strongSelf, self);
  objc_initWeak((id *)buf, self);
  v13 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009A0330;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v27, (id *)buf);
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
        objc_msgSend(v19, "virtualGarageOnboardVehicle:", v18);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v14, "count") == (id)1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    objc_msgSend(v20, "virtualGarageSelectVehicle:", v21);

  }
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

- (void)onboardingViewControllerWillMoveFromParentViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  char *v13;
  objc_class *v14;
  NSString *v15;
  char *v16;
  NSMutableDictionary *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EVOnboardingController _viewControllerForState:](self, "_viewControllerForState:", -[EVOnboardingController state](self, "state")));

  if (v5 != v4)
  {
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[EVOnboardingController onboardingViewControllerWillMoveFromParentViewController:]";
      v36 = 2080;
      v37 = "EVOnboardingController.m";
      v38 = 1024;
      v39 = 264;
      v40 = 2080;
      v41 = "viewController == [self _viewControllerForState:self.state]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childViewControllers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));

  v9 = sub_10043173C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(v4);
    v12 = NSStringFromClass(v11);
    v13 = (char *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (objc_class *)objc_opt_class(v8);
    v15 = NSStringFromClass(v14);
    v16 = (char *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412546;
    v35 = v13;
    v36 = 2112;
    v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "onboardingViewControllerWillMoveFromParentViewController: %@ to: %@", buf, 0x16u);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = self->_viewControllersByState;
  v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_viewControllersByState, "objectForKeyedSubscript:", v22, (_QWORD)v29));

        if (v23 == v8)
          -[EVOnboardingController setState:](self, "setState:", objc_msgSend(v22, "integerValue"));
      }
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

}

- (void)welcomeViewControllerDidDismiss:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 446, 660, 0);

  -[EVOnboardingController _dismissOnboarding](self, "_dismissOnboarding");
}

- (void)welcomeViewControllerDidSelectConnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;

  if ((id)-[EVOnboardingController state](self, "state", a3) != (id)1)
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315906;
      v10 = "-[EVOnboardingController welcomeViewControllerDidSelectConnect:]";
      v11 = 2080;
      v12 = "EVOnboardingController.m";
      v13 = 1024;
      v14 = 285;
      v15 = 2080;
      v16 = "self.state == EVOnboardingControllerStateWelcome";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100A70734())
    {
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);

      }
    }
  }
  -[EVOnboardingController _proceedToNextState](self, "_proceedToNextState");
}

- (void)privacyViewControllerDidSelectNotNow:(id)a3
{
  -[EVOnboardingController _proceedFromPrivacyControllerWithSelectedOptIn:](self, "_proceedFromPrivacyControllerWithSelectedOptIn:", 0);
}

- (void)privacyViewControllerDidSelectShare:(id)a3
{
  -[EVOnboardingController _proceedFromPrivacyControllerWithSelectedOptIn:](self, "_proceedFromPrivacyControllerWithSelectedOptIn:", 1);
}

- (void)_proceedFromPrivacyControllerWithSelectedOptIn:(BOOL)a3
{
  _BOOL8 v3;
  NSUInteger v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  NSUInteger v11;
  char IsEnabled_EVRoutingEnhancements;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v3 = a3;
  if ((id)-[EVOnboardingController state](self, "state") != (id)2)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = 136315906;
      v26 = "-[EVOnboardingController _proceedFromPrivacyControllerWithSelectedOptIn:]";
      v27 = 2080;
      v28 = "EVOnboardingController.m";
      v29 = 1024;
      v30 = 303;
      v31 = 2080;
      v32 = "self.state == EVOnboardingControllerStatePrivacy";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v25 = 138412290;
        v26 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

      }
    }
  }
  GEOConfigSetBOOL(GeoServicesConfig_EVRoutingFeedbackOptIn[0], GeoServicesConfig_EVRoutingFeedbackOptIn[1], v3);
  v5 = -[NSArray count](self->_unpairedVehicles, "count");
  if (v5 < 2)
  {
    IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements(v5, v6);
    v13 = sub_10043173C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if ((IsEnabled_EVRoutingEnhancements & 1) != 0)
    {
      if (v15)
      {
        v16 = CFSTR("NO");
        if (v3)
          v16 = CFSTR("YES");
        v17 = v16;
        v25 = 138412290;
        v26 = (const char *)v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_proceedFromPrivacyControllerWithSelectedOptIn: %@ and there was only one vehicle. Will skip vehicle selection and go straight to single vehicle onboarding.", (uint8_t *)&v25, 0xCu);

      }
      -[EVOnboardingController _startSingleVehicleOnboardingWithVehicles:](self, "_startSingleVehicleOnboardingWithVehicles:", self->_unpairedVehicles);
    }
    else
    {
      if (v15)
      {
        v18 = CFSTR("NO");
        if (v3)
          v18 = CFSTR("YES");
        v19 = v18;
        v25 = 138412290;
        v26 = (const char *)v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_proceedFromPrivacyControllerWithSelectedOptIn: %@, and had only one vehicle, but EV2.0 was not enabled. Will only onboard the vehicle and dimiss onboarding.", (uint8_t *)&v25, 0xCu);

      }
      -[EVOnboardingController _onboardVehicles:](self, "_onboardVehicles:", self->_unpairedVehicles);
      -[EVOnboardingController _dismissOnboarding](self, "_dismissOnboarding");
    }
  }
  else
  {
    v7 = sub_10043173C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v10 = v9;
      v11 = -[NSArray count](self->_unpairedVehicles, "count");
      v25 = 138412546;
      v26 = (const char *)v10;
      v27 = 2048;
      v28 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_proceedFromPrivacyControllerWithSelectedOptIn: %@, will continue onboarding %lu vehicles", (uint8_t *)&v25, 0x16u);

    }
    -[EVOnboardingController _proceedToNextState](self, "_proceedToNextState");
  }
}

- (void)_startSingleVehicleOnboardingWithVehicles:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSArray *v11;
  NSArray *vehiclesAwaitingOnboarding;
  uint8_t buf[4];
  __CFString *v14;

  v4 = a3;
  v5 = sub_10043173C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v4;
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "count"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v8, v9));

      }
      else
      {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v8));
      }
    }
    else
    {
      v10 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_startSingleVehicleOnboardingWithVehicles: %@", buf, 0xCu);

  }
  v11 = (NSArray *)objc_msgSend(v4, "copy");
  vehiclesAwaitingOnboarding = self->_vehiclesAwaitingOnboarding;
  self->_vehiclesAwaitingOnboarding = v11;

  -[EVOnboardingController _updateCurrentSingleVehicleOnboardingController](self, "_updateCurrentSingleVehicleOnboardingController");
  -[EVOnboardingController setState:](self, "setState:", 4);

}

- (void)vehicleSelectionViewController:(id)a3 didSelectContinueWithVehicles:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char IsEnabled_EVRoutingEnhancements;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;

  v5 = a4;
  if ((id)-[EVOnboardingController state](self, "state") != (id)3)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v28 = 136315906;
      v29 = "-[EVOnboardingController vehicleSelectionViewController:didSelectContinueWithVehicles:]";
      v30 = 2080;
      v31 = "EVOnboardingController.m";
      v32 = 1024;
      v33 = 334;
      v34 = 2080;
      v35 = "self.state == EVOnboardingControllerStateVehicleSelection";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v28, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v28 = 138412290;
        v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);

      }
    }
  }
  if (!objc_msgSend(v5, "count"))
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = 136315906;
      v29 = "-[EVOnboardingController vehicleSelectionViewController:didSelectContinueWithVehicles:]";
      v30 = 2080;
      v31 = "EVOnboardingController.m";
      v32 = 1024;
      v33 = 335;
      v34 = 2080;
      v35 = "vehicles.count > 0";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v28, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v28 = 138412290;
        v29 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);

      }
    }
  }
  v6 = objc_msgSend(v5, "count");
  if (!v6)
  {
    v13 = sub_10043173C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      -[EVOnboardingController _dismissOnboarding](self, "_dismissOnboarding");
      goto LABEL_16;
    }
    LOWORD(v28) = 0;
    v15 = "Didn't select any vehicles to onboard. Will dismiss onboarding.";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v28, 2u);
    goto LABEL_15;
  }
  IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements(v6, v7);
  v9 = sub_10043173C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((IsEnabled_EVRoutingEnhancements & 1) == 0)
  {
    if (v11)
    {
      v16 = (const char *)objc_msgSend(v5, "count");
      v28 = 134217984;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Selected %lu vehicles to onboard.", (uint8_t *)&v28, 0xCu);
    }

    -[EVOnboardingController _onboardVehicles:](self, "_onboardVehicles:", v5);
    v17 = sub_10043173C();
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    LOWORD(v28) = 0;
    v15 = "EV Enhancements not enabled. Will dismiss onboarding.";
    goto LABEL_14;
  }
  if (v11)
  {
    v12 = (const char *)objc_msgSend(v5, "count");
    v28 = 134217984;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "EV Enhancements enabled. Will continue onboarding %lu vehicles one by one.", (uint8_t *)&v28, 0xCu);
  }

  -[EVOnboardingController _startSingleVehicleOnboardingWithVehicles:](self, "_startSingleVehicleOnboardingWithVehicles:", v5);
LABEL_16:

}

- (void)_updateCurrentSingleVehicleOnboardingController
{
  NSUInteger v3;
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  SingleVehicleOnboardingController *v9;
  void *v10;
  SingleVehicleOnboardingController *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  __CFString *v25;
  UINavigationController *navigationController;
  void *v27;
  void *v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  __CFString *v32;

  if (-[NSArray count](self->_vehiclesAwaitingOnboarding, "count"))
  {
    v3 = -[NSArray count](self->_vehiclesAwaitingOnboarding, "count");
    v4 = v3 == 1 && -[NSArray count](self->_onboardedVehicles, "count") == 0;
    v9 = [SingleVehicleOnboardingController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_vehiclesAwaitingOnboarding, "firstObject"));
    v11 = -[SingleVehicleOnboardingController initWithUnpairedVehicle:isLastUnpairedVehicle:isSoleUnpairedVehicle:navigationController:delegate:](v9, "initWithUnpairedVehicle:isLastUnpairedVehicle:isSoleUnpairedVehicle:navigationController:delegate:", v10, v3 == 1, v4, self->_navigationController, self);
    -[EVOnboardingController setCurrentSingleVehicleOnboardingController:](self, "setCurrentSingleVehicleOnboardingController:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingController currentSingleVehicleOnboardingController](self, "currentSingleVehicleOnboardingController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentViewController"));

    v14 = sub_10043173C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self->_navigationController, "viewControllers"));
        v18 = v17;
        if (v17)
        {
          if (objc_msgSend(v17, "count"))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", ")));
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v18, v19));

          }
          else
          {
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v18));
          }
        }
        else
        {
          v20 = CFSTR("<nil>");
        }

        v21 = v20;
        v28 = v13;
        v22 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
        v23 = v22;
        if (v22)
        {
          if (objc_msgSend(v22, "count"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", CFSTR(", ")));
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v23, v24));

          }
          else
          {
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v23));
          }
        }
        else
        {
          v25 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 138412546;
        v30 = v21;
        v31 = 2112;
        v32 = v25;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "_updateCurrentSingleVehicleOnboardingController replacing VCs: %@ with VC: %@", buf, 0x16u);

      }
      navigationController = self->_navigationController;
      v27 = v13;
      v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
      -[UINavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v16, 1);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "_updateCurrentSingleVehicleOnboardingController couldn't retrieve a vehicle onboarding VC.", buf, 2u);
    }

  }
  else
  {
    v5 = sub_10043173C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_updateCurrentSingleVehicleOnboardingController. There are no vehicles awaiting onboarding, we can dismiss", buf, 2u);
    }

    if ((id)-[NSArray count](self->_onboardedVehicles, "count") == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_onboardedVehicles, "firstObject"));
      objc_msgSend(v7, "virtualGarageSelectVehicle:", v8);

    }
    -[EVOnboardingController _dismissOnboarding](self, "_dismissOnboarding");
  }
}

- (void)onboardingController:(id)a3 didFinishOnboardingVehicle:(id)a4 willProceedSettingUpLPR:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  NSUInteger v22;
  __int16 v23;
  NSUInteger v24;

  v5 = a5;
  v7 = a4;
  v8 = sub_10043173C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("NO");
    if (v5)
      v10 = CFSTR("YES");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
    v13 = -[NSArray count](self->_vehiclesAwaitingOnboarding, "count");
    v14 = -[NSArray count](self->_onboardedVehicles, "count");
    v17 = 138413058;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2048;
    v22 = v13;
    v23 = 2048;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "onboardingController didFinishOnboardingVehicle: %@ willProceedSettingUpLPR: %@. current state: _vehiclesAwaitingOnboarding: %lu, _onboardedVehicles: %lu", (uint8_t *)&v17, 0x2Au);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", 441, 660, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v16, "virtualGarageOnboardVehicle:", v7);

  if (!v5)
    -[EVOnboardingController _finishConfiguringVehicle:](self, "_finishConfiguringVehicle:", v7);

}

- (void)onboardingController:(id)a3 didFinishSettingUpLPRForVehicle:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  NSUInteger v15;
  __int16 v16;
  NSUInteger v17;

  v5 = a4;
  v6 = sub_10043173C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
    v9 = -[NSArray count](self->_vehiclesAwaitingOnboarding, "count");
    v10 = -[NSArray count](self->_onboardedVehicles, "count");
    v12 = 138412802;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    v16 = 2048;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "onboardingController didFinishSettingUpLPRForVehicle: %@. current state: _vehiclesAwaitingOnboarding: %lu, _onboardedVehicles: %lu", (uint8_t *)&v12, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 436, 660, 0);

  -[EVOnboardingController _finishConfiguringVehicle:](self, "_finishConfiguringVehicle:", v5);
}

- (void)_finishConfiguringVehicle:(id)a3
{
  id v4;
  NSArray *vehiclesAwaitingOnboarding;
  id v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *onboardedVehicles;
  NSArray *v11;
  NSArray *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSUInteger v23;
  __int16 v24;
  NSUInteger v25;

  v4 = a3;
  vehiclesAwaitingOnboarding = self->_vehiclesAwaitingOnboarding;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009A191C;
  v18[3] = &unk_1011B87C0;
  v6 = v4;
  v19 = v6;
  v7 = sub_10039E080(vehiclesAwaitingOnboarding, v18);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(v7);
  v9 = self->_vehiclesAwaitingOnboarding;
  self->_vehiclesAwaitingOnboarding = v8;

  if (self->_onboardedVehicles)
    onboardedVehicles = self->_onboardedVehicles;
  else
    onboardedVehicles = (NSArray *)&__NSArray0__struct;
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](onboardedVehicles, "arrayByAddingObject:", v6));
  v12 = self->_onboardedVehicles;
  self->_onboardedVehicles = v11;

  v13 = sub_10043173C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v16 = -[NSArray count](self->_vehiclesAwaitingOnboarding, "count");
    v17 = -[NSArray count](self->_onboardedVehicles, "count");
    *(_DWORD *)buf = 138412802;
    v21 = v15;
    v22 = 2048;
    v23 = v16;
    v24 = 2048;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "onboardingController _finishConfiguringVehicle: %@. state after configuring: _vehiclesAwaitingOnboarding: %lu, _onboardedVehicles: %lu", buf, 0x20u);

  }
  -[EVOnboardingController _updateCurrentSingleVehicleOnboardingController](self, "_updateCurrentSingleVehicleOnboardingController");

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  v4 = a3;
  if ((MapsFeature_IsEnabled_EVRoutingEnhancements(v4, v5) & 1) == 0 && self->_onboardedVehicleCount)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v7, "count") + self->_onboardedVehicleCount - 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 2107, 660, v9);

    self->_onboardedVehicleCount = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("EVOnboardingFinishedNotification"), 0, 0);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009A1C0C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (int64_t)state
{
  return self->_state;
}

- (void)setCurrentSingleVehicleOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_currentSingleVehicleOnboardingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_onboardedVehicles, 0);
  objc_storeStrong((id *)&self->_vehiclesAwaitingOnboarding, 0);
  objc_storeStrong((id *)&self->_currentSingleVehicleOnboardingController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_viewControllersByState, 0);
}

@end

@implementation PreferredNetworksOnboardingController

- (PreferredNetworksOnboardingController)initWithVehicle:(id)a3
{
  id v5;
  PreferredNetworksOnboardingController *v6;
  PreferredNetworksOnboardingController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *viewControllersByState;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PreferredNetworksOnboardingController;
  v6 = -[PreferredNetworksOnboardingController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vehicle, a3);
    v8 = objc_opt_new(NSMutableDictionary);
    viewControllersByState = v7->_viewControllersByState;
    v7->_viewControllersByState = v8;

  }
  return v7;
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
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PreferredNetworksOnboardingController _viewControllerForState:](self, "_viewControllerForState:", -[PreferredNetworksOnboardingController state](self, "state")));

  if (v5 != v4)
  {
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[PreferredNetworksOnboardingController onboardingViewControllerWillMoveFromParentViewController:]";
      v36 = 2080;
      v37 = "PreferredNetworksOnboardingController.m";
      v38 = 1024;
      v39 = 73;
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
          -[PreferredNetworksOnboardingController setState:](self, "setState:", objc_msgSend(v22, "integerValue"));
      }
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

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
    if (-[PreferredNetworksOnboardingController _validateStateTransitionFromState:toState:](self, "_validateStateTransitionFromState:toState:", state, a3))
    {
      v6 = sub_10043173C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = self->_state;
        if (v8 >= 4)
        {
          v19 = sub_1004318FC();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            v43 = 2080;
            v44 = "PreferredNetworksOnboardingController.m";
            v45 = 1024;
            v46 = 41;
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
          v9 = *(&off_1011B5218 + v8);
        }
        if ((unint64_t)a3 >= 4)
        {
          v31 = sub_1004318FC();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            v43 = 2080;
            v44 = "PreferredNetworksOnboardingController.m";
            v45 = 1024;
            v46 = 41;
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
          v24 = *(&off_1011B5218 + a3);
        }
        v41 = 138412546;
        v42 = (const char *)v9;
        v43 = 2112;
        v44 = (const char *)v24;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting state from: %@, to: %@", (uint8_t *)&v41, 0x16u);
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
        v42 = "-[PreferredNetworksOnboardingController setState:]";
        v43 = 2080;
        v44 = "PreferredNetworksOnboardingController.m";
        v45 = 1024;
        v46 = 93;
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
        if (v17 >= 4)
        {
          v25 = sub_1004318FC();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            v43 = 2080;
            v44 = "PreferredNetworksOnboardingController.m";
            v45 = 1024;
            v46 = 41;
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
          v18 = *(&off_1011B5218 + v17);
        }
        if ((unint64_t)a3 >= 4)
        {
          v36 = sub_1004318FC();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            v43 = 2080;
            v44 = "PreferredNetworksOnboardingController.m";
            v45 = 1024;
            v46 = 41;
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
          v30 = *(&off_1011B5218 + a3);
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

  v4 = a4 - a3;
  if (a4 - a3 < 0)
    v4 = a3 - a4;
  return a4 == 3 || v4 == 1;
}

- (void)presentInViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  char *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  id v24;
  unint64_t state;
  const __CFString *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char *v31;
  int v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "topMostPresentedViewController"));
  if (v9)
  {
    if (self->_state)
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v32 = 136315906;
        v33 = "-[PreferredNetworksOnboardingController presentInViewController:animated:completion:]";
        v34 = 2080;
        v35 = "PreferredNetworksOnboardingController.m";
        v36 = 1024;
        v37 = 125;
        v38 = 2080;
        v39 = "_state == PreferredNetworksOnboardingControllerStateNone";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v32, 0x26u);
      }

      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v32 = 138412290;
          v33 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);

        }
      }
      if (self->_state)
      {
        v24 = sub_10043173C();
        v10 = objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          goto LABEL_9;
        state = self->_state;
        if (state >= 4)
        {
          v27 = sub_1004318FC();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v32 = 136315650;
            v33 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            v34 = 2080;
            v35 = "PreferredNetworksOnboardingController.m";
            v36 = 1024;
            v37 = 41;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v32, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v29 = sub_1004318FC();
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v32 = 138412290;
              v33 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);

            }
          }
          v26 = CFSTR("Unknown");
        }
        else
        {
          v26 = *(&off_1011B5218 + state);
        }
        v32 = 138412290;
        v33 = (const char *)v26;
        v16 = "Tried to present networks offer onboarding VC, but state of the controller was: %@.";
        v17 = v10;
        v18 = 12;
        goto LABEL_8;
      }
    }
    objc_storeStrong((id *)&self->_presentingViewController, v9);
    -[PreferredNetworksOnboardingController setState:](self, "setState:", 1);
    v10 = objc_claimAutoreleasedReturnValue(-[PreferredNetworksOnboardingController _viewControllerForState:](self, "_viewControllerForState:", self->_state));
    v11 = objc_msgSend(objc_alloc((Class)OBNavigationController), "initWithRootViewController:", v10);
    objc_msgSend(v11, "setModalPresentationStyle:", 2);
    objc_storeStrong((id *)&self->_navigationController, v11);
    v12 = sub_10043173C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (char *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
      v32 = 138412290;
      v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will present preferred networks onboarding for vehicle: %@.", (uint8_t *)&v32, 0xCu);

    }
    objc_msgSend(v9, "presentViewController:animated:completion:", v11, v5, v8);

  }
  else
  {
    v15 = sub_10043173C();
    v10 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      v16 = "Tried to present on a nil presenting VC.";
      v17 = v10;
      v18 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v32, v18);
    }
  }
LABEL_9:

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
  EVOnboardingNetworksOfferViewController *v13;
  const __CFString *v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  int v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;

  viewControllersByState = self->_viewControllersByState;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));

  switch(a3)
  {
    case 0:
    case 3:
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v35 = 136315906;
        v36 = "-[PreferredNetworksOnboardingController _viewControllerForState:]";
        v37 = 2080;
        v38 = "PreferredNetworksOnboardingController.m";
        v39 = 1024;
        v40 = 150;
        v41 = 2080;
        v42 = "state != PreferredNetworksOnboardingControllerStateNone && state != PreferredNetworksOnboardingControllerStateDismissed";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v35, 0x26u);
      }

      if (sub_100A70734())
      {
        v9 = sub_1004318FC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v35 = 138412290;
          v36 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v35, 0xCu);

        }
      }
      v12 = sub_10043173C();
      v13 = (EVOnboardingNetworksOfferViewController *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(&v13->super.super.super.super, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)a3 >= 4)
        {
          v18 = sub_1004318FC();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v35 = 136315650;
            v36 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            v37 = 2080;
            v38 = "PreferredNetworksOnboardingController.m";
            v39 = 1024;
            v40 = 41;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v35, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v20 = sub_1004318FC();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v35 = 138412290;
              v36 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v35, 0xCu);

            }
          }
          v14 = CFSTR("Unknown");
        }
        else
        {
          v14 = *(&off_1011B5218 + a3);
        }
        v35 = 138412290;
        v36 = (const char *)v14;
        _os_log_impl((void *)&_mh_execute_header, &v13->super.super.super.super, OS_LOG_TYPE_FAULT, "Tried to get a VC for %@ state", (uint8_t *)&v35, 0xCu);
      }
      goto LABEL_22;
    case 1:
      v13 = -[EVOnboardingNetworksOfferViewController initWithDelegate:vehicleName:]([EVOnboardingNetworksOfferViewController alloc], "initWithDelegate:vehicleName:", self, 0);
      v15 = self->_viewControllersByState;
      v16 = 1;
      goto LABEL_13;
    case 2:
      v13 = -[EVOnboardingNetworksSelectionViewController initWithVehicle:delegate:]([EVOnboardingNetworksSelectionViewController alloc], "initWithVehicle:delegate:", self->_vehicle, self);
      v15 = self->_viewControllersByState;
      v16 = 2;
LABEL_13:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, v17);

LABEL_22:
      break;
    default:
      break;
  }
  v23 = self->_viewControllersByState;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24));

  if (!v25)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v35 = 136315906;
      v36 = "-[PreferredNetworksOnboardingController _viewControllerForState:]";
      v37 = 2080;
      v38 = "PreferredNetworksOnboardingController.m";
      v39 = 1024;
      v40 = 162;
      v41 = 2080;
      v42 = "_viewControllersByState[@(state)]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v35, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v35 = 138412290;
        v36 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v35, 0xCu);

      }
    }
  }
  v26 = self->_viewControllersByState;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v27));

  return v28;
}

- (void)_dismissOnboarding
{
  id v3;
  NSObject *v4;
  PreferredNetworksOnboardingController *v5;
  PreferredNetworksOnboardingController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  UIViewController *presentingViewController;
  _QWORD v14[5];
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const char *v18;

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PreferredNetworksOnboardingController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2080;
    v18 = "-[PreferredNetworksOnboardingController _dismissOnboarding]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s", buf, 0x16u);

  }
  presentingViewController = self->_presentingViewController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003FA5E4;
  v14[3] = &unk_1011AC860;
  v14[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](presentingViewController, "dismissViewControllerAnimated:completion:", 1, v14);
}

- (void)_proceedToNextState
{
  unint64_t v3;
  id v4;
  NSObject *v5;
  PreferredNetworksOnboardingController *v6;
  PreferredNetworksOnboardingController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  id v27;
  const __CFString *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  char *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  _QWORD v39[2];

  v3 = -[PreferredNetworksOnboardingController state](self, "state");
  v4 = sub_10043173C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    goto LABEL_20;
  v6 = self;
  v7 = v6;
  if (!v6)
  {
    v13 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v8 = (objc_class *)objc_opt_class(v6);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PreferredNetworksOnboardingController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

      goto LABEL_8;
    }

  }
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_10:
  v14 = v13;
  if (v3 + 1 >= 4)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
      v36 = 2080;
      v37 = "PreferredNetworksOnboardingController.m";
      v38 = 1024;
      LODWORD(v39[0]) = 41;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v15 = CFSTR("Unknown");
  }
  else
  {
    v15 = *(&off_1011B5218 + v3 + 1);
  }
  *(_DWORD *)buf = 138543874;
  v35 = (const char *)v14;
  v36 = 2080;
  v37 = "-[PreferredNetworksOnboardingController _proceedToNextState]";
  v38 = 2114;
  v39[0] = v15;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s, nextState: %{public}@", buf, 0x20u);

LABEL_20:
  if (v3 >= 2)
  {
    v22 = sub_1004318FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[PreferredNetworksOnboardingController _proceedToNextState]";
      v36 = 2080;
      v37 = "PreferredNetworksOnboardingController.m";
      v38 = 1024;
      LODWORD(v39[0]) = 181;
      WORD2(v39[0]) = 2080;
      *(_QWORD *)((char *)v39 + 6) = "canPresentViewControllerForState";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v27 = sub_10043173C();
    v21 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      if (v3 == -1)
      {
        v28 = CFSTR("None");
      }
      else if (v3 == 2)
      {
        v28 = CFSTR("Dismissed");
      }
      else
      {
        v29 = sub_1004318FC();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v35 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
          v36 = 2080;
          v37 = "PreferredNetworksOnboardingController.m";
          v38 = 1024;
          LODWORD(v39[0]) = 41;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v31 = sub_1004318FC();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v35 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
        v28 = CFSTR("Unknown");
      }
      *(_DWORD *)buf = 138412290;
      v35 = (const char *)v28;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Tried to proceed to next state (%@) in preferred networks onboarding, but that was not possible.", buf, 0xCu);
    }
  }
  else
  {
    -[PreferredNetworksOnboardingController setState:](self, "setState:", v3 + 1);
    v21 = objc_claimAutoreleasedReturnValue(-[PreferredNetworksOnboardingController _viewControllerForState:](self, "_viewControllerForState:", -[PreferredNetworksOnboardingController state](self, "state")));
    -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v21, 1);
  }

}

- (void)networksOfferViewControllerDidSelectSetupNow:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;

  if ((id)-[PreferredNetworksOnboardingController state](self, "state", a3) != (id)1)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "-[PreferredNetworksOnboardingController networksOfferViewControllerDidSelectSetupNow:]";
      v13 = 2080;
      v14 = "PreferredNetworksOnboardingController.m";
      v15 = 1024;
      v16 = 196;
      v17 = 2080;
      v18 = "self.state == PreferredNetworksOnboardingControllerStateNetworksOffer";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v11, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

      }
    }
  }
  v4 = sub_10043173C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "networksOfferViewControllerDidSelectSetupNow:", (uint8_t *)&v11, 2u);
  }

  -[PreferredNetworksOnboardingController _proceedToNextState](self, "_proceedToNextState");
}

- (void)networksOfferViewControllerDidSelectSetupLater:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;

  if ((id)-[PreferredNetworksOnboardingController state](self, "state", a3) != (id)1)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "-[PreferredNetworksOnboardingController networksOfferViewControllerDidSelectSetupLater:]";
      v13 = 2080;
      v14 = "PreferredNetworksOnboardingController.m";
      v15 = 1024;
      v16 = 203;
      v17 = 2080;
      v18 = "self.state == PreferredNetworksOnboardingControllerStateNetworksOffer";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v11, 0x26u);
    }

    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

      }
    }
  }
  v4 = sub_10043173C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "networksOfferViewControllerDidSelectSetupLater:", (uint8_t *)&v11, 2u);
  }

  -[PreferredNetworksOnboardingController _dismissOnboarding](self, "_dismissOnboarding");
}

- (void)networksSelectionViewController:(id)a3 didSelectNetworks:(id)a4 forVehicle:(id)a5
{
  id v7;
  char *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  id v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  char *v37;
  char *v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  _QWORD v45[2];

  v7 = a4;
  v8 = (char *)a5;
  if ((id)-[PreferredNetworksOnboardingController state](self, "state") != (id)2)
  {
    v33 = sub_1004318FC();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v41 = "-[PreferredNetworksOnboardingController networksSelectionViewController:didSelectNetworks:forVehicle:]";
      v42 = 2080;
      v43 = "PreferredNetworksOnboardingController.m";
      v44 = 1024;
      LODWORD(v45[0]) = 212;
      WORD2(v45[0]) = 2080;
      *(_QWORD *)((char *)v45 + 6) = "self.state == PreferredNetworksOnboardingControllerStateNetworksSelection";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v35 = sub_1004318FC();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v41 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v9 = sub_10043173C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v7;
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "count"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v12, v13));

      }
      else
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v12));
      }
    }
    else
    {
      v14 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412546;
    v41 = (const char *)v14;
    v42 = 2112;
    v43 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "networksSelectionViewController:didSelectNetworks: %@ forVehicle: %@. will call into VGService", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle preferredChargingNetworks](self->_vehicle, "preferredChargingNetworks"));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "setByAddingObjectsFromArray:", v7));
  v20 = sub_1004326FC();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v38 = v8;
    v39 = v7;
    v22 = (char *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
    v24 = v23;
    if (v23)
    {
      if (objc_msgSend(v23, "count"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", ")));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v24, v25));

      }
      else
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v24));
      }
    }
    else
    {
      v26 = CFSTR("<nil>");
    }

    v27 = v26;
    v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));
    v29 = v28;
    if (v28)
    {
      if (objc_msgSend(v28, "count"))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", ")));
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v29, v30));

      }
      else
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v29));
      }
    }
    else
    {
      v31 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412802;
    v41 = v22;
    v42 = 2112;
    v43 = (const char *)v27;
    v44 = 2112;
    v45[0] = v31;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "networksSelectionViewController will update vehicle: %@ from networks: %@ to networks: %@)", buf, 0x20u);

    v8 = v38;
    v7 = v39;
  }

  -[VGVehicle setPreferredChargingNetworks:](self->_vehicle, "setPreferredChargingNetworks:", v19);
  -[VGVehicle setUsesPreferredNetworksForRouting:](self->_vehicle, "setUsesPreferredNetworksForRouting:", objc_msgSend(v19, "count") != 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v32, "virtualGarageSaveVehicle:", self->_vehicle);

  -[PreferredNetworksOnboardingController _dismissOnboarding](self, "_dismissOnboarding");
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllersByState, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end

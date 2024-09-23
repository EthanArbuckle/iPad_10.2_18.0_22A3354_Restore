@implementation SingleVehicleOnboardingController

- (SingleVehicleOnboardingController)initWithUnpairedVehicle:(id)a3 isLastUnpairedVehicle:(BOOL)a4 isSoleUnpairedVehicle:(BOOL)a5 navigationController:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  SingleVehicleOnboardingController *v16;
  SingleVehicleOnboardingController *v17;
  id v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *viewControllersByState;
  objc_super v22;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SingleVehicleOnboardingController;
  v16 = -[SingleVehicleOnboardingController init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_vehicle, a3);
    v17->_isLastUnpairedVehicle = a4;
    v17->_isSoleUnpairedVehicle = a5;
    objc_storeStrong((id *)&v17->_navigationController, a6);
    v18 = objc_storeWeak((id *)&v17->_delegate, v15);
    v17->_isLPREnabled = MapsFeature_IsEnabled_Alberta(v18);
    v17->_state = 1;
    v19 = objc_opt_new(NSMutableDictionary);
    viewControllersByState = v17->_viewControllersByState;
    v17->_viewControllersByState = v19;

  }
  return v17;
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
    if (-[SingleVehicleOnboardingController _validateStateTransitionFromState:toState:](self, "_validateStateTransitionFromState:toState:", state, a3))
    {
      v6 = sub_10043173C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = self->_state;
        if (v8 >= 6)
        {
          v19 = sub_1004318FC();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            v43 = 2080;
            v44 = "SingleVehicleOnboardingController.m";
            v45 = 1024;
            v46 = 55;
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
          v9 = off_1011E6FE0[v8];
        }
        if ((unint64_t)a3 >= 6)
        {
          v31 = sub_1004318FC();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            v43 = 2080;
            v44 = "SingleVehicleOnboardingController.m";
            v45 = 1024;
            v46 = 55;
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
          v24 = off_1011E6FE0[a3];
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
        v42 = "-[SingleVehicleOnboardingController setState:]";
        v43 = 2080;
        v44 = "SingleVehicleOnboardingController.m";
        v45 = 1024;
        v46 = 109;
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
            v42 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            v43 = 2080;
            v44 = "SingleVehicleOnboardingController.m";
            v45 = 1024;
            v46 = 55;
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
          v18 = off_1011E6FE0[v17];
        }
        if ((unint64_t)a3 >= 6)
        {
          v36 = sub_1004318FC();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v41 = 136315650;
            v42 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            v43 = 2080;
            v44 = "SingleVehicleOnboardingController.m";
            v45 = 1024;
            v46 = 55;
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
          v30 = off_1011E6FE0[a3];
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
  BOOL result;

  v4 = a4 - a3;
  if (a4 - a3 < 0)
    v4 = a3 - a4;
  result = 1;
  if (a4 != 5 && v4 != 1 && (a3 != 1 || a4 != 3))
    return a3 == 3 && a4 == 1;
  return result;
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

  v3 = -[SingleVehicleOnboardingController state](self, "state");
  v4 = v3;
  if (v3 >= 4)
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[SingleVehicleOnboardingController _proceedToNextState]";
      v22 = 2080;
      v23 = "SingleVehicleOnboardingController.m";
      v24 = 1024;
      v25 = 143;
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
          v21 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
          v22 = 2080;
          v23 = "SingleVehicleOnboardingController.m";
          v24 = 1024;
          v25 = 55;
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
    -[SingleVehicleOnboardingController setState:](self, "setState:", v3 + 1);
    v19 = (id)objc_claimAutoreleasedReturnValue(-[SingleVehicleOnboardingController _viewControllerForState:](self, "_viewControllerForState:", -[SingleVehicleOnboardingController state](self, "state")));
    -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:");

  }
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
  EVOnboardingNetworksSelectionViewController *v13;
  const __CFString *v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  _BOOL8 v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  EVOnboardingNetworksOfferViewController *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  char *v38;
  int v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;

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
        v39 = 136315906;
        v40 = "-[SingleVehicleOnboardingController _viewControllerForState:]";
        v41 = 2080;
        v42 = "SingleVehicleOnboardingController.m";
        v43 = 1024;
        v44 = 160;
        v45 = 2080;
        v46 = "state != SingleVehicleOnboardingControllerStateNone && state != SingleVehicleOnboardingControllerStateDismissed";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v39, 0x26u);
      }

      if (sub_100A70734())
      {
        v9 = sub_1004318FC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v39 = 138412290;
          v40 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v39, 0xCu);

        }
      }
      v12 = sub_10043173C();
      v13 = (EVOnboardingNetworksSelectionViewController *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(&v13->super.super.super.super, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)a3 >= 6)
        {
          v18 = sub_1004318FC();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v39 = 136315650;
            v40 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            v41 = 2080;
            v42 = "SingleVehicleOnboardingController.m";
            v43 = 1024;
            v44 = 55;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v39, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v20 = sub_1004318FC();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v39 = 138412290;
              v40 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v39, 0xCu);

            }
          }
          v14 = CFSTR("Unknown");
        }
        else
        {
          v14 = off_1011E6FE0[a3];
        }
        v39 = 138412290;
        v40 = (const char *)v14;
        _os_log_impl((void *)&_mh_execute_header, &v13->super.super.super.super, OS_LOG_TYPE_FAULT, "Tried to get a VC for %@ state", (uint8_t *)&v39, 0xCu);
      }
      goto LABEL_32;
    case 1:
      if (self->_isSoleUnpairedVehicle)
        v13 = 0;
      else
        v13 = (EVOnboardingNetworksSelectionViewController *)objc_claimAutoreleasedReturnValue(-[VGVehicle combinedDisplayName](self->_vehicle, "combinedDisplayName"));
      v23 = -[EVOnboardingNetworksOfferViewController initWithDelegate:vehicleName:]([EVOnboardingNetworksOfferViewController alloc], "initWithDelegate:vehicleName:", self, v13);
      v24 = self->_viewControllersByState;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, v25);

      goto LABEL_32;
    case 2:
      v13 = -[EVOnboardingNetworksSelectionViewController initWithVehicle:delegate:]([EVOnboardingNetworksSelectionViewController alloc], "initWithVehicle:delegate:", self->_vehicle, self);
      v15 = self->_viewControllersByState;
      v16 = 2;
      goto LABEL_31;
    case 3:
      if (self->_isLPREnabled)
        v17 = 0;
      else
        v17 = self->_isSoleUnpairedVehicle || self->_isLastUnpairedVehicle;
      v13 = -[EVOnboardingVehicleAddedViewController initWithVehicle:isLastPresentedController:delegate:]([EVOnboardingVehicleAddedViewController alloc], "initWithVehicle:isLastPresentedController:delegate:", self->_vehicle, v17, self);
      v15 = self->_viewControllersByState;
      v16 = 3;
      goto LABEL_31;
    case 4:
      v13 = -[LPROnboardingPageViewController initWithScenario:vehicle:delegate:]([LPROnboardingPageViewController alloc], "initWithScenario:vehicle:delegate:", 2, self->_vehicle, self);
      v15 = self->_viewControllersByState;
      v16 = 4;
LABEL_31:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, v26);

LABEL_32:
      break;
    default:
      break;
  }
  v27 = self->_viewControllersByState;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28));

  if (!v29)
  {
    v34 = sub_1004318FC();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v39 = 136315906;
      v40 = "-[SingleVehicleOnboardingController _viewControllerForState:]";
      v41 = 2080;
      v42 = "SingleVehicleOnboardingController.m";
      v43 = 1024;
      v44 = 183;
      v45 = 2080;
      v46 = "_viewControllersByState[@(state)]";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v39, 0x26u);
    }

    if (sub_100A70734())
    {
      v36 = sub_1004318FC();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v39 = 138412290;
        v40 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v39, 0xCu);

      }
    }
  }
  v30 = self->_viewControllersByState;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v31));

  return v32;
}

- (UIViewController)currentViewController
{
  return (UIViewController *)-[SingleVehicleOnboardingController _viewControllerForState:](self, "_viewControllerForState:", self->_state);
}

- (void)_cleanUp
{
  id v3;
  NSObject *v4;
  VGVehicle *vehicle;
  NSMutableDictionary *viewControllersByState;
  UINavigationController *navigationController;
  VGVehicle *v8;
  int v9;
  VGVehicle *v10;

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    vehicle = self->_vehicle;
    v9 = 138412290;
    v10 = vehicle;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SingleVehicleOnboardingController _cleanUp with vehicle: %@", (uint8_t *)&v9, 0xCu);
  }

  -[SingleVehicleOnboardingController setState:](self, "setState:", 5);
  viewControllersByState = self->_viewControllersByState;
  self->_viewControllersByState = 0;

  navigationController = self->_navigationController;
  self->_navigationController = 0;

  v8 = self->_vehicle;
  self->_vehicle = 0;

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
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SingleVehicleOnboardingController _viewControllerForState:](self, "_viewControllerForState:", -[SingleVehicleOnboardingController state](self, "state")));

  if (v5 != v4)
  {
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[SingleVehicleOnboardingController onboardingViewControllerWillMoveFromParentViewController:]";
      v36 = 2080;
      v37 = "SingleVehicleOnboardingController.m";
      v38 = 1024;
      v39 = 206;
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
          -[SingleVehicleOnboardingController setState:](self, "setState:", objc_msgSend(v22, "integerValue"));
      }
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
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

  if ((id)-[SingleVehicleOnboardingController state](self, "state", a3) != (id)1)
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "-[SingleVehicleOnboardingController networksOfferViewControllerDidSelectSetupNow:]";
      v13 = 2080;
      v14 = "SingleVehicleOnboardingController.m";
      v15 = 1024;
      v16 = 221;
      v17 = 2080;
      v18 = "self.state == SingleVehicleOnboardingControllerStateNetworksOffer";
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

  -[SingleVehicleOnboardingController _proceedToNextState](self, "_proceedToNextState");
}

- (void)networksOfferViewControllerDidSelectSetupLater:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  if ((id)-[SingleVehicleOnboardingController state](self, "state", a3) != (id)1)
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[SingleVehicleOnboardingController networksOfferViewControllerDidSelectSetupLater:]";
      v14 = 2080;
      v15 = "SingleVehicleOnboardingController.m";
      v16 = 1024;
      v17 = 228;
      v18 = 2080;
      v19 = "self.state == SingleVehicleOnboardingControllerStateNetworksOffer";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v4 = sub_10043173C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "networksOfferViewControllerDidSelectSetupLater:", (uint8_t *)&v12, 2u);
  }

  -[SingleVehicleOnboardingController setState:](self, "setState:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SingleVehicleOnboardingController _viewControllerForState:](self, "_viewControllerForState:", -[SingleVehicleOnboardingController state](self, "state")));
  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v6, 1);

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
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v7 = a4;
  v8 = (char *)a5;
  if ((id)-[SingleVehicleOnboardingController state](self, "state") != (id)2)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[SingleVehicleOnboardingController networksSelectionViewController:didSelectNetworks:forVehicle:]";
      v23 = 2080;
      v24 = "SingleVehicleOnboardingController.m";
      v25 = 1024;
      v26 = 240;
      v27 = 2080;
      v28 = "self.state == SingleVehicleOnboardingControllerStateNetworksSelection";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

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
    v22 = (const char *)v14;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "networksSelectionViewController:didSelectNetworks: %@ forVehicle: %@. will call into VGService", buf, 0x16u);

  }
  v15 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v7);
  objc_msgSend(v8, "setPreferredChargingNetworks:", v15);

  objc_msgSend(v8, "setUsesPreferredNetworksForRouting:", objc_msgSend(v7, "count") != 0);
  -[SingleVehicleOnboardingController _proceedToNextState](self, "_proceedToNextState");

}

- (void)vehicleAddedViewControllerDidSelectDone:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  void *v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  if ((id)-[SingleVehicleOnboardingController state](self, "state", a3) != (id)3)
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "-[SingleVehicleOnboardingController vehicleAddedViewControllerDidSelectDone:]";
      v21 = 2080;
      v22 = "SingleVehicleOnboardingController.m";
      v23 = 1024;
      v24 = 252;
      v25 = 2080;
      v26 = "self.state == SingleVehicleOnboardingControllerStateVehicleAdded";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v19 = 138412290;
        v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

      }
    }
  }
  if (self->_isLPREnabled)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "-[SingleVehicleOnboardingController vehicleAddedViewControllerDidSelectDone:]";
      v21 = 2080;
      v22 = "SingleVehicleOnboardingController.m";
      v23 = 1024;
      v24 = 253;
      v25 = 2080;
      v26 = "!_isLPREnabled";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

      }
    }
  }
  v4 = sub_10043173C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (char *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
    v19 = 138412290;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "vehicleAddedViewControllerDidSelectDone: LPR is not enabled, will finish onboarding for vehicle: %@", (uint8_t *)&v19, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 41, 121, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "onboardingController:didFinishOnboardingVehicle:willProceedSettingUpLPR:", self, self->_vehicle, self->_isLPREnabled);

  -[SingleVehicleOnboardingController _cleanUp](self, "_cleanUp");
}

- (void)vehicleAddedViewControllerDidSelectNext:(id)a3
{
  id WeakRetained;
  _BOOL4 isLPREnabled;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  char *v9;
  void *v10;
  UINavigationController *navigationController;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  if ((id)-[SingleVehicleOnboardingController state](self, "state", a3) != (id)3)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[SingleVehicleOnboardingController vehicleAddedViewControllerDidSelectNext:]";
      v21 = 2080;
      v22 = "SingleVehicleOnboardingController.m";
      v23 = 1024;
      v24 = 263;
      v25 = 2080;
      v26 = "self.state == SingleVehicleOnboardingControllerStateVehicleAdded";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "onboardingController:didFinishOnboardingVehicle:willProceedSettingUpLPR:", self, self->_vehicle, self->_isLPREnabled);

  isLPREnabled = self->_isLPREnabled;
  v6 = sub_10043173C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (isLPREnabled)
  {
    if (v8)
    {
      v9 = (char *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "vehicleAddedViewControllerDidSelectNext: LPR is enabled, did onboarding in VGService and will continue setting up vehicle: %@", buf, 0xCu);

    }
    -[SingleVehicleOnboardingController setState:](self, "setState:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SingleVehicleOnboardingController _viewControllerForState:](self, "_viewControllerForState:", 4));
    navigationController = self->_navigationController;
    v18 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    -[UINavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v12, 1);

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "vehicleAddedViewControllerDidSelectNext: LPR is not enabled, will finish onboarding and continue with next vehicle", buf, 2u);
    }

    -[SingleVehicleOnboardingController _cleanUp](self, "_cleanUp");
  }
}

- (void)didCancelConfiguringLPRForVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;

  v4 = a3;
  v5 = sub_10043173C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didCancelConfiguringLPRForVehicle: %@", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "onboardingController:didFinishSettingUpLPRForVehicle:", self, v4);

  -[SingleVehicleOnboardingController _cleanUp](self, "_cleanUp");
}

- (void)didFinishConfiguringLPRForVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;

  v4 = a3;
  v5 = sub_10043173C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle displayName](self->_vehicle, "displayName"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didFinishConfiguringLPRForVehicle: %@", (uint8_t *)&v9, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "onboardingController:didFinishSettingUpLPRForVehicle:", self, v4);

  -[SingleVehicleOnboardingController _cleanUp](self, "_cleanUp");
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllersByState, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

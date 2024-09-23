@implementation EVOnboardingWelcomeViewController

- (EVOnboardingWelcomeViewController)initWithVehicles:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  EVOnboardingWelcomeViewController *v8;
  NSArray *v9;
  NSArray *vehicles;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EVOnboardingWelcomeViewController;
  v8 = -[EVOnboardingBaseViewController initWithDelegate:](&v12, "initWithDelegate:", v7);
  if (v8)
  {
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    vehicles = v8->_vehicles;
    v8->_vehicles = v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
  }

  return v8;
}

- (id)obViewController
{
  id v3;
  uint64_t v4;
  NSArray *v5;
  void *v6;
  NSArray *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  EVOnboardingWelcomeViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  const __CFString *v32;
  id v33;
  NSMutableDictionary *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  NSMutableDictionary *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSMutableDictionary *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v63;
  NSMutableDictionary *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _UNKNOWN **v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v88;
  id v89;
  NSArray *v90;
  void *v91;
  void *v92;
  EVOnboardingWelcomeViewController *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t v106[128];
  __int128 v107;
  id (*v108)(uint64_t, void *);
  void *v109;
  NSMutableDictionary *v110;
  uint8_t buf[4];
  void *v112;

  v3 = sub_100BA0C48(self->_vehicles);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v93 = self;
  v5 = self->_vehicles;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v97 = -[NSArray mutableCopy](v5, "mutableCopy");
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v7 = v5;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_19;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v99;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v99 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairedAppIdentifier"));
      if (v14)
      {

LABEL_9:
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairedAppIdentifier"));

        if (v16)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairedAppIdentifier"));
          objc_msgSend(v6, "addObject:", v17);
        }
        else
        {
          v18 = v13;

          objc_msgSend(v97, "removeObject:", v18);
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "iapIdentifier"));
          objc_msgSend(v6, "addObject:", v17);
          v10 = v18;
        }
        goto LABEL_12;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "iapIdentifier"));

      if (v15)
        goto LABEL_9;
      v19 = sub_10043173C();
      v17 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v112 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to get paired app id or iap2 identifier for vehicle: %@", buf, 0xCu);
      }
LABEL_12:

      v12 = (char *)v12 + 1;
    }
    while (v9 != v12);
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
    v9 = v20;
  }
  while (v20);
LABEL_19:

  v21 = objc_msgSend(v6, "count");
  v22 = MKPlaceCollectionsLogicController_ptr;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = v23;
  v94 = (void *)v4;
  if (v10 && (unint64_t)v21 <= 1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Enable iAP2 subtitle single"), CFSTR("localized string not found"), 0));

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "manufacturer"));
    v27 = v93;
    if (v26)
    {
      v28 = (void *)v26;
      goto LABEL_61;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v49));

    v28 = 0;
  }
  else
  {
    v27 = v93;
    if (v10)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Enable iAp2 and apps subtitle plural"), CFSTR("localized string not found"), 0));

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
      v30 = v29;
      v90 = v7;
      if (v29)
        v31 = v29;
      else
        v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "manufacturer"));
      v28 = v31;

      v51 = v97;
      if (objc_msgSend(v51, "count"))
      {
        v95 = v28;
        v92 = v25;
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v53 = objc_opt_new(NSMutableDictionary);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v89 = v51;
        v54 = v51;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v103;
          do
          {
            for (i = 0; i != v56; i = (char *)i + 1)
            {
              if (*(_QWORD *)v103 != v57)
                objc_enumerationMutation(v54);
              v59 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i);
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "pairedAppIdentifier"));

              if (v60)
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "pairedAppIdentifier"));
                objc_msgSend(v52, "addObject:", v61);

                v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "pairedAppIdentifier"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v59, v62);
              }
              else
              {
                v63 = sub_10043173C();
                v62 = objc_claimAutoreleasedReturnValue(v63);
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v107) = 138412290;
                  *(_QWORD *)((char *)&v107 + 4) = v59;
                  _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to get paired app id for vehicle: %@", (uint8_t *)&v107, 0xCu);
                }
              }

            }
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
          }
          while (v56);
        }

        *(_QWORD *)&v107 = _NSConcreteStackBlock;
        *((_QWORD *)&v107 + 1) = 3221225472;
        v108 = sub_10095EF90;
        v109 = &unk_1011DCCE0;
        v110 = v53;
        v64 = v53;
        v65 = sub_10039DCD4(v52, &v107);
        v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "componentsJoinedByString:", CFSTR(", ")));

        v27 = v93;
        v22 = MKPlaceCollectionsLogicController_ptr;
        v25 = v92;
        v28 = v95;
        v51 = v89;
      }
      else
      {
        v67 = 0;
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v28, v67));
      v4 = (uint64_t)v94;
      v7 = v90;
    }
    else
    {
      if ((unint64_t)v21 <= 1)
        v32 = CFSTR("[EV Onboarding] Enable app subtitle single");
      else
        v32 = CFSTR("[EV Onboarding] Enable app subtitle plural");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v32, CFSTR("localized string not found"), 0));

      v33 = v97;
      if (objc_msgSend(v33, "count"))
      {
        v91 = v25;
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v34 = objc_opt_new(NSMutableDictionary);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v88 = v33;
        v35 = v33;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v103;
          do
          {
            for (j = 0; j != v37; j = (char *)j + 1)
            {
              if (*(_QWORD *)v103 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)j);
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pairedAppIdentifier"));

              if (v41)
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pairedAppIdentifier"));
                objc_msgSend(v96, "addObject:", v42);

                v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pairedAppIdentifier"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v40, v43);
              }
              else
              {
                v44 = sub_10043173C();
                v43 = objc_claimAutoreleasedReturnValue(v44);
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v107) = 138412290;
                  *(_QWORD *)((char *)&v107 + 4) = v40;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to get paired app id for vehicle: %@", (uint8_t *)&v107, 0xCu);
                }
              }

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v102, buf, 16);
          }
          while (v37);
        }

        *(_QWORD *)&v107 = _NSConcreteStackBlock;
        *((_QWORD *)&v107 + 1) = 3221225472;
        v108 = sub_10095EF90;
        v109 = &unk_1011DCCE0;
        v110 = v34;
        v45 = v34;
        v46 = sub_10039DCD4(v96, &v107);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "componentsJoinedByString:", CFSTR(", ")));

        v28 = (void *)v48;
        v27 = v93;
        v4 = (uint64_t)v94;
        v22 = MKPlaceCollectionsLogicController_ptr;
        v25 = v91;
        v33 = v88;
      }
      else
      {
        v28 = 0;
      }

LABEL_61:
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v28));
    }
  }

  if (-[NSArray count](v27->_vehicles, "count") > 1)
  {
    v69 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("multipleEV")));
  }
  else
  {
    v68 = sub_10037CFB4(1);
    v69 = objc_claimAutoreleasedReturnValue(v68);
  }
  v70 = (void *)v69;
  v71 = objc_msgSend(objc_alloc((Class)OBWelcomeController), "initWithTitle:detailText:icon:", v4, v50, v69);
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "view"));
  objc_msgSend(v72, "setAccessibilityIdentifier:", CFSTR("EVOnboardingWelcomeView"));

  objc_msgSend(v71, "setModalPresentationStyle:", 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "headerView"));
  objc_msgSend(v73, "setAllowFullWidthIcon:", 1);

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[307], "mainBundle"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Connect"), CFSTR("localized string not found"), 0));
  objc_msgSend(v74, "setTitle:forState:", v76, 0);

  objc_msgSend(v74, "addTarget:action:forControlEvents:", v27, "_connectPressed", 64);
  objc_msgSend(v74, "setAccessibilityIdentifier:", CFSTR("ConnectButton"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "buttonTray"));
  objc_msgSend(v77, "addButton:", v74);

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[307], "mainBundle"));
  v80 = v22;
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Set Up Later"), CFSTR("localized string not found"), 0));
  objc_msgSend(v78, "setTitle:forState:", v81, 0);

  objc_msgSend(v78, "addTarget:action:forControlEvents:", v27, "_setUpLaterPressed", 64);
  objc_msgSend(v78, "setAccessibilityIdentifier:", CFSTR("SetUpLaterButton"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "buttonTray"));
  objc_msgSend(v82, "addButton:", v78);

  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "buttonTray"));
  objc_msgSend(v83, "setAccessibilityIdentifier:", CFSTR("EVOnboardingButtonTray"));

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "buttonTray"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80[307], "mainBundle"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Welcome screen privacy text"), CFSTR("localized string not found"), 0));
  objc_msgSend(v84, "setCaptionText:", v86);

  return v71;
}

- (void)_connectPressed
{
  void *v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 2118, 659, 0);

  v4 = sub_10043173C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User pressed connect to Maps.", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "welcomeViewControllerDidSelectConnect:", self);

}

- (void)_setUpLaterPressed
{
  void *v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 2122, 659, 0);

  v4 = sub_10043173C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User pressed set up later. Will dismiss.", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "welcomeViewControllerDidDismiss:", self);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicles, 0);
}

@end

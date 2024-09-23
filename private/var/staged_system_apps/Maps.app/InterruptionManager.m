@implementation InterruptionManager

+ (id)localizedLocationAuthorizationMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("NSLocationWhenInUseUsageDescription")));

  return v3;
}

+ (id)localizedLocationAuthorizationTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Allow '%@' to use your location?"), CFSTR("localized string not found"), 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5));

  return v6;
}

- (void)setChromeViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  InterruptionManager *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_1002B01F8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Setting new chrome VC: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_storeWeak((id *)&self->_chromeViewController, v4);
}

- (id)presentNavSafetyAlertWithUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id WeakRetained;
  _QWORD v22[4];
  id v23;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionTitle")));
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Maps Safety Warning Title"), CFSTR("localized string not found"), 0));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionMessage")));

  if (v12)
  {
    v13 = v12;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Maps Safety Warning Message"), CFSTR("localized string not found"), 0));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("localized string not found"), 0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v13, 1));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1002B044C;
  v22[3] = &unk_1011AD960;
  v23 = v6;
  v18 = v6;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v22));
  objc_msgSend(v17, "addAction:", v19);

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "_maps_topMostPresentViewController:animated:completion:", v17, 1, 0);

  return v17;
}

- (id)presentUnhandledInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id WeakRetained;
  id v30;
  id v31;
  id v33;
  id v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  _QWORD *v40;
  id v41;
  id *p_locationServicesAlertDismissalBlock;
  id locationServicesAlertDismissalBlock;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  UIAlertController *v65;
  UIAlertController *locationServicesAlertView;
  _QWORD *v67;
  id v68;
  _QWORD *v69;
  id v70;
  _QWORD *v71;
  _QWORD *v72;
  UIAlertController *v73;
  void *v74;
  void *v75;
  void *v76;
  UIAlertController *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  UIAlertController *v82;
  UIAlertController *v83;
  _QWORD *v84;
  id v85;
  id *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  id *location;
  InterruptionManager *v103;
  InterruptionManager *v104;
  _QWORD *v105;
  id v106;
  id v107;
  _QWORD v108[5];
  id v109;
  _QWORD v110[4];
  id v111;
  id v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD block[5];
  id v118;
  _QWORD v119[4];
  id v120;
  id v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  UIAlertController *v127;
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  id v132;
  _QWORD v133[4];
  id v134;
  id v135;
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  id v146;
  _QWORD v147[4];
  id v148;
  id v149;
  _QWORD v150[4];
  id v151;
  id v152;
  BOOL v153;
  BOOL v154;
  _QWORD v155[4];
  id v156;
  id v157;
  _QWORD v158[4];
  id v159;
  uint8_t buf[4];
  InterruptionManager *v161;
  __int16 v162;
  int64_t v163;
  __int16 v164;
  id v165;
  void *v166;

  v107 = a4;
  v106 = a5;
  v8 = 0;
  switch(a3)
  {
    case 1:
      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_1002B1450;
      v158[3] = &unk_1011ADA00;
      v33 = v106;
      v159 = v33;
      v155[0] = _NSConcreteStackBlock;
      v155[1] = 3221225472;
      v155[2] = sub_1002B1460;
      v155[3] = &unk_1011AE240;
      v156 = (id)objc_claimAutoreleasedReturnValue(-[InterruptionManager presentNavSafetyAlertWithUserInfo:completion:](self, "presentNavSafetyAlertWithUserInfo:completion:", v107, v158));
      v157 = v33;
      v34 = v156;
      v8 = objc_msgSend(v155, "copy");

      break;
    case 2:
    case 3:
    case 12:
    case 16:
    case 17:
    case 23:
      v103 = self;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionTitle")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionMessage")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionActions")));
      if (!objc_msgSend(v12, "count"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("localized string not found"), 0));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v14, 0, 0));
        v166 = v15;
        v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v166, 1));

        v12 = (void *)v16;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v18 = objc_msgSend(v17, "userInterfaceIdiom");

      v19 = v18 != (id)5;
      if (a3 == 17)
        v19 = 0;
      v150[0] = _NSConcreteStackBlock;
      v150[1] = 3221225472;
      v150[2] = sub_1002B1498;
      v150[3] = &unk_1011AF910;
      v153 = v19;
      v20 = v106;
      v152 = v20;
      v21 = v11;
      v151 = v21;
      v154 = v18 == (id)5;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v150);
      if (a3 == 17)
      {
        v22 = v18 == (id)5;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AddressCorrection_Permission_LearnMore"), CFSTR("localized string not found"), 0));
        v147[0] = _NSConcreteStackBlock;
        v147[1] = 3221225472;
        v147[2] = sub_1002B15E0;
        v147[3] = &unk_1011AF938;
        v149 = v20;
        v148 = v12;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, v22, v147));
        objc_msgSend(v21, "addAction:", v25);

      }
      v144[0] = _NSConcreteStackBlock;
      v144[1] = 3221225472;
      v144[2] = sub_1002B160C;
      v144[3] = &unk_1011AE240;
      v145 = v21;
      v146 = v20;
      v26 = v21;
      v8 = objc_msgSend(v144, "copy");
      v27 = sub_1002B01F8();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        WeakRetained = objc_loadWeakRetained((id *)&v103->_chromeViewController);
        *(_DWORD *)buf = 134349570;
        v161 = v103;
        v162 = 2048;
        v163 = a3;
        v164 = 2112;
        v165 = WeakRetained;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}p] Presenting interruption alert of kind (%ld) on chrome VC: (%@)", buf, 0x20u);

      }
      v30 = objc_loadWeakRetained((id *)&v103->_chromeViewController);
      objc_msgSend(v30, "_maps_topMostPresentViewController:animated:completion:", v26, 1, 0);

      break;
    case 5:
      if (self->_isShowingLocationServicesAuthorizationPrompt)
        goto LABEL_17;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v36 = objc_msgSend(v35, "isLocationServicesAuthorizationNeeded");

      if (!v36)
        goto LABEL_17;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v37, "addObserver:selector:name:object:", self, "_locationAuthorizationDismissed:", CFSTR("LocationAuthorizationDismissedNotification"), 0);

      self->_isShowingLocationServicesAuthorizationPrompt = 1;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      objc_msgSend(v38, "requestWhenInUseAuthorization");

      objc_initWeak((id *)buf, self);
      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472;
      v142[2] = sub_1002B1690;
      v142[3] = &unk_1011AD260;
      objc_copyWeak(&v143, (id *)buf);
      v39 = objc_retainBlock(v142);
      v139[0] = _NSConcreteStackBlock;
      v139[1] = 3221225472;
      v139[2] = sub_1002B16C8;
      v139[3] = &unk_1011AF960;
      v140 = v106;
      v40 = v39;
      v141 = v40;
      v41 = objc_msgSend(v139, "copy");
      locationServicesAlertDismissalBlock = self->_locationServicesAlertDismissalBlock;
      p_locationServicesAlertDismissalBlock = &self->_locationServicesAlertDismissalBlock;
      *p_locationServicesAlertDismissalBlock = v41;

      v8 = objc_retainBlock(*p_locationServicesAlertDismissalBlock);
      objc_destroyWeak(&v143);
      objc_destroyWeak((id *)buf);
      break;
    case 6:
      if (-[InterruptionManager isShowingLocationServicesAlert](self, "isShowingLocationServicesAlert"))
      {
LABEL_17:
        v8 = 0;
      }
      else
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionError")));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionTitle")));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionMessage")));
        v65 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v63, v64, 1));
        locationServicesAlertView = self->_locationServicesAlertView;
        self->_locationServicesAlertView = v65;

        objc_initWeak((id *)buf, self);
        v137[0] = _NSConcreteStackBlock;
        v137[1] = 3221225472;
        v137[2] = sub_1002B1728;
        v137[3] = &unk_1011AD260;
        objc_copyWeak(&v138, (id *)buf);
        v67 = objc_retainBlock(v137);
        v133[0] = _NSConcreteStackBlock;
        v133[1] = 3221225472;
        v133[2] = sub_1002B1784;
        v133[3] = &unk_1011AF988;
        v101 = v62;
        v134 = v101;
        v68 = v106;
        v135 = v68;
        v69 = v67;
        v136 = v69;
        v105 = objc_retainBlock(v133);
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472;
        v130[2] = sub_1002B1800;
        v130[3] = &unk_1011AF9B0;
        v70 = v68;
        v131 = v70;
        v71 = v69;
        v132 = v71;
        v72 = objc_retainBlock(v130);
        v73 = self->_locationServicesAlertView;
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "localizedStringForKey:value:table:", CFSTR("LocationServiceAlert_Settings"), CFSTR("localized string not found"), 0));
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v75, 0, v105));
        -[UIAlertController addAction:](v73, "addAction:", v76);

        v77 = self->_locationServicesAlertView;
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("LocationServiceAlert_Don'tUse"), CFSTR("localized string not found"), 0));
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v79, 0, v72));
        -[UIAlertController addAction:](v77, "addAction:", v80);

        v81 = objc_loadWeakRetained((id *)&self->_chromeViewController);
        objc_msgSend(v81, "_maps_topMostPresentViewController:animated:completion:", self->_locationServicesAlertView, 1, 0);

        v82 = self->_locationServicesAlertView;
        v126[0] = _NSConcreteStackBlock;
        v126[1] = 3221225472;
        v126[2] = sub_1002B1834;
        v126[3] = &unk_1011AF9D8;
        v83 = v82;
        v127 = v83;
        v128 = v70;
        v84 = v71;
        v129 = v84;
        v85 = objc_msgSend(v126, "copy");
        v87 = self->_locationServicesAlertDismissalBlock;
        v86 = &self->_locationServicesAlertDismissalBlock;
        *v86 = v85;

        v8 = objc_retainBlock(*v86);
        objc_destroyWeak(&v138);
        objc_destroyWeak((id *)buf);

      }
      break;
    case 7:
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Route in Progress"), CFSTR("localized string not found"), 0));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to end navigation?"), CFSTR("localized string not found"), 0));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v45, v47, 1));

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472;
      v124[2] = sub_1002B187C;
      v124[3] = &unk_1011AD960;
      v51 = v106;
      v125 = v51;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v50, 1, v124));
      objc_msgSend(v48, "addAction:", v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("End Navigation"), CFSTR("localized string not found"), 0));
      v122[0] = _NSConcreteStackBlock;
      v122[1] = 3221225472;
      v122[2] = sub_1002B18A8;
      v122[3] = &unk_1011AD960;
      v55 = v51;
      v123 = v55;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v54, 0, v122));
      objc_msgSend(v48, "addAction:", v56);

      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472;
      v119[2] = sub_1002B18B8;
      v119[3] = &unk_1011AE240;
      v57 = v48;
      v120 = v57;
      v121 = v55;
      v8 = objc_msgSend(v119, "copy");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002B18F4;
      block[3] = &unk_1011AC8B0;
      block[4] = self;
      v118 = v57;
      v58 = v57;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      break;
    case 22:
      v104 = self;
      location = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionRouteNameKey")));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Conversion failure title"), CFSTR("localized string not found"), 0));

      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (location)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Conversion failure named message"), CFSTR("localized string not found"), 0));
        v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v61, location));

      }
      else
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Conversion failure no name message"), CFSTR("localized string not found"), 0));
      }

      v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v100, v99, 1));
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
      v115[0] = _NSConcreteStackBlock;
      v115[1] = 3221225472;
      v115[2] = sub_1002B193C;
      v115[3] = &unk_1011AD960;
      v91 = v106;
      v116 = v91;
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v90, 1, v115));
      objc_msgSend(v88, "addAction:", v92);

      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionRouteStorageIDKey")));
      if (v93)
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Delete Route"), CFSTR("localized string not found"), 0));
        v113[0] = _NSConcreteStackBlock;
        v113[1] = 3221225472;
        v113[2] = sub_1002B194C;
        v113[3] = &unk_1011AD960;
        v114 = v91;
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v95, 2, v113));
        objc_msgSend(v88, "addAction:", v96);

      }
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472;
      v110[2] = sub_1002B195C;
      v110[3] = &unk_1011AE240;
      v97 = v88;
      v111 = v97;
      v112 = v91;
      v8 = objc_msgSend(v110, "copy");
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_1002B1998;
      v108[3] = &unk_1011AC8B0;
      v108[4] = v104;
      v109 = v97;
      v98 = v97;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v108);

      break;
    default:
      break;
  }
  v31 = objc_retainBlock(v8);

  return v31;
}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4 postAlertSearchType:(unsigned int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];

  v8 = a3;
  v9 = a4;
  if (!self->_displayingError)
  {
    self->_postAlertSearchType = a5;
    self->_displayingError = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v11 = v10;
    if (v8)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("kMapsInterruptionTitle"));
    if (v9)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("kMapsInterruptionMessage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v13 = v12;
    if (a5 == 1)
      v14 = 2;
    else
      v14 = 3;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002B1AF0;
    v15[3] = &unk_1011AFA20;
    v15[4] = self;
    objc_msgSend(v12, "interruptApplicationWithKind:userInfo:completionHandler:", v14, v11, v15);

  }
}

- (void)reportCurrentLocationFailure
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_isShowingCurrentLocationError
    && !-[InterruptionManager isShowingLocationServicesAlert](self, "isShowingLocationServicesAlert"))
  {
    self->_isShowingCurrentLocationError = 1;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Current Location Not Available"), CFSTR("localized string not found"), 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Your current location cannot be determined at this time."), CFSTR("localized string not found"), 0));
    -[InterruptionManager displayAlertWithTitle:message:postAlertSearchType:](self, "displayAlertWithTitle:message:postAlertSearchType:", v3, v5, 0);

  }
}

- (BOOL)isShowingLocationServicesAlert
{
  return self->_locationServicesAlertView != 0;
}

- (void)_locationAuthorizationDismissed:(id)a3
{
  void *v4;
  void (**locationServicesAlertDismissalBlock)(id, uint64_t);
  id v6;

  v6 = a3;
  if (self->_isShowingLocationServicesAuthorizationPrompt)
  {
    self->_isShowingLocationServicesAuthorizationPrompt = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("LocationAuthorizationDismissedNotification"), 0);

    locationServicesAlertDismissalBlock = (void (**)(id, uint64_t))self->_locationServicesAlertDismissalBlock;
    if (locationServicesAlertDismissalBlock)
      locationServicesAlertDismissalBlock[2](locationServicesAlertDismissalBlock, 1);
  }

}

- (UIViewController)chromeViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_locationServicesAlertDismissalBlock, 0);
  objc_storeStrong((id *)&self->_locationServicesAlertView, 0);
}

@end

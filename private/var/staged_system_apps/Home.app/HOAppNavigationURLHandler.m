@implementation HOAppNavigationURLHandler

- (HOAppNavigationURLHandler)initWithNavigator:(id)a3
{
  id v4;
  HOAppNavigationURLHandler *v5;
  HOAppNavigationURLHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HOAppNavigationURLHandler;
  v5 = -[HOAppNavigationURLHandler init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_navigator, v4);

  return v6;
}

- (HOAppNavigationURLHandler)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("initWithNavigator:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAppNavigationURLHandler.m"), 41, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOAppNavigationURLHandler init]",
    v6);

  return 0;
}

- (id)openURL:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSString *v30;
  id v31;
  uint8_t buf[4];
  id v33;

  v4 = a3;
  v5 = HFLogForCategory(70);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler received request to open URL: %@.", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("accessorytype"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathComponents"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hf_homeForURL:", v4));
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "home"));

    }
    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("climate")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
        v19 = objc_claimAutoreleasedReturnValue(+[HFAccessoryTypeGroup climateAccessoryTypeGroup](HFAccessoryTypeGroup, "climateAccessoryTypeGroup"));
LABEL_18:
        v20 = (id)v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "showAccessoryTypeGroup:forHome:animated:", v19, v15, 1));
LABEL_19:

        goto LABEL_31;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("lights")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
        v19 = objc_claimAutoreleasedReturnValue(+[HFAccessoryTypeGroup lightAccessoryTypeGroup](HFAccessoryTypeGroup, "lightAccessoryTypeGroup"));
        goto LABEL_18;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("media")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
        v19 = objc_claimAutoreleasedReturnValue(+[HFAccessoryTypeGroup mediaAccessoryTypeGroup](HFAccessoryTypeGroup, "mediaAccessoryTypeGroup"));
        goto LABEL_18;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("security")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
        v19 = objc_claimAutoreleasedReturnValue(+[HFAccessoryTypeGroup securityAccessoryTypeGroup](HFAccessoryTypeGroup, "securityAccessoryTypeGroup"));
        goto LABEL_18;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("water")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
        v19 = objc_claimAutoreleasedReturnValue(+[HFAccessoryTypeGroup waterAccessoryTypeGroup](HFAccessoryTypeGroup, "waterAccessoryTypeGroup"));
        goto LABEL_18;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("energy")))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_locationFromURL:](NSURL, "hf_locationFromURL:", v4));
        if (v18)
          objc_msgSend(v15, "hf_setTemporaryEnergyLocation:", v18);
        v20 = objc_msgSend(objc_alloc((Class)HFURLComponents), "initWithURL:", v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForParameter:", CFSTR("from")));
        +[HUEnergyAnalytics saveViewAccessedFromURLEvent:deepLinkFrom:](HUEnergyAnalytics, "saveViewAccessedFromURLEvent:deepLinkFrom:", 54, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[HFAccessoryTypeGroup energyAccessoryTypeGroup](HFAccessoryTypeGroup, "energyAccessoryTypeGroup"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "showAccessoryTypeGroup:forHome:animated:", v24, v15, 1));

        goto LABEL_19;
      }

    }
  }
  v10 = objc_msgSend(objc_alloc((Class)HFURLComponents), "initWithURL:", v4);
  if (objc_msgSend(v10, "destination"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler _openURLComponents:](self, "_openURLComponents:", v10));
  }
  else
  {
    v25 = HFLogForCategory(70);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler failed to open unsupported URL: %@.", buf, 0xCu);
    }

    v30 = NSURLErrorFailingURLErrorKey;
    v31 = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1002, v27));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v28));

  }
LABEL_31:

  return v21;
}

- (id)_openURLComponents:(id)a3
{
  id v4;
  HOAppNavigationURLHandler *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  HOAppNavigationURLHandler *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HOAppNavigationURLHandler *v28;
  void *v29;
  void *v30;
  void *v31;
  HOAppNavigationURLHandler *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  HOAppNavigationURLHandler *v49;
  void *v50;
  unsigned __int8 v51;
  char v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  HOAppNavigationURLHandler *v83;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  HOAppNavigationURLHandler *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  NSObject *v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  HOAppNavigationURLHandler *v102;
  uint64_t v103;
  NSObject *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  NSObject *v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  NSObject *v117;
  HOAppNavigationURLHandler *v118;
  HOAppNavigationURLHandler *v119;
  void *v120;
  void *v121;
  id v122;
  uint64_t v123;
  NSObject *v124;
  HOAppNavigationURLHandler *v125;
  uint64_t v126;
  NSObject *v127;
  void *v129;
  _QWORD v130[4];
  HOAppNavigationURLHandler *v131;
  HOAppNavigationURLHandler *v132;
  id v133;
  char v134;
  _QWORD v135[4];
  HOAppNavigationURLHandler *v136;
  HOAppNavigationURLHandler *v137;
  id v138;
  _QWORD v139[4];
  HOAppNavigationURLHandler *v140;
  id v141;
  _QWORD v142[4];
  HOAppNavigationURLHandler *v143;
  HOAppNavigationURLHandler *v144;
  id v145;
  _QWORD v146[4];
  id v147;
  uint8_t buf[4];
  HOAppNavigationURLHandler *v149;
  __int16 v150;
  const char *v151;
  __int16 v152;
  HOAppNavigationURLHandler *v153;
  __int16 v154;
  HOAppNavigationURLHandler *v155;

  v4 = a3;
  v5 = (HOAppNavigationURLHandler *)objc_alloc_init((Class)NAFuture);
  v6 = objc_msgSend(v4, "destination");
  switch((unint64_t)v6)
  {
    case 0xBuLL:
      v7 = HFLogForCategory(70);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Resident Device View.", buf, 2u);
      }

      v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler showAboutResidentDeviceView](v9, "showAboutResidentDeviceView"));
      goto LABEL_84;
    case 0xCuLL:
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "homeManager"));
      v36 = objc_alloc((Class)NSUUID);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsHome));
      v38 = objc_msgSend(v36, "initWithUUIDString:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "hf_homeWithIdentifier:", v38));
      v40 = v39;
      if (v39)
      {
        v9 = v39;
      }
      else
      {
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "home"));

      }
      v107 = HFLogForCategory(70);
      v108 = objc_claimAutoreleasedReturnValue(v107);
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v149 = v9;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Face Recognition Settings for home %@.", buf, 0xCu);
      }

      v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler showFaceRecognitionSettingsForHome:](v28, "showFaceRecognitionSettingsForHome:", v9));

      goto LABEL_83;
    case 0xDuLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeManager"));
      v13 = objc_alloc((Class)NSUUID);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsHome));
      v15 = objc_msgSend(v13, "initWithUUIDString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hf_homeWithIdentifier:", v15));
      v17 = v16;
      if (v16)
      {
        v9 = v16;
      }
      else
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "home"));

      }
      v96 = HFLogForCategory(70);
      v97 = objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v149 = v9;
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Network Settings for home %@.", buf, 0xCu);
      }

      v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler showNetworkSettingsForHome:](v28, "showNetworkSettingsForHome:", v9));

      goto LABEL_83;
    case 0xEuLL:
      v41 = objc_alloc((Class)NSUUID);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsHome));
      v9 = (HOAppNavigationURLHandler *)objc_msgSend(v41, "initWithUUIDString:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "homeManager"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "hf_homeWithIdentifier:", v9));
      v46 = v45;
      if (v45)
      {
        v28 = v45;
      }
      else
      {
        v109 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "home"));

      }
      v110 = HFLogForCategory(70);
      v111 = objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v149 = v28;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to show firmware updates for home: %@", buf, 0xCu);
      }

      v112 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "showSoftwareUpdateForHome:", v28));

      goto LABEL_83;
    case 0xFuLL:
      v47 = HFLogForCategory(70);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
        *(_DWORD *)buf = 138412290;
        v149 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to add accessory: %@.", buf, 0xCu);

      }
      v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler addAccessoryWithURL:](v9, "addAccessoryWithURL:", v28));

      goto LABEL_83;
    case 0x10uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
      if ((unint64_t)objc_msgSend(v19, "length") < 2)
      {
        v9 = 0;
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
        v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringFromIndex:", 1));

      }
      v82 = objc_msgSend(objc_alloc((Class)HMFMACAddress), "initWithMACAddressString:", v9);
      v83 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "formattedString"));

      v84 = HFLogForCategory(70);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v149 = v83;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to reprovision device for deviceIdentifier %@.", buf, 0xCu);
      }

      v86 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allHomesFuture"));
      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472;
      v142[2] = sub_100022500;
      v142[3] = &unk_1000B6500;
      v143 = v83;
      v144 = self;
      v145 = v4;
      v28 = v83;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "flatMap:", v142));

      goto LABEL_83;
    case 0x12uLL:
      v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", CFSTR("sender")));
      if (!v9)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@&sender="), HFHomePrivateURLScheme, CFSTR("installhomepodprofile")));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "absoluteString"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "uppercaseString"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "uppercaseString"));
        v60 = objc_msgSend(v58, "hasPrefix:", v59);

        if (v60)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "absoluteString"));
          v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "substringFromIndex:", objc_msgSend(v55, "length")));

        }
        else
        {
          v9 = 0;
        }

      }
      v126 = HFLogForCategory(70);
      v127 = objc_claimAutoreleasedReturnValue(v126);
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v149 = v9;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to install Homepod profile: %@.", buf, 0xCu);
      }

      v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler showHomePodProfileInstallationFlowWithSender:](v28, "showHomePodProfileInstallationFlowWithSender:", v9));

      goto LABEL_83;
    case 0x13uLL:
      v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", CFSTR("sender")));
      v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsHomeID));
      if (v28)
      {
        v63 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v28);
        if (v63)
        {
          v129 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "homeManager"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "homes"));
          v146[0] = _NSConcreteStackBlock;
          v146[1] = 3221225472;
          v146[2] = sub_1000224BC;
          v146[3] = &unk_1000B5E18;
          v66 = v63;
          v147 = v66;
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "na_firstObjectPassingTest:", v146));

          v63 = v66;
          goto LABEL_47;
        }
      }
      else
      {
        v63 = 0;
      }
      v67 = 0;
LABEL_47:
      v88 = HFLogForCategory(70);
      v89 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        v90 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "name"));
        *(_DWORD *)buf = 138412546;
        v149 = v90;
        v150 = 2112;
        v151 = (const char *)v9;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to show HomePod software updates for home: %@ , sender:%@", buf, 0x16u);

      }
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "showSoftwareUpdateForHome:", v67));

LABEL_83:
      v5 = v28;
LABEL_84:

      return v10;
    case 0x16uLL:
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "homeManager"));
      v70 = objc_alloc((Class)NSUUID);
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsHomeID));
      v72 = objc_msgSend(v70, "initWithUUIDString:", v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "hf_homeWithIdentifier:", v72));
      v74 = v73;
      if (v73)
      {
        v9 = v73;
      }
      else
      {
        v113 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "home"));

      }
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", CFSTR("showEnablementSheet")));
      v115 = objc_msgSend(v114, "BOOLValue");

      v116 = HFLogForCategory(70);
      v117 = objc_claimAutoreleasedReturnValue(v116);
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        v118 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
        *(_DWORD *)buf = 138412290;
        v149 = v118;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Personal Requests Enablement: %@.", buf, 0xCu);

      }
      v119 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler showSiriPersonalRequestsSettingsForHome:showEnablementSheet:](v119, "showSiriPersonalRequestsSettingsForHome:showEnablementSheet:", v9, v115));

      goto LABEL_77;
    case 0x17uLL:
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "homeManager"));
      v77 = objc_alloc((Class)NSUUID);
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsHomeID));
      v79 = objc_msgSend(v77, "initWithUUIDString:", v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "hf_homeWithIdentifier:", v79));
      v81 = v80;
      if (v80)
      {
        v9 = v80;
      }
      else
      {
        v120 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "home"));

      }
      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", CFSTR("showEnablementSheet")));
      v122 = objc_msgSend(v121, "BOOLValue");

      v123 = HFLogForCategory(70);
      v124 = objc_claimAutoreleasedReturnValue(v123);
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        v125 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
        *(_DWORD *)buf = 138412290;
        v149 = v125;
        _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Recognize My Voice Enablement: %@.", buf, 0xCu);

      }
      v119 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler showRecognizeMyVoiceSettingsForHome:showEnablementSheet:](v119, "showRecognizeMyVoiceSettingsForHome:showEnablementSheet:", v9, v122));

LABEL_77:
      v5 = v119;
      goto LABEL_84;
    case 0x1BuLL:
      v22 = objc_alloc((Class)NSUUID);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsHomeID));
      v9 = (HOAppNavigationURLHandler *)objc_msgSend(v22, "initWithUUIDString:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "homeManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hf_homeWithIdentifier:", v9));
      v27 = v26;
      if (v26)
      {
        v28 = v26;
      }
      else
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "home"));

      }
      v99 = objc_alloc((Class)NSUUID);
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsAccessoryID));
      v101 = objc_msgSend(v99, "initWithUUIDString:", v100);

      v102 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler hf_accessoryWithIdentifier:](v28, "hf_accessoryWithIdentifier:", v101));
      v103 = HFLogForCategory(70);
      v104 = objc_claimAutoreleasedReturnValue(v103);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v149 = v102;
        v150 = 2112;
        v151 = (const char *)v28;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler handling request to open Drop In UI for accessory %@ in home %@.", buf, 0x16u);
      }

      v105 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "showDropInUI:home:", v102, v28));

      goto LABEL_83;
    case 0x1EuLL:
      v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsUserDetails));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v28 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "home"));

      if (-[HOAppNavigationURLHandler length](v9, "length"))
      {
        objc_initWeak((id *)buf, self);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "userFutureWithUniqueIdentifierStr:", v9));
        v139[0] = _NSConcreteStackBlock;
        v139[1] = 3221225472;
        v139[2] = sub_100022A14;
        v139[3] = &unk_1000B6528;
        objc_copyWeak(&v141, (id *)buf);
        v32 = v9;
        v140 = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "flatMap:", v139));
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472;
        v135[2] = sub_100022B2C;
        v135[3] = &unk_1000B6550;
        objc_copyWeak(&v138, (id *)buf);
        v9 = v32;
        v136 = v9;
        v28 = v28;
        v137 = v28;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "recover:", v135));

        objc_destroyWeak(&v138);
        objc_destroyWeak(&v141);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v92 = HFLogForCategory(70);
        v93 = objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v149 = self;
          v150 = 2080;
          v151 = "-[HOAppNavigationURLHandler _openURLComponents:]";
          v152 = 2112;
          v153 = v9;
          v154 = 2112;
          v155 = v28;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "(%@:%s) Couldn't find userUniqueIdentifier %@. Showing current home setting %@.", buf, 0x2Au);
        }

        v94 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler navigator](self, "navigator"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "showHomeSettingsForHome:", v28));

      }
      goto LABEL_83;
    default:
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForParameter:", HFURLComponentsFromHUIS));
      v51 = objc_msgSend(v50, "BOOLValue");

      if (v6 == (id)29 || v6 == (id)20)
        v53 = 1;
      else
        v53 = v51;
      v9 = (HOAppNavigationURLHandler *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
      if ((v51 & 1) == 0 && v6 != (id)20 && v6 != (id)29)
      {
        v54 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", &stru_1000B6590));

        v9 = (HOAppNavigationURLHandler *)v54;
      }
      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472;
      v130[2] = sub_100022CEC;
      v130[3] = &unk_1000B66B0;
      v134 = v53;
      v132 = self;
      v133 = v6;
      v131 = (HOAppNavigationURLHandler *)v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler flatMap:](v9, "flatMap:", v130));

      v5 = v131;
      goto LABEL_84;
  }
}

- (id)openApplicationURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)HFURLComponents), "initWithURL:", v4);
  if (objc_msgSend(v5, "destination"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[HOAppNavigationURLHandler _openURLComponents:](self, "_openURLComponents:", v5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1002, &__NSDictionary0__struct));
    v6 = objc_alloc_init((Class)NAFuture);
    if ((+[HFUtilities isAMac](HFUtilities, "isAMac") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10002487C;
      v12[3] = &unk_1000B66D8;
      v13 = v4;
      v14 = v6;
      v15 = v7;
      objc_msgSend(v8, "openURL:withCompletionHandler:", v13, v12);

    }
    else
    {
      v9 = HFLogForCategory(70);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "HOAppNavigationURLHandler failed to open application URL: %@.", buf, 0xCu);
      }

      objc_msgSend(v6, "finishWithError:", v7);
    }

  }
  return v6;
}

- (id)notificationCenter:(id)a3 presentNotificationWithObjectURL:(id)a4
{
  return -[HOAppNavigationURLHandler openURL:](self, "openURL:", a4);
}

- (void)notificationCenter:(id)a3 presentCustomSettingsForNotificationWithObjectURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  HOAppNavigationURLHandler *v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeFuture"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100024A28;
  v10[3] = &unk_1000B6728;
  v11 = v5;
  v12 = self;
  v8 = v5;
  v9 = objc_msgSend(v7, "addSuccessBlock:", v10);

}

- (unint64_t)lockOnboardingTypeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("all")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("walletkey")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("pincode")))
        v4 = 0;
      else
        v4 = 3;
    }
    else
    {
      v4 = 2;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_startDateForURLComponents:(id)a3
{
  return _objc_msgSend(a3, "dateForParameter:", HFURLComponentsStartDate);
}

- (id)_endDateForURLComponents:(id)a3
{
  return _objc_msgSend(a3, "dateForParameter:", HFURLComponentsEndDate);
}

- (HOAppNavigator)navigator
{
  return (HOAppNavigator *)objc_loadWeakRetained((id *)&self->_navigator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigator);
}

@end

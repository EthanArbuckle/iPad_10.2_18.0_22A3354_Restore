@implementation BKUserActivityManager

- (void)willEnterForeground
{
  self->_isInBackground = 0;
  -[NSUserActivity becomeCurrent](self->_currentActivity, "becomeCurrent");
}

+ (id)sharedInstance
{
  if (qword_1009F4EB0 != -1)
    dispatch_once(&qword_1009F4EB0, &stru_1008E9D78);
  return (id)qword_1009F4EA8;
}

- (void)startReadingAsset:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BKUserActivityManager *v12;
  unint64_t v13;

  v4 = a3;
  v5 = self->_generation + 1;
  self->_generation = v5;
  if (objc_msgSend(v4, "isValid")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C6044;
    v10[3] = &unk_1008E9E18;
    v11 = v7;
    v12 = self;
    v13 = v5;
    v9 = v7;
    objc_msgSend(v8, "performBackgroundReadOnlyBlock:", v10);

  }
  else
  {
    -[BKUserActivityManager setCurrentActivity:](self, "setCurrentActivity:", 0);
  }

}

- (void)stopReadingCurrentAsset
{
  ++self->_generation;
  -[BKUserActivityManager setCurrentActivity:](self, "setCurrentActivity:", 0);
}

- (BOOL)willContinueActivityWithType:(id)a3 sceneController:(id)a4
{
  id v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[2];

  v5 = a3;
  v6 = objc_msgSend(a4, "willContinueActivityWithType:sceneController:", v5, a4);
  v11[0] = CFSTR("com.apple.iBooks.assetReading");
  v11[1] = CSSearchableItemActionType;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = v7;
  v9 = (v6 & 1) != 0 || v5 && objc_msgSend(v7, "containsObject:", v5);

  return v9;
}

- (id)sceneManager
{
  return +[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager");
}

- (BOOL)continueActivity:(id)a3 sceneController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  id v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  void *i;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  NSMutableDictionary *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  unsigned int v79;
  void *v80;
  void *v81;
  BOOL v82;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  id v93;
  NSObject *v94;
  uint64_t v95;
  void *j;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v110;
  BKUserActivityManager *v111;
  BKUserActivityManager *v112;
  NSObject *obj;
  _QWORD v114[4];
  void *v115;
  BKUserActivityManager *v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _QWORD v132[2];
  uint8_t v133[128];
  uint8_t buf[4];
  void *v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;

  v6 = a3;
  v7 = a4;
  v8 = BCSceneLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scene"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentIdentifier"));
    *(_DWORD *)buf = 138543874;
    v135 = v10;
    v136 = 2112;
    v137 = v11;
    v138 = 2114;
    v139 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "activityManager continueActivity: activityType=%{public}@, userInfo=%@, withSceneID=%{public}@", buf, 0x20u);

  }
  if (v7 && (objc_msgSend(v7, "continueActivity:sceneController:", v6, v7) & 1) != 0)
    goto LABEL_59;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.iBooks.assetReading"));

  if (v16)
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("assetID")));
LABEL_48:
    v47 = 0;
    goto LABEL_49;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v20 = objc_msgSend(v19, "isEqualToString:", CSSearchableItemActionType);

  if (v20)
  {
    v21 = objc_opt_class(NSString);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CSSearchableItemActivityIdentifier));
    v24 = BUDynamicCast(v21, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    if (!objc_msgSend(v25, "hasPrefix:", CFSTR("NSUA:")))
    {
      v17 = v25;
      v47 = 0;
      v18 = v17;
LABEL_49:

      goto LABEL_50;
    }
    v111 = self;
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringFromIndex:", objc_msgSend(CFSTR("NSUA:"), "length")));
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v132[0] = CFSTR("com.apple.iBooks.openBook");
    v132[1] = CFSTR("com.apple.iBooks.playAudiobook");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v132, 2));
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v127;
LABEL_11:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v127 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * v32), "stringByAppendingString:", CFSTR(".")));
        if ((objc_msgSend(v27, "hasPrefix:", v33) & 1) != 0)
          break;

        if (v30 == (id)++v32)
        {
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v126, v133, 16);
          if (v30)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "substringFromIndex:", objc_msgSend(v33, "length")));

      self = v111;
      v17 = v26;
      if (v18)
        goto LABEL_47;
    }
    else
    {
LABEL_17:

      self = v111;
      v17 = v26;
    }
    v60 = BooksSiriLog(v34);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_10069F528();

    v18 = 0;
    goto LABEL_47;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("INPlayMediaIntent"));

  if (v36)
  {
    v37 = objc_opt_class(INPlayMediaIntent);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interaction"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "intent"));
    v40 = BUDynamicCast(v37, v39);
    v17 = (id)objc_claimAutoreleasedReturnValue(v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaItems"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lastObject"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    v43 = objc_msgSend(v42, "length");

    if (v43)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      v46 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v45));

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bu_assetIDFromURL](v46, "bu_assetIDFromURL"));
    }
    else
    {
      v62 = BCSceneLog(v44);
      v46 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_10069F588(v46, v63, v64, v65, v66, v67, v68, v69);
      v18 = 0;
    }

LABEL_47:
    goto LABEL_48;
  }
  v48 = objc_msgSend(v6, "isClassKitDeepLink");
  if ((_DWORD)v48)
  {
    v49 = BCSceneLog(v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "activityManager handling ClassKit Activity", buf, 2u);
    }

    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    if (v17)
    {
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextIdentifierPath"));
      v52 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
      v110 = v17;
      v112 = self;
      v109 = v7;
      if (v52)
      {
        v53 = v52;
        v54 = v51;
        v55 = *(_QWORD *)v123;
        do
        {
          for (i = 0; i != v53; i = (char *)i + 1)
          {
            if (*(_QWORD *)v123 != v55)
              objc_enumerationMutation(v54);
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR(":")));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));
            if (objc_msgSend(v58, "isEqualToString:", CFSTR("bookAssetID")))
            {
              v59 = objc_msgSend(v57, "count");

              if ((unint64_t)v59 > 1)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndex:", 1));

                goto LABEL_65;
              }
            }
            else
            {

            }
          }
          v53 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
        }
        while (v53);
        v18 = 0;
LABEL_65:
        v17 = v110;
        self = v112;
        v51 = v54;
        v7 = v109;
      }
      else
      {
        v18 = 0;
      }

      if (objc_msgSend(v18, "length"))
      {
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        obj = v51;
        v92 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
        if (v92)
        {
          v93 = v92;
          v94 = v51;
          v95 = *(_QWORD *)v119;
          while (2)
          {
            for (j = 0; j != v93; j = (char *)j + 1)
            {
              if (*(_QWORD *)v119 != v95)
                objc_enumerationMutation(obj);
              v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)j), "componentsSeparatedByString:", CFSTR(":")));
              v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "firstObject"));
              if (objc_msgSend(v98, "isEqualToString:", v18))
              {
                v99 = objc_msgSend(v97, "count");

                if ((unint64_t)v99 >= 2)
                {
                  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectAtIndex:", 1));
                  if (objc_msgSend(v108, "length"))
                    v47 = objc_msgSend(objc_alloc((Class)BKAnchorPathLocation), "initWithPath:", v108);
                  else
                    v47 = 0;
                  v17 = v110;
                  v51 = v94;

                  self = v112;
                  goto LABEL_88;
                }
              }
              else
              {

              }
            }
            v93 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
            if (v93)
              continue;
            break;
          }
          v47 = 0;
          v17 = v110;
          self = v112;
          v51 = v94;
LABEL_88:
          v7 = v109;
        }
        else
        {
          v47 = 0;
          self = v112;
        }
      }
      else
      {
        v100 = BCSceneLog(0);
        obj = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          sub_10069F5E8(obj, v101, v102, v103, v104, v105, v106, v107);
        v47 = 0;
      }

    }
    else
    {
      v84 = BCSceneLog(0);
      v51 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_10069F5B8(v51, v85, v86, v87, v88, v89, v90, v91);
      v47 = 0;
      v18 = 0;
    }

    goto LABEL_49;
  }
  v47 = 0;
  v18 = 0;
LABEL_50:
  v70 = objc_msgSend(v18, "length");
  if (v70)
  {
    v71 = BCSceneLog(v70);
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v135 = v18;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Handling incoming assetID to continue user activity: %@", buf, 0xCu);
    }

    v73 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v74 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "appLaunchCoordinator"));

    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_1000C75E4;
    v114[3] = &unk_1008E9E68;
    v115 = v18;
    v116 = self;
    v117 = v47;
    v75 = v47;
    v76 = v18;
    -[NSMutableDictionary appLaunchCoordinatorOnConditionMask:blockID:performBlock:](v74, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 65, CFSTR("Handle incoming asset continueActivity"), v114);

    v77 = v115;
  }
  else
  {
    -[BKUserActivityManager setHoldAtLaunchScreenAssertion:](self, "setHoldAtLaunchScreenAssertion:", 0);

    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
    v79 = objc_msgSend(v78, "isEqualToString:", NSUserActivityTypeBrowsingWeb);

    if (!v79)
    {
      v82 = 0;
      goto LABEL_60;
    }
    v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "webpageURL"));
    v74 = objc_opt_new(NSMutableDictionary);
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sourceApplication"));

    if (v80)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sourceApplication"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v74, "setObject:forKeyedSubscript:", v81, UIApplicationOpenURLOptionsSourceApplicationKey);

    }
    v75 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v77 = -[NSMutableDictionary copy](v74, "copy");
    objc_msgSend(v75, "applicationOpenURL:options:sceneController:", v76, v77, 0);
  }

LABEL_59:
  v82 = 1;
LABEL_60:

  return v82;
}

- (void)_continueOpenBookActivity:(id)a3 sceneController:(id)a4 location:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  BKUserActivityManager *v22;
  unsigned __int8 v23;
  _QWORD v24[3];
  _QWORD v25[3];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appLaunchCoordinator"));

  v13 = objc_msgSend(v12, "appLaunchCoordinatorHasAppLaunched");
  v24[0] = CFSTR("BKBookPresentingUseLargeCoverIfNeeded");
  v24[1] = AEAudiobookOptionsShouldNotAutoplayKey;
  v25[0] = &__kCFBooleanTrue;
  v25[1] = &__kCFBooleanFalse;
  v24[2] = CFSTR("BKBookPresentingFromUserActivity");
  v25[2] = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3));
  v15 = objc_msgSend(v14, "mutableCopy");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKUserActivityManager sceneManager](self, "sceneManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bookPresenter"));

  v18 = objc_msgSend(v9, "newShowAssetTransaction");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C7BBC;
  v20[3] = &unk_1008E9E90;
  v21 = v12;
  v22 = self;
  v23 = v13;
  v19 = v12;
  objc_msgSend(v17, "showAssetWithTransaction:assetID:location:options:completion:", v18, v10, v8, v15, v20);

}

- (void)setCurrentActivity:(id)a3
{
  NSUserActivity *v4;
  NSUserActivity *currentActivity;
  NSUserActivity *v6;

  v4 = (NSUserActivity *)a3;
  -[NSUserActivity resignCurrent](self->_currentActivity, "resignCurrent");
  currentActivity = self->_currentActivity;
  self->_currentActivity = v4;
  v6 = v4;

  -[NSUserActivity becomeCurrent](self->_currentActivity, "becomeCurrent");
}

- (void)didEnterBackground
{
  self->_isInBackground = 1;
  -[NSUserActivity resignCurrent](self->_currentActivity, "resignCurrent");
}

- (id)_persistentIdentifierForPlayAudiobookActivityWithAssetID:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.iBooks.playAudiobook"), a3);
}

- (id)_persistentIdentifierForOpenBookActivityAsset:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.iBooks.openBook"), a3);
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (void)setIsInBackground:(BOOL)a3
{
  self->_isInBackground = a3;
}

- (NSUserActivity)currentActivity
{
  return self->_currentActivity;
}

- (BUAssertion)holdAtLaunchScreenAssertion
{
  return self->_holdAtLaunchScreenAssertion;
}

- (void)setHoldAtLaunchScreenAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_holdAtLaunchScreenAssertion, a3);
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdAtLaunchScreenAssertion, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
}

@end

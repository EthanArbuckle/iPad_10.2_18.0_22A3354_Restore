@implementation ICWindowSceneDelegate

- (void)reportReferralDataFromSceneConnectionOptions:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "sourceApplication"));
  v5 = objc_opt_class(NSString, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "sourceApplication"));
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URLContexts"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URLContexts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));

    goto LABEL_14;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "handoffUserActivityType"));

  if (v13)
  {
    v14 = ICNAInbountURLComponentUserActivity;
    v15 = ICNAInbountURLComponentHandoff;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "handoffUserActivityType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/%@"), v14, v15, v16));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));

LABEL_13:
    goto LABEL_14;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "userActivities"));
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = ICNAInbountURLComponentUserActivity;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "userActivities"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "anyObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v20, v22));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v23));

LABEL_12:
    goto LABEL_13;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "shortcutItem"));

  if (v24)
  {
    v25 = ICNAInbountURLComponentShortcutItem;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "shortcutItem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "type"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v25, v21));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v26));

    goto LABEL_12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cloudKitShareMetadata"));

  if (v12)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", kICNACloudKitShareReferralURL));
LABEL_14:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "analyticsController"));
  objc_msgSend(v28, "addReferralDataWithReferringInboundURL:referringApplication:", v12, v7);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ICWindowStateArchive *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  ICViewControllerManager *v46;
  id v47;
  ICViewControllerManager *v48;
  void **v49;
  uint64_t v50;
  void (*v51)(uint64_t);
  void *v52;
  id v53;
  ICWindowSceneDelegate *v54;
  id v55;
  ICViewControllerManager *v56;
  const __CFString *v57;
  void *v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  int v62;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[ICWindowSceneDelegate scene:willConnectToSession:options:]";
    v61 = 1024;
    v62 = 94;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate sessionIdentifierToStateRestorationActivity](self, "sessionIdentifierToStateRestorationActivity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stateRestorationActivity"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentIdentifier"));
  objc_msgSend(v12, "ic_setNonNilObject:forNonNilKey:", v13, v14);

  v57 = CFSTR("ICSessionSceneHasBecomeForegroundKey");
  v58 = &__kCFBooleanFalse;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  objc_msgSend(v8, "setUserInfo:", v15);

  v17 = objc_opt_class(UIWindowScene, v16);
  v18 = ICDynamicCast(v17, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "screen"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "displayIdentity"));
  LODWORD(v14) = objc_msgSend(v21, "expectsSecureRendering");

  if ((_DWORD)v14)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICWindowSceneDelegate scene:willConnectToSession:options:]", 1, 0, CFSTR("Trying to show secure screen with non-secure window scene delegate"));
    goto LABEL_28;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v23 = objc_msgSend(v22, "isRunningPPT");

  if ((v23 & 1) != 0
    || (v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo")),
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arguments")),
        v26 = objc_msgSend(v25, "indexOfObjectPassingTest:", &stru_100552148),
        v25,
        v24,
        v26 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v32 = (ICWindowStateArchive *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate archiveForLaunchingPPT](self, "archiveForLaunchingPPT"));
    v33 = 1;
    if (!v32)
    {
LABEL_13:
      v32 = objc_alloc_init(ICWindowStateArchive);
      -[ICWindowStateArchive setCurrentNoteContainerViewMode:](v32, "setCurrentNoteContainerViewMode:", 0);
      goto LABEL_14;
    }
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceApplication"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stateRestorationActivity"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ICCanvasStateArchiveKey")));

    if (v30)
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveFromDictionary:](ICWindowStateArchive, "windowStateArchiveFromDictionary:", v30));
    else
      v31 = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userActivities"));
    v32 = (ICWindowStateArchive *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate archiveForUserActivities:isSourceApplicationExternal:lastSavedArchive:](self, "archiveForUserActivities:isSourceApplicationExternal:lastSavedArchive:", v36, v27 != 0, v31));

    v33 = 0;
    if (!v32)
      goto LABEL_13;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[ICExpansionState sharedExpansionState](ICExpansionState, "sharedExpansionState"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive expansionState](v32, "expansionState"));
  objc_msgSend(v34, "applyArchiveDictionary:", v35);

LABEL_14:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
  v39 = objc_msgSend(v38, "isEqualToString:", off_1005CCF48);

  if (v39)
    -[ICWindowStateArchive setIsAuxiliaryWindow:](v32, "setIsAuxiliaryWindow:", 1);
  if (-[ICWindowStateArchive isAuxiliaryWindow](v32, "isAuxiliaryWindow"))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activationConditions"));
    objc_msgSend(v41, "setCanActivateForTargetContentIdentifierPredicate:", v40);

  }
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sizeRestrictions"));
    objc_msgSend(v42, "setMinimumSize:", 488.0, 488.0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sizeRestrictions"));
    objc_msgSend(v43, "setMaximumSize:", 1600.0, 900.0);

  }
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
  {
    v44 = 3;
  }
  else if (sub_10009AABC())
  {
    -[ICWindowStateArchive setHostApplicationIdentifier:](v32, "setHostApplicationIdentifier:", ICNoteMathNotesHostApplicationIdentifier);
    v44 = 1;
  }
  else
  {
    v44 = 0;
  }
  v45 = objc_msgSend(objc_alloc((Class)ICWindow), "initWithWindowScene:behavior:", v19, v44);
  v46 = objc_alloc_init(ICViewControllerManager);
  v49 = _NSConcreteStackBlock;
  v50 = 3221225472;
  v51 = sub_10007D80C;
  v52 = &unk_100550098;
  v47 = v9;
  v53 = v47;
  v54 = self;
  v55 = v19;
  v48 = v46;
  v56 = v48;
  -[ICViewControllerManager setupWithWindow:stateRestoreArchive:completion:](v48, "setupWithWindow:stateRestoreArchive:completion:", v45, v32, &v49);
  objc_msgSend(v45, "setViewControllerManager:", v48, v49, v50, v51, v52);
  objc_msgSend(v45, "makeKeyAndVisible");
  if (((v33 | +[ICUtilities isInternalInstall](ICUtilities, "isInternalInstall") ^ 1) & 1) == 0)
    objc_msgSend(v45, "setUpDebugStatusWindow");
  -[ICWindowSceneDelegate setIcWindow:](self, "setIcWindow:", v45);
  -[ICWindowSceneDelegate reportReferralDataFromSceneConnectionOptions:](self, "reportReferralDataFromSceneConnectionOptions:", v47);

LABEL_28:
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[ICNAWindowSceneReportingManager sharedManager](ICNAWindowSceneReportingManager, "sharedManager"));
  objc_msgSend(v7, "windowSceneMayBeResized:", v6);

}

- (void)setIcWindow:(id)a3
{
  objc_storeStrong((id *)&self->_icWindow, a3);
}

- (NSMutableDictionary)sessionIdentifierToStateRestorationActivity
{
  return self->_sessionIdentifierToStateRestorationActivity;
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;

  v3 = a3;
  v4 = objc_opt_class(UIWindowScene);
  v5 = ICDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  v8 = ICNASessionTypeNotes;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10007D908;
  v15 = &unk_100550110;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v7, "startWindowSceneSessionWithType:windowScene:successHandler:", v8, v9, &v12);

  v17 = CFSTR("ICSessionSceneHasBecomeForegroundKey");
  v18 = &__kCFBooleanTrue;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1, v12, v13, v14, v15));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));

  objc_msgSend(v11, "setUserInfo:", v10);
  objc_msgSend(UIApp, "setApplicationIconBadgeNumber:", 0);

}

- (void)sceneDidBecomeActive:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[ICWindowSceneDelegate sceneDidBecomeActive:]";
    v6 = 1024;
    v7 = 230;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }

}

- (void)makeKeyWindowWhenTransitioningFromCoverSheet
{
  void *v3;
  NSObject *v4;
  NSObject *sceneDidDisconnectNotificationToken;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000808B8;
  v6[3] = &unk_100552230;
  objc_copyWeak(&v7, &location);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", UISceneDidDisconnectNotification, 0, 0, v6));
  sceneDidDisconnectNotificationToken = self->_sceneDidDisconnectNotificationToken;
  self->_sceneDidDisconnectNotificationToken = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (ICWindowSceneDelegate)init
{
  ICWindowSceneDelegate *v2;
  uint64_t v3;
  NSMutableDictionary *sessionIdentifierToStateRestorationActivity;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICWindowSceneDelegate;
  v2 = -[ICWindowSceneDelegate init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sessionIdentifierToStateRestorationActivity = v2->_sessionIdentifierToStateRestorationActivity;
    v2->_sessionIdentifierToStateRestorationActivity = (NSMutableDictionary *)v3;

    -[ICWindowSceneDelegate makeKeyWindowWhenTransitioningFromCoverSheet](v2, "makeKeyWindowWhenTransitioningFromCoverSheet");
  }
  return v2;
}

- (id)archiveForLaunchingPPT
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  char v18;
  int v19;
  ICWindowStateArchive *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;

  v2 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_10001ABE0(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v11 = objc_msgSend(v10, "isRunningPPT");

  if ((v11 & 1) == 0)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ICAppDelegate.sharedInstance.isRunningPPT", "-[ICWindowSceneDelegate archiveForLaunchingPPT]", 1, 0, CFSTR("should only call this for launching in PPT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("launchToFolderList"));

  if (v13)
  {
    v14 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_10001AC50();

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("launchToNotesList"));

  if (v16)
  {
    v17 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_100407BD0();
  }
  else
  {
    if ((v13 & 1) != 0)
    {
      v18 = 1;
      v19 = 1;
      goto LABEL_17;
    }
    v17 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_100407BFC();
  }

  v19 = 0;
  v18 = v16;
LABEL_17:
  v20 = objc_alloc_init(ICWindowStateArchive);
  -[ICWindowStateArchive setCurrentNoteContainerViewMode:](v20, "setCurrentNoteContainerViewMode:", 0);
  if (v19)
    -[ICWindowStateArchive setIsPrimaryContentVisible:](v20, "setIsPrimaryContentVisible:", 1);
  if (v16)
    -[ICWindowStateArchive setIsSupplementaryContentVisible:](v20, "setIsSupplementaryContentVisible:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "managedObjectContext"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v22));

  if (v23 && (!v19 || +[UIDevice ic_isiPad](UIDevice, "ic_isiPad")))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URIRepresentation"));
    v39 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    -[ICWindowStateArchive setCurrentContainerObjectIDURLs:](v20, "setCurrentContainerObjectIDURLs:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "URIRepresentation"));
    -[ICWindowStateArchive setCurrentObjectIDURL:](v20, "setCurrentObjectIDURL:", v28);

  }
  if ((v18 & 1) == 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICApplicationTestingHelper sharedHelper](ICApplicationTestingHelper, "sharedHelper"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "testNoteIdentifier"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "managedObjectContext"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:includeDeleted:context:](ICNote, "noteWithIdentifier:includeDeleted:context:", v30, 0, v32));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "URIRepresentation"));
    -[ICWindowStateArchive setCurrentNoteObjectIDURL:](v20, "setCurrentNoteObjectIDURL:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "URIRepresentation"));
    -[ICWindowStateArchive setCurrentObjectIDURL:](v20, "setCurrentObjectIDURL:", v37);

    -[ICWindowStateArchive setIsPrimaryContentVisible:](v20, "setIsPrimaryContentVisible:", 0);
    -[ICWindowStateArchive setIsSupplementaryContentVisible:](v20, "setIsSupplementaryContentVisible:", 0);

  }
  return v20;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate sceneDidDisconnectNotificationToken](self, "sceneDidDisconnectNotificationToken"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate sceneDidDisconnectNotificationToken](self, "sceneDidDisconnectNotificationToken"));
    objc_msgSend(v4, "removeObserver:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)ICWindowSceneDelegate;
  -[ICWindowSceneDelegate dealloc](&v6, "dealloc");
}

- (ICViewControllerManager)viewControllerManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate icWindow](self, "icWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllerManager"));

  return (ICViewControllerManager *)v3;
}

- (id)nextResponder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyboardHandler"));

  return v3;
}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v5, "updateSceneTitle:", v4);

  v6 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ICWindowSceneDelegate sceneWillResignActive:]";
    v9 = 1024;
    v10 = 236;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v7, 0x12u);
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[ICWindowSceneDelegate sceneDidEnterBackground:]";
    v12 = 1024;
    v13 = 241;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v10, 0x12u);
  }

  v5 = objc_opt_class(UIWindowScene);
  v6 = ICDynamicCast(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAWindowSceneReportingManager sharedManager](ICNAWindowSceneReportingManager, "sharedManager"));
  objc_msgSend(v8, "windowSceneDidEnd:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v9, "endWindowSceneSessionSynchronously:forSessionType:endReason:windowScene:", 0, ICNASessionTypeNotes, 1, v7);

}

- (void)sceneDidDisconnect:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;

  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[ICWindowSceneDelegate sceneDidDisconnect:]";
    v17 = 1024;
    v18 = 250;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v15, 0x12u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noteEditorViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentAttachment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "note"));

    if (v7 == v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAudioController sharedAudioController](ICAudioController, "sharedAudioController"));
      objc_msgSend(v11, "stop");

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    if ((objc_msgSend(v12, "isAuxiliary") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICAudioRecordingManager currentAttachment](ICAudioRecordingManager, "currentAttachment"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "note"));

      if (v7 == v14)
        +[ICAudioRecordingManager cancelCurrentAudioRecordingSessionWithCompletionHandler:](ICAudioRecordingManager, "cancelCurrentAudioRecordingSessionWithCompletionHandler:", &stru_100552168);
    }
    else
    {

    }
  }

}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v6 = a4;
  v7 = a3;
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ICWindowSceneDelegate windowScene:userDidAcceptCloudKitShareWithMetadata:]";
    v11 = 1024;
    v12 = 281;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v9, 0x12u);
  }

  -[ICWindowSceneDelegate handleAcceptingCloudKitShareWithMetadata:withWindowScene:](self, "handleAcceptingCloudKitShareWithMetadata:withWindowScene:", v6, v7);
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[ICWindowSceneDelegate stateRestorationActivityForScene:]";
    v34 = 1024;
    v35 = 289;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICSessionSceneHasBecomeForegroundKey")));
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate sessionIdentifierToStateRestorationActivity](self, "sessionIdentifierToStateRestorationActivity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v12));

    if (v13)
    {
      v14 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_100407B20();

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate sessionIdentifierToStateRestorationActivity](self, "sessionIdentifierToStateRestorationActivity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "persistentIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v17));

      goto LABEL_15;
    }
  }
  v18 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("ICCanvasStateActivityType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate icWindow](self, "icWindow"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewControllerManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "windowStateArchive"));

  v30 = CFSTR("ICCanvasStateArchiveKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dictionaryRepresentation"));
  v31 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  objc_msgSend(v18, "setUserInfo:", v22);

  if (!v15)
    v23 = +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((archive) != nil)", "-[ICWindowSceneDelegate stateRestorationActivityForScene:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "archive");
  if (ICInternalSettingsIsSelectionStateTrackingEnabled(v23))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionState"));
    if (v24)
    {

LABEL_14:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      objc_msgSend(v16, "saveLastBackgroundedArchiveState:", v15);
LABEL_15:

      goto LABEL_16;
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentNoteObjectIDURL"));

  if (v25)
    goto LABEL_14;
LABEL_16:

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate sessionIdentifierToStateRestorationActivity](self, "sessionIdentifierToStateRestorationActivity"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "persistentIdentifier"));
  objc_msgSend(v26, "ic_setNonNilObject:forNonNilKey:", v18, v28);

  return v18;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;

  v4 = a4;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412802;
    v7 = v4;
    v8 = 2080;
    v9 = "-[ICWindowSceneDelegate scene:willContinueUserActivityWithType:]";
    v10 = 1024;
    v11 = 324;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "type == %@%s:%d", (uint8_t *)&v6, 0x1Cu);
  }

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v6 = a4;
  v7 = a5;
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v17 = v6;
    v18 = 2112;
    v20 = 2080;
    v19 = v7;
    v21 = "-[ICWindowSceneDelegate scene:didFailToContinueUserActivityWithType:error:]";
    v22 = 1024;
    v23 = 329;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@, %@%s:%d", buf, 0x26u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "analyticsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), ICNAInbountURLComponentUserActivity, v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
  objc_msgSend(v10, "startSessionWithReferralURL:referralApplication:", v12, 0);

  v13 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_100407B4C((uint64_t)v7, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICHandoffController sharedController](ICHandoffController, "sharedController"));
  objc_msgSend(v14, "setInputStream:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICHandoffController sharedController](ICHandoffController, "sharedController"));
  objc_msgSend(v15, "setOutputStream:", 0);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  v6 = a4;
  v7 = a3;
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
    *(_DWORD *)buf = 138412802;
    v31 = v9;
    v32 = 2080;
    v33 = "-[ICWindowSceneDelegate scene:continueUserActivity:]";
    v34 = 1024;
    v35 = 340;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "type == %@%s:%d", buf, 0x1Cu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managedObjectContext"));

  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_10007E810;
  v27 = &unk_10054FE80;
  v12 = v6;
  v28 = v12;
  v13 = v11;
  v29 = v13;
  objc_msgSend(v13, "performBlock:", &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate sessionIdentifierToStateRestorationActivity](self, "sessionIdentifierToStateRestorationActivity", v24, v25, v26, v27));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "session"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ICCanvasStateArchiveKey")));

  if (v19)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveFromDictionary:](ICWindowStateArchive, "windowStateArchiveFromDictionary:", v19));
  else
    v20 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate archiveForUserActivities:isSourceApplicationExternal:lastSavedArchive:](self, "archiveForUserActivities:isSourceApplicationExternal:lastSavedArchive:", v21, 1, v20));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v23, "applyStateRestoreArchive:completion:", v22, 0);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v6 = a4;
  v7 = a3;
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ICWindowSceneDelegate scene:openURLContexts:]";
    v11 = 1024;
    v12 = 378;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v9, 0x12u);
  }

  -[ICWindowSceneDelegate handleOpeningURLContexts:withScene:](self, "handleOpeningURLContexts:withScene:", v6, v7);
}

- (void)handleOpeningURLContexts:(id)a3 withScene:(id)a4
{
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  __int128 v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v9 = 138412290;
    v25 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v12), "URL", v25));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "analyticsController"));
        objc_msgSend(v15, "startSessionWithReferralURL:referralApplication:", v13, 0);

        v16 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v25;
          v32 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Got openURL: %@", buf, 0xCu);
        }

        v17 = +[ICAppURLUtilities isQuickNoteModeURL:](ICAppURLUtilities, "isQuickNoteModeURL:", v13);
        v18 = +[ICAppURLUtilities quickNoteURLIsContinuing:](ICAppURLUtilities, "quickNoteURLIsContinuing:", v13);
        v19 = objc_opt_class(UIWindowScene);
        v20 = ICDynamicCast(v19, v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v22 = v21;
        if (!v17 || (v18 & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
          objc_msgSend(v23, "openURL:", v13);
LABEL_14:

          goto LABEL_15;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "screen"));
        if ((objc_msgSend(v23, "ic_isSecure") & 1) != 0)
          goto LABEL_14;
        v24 = +[UIDevice ic_isLocked](UIDevice, "ic_isLocked");

        if ((v24 & 1) == 0)
          -[ICWindowSceneDelegate handleLaunchingQuickNoteUnlocked](self, "handleLaunchingQuickNoteUnlocked");
LABEL_15:

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v10);
  }

}

- (void)handleLaunchingQuickNoteUnlocked
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainSplitViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
  v6 = objc_opt_respondsToSelector(v5, "prepareForDismissal");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainSplitViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

    objc_msgSend(v9, "prepareForDismissal");
  }
  v10 = +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen");
  v11 = +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen");
  if ((v11 == (id)3 || v10 == (id)2)
    && ((v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance")),
         v13 = v12,
         v11 != (id)3)
      ? (v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastBackgroundedArchiveState")))
      : (v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "quicknoteArchiveState"))),
        v17 = (id)v14,
        v13,
        v17))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    objc_msgSend(v15, "applyStateRestoreArchive:completion:", v17, 0);

  }
  else
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    v16 = objc_msgSend(v17, "showNewNoteWithApproach:sender:animated:", 12, self, 1);
  }

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v6 = a4;
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[ICWindowSceneDelegate windowScene:performActionForShortcutItem:completionHandler:]";
    v17 = 1024;
    v18 = 446;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsController"));
  v10 = ICNAInbountURLComponentShortcutItem;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v10, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
  objc_msgSend(v9, "startSessionWithReferralURL:referralApplication:", v13, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v14, "performActionForShortcutItem:", v6);

}

- (void)performPPTForegroundLaunchTasksIfNecessary
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  if (-[ICWindowSceneDelegate pptLaunchTasksComplete](self, "pptLaunchTasksComplete"))
    return;
  -[ICWindowSceneDelegate setPptLaunchTasksComplete:](self, "setPptLaunchTasksComplete:", 1);
  v3 = os_log_create("com.apple.notes", "Test");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100407C28(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v12 = objc_msgSend(v11, "isRunningPPT");

  if (!v12)
  {
    v19 = 0;
LABEL_18:
    v20 = 0;
    goto LABEL_19;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("launchToFolderList"));

  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_10001AC50();

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("launchToNotesList"));

  if (v17)
  {
    v18 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_100407BD0();
LABEL_17:
    v19 = v17 ^ 1;

    goto LABEL_18;
  }
  if ((v14 & 1) == 0)
  {
    v18 = os_log_create("com.apple.notes", "Test");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_100407BFC();
    goto LABEL_17;
  }
  v19 = 0;
  v20 = 1;
LABEL_19:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICApplicationTestingHelper sharedHelper](ICApplicationTestingHelper, "sharedHelper"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "testNoteIdentifier"));

  if (v20)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    objc_msgSend(v23, "showAccountListAnimated:", 0);
  }
  else
  {
    if (v22)
      v24 = v19;
    else
      v24 = 0;
    if (v24 == 1 && objc_msgSend(v22, "length"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "managedObjectContext"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:includeDeleted:context:](ICNote, "noteWithIdentifier:includeDeleted:context:", v22, 0, v26));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectID"));
      objc_msgSend(v27, "selectNoteWithObjectID:scrollState:startEditing:animated:ensurePresented:", v28, 0, 0, 0, 1);
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "managedObjectContext"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount localAccountInContext:](ICAccount, "localAccountInContext:", v30));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectID"));
      objc_msgSend(v27, "selectContainerWithIdentifier:usingRootViewController:deferUntilDataLoaded:animated:", v28, 1, 0, 0);
    }

  }
}

- (void)handleAcceptingCloudKitShareWithMetadata:(id)a3 withWindowScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int IsAppleAccountBrandingEnabled;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  _QWORD v51[4];
  NSObject *v52;
  uint8_t buf[4];
  id v54;

  v6 = a3;
  v43 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", kICNACloudKitShareReferralURL));
  objc_msgSend(v8, "startSessionWithReferralURL:referralApplication:", v9, 0);

  v10 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User accepted CloudKit share with metadata: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowSceneDelegate icWindow](self, "icWindow"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllerManager"));

  if (+[ICAccount hasActiveCloudKitAccountInContext:](ICAccount, "hasActiveCloudKitAccountInContext:", v12))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "share"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URL"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10007F8F8;
      v51[3] = &unk_100552190;
      v52 = v14;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10007FA20;
      v49[3] = &unk_1005521B8;
      v50 = v52;
      v18 = v43;
      objc_msgSend(v17, "processShareAcceptanceWithMetadata:windowScene:managedObjectContext:alertBlock:showObjectBlock:", v6, v43, v12, v51, v49);

      v19 = v52;
    }
    else
    {
      v19 = os_log_create("com.apple.notes", "Collaboration");
      v18 = v43;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100407C98((uint64_t)v6, v19, v35, v36, v37, v38, v39, v40);
    }
  }
  else
  {
    v42 = v14;
    v20 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Tried to accept share, but didn't have modern notes.", buf, 2u);
    }

    IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = v22;
    if (IsAppleAccountBrandingEnabled)
      v24 = CFSTR("To open shared notes, you’ll need to upgrade your Apple Account.");
    else
      v24 = CFSTR("To open shared notes, you’ll need to upgrade your iCloud account.");
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_1005704B8, 0));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Upgrade Your Notes"), &stru_1005704B8, 0));
    v19 = objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v26, v41, 1));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1005704B8, 0));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 1, 0));

    -[NSObject addAction:](v19, "addAction:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Upgrade"), &stru_1005704B8, 0));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10007FAFC;
    v44[3] = &unk_100552208;
    v44[4] = self;
    v14 = v42;
    v32 = v42;
    v45 = v32;
    v46 = v12;
    v18 = v43;
    v47 = v43;
    v48 = v6;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v31, 0, v44));

    -[NSObject addAction:](v19, "addAction:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingSidebarViewController"));
    objc_msgSend(v34, "presentViewController:animated:completion:", v19, 1, 0);

    v16 = (void *)v41;
  }

}

- (id)archiveForUserActivities:(id)a3 isSourceApplicationExternal:(BOOL)a4 lastSavedArchive:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  NSObject *v11;
  uint64_t v12;
  os_log_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  char isKindOfClass;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  CFIndex (__cdecl **v57)(CFArrayRef);
  void *v58;
  uint64_t v59;
  os_log_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  unsigned int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  BOOL v69;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_class *v77;
  NSString *v78;
  void *v79;
  unsigned int v80;
  void *v81;
  NSString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  NSString *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  __int128 v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  id v121;
  NSObject *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t buf[4];
  void *v128;
  uint8_t v129[4];
  uint64_t v130;
  _BYTE v131[128];

  v6 = a3;
  v7 = a5;
  v8 = sub_1000A011C();
  v109 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "managedObjectContext"));
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v9 = v6;
  v121 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
  if (!v121)
  {

    v11 = 0;
    v99 = 0;
    v13 = 0;
    v100 = 0;
    v14 = 0;
    if (!v7)
      goto LABEL_100;
    goto LABEL_99;
  }
  v106 = v7;
  v11 = 0;
  v117 = 0;
  v12 = 0;
  v13 = 0;
  v111 = 0;
  v14 = 0;
  v120 = *(_QWORD *)v124;
  v115 = ICNotesEditNoteUserActivityType;
  v113 = ICUserActivityInfoDictionaryNoteIDKey;
  *(_QWORD *)&v10 = 138412290;
  v105 = v10;
  v112 = v9;
  do
  {
    v15 = 0;
    do
    {
      v122 = v11;
      if (*(_QWORD *)v124 != v120)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v15);
      v17 = objc_opt_class(NSString);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CSSearchableItemActivityIdentifier));
      v20 = ICDynamicCast(v17, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      if (v21)
      {
        v22 = v13;
        v13 = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v21));
LABEL_46:

        v11 = v122;
        goto LABEL_47;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.notes.open.object"));

      v119 = v14;
      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "targetContentIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));

        v116 = v12;
        if (v22)
        {
          if (+[ICAppURLUtilities isShowFolderListURL:](ICAppURLUtilities, "isShowFolderListURL:", v22))goto LABEL_11;
          if (+[ICAppURLUtilities isShowDefaultFolderURL:](ICAppURLUtilities, "isShowDefaultFolderURL:", v22))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "noteContext"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaultAccountUtilities defaultFolderWithHTMLNoteContext:](ICDefaultAccountUtilities, "defaultFolderWithHTMLNoteContext:", v40));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectID"));
            v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URIRepresentation"));

            v26 = 0;
            v13 = (os_log_t)v43;
            v9 = v112;
            goto LABEL_44;
          }
          if (v110)
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDForModernFolderMentionedInURL:noteContext:](ICAppURLUtilities, "objectIDForModernFolderMentionedInURL:noteContext:", v22));

            if (!v61)
            {
              v111 = 0;
              goto LABEL_36;
            }
LABEL_43:
            v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "URIRepresentation", (_QWORD)v105));

            v26 = 0;
            v13 = (os_log_t)v65;
            v111 = v61;
          }
          else
          {
LABEL_36:
            if (v114
              && +[ICAppURLUtilities isShowVirtualSmartFolderURL:](ICAppURLUtilities, "isShowVirtualSmartFolderURL:", v22))
            {
              v62 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities virtualSmartFolderMentionedInURL:context:](ICAppURLUtilities, "virtualSmartFolderMentionedInURL:context:", v22, v114));

              v26 = 0;
              v122 = v62;
            }
            else
            {
              if (v109)
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDForHTMLFolderMentionedInURL:context:](ICAppURLUtilities, "objectIDForHTMLFolderMentionedInURL:context:", v22));

                if (v61)
                  goto LABEL_43;
                v111 = 0;
              }
              if (v114
                && +[ICAppURLUtilities isShowNoteURL:](ICAppURLUtilities, "isShowNoteURL:", v22))
              {
                v85 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities predicateForNotesMentionedInURL:](ICAppURLUtilities, "predicateForNotesMentionedInURL:", v22));
                v26 = v85 != 0;
                if (v85)
                {
                  v86 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote notesMatchingPredicate:context:](ICNote, "notesMatchingPredicate:context:", v85, v114));
                  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "firstObject"));
                  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectID"));
                  v118 = objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "URIRepresentation"));

                  v9 = v112;
                  v13 = (os_log_t)v118;
                }

              }
              else
              {
                v89 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:](ICAppURLUtilities, "objectIDURIRepresentationForHTMLNoteMentionedInURL:", v22, (_QWORD)v105));

                if (v89)
                {
                  v26 = 1;
                  v13 = (os_log_t)v89;
                }
                else if (+[ICAppURLUtilities isShowHTMLNoteURL:](ICAppURLUtilities, "isShowHTMLNoteURL:", v22))
                {
                  v13 = (os_log_t)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDURIRepresentationForHTMLNoteMentionedInURL:](ICAppURLUtilities, "objectIDURIRepresentationForHTMLNoteMentionedInURL:", v22));
                  v26 = 1;
                }
                else
                {
                  v13 = os_log_create("com.apple.notes", "UI");
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v105;
                    v128 = v22;
                    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Cannot handle open object URL {url: %@}", buf, 0xCu);
                  }
LABEL_11:

                  v26 = 0;
                  v13 = 0;
                }
              }
            }
          }
        }
        else
        {
          v38 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            sub_100407CFC(v129, v16, &v130, v38);

          v26 = 0;
        }
LABEL_44:
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo", (_QWORD)v105));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("ICUseAuxiliaryWindow")));
        v68 = objc_msgSend(v67, "isEqual:", &__kCFBooleanTrue);

        v117 = v26 & v68;
        v12 = v116;
LABEL_45:
        v14 = v119;
        goto LABEL_46;
      }
      v27 = (void *)v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
      v29 = objc_msgSend(v28, "isEqual:", v115);

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v113));

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v22, v114));
        if ((objc_msgSend(v31, "markedForDeletion") & 1) != 0)
          goto LABEL_19;
        goto LABEL_17;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
      v33 = objc_msgSend(v32, "isEqual:", CFSTR("com.apple.Notes"));

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "noteContext"));

        v35 = sub_10005D25C(v16, v22, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v35);
        if ((objc_msgSend(v31, "isMarkedForDeletion") & 1) != 0)
        {
LABEL_19:
          v12 = (uint64_t)v27;

          goto LABEL_45;
        }
LABEL_17:
        if ((objc_msgSend(v31, "isDeleted", (_QWORD)v105) & 1) == 0)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectID"));
          v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "URIRepresentation"));

          v13 = (os_log_t)v37;
        }
        goto LABEL_19;
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[ICNotesFolderIntent className](ICNotesFolderIntent, "className"));
      v46 = objc_msgSend(v44, "isEqual:", v45);

      if (v46)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "interaction"));
        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "intent"));
        if (v47)
        {
          v48 = (void *)v47;
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "intent"));
          v50 = objc_opt_class(ICNotesFolderIntent);
          isKindOfClass = objc_opt_isKindOfClass(v49, v50);

          v9 = v112;
          if ((isKindOfClass & 1) != 0)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "intent"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "folder"));
            v12 = (uint64_t)v27;
            if (v53
              && (v54 = objc_opt_class(ICIntentNotesFolder), (objc_opt_isKindOfClass(v53, v54) & 1) != 0))
            {
              v107 = v52;
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier"));
              v56 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v55));

              v108 = (void *)v56;
              if (v110)
              {
                v57 = &CFArrayGetCount_ptr;
                v58 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities objectIDForModernFolderMentionedInURL:noteContext:](ICAppURLUtilities, "objectIDForModernFolderMentionedInURL:noteContext:", v56));

                if (v58)
                {
                  v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "URIRepresentation"));
                  v60 = v13;
                  v13 = (os_log_t)v59;
                  v111 = v58;
                  v12 = (uint64_t)v27;
                  v14 = v119;
                  goto LABEL_83;
                }
                v111 = 0;
                v12 = (uint64_t)v27;
              }
              else
              {
                v12 = (uint64_t)v27;
                v57 = &CFArrayGetCount_ptr;
              }
              v14 = v119;
              if (v109)
              {
                v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57[363], "objectIDForHTMLFolderMentionedInURL:context:", v108));

                if (v95)
                {
                  v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "URIRepresentation"));
                  v60 = v13;
                  v13 = (os_log_t)v96;
                  v111 = v95;
LABEL_83:
                  v52 = v107;
LABEL_87:

                  goto LABEL_88;
                }
                v111 = 0;
              }
              v52 = v107;
              if (objc_msgSend(v57[363], "isShowVirtualSmartFolderURL:", v108, v105))
              {
                v97 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities virtualSmartFolderMentionedInURL:context:](ICAppURLUtilities, "virtualSmartFolderMentionedInURL:context:", v108, v114));
                v60 = v122;
                v122 = v97;
                goto LABEL_87;
              }
LABEL_88:

            }
            else
            {
              v14 = v119;
            }

            goto LABEL_46;
          }
        }
        else
        {
          v9 = v112;
        }
        v12 = (uint64_t)v27;
        goto LABEL_45;
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
      v64 = objc_msgSend(v63, "isEqual:", CSQueryContinuationActionType);

      if (v64)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CSSearchQueryString));

        v9 = v112;
        goto LABEL_45;
      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
      v77 = (objc_class *)objc_opt_class(INSearchForNotebookItemsIntent);
      v78 = NSStringFromClass(v77);
      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
      v80 = objc_msgSend(v76, "isEqual:", v79);

      if (v80)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
        v82 = NSStringFromSelector("content");
        v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKey:", v83));

        v9 = v112;
        v11 = v122;
        if (!objc_msgSend(v84, "length"))
        {
          v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
          v91 = v84;
          v22 = (void *)v90;
          v92 = NSStringFromSelector("title");
          v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
          v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v93));

          v12 = v94;
          goto LABEL_45;
        }
        v12 = (uint64_t)v84;
      }
      else
      {
        v9 = v112;
        v11 = v122;
        v12 = (uint64_t)v27;
      }
      v14 = v119;
LABEL_47:
      if (v13)
        v69 = 0;
      else
        v69 = v11 == 0;
      if (!v69 || v12 != 0)
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveWithEmptyState](ICWindowStateArchive, "windowStateArchiveWithEmptyState"));

        objc_msgSend(v71, "setCurrentObjectIDURL:", v13);
        objc_msgSend(v71, "setCurrentVirtualSmartFolderIdentifier:", v11);
        v72 = v12;
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject type](v11, "type"));
        objc_msgSend(v71, "setCurrentVirtualSmartFolderType:", v73);

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject accountObjectID](v11, "accountObjectID"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "URIRepresentation"));
        objc_msgSend(v71, "setCurrentVirtualSmartFolderAccountObjectIDURL:", v75);

        v12 = v72;
        objc_msgSend(v71, "setIsAuxiliaryWindow:", v117 & 1);
        objc_msgSend(v71, "setCurrentSearchTerm:", v72);
        v14 = v71;
      }

      v15 = (char *)v15 + 1;
    }
    while (v121 != v15);
    v98 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
    v121 = v98;
  }
  while (v98);

  v7 = v106;
  if (!v106)
  {
    v99 = (void *)v12;
    v100 = v111;
    goto LABEL_100;
  }
  v99 = (void *)v12;
  if (!v14)
  {
    v100 = v111;
LABEL_99:
    v14 = v7;
    goto LABEL_100;
  }
  objc_msgSend(v14, "setCurrentNoteContainerViewMode:", objc_msgSend(v106, "currentNoteContainerViewMode"));
  objc_msgSend(v14, "setIsPrimaryContentVisible:", objc_msgSend(v106, "isPrimaryContentVisible"));
  v100 = v111;
  if (ICInternalSettingsIsSelectionStateTrackingEnabled(objc_msgSend(v14, "setIsSupplementaryContentVisible:", objc_msgSend(v106, "isSupplementaryContentVisible"))))
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "selectionState"));
    v102 = objc_msgSend(v101, "copy");
    objc_msgSend(v14, "setSelectionState:", v102);

  }
LABEL_100:
  v103 = v14;

  return v103;
}

- (ICWindow)icWindow
{
  return self->_icWindow;
}

- (BOOL)pptLaunchTasksComplete
{
  return self->_pptLaunchTasksComplete;
}

- (void)setPptLaunchTasksComplete:(BOOL)a3
{
  self->_pptLaunchTasksComplete = a3;
}

- (BOOL)isAnyWelcomeScreenVisible
{
  return self->_isAnyWelcomeScreenVisible;
}

- (void)setSessionIdentifierToStateRestorationActivity:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifierToStateRestorationActivity, a3);
}

- (NSObject)sceneDidDisconnectNotificationToken
{
  return self->_sceneDidDisconnectNotificationToken;
}

- (void)setSceneDidDisconnectNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_sceneDidDisconnectNotificationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDidDisconnectNotificationToken, 0);
  objc_storeStrong((id *)&self->_sessionIdentifierToStateRestorationActivity, 0);
  objc_storeStrong((id *)&self->_icWindow, 0);
}

@end

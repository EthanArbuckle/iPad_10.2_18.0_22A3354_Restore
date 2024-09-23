@implementation ICSystemPaperWindowSceneDelegate

- (void)ic_setupWithScene:(id)a3 options:(id)a4
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
  v8 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ICSystemPaperWindowSceneDelegate ic_setupWithScene:options:]";
    v11 = 1024;
    v12 = 69;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v9, 0x12u);
  }

  -[ICSystemPaperWindowSceneDelegate setupSystemPaperWithWindowScene:options:](self, "setupSystemPaperWithWindowScene:options:", v7, v6);
}

- (void)ic_sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ICSystemPaperWindowSceneDelegate ic_sceneDidDisconnect:]";
    v11 = 1024;
    v12 = 75;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v9, 0x12u);
  }

  -[ICCommonWindowSceneDelegate sharedDisconnect](self, "sharedDisconnect");
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "_unregisterSettingsDiffActionArrayForKey:", v8);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  objc_super v15;
  ICSystemPaperWindowSceneDelegate *v16;

  v16 = self;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v12 = (objc_class *)objc_opt_class(self);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v10, "_registerSettingsDiffActionArray:forKey:", v11, v14);

  v15.receiver = self;
  v15.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  -[ICCommonWindowSceneDelegate scene:willConnectToSession:options:](&v15, "scene:willConnectToSession:options:", v10, v9, v8);

}

- (id)contentItemForUserActivity:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SYNotesUserActivityKeyContentItemData));

  if (v4)
    v5 = objc_msgSend(objc_alloc((Class)SYContentItem), "initWithData:error:", v4, 0);
  else
    v5 = 0;

  return v5;
}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[ICSystemPaperWindowSceneDelegate sceneWillResignActive:]";
    v9 = 1024;
    v10 = 104;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  -[ICCommonWindowSceneDelegate sceneWillResignActive:](&v6, "sceneWillResignActive:", v4);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  unsigned int v27;
  os_log_t v28;
  id v29;
  void *v30;
  os_log_t v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  id v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  NSObject *v52;
  unsigned int v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  int v57;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v55 = "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]";
    v56 = 1024;
    v57 = 110;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if ((ICInternalSettingsIsSystemPaperEnabled() & 1) == 0)
  {
    v21 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not setting up System Paper UI since SystemPaper isn't enabled.", buf, 2u);
    }
    goto LABEL_44;
  }
  if ((+[ICDeviceSupport deviceSupportsSystemPaper](ICDeviceSupport, "deviceSupportsSystemPaper") & 1) == 0)
  {
    v52 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      sub_10040BCF0();

    exit(1);
  }
  v9 = objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate setupUserActivity](self, "setupUserActivity"));
  if (!v9)
  {
LABEL_14:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate icWindow](self, "icWindow"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ic_viewControllerManager"));

    if (!v21)
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "viewControllerManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityType"));
    v24 = objc_msgSend(v23, "isEqual:", SYNotesUserActivityTypeCreateLink);

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", SYNotesUserActivityKeyPreferNewDocument));
      v27 = objc_msgSend(v26, "BOOLValue");

      v28 = (os_log_t)objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate contentItemForUserActivity:](self, "contentItemForUserActivity:", v7));
      if (v27)
        v29 = -[NSObject showNewNoteWithApproach:sender:animated:](v21, "showNewNoteWithApproach:sender:animated:", 16, self, 1);
      if (!v28)
        goto LABEL_43;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject noteEditorViewController](v21, "noteEditorViewController"));

      if (!v30)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager.noteEditorViewController) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "viewControllerManager.noteEditorViewController");
      v31 = (os_log_t)objc_claimAutoreleasedReturnValue(-[NSObject noteEditorViewController](v21, "noteEditorViewController"));
      -[NSObject addSystemPaperLink:updateFirstResponder:](v31, "addSystemPaperLink:updateFirstResponder:", v28, 0);
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityType"));
      v33 = objc_msgSend(v32, "isEqual:", SYNotesUserActivityTypeInsertImage);

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", SYNotesUserActivityKeyPreferNewDocument));
        v36 = objc_msgSend(v35, "BOOLValue");

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v28 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", SYNotesUserActivityKeyContentItemData));

        if (v36)
          v38 = -[NSObject showNewNoteWithApproach:sender:animated:](v21, "showNewNoteWithApproach:sender:animated:", 20, self, 1);
        if (-[NSObject count](v28, "count"))
        {
          v31 = (os_log_t)objc_claimAutoreleasedReturnValue(-[NSObject noteEditorViewController](v21, "noteEditorViewController"));
          -[NSObject addSystemPaperImageData:updateFirstResponder:](v31, "addSystemPaperImageData:updateFirstResponder:", v28, 0);
        }
        else
        {
          v31 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            sub_10040BC30();
        }
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityType"));
        v40 = objc_msgSend(v39, "isEqual:", SYNotesUserActivityTypeEditNote);

        if (v40)
        {
          v28 = (os_log_t)objc_claimAutoreleasedReturnValue(-[NSObject systemPaperViewController](v21, "systemPaperViewController"));
          if (!v28)
            +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((spvc) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "spvc");
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
          v31 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", SYNotesUserActivityInfoKeyNoteID));

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentNote](v28, "currentNote"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
          v44 = objc_msgSend(v43, "isEqual:", v31);

          if ((v44 & 1) == 0)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "managedObjectContext"));

            v47 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v31, v46));
            if (!v47)
              +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((resolvedNote) != nil)", "-[ICSystemPaperWindowSceneDelegate scene:continueUserActivity:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "resolvedNote");
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject systemPaperViewController](v21, "systemPaperViewController"));
            objc_msgSend(v48, "setCurrentNote:", v47);

          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject noteEditorViewController](v21, "noteEditorViewController"));
          v50 = objc_msgSend(v49, "isFirstResponder");

          if (v50)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject noteEditorViewController](v21, "noteEditorViewController"));
            objc_msgSend(v51, "startEditing");

          }
        }
        else
        {
          v31 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            sub_10040BC5C(v7, v31);
          v28 = v31;
        }
      }
    }

LABEL_43:
LABEL_44:

    goto LABEL_45;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate setupUserActivity](self, "setupUserActivity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activityType"));
  if (!objc_msgSend(v11, "isEqual:", v13))
  {

    goto LABEL_14;
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v15 = v7;
  v16 = v6;
  v17 = (void *)v14;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate setupUserActivity](self, "setupUserActivity"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  v53 = objc_msgSend(v17, "isEqual:", v19);

  v6 = v16;
  v7 = v15;

  if (!v53)
    goto LABEL_14;
  v20 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not continuing user activity because it has been handled during setup.", buf, 2u);
  }

  -[ICSystemPaperWindowSceneDelegate setSetupUserActivity:](self, "setSetupUserActivity:", 0);
LABEL_45:

}

- (void)setUpResumeEditingSystemPaperArchive:(id)a3 prefersNewNote:(BOOL)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v5 = a3;
  v6 = +[ICPaperCommonUtilities shouldResumeLastQuickNote](ICPaperCommonUtilities, "shouldResumeLastQuickNote");
  if (a4 || !v6)
  {
    objc_msgSend(v5, "setNoteCreationApproach:", 16);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount mostRecentSystemPaperNoteInManagedObjectContext:](ICAccount, "mostRecentSystemPaperNoteInManagedObjectContext:", v8));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URIRepresentation"));
      objc_msgSend(v5, "setCurrentObjectIDURL:", v12);

    }
    else
    {
      v13 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "We didn't want a new system paper note, but none was available to use, so creating a new one instead.", v14, 2u);
      }

      objc_msgSend(v5, "setNoteCreationApproach:", 19);
    }

  }
}

- (void)setupSystemPaperWithWindowScene:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_log_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  ICSystemPaperWindowSceneDelegate *v47;
  id v48;
  id v49;
  void *v50;
  unsigned int v51;
  NSObject *v52;
  uint64_t v53;
  char *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  ICViewControllerManager *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  int v68;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[ICSystemPaperWindowSceneDelegate setupSystemPaperWithWindowScene:options:]";
    v67 = 1024;
    v68 = 215;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  if ((ICInternalSettingsIsSystemPaperEnabled() & 1) != 0)
  {
    if ((+[ICDeviceSupport deviceSupportsSystemPaper](ICDeviceSupport, "deviceSupportsSystemPaper") & 1) == 0)
    {
      v61 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        sub_10040BCF0();

      exit(1);
    }
    v9 = (os_log_t)objc_claimAutoreleasedReturnValue(+[ICWindowStateArchive windowStateArchiveWithEmptyState](ICWindowStateArchive, "windowStateArchiveWithEmptyState"));
    -[NSObject setSystemPaper:](v9, "setSystemPaper:", 1);
    -[NSObject setActiveEditorInEditMode:](v9, "setActiveEditorInEditMode:", 1);
    -[NSObject setIsAuxiliaryWindow:](v9, "setIsAuxiliaryWindow:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastBackgroundedArchiveState"));

    if (v11 && objc_msgSend(v11, "currentNoteContainerViewMode") != (id)-1)
      -[NSObject setPreferredNoteContainerViewMode:](v9, "setPreferredNoteContainerViewMode:", objc_msgSend(v11, "currentNoteContainerViewMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainWindowIdentifier"));
    v14 = (void *)v13;
    v15 = CFSTR("DefaultIdentifier");
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("QuickNote-"), "stringByAppendingString:", v16));
    -[NSObject setToolPickerIdentifier:](v9, "setToolPickerIdentifier:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "managedObjectContext"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userActivities"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "anyObject"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
    v23 = objc_msgSend(v22, "isEqual:", ICNotesEditNoteUserActivityType);

    v64 = v11;
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICNACoreAnalyticsReporter sharedReporter](ICNACoreAnalyticsReporter, "sharedReporter"));
      objc_msgSend(v24, "setNoteViewApproach:", ICCoreAnalyticsNoteViewApproachIOSDeeplinkThumbnail);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "userInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", ICUserActivityInfoDictionaryNoteIDKey));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v26, v19));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "URIRepresentation"));
      -[NSObject setCurrentObjectIDURL:](v9, "setCurrentObjectIDURL:", v29);

    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
      v31 = objc_msgSend(v30, "isEqual:", SYNotesUserActivityTypeCreateLink);

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICNACoreAnalyticsReporter sharedReporter](ICNACoreAnalyticsReporter, "sharedReporter"));
        objc_msgSend(v32, "setNoteViewApproach:", ICCoreAnalyticsNoteViewApproachIOSSafariMenuAffordance);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "userInfo"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", SYNotesUserActivityKeyPreferNewDocument));
        v35 = objc_msgSend(v34, "BOOLValue");

        -[ICSystemPaperWindowSceneDelegate setUpResumeEditingSystemPaperArchive:prefersNewNote:](self, "setUpResumeEditingSystemPaperArchive:prefersNewNote:", v9, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate contentItemForUserActivity:](self, "contentItemForUserActivity:", v21));
        -[NSObject setInitialSystemPaperLink:](v9, "setInitialSystemPaperLink:", v36);

LABEL_19:
        v43 = (unint64_t)+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode");
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_launchOptionsDictionary"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", SBSUISystemNotesWindowSceneConnectionOptionsSceneConnectionSourceKey));

        v63 = v21;
        if (objc_msgSend(v45, "count"))
        {
          if ((unint64_t)objc_msgSend(v45, "count") >= 2)
          {
            v46 = os_log_create("com.apple.notes", "SystemPaper");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              sub_10040BD1C();

          }
          v62 = v19;
          v47 = self;
          v48 = v7;
          v49 = v6;
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "anyObject"));
          v51 = objc_msgSend(v50, "unsignedIntValue");
          v52 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = SBSSystemNotesConnectionSourceDescription(v51);
            v54 = (char *)objc_claimAutoreleasedReturnValue(v53);
            *(_DWORD *)buf = 138412290;
            v66 = v54;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Received connection source: %@", buf, 0xCu);

          }
          if (v51 - 3 < 0xFFFFFFFE)
            v43 = v43;
          else
            v43 = 0;

          v6 = v49;
          v7 = v48;
          self = v47;
          v19 = v62;
        }
        -[NSObject setShouldStartEditing:](v9, "setShouldStartEditing:", v43);
        objc_msgSend(v6, "setDelegate:", self);
        v55 = objc_msgSend(objc_alloc((Class)ICWindow), "initWithWindowScene:behavior:", v6, 2);
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("System Paper Window"), &stru_1005704B8, 0));
        objc_msgSend(v55, "setAccessibilityIdentifier:", v57);

        v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
        objc_msgSend(v55, "setBackgroundColor:", v58);

        objc_msgSend(v55, "setOpaque:", 0);
        v59 = objc_alloc_init(ICViewControllerManager);
        -[ICViewControllerManager setupWithWindow:stateRestoreArchive:completion:](v59, "setupWithWindow:stateRestoreArchive:completion:", v55, v9, 0);
        objc_msgSend(v55, "setViewControllerManager:", v59);
        objc_msgSend(v55, "makeKeyAndVisible");
        -[ICSystemPaperWindowSceneDelegate setSetupUserActivity:](self, "setSetupUserActivity:", v63);
        -[ICCommonWindowSceneDelegate setIcWindow:](self, "setIcWindow:", v55);

        goto LABEL_31;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activityType"));
      v38 = objc_msgSend(v37, "isEqual:", SYNotesUserActivityTypeInsertImage);

      if (!v38)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[ICNACoreAnalyticsReporter sharedReporter](ICNACoreAnalyticsReporter, "sharedReporter"));
        objc_msgSend(v60, "setNoteViewApproach:", ICCoreAnalyticsNoteViewApproachIOSSystemPaperShortcut);

        -[ICSystemPaperWindowSceneDelegate setUpResumeEditingSystemPaperArchive:prefersNewNote:](self, "setUpResumeEditingSystemPaperArchive:prefersNewNote:", v9, 0);
        goto LABEL_19;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "userInfo"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", SYNotesUserActivityKeyPreferNewDocument));
      v41 = objc_msgSend(v40, "BOOLValue");

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "userInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", SYNotesUserActivityKeyContentItemData));

      -[ICSystemPaperWindowSceneDelegate setUpResumeEditingSystemPaperArchive:prefersNewNote:](self, "setUpResumeEditingSystemPaperArchive:prefersNewNote:", v9, v41);
      -[NSObject setInitialSystemPaperImageData:](v9, "setInitialSystemPaperImageData:", v26);
    }

    goto LABEL_19;
  }
  v9 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not setting up System Paper UI since SystemPaper isn't enabled.", buf, 2u);
  }
LABEL_31:

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[ICSystemPaperWindowSceneDelegate sceneDidBecomeActive:]";
    v9 = 1024;
    v10 = 306;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  -[ICCommonWindowSceneDelegate sceneDidBecomeActive:](&v6, "sceneDidBecomeActive:", v4);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[ICSystemPaperWindowSceneDelegate sceneWillEnterForeground:]";
    v15 = 1024;
    v16 = 312;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v12.receiver = self;
  v12.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  -[ICCommonWindowSceneDelegate sceneWillEnterForeground:](&v12, "sceneWillEnterForeground:", v4);
  v6 = objc_opt_class(UIWindowScene);
  v7 = ICDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "analyticsController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100102FB0;
  v11[3] = &unk_100550110;
  v11[4] = self;
  objc_msgSend(v10, "startWindowSceneSessionWithType:windowScene:successHandler:", ICNASessionTypePaper, v8, v11);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ICSystemPaperWindowSceneDelegate sceneDidEnterBackground:]";
    v18 = 1024;
    v19 = 325;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteEditorViewController"));
  objc_msgSend(v7, "donateEditingIntentIfNecessary");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "noteEditorViewController"));
  objc_msgSend(v9, "setEditing:animated:", 0, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate eventReporter](self, "eventReporter"));
  objc_msgSend(v10, "submitWindowSceneEvent");

  v11 = objc_opt_class(UIWindowScene);
  v12 = ICDynamicCast(v11, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICNAController sharedController](ICNAController, "sharedController"));
  objc_msgSend(v14, "endWindowSceneSessionSynchronously:forSessionType:endReason:windowScene:", 0, ICNASessionTypePaper, 6, v13);

  v15.receiver = self;
  v15.super_class = (Class)ICSystemPaperWindowSceneDelegate;
  -[ICCommonWindowSceneDelegate sceneDidEnterBackground:](&v15, "sceneDidEnterBackground:", v4);

}

- (void)notesSceneDidReceiveCreateNewNoteRequest:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager", a3));
  v6 = v4;
  if (!v4)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager) != nil)", "-[ICSystemPaperWindowSceneDelegate notesSceneDidReceiveCreateNewNoteRequest:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "viewControllerManager");
    v4 = 0;
  }
  v5 = objc_msgSend(v4, "showNewNoteWithApproach:sender:animated:", 19, self, 1);

}

- (ICNAWindowSceneEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  ICNAWindowSceneEventReporter *v9;
  ICNAWindowSceneEventReporter *eventReporter;
  void *v11;

  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = objc_alloc((Class)ICNAWindowSceneEventReporter);
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate icWindow](self, "icWindow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
    v9 = (ICNAWindowSceneEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:windowScene:", v6, v8);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAWindowSceneEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = ICNAEventReporterLostSessionNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10;
  void *v11;
  unsigned __int16 v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "settings"));
  v12 = (unsigned __int16)objc_msgSend(v11, "deactivationReasons");

  v13 = (unint64_t)objc_msgSend(v10, "deactivationReasons");
  v14 = (v13 >> 12) & 1;
  if ((v12 & 0x1000) != 0)
  {
    if ((BSEqualBools(1, v14) & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate icWindow](self, "icWindow"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_viewControllerManager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "noteEditorViewController"));
      objc_msgSend(v17, "setEditing:animated:", 0, 0);

      v18 = (id)objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate eventReporter](self, "eventReporter"));
      objc_msgSend(v18, "submitWindowSceneEvent");
      goto LABEL_7;
    }
  }
  else if ((BSEqualBools(0, v14) & 1) == 0)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[ICSystemPaperWindowSceneDelegate eventReporter](self, "eventReporter"));
    objc_msgSend(v18, "startWindowSceneEventDurationTracking");
LABEL_7:

  }
}

- (NSUserActivity)setupUserActivity
{
  return self->_setupUserActivity;
}

- (void)setSetupUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_setupUserActivity, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_setupUserActivity, 0);
}

@end

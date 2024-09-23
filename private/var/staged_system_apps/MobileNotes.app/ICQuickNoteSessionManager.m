@implementation ICQuickNoteSessionManager

+ (id)sharedManager
{
  if (qword_1005DDDD8 != -1)
    dispatch_once(&qword_1005DDDD8, &stru_100551F20);
  return (id)qword_1005DDDD0;
}

- (ICViewControllerManager)viewControllerManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuickNoteSessionManager noteEditorViewController](self, "noteEditorViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ic_viewControllerManager"));

  return (ICViewControllerManager *)v3;
}

- (BOOL)isQuickNoteFirstLaunch
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = objc_opt_class(NSNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", CFSTR("QNFirstLaunchState")));
  v4 = ICCheckedDynamicCast(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5 && (objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    v7 = objc_opt_class(NSNumber);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", CFSTR("QNForceFirstLaunchStateTrue")));
    v9 = ICCheckedDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v6 = objc_msgSend(v10, "BOOLValue");
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)setQuickNoteFirstLaunch:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", v3, CFSTR("QNFirstLaunchState"));

}

+ (BOOL)requirePasscodeInContext:(id)a3 stateArchive:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  LOBYTE(a1) = objc_msgSend(a1, "requirePasscodeInContext:stateArchive:currentDate:", v7, v6, v8);

  return (char)a1;
}

+ (BOOL)requirePasscodeInContext:(id)a3 stateArchive:(id)a4 currentDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  void *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;

  v8 = a4;
  v9 = a5;
  if (+[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") == (id)1
    || +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") == (id)3)
  {
    v10 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1004074A4();

    v11 = 0;
  }
  else if (+[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") == (id)2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentNoteLastViewedDate"));
    v11 = objc_msgSend(a1, "lastViewedDateExpired:currentDate:", v14, v9);

  }
  else
  {
    v11 = 1;
  }
  v12 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class(a1);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = 138413058;
    v21 = v17;
    v22 = 2112;
    v23 = v19;
    v24 = 2048;
    v25 = +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen");
    v26 = 2048;
    v27 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ %@ showOnLockScreen %ld requirePasscode %ld", (uint8_t *)&v20, 0x2Au);

  }
  return v11;
}

- (id)noteForSessionCreatingIfNecessaryInContext:(id)a3 stateArchive:(id)a4 canResume:(BOOL)a5 isNewlyCreated:(BOOL *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuickNoteSessionManager noteForSessionCreatingIfNecessaryInContext:stateArchive:canResume:currentDate:isNewlyCreated:](self, "noteForSessionCreatingIfNecessaryInContext:stateArchive:canResume:currentDate:isNewlyCreated:", v11, v10, v7, v12, a6));

  return v13;
}

- (id)noteForSessionCreatingIfNecessaryInContext:(id)a3 stateArchive:(id)a4 canResume:(BOOL)a5 currentDate:(id)a6 isNewlyCreated:(BOOL *)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  objc_class *v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  void *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  NSString *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  NSString *v49;
  void *v50;
  NSString *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  NSString *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  NSString *v61;
  void *v62;
  NSString *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  NSString *v67;
  NSString *v68;
  uint64_t v69;
  void *v70;
  objc_class *v71;
  NSString *v72;
  NSString *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  _QWORD v85[2];

  v9 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (a7)
    *a7 = 0;
  v16 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v37 = (objc_class *)objc_opt_class(self);
    v38 = NSStringFromClass(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    *(_DWORD *)buf = 138413058;
    v81 = v39;
    v82 = 2112;
    v83 = v41;
    v84 = 1024;
    LODWORD(v85[0]) = v9;
    WORD2(v85[0]) = 2112;
    *(_QWORD *)((char *)v85 + 6) = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ %@ canResume %d currentDate %@", buf, 0x26u);

  }
  if (ICInternalSettingsIsSelectionStateTrackingEnabled(v17))
  {
    if (v9
      && +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") == (id)2)
    {
      v18 = objc_claimAutoreleasedReturnValue(+[ICSelectionStateUtilities selectedNoteObjectIDFromArchive:modernManagedObjectContext:legacyManagedObjectContext:](_TtC11MobileNotes25ICSelectionStateUtilities, "selectedNoteObjectIDFromArchive:modernManagedObjectContext:legacyManagedObjectContext:", v14, v13, 0));
      v19 = (id)objc_claimAutoreleasedReturnValue(+[ICNote ic_existingObjectWithID:context:](ICNote, "ic_existingObjectWithID:context:", v18, v13));
      v20 = os_log_create("com.apple.notes", "QuickNote");
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_19:

        goto LABEL_26;
      }
    }
    else
    {
      if (+[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") != (id)3)
        goto LABEL_31;
      v25 = objc_opt_class(self);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentNoteLastViewedDate"));
      LOBYTE(v25) = objc_msgSend((id)v25, "lastViewedDateExpired:currentDate:", v26, v15);

      if ((v25 & 1) != 0)
        goto LABEL_31;
      v18 = objc_claimAutoreleasedReturnValue(+[ICSelectionStateUtilities selectedNoteObjectIDFromArchive:modernManagedObjectContext:legacyManagedObjectContext:](_TtC11MobileNotes25ICSelectionStateUtilities, "selectedNoteObjectIDFromArchive:modernManagedObjectContext:legacyManagedObjectContext:", v14, v13, 0));
      v19 = (id)objc_claimAutoreleasedReturnValue(+[ICNote ic_existingObjectWithID:context:](ICNote, "ic_existingObjectWithID:context:", v18, v13));
      v20 = os_log_create("com.apple.notes", "QuickNote");
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        goto LABEL_19;
    }
    v66 = (objc_class *)objc_opt_class(self);
    v67 = NSStringFromClass(v66);
    v78 = (void *)objc_claimAutoreleasedReturnValue(v67);
    v68 = NSStringFromSelector(a2);
    v77 = (void *)objc_claimAutoreleasedReturnValue(v68);
    v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "shortLoggingDescription"));
    *(_DWORD *)buf = 138412802;
    v81 = v78;
    v82 = 2112;
    v83 = v77;
    v84 = 2112;
    v85[0] = v69;
    v70 = (void *)v69;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ %@ found %@", buf, 0x20u);

    goto LABEL_19;
  }
  if (v9
    && +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") == (id)2)
  {
    v21 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v60 = (objc_class *)objc_opt_class(self);
      v61 = NSStringFromClass(v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      v63 = NSStringFromSelector(a2);
      v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentNoteObjectIDURL"));
      *(_DWORD *)buf = 138412802;
      v81 = v62;
      v82 = 2112;
      v83 = v64;
      v84 = 2112;
      v85[0] = v65;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@ %@ looking for current note %@", buf, 0x20u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentStoreCoordinator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentNoteObjectIDURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ic_managedObjectIDForURIRepresentation:", v23));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[ICNote ic_existingObjectWithID:context:](ICNote, "ic_existingObjectWithID:context:", v24, v13));

    v20 = os_log_create("com.apple.notes", "QuickNote");
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
  }
  else
  {
    if (+[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") != (id)3)
      goto LABEL_31;
    v27 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v54 = (objc_class *)objc_opt_class(self);
      v55 = NSStringFromClass(v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      v57 = NSStringFromSelector(a2);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentNoteObjectIDURL"));
      *(_DWORD *)buf = 138412802;
      v81 = v56;
      v82 = 2112;
      v83 = v58;
      v84 = 2112;
      v85[0] = v59;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@ %@ looking for instant note %@", buf, 0x20u);

    }
    v28 = objc_opt_class(self);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentNoteLastViewedDate"));
    LOBYTE(v28) = objc_msgSend((id)v28, "lastViewedDateExpired:currentDate:", v29, v15);

    if ((v28 & 1) != 0)
      goto LABEL_31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentStoreCoordinator"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentNoteObjectIDURL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ic_managedObjectIDForURIRepresentation:", v31));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[ICNote ic_existingObjectWithID:context:](ICNote, "ic_existingObjectWithID:context:", v32, v13));

    v20 = os_log_create("com.apple.notes", "QuickNote");
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
  }
  v71 = (objc_class *)objc_opt_class(self);
  v72 = NSStringFromClass(v71);
  v79 = (void *)objc_claimAutoreleasedReturnValue(v72);
  v73 = NSStringFromSelector(a2);
  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "shortLoggingDescription"));
  *(_DWORD *)buf = 138412802;
  v81 = v79;
  v82 = 2112;
  v83 = v74;
  v84 = 2112;
  v85[0] = v75;
  v76 = (void *)v75;
  _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ %@ found %@", buf, 0x20u);

LABEL_25:
  v18 = v20;
LABEL_26:

  if (v19)
  {
    if (!objc_msgSend(v19, "isDeletedOrInTrash"))
      goto LABEL_37;

    v33 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      sub_1004074E0((uint64_t)self);

  }
LABEL_31:
  v19 = (id)objc_claimAutoreleasedReturnValue(-[ICQuickNoteSessionManager createdNoteForSession](self, "createdNoteForSession"));
  if (!v19)
  {
    v19 = -[ICQuickNoteSessionManager newEmptyNoteInContext:](self, "newEmptyNoteInContext:", v13);
    -[ICQuickNoteSessionManager setCreatedNoteForSession:](self, "setCreatedNoteForSession:", v19);
    if (a7)
      *a7 = 1;
    v34 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v48 = (objc_class *)objc_opt_class(self);
      v49 = NSStringFromClass(v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      v51 = NSStringFromSelector(a2);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "shortLoggingDescription"));
      *(_DWORD *)buf = 138412802;
      v81 = v50;
      v82 = 2112;
      v83 = v52;
      v84 = 2112;
      v85[0] = v53;
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%@ %@ created new note %@", buf, 0x20u);

    }
  }
LABEL_37:
  v35 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v42 = (objc_class *)objc_opt_class(self);
    v43 = NSStringFromClass(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = NSStringFromSelector(a2);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "shortLoggingDescription"));
    *(_DWORD *)buf = 138412802;
    v81 = v44;
    v82 = 2112;
    v83 = v46;
    v84 = 2112;
    v85[0] = v47;
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%@ %@ note %@", buf, 0x20u);

  }
  return v19;
}

- (void)beginSessionWithNoteEditorViewController:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (-[ICQuickNoteSessionManager isQuickNoteSessionActive](self, "isQuickNoteSessionActive"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.isQuickNoteSessionActive", "-[ICQuickNoteSessionManager beginSessionWithNoteEditorViewController:]", 1, 0, CFSTR("Beginning a quicknote session when one is active"));
  -[ICQuickNoteSessionManager setQuickNoteSessionActive:](self, "setQuickNoteSessionActive:", 1);
  -[ICQuickNoteSessionManager setNoteEditorViewController:](self, "setNoteEditorViewController:", v4);

  v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100407580(self);

}

- (void)saveSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (!-[ICQuickNoteSessionManager isQuickNoteSessionActive](self, "isQuickNoteSessionActive"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isQuickNoteSessionActive", "-[ICQuickNoteSessionManager saveSession]", 1, 0, CFSTR("Attempting to save a quicknote session when one is not active"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuickNoteSessionManager noteEditorViewController](self, "noteEditorViewController"));

  if (!v3)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.noteEditorViewController", "-[ICQuickNoteSessionManager saveSession]", 1, 0, CFSTR("Attempting to save a quicknote session without a note editor"));
  v4 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100407634(self);

  if (-[ICQuickNoteSessionManager isQuickNoteSessionActive](self, "isQuickNoteSessionActive"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuickNoteSessionManager noteEditorViewController](self, "noteEditorViewController"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuickNoteSessionManager viewControllerManager](self, "viewControllerManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowStateArchive"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      objc_msgSend(v8, "saveQuicknoteArchiveState:", v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      objc_msgSend(v9, "saveLastBackgroundedArchiveState:", v7);

    }
  }
}

- (void)endSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[ICQuickNoteSessionManager isQuickNoteSessionActive](self, "isQuickNoteSessionActive"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isQuickNoteSessionActive", "-[ICQuickNoteSessionManager endSession]", 1, 0, CFSTR("Ending a quicknote session when one is not active"));
  v3 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1004076E8(self);

  if (+[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuickNoteSessionManager noteEditorViewController](self, "noteEditorViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "note"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v6, "setCurrentNote:", v5);

  }
  -[ICQuickNoteSessionManager saveSession](self, "saveSession");
  -[ICQuickNoteSessionManager setQuickNoteSessionActive:](self, "setQuickNoteSessionActive:", 0);
  -[ICQuickNoteSessionManager setNoteEditorViewController:](self, "setNoteEditorViewController:", 0);
  -[ICQuickNoteSessionManager setCreatedNoteForSession:](self, "setCreatedNoteForSession:", 0);
}

- (id)newEmptyNoteInContext:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  __int16 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultFolder"));
  v5 = +[ICNote newEmptyNoteInFolder:](ICNote, "newEmptyNoteInFolder:", v4);

  v6 = objc_opt_class(NSNumber);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", CFSTR("PaperStyle")));
  v8 = ICCheckedDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "intValue");

  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;
  objc_msgSend(v5, "setPaperStyleType:", v11);

  return v5;
}

+ (BOOL)lastViewedDateExpired:(id)a3 currentDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  int v9;
  NSObject *v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;

  v5 = a3;
  v6 = a4;
  v7 = (uint64_t)+[ICQuickNoteSessionSettings sessionDuration](ICQuickNoteSessionSettings, "sessionDuration");
  v8 = (double)v7;
  if (v7 == -1)
  {
    v9 = 0;
    goto LABEL_14;
  }
  if (v5)
  {
    if (v7 == -2)
    {
      v9 = objc_msgSend(v5, "ic_isToday") ^ 1;
      v10 = os_log_create("com.apple.notes", "QuickNote");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_10040779C();
LABEL_12:

      goto LABEL_14;
    }
    if (v7 >= 1)
    {
      objc_msgSend(v6, "timeIntervalSinceDate:", v5);
      v12 = v11;
      v13 = os_log_create("com.apple.notes", "QuickNote");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_100407890();

      v9 = v12 > v8;
      v10 = os_log_create("com.apple.notes", "QuickNote");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_100407810();
      goto LABEL_12;
    }
  }
  v9 = 1;
LABEL_14:
  v14 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138413058;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = v8;
    v22 = 1024;
    v23 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "lastViewedDateExpired:%@ currentDate:%@ sessionDuration %f expired %d", (uint8_t *)&v16, 0x26u);
  }

  return v9;
}

- (ICNoteEditorViewController)noteEditorViewController
{
  return self->_noteEditorViewController;
}

- (void)setNoteEditorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_noteEditorViewController, a3);
}

- (BOOL)isQuickNoteSessionActive
{
  return self->_quickNoteSessionActive;
}

- (void)setQuickNoteSessionActive:(BOOL)a3
{
  self->_quickNoteSessionActive = a3;
}

- (BOOL)isSecureScreenShowing
{
  return self->_secureScreenShowing;
}

- (void)setSecureScreenShowing:(BOOL)a3
{
  self->_secureScreenShowing = a3;
}

- (ICNote)createdNoteForSession
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_createdNoteForSession);
}

- (void)setCreatedNoteForSession:(id)a3
{
  objc_storeWeak((id *)&self->_createdNoteForSession, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_createdNoteForSession);
  objc_storeStrong((id *)&self->_noteEditorViewController, 0);
}

@end

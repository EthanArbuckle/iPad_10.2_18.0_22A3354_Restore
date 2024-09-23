@implementation ICQuicknoteWindowSceneDelegate

- (ICViewControllerManager)viewControllerManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuicknoteWindowSceneDelegate icWindow](self, "icWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllerManager"));

  return (ICViewControllerManager *)v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;

  v6 = a3;
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[ICQuicknoteWindowSceneDelegate scene:willConnectToSession:options:]";
    v16 = 1024;
    v17 = 45;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v14, 0x12u);
  }

  v8 = objc_opt_class(UIWindowScene);
  v9 = ICDynamicCast(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayIdentity"));
  v13 = objc_msgSend(v12, "expectsSecureRendering");

  if (v13)
    -[ICQuicknoteWindowSceneDelegate setupQuickNoteWithWindowScene:](self, "setupQuickNoteWithWindowScene:", v10);
  else
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICQuicknoteWindowSceneDelegate scene:willConnectToSession:options:]", 1, 0, CFSTR("Trying to show non secure screen with secure window scene delegate"));

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _BYTE buf[24];
  char v17;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[ICQuicknoteWindowSceneDelegate sceneWillEnterForeground:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 61;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));

  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountsWithAccountType:context:](ICAccount, "accountsWithAccountType:context:", 1, v7));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100100AD4;
  v15[3] = &unk_100553438;
  v15[4] = buf;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    goto LABEL_7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountsWithAccountType:context:](ICAccount, "accountsWithAccountType:context:", 3, v7));
  v10 = objc_msgSend(v9, "count");
  if (v10)
    LOBYTE(v10) = +[ICMigrationController didChooseToMigrateLocalAccount](ICMigrationController, "didChooseToMigrateLocalAccount");
  *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = (_BYTE)v10;

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
LABEL_7:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuicknoteWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    objc_msgSend(v11, "dismissAnyPresentedViewControllerAnimated:completion:", 0, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
    objc_msgSend(v12, "setSecureScreenShowing:", 1);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuicknoteWindowSceneDelegate icWindow](self, "icWindow"));
  objc_msgSend(v13, "setHidden:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICQuicknoteWindowSceneDelegate icWindow](self, "icWindow"));
  objc_msgSend(v14, "makeKeyWindow");

  _Block_object_dispose(buf, 8);
}

- (void)sceneDidDisconnect:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100100B70;
  v3[3] = &unk_100550110;
  v3[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

- (void)setupQuickNoteWithWindowScene:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  ICViewControllerManager *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  ICViewControllerManager *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  ICViewControllerManager *v29;
  unsigned __int8 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[ICQuicknoteWindowSceneDelegate setupQuickNoteWithWindowScene:]";
    v33 = 1024;
    v34 = 133;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v9 = objc_msgSend(objc_alloc((Class)ICSecureWindow), "initWithWindowScene:behavior:", v4, 2);

  v10 = objc_alloc_init(ICViewControllerManager);
  objc_msgSend(v9, "setViewControllerManager:", v10);
  v11 = +[ICQuickNoteSessionSettings showOnLockScreen](ICQuickNoteSessionSettings, "showOnLockScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v13 = v12;
  if (v11 == (id)3)
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "quicknoteArchiveState"));
  else
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastBackgroundedArchiveState"));
  v15 = (void *)v14;

  v16 = +[ICQuickNoteSessionManager requirePasscodeInContext:stateArchive:](ICQuickNoteSessionManager, "requirePasscodeInContext:stateArchive:", v7, v15);
  -[ICViewControllerManager setupWithWindow:stateRestoreArchive:completion:](v10, "setupWithWindow:stateRestoreArchive:completion:", v9, 0, 0);
  -[ICQuicknoteWindowSceneDelegate setIcWindow:](self, "setIcWindow:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards"));
  objc_msgSend(v17, "setEnableMultiscreenHack:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewControllerManager noteEditorViewController](v10, "noteEditorViewController"));
  objc_msgSend(v8, "saveSession");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10010100C;
  v24[3] = &unk_100554F10;
  v25 = v18;
  v26 = v8;
  v27 = v7;
  v28 = v15;
  v29 = v10;
  v30 = v16;
  v19 = v10;
  v20 = v15;
  v21 = v7;
  v22 = v8;
  v23 = v18;
  dispatchMainAfterDelay(v24, 0.0);

}

- (ICSecureWindow)icWindow
{
  return self->_icWindow;
}

- (void)setIcWindow:(id)a3
{
  objc_storeStrong((id *)&self->_icWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icWindow, 0);
}

@end

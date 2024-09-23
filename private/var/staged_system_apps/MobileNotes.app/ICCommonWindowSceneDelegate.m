@implementation ICCommonWindowSceneDelegate

- (ICViewControllerManager)viewControllerManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate icWindow](self, "icWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllerManager"));

  return (ICViewControllerManager *)v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  v7 = a5;
  v8 = a3;
  v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[ICCommonWindowSceneDelegate scene:willConnectToSession:options:]";
    v15 = 1024;
    v16 = 36;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v13, 0x12u);
  }

  v10 = objc_opt_class(UIWindowScene);
  v11 = ICDynamicCast(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  -[ICCommonWindowSceneDelegate ic_setupWithScene:options:](self, "ic_setupWithScene:options:", v12, v7);
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
    v5 = "-[ICCommonWindowSceneDelegate sceneDidBecomeActive:]";
    v6 = 1024;
    v7 = 48;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }

}

- (void)sceneWillResignActive:(id)a3
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
    v5 = "-[ICCommonWindowSceneDelegate sceneWillResignActive:]";
    v6 = 1024;
    v7 = 53;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }

}

- (BOOL)_appropriateToSetupSBSceneWithManagedObjectContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountsWithAccountType:context:](ICAccount, "accountsWithAccountType:context:", 1, v3));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A5CE4;
  v10[3] = &unk_100553438;
  v10[4] = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  if (*((_BYTE *)v12 + 24))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount accountsWithAccountType:context:](ICAccount, "accountsWithAccountType:context:", 3, v3));
    v8 = objc_msgSend(v7, "count");
    if (v8)
      LOBYTE(v8) = +[ICMigrationController didChooseToMigrateLocalAccount](ICMigrationController, "didChooseToMigrateLocalAccount");
    *((_BYTE *)v12 + 24) = (_BYTE)v8;

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)sceneWillEnterForeground:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ICCommonWindowSceneDelegate sceneWillEnterForeground:]";
    v13 = 1024;
    v14 = 83;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));

  if (-[ICCommonWindowSceneDelegate _appropriateToSetupSBSceneWithManagedObjectContext:](self, "_appropriateToSetupSBSceneWithManagedObjectContext:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));

    if (!v7)
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.viewControllerManager) != nil)", "-[ICCommonWindowSceneDelegate sceneWillEnterForeground:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.viewControllerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    objc_msgSend(v8, "dismissAnyPresentedViewControllerAnimated:completion:", 0, 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate icWindow](self, "icWindow"));
  objc_msgSend(v9, "setHidden:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate icWindow](self, "icWindow"));
  objc_msgSend(v10, "makeKeyWindow");

}

- (void)sceneDidEnterBackground:(id)a3
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
    v5 = "-[ICCommonWindowSceneDelegate sceneDidEnterBackground:]";
    v6 = 1024;
    v7 = 99;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v4, 0x12u);
  }

}

- (void)sharedDisconnect
{
  -[ICCommonWindowSceneDelegate sharedDisconnectWithSessionManager:](self, "sharedDisconnectWithSessionManager:", 0);
}

- (void)sharedDisconnectWithSessionManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "noteEditorViewController"));

  if (!v5)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteEditorVC) != nil)", "-[ICCommonWindowSceneDelegate sharedDisconnectWithSessionManager:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "noteEditorVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "note"));
  if (v14 && objc_msgSend(v14, "isSessionActive"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
    v8 = objc_opt_respondsToSelector(v7, "prepareForDismissal");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
      objc_msgSend(v9, "prepareForDismissal");

    }
    objc_msgSend(v14, "endSession");
  }
  if (objc_msgSend(v6, "isEmpty"))
  {
    +[ICNote deleteEmptyNote:](ICNote, "deleteEmptyNote:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    objc_msgSend(v10, "ic_save");
  }
  else
  {
    objc_msgSend(v5, "saveNote");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    objc_msgSend(v11, "saveImmediately");

    objc_msgSend(v5, "updateInlineDrawings");
    objc_msgSend(v5, "resetTextViewUndoManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentAttachmentPresenter"));
    objc_msgSend(v12, "dismissAnimated:completion:", 0, 0);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCommonWindowSceneDelegate viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v13, "dismissAnyPresentedViewControllerAnimated:completion:", 0, 0);

  -[ICCommonWindowSceneDelegate setIcWindow:](self, "setIcWindow:", 0);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[ICCommonWindowSceneDelegate sceneDidDisconnect:]";
    v11 = 1024;
    v12 = 145;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A6294;
  v7[3] = &unk_10054FE80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);

}

- (ICWindow)icWindow
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

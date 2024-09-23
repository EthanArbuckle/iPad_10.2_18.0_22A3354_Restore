@implementation ICPagesHandoffManager

+ (void)updatePagesInstallationStatus
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "+[ICPagesHandoffManager updatePagesInstallationStatus]", 1, 0, CFSTR("Unexpected call from main thread"));
  v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifierForPages"));
  v8 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivityTypes"));
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("appleiwork:com.apple.Pages.NoteImport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setBool:forKey:", v6, CFSTR("canLaunchPages"));

}

+ (id)bundleIdentifierForPages
{
  return CFSTR("com.apple.Pages");
}

+ (BOOL)canLaunchPages
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("canLaunchPages"));

  return v3;
}

+ (BOOL)canLaunchPagesForNote:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (!v4)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "+[ICPagesHandoffManager canLaunchPagesForNote:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "note");
  if (objc_msgSend(a1, "canLaunchPages"))
  {
    if (objc_msgSend(v4, "isPasswordProtected"))
      v5 = objc_msgSend(v4, "isAuthenticated");
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)launchPagesWithArchiveFromNote:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  ICLongRunningTaskController *v8;
  ICLongRunningTaskController *taskController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (ICLongRunningTaskController *)objc_alloc_init((Class)ICLongRunningTaskController);
  taskController = self->_taskController;
  self->_taskController = v8;

  -[ICLongRunningTaskController setShouldShowCancelButton:](self->_taskController, "setShouldShowCancelButton:", 1);
  -[ICLongRunningTaskController setAllowSingleUnitProgress:](self->_taskController, "setAllowSingleUnitProgress:", 1);
  -[ICLongRunningTaskController setIndeterminate:](self->_taskController, "setIndeterminate:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Preparing…"), &stru_1005704B8, 0));
  -[ICLongRunningTaskController setProgressString:](self->_taskController, "setProgressString:", v11);

  -[ICLongRunningTaskController setShouldShowCircularProgress:](self->_taskController, "setShouldShowCircularProgress:", 1);
  -[ICLongRunningTaskController setViewControllerToPresentFrom:](self->_taskController, "setViewControllerToPresentFrom:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICArchiveExporter exporterForHandoffToPages](ICArchiveExporter, "exporterForHandoffToPages"));
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_1000C56C4;
  v24[4] = sub_1000C56D4;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1000C56C4;
  v22[4] = sub_1000C56D4;
  v23 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffManager taskController](self, "taskController"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C56DC;
  v17[3] = &unk_100553EA8;
  v20 = v24;
  v14 = v12;
  v18 = v14;
  v15 = v6;
  v19 = v15;
  v21 = v22;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C57C0;
  v16[3] = &unk_100554018;
  v16[4] = v24;
  v16[5] = v22;
  objc_msgSend(v13, "startTask:completionBlock:", v17, v16);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

- (ICLongRunningTaskController)taskController
{
  return self->_taskController;
}

- (void)setTaskController:(id)a3
{
  objc_storeStrong((id *)&self->_taskController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskController, 0);
}

@end

@implementation MailRestorationStateClearer

+ (void)clearAllRestorationStates:(id)a3 errorHandler:(id)a4
{
  id v5;
  void (**v6)(id, id);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
  objc_msgSend(v8, "setWindowDismissalAnimation:", 3);
  if (objc_msgSend(v7, "supportsMultipleScenes"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "openSessions"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000F3524;
    v16[3] = &unk_10051E918;
    v17 = v5;
    v18 = v7;
    v19 = v8;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLsForDirectory:inDomains:", 5, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Saved Application State/com.apple.mobilemail.savedState"), 1, v12));
  v15 = 0;
  objc_msgSend(v10, "removeItemAtURL:error:", v13, &v15);
  v14 = v15;
  if (v14)
  {
    if (v6)
      v6[2](v6, v14);
  }
  else
  {
    objc_msgSend(v7, "terminateWithSuccess");
  }

}

@end

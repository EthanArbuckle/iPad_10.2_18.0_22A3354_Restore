@implementation CRLiOSScribbleInteractionSetupHelper

+ (void)setupScribbleEditingProvider:(id)a3 scribbleObserver:(id)a4 scribbleActive:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  CRLiOSScribbleInteractionDelegate *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scribbleInteraction"));
  v10 = v9;
  if (v5)
  {

    if (v10)
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233F68);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF46E0(v11, v12);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233F88);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSScribbleInteractionSetupHelper setupScribbleEditingProvider:scribbleObserver:scribbleActive:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionSetupHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 24, 0, "expected nil value for '%{public}s'", "editingProvider.scribbleInteraction");

    }
    v16 = -[CRLiOSScribbleInteractionDelegate initWithEditingProvider:scribbleInteractionObserver:]([CRLiOSScribbleInteractionDelegate alloc], "initWithEditingProvider:scribbleInteractionObserver:", v7, v8);
    objc_msgSend(v7, "setScribbleInteractionDelegate:", v16);

    v17 = objc_alloc((Class)UIIndirectScribbleInteraction);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scribbleInteractionDelegate"));
    v19 = objc_msgSend(v17, "initWithDelegate:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v20, "addInteraction:", v19);

    v21 = objc_alloc((Class)UIScribbleInteraction);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scribbleInteractionDelegate"));
    v23 = objc_msgSend(v21, "initWithDelegate:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v24, "addInteraction:", v23);

    objc_msgSend(v7, "setScribbleInteraction:", v19);
    objc_msgSend(v7, "setDirectScribbleInteraction:", v23);

  }
  else
  {

    if (v10)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scribbleInteraction"));
      objc_msgSend(v25, "removeInteraction:", v26);

      objc_msgSend(v7, "setScribbleInteraction:", 0);
    }
    objc_msgSend(v7, "setScribbleInteractionDelegate:", 0);
    objc_msgSend(v7, "setDirectScribbleInteraction:", 0);
  }

}

@end

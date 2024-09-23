@implementation MFNotificationViewController

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000193E4;
  block[3] = &unk_100038A50;
  block[4] = a1;
  if (qword_1000443B8 != -1)
    dispatch_once(&qword_1000443B8, block);
  return (OS_os_log *)(id)qword_1000443B0;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  UIEdgeInsets *p_minMargins;
  uint64_t v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  void *v32;
  double v33;
  objc_super v34;
  uint8_t buf[24];
  UIEdgeInsets v36;

  v34.receiver = self;
  v34.super_class = (Class)MFNotificationViewController;
  -[MFNotificationViewController viewDidLoad](&v34, "viewDidLoad");
  v3 = objc_alloc_init((Class)EMDaemonInterface);
  -[MFNotificationViewController setDaemonInterface:](self, "setDaemonInterface:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController daemonInterface](self, "daemonInterface"));
  +[MFWKWebViewFactory setDaemonInterface:URLCacheWithMemoryCapacity:](MFWKWebViewFactory, "setDaemonInterface:URLCacheWithMemoryCapacity:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController daemonInterface](self, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vipManager"));
  +[VIPManager setBackingManager:](VIPManager, "setBackingManager:", v6);

  v7 = objc_alloc_init((Class)MUICachingSVGConverter);
  v8 = objc_alloc((Class)MUIBrandIndicatorProvider);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController daemonInterface](self, "daemonInterface"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageRepository"));
  v11 = objc_msgSend(v8, "initWithMessageRepository:svgConverter:", v10, v7);
  -[MFNotificationViewController setBrandIndicatorProvider:](self, "setBrandIndicatorProvider:", v11);

  -[MFNotificationViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController view](self, "view"));
  -[MFNotificationViewController setIsRTL:](self, "setIsRTL:", objc_msgSend(v20, "mf_prefersRightToLeftInterfaceLayout"));

  MFEdgeInsetsFromDirectionalEdgeInsets(-[MFNotificationViewController isRTL](self, "isRTL"), v13, v15, v17, v19);
  v21 = -[MFNotificationViewController setMinMargins:](self, "setMinMargins:");
  p_minMargins = &self->_minMargins;
  if (self->_minMargins.top == 0.0
    || self->_minMargins.right == 0.0
    || self->_minMargins.bottom == 0.0
    || self->_minMargins.left == 0.0)
  {
    v23 = MSUserNotificationsLog(v21);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v36.top = p_minMargins->top;
      v36.left = self->_minMargins.left;
      v36.bottom = self->_minMargins.bottom;
      v36.right = self->_minMargins.right;
      v25 = NSStringFromUIEdgeInsets(v36);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      sub_10001DB8C(v26, buf, v24);
    }

    __asm { FMOV            V0.2D, #16.0 }
    *(_OWORD *)&p_minMargins->top = _Q0;
    *(_OWORD *)&self->_minMargins.bottom = _Q0;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v32, "bounds");
  -[MFNotificationViewController setScreenHeight:](self, "setScreenHeight:", v33);

}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;

  v10.receiver = self;
  v10.super_class = (Class)MFNotificationViewController;
  v4 = -[MFNotificationViewController viewDidDisappear:](&v10, "viewDidDisappear:", a3);
  v5 = MSUserNotificationsLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
    *(_DWORD *)buf = 134218242;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: canceling promise for URL %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageDisplayPromise](self, "messageDisplayPromise"));
  objc_msgSend(v9, "cancel");

  -[MFNotificationViewController setIsDisplayingMessage:](self, "setIsDisplayingMessage:", 0);
}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  LAContext *v21;
  LAContext *context;
  NSBundle *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  os_signpost_id_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  void *v34;

  v4 = a3;
  if (!-[MFNotificationViewController isDisplayingMessage](self, "isDisplayingMessage"))
  {
    -[MFNotificationViewController setIsDisplayingMessage:](self, "setIsDisplayingMessage:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController daemonInterface](self, "daemonInterface"));

    if (v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[MFNotificationViewController signpostLog](MFNotificationViewController, "signpostLog"));
      v7 = os_signpost_id_generate(v6);

      v8 = objc_claimAutoreleasedReturnValue(+[MFNotificationViewController signpostLog](MFNotificationViewController, "signpostLog"));
      v9 = v8;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFNotificationPreview", "Starting message preview", buf, 2u);
      }

      -[MFNotificationViewController _setProgressUIVisible:animated:](self, "_setProgressUIVisible:animated:", 1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "content"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", MSUserNotificationContentKeyMessageReference));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
        -[MFNotificationViewController setMessageReferenceURL:](self, "setMessageReferenceURL:", v14);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v14));
        -[MFNotificationViewController setMessageReferenceURL:](self, "setMessageReferenceURL:", v16);

      }
      v18 = MSUserNotificationsLog(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
        *(_DWORD *)buf = 138412290;
        v34 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "NotificationPreview: handle longlook for message with URL %@", buf, 0xCu);

      }
      v21 = (LAContext *)objc_alloc_init((Class)LAContext);
      context = self->_context;
      self->_context = v21;

      v31[0] = &off_100039F88;
      v31[1] = &off_100039FA0;
      v32[0] = &__kCFBooleanTrue;
      v23 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("AUTHENTICATION_PROCESS_MAIL"), &stru_1000393A0, CFSTR("Main")));
      v32[1] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100019D2C;
      v28[3] = &unk_1000392A8;
      v29 = v26;
      v30 = v7;
      v28[4] = self;
      v27 = v26;
      EFPerformSyncWithProtectedDataAvailability(v28);

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NotificationExtensionErrorDomain"), 3, 0));
      -[MFNotificationViewController setError:](self, "setError:", v15);

    }
  }

}

- (void)_configureMessageRequestWithSignPostID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[4];
  id v13[2];
  id location;
  _QWORD v15[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController daemonInterface](self, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageRepository"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageObjectIDForURL:", v7));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001A2B4;
  v15[3] = &unk_1000392D0;
  v15[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "then:", v15));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A3DC;
  v12[3] = &unk_1000392F8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  objc_msgSend(v9, "onScheduler:addSuccessBlock:", v10, v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001AAC8;
  v11[3] = &unk_100039320;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend(v9, "onScheduler:addFailureBlock:", v10, v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)_notificationPreviewFailedWithError:(id)a3 singpostID:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  LAContext *context;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = MSUserNotificationsLog(-[MFNotificationViewController setError:](self, "setError:", v6));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
    v16 = 134218498;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: failed to display message for URL %@. Error: %lu", (uint8_t *)&v16, 0x20u);

  }
  v12 = objc_claimAutoreleasedReturnValue(+[MFNotificationViewController signpostLog](MFNotificationViewController, "signpostLog"));
  v13 = v12;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = objc_msgSend(v6, "code");
    v16 = 134349056;
    v17 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, a4, "MFNotificationPreview", "Failure %{public, name=errorCode}lu", (uint8_t *)&v16, 0xCu);
  }

  -[MFNotificationViewController _resetMessageListAndPromise](self, "_resetMessageListAndPromise");
  context = self->_context;
  self->_context = 0;

}

- (void)setError:(id)a3
{
  NSError *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[24];

  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    objc_storeStrong((id *)&self->_error, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController _errorLabel](self, "_errorLabel"));
    objc_msgSend(v6, "addSubview:", v7);

    v8 = MSUserNotificationsLog(-[MFNotificationViewController _setProgressUIVisible:animated:](self, "_setProgressUIVisible:animated:", 0, 0));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v5, "userInfo"));
      sub_10001DBE0(v10, v11, v9);
    }

  }
}

- (id)_errorLabel
{
  double v3;
  CGFloat v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  id v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGRect v17;
  CGRect v18;

  -[MFNotificationViewController minMargins](self, "minMargins");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v18 = CGRectInset(v17, v4, v4);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;

  v10 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", x, y, width, height);
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MESSAGE_CAUSED_PROBLEM"), &stru_1000393A0, CFSTR("Main")));
  objc_msgSend(v10, "setText:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  objc_msgSend(v10, "setTextColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0));
  objc_msgSend(v10, "setFont:", v15);

  objc_msgSend(v10, "setNumberOfLines:", 3);
  objc_msgSend(v10, "setTextAlignment:", 1);
  return v10;
}

- (id)_configureMessageListAndPromiseForQuery:(id)a3 repository:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  -[MFNotificationViewController _resetMessageListAndPromise](self, "_resetMessageListAndPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  -[MFNotificationViewController setMessageDisplayPromise:](self, "setMessageDisplayPromise:", v8);

  v9 = objc_msgSend(objc_alloc((Class)EMMessageList), "initWithQuery:repository:", v6, v7);
  -[MFNotificationViewController setMessageList:](self, "setMessageList:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
  objc_msgSend(v10, "beginObserving:", self);

  v12 = MSUserNotificationsLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
    v18 = 134218242;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: configured message list for URL:%@", (uint8_t *)&v18, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageDisplayPromise](self, "messageDisplayPromise"));

  return v16;
}

- (void)_resetMessageListAndPromise
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
    objc_msgSend(v6, "stopObserving:", self);

    -[MFNotificationViewController setMessageList:](self, "setMessageList:", 0);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageDisplayPromise](self, "messageDisplayPromise"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageDisplayPromise](self, "messageDisplayPromise"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "future"));

    objc_msgSend(v7, "cancel");
    -[MFNotificationViewController setMessageDisplayPromise:](self, "setMessageDisplayPromise:", 0);

  }
}

- (void)_determineMessageToDisplayForCollection:(id)a3 itemIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
  if (v7 == v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    if (v8)
    {
      objc_msgSend(v11, "stopObserving:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageDisplayPromise](self, "messageDisplayPromise"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListItemForItemID:", v8));
      objc_msgSend(v9, "finishWithFuture:", v10);

    }
  }

}

- (void)_setProgressUIVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  id v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  v7 = pthread_main_np();
  if ((_DWORD)v7 != 1)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFNotificationViewController.m"), 325, CFSTR("Current thread must be main"));

  }
  v8 = MSUserNotificationsLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
      v30 = 134218242;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: showing loading spinner for message URL:%@", (uint8_t *)&v30, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController loadingView](self, "loadingView"));
    v14 = v13 == 0;

    if (v14)
    {
      v15 = objc_alloc((Class)MFMessageContentLoadingView);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController view](self, "view"));
      objc_msgSend(v16, "frame");
      v17 = objc_msgSend(v15, "initWithFrame:");
      -[MFNotificationViewController setLoadingView:](self, "setLoadingView:", v17);

      v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("LOADING_ALL_CAPS"), &stru_1000393A0, CFSTR("Main")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController loadingView](self, "loadingView"));
      objc_msgSend(v21, "setLoadingTitle:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController view](self, "view"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController loadingView](self, "loadingView"));
      objc_msgSend(v22, "addSubview:", v23);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController loadingView](self, "loadingView"));
    objc_msgSend(v24, "setLoadingIndicatorVisible:", 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController loadingView](self, "loadingView"));
    objc_msgSend(v25, "setAutoresizingMask:", 18);
  }
  else
  {
    if (v10)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageList](self, "messageList"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
      v30 = 134218242;
      v31 = v26;
      v32 = 2112;
      v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: hiding loading spinner for message URL:%@", (uint8_t *)&v30, 0x16u);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController loadingView](self, "loadingView"));
    objc_msgSend(v28, "setLoadingIndicatorVisible:", 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController loadingView](self, "loadingView"));
    objc_msgSend(v25, "removeFromSuperview");
  }

}

- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  NSSize v26;

  v6 = a3;
  -[MFNotificationViewController _setProgressUIVisible:animated:](self, "_setProgressUIVisible:animated:", 0, 0);
  -[MFNotificationViewController screenHeight](self, "screenHeight");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController view](self, "view"));
  objc_msgSend(v9, "frame");
  if (v8 + v8 <= a4)
    v11 = v8 + v8;
  else
    v11 = a4;
  -[MFNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v11);

  v13 = MSUserNotificationsLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController messageReferenceURL](self, "messageReferenceURL"));
    -[MFNotificationViewController preferredContentSize](self, "preferredContentSize");
    v16 = NSStringFromSize(v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = 134218754;
    v19 = v6;
    v20 = 2048;
    v21 = a4;
    v22 = 2112;
    v23 = v15;
    v24 = 2114;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "NotificationPreview: %p: messageHeight is %f for message URL:%@ preferredHeight:%{public}@", (uint8_t *)&v18, 0x2Au);

  }
}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController daemonInterface](self, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageRepository"));
  objc_msgSend(v6, "noteViewOfRemoteContentLinks:", v7);

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MSUserNotificationsLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218242;
    v14 = objc_msgSend(v9, "count");
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NotificationPreview: adding %lu items after %{public}@", (uint8_t *)&v13, 0x16u);
  }

  -[MFNotificationViewController _determineMessageToDisplayForCollection:itemIDs:](self, "_determineMessageToDisplayForCollection:itemIDs:", v8, v9);
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MSUserNotificationsLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218242;
    v14 = objc_msgSend(v9, "count");
    v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NotificationPreview: adding %lu items before %{public}@", (uint8_t *)&v13, 0x16u);
  }

  -[MFNotificationViewController _determineMessageToDisplayForCollection:itemIDs:](self, "_determineMessageToDisplayForCollection:itemIDs:", v8, v9);
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MSUserNotificationsLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "NotificationPreview: item id changed from %{public}@ to %{public}@", buf, 0x16u);
  }

  if (v10)
  {
    v14 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    -[MFNotificationViewController _determineMessageToDisplayForCollection:itemIDs:](self, "_determineMessageToDisplayForCollection:itemIDs:", v8, v13);

  }
}

- (void)setActionsForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));

  if (objc_msgSend(v7, "shouldArchiveByDefault"))
    v8 = 9;
  else
    v8 = 8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController userNotificationActionForSwipeAction:](self, "userNotificationActionForSwipeAction:", v8));
  v10 = rightSwipeSetting(1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = +[MFTriageActionUtilities triageActionForActionKey:](MFTriageActionUtilities, "triageActionForActionKey:", v11);

  if (v12 == 16)
  {
    if (objc_msgSend(v7, "shouldArchiveByDefault"))
      v12 = 8;
    else
      v12 = 9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController userNotificationActionForSwipeAction:](self, "userNotificationActionForSwipeAction:", v12));
  v16[0] = v9;
  v16[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController extensionContext](self, "extensionContext"));
  objc_msgSend(v15, "setNotificationActions:", v14);

}

- (id)userNotificationActionForSwipeAction:(int64_t)a3
{
  _UNKNOWN **v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = (_UNKNOWN **)qword_1000443C0;
  if (!qword_1000443C0)
  {
    qword_1000443C0 = (uint64_t)&off_10003A0E0;

    v5 = &off_10003A0E0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v7)
    a3 = 2;
  switch(a3)
  {
    case 6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("NOTIFICATION_%@"), CFSTR("FLAG")));
      v9 = objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", MFImageGlyphFlag));
      break;
    case 8:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("NOTIFICATION_%@"), CFSTR("TRASH")));
      v9 = objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", MFImageGlyphTrash));
      break;
    case 9:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("NOTIFICATION_%@"), CFSTR("ARCHIVE")));
      v9 = objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", MFImageGlyphArchive));
      break;
    default:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("NOTIFICATION_%@"), CFSTR("READ")));
      v9 = objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", MFImageGlyphRead));
      break;
  }
  v10 = (void *)v9;
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v8, &stru_1000393A0, CFSTR("Main")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFNotificationViewController _notificationActionIdentifierForSwipeAction:](self, "_notificationActionIdentifierForSwipeAction:", a3));
  if (+[MFTriageActionUtilities isActionDestructive:](MFTriageActionUtilities, "isActionDestructive:", a3))
  {
    v15 = 3;
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", v14, v13, v15, v10));

  return v16;
}

- (id)_notificationActionIdentifierForSwipeAction:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MSMailNotificationActionIdentifierPrefix;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFTriageActionUtilities actionKeyForTriageAction:](MFTriageActionUtilities, "actionKeyForTriageAction:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", v4));

  return v5;
}

- (double)screenHeight
{
  return self->_screenHeight;
}

- (void)setScreenHeight:(double)a3
{
  self->_screenHeight = a3;
}

- (NSError)error
{
  return self->_error;
}

- (MFMessageContentLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (UIEdgeInsets)minMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minMargins.top;
  left = self->_minMargins.left;
  bottom = self->_minMargins.bottom;
  right = self->_minMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMinMargins:(UIEdgeInsets)a3
{
  self->_minMargins = a3;
}

- (NSURL)messageReferenceURL
{
  return self->_messageReferenceURL;
}

- (void)setMessageReferenceURL:(id)a3
{
  objc_storeStrong((id *)&self->_messageReferenceURL, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorProvider, a3);
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_messageList, a3);
}

- (EFPromise)messageDisplayPromise
{
  return self->_messageDisplayPromise;
}

- (void)setMessageDisplayPromise:(id)a3
{
  objc_storeStrong((id *)&self->_messageDisplayPromise, a3);
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)isDisplayingMessage
{
  return self->_isDisplayingMessage;
}

- (void)setIsDisplayingMessage:(BOOL)a3
{
  self->_isDisplayingMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_messageDisplayPromise, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_messageReferenceURL, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end

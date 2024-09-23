@implementation MFMessageScreenshotGenerator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001849F4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA228 != -1)
    dispatch_once(&qword_1005AA228, block);
  return (OS_os_log *)(id)qword_1005AA220;
}

- (MFMessageScreenshotGenerator)initWithScene:(id)a3
{
  id v4;
  MFMessageScreenshotGenerator *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *generationQueue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageScreenshotGenerator;
  v5 = -[MFMessageScreenshotGenerator init](&v9, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.mobilemail.screenshotgenerator", 0);
    generationQueue = v5->_generationQueue;
    v5->_generationQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v5;
}

- (MFMessageContentView)contentView
{
  MFMessageContentView *contentView;
  MFMessageContentView *v4;
  MFMessageContentView *v5;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = (MFMessageContentView *)objc_msgSend(objc_alloc((Class)MFMessageContentView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[MFMessageContentView setDelegate:](self->_contentView, "setDelegate:", self);
    contentView = self->_contentView;
  }
  return contentView;
}

- (void)generateScreenshotViewForMessage:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100184BFC;
  v9[3] = &unk_10051B928;
  v10 = a5;
  v8 = v10;
  -[MFMessageScreenshotGenerator generateScreenshotImageForMessage:configuration:completion:](self, "generateScreenshotImageForMessage:configuration:completion:", a3, a4, v9);

}

- (void)generateScreenshotImageForMessage:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100184DBC;
  v10[3] = &unk_10051E640;
  v10[4] = self;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v7 = v13;
  v8 = v12;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

}

- (void)_generateScreenshotImageForMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *generationQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MFMessageScreenshotGenerator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  generationQueue = self->_generationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100184E94;
  block[3] = &unk_10051C1C8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(generationQueue, block);

}

- (void)_setUpAndAddContentViewForMessage:(id)a3 configuration:(id)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  NSObject *v21;
  NSString *v22;
  id v23;
  NSString *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  MFConversationItemHeaderBlock *v34;
  double y;
  double width;
  double height;
  MFConversationItemHeaderBlock *v38;
  MessageHeaderSubjectBlock *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  id v66;
  id v67;
  _QWORD v68[2];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  CGSize v81;
  UIEdgeInsets v82;

  v67 = a3;
  v7 = a4;
  if (pthread_main_np() != 1)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageScreenshotGenerator.m"), 94, CFSTR("Current thread must be main"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectID"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));

  objc_msgSend(v7, "size");
  v64 = v10;
  v65 = v9;
  objc_msgSend(v7, "margins");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v7, "showSourceMailbox");
  v20 = objc_msgSend(v7, "showBanners");
  v21 = objc_claimAutoreleasedReturnValue(+[MFMessageScreenshotGenerator log](MFMessageScreenshotGenerator, "log"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v81.height = v64;
    v81.width = v65;
    v22 = NSStringFromCGSize(v81);
    v23 = (id)objc_claimAutoreleasedReturnValue(v22);
    v82.top = v12;
    v82.left = v14;
    v82.bottom = v16;
    v82.right = v18;
    v24 = NSStringFromUIEdgeInsets(v82);
    v25 = (id)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description"));
    v28 = NSStringFromBOOL(v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = NSStringFromBOOL(v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(_DWORD *)buf = 138544642;
    v70 = v63;
    v71 = 2114;
    v72 = v23;
    v73 = 2114;
    v74 = v25;
    v75 = 2114;
    v76 = v27;
    v77 = 2114;
    v78 = v29;
    v79 = 2114;
    v80 = v31;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting setup of content view for message - libraryid=%{public}@, size=%{public}@, margins=%{public}@, %{public}@, mailboxSource=%{public}@, banners=%{public}@", buf, 0x3Eu);

  }
  kdebug_trace(730729680, 0, 0, 0, 0);
  v66 = objc_alloc_init((Class)CNContactStore);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "accountsProvider"));

  v34 = [MFConversationItemHeaderBlock alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v38 = -[MFConversationItemHeaderBlock initWithFrame:contactStore:accountsProvider:](v34, "initWithFrame:contactStore:accountsProvider:", v66, v33, CGRectZero.origin.x, y, width, height);
  -[MFConversationItemHeaderBlock setDisplayOptions:](v38, "setDisplayOptions:", 12);
  v39 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v68[0] = v38;
  v68[1] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "headerView"));
  objc_msgSend(v42, "setHeaderBlocks:", v40);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v43, "setShowsBanners:", v20);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator scene](self, "scene"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v46, "safeAreaInsets");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v45, objc_msgSend(v44, "interfaceOrientation"), v12, v14, v16, v18, v47, v48, v49, v50));

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v52, "setFrame:", 0.0, 0.0, v65, v64);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v53, "setDisplayMetrics:", v51);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v54, "setLayoutMargins:", v12, v14, v16, v18);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v55, "setAlpha:", 0.0);

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "mf_window"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v56, "addSubview:", v57);

  kdebug_trace(730729684, 0, 0, 0, 0);
  kdebug_trace(730729720, 0, 0, 0, 0);
  v58 = objc_msgSend(objc_alloc((Class)MessageContentRepresentationRequest), "initWithMessage:", v67);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  objc_msgSend(v59, "setContentRequest:", v58);

  objc_msgSend(v58, "start");
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator contentView](self, "contentView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "headerView"));
  objc_msgSend(v61, "layoutIfNeeded");

}

- (void)messageContentViewDidFinishLoadingMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *messageFinishedLoadingSemaphore;
  int v10;
  void *v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MFMessageScreenshotGenerator log](MFMessageScreenshotGenerator, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loadingContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageID"));
    v10 = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "message content view finished loading libraryid=%{public}@", (uint8_t *)&v10, 0xCu);

  }
  messageFinishedLoadingSemaphore = self->_messageFinishedLoadingSemaphore;
  if (messageFinishedLoadingSemaphore)
    dispatch_semaphore_signal(messageFinishedLoadingSemaphore);

}

- (id)presentingViewControllerForMessageContentView:(id)a3
{
  return 0;
}

- (void)messageContentView:(id)a3 viewedRemoteURLs:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageScreenshotGenerator scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageRepository"));
  objc_msgSend(v7, "noteViewOfRemoteContentLinks:", v8);

}

- (MailScene)scene
{
  return (MailScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageFinishedLoadingSemaphore, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end

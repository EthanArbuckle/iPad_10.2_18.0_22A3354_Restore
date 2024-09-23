@implementation TPSNotificationExtensionViewController

- (void)dealloc
{
  objc_super v3;

  -[TPSNotificationExtensionViewController _destroyXPCConnection](self, "_destroyXPCConnection");
  v3.receiver = self;
  v3.super_class = (Class)TPSNotificationExtensionViewController;
  -[TPSNotificationExtensionViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  TPSSingleTipViewController *v7;
  TPSSingleTipViewController *singleTipViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)TPSNotificationExtensionViewController;
  -[TPSNotificationExtensionViewController viewDidLoad](&v27, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionHandler sharedInstance](TPSURLSessionHandler, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager"));
  objc_msgSend(v4, "setDefaultSessionDelegate:", v3);

  v5 = +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  if (!self->_singleTipViewController)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSUIAppController sharedInstance](TPSUIAppController, "sharedInstance"));
    v7 = -[TPSSingleTipViewController initWithAppController:]([TPSSingleTipViewController alloc], "initWithAppController:", v6);
    singleTipViewController = self->_singleTipViewController;
    self->_singleTipViewController = v7;

    -[TPSSingleTipViewController setDelegate:](self->_singleTipViewController, "setDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSSingleTipViewController view](self->_singleTipViewController, "view"));
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSNotificationExtensionViewController addChildViewController:](self, "addChildViewController:", self->_singleTipViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSNotificationExtensionViewController view](self, "view"));
    objc_msgSend(v10, "addSubview:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSNotificationExtensionViewController view](self, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
    objc_msgSend(v14, "setActive:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSNotificationExtensionViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSNotificationExtensionViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSNotificationExtensionViewController view](self, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
    objc_msgSend(v26, "setActive:", 1);

    -[TPSSingleTipViewController didMoveToParentViewController:](self->_singleTipViewController, "didMoveToParentViewController:", self);
  }
  -[TPSNotificationExtensionViewController clearNotificationIgnoreCount](self, "clearNotificationIgnoreCount");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSNotificationExtensionViewController;
  -[TPSNotificationExtensionViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance"));
  objc_msgSend(v3, "syncCacheImmediately");

}

- (void)didReceiveNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "request"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "categoryIdentifier"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("tip-notification-extension"));

  v7 = v23;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "TPSSafeDictionaryForKey:", TPSDocumentDocumentRootKey));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "TPSSafeDictionaryForKey:", TPSMetadataRootKey));
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {
      v13 = 0;
      v14 = 0;
    }
    else
    {
      v14 = objc_msgSend(objc_alloc((Class)TPSMetadata), "initWithDictionary:", v10);
      v15 = objc_alloc((Class)TPSTip);
      v16 = objc_msgSend(v15, "initWithDictionary:metadata:identifierKey:", v9, v14, TPSTipDocumentIdKey);
      v13 = v16;
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetSizes"));
        -[TPSSingleTipViewController setAssetSizes:](self->_singleTipViewController, "setAssetSizes:", v17);

        -[TPSSingleTipViewController setTip:](self->_singleTipViewController, "setTip:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "TPSSafeStringForKey:", CFSTR("collectionId")));
        -[TPSSingleTipViewController setCollectionID:](self->_singleTipViewController, "setCollectionID:", v18);

      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "TPSSafeStringForKey:", CFSTR("collectionId")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "correlationID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", v19, v20, v21, TPSAnalyticsLaunchTypeNotification));
    objc_msgSend(v22, "log");

    v7 = v23;
  }

}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (_TPSXPCConnection)xpcConnection
{
  _TPSXPCConnection *xpcConnection;
  id v4;
  _TPSXPCConnection *v5;
  _TPSXPCConnection *v6;

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = objc_alloc((Class)_TPSXPCConnection);
    v5 = (_TPSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.tipsd"), _TPSDefaultXPCConnectionOptions);
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    -[_TPSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    -[_TPSXPCConnection resume](self->_xpcConnection, "resume");
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (void)_destroyXPCConnection
{
  _TPSXPCConnection *xpcConnection;

  -[_TPSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (id)exportedInterface
{
  return objc_alloc_init((Class)NSXPCInterface);
}

- (void)clearNotificationIgnoreCount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSNotificationExtensionViewController xpcConnection](self, "xpcConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &stru_100008398));

  if (v3)
    objc_msgSend(v3, "tipNotificationInteractedByUser");

}

- (void)markTipViewed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSNotificationExtensionViewController xpcConnection](self, "xpcConnection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_1000083B8));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      objc_msgSend(v6, "contentViewedForIdentifier:", v7);

    }
  }

}

- (void)singleTipViewController:(id)a3 tipViewed:(id)a4
{
  -[TPSNotificationExtensionViewController markTipViewed:](self, "markTipViewed:", a4);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_singleTipViewController, 0);
}

@end

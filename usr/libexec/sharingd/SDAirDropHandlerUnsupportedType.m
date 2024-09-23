@implementation SDAirDropHandlerUnsupportedType

- (SDAirDropHandlerUnsupportedType)initWithTransfer:(id)a3
{
  id v4;
  SDAirDropHandlerUnsupportedType *v5;
  SDAirDropHandleriCloudDrive *v6;
  SDAirDropHandleriCloudDrive *icloudDriveHandler;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SDAirDropHandlerUnsupportedType;
  v5 = -[SDAirDropHandler initWithTransfer:](&v10, "initWithTransfer:", v4);
  if (v5)
  {
    v6 = -[SDAirDropHandleriCloudDrive initWithTransfer:]([SDAirDropHandleriCloudDrive alloc], "initWithTransfer:", v4);
    icloudDriveHandler = v5->_icloudDriveHandler;
    v5->_icloudDriveHandler = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleProxy bundleProxyForIdentifier:](LSBundleProxy, "bundleProxyForIdentifier:", CFSTR("com.apple.AppStore")));
    -[SDAirDropHandler setBundleProxy:](v5, "setBundleProxy:", v8);

  }
  return v5;
}

- (BOOL)canHandleTransfer
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metaData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(v4, "count") == (id)1;

  return v5;
}

- (id)suitableContentsDescription
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = objc_msgSend(v4, "isVerifiableIdentity");

  v6 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  v8 = CFSTR("LINK_DEVICE_SENDING_REQUIRES_APP_TEXT");
  if (v5)
    v8 = CFSTR("LINK_PERSON_SENDING_REQUIRES_APP_TEXT");
  v9 = CFSTR("FILE_PERSON_SENDING_REQUIRES_APP_TEXT");
  if (!v5)
    v9 = CFSTR("FILE_DEVICE_SENDING_REQUIRES_APP_TEXT");
  if (v6)
    v10 = v9;
  else
    v10 = v8;
  v11 = SFLocalizedStringForKey(v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));

  return v14;
}

- (void)updatePossibleActions
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SDAirDropHandlerUnsupportedType;
  -[SDAirDropHandler updatePossibleActions](&v18, "updatePossibleActions");
  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));

  v7 = SFLocalizedStringForKey(CFSTR("GET_APP_BUTTON_TITLE"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setSingleItemLocalizedTitle:", v8);

  objc_msgSend(v5, "setShouldUpdateUserResponse:", 0);
  objc_msgSend(v5, "setMinRequiredTransferState:", 1);
  location = 0;
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100021F94;
  v15 = &unk_100714348;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v5, "setActionHandler:", &v12);
  -[NSMutableArray addObject:](v3, "addObject:", v5, v12, v13, v14, v15);
  if (-[SDAirDropHandleriCloudDrive canHandleTransfer](self->_icloudDriveHandler, "canHandleTransfer"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    -[SDAirDropHandler setCompletionHandler:](self->_icloudDriveHandler, "setCompletionHandler:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive action](self->_icloudDriveHandler, "action"));
    -[NSMutableArray addObject:](v3, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v11, "setPossibleActions:", v3);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)triggerAppStoreSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));

  if (objc_msgSend(v6, "isFile"))
    v7 = CFSTR("itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/docTypeLookup?uti=%@");
  else
    v7 = CFSTR("itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/docTypeLookup?scheme=%@");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

  v12 = airdrop_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Launching app store with URL: %@", buf, 0xCu);
  }

  -[SDAirDropHandler logReceiverBundleID:forAppProxy:andURL:](self, "logReceiverBundleID:forAppProxy:andURL:", 0, 0, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v14, "openURL:configuration:completionHandler:", v10, 0, 0);

}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icloudDriveHandler, 0);
}

@end

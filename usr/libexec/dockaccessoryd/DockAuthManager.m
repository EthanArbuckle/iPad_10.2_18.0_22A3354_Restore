@implementation DockAuthManager

- (DockAuthManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DockAuthManager;
  return -[DockAuthManager init](&v3, "init");
}

- (void)requestTokenMetadata:(id)a3 tokenUUID:(id)a4 model:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  const __CFString *v20;
  id v21;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  if (v9)
  {
    v20 = CFSTR("model");
    v21 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFAATokenManager sharedManager](MFAATokenManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008B64C;
  v18[3] = &unk_1002381D8;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v15, "requestMetadataForAuthToken:withUUID:requestedLocale:requestInfo:completionHandler:", v12, v16, v13, v14, v18);

}

@end

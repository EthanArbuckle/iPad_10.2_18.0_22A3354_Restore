@implementation FMDExtExtensionsDataSource

+ (id)sharedInstance
{
  if (qword_1003063F8 != -1)
    dispatch_once(&qword_1003063F8, &stru_1002C1668);
  return (id)qword_1003063F0;
}

- (FMDExtExtensionsDataSource)init
{
  FMDExtExtensionsDataSource *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *extensions;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v9[4];
  NSObject *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FMDExtExtensionsDataSource;
  v2 = -[FMDExtExtensionsDataSource init](&v11, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    extensions = v2->_extensions;
    v2->_extensions = v3;

    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012634;
    v9[3] = &unk_1002C1690;
    v10 = v5;
    v6 = v5;
    -[FMDExtExtensionsDataSource startDiscoveringExtensionsWithCompletion:](v2, "startDiscoveringExtensionsWithCompletion:", v9);
    v7 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v6, v7);

  }
  return v2;
}

+ (id)_allowedExtensionsIDForDataSource
{
  if (qword_100306408 != -1)
    dispatch_once(&qword_100306408, &stru_1002C16B0);
  return (id)qword_100306400;
}

- (void)startDiscoveringExtensionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  FMDExtExtensionsDataSource *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = sub_1000530AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionsDataSource _allowedExtensionsIDForDataSource](FMDExtExtensionsDataSource, "_allowedExtensionsIDForDataSource"));
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "starting to find extensions allowedExtensions = %@", buf, 0xCu);

  }
  v17 = NSExtensionPointName;
  v18 = CFSTR("com.apple.icloud.FindMyDevice.Accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10001285C;
  v14 = &unk_1002C1700;
  v15 = self;
  v16 = v4;
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSExtension beginMatchingExtensionsWithAttributes:completion:](NSExtension, "beginMatchingExtensionsWithAttributes:completion:", v8, &v11));
  -[FMDExtExtensionsDataSource setExtensionMatchToken:](self, "setExtensionMatchToken:", v10, v11, v12, v13, v14, v15);

}

- (void)_setCompleteionBlocksForExtension:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012D3C;
  v11[3] = &unk_1002C1728;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v12 = v4;
  objc_msgSend(v3, "setRequestCompletionBlock:", v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012DE0;
  v9[3] = &unk_1002C1750;
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "setRequestInterruptionBlock:", v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012E84;
  v7[3] = &unk_1002C1778;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v3, "setRequestCancellationBlock:", v7);

}

- (void)endDiscoveringExtensions
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtExtensionsDataSource extensionMatchToken](self, "extensionMatchToken"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtExtensionsDataSource extensionMatchToken](self, "extensionMatchToken"));
    +[NSExtension endMatchingExtensions:](NSExtension, "endMatchingExtensions:", v4);

    -[FMDExtExtensionsDataSource setExtensionMatchToken:](self, "setExtensionMatchToken:", 0);
  }
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (id)extensionMatchToken
{
  return self->_extensionMatchToken;
}

- (void)setExtensionMatchToken:(id)a3
{
  objc_storeStrong(&self->_extensionMatchToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionMatchToken, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end

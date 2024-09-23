@implementation FRArticleNotificationArticleSource

- (FRArticleNotificationArticleSource)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRArticleNotificationArticleSource init]";
    v7 = 2080;
    v8 = "FRArticleNotificationArticleSource.m";
    v9 = 1024;
    v10 = 28;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRArticleNotificationArticleSource init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)dealloc
{
  objc_super v3;

  +[FCExcerptURLProtocol unregister](FCExcerptURLProtocol, "unregister");
  v3.receiver = self;
  v3.super_class = (Class)FRArticleNotificationArticleSource;
  -[FRArticleNotificationArticleSource dealloc](&v3, "dealloc");
}

- (FRArticleNotificationArticleSource)initWithCachesDirectory:(id)a3
{
  id v4;
  FRArticleNotificationArticleSource *v5;
  uint64_t v6;
  NSURL *archiveFileURL;
  NSURL *v8;
  NSURL *cachesDirectory;
  objc_super v11;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100005858();
  v11.receiver = self;
  v11.super_class = (Class)FRArticleNotificationArticleSource;
  v5 = -[FRArticleNotificationArticleSource init](&v11, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", CFSTR("News"), v4));
    archiveFileURL = v5->_archiveFileURL;
    v5->_archiveFileURL = (NSURL *)v6;

    v8 = (NSURL *)objc_msgSend(v4, "copy");
    cachesDirectory = v5->_cachesDirectory;
    v5->_cachesDirectory = v8;

  }
  return v5;
}

- (FCContentContext)contentContext
{
  FCContentContext *contentContext;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  FCContentContext *v14;

  contentContext = self->_contentContext;
  if (!contentContext)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FCFeldsparIDProvider sharedInstance](FCFeldsparIDProvider, "sharedInstance"));
    v5 = objc_alloc((Class)FCConfigurationManager);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationArticleSource cachesDirectory](self, "cachesDirectory"));
    v8 = objc_msgSend(v5, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:", v6, v7, v4);

    v9 = objc_alloc((Class)FCContentContext);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationArticleSource cachesDirectory](self, "cachesDirectory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability"));
    v13 = objc_msgSend(v9, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:", v10, v8, v11, 0, v12, 82368, 1, 0, 0, 0, 0);

    objc_msgSend(v13, "enableFlushingWithFlushingThreshold:", 0);
    v14 = self->_contentContext;
    self->_contentContext = (FCContentContext *)v13;

    contentContext = self->_contentContext;
  }
  return contentContext;
}

- (void)fetchArticleWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100005920();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticleNotificationArticleSource contentContext](self, "contentContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "articleController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "articleWithID:qualityOfService:relativePriority:", v6, 25, 2));

  -[FRArticleNotificationArticleSource setLoadedArticle:](self, "setLoadedArticle:", v10);
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004204;
  v12[3] = &unk_100008300;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  objc_msgSend(v10, "performBlockWhenFullyLoaded:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (NSURL)cachesDirectory
{
  return self->_cachesDirectory;
}

- (void)setCachesDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)archiveFileURL
{
  return self->_archiveFileURL;
}

- (void)setArchiveFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FCArticle)loadedArticle
{
  return self->_loadedArticle;
}

- (void)setLoadedArticle:(id)a3
{
  objc_storeStrong((id *)&self->_loadedArticle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedArticle, 0);
  objc_storeStrong((id *)&self->_archiveFileURL, 0);
  objc_storeStrong((id *)&self->_cachesDirectory, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end

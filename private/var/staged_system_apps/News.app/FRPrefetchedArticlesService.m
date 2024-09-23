@implementation FRPrefetchedArticlesService

- (FRPrefetchedArticlesService)initWithFeldsparContext:(id)a3 assetManager:(id)a4
{
  id v7;
  id v8;
  FRPrefetchedArticlesService *v9;
  FRPrefetchedArticlesService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007D3C4();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007D2FC();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRPrefetchedArticlesService;
  v9 = -[FRPrefetchedArticlesService init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feldsparContext, a3);
    objc_storeStrong((id *)&v10->_assetManager, a4);
  }

  return v10;
}

- (id)ts_fetchArticlesWithURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000185F4;
  v13 = sub_10001851C;
  v14 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPrefetchedArticlesService assetManager](self, "assetManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003D098;
  v8[3] = &unk_1000DBA08;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "fr_feldsparArticleIDWithAssetManager:completion:", v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setFeldsparContext:(id)a3
{
  objc_storeStrong((id *)&self->_feldsparContext, a3);
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end

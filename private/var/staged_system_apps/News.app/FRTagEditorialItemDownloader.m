@implementation FRTagEditorialItemDownloader

- (FRTagEditorialItemDownloader)initWithTagController:(id)a3 editorialItemEntryManager:(id)a4
{
  id v7;
  id v8;
  FRTagEditorialItemDownloader *v9;
  FRTagEditorialItemDownloader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000849EC();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100084924();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRTagEditorialItemDownloader;
  v9 = -[FRTagEditorialItemDownloader init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tagController, a3);
    objc_storeStrong((id *)&v10->_editorialItemEntryManager, a4);
  }

  return v10;
}

- (void)downloadEditorialItemWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagEditorialItemDownloader tagController](self, "tagController"));
    v9 = &_dispatch_main_q;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100073334;
    v10[3] = &unk_1000DEDA8;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v8, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v6, 9, &_dispatch_main_q, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, void *))v7 + 2))(v7, &__NSDictionary0__struct);
  }

}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
}

@end

@implementation MTURLPresentationController

- (MTURLPresentationController)initWithURL:(id)a3
{
  id v5;
  MTURLPresentationController *v6;
  MTURLPresentationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTURLPresentationController;
  v6 = -[MTURLPresentationController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (BOOL)canShowWithPresentingViewController:(id)a3
{
  BOOL result;

  result = -[MTURLPresentationController _canShowInApp](self, "_canShowInApp");
  if (!a3)
    return 0;
  return result;
}

- (void)showWithPresentingViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTURLPresentationController url](self, "url"));
  -[MTURLPresentationController _showURL:presentingViewController:](self, "_showURL:presentingViewController:", v5, v4);

}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (BOOL)_canShowInApp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLPresentationController url](self, "url"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("http")) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("https"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_showURL:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  BOOL v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = -[MTURLPresentationController _canShowInApp](self, "_canShowInApp");
  v9 = v8;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v15 = _MTLogCategoryDefault(v8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid parameter.  url can not be nil", buf, 2u);
    }

    if (v7)
    {
LABEL_3:
      if (v9)
        goto LABEL_4;
LABEL_14:
      v19 = _MTLogCategoryDefault(v8);
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid use.  _canShowInApp is NO, so we shouldn't attempt to show in-app", v20, 2u);
      }
      goto LABEL_16;
    }
  }
  v17 = _MTLogCategoryDefault(v8);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid parameter.  presentingViewController can not be nil", v21, 2u);
  }

  if (!v9)
    goto LABEL_14;
LABEL_4:
  if (v6)
  {
    if (v7)
    {
      v10 = (objc_class *)objc_opt_class(v7);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = objc_msgSend(v12, "isEqual:", CFSTR("_UIContextMenuActionsOnlyViewController"));

      if ((v13 & 1) == 0)
      {
        v14 = objc_msgSend(objc_alloc((Class)SFSafariViewController), "initWithURL:", v6);
        -[NSObject setModalPresentationStyle:](v14, "setModalPresentationStyle:", 1);
        objc_msgSend(v7, "presentViewController:animated:completion:", v14, 1, 0);
LABEL_16:

      }
    }
  }

}

@end

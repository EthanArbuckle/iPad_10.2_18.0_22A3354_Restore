@implementation MapsWebLinkPresenter

- (MapsWebLinkPresenter)initWithPresentingViewController:(id)a3
{
  id v4;
  MapsWebLinkPresenter *v5;
  MapsWebLinkPresenter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MapsWebLinkPresenter;
  v5 = -[MapsWebLinkPresenter init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presentingViewController, v4);

  return v6;
}

- (void)presentWebURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  int IsEnabled_PlaceCardWebView;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[8];
  UIApplicationOpenExternalURLOptionsKey v17;
  void *v18;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString")),
        v7 = objc_msgSend(v6, "length"),
        v6,
        !v7))
  {
    v9 = sub_10021EE70();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "URL is nil, early exit", buf, 2u);
    }
    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (sub_1002A8AA0(WeakRetained) == 5)
  {

LABEL_9:
    v10 = objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    -[NSObject openURL:completionHandler:](v10, "openURL:completionHandler:", v5, 0);
LABEL_10:

    goto LABEL_11;
  }
  IsEnabled_PlaceCardWebView = MapsFeature_IsEnabled_PlaceCardWebView();

  if (!IsEnabled_PlaceCardWebView)
    goto LABEL_9;
  v12 = (void *)UIApp;
  v17 = UIApplicationOpenURLOptionUniversalLinksOnly;
  v18 = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10021EEB0;
  v14[3] = &unk_1011ACCB8;
  v14[4] = self;
  v15 = v5;
  objc_msgSend(v12, "_openURL:originatingView:options:completionHandler:", v15, 0, v13, v14);

LABEL_11:
}

- (BOOL)_isValidURLForWebView:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("http")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("https"));

  return v5;
}

- (BOOL)_isValidURLToOpen:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("mailto"));
  return (char)v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end

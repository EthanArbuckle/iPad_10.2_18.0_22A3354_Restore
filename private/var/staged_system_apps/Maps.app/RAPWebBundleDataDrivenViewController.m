@implementation RAPWebBundleDataDrivenViewController

- (RAPWebBundleDataDrivenViewController)initWithEntryPoint:(id)a3 report:(id)a4 title:(id)a5 data:(id)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  RAPWebBundleDataDrivenViewController *v16;
  RAPWebBundleDataDrivenViewController *v17;
  id v18;
  id replyHandler;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RAPWebBundleDataDrivenViewController;
  v16 = -[RAPWebBundleBaseViewController initWithReport:](&v21, "initWithReport:", a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_data, a6);
    objc_storeStrong((id *)&v17->_title, a5);
    v18 = objc_retainBlock(v15);
    replyHandler = v17->_replyHandler;
    v17->_replyHandler = v18;

    -[RAPWebBundleBaseViewController setEntryPointString:](v17, "setEntryPointString:", v12);
  }

  return v17;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPWebBundleDataDrivenViewController;
  -[RAPWebBundleBaseViewController viewDidLoad](&v3, "viewDidLoad");
  -[RAPWebBundleBaseViewController loadWebView](self, "loadWebView");
}

- (void)dismissModal
{
  id v3;
  id v4;

  if (sub_1002A8AA0(self) == 5)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleDataDrivenViewController navigationController](self, "navigationController"));
    v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleDataDrivenViewController presentingViewController](self, "presentingViewController"));
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_dismiss
{
  void (**replyHandler)(id, void *, _QWORD);
  void *v4;

  replyHandler = (void (**)(id, void *, _QWORD))self->_replyHandler;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  replyHandler[2](replyHandler, v4, 0);

  -[RAPWebBundleDataDrivenViewController dismissModal](self, "dismissModal");
}

- (void)_submit
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseViewController webView](self, "webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentWorld pageWorld](WKContentWorld, "pageWorld"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100777EA8;
  v5[3] = &unk_1011C6100;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", CFSTR("return rapGetModalData()"), 0, 0, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setupViews
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSString *title;
  void *v11;
  objc_super v12;

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_dismiss");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleDataDrivenViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] Data Driven Done"), CFSTR("localized string not found"), 0));
  v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, "_submit");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleDataDrivenViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  title = self->_title;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleDataDrivenViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setTitle:", title);

  v12.receiver = self;
  v12.super_class = (Class)RAPWebBundleDataDrivenViewController;
  -[RAPWebBundleBaseViewController setupViews](&v12, "setupViews");
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8;
  void (**v9)(id, id, _QWORD);
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  RAPWebBundleBaseContext *v15;
  void *v16;
  id v17;
  objc_super v18;

  v8 = a4;
  v9 = (void (**)(id, id, _QWORD))a5;
  v18.receiver = self;
  v18.super_class = (Class)RAPWebBundleDataDrivenViewController;
  -[RAPWebBundleBaseViewController didReceiveMessageFromUserContentController:message:replyHandler:](&v18, "didReceiveMessageFromUserContentController:message:replyHandler:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name")));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("context"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("supportedLocales")));
    v13 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));

      v12 = (void *)v14;
    }
    v15 = -[RAPWebBundleBaseContext initWithType:locales:]([RAPWebBundleBaseContext alloc], "initWithType:locales:", &stru_1011EB268, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseContext context](v15, "context"));
    v17 = objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "setObject:forKeyedSubscript:", self->_data, CFSTR("modalData"));
    v9[2](v9, v17, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

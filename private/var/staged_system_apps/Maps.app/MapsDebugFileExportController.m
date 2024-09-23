@implementation MapsDebugFileExportController

- (MapsDebugFileExportController)initWithFileAtURL:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  MapsDebugFileExportController *v8;
  MapsDebugFileExportController *v9;
  id v10;
  void *v11;
  UIActivityViewController *v12;
  UIActivityViewController *viewController;
  void *v14;
  objc_super v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MapsDebugFileExportController;
  v8 = -[MapsDebugFileExportController init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_presentingViewController, a4);
    v10 = objc_alloc((Class)UIActivityViewController);
    v18 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v12 = (UIActivityViewController *)objc_msgSend(v10, "initWithActivityItems:applicationActivities:", v11, 0);
    viewController = v9->_viewController;
    v9->_viewController = v12;

    v17[0] = UIActivityTypePostToFacebook;
    v17[1] = UIActivityTypePostToWeibo;
    v17[2] = UIActivityTypePostToFlickr;
    v17[3] = UIActivityTypePostToVimeo;
    v17[4] = UIActivityTypePostToTencentWeibo;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 5));
    -[UIActivityViewController setExcludedActivityTypes:](v9->_viewController, "setExcludedActivityTypes:", v14);

  }
  return v9;
}

- (void)startWithCompletion:(id)a3
{
  UIActivityViewController *viewController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100AD1058;
  v18[3] = &unk_1011BA710;
  v19 = a3;
  viewController = self->_viewController;
  v5 = v19;
  -[UIActivityViewController setCompletionWithItemsHandler:](viewController, "setCompletionWithItemsHandler:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_presentingViewController, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityViewController popoverPresentationController](self->_viewController, "popoverPresentationController"));
  objc_msgSend(v7, "setSourceView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_presentingViewController, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityViewController popoverPresentationController](self->_viewController, "popoverPresentationController"));
  objc_msgSend(v17, "setSourceRect:", v10, v12, v14, v16);

  -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", self->_viewController, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end

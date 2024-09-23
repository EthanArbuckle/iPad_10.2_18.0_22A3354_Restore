@implementation _TUIFeedSectionDebug

- (_TUIFeedSectionDebug)initWithRenderModel:(id)a3 hostingViewController:(id)a4
{
  id v7;
  id v8;
  _TUIFeedSectionDebug *v9;
  _TUIFeedSectionDebug *v10;
  _TUIFeedSectionDebugButton *v11;
  _TUIFeedSectionDebugButton *button;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_TUIFeedSectionDebug;
  v9 = -[_TUIFeedSectionDebug init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_renderModel, a3);
    objc_storeWeak((id *)&v10->_hostingViewController, v8);
    v11 = objc_alloc_init(_TUIFeedSectionDebugButton);
    button = v10->_button;
    v10->_button = v11;

    -[_TUIFeedSectionDebugButton setDebug:](v10->_button, "setDebug:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle"), v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[_TUIFeedSectionDebugButton setTintColor:](v10->_button, "setTintColor:", v15);

    -[_TUIFeedSectionDebugButton setImage:forState:](v10->_button, "setImage:forState:", v14, 0);
    -[_TUIFeedSectionDebugButton setShowsMenuAsPrimaryAction:](v10->_button, "setShowsMenuAsPrimaryAction:", 1);
    -[_TUIFeedSectionDebugButton setContextMenuInteractionEnabled:](v10->_button, "setContextMenuInteractionEnabled:", 1);

  }
  return v10;
}

- (void)setRenderModel:(id)a3
{
  TUIRenderModelCollection *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  TUIRenderModelCollection *v9;

  v5 = (TUIRenderModelCollection *)a3;
  if (self->_renderModel != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v6 = -[_TUIFeedSectionDebug _computeHasErrors](self, "_computeHasErrors");
    self->_hasErrors = v6;
    if (v6)
      v7 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    else
      v7 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v8 = (void *)v7;
    -[_TUIFeedSectionDebugButton setTintColor:](self->_button, "setTintColor:", v7);

    v5 = v9;
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_159460;
  v7[3] = &unk_242F78;
  v7[4] = self;
  v8 = a3;
  v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v7));

  return v5;
}

- (void)_shareCapture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _TUIFeedSectionDebugButton *button;
  void *v10;
  id WeakRetained;
  void *v12;

  v4 = a3;
  v5 = objc_alloc((Class)UIActivityViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));

  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v8 = objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v7, 0);

  button = self->_button;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
  objc_msgSend(v10, "setSourceView:", button);

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_shareText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _TUIFeedSectionDebugButton *button;
  void *v9;
  id WeakRetained;
  id v11;

  v4 = a3;
  v5 = objc_alloc((Class)UIActivityViewController);
  v11 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v7 = objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, 0);

  button = self->_button;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  objc_msgSend(v9, "setSourceView:", button);

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_showErrorsForSection:(id)a3
{
  id v4;
  TUIErrorsViewController *v5;
  void *v6;
  UIViewController *v7;
  id v8;
  void *v9;
  UIViewController *errorViewController;
  UIViewController *v11;
  id WeakRetained;
  TUIErrorsViewController *v13;

  v4 = a3;
  v5 = [TUIErrorsViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errors"));

  v13 = -[TUIErrorsViewController initWithErrors:](v5, "initWithErrors:", v6);
  v7 = (UIViewController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v13);
  v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Done"), 2, self, "_dismissErrors:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIErrorsViewController navigationItem](v13, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  errorViewController = self->_errorViewController;
  self->_errorViewController = v7;
  v11 = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)_dismissErrors:(id)a3
{
  UIViewController *errorViewController;

  -[UIViewController dismissViewControllerAnimated:completion:](self->_errorViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  errorViewController = self->_errorViewController;
  self->_errorViewController = 0;

}

- (BOOL)_computeHasErrors
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15A5A0;
  v4[3] = &unk_242FA0;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (BOOL)showButton
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("TUIEnableDebugMenu"));

  if ((v4 & 1) != 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("TUIReportErrors"));

  return v7 && self->_hasErrors;
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (TUIFeedViewController)hostingViewController
{
  return (TUIFeedViewController *)objc_loadWeakRetained((id *)&self->_hostingViewController);
}

- (void)setHostingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingViewController, a3);
}

- (UIViewController)errorViewController
{
  return self->_errorViewController;
}

- (_TUIFeedSectionDebugButton)button
{
  return self->_button;
}

- (BOOL)hasErrors
{
  return self->_hasErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end

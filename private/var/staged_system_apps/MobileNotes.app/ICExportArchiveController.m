@implementation ICExportArchiveController

- (id)initForPresentingInViewController:(id)a3
{
  id v5;
  ICExportArchiveController *v6;
  ICArchiveExporter *v7;
  ICArchiveExporter *archiveExporter;
  ICLongRunningTaskController *v9;
  ICLongRunningTaskController *taskController;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICExportArchiveController;
  v6 = -[ICExportArchiveController init](&v12, "init");
  if (v6)
  {
    v7 = objc_alloc_init(ICArchiveExporter);
    archiveExporter = v6->_archiveExporter;
    v6->_archiveExporter = v7;

    objc_storeStrong((id *)&v6->_viewController, a3);
    v9 = (ICLongRunningTaskController *)objc_alloc_init((Class)ICLongRunningTaskController);
    taskController = v6->_taskController;
    v6->_taskController = v9;

    -[ICLongRunningTaskController setShouldShowCancelButton:](v6->_taskController, "setShouldShowCancelButton:", 1);
    -[ICLongRunningTaskController setAllowSingleUnitProgress:](v6->_taskController, "setAllowSingleUnitProgress:", 1);
    -[ICLongRunningTaskController setProgressStringBlock:](v6->_taskController, "setProgressStringBlock:", &stru_100553E80);
    -[ICLongRunningTaskController setShouldShowCircularProgress:](v6->_taskController, "setShouldShowCircularProgress:", 1);
    -[ICLongRunningTaskController setViewControllerToPresentFrom:](v6->_taskController, "setViewControllerToPresentFrom:", v5);
  }

  return v6;
}

- (void)exportObjects:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1000C07F0;
  v21[4] = sub_1000C0800;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1000C07F0;
  v19[4] = sub_1000C0800;
  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveController taskController](self, "taskController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000C0808;
  v15[3] = &unk_100553EA8;
  v17 = v21;
  v15[4] = self;
  v9 = v6;
  v16 = v9;
  v18 = v19;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C08A8;
  v11[3] = &unk_100553ED0;
  v11[4] = self;
  v13 = v21;
  v14 = v19;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v8, "startTask:completionBlock:", v15, v11);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

- (void)showResultForArchiveURL:(id)a3 andError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[3];
  id v33;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc((Class)UIActivityViewController);
    v33 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    v10 = objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, 0);

    v32[0] = UIActivityTypeOpenInIBooks;
    v32[1] = ICActivityTypeShareToNote;
    v32[2] = UIActivityTypeSharePlay;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 3));
    objc_msgSend(v10, "setExcludedActivityTypes:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveController barButtonItem](self, "barButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
    objc_msgSend(v13, "setBarButtonItem:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveController sourceView](self, "sourceView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
    objc_msgSend(v15, "setSourceView:", v14);

    -[ICExportArchiveController sourceRect](self, "sourceRect");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));
    objc_msgSend(v24, "setSourceRect:", v17, v19, v21, v23);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000C0BDC;
    v30[3] = &unk_100553EF8;
    v30[4] = self;
    v31 = v6;
    objc_msgSend(v10, "setCompletionWithItemsHandler:", v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveController viewController](self, "viewController"));
    objc_msgSend(v25, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Error Creating Archive"), &stru_1005704B8, 0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICExportArchiveController viewController](self, "viewController"));
    +[UIAlertController ic_showAlertWithTitle:message:viewController:](UIAlertController, "ic_showAlertWithTitle:message:viewController:", v27, v28, v29);

  }
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItem, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (ICArchiveExporter)archiveExporter
{
  return self->_archiveExporter;
}

- (void)setArchiveExporter:(id)a3
{
  objc_storeStrong((id *)&self->_archiveExporter, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (ICLongRunningTaskController)taskController
{
  return self->_taskController;
}

- (void)setTaskController:(id)a3
{
  objc_storeStrong((id *)&self->_taskController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_archiveExporter, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

@end

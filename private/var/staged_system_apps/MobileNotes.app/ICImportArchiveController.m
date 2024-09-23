@implementation ICImportArchiveController

- (id)initForPresentingInViewController:(id)a3
{
  id v5;
  ICImportArchiveController *v6;
  _TtC11MobileNotes17ICArchiveImporter *v7;
  _TtC11MobileNotes17ICArchiveImporter *archiveImporter;
  ICLongRunningTaskController *v9;
  ICLongRunningTaskController *taskController;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICImportArchiveController;
  v6 = -[ICImportArchiveController init](&v12, "init");
  if (v6)
  {
    v7 = objc_alloc_init(_TtC11MobileNotes17ICArchiveImporter);
    archiveImporter = v6->_archiveImporter;
    v6->_archiveImporter = v7;

    objc_storeStrong((id *)&v6->_viewController, a3);
    v9 = (ICLongRunningTaskController *)objc_alloc_init((Class)ICLongRunningTaskController);
    taskController = v6->_taskController;
    v6->_taskController = v9;

    -[ICLongRunningTaskController setShouldShowCancelButton:](v6->_taskController, "setShouldShowCancelButton:", 1);
    -[ICLongRunningTaskController setAllowSingleUnitProgress:](v6->_taskController, "setAllowSingleUnitProgress:", 1);
    -[ICLongRunningTaskController setProgressStringBlock:](v6->_taskController, "setProgressStringBlock:", &stru_100555448);
    -[ICLongRunningTaskController setShouldShowCircularProgress:](v6->_taskController, "setShouldShowCircularProgress:", 1);
    -[ICLongRunningTaskController setViewControllerToPresentFrom:](v6->_taskController, "setViewControllerToPresentFrom:", v5);
  }

  return v6;
}

- (void)importIntoNoteContainer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  -[ICImportArchiveController setNoteContainer:](self, "setNoteContainer:", a3);
  -[ICImportArchiveController setCompletion:](self, "setCompletion:", v6);

  v7 = objc_alloc((Class)UIDocumentPickerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICArchive universalTypeIdentifier](ICArchive, "universalTypeIdentifier"));
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v10 = objc_msgSend(v7, "initForOpeningContentTypes:asCopy:", v9, 1);
  -[ICImportArchiveController setDocumentPickerViewController:](self, "setDocumentPickerViewController:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveController documentPickerViewController](self, "documentPickerViewController"));
  objc_msgSend(v11, "setDelegate:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveController viewController](self, "viewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveController documentPickerViewController](self, "documentPickerViewController"));
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)importArchiveAtURL:(id)a3 intoNoteContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100111AC0;
  v16[4] = sub_100111AD0;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveController taskController](self, "taskController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100111AD8;
  v12[3] = &unk_100555470;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v14 = v10;
  v15 = v16;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100111B78;
  v11[3] = &unk_100555498;
  v11[4] = self;
  v11[5] = v16;
  objc_msgSend(v8, "startTask:completionBlock:", v12, v11);

  _Block_object_dispose(v16, 8);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveController noteContainer](self, "noteContainer"));
  -[ICImportArchiveController importArchiveAtURL:intoNoteContainer:](self, "importArchiveAtURL:intoNoteContainer:", v5, v6);

  -[ICImportArchiveController setNoteContainer:](self, "setNoteContainer:", 0);
}

- (void)documentPickerWasCancelled:(id)a3
{
  -[ICImportArchiveController setNoteContainer:](self, "setNoteContainer:", 0);
}

- (void)showError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Error Importing Archive"), &stru_1005704B8, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportArchiveController viewController](self, "viewController"));
  +[UIAlertController ic_showAlertWithTitle:message:viewController:](UIAlertController, "ic_showAlertWithTitle:message:viewController:", v5, v6, v7);

}

- (_TtC11MobileNotes17ICArchiveImporter)archiveImporter
{
  return self->_archiveImporter;
}

- (void)setArchiveImporter:(id)a3
{
  objc_storeStrong((id *)&self->_archiveImporter, a3);
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
  objc_storeStrong((id *)&self->_noteContainer, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (UIDocumentPickerViewController)documentPickerViewController
{
  return self->_documentPickerViewController;
}

- (void)setDocumentPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_documentPickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPickerViewController, 0);
  objc_storeStrong((id *)&self->_taskController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_archiveImporter, 0);
}

@end

@implementation ICImportSERootViewController

- (void)viewDidLoad
{
  ICImportNoteProcessor *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICImportSERootViewController;
  -[ICImportSERootViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_alloc_init(ICImportNoteProcessor);
  -[ICImportSERootViewController setImportNoteProcessor:](self, "setImportNoteProcessor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportSERootViewController importNoteProcessor](self, "importNoteProcessor"));
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int IsAppleAccountBrandingEnabled;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)ICImportSERootViewController;
  -[ICImportSERootViewController viewDidAppear:](&v37, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v5));

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Import to Notes?"), &stru_1000DAF38, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("This file’s notes will be added to an Imported Notes folder. They may look different."), &stru_1000DAF38, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Import"), &stru_1000DAF38, 0));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100009478;
    v34[3] = &unk_1000D5C30;
    v34[4] = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v34));

    objc_msgSend(v12, "addAction:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000DAF38, 0));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10000963C;
    v33[3] = &unk_1000D5C30;
    v33[4] = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 1, v33));

    objc_msgSend(v12, "addAction:", v18);
    -[ICImportSERootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

  }
  else
  {
    IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled(v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", 0));
    v21 = v20;
    if (IsAppleAccountBrandingEnabled)
      v22 = CFSTR("To import to Notes, you’ll need to go to Notes and upgrade your Apple Account.");
    else
      v22 = CFSTR("To import to Notes, you’ll need to go to Notes and upgrade your iCloud account.");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1000DAF38, 0));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Upgrade Your Notes"), &stru_1000DAF38, 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v24, v12, 1));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000DAF38, 0));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000093CC;
    v36[3] = &unk_1000D5C30;
    v36[4] = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 1, v36));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Go to Notes"), &stru_1000DAF38, 0));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000093D4;
    v35[3] = &unk_1000D5C30;
    v35[4] = self;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v30, 0, v35));

    objc_msgSend(v25, "addAction:", v31);
    objc_msgSend(v25, "addAction:", v28);
    -[ICImportSERootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);

  }
}

- (void)progressUpdatedForImportNoteProcessor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "state") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Loading notes to import…"), &stru_1000DAF38, 0));
  }
  else
  {
    if (objc_msgSend(v4, "state") != (id)2)
    {
      v6 = 0;
      goto LABEL_10;
    }
    v7 = (char *)objc_msgSend(v4, "totalNoteImported");
    if (v7 >= objc_msgSend(v4, "totalNoteFound"))
      v8 = v7;
    else
      v8 = v7 + 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Importing note %lu of %lu…"), &stru_1000DAF38, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v8, objc_msgSend(v4, "totalNoteFound")));

  }
LABEL_10:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000097C8;
  block[3] = &unk_1000D5C58;
  block[4] = self;
  v13 = v6;
  v14 = v4;
  v10 = v4;
  v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)importStartedForNoteProcessor:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  -[ICImportSERootViewController setLastAccessibilityAnnouncementDate:](self, "setLastAccessibilityAnnouncementDate:", v4);

}

- (void)importCompletedForNoteProcessor:(id)a3 destinationFolder:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  ICImportSERootViewController *v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009A1C;
  v6[3] = &unk_1000D5D38;
  v7 = a3;
  v8 = self;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

- (void)hideUI
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportSERootViewController rootViewController](self, "rootViewController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009EA0;
  v4[3] = &unk_1000D5D60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "dismissWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)importNotes
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  ICImportSERootViewController *v20;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD block[5];
  id v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = dispatch_group_create();
  v4 = objc_alloc_init((Class)NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICImportSERootViewController rootViewController](self, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extensionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputItems"));

  obj = v7;
  v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(obj);
        v24 = v8;
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachments"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v31;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
              v17 = objc_msgSend(v15, "hasItemConformingToTypeIdentifier:", v16);

              if (v17)
              {
                dispatch_group_enter(v3);
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
                v27[0] = _NSConcreteStackBlock;
                v27[1] = 3221225472;
                v27[2] = sub_10000A1F4;
                v27[3] = &unk_1000D5D88;
                v28 = v4;
                v29 = v3;
                objc_msgSend(v15, "loadItemForTypeIdentifier:options:completionHandler:", v18, 0, v27);

              }
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v12);
        }

        v8 = v24 + 1;
      }
      while ((id)(v24 + 1) != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v23);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A2C0;
  block[3] = &unk_1000D5D38;
  block[4] = v20;
  v26 = v4;
  v19 = v4;
  dispatch_group_notify(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (ICSERootViewController)rootViewController
{
  return (ICSERootViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (ICImportNoteProcessor)importNoteProcessor
{
  return self->_importNoteProcessor;
}

- (void)setImportNoteProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_importNoteProcessor, a3);
}

- (ICImportSEProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setProgressViewController:(id)a3
{
  objc_storeStrong((id *)&self->_progressViewController, a3);
}

- (UIAlertController)progressAlertController
{
  return self->_progressAlertController;
}

- (void)setProgressAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_progressAlertController, a3);
}

- (NSDate)lastAccessibilityAnnouncementDate
{
  return self->_lastAccessibilityAnnouncementDate;
}

- (void)setLastAccessibilityAnnouncementDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_progressAlertController, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_importNoteProcessor, 0);
  objc_destroyWeak((id *)&self->_rootViewController);
}

@end

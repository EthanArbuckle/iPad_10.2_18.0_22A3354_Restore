@implementation RCShareViewController

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCShareViewController;
  -[RCShareViewController loadView](&v3, "loadView");
  -[RCShareViewController setupViews](self, "setupViews");
  -[RCShareViewController loadFileRepresentation](self, "loadFileRepresentation");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCShareViewController;
  -[RCShareViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[RCShareViewController _removeTemporaryAudioFileIfNeeded](self, "_removeTemporaryAudioFileIfNeeded");
}

- (void)loadFileRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  RCShareViewController *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController extensionContext](self, "extensionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputItems"));

  v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v5 = *(_QWORD *)v27;
    v18 = self;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v4);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attachments", v18));
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMPEG4Audio, "identifier"));
              v15 = objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", v14);

              if (v15)
              {
                if (v13)
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMPEG4Audio, "identifier"));
                  v21[0] = _NSConcreteStackBlock;
                  v21[1] = 3221225472;
                  v21[2] = sub_100001ACC;
                  v21[3] = &unk_1000041C8;
                  v21[4] = v18;
                  v17 = objc_msgSend(v13, "loadFileRepresentationForTypeIdentifier:completionHandler:", v16, v21);

                }
                goto LABEL_20;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v10)
              continue;
            break;
          }
        }

        v5 = v19;
      }
      v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }
LABEL_20:

}

- (void)setupViews
{
  RCShareTableViewController *v3;
  RCShareTableViewController *tableViewController;
  UINavigationController *v5;
  UINavigationController *navigationController;
  id v7;
  uint64_t v8;
  void *v9;
  UIBarButtonItem *v10;
  UIBarButtonItem *cancelButtonItem;
  id v12;
  uint64_t v13;
  void *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *doneButtonItem;
  UIBarButtonItem *v17;
  void *v18;
  UIBarButtonItem *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];

  v3 = -[RCShareTableViewController initWithStyle:]([RCShareTableViewController alloc], "initWithStyle:", 1);
  tableViewController = self->_tableViewController;
  self->_tableViewController = v3;

  v5 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_tableViewController);
  navigationController = self->_navigationController;
  self->_navigationController = v5;

  v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = RCLocalizedFrameworkString(CFSTR("CANCEL"), CFSTR("Cancel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (UIBarButtonItem *)objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 0, self, "cancel");
  cancelButtonItem = self->_cancelButtonItem;
  self->_cancelButtonItem = v10;

  v12 = objc_alloc((Class)UIBarButtonItem);
  v13 = RCLocalizedFrameworkString(CFSTR("SAVE"), CFSTR("Save"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (UIBarButtonItem *)objc_msgSend(v12, "initWithTitle:style:target:action:", v14, 2, self, "save");
  doneButtonItem = self->_doneButtonItem;
  self->_doneButtonItem = v15;

  -[UIBarButtonItem setEnabled:](self->_doneButtonItem, "setEnabled:", 0);
  v17 = self->_cancelButtonItem;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareTableViewController navigationItem](self->_tableViewController, "navigationItem"));
  objc_msgSend(v18, "setLeftBarButtonItem:", v17);

  v19 = self->_doneButtonItem;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareTableViewController navigationItem](self->_tableViewController, "navigationItem"));
  objc_msgSend(v20, "setRightBarButtonItem:", v19);

  -[RCShareViewController addChildViewController:](self, "addChildViewController:", self->_navigationController);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  objc_msgSend(v21, "addSubview:", v22);

  -[UINavigationController didMoveToParentViewController:](self->_navigationController, "didMoveToParentViewController:", self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController view](self, "view"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v45[0] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v45[1] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leftAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leftAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v45[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "rightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
  v45[3] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

}

- (void)_didLoadFileInPlaceWithFileInfo:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002190;
  v4[3] = &unk_1000041F0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_removeTemporaryAudioFileIfNeeded
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController temporaryDirectoryURL](self, "temporaryDirectoryURL"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = 0;
    v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);
    v6 = v9;
    if ((v5 & 1) != 0)
    {
      -[RCShareViewController setTemporaryDirectoryURL:](self, "setTemporaryDirectoryURL:", 0);
    }
    else
    {
      v7 = OSLogForCategory(kVMLogCategoryDefault);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10000269C((uint64_t)v6, v8);

    }
  }

}

- (void)cancel
{
  void *v3;
  id v4;

  -[RCShareViewController _removeTemporaryAudioFileIfNeeded](self, "_removeTemporaryAudioFileIfNeeded");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3072, 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController extensionContext](self, "extensionContext"));
  objc_msgSend(v3, "cancelRequestWithError:", v4);

}

- (void)save
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController sharedAudioFileInfo](self, "sharedAudioFileInfo"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareViewController tableViewController](self, "tableViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "voiceMemoTitleText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));

    if (v8 && (objc_msgSend(v8, "isEqualToString:", &stru_1000042D0) & 1) == 0)
    {
      v9 = v8;

      v5 = v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100002484;
    v12[3] = &unk_1000041C8;
    v12[4] = self;
    +[RCSavedRecordingsModel importRecordingWithSourceAudioURL:name:date:completionHandler:](RCSavedRecordingsModel, "importRecordingWithSourceAudioURL:name:date:completionHandler:", v10, v5, v11, v12);

  }
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (RCShareTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonItem, a3);
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (RCSharedAudioFileInfo)sharedAudioFileInfo
{
  return self->_sharedAudioFileInfo;
}

- (void)setSharedAudioFileInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAudioFileInfo, a3);
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_sharedAudioFileInfo, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end

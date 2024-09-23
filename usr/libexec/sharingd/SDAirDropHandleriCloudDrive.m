@implementation SDAirDropHandleriCloudDrive

- (SDAirDropHandleriCloudDrive)initWithTransfer:(id)a3
{
  SDAirDropHandleriCloudDrive *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSURL *iCloudDriveURL;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SDAirDropHandleriCloudDrive;
  v3 = -[SDAirDropHandler initWithTransfer:](&v10, "initWithTransfer:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = off_1007B0F18();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForUbiquityContainerIdentifier:", v6));
    iCloudDriveURL = v3->_iCloudDriveURL;
    v3->_iCloudDriveURL = (NSURL *)v7;

    v3->_useOpenWithText = 1;
  }
  return v3;
}

- (BOOL)canHandleTransfer
{
  _BOOL8 v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  NSURL *iCloudDriveURL;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  void *v16;

  v3 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  if (!v3)
    return 0;
  v4 = SFFilesAppAvailable(v3);
  if ((v4 & 1) != 0)
    return 1;
  v6 = airdrop_log(v4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Files App not available", buf, 2u);
  }

  iCloudDriveURL = self->_iCloudDriveURL;
  v14 = 0;
  v5 = -[NSURL checkResourceIsReachableAndReturnError:](iCloudDriveURL, "checkResourceIsReachableAndReturnError:", &v14);
  v9 = v14;
  v10 = v9;
  if ((v5 & 1) == 0)
  {
    v11 = airdrop_log(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "iCloud drive not enabled or accessible. Error: %@", buf, 0xCu);
    }

  }
  return v5;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriCloudDrive;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x1000000;
}

- (id)suitableContentsDescription
{
  return (id)SFLocalizedStringForKey(CFSTR("TRANSFER_FROM_IMPORT_FAILED_TEXT"), a2);
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  return (id)SFLocalizedStringForKey(CFSTR("CANCEL_BUTTON_TITLE"), a2);
}

- (void)updatePossibleActions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  void *v7;

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropHandleriCloudDrive;
  -[SDAirDropHandler updatePossibleActions](&v6, "updatePossibleActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive action](self, "action"));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v5, "setPossibleActions:", v4);

}

- (SFAirDropAction)action
{
  SFAirDropAction *action;
  int v4;
  uint64_t v5;
  char v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  SFAirDropAction *v18;
  SFAirDropAction *v19;
  _QWORD v21[4];
  id v22;
  char v23;
  id location;

  action = self->_action;
  if (!action)
  {
    v4 = SFFilesAppAvailable(0);
    v6 = v4;
    if (v4)
    {
      if (self->_useOpenWithText)
        v7 = CFSTR("OPEN_WITH_FILES_APP_BUTTON_TITLE");
      else
        v7 = CFSTR("FILES_APP_BUTTON_TITLE");
    }
    else
    {
      v7 = CFSTR("SAVE_TO_ICLOUD_DRIVE_BUTTON_TITLE");
    }
    v8 = SFLocalizedStringForKey(v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_alloc((Class)SFAirDropAction);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v14 = (objc_class *)objc_opt_class(self, v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v18 = (SFAirDropAction *)objc_msgSend(v10, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v12, v16, v9, v17, 1);
    v19 = self->_action;
    self->_action = v18;

    location = 0;
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000895C8;
    v21[3] = &unk_100715FA8;
    v23 = v6;
    objc_copyWeak(&v22, &location);
    -[SFAirDropAction setActionHandler:](self->_action, "setActionHandler:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    action = self->_action;
  }
  return action;
}

- (void)openCompletedItemsWithFilesApp
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v42;
  _QWORD v43[4];
  id v44;
  SDAirDropHandleriCloudDrive *v45;
  BOOL v46;
  char v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  void *v51;

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    *(_DWORD *)buf = 138412290;
    v51 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Opening files with Files App for transfer %@", buf, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completedURLs"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "completedURLs"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v14 = 0;
      v15 = LSMoveDocumentOnOpenKey;
      *(_QWORD *)&v13 = 138412290;
      v42 = v13;
      do
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", v42));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "completedURLs"));
        v18 = v14 == (char *)objc_msgSend(v17, "count") - 1;

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "completedURLs"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v14));

        v23 = airdrop_log(v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v42;
          v51 = v21;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Trying to open URL %@", buf, 0xCu);
        }

        v48 = v15;
        v49 = &__kCFBooleanTrue;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "operationToOpenResource:usingApplication:userInfo:", v21, CFSTR("com.apple.DocumentsApp"), v25));

        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100089974;
        v43[3] = &unk_100715FD0;
        v46 = v18;
        v44 = v21;
        v45 = self;
        v47 = 1;
        v28 = v21;
        objc_msgSend(v27, "setCompletionBlock:", v43);
        objc_msgSend(v27, "start");

        ++v14;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "completedURLs"));
        v31 = (char *)objc_msgSend(v30, "count");

      }
      while (v14 < v31);
    }
  }
  else
  {
    v32 = airdrop_log(v9);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_100089D40(v33, v34, v35, v36, v37, v38, v39, v40);

    v41 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    v41[2](v41, 0, 0, 1);

  }
}

- (void)saveCompletedItemsToiCloudDrive
{
  NSURL *iCloudDriveURL;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSURL *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v23;
  unsigned __int8 v24;
  uint8_t buf[4];
  void *v26;

  v24 = 0;
  iCloudDriveURL = self->_iCloudDriveURL;
  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (iCloudDriveURL)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saving files to iCloud Drive for transfer %@", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completedURLs"));
    v10 = self->_iCloudDriveURL;
    v23 = 0;
    v11 = sub_10019C2B8(v9, v10, &v24, &v23);
    v6 = v23;

    if (!v24)
    {
      v13 = airdrop_log(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100089DA8(self, (uint64_t)v6, v14);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100089D74(v6, v15, v16, v17, v18, v19, v20, v21);
  }

  v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
  v22[2](v22, v24, 0, 1);

}

- (BOOL)iCloudDriveIsAccessible
{
  NSURL *iCloudDriveURL;
  uint64_t v4;

  iCloudDriveURL = self->_iCloudDriveURL;
  v4 = 0;
  return -[NSURL checkResourceIsReachableAndReturnError:](iCloudDriveURL, "checkResourceIsReachableAndReturnError:", &v4);
}

- (NSURL)iCloudDriveURL
{
  return self->_iCloudDriveURL;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (BOOL)useOpenWithText
{
  return self->_useOpenWithText;
}

- (void)setUseOpenWithText:(BOOL)a3
{
  self->_useOpenWithText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_iCloudDriveURL, 0);
}

@end

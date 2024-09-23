@implementation SDAirDropHandlerGenericFiles

- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3
{
  return -[SDAirDropHandlerGenericFiles initWithTransfer:bundleIdentifier:](self, "initWithTransfer:bundleIdentifier:", a3, 0);
}

- (SDAirDropHandlerGenericFiles)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  SDAirDropHandlerGenericFiles *v7;
  SDAirDropHandleriCloudDrive *v8;
  SDAirDropHandleriCloudDrive *icloudDriveHandler;
  NSOperationQueue *v10;
  NSOperationQueue *workOperationsQueue;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SDAirDropHandlerGenericFiles;
  v7 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v13, "initWithTransfer:bundleIdentifier:", v6, a4);
  if (v7)
  {
    v8 = -[SDAirDropHandleriCloudDrive initWithTransfer:]([SDAirDropHandleriCloudDrive alloc], "initWithTransfer:", v6);
    icloudDriveHandler = v7->_icloudDriveHandler;
    v7->_icloudDriveHandler = v8;

    v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    workOperationsQueue = v7->_workOperationsQueue;
    v7->_workOperationsQueue = v10;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_workOperationsQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v7;
}

- (BOOL)shouldEndAfterOpen
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID"));
  if (v3)
    v4 = 0;
  else
    v4 = -[SDAirDropHandlerGenericFiles shouldOpenAutomaticallyAfterUserAccepts](self, "shouldOpenAutomaticallyAfterUserAccepts");

  return v4;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, SDAirDropHandlerImportResult *, _QWORD);
  void *v8;
  id v9;
  SDAirDropHandlerImportResult *v10;
  void *v11;
  SDAirDropHandlerImportResult *v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, SDAirDropHandlerImportResult *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v8, "setCompletedURLs:", v6);

  if (+[SFAirDropUserDefaults_objc moveToAppEnabled](SFAirDropUserDefaults_objc, "moveToAppEnabled")&& !-[SDAirDropHandlerGenericFiles shouldEndAfterOpen](self, "shouldEndAfterOpen"))
  {
    v13 = 0;
    v10 = (SDAirDropHandlerImportResult *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles saveToDefaultFolderWithError:](self, "saveToDefaultFolderWithError:", &v13));
    v9 = v13;
    if (-[SDAirDropHandlerImportResult count](v10, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      objc_msgSend(v11, "setCompletedURLs:", v10);

      v12 = objc_alloc_init(SDAirDropHandlerImportResult);
      -[SDAirDropHandlerImportResult setImportedFiles:](v12, "setImportedFiles:", v10);
      v7[2](v7, v12, 0);

      goto LABEL_5;
    }

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc_init(SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v10, "setImportedFiles:", v6);
  ((void (**)(id, SDAirDropHandlerImportResult *, id))v7)[2](v7, v10, v9);
LABEL_5:

}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  if (-[SDAirDropHandlerGenericFiles shouldEndAfterOpen](self, "shouldEndAfterOpen"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles availableApplications](self, "availableApplications"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    -[SDAirDropHandlerGenericFiles setSelectedApplication:](self, "setSelectedApplication:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles selectedApplication](self, "selectedApplication"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000F778C;
    v20[3] = &unk_100714370;
    v21 = v7;
    v12 = v7;
    -[SDAirDropHandlerGenericFiles performActionWithBundleProxy:completionHandler:](self, "performActionWithBundleProxy:completionHandler:", v11, v20);

    v13 = v21;
  }
  else
  {
    v14 = (void *)objc_opt_class(self, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultFolder](self, "defaultFolder"));
    v18 = v7;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000F779C;
    v19[3] = &unk_100714B20;
    v19[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000F77A8;
    v17[3] = &unk_100714370;
    v16 = v7;
    objc_msgSend(v14, "launchFilesToDefaultFolderWithURLs:defaultFolder:openURLs:completion:", v6, v15, v19, v17);

    v13 = v18;
  }

}

- (BOOL)canHandleTransfer
{
  BOOL v3;
  NSArray **p_availableApplications;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSMutableOrderedSet *v15;
  uint64_t v16;
  void *i;
  void *v18;
  NSMutableOrderedSet *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSArray **v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  id v50;
  _BYTE v51[128];

  v3 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  p_availableApplications = &self->_availableApplications;
  if (self->_availableApplications)
    return -[NSArray count](*p_availableApplications, "count") && v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  v8 = objc_msgSend(v7, "count");

  v9 = !v3;
  if (v8 != (id)1)
    v9 = 1;
  if ((v9 & 1) != 0)
  {
    v3 = 0;
    return -[NSArray count](*p_availableApplications, "count") && v3;
  }
  v39 = &self->_availableApplications;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metaData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rawFiles"));

  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_30;
  }
  v14 = v13;
  v15 = 0;
  v42 = *(_QWORD *)v46;
  v41 = kSFOperationFileNameKey;
  v16 = kSFOperationFileTypeKey;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v46 != v42)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
      v19 = objc_opt_new(NSMutableOrderedSet);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v41));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[LSDocumentProxy documentProxyForName:type:MIMEType:](LSDocumentProxy, "documentProxyForName:type:MIMEType:", v20, v21, 0));
      if ((SFIsCoreType(v21) & 1) == 0)
      {
        v44 = 0;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "applicationsAvailableForOpeningFromAirDropWithError:", &v44));
        v24 = v44;
        -[NSMutableOrderedSet addObjectsFromArray:](v19, "addObjectsFromArray:", v23);

        if (v24)
        {
          v26 = airdrop_log(v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to get airdrop available applications for opening %@", buf, 0xCu);
          }

        }
      }
      if (-[NSMutableOrderedSet count](v19, "count"))
      {
        if (v15)
          goto LABEL_18;
      }
      else
      {
        v43 = 0;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "applicationsAvailableForOpeningWithError:", &v43));
        v29 = v43;
        -[NSMutableOrderedSet addObjectsFromArray:](v19, "addObjectsFromArray:", v28);

        if (v29)
        {
          v31 = airdrop_log(v30);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to get available applications for opening %@", buf, 0xCu);
          }

        }
        if (v15)
        {
LABEL_18:
          -[NSMutableOrderedSet intersectOrderedSet:](v15, "intersectOrderedSet:", v19);
          goto LABEL_25;
        }
      }
      v15 = v19;
LABEL_25:

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  }
  while (v14);
LABEL_30:

  v33 = objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v15, "array"));
  p_availableApplications = v39;
  v34 = *v39;
  *v39 = (NSArray *)v33;

  v36 = airdrop_log(v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    sub_1000F9D74(v39, v37);

  v3 = 1;
  return -[NSArray count](*p_availableApplications, "count") && v3;
}

- (BOOL)isBundleiWorkType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Keynote")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Pages")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Numbers"));
  }

  return v4;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerGenericFiles;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x1000000;
}

- (id)firstReceivedFilename
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metaData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rawFiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSFOperationFileNameKey));

  return v6;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSString *v26;
  void *v27;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  if (+[SFAirDropUserDefaults_objc moveToAppEnabled](SFAirDropUserDefaults_objc, "moveToAppEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID"));
    v6 = v5 == 0;

  }
  else
  {
    v6 = 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  if (objc_msgSend(v7, "userResponse") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v9 = objc_msgSend(v8, "needsAction") & v6;

    if (v9 == 1)
    {
      v11 = SFLocalizedStringForKey(CFSTR("OPEN_WITH_APP_TEXT"), v10);
      v12 = (id)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_18;
    }
  }
  else
  {

  }
  if (v4 == 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles firstReceivedFilename](self, "firstReceivedFilename"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", &off_10074FB98));
    v15 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    v17 = SFLocalizedStringForKey(v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (v15)
      v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v13, v29);
    else
      v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v3, v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v19);

  }
  else
  {
    v30 = CFSTR("GENERIC_FILE");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
    v31 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v32 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v22));

    LODWORD(v21) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    v24 = SFLocalizedStringForKey(v14, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((_DWORD)v21)
      v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v4, v29);
    else
      v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v3, v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  }
  v12 = v27;

LABEL_18:
  return v12;
}

- (void)updatePossibleActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  objc_class *v8;
  NSString *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;
  id v29;

  v28.receiver = self;
  v28.super_class = (Class)SDAirDropHandlerGenericFiles;
  -[SDAirDropHandler updatePossibleActions](&v28, "updatePossibleActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  if (objc_msgSend(v3, "userResponse") != (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler handlingAppBundleID](self, "handlingAppBundleID"));
    if (SFRemovableSystemAppAvailable(v4))
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler handlingAppBundleID](self, "handlingAppBundleID"));
      v7 = v6 == 0;

      if (!v7)
        return;
    }
    v8 = (objc_class *)objc_opt_class(self, v5);
    v9 = NSStringFromClass(v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = objc_alloc((Class)SFAirDropAction);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v14 = SFLocalizedStringForKey(CFSTR("ACCEPT_BUTTON_TITLE"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v17 = objc_msgSend(v10, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v12, v3, v15, v16, 1);

    location = 0;
    objc_initWeak(&location, self);
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_1000F81E8;
    v25 = &unk_100714348;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v17, "setActionHandler:", &v22);
    if (+[SFAirDropUserDefaults_objc moveToAppEnabled](SFAirDropUserDefaults_objc, "moveToAppEnabled", v22, v23, v24, v25))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID"));
      v19 = v18 == 0;

    }
    else
    {
      v19 = 1;
    }
    objc_msgSend(v17, "setRequiresUnlockedUI:", v19);
    v29 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    objc_msgSend(v21, "setPossibleActions:", v20);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
}

- (id)cancelActionTitleToAccompanyActions:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  objc_super v7;

  if (self->_willUseOpenWithAlert)
  {
    v3 = SFLocalizedStringForKey(CFSTR("CANCEL_BUTTON_TITLE"), a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SDAirDropHandlerGenericFiles;
    v5 = -[SDAirDropHandler cancelActionTitleToAccompanyActions:](&v7, "cancelActionTitleToAccompanyActions:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (id)actionForBundleProxy:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));
  objc_msgSend(v5, "setMinRequiredTransferState:", 6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F8314;
  v8[3] = &unk_100717938;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "setActionHandler:", v8);

  return v5;
}

- (BOOL)shouldOpenAutomaticallyAfterUserAccepts
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles availableApplications](self, "availableApplications"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles availableApplications](self, "availableApplications"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

    LODWORD(v5) = objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple."));
    v8 = v5 & (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.TapToRadar")) ^ 1);

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)acceptActionTriggered
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  if (+[SFAirDropUserDefaults_objc moveToAppEnabled](SFAirDropUserDefaults_objc, "moveToAppEnabled")&& (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID")), v3, v3))
  {
    -[SDAirDropHandlerGenericFiles saveAndUpdateTransfer](self, "saveAndUpdateTransfer");
  }
  else if (-[SDAirDropHandlerGenericFiles shouldOpenAutomaticallyAfterUserAccepts](self, "shouldOpenAutomaticallyAfterUserAccepts"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles availableApplications](self, "availableApplications"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles actionForBundleProxy:](self, "actionForBundleProxy:", v5));

    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionHandler"));
    v6[2](v6, 0);

  }
  else
  {
    -[SDAirDropHandlerGenericFiles addOpenWithActions](self, "addOpenWithActions");
    self->_willUseOpenWithAlert = 1;
  }
}

- (void)addOpenWithActions
{
  NSMutableArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_availableApplications;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles actionForBundleProxy:](self, "actionForBundleProxy:", v10, (_QWORD)v17));
        -[NSMutableArray addObject:](v3, "addObject:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
        LODWORD(v11) = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

        v8 &= v11 ^ 1;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  if (-[SDAirDropHandleriCloudDrive canHandleTransfer](self->_icloudDriveHandler, "canHandleTransfer"))
    v13 = v8 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    -[SDAirDropHandleriCloudDrive setUseOpenWithText:](self->_icloudDriveHandler, "setUseOpenWithText:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    -[SDAirDropHandler setCompletionHandler:](self->_icloudDriveHandler, "setCompletionHandler:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive action](self->_icloudDriveHandler, "action"));
    -[NSMutableArray addObject:](v3, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", (_QWORD)v17));
  objc_msgSend(v16, "setPossibleActions:", v3);

}

- (void)performActionWithBundleProxy:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(id, uint64_t);
  void *v30;
  id obj;
  void *v32;
  NSMutableArray *v33;
  _QWORD v34[4];
  id v35;
  void (**v36)(id, uint64_t);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _BYTE v47[128];

  v6 = (void (**)(id, uint64_t))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler applicationProxyForBundleProxy:](self, "applicationProxyForBundleProxy:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appState"));
  if ((objc_msgSend(v9, "isInstalled") & 1) == 0)
  {

    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appState"));
  v11 = objc_msgSend(v10, "isRestricted");

  if (v11)
  {
LABEL_14:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "completedURLs"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
    objc_msgSend(v25, "_LSFailedToOpenURL:withBundle:", v28, v8);

    v6[2](v6, 1);
    goto LABEL_15;
  }
  v30 = v7;
  v29 = v6;
  v33 = objc_opt_new(NSMutableArray);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completedURLs"));

  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    v17 = LSMoveDocumentOnOpenKey;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v45 = v17;
        v46 = &__kCFBooleanTrue;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:delegate:", v19, v8, 0, v20, self));
        v22 = airdrop_log(v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v30;
          v43 = 2112;
          v44 = v19;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Enqueuing resource open operation for %@, with URL: %@", buf, 0x16u);
        }

        -[NSMutableArray addObject:](v33, "addObject:", v21);
        -[SDAirDropHandler logReceiverBundleID:forAppProxy:andURL:](self, "logReceiverBundleID:forAppProxy:andURL:", v8, 0, 0);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v15);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v33, "lastObject"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000F8B50;
  v34[3] = &unk_100714F40;
  v7 = v30;
  v35 = v30;
  v6 = v29;
  v36 = v29;
  objc_msgSend(v24, "setCompletionBlock:", v34);

  -[NSOperationQueue addOperations:waitUntilFinished:](self->_workOperationsQueue, "addOperations:waitUntilFinished:", v33, 0);
LABEL_15:

}

- (id)defaultOpenActionBundleID
{
  return CFSTR("com.apple.DocumentsApp");
}

- (void)saveAndUpdateTransfer
{
  void *v3;
  void *v4;
  void (**v5)(id, uint64_t);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles saveToDefaultFolderWithError:](self, "saveToDefaultFolderWithError:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v4, "setCompletedURLs:", v3);

  v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler updateTransferStateHandler](self, "updateTransferStateHandler"));
  v5[2](v5, 7);

}

- (id)defaultFolder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[SDAirDropHandleriCloudDrive iCloudDriveIsAccessible](self->_icloudDriveHandler, "iCloudDriveIsAccessible")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive iCloudDriveURL](self->_icloudDriveHandler, "iCloudDriveURL")),
        v3,
        !v3)
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriCloudDrive iCloudDriveURL](self->_icloudDriveHandler, "iCloudDriveURL")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Downloads"), 1)),
        v4,
        !v5))
  {
    v6 = sub_10019BD30();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (id)saveToDefaultFolderWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultFolder](self, "defaultFolder"));
  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      v18 = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving files to %@ for transfer %@", (uint8_t *)&v18, 0x16u);

    }
    LOBYTE(v18) = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "completedURLs"));
    v12 = sub_10019C2B8(v11, v5, &v18, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (!(_BYTE)v18)
    {
      v15 = airdrop_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000F9E88((uint64_t)v5, self);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000F9E04(self);

    v13 = &__NSArray0__struct;
  }

  return v13;
}

+ (void)launchFilesToDefaultFolderWithURLs:(id)a3 defaultFolder:(id)a4 openURLs:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, NSObject *);
  void (**v12)(id, BOOL);
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, NSObject *))a5;
  v12 = (void (**)(id, BOOL))a6;
  v13 = airdrop_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Opening files with Files App for transfer", (uint8_t *)&v33, 2u);
  }

  if (objc_msgSend(v9, "count") == (id)1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("file://"), CFSTR("shareddocuments://")));

    v18 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v17));
    v19 = (void *)v18;
    if (v18)
    {
      v35 = v18;
      v20 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
      v11[2](v11, v20);
    }
    else
    {
      v28 = airdrop_log(0);
      v20 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1000F9F30();
    }

    v12[2](v12, v19 != 0);
  }
  else
  {
    v21 = objc_msgSend(v9, "count");
    if (v21)
    {
      if (v10)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("file://"), CFSTR("shareddocuments://")));

        v24 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v23));
        v25 = (void *)v24;
        v26 = v24 != 0;
        if (v24)
        {
          v34 = v24;
          v27 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
          v11[2](v11, v27);
        }
        else
        {
          v32 = airdrop_log(0);
          v27 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_1000F9F30();
        }

      }
      else
      {
        v31 = airdrop_log(v21);
        v23 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_1000F9F88();
        v26 = 0;
      }

      v12[2](v12, v26);
    }
    else
    {
      v29 = airdrop_log(0);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_1000F9F5C();

      v12[2](v12, 0);
    }
  }

}

- (void)launchFilesToDefaultFolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completedURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultFolder](self, "defaultFolder"));
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F92A0;
  v8[3] = &unk_100714B20;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F92AC;
  v7[3] = &unk_1007142E0;
  objc_msgSend(v3, "launchFilesToDefaultFolderWithURLs:defaultFolder:openURLs:completion:", v5, v6, v8, v7);

}

- (void)handleMoveToAppShareSheetSucceeded
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "completedURLs"));

  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v6)
    {
      v7 = v6;
      v17 = v3;
      v8 = 0;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v5);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
          v18 = v11;
          v13 = objc_msgSend(v4, "removeItemAtURL:error:", v12, &v18);
          v8 = v18;

          if ((v13 & 1) == 0)
          {
            v15 = airdrop_log(v14);
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v24 = v12;
              v25 = 2112;
              v26 = v8;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not remove file %@ : %@", buf, 0x16u);
            }

          }
          v10 = (char *)v10 + 1;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v7);

      v3 = v17;
    }

  }
}

- (id)actionsForModernReadyForOpen
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  int v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID"));

  if (!v3)
    return &__NSArray0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  location[0] = 0;
  objc_initWeak(location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles defaultOpenActionBundleID](self, "defaultOpenActionBundleID"));
  v6 = SFRemovableSystemAppAvailable(v5);
  v46 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v5, 1, &v46));
  v39 = v46;
  if (v7)
  {
    v38 = v6;
    if (v6)
    {
      v9 = SFLocalizedStringForKey(CFSTR("VIEW_BUTTON_TITLE"), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11));

      v13 = objc_alloc((Class)SFAirDropAction);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
      v18 = objc_msgSend(v13, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v15, v16, v12, v17, 3);

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000F99A4;
      v44[3] = &unk_100714348;
      v19 = &v45;
      objc_copyWeak(&v45, location);
      -[NSObject setActionHandler:](v18, "setActionHandler:", v44);
    }
    else
    {
      v22 = SFLocalizedStringForKey(CFSTR("OPEN_IN_APP_BUTTON_TITLE"), v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24));

      v25 = objc_alloc((Class)SFAirDropAction);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
      v18 = objc_msgSend(v25, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v27, v28, v12, v29, 3);

      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000F99D0;
      v42[3] = &unk_100714348;
      v19 = &v43;
      objc_copyWeak(&v43, location);
      -[NSObject setActionHandler:](v18, "setActionHandler:", v42);
    }
    objc_destroyWeak(v19);

    -[NSObject setMaxTransferState:](v18, "setMaxTransferState:", 8);
    v6 = v38;
    objc_msgSend(v4, "addObject:", v18);
  }
  else
  {
    v21 = airdrop_ui_log();
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000F9FB4((uint64_t)v5, (uint64_t)v39, v18);
  }

  if (v6)
  {
    v31 = SFLocalizedStringForKey(CFSTR("MOVE_TO_APP_BUTTON_TITLE"), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = objc_alloc((Class)SFAirDropAction);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v37 = objc_msgSend(v33, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v35, CFSTR("SDMoveToAppActionIdentifier"), v32, v36, 3);

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000F9A2C;
    v40[3] = &unk_100714348;
    objc_copyWeak(&v41, location);
    objc_msgSend(v37, "setActionHandler:", v40);
    objc_msgSend(v37, "setMaxTransferState:", 8);
    objc_msgSend(v4, "addObject:", v37);
    objc_destroyWeak(&v41);

  }
  objc_destroyWeak(location);
  return v4;
}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;

  v5 = a4;
  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles selectedApplication](self, "selectedApplication"));
    v9 = 136315650;
    v10 = "-[SDAirDropHandlerGenericFiles openResourceOperation:didFinishCopyingResource:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %@ to %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)openResourceOperationDidComplete:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;

  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericFiles selectedApplication](self, "selectedApplication"));
    v7 = 136315394;
    v8 = "-[SDAirDropHandlerGenericFiles openResourceOperationDidComplete:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;

  v5 = a4;
  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1000FA038(self);

}

- (NSArray)availableApplications
{
  return self->_availableApplications;
}

- (void)setAvailableApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (LSBundleProxy)selectedApplication
{
  return self->_selectedApplication;
}

- (void)setSelectedApplication:(id)a3
{
  objc_storeStrong((id *)&self->_selectedApplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedApplication, 0);
  objc_storeStrong((id *)&self->_availableApplications, 0);
  objc_storeStrong((id *)&self->_selectedProxy, 0);
  objc_storeStrong((id *)&self->_selectedHandler, 0);
  objc_storeStrong((id *)&self->_icloudDriveHandler, 0);
  objc_storeStrong((id *)&self->_workOperationsQueue, 0);
}

@end

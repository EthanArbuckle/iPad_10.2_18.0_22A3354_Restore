@implementation SDAirDropHandlerProfiles

- (SDAirDropHandlerProfiles)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerProfiles;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.Preferences"));
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (!-[SDAirDropHandler isJustFiles](self, "isJustFiles"))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawFiles"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension"));

        LODWORD(v11) = SFIsManagedConfigurationType(v12);
        if (!(_DWORD)v11)
        {
          v13 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerProfiles;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x400;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v16 = CFSTR("PROFILE");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v7));

  LODWORD(v6) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((_DWORD)v6)
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v4, v15);
  else
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v3, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (void)updatePossibleActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;
  void *v14;

  v13.receiver = self;
  v13.super_class = (Class)SDAirDropHandlerProfiles;
  -[SDAirDropHandler updatePossibleActions](&v13, "updatePossibleActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v3));

  location = 0;
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100119650;
  v10 = &unk_100714348;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "setActionHandler:", &v7);
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v7, v8, v9, v10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v6, "setPossibleActions:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)triggerImport
{
  _BOOL8 v3;
  void (**v4)(id, _BOOL8, _QWORD, uint64_t);

  v3 = -[SDAirDropHandlerProfiles importData](self, "importData");
  v4 = (void (**)(id, _BOOL8, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
  v4[2](v4, v3, 0, 1);

}

- (BOOL)importData
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  char v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "completedURLs"));

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v30;
    v25 = 1;
    *(_QWORD *)&v5 = 138412546;
    v24 = v5;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path", v24));
        v28 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v10, 0, &v28));
        v12 = v28;

        if (v11)
          v14 = v12 == 0;
        else
          v14 = 0;
        if (v14)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
          v27 = 0;
          v20 = objc_msgSend(v17, "queueFileDataForAcceptance:originalFileName:outError:", v11, v19, &v27);
          v12 = v27;

          if (!v12)
            goto LABEL_17;
          v22 = airdrop_log(v21);
          v16 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v34 = v9;
            v35 = 2112;
            v36 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to queue file data for acceptance %@ with error: %@", buf, 0x16u);
          }
          v25 = 0;
        }
        else
        {
          v15 = airdrop_log(v13);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v34 = v9;
            v35 = 2112;
            v36 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to load data for %@ with error: %@", buf, 0x16u);
          }
        }

LABEL_17:
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (!v6)
        goto LABEL_21;
    }
  }
  v25 = 1;
LABEL_21:

  return v25 & 1;
}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  void (**v5)(id, BOOL, _QWORD);

  v5 = (void (**)(id, BOOL, _QWORD))a4;
  v5[2](v5, -[SDAirDropHandlerProfiles importData](self, "importData"), 0);

}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end

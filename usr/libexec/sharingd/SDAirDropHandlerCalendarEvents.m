@implementation SDAirDropHandlerCalendarEvents

- (SDAirDropHandlerCalendarEvents)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerCalendarEvents;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.mobilecal"));
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!-[SDAirDropHandler isJustFiles](self, "isJustFiles"))
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "type"));
        v11 = SFIsCalendarEvent(v10);

        if (!v11)
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerCalendarEvents;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x40;
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
  v16 = CFSTR("CALENDAR");
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
  v13.super_class = (Class)SDAirDropHandlerCalendarEvents;
  -[SDAirDropHandler updatePossibleActions](&v13, "updatePossibleActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v3));

  location = 0;
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000CB7E0;
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
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v11;
  void *v12;

  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerCalendarEvents importURLsWithError:](self, "importURLsWithError:", &v11));
  v4 = v11;
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v9 = 0;
  }
  else
  {
    v12 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
    v9 = -[SDAirDropHandler openURLs:bundleIdentifier:](self, "openURLs:bundleIdentifier:", v6, v8);

  }
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
  v10[2](v10, v9, 0, 1);

}

- (id)importURLsWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];

  v4 = off_1007B1560[0]();
  v5 = (void *)objc_opt_new(v4);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completedURLs"));

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        v14 = v11;
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v29 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v15, 0, &v29));
        v11 = v29;

        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultCalendarForNewEvents"));
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importICSData:intoCalendar:options:", v16, v18, 0));

          v21 = airdrop_log(v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v15;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Calendar Events data was imported from %@", buf, 0xCu);
          }

          if (!v10)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v19, "firstObject"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "externalURL"));

          }
        }
        else
        {
          v24 = airdrop_log(v17);
          v19 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "processCalendarEvents failed to load data for file: %@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v11);
  v25 = v10;

  return v25;
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  void (**v6)(id, SDAirDropHandlerImportResult *, id);
  id v7;
  void *v8;
  id v9;
  SDAirDropHandlerImportResult *v10;
  id v11;

  v11 = 0;
  v6 = (void (**)(id, SDAirDropHandlerImportResult *, id))a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerCalendarEvents importURLsWithError:](self, "importURLsWithError:", &v11));
  v9 = v11;
  v10 = objc_alloc_init(SDAirDropHandlerImportResult);
  -[SDAirDropHandlerImportResult setImportedFiles:](v10, "setImportedFiles:", v7);

  -[SDAirDropHandlerImportResult setOpenAppURL:](v10, "setOpenAppURL:", v8);
  v6[2](v6, v10, v9);

}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void (**v10)(id, _BOOL8, _QWORD);

  v10 = (void (**)(id, _BOOL8, _QWORD))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v9 = -[SDAirDropHandler openURLs:bundleIdentifier:](self, "openURLs:bundleIdentifier:", v6, v8);

  v10[2](v10, v9, 0);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end

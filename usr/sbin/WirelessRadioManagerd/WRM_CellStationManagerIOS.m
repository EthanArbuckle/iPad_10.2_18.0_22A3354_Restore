@implementation WRM_CellStationManagerIOS

- (id)storeURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 259));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "levelForFactor:withNamespace:", CFSTR("WRM_CellPropertiesDB.sqlite"), 860));
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: trialClient sqlite file found at %@"), v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9));

    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: trialClient level is nil"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/WRM/assets_860/WRM_CellPropertiesDB.sqlite")));
    }

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: trialClient is nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/WRM/assets_860/WRM_CellPropertiesDB.sqlite")));
  }

  return v10;
}

- (id)modelURL
{
  return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/WRM/WRM_CellPropertiesDB.momd"));
}

- (void)isFR2:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = v6;
  if (v8)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: The cellID to query is %@"), v8);
    -[WRM_CellStationManagerIOS checkUsingCoreData::](self, "checkUsingCoreData::", v8, v7);
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)checkUsingCoreData:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  CellPropertiesCoreDataStack *v17;
  void *v18;
  void *v19;
  CellPropertiesCoreDataStack *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  CellPropertiesCoreDataStack *v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_CellStationManagerIOS modelURL](self, "modelURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: The given model URL is %@"), v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_CellStationManagerIOS modelURL](self, "modelURL"));
    v29 = 0;
    v11 = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v29);
    v12 = v29;

    if ((v11 & 1) != 0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: model file exists at the given URL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_CellStationManagerIOS storeURL](self, "storeURL"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: The given store URL is %@"), v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_CellStationManagerIOS storeURL](self, "storeURL"));
      v28 = v12;
      LOBYTE(v14) = objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", &v28);
      v16 = v28;

      if ((v14 & 1) != 0)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: store file exists at the given URL"));
        v17 = [CellPropertiesCoreDataStack alloc];
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_CellStationManagerIOS storeURL](self, "storeURL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_CellStationManagerIOS modelURL](self, "modelURL"));
        v20 = -[CellPropertiesCoreDataStack initWithStoreURL:modelURL:](v17, "initWithStoreURL:modelURL:", v18, v19);

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CellPropertiesCoreDataStack private_queue_context](v20, "private_queue_context"));
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000191A0;
          v24[3] = &unk_1002034B0;
          v27 = v7;
          v25 = v6;
          v26 = v20;
          objc_msgSend(v21, "performBlockAndWait:", v24);

        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: Error in initializing persistentStack with the model and store."));
          if (v7)
            (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
        }

      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "description"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: store file does not exists at the given URL, %@"), v23);

        if (v7)
          (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
      }
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: model file does not exists at the given URL, %@"), v22);

      if (v7)
        (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
      v16 = v12;
    }

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellStationManager: error: cellID is nil in checkUsingCoreData"));
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (WRM_CellStationManagerIOS)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_CellStationManagerIOS;
  return -[WRM_CellStationManagerIOS init](&v3, "init");
}

@end

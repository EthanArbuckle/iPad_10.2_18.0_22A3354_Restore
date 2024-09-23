@implementation WRM_DataStoreManagerIOS

- (WRM_DataStoreManagerIOS)init
{
  WRM_DataStoreManagerIOS *v2;
  WRM_GenericCoreDataStack *v3;
  void *v4;
  void *v5;
  WRM_GenericCoreDataStack *v6;
  WRM_GenericCoreDataStack *persistentStack;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WRM_DataStoreManagerIOS;
  v2 = -[WRM_DataStoreManagerIOS init](&v9, "init");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: init WRM_DataStoreManagerIOS"));
  if (-[WRM_DataStoreManagerIOS checkModelFileExists](v2, "checkModelFileExists"))
  {
    -[WRM_DataStoreManagerIOS checkStoreFileExists](v2, "checkStoreFileExists");
    v3 = [WRM_GenericCoreDataStack alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_DataStoreManagerIOS storeURL](v2, "storeURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_DataStoreManagerIOS modelURL](v2, "modelURL"));
    v6 = -[WRM_GenericCoreDataStack initWithModelURL:modelURL:](v3, "initWithModelURL:modelURL:", v4, v5);
    persistentStack = v2->persistentStack;
    v2->persistentStack = v6;

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: Initialized persistentStack with the model and store."));
  }
  return v2;
}

- (BOOL)checkModelFileExists
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_DataStoreManagerIOS modelURL](self, "modelURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: The given model URL is %@"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_DataStoreManagerIOS modelURL](self, "modelURL"));
  v10 = 0;
  v6 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", &v10);
  v7 = v10;

  if ((v6 & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: model file exists at the given URL"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: model file does not exists at the given URL, %@"), v8);

  }
  return v6;
}

- (void)checkStoreFileExists
{
  WRM_DataStoreManagerIOS *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_DataStoreManagerIOS storeURL](self, "storeURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: The given store URL is %@"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_DataStoreManagerIOS storeURL](v2, "storeURL"));
  v8 = 0;
  LOBYTE(v2) = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", &v8);
  v6 = v8;

  if ((v2 & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: store file exists at the given URL"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: store file does not exists at the given URL, %@"), v7);

  }
}

- (void)fetchObjectsForCellID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSFetchRequest *v9;
  NSFetchRequest *request;
  NSFetchRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  NSFetchRequest *v15;
  NSArray *v16;
  id v17;
  NSArray *fetchRequestResults;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: fetchObjects"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: fetching objects"));
    v9 = (NSFetchRequest *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("CoreDataStore")));
    request = self->request;
    self->request = v9;

    v11 = self->request;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("cellID"), v6));
    -[NSFetchRequest setPredicate:](v11, "setPredicate:", v12);

    if (self->request)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: Created fetch request"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack persistentContainer](self->persistentStack, "persistentContainer"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewContext"));
      v15 = self->request;
      v21 = 0;
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "executeFetchRequest:error:", v15, &v21));
      v17 = v21;
      fetchRequestResults = self->fetchRequestResults;
      self->fetchRequestResults = v16;

      if (self->fetchRequestResults)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: No Error fetching objects"));
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: Error fetching objects: %@\n%@"), v19, v20);

        if (v8)
          v8[2](v8, 0);
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: Error creating fetch request"));
      v17 = 0;
      if (v8)
        v8[2](v8, 0);
    }

  }
  else if (v7)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: fetchObjectsForCellID: cellID is nil"));
    v8[2](v8, 0);
  }

}

- (void)write:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: Write"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack persistentContainer](self->persistentStack, "persistentContainer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewContext"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100095270;
  v12[3] = &unk_100203E08;
  v12[4] = self;
  v11 = v6;
  v13 = v11;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v12);

}

- (void)updateForKey:(id)a3 metricsToWrite:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v13));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack persistentContainer](self->persistentStack, "persistentContainer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewContext"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000957B0;
    v14[3] = &unk_100203E58;
    v14[4] = self;
    v15 = v8;
    v16 = v13;
    v17 = v9;
    objc_msgSend(v12, "performBlockAndWait:", v14);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: No object is set for key: %@ in metricsToWrite"), v13);
    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (void)read:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_GenericCoreDataStack persistentContainer](self->persistentStack, "persistentContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewContext"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100095D98;
    v10[3] = &unk_100203E08;
    v10[4] = self;
    v11 = v9;
    v12 = v6;
    objc_msgSend(v8, "performBlockAndWait:", v10);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (id)storeURL
{
  return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Logs/WirelessRadioManager/WRM_CoreDataStore.sqlite"));
}

- (id)modelURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("WRM_CoreDataStore"), CFSTR("momd")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("DataStoreManager: The model URL is: %@"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("WRM_CoreDataStore"), CFSTR("momd")));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fetchRequestResults, 0);
  objc_storeStrong((id *)&self->request, 0);
  objc_storeStrong((id *)&self->persistentStack, 0);
}

@end

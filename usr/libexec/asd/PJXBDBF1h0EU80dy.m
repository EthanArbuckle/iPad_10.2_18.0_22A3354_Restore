@implementation PJXBDBF1h0EU80dy

+ (PJXBDBF1h0EU80dy)sharedInstance
{
  if (qword_100511600 != -1)
    dispatch_once(&qword_100511600, &stru_1004CEE88);
  return (PJXBDBF1h0EU80dy *)(id)qword_1005115F8;
}

- (PJXBDBF1h0EU80dy)init
{
  ASCoreDataManager *v3;
  ASCoreDataManager *coreDataManager;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *managedObjectContext;

  v3 = (ASCoreDataManager *)objc_claimAutoreleasedReturnValue(+[ASCoreDataManager sharedInstance](ASCoreDataManager, "sharedInstance"));
  coreDataManager = self->_coreDataManager;
  self->_coreDataManager = v3;

  v5 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager gFJw2BGPtEQWyLz5](self->_coreDataManager, "gFJw2BGPtEQWyLz5"));
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v5;

  return self;
}

- (PJXBDBF1h0EU80dy)initWithCoreDataManager:(id)a3
{
  id v5;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *managedObjectContext;

  v5 = a3;
  objc_storeStrong((id *)&self->_coreDataManager, a3);
  v6 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(-[ASCoreDataManager gFJw2BGPtEQWyLz5](self->_coreDataManager, "gFJw2BGPtEQWyLz5"));
  managedObjectContext = self->_managedObjectContext;
  self->_managedObjectContext = v6;

  return self;
}

- (id)YKIcrg8ijyspX6ho:(id)a3 forVersion:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  const __CFString *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if ((_DWORD)v4 == 1)
    v7 = CFSTR("DB_C56902430");
  else
    v7 = CFSTR("DB_R101288420");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PJXBDBF1h0EU80dy YKIcrg8ijyspX6ho:forVersion:entityName:](self, "YKIcrg8ijyspX6ho:forVersion:entityName:", v6, v4, v7));

  return v8;
}

- (id)YKIcrg8ijyspX6ho:(id)a3 forVersion:(unsigned int)a4 entityName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSManagedObjectContext *managedObjectContext;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(_QWORD *);
  void *v25;
  PJXBDBF1h0EU80dy *v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  unsigned int v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  void *v48;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v9));
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setPredicate:", v8);
  if (objc_msgSend(&off_1004F4F50, "containsObject:", v9))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("presentTime"), 0));
    v48 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
    objc_msgSend(v11, "setSortDescriptors:", v13);

  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_100022974;
  v40 = sub_100022984;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100022974;
  v34 = sub_100022984;
  v35 = 0;
  managedObjectContext = self->_managedObjectContext;
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_10002298C;
  v25 = &unk_1004CEEB0;
  v28 = &v30;
  v26 = self;
  v15 = v11;
  v27 = v15;
  v29 = &v36;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", &v22);
  v16 = (void *)v31[5];
  if (!v16)
  {
    v17 = (id)qword_1005185D0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v37[5], "localizedDescription", v22, v23, v24, v25, v26));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v37[5], "userInfo"));
      *(_DWORD *)buf = 67109634;
      v43 = a4;
      v44 = 2112;
      v45 = v20;
      v46 = 2112;
      v47 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error fetching objects for entity v%d: %@\n%@", buf, 0x1Cu);

    }
    v16 = (void *)v31[5];
  }
  v18 = v16;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

- (id)removeRavioli
{
  void *v3;
  NSManagedObjectContext *managedObjectContext;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  PJXBDBF1h0EU80dy *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DB_R115061196")));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100022974;
  v16 = sub_100022984;
  v17 = 0;
  managedObjectContext = self->_managedObjectContext;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022B14;
  v8[3] = &unk_1004CEED8;
  v9 = v3;
  v10 = self;
  v11 = &v12;
  v5 = v3;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)tuV7J33gT8DSDOWz:(unint64_t)a3 forDFVersion:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  NSManagedObjectContext *managedObjectContext;
  id *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[2];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = *(_QWORD *)&a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100022974;
  v23 = sub_100022984;
  v24 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("queryKey == %lld"), a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PJXBDBF1h0EU80dy YKIcrg8ijyspX6ho:forVersion:](self, "YKIcrg8ijyspX6ho:forVersion:", v6, v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalResult"));

  managedObjectContext = self->_managedObjectContext;
  if ((_DWORD)v4 == 1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100022DF4;
    v17[3] = &unk_1004CEF00;
    v10 = (id *)v18;
    v18[0] = v8;
    v18[1] = &v19;
    v11 = v8;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v17);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100022FE8;
    v15[3] = &unk_1004CEF00;
    v10 = (id *)v16;
    v16[0] = v8;
    v16[1] = &v19;
    v12 = v8;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v15);
  }

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)cZK3HwMuoGcCgDQI
{
  NSManagedObjectContext *managedObjectContext;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;

  if (-[NSManagedObjectContext hasChanges](self->_managedObjectContext, "hasChanges"))
  {
    -[NSManagedObjectContext setMergePolicy:](self->_managedObjectContext, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    managedObjectContext = self->_managedObjectContext;
    v9 = 0;
    v4 = -[NSManagedObjectContext save:](managedObjectContext, "save:", &v9);
    v5 = v9;
    if ((v4 & 1) == 0)
    {
      v6 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        sub_1003D7EF4((uint64_t)v5, v6, v7);
      v8 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
        sub_1003D7E84((uint64_t)v5, v8);
    }

  }
}

- (void)r2wriXQ3o6jv840j:(_KUwyEjpVZR65eUyl *)a3 gXKoR0dNwQUyaeOl:(unsigned int)a4 lEWFPyiFIAJ2uoyd:(id)a5
{
  id v8;
  void *v9;
  unsigned __int8 v10;
  NSManagedObjectContext *managedObjectContext;
  void *v12;
  _QWORD v13[5];
  id v14;
  _KUwyEjpVZR65eUyl *v15;
  unsigned int v16;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12 = v8;
    v10 = objc_msgSend(v8, "rEI50SHLlVc37Bvu");
    v9 = v12;
    if ((v10 & 1) != 0)
    {
      managedObjectContext = self->_managedObjectContext;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100023370;
      v13[3] = &unk_1004CEF28;
      v13[4] = self;
      v14 = v12;
      v15 = a3;
      v16 = a4;
      -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v13);

      v9 = v12;
    }
  }

}

- (void)qSbwrv1Q3SgLu8BN:(_KUwyEjpVZR65eUyl *)a3 gXKoR0dNwQUyaeOl:(unsigned int)a4 lEWFPyiFIAJ2uoyd:(id)a5
{
  id v8;
  void *v9;
  unsigned __int8 v10;
  NSManagedObjectContext *managedObjectContext;
  void *v12;
  _QWORD v13[5];
  id v14;
  _KUwyEjpVZR65eUyl *v15;
  unsigned int v16;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12 = v8;
    v10 = objc_msgSend(v8, "rEI50SHLlVc37Bvu");
    v9 = v12;
    if ((v10 & 1) != 0)
    {
      managedObjectContext = self->_managedObjectContext;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000235DC;
      v13[3] = &unk_1004CEF28;
      v13[4] = self;
      v14 = v12;
      v15 = a3;
      v16 = a4;
      -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v13);

      v9 = v12;
    }
  }

}

- (int64_t)ax7Szgk7yfiKNgSDError:(id *)a3
{
  NSManagedObjectContext *managedObjectContext;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  managedObjectContext = self->_managedObjectContext;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002397C;
  v6[3] = &unk_1004CEF00;
  v6[4] = self;
  v6[5] = &v7;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)nYOW3DfIUVSEf2Hm:(id)a3 rTZQrPNUbDSIifrh:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  NSMutableDictionary *v9;
  NSObject *v10;
  NSManagedObjectContext *managedObjectContext;
  NSMutableDictionary *v12;
  NSManagedObjectContext *v13;
  _BOOL4 v14;
  id v15;
  NSManagedObjectContext *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  int64_t v26;
  _QWORD v28[7];
  _QWORD v29[7];
  char v30;
  _QWORD v31[5];
  NSMutableDictionary *v32;
  uint64_t *v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  NSErrorUserInfoKey v51;
  id v52;
  uint8_t buf[4];
  unsigned int v54;

  v6 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_100022974;
  v45 = sub_100022984;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100022974;
  v39 = sub_100022984;
  v40 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("all")));
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = objc_opt_new(NSMutableDictionary);
  v10 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v54 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ALL = %d", buf, 8u);
  }
  managedObjectContext = self->_managedObjectContext;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100024020;
  v31[3] = &unk_1004CEF50;
  v31[4] = self;
  v12 = v9;
  v34 = v8;
  v32 = v12;
  v33 = &v47;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v31);

  v13 = self->_managedObjectContext;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000242E4;
  v29[3] = &unk_1004CEF78;
  v30 = v8;
  v29[4] = self;
  v29[5] = &v41;
  v29[6] = &v47;
  -[NSManagedObjectContext performBlockAndWait:](v13, "performBlockAndWait:", v29);
  v14 = v42[5] != 0;
  v15 = objc_alloc_init((Class)NSMutableArray);
  v16 = self->_managedObjectContext;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100024524;
  v28[3] = &unk_1004CEFA0;
  v28[4] = self;
  v28[5] = &v35;
  v28[6] = &v47;
  -[NSManagedObjectContext performBlockAndWait:](v16, "performBlockAndWait:", v28);

  if (v14)
  {
    v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Error cleaning up cache. V1: %@, V2: %@-%@"), CFSTR("OK"), CFSTR("ERROR"), CFSTR("OK"));
    v51 = NSLocalizedDescriptionKey;
    v52 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    v19 = v18;
    if (v42[5] || v36[5])
    {
      v20 = objc_msgSend(v18, "mutableCopy");
      v21 = v20;
      v22 = v42[5];
      if (v22)
        objc_msgSend(v20, "setValue:forKey:", v22, CFSTR("CacheV2ErrorDetail"));
      v23 = v36[5];
      if (v23)
        objc_msgSend(v21, "setValue:forKey:", v23, CFSTR("CacheV2UniqueErrorDetail"));

    }
    else
    {
      v21 = v18;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
    v25 = objc_msgSend(v21, "copy");
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, -27109, v25));

  }
  v26 = v48[3];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v26;
}

- (void)vG2DGmxZUkQniiFzWithTTLDict:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSManagedObjectContext *v9;
  NSManagedObjectContext *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  NSManagedObjectContext *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  if (objc_msgSend(v8, "count"))
  {
    v9 = self->_managedObjectContext;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100024B00;
    v12[3] = &unk_1004CEFC8;
    v13 = v8;
    v14 = v6;
    v15 = v9;
    v16 = v7;
    v10 = v9;
    -[NSManagedObjectContext performBlock:](v10, "performBlock:", v12);

    v11 = v13;
  }
  else
  {
    v17 = 0;
    v10 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(-[PJXBDBF1h0EU80dy y5rP3YRqGjztRrd0:](self, "y5rP3YRqGjztRrd0:", &v17));
    v11 = v17;
    (*((void (**)(id, NSManagedObjectContext *, id))v7 + 2))(v7, v10, v11);
  }

}

+ (BOOL)canSerialize:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  uint64_t v11;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (v5 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    || (v6 = objc_opt_class(NSDate), (objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    || (v7 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v3, v7) & 1) != 0)
    || (v8 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v3, v8) & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    v11 = objc_opt_class(NSDictionary);
    isKindOfClass = objc_opt_isKindOfClass(v3, v11);
  }

  return isKindOfClass & 1;
}

- (id)f55HW2T4cquHq2nn:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSManagedObjectContext *managedObjectContext;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100022974;
  v18 = sub_100022984;
  v19 = 0;
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PJXBDBF1h0EU80dy rKKialn8e4bTPAC9:error:](self, "rKKialn8e4bTPAC9:error:", v4, &v13));
  v6 = v13;
  if (v5)
  {
    managedObjectContext = self->_managedObjectContext;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000252E0;
    v10[3] = &unk_1004CEFF0;
    v12 = &v14;
    v11 = v5;
    -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v10);
    v8 = (id)v15[5];

  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)canonicalStringForAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ISOCountryCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "country"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "postalCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subAdministrativeArea"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "city"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subLocality"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "street"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@€%@€%@€%@€%@€%@€%@€%@"), v4, v5, v6, v7, v8, v9, v10, v11));

  return v12;
}

- (id)removeAllGeocodings
{
  void *v3;
  id v4;
  NSManagedObjectContext *managedObjectContext;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  PJXBDBF1h0EU80dy *v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ASGeoCodeCacheEntry fetchRequest](ASGeoCodeCacheEntry, "fetchRequest"));
  v4 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v3);
  objc_msgSend(v4, "setResultType:", 1);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100022974;
  v25 = sub_100022984;
  v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100022974;
  v19[4] = sub_100022984;
  v20 = 0;
  managedObjectContext = self->_managedObjectContext;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_1000256F4;
  v14 = &unk_1004CEEB0;
  v17 = v19;
  v15 = self;
  v6 = v4;
  v16 = v6;
  v18 = &v21;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", &v11);
  v7 = (void *)v22[5];
  if (v7)
  {
    v8 = (id)qword_1005185D0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "localizedDescription", v11, v12, v13, v14, v15));
      objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "userInfo"));
      sub_1003D8088();
    }

    v7 = (void *)v22[5];
  }
  v9 = v7;

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (BOOL)updateGeoCodeForAddresses:(id)a3 locations:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSManagedObjectContext *v12;
  id v13;
  NSManagedObjectContext *v14;
  BOOL v15;
  id v16;
  _QWORD v18[4];
  NSManagedObjectContext *v19;
  id v20;
  id v21;
  PJXBDBF1h0EU80dy *v22;
  id v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v9, "count"))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
    v26 = NSLocalizedDescriptionKey;
    v27 = CFSTR("Mismatched location and address counts.");
    v14 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, -27109, v14));
LABEL_7:
    v15 = 0;
    *a5 = v16;
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v8, "count") > 0x1E || !objc_msgSend(v8, "count"))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
    v24 = NSLocalizedDescriptionKey;
    v25 = CFSTR("Invalid update size - min 1, max 30.");
    v14 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, -27109, v14));
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v12 = self->_managedObjectContext;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100025A5C;
  v18[3] = &unk_1004CF018;
  v19 = v12;
  v20 = v8;
  v21 = v9;
  v22 = self;
  v23 = v11;
  v13 = v11;
  v14 = v12;
  -[NSManagedObjectContext performBlock:](v14, "performBlock:", v18);

  v15 = 1;
LABEL_8:

  return v15;
}

- (id)fetchGeoCodingsForAddresses:(id)a3
{
  id v4;
  id v5;
  NSManagedObjectContext *v6;
  void *v7;
  Class Class;
  NSManagedObjectContext *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  PJXBDBF1h0EU80dy *v16;
  NSManagedObjectContext *v17;
  id v18;
  id v19;
  Class v20;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = self->_managedObjectContext;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  Class = objc_getClass("ASGeoCodeResult");
  if (Class)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100026144;
    v14[3] = &unk_1004CF040;
    v15 = v4;
    v16 = self;
    v9 = v6;
    v17 = v9;
    v10 = v5;
    v18 = v10;
    v20 = Class;
    v19 = v7;
    -[NSManagedObjectContext performBlockAndWait:](v9, "performBlockAndWait:", v14);
    if (objc_msgSend(v10, "count"))
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10002646C;
      v13[3] = &unk_1004CF068;
      v13[4] = self;
      -[NSManagedObjectContext performBlock:](v9, "performBlock:", v13);
    }
    v11 = v10;

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D8190();
    v11 = 0;
  }

  return v11;
}

- (id)fetchAllBindings
{
  id v3;
  NSManagedObjectContext *managedObjectContext;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  PJXBDBF1h0EU80dy *v12;
  id v13;

  v3 = objc_alloc_init((Class)NSMutableArray);
  managedObjectContext = self->_managedObjectContext;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100026528;
  v11 = &unk_1004CF090;
  v12 = self;
  v5 = v3;
  v13 = v5;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", &v8);
  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

- (void)removeAllBindings
{
  void *v3;
  id v4;
  NSManagedObjectContext *managedObjectContext;
  id v6;
  NSObject *v7;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  PJXBDBF1h0EU80dy *v12;
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ASBindingKeyVal fetchRequest](ASBindingKeyVal, "fetchRequest"));
  v4 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v3);
  objc_msgSend(v4, "setResultType:", 1);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100022974;
  v22 = sub_100022984;
  v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100022974;
  v16[4] = sub_100022984;
  v17 = 0;
  managedObjectContext = self->_managedObjectContext;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000269A8;
  v11 = &unk_1004CEEB0;
  v14 = v16;
  v12 = self;
  v6 = v4;
  v13 = v6;
  v15 = &v18;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", &v8);
  if (v19[5])
  {
    v7 = (id)qword_1005185D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19[5], "localizedDescription", v8, v9, v10, v11, v12));
      objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19[5], "userInfo"));
      sub_1003D81BC();
    }

  }
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);
}

- (void)commitWithBindings:(id)a3 clearingExistingBindings:(BOOL)a4
{
  id v6;
  NSManagedObjectContext *managedObjectContext;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  managedObjectContext = self->_managedObjectContext;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100026ACC;
  v9[3] = &unk_1004CF0B8;
  v11 = a4;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v9);

}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *v8;
  NSManagedObjectContext *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PJXBDBF1h0EU80dy *v14;
  id v15;
  NSManagedObjectContext *v16;

  v6 = a3;
  v7 = a4;
  v8 = self->_managedObjectContext;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026F04;
  v12[3] = &unk_1004CF0E0;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v16 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  -[NSManagedObjectContext performBlock:](v9, "performBlock:", v12);

}

- (id)evrtH713YbFfEOzk:(id)a3 error:(id *)a4
{
  id v6;
  NSManagedObjectContext *managedObjectContext;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PJXBDBF1h0EU80dy *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100022974;
  v26 = sub_100022984;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100022974;
  v20 = sub_100022984;
  v21 = 0;
  managedObjectContext = self->_managedObjectContext;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000271E4;
  v11[3] = &unk_1004CF108;
  v12 = v6;
  v13 = self;
  v14 = &v16;
  v15 = &v22;
  v8 = v6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v11);
  *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (void)vcOgjK76yFB2scHf:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  id v6;
  NSManagedObjectContext *v7;
  _QWORD v8[4];
  NSManagedObjectContext *v9;
  id v10;
  PJXBDBF1h0EU80dy *v11;

  v4 = a3;
  v5 = self->_managedObjectContext;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027410;
  v8[3] = &unk_1004CEC08;
  v9 = v5;
  v10 = v4;
  v11 = self;
  v6 = v4;
  v7 = v5;
  -[NSManagedObjectContext performBlock:](v7, "performBlock:", v8);

}

- (id)vrh8HnMA51ekK59p:(id)a3 error:(id *)a4
{
  id v6;
  NSManagedObjectContext *managedObjectContext;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PJXBDBF1h0EU80dy *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100022974;
  v26 = sub_100022984;
  v27 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100022974;
  v20 = sub_100022984;
  v21 = 0;
  managedObjectContext = self->_managedObjectContext;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027918;
  v11[3] = &unk_1004CF108;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v22;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v11);
  *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (int64_t)vHfMflesdqOxRXL4:(id)a3 vFD5FwBT4ySYsElE:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSManagedObjectContext *managedObjectContext;
  id v11;
  id v12;
  void *v13;
  int64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PJXBDBF1h0EU80dy *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100022974;
  v26 = sub_100022984;
  v27 = 0;
  managedObjectContext = self->_managedObjectContext;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100027DCC;
  v16[3] = &unk_1004CF158;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v19 = self;
  v20 = &v22;
  v21 = &v28;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v16);

  v13 = (void *)v23[5];
  if (v13)
    *a5 = objc_retainAutorelease(v13);
  v14 = v29[3];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v14;
}

- (id)y5rP3YRqGjztRrd0:(id *)a3
{
  int64_t v4;
  void *v5;

  v4 = -[PJXBDBF1h0EU80dy vHfMflesdqOxRXL4:vFD5FwBT4ySYsElE:error:](self, "vHfMflesdqOxRXL4:vFD5FwBT4ySYsElE:error:", CFSTR("DB_R105387691"), 0, a3);
  if (a3 && *a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
  return v5;
}

- (id)p2quZc9tU4GFOh5B:(id)a3 lPUBHlyPyUveJuEq:(id)a4 WithError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject *v14;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("workflowID == %@ AND createdAt < %@"), v8, v9));
    v13 = -[PJXBDBF1h0EU80dy vHfMflesdqOxRXL4:vFD5FwBT4ySYsElE:error:](self, "vHfMflesdqOxRXL4:vFD5FwBT4ySYsElE:error:", CFSTR("DB_R105387691"), v12, a5);
    if (a5 && *a5)
    {
      v14 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        sub_1003D8274((uint64_t)v8, (uint64_t *)a5, v14);
      v11 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
    }

  }
  return v11;
}

- (void)mFzG243uOJXw4ZYk:(id)a3 rTTHO3ihFn7EUCni:(id)a4 hxew30JsWWGJaBoM:(id)a5
{
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
    sub_1003D82F0();
}

- (void)c94QZ147F1UWY71l:(id)a3 jkjlhN0UgO78kW6q:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSManagedObjectContext *v9;
  NSManagedObjectContext *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  NSManagedObjectContext *v16;

  v7 = a3;
  v8 = a4;
  v9 = self->_managedObjectContext;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028228;
  v13[3] = &unk_1004CF0E0;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  -[NSManagedObjectContext performBlockAndWait:](v10, "performBlockAndWait:", v13);

}

- (id)f9CcEr7NPHjNuSLf:(id)a3 error:(id *)a4
{
  id v6;
  NSManagedObjectContext *managedObjectContext;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PJXBDBF1h0EU80dy *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100022974;
  v26 = sub_100022984;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100022974;
  v20 = sub_100022984;
  v21 = 0;
  managedObjectContext = self->_managedObjectContext;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002856C;
  v11[3] = &unk_1004CF108;
  v12 = v6;
  v13 = self;
  v14 = &v22;
  v15 = &v16;
  v8 = v6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v11);
  *a4 = objc_retainAutorelease((id)v23[5]);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (id)rKKialn8e4bTPAC9:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  JSONBagRecord *v8;
  id v10;

  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PJXBDBF1h0EU80dy f9CcEr7NPHjNuSLf:error:](self, "f9CcEr7NPHjNuSLf:error:", a3, &v10));
  v6 = v10;
  v7 = v6;
  if (v6)
    *a4 = objc_retainAutorelease(v6);
  v8 = -[JSONBagRecord initWithObject:]([JSONBagRecord alloc], "initWithObject:", v5);

  return v8;
}

- (id)retrieveLegacyRavioliWithCoreDataManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gFJw2BGPtEQWyLz5"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DB_R09283478")));
  objc_msgSend(v5, "setFetchLimit:", 1);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100022974;
  v24[4] = sub_100022984;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100022974;
  v22[4] = sub_100022984;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100022974;
  v20 = sub_100022984;
  v21 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100028A74;
  v10[3] = &unk_1004CF180;
  v13 = v22;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v14 = v24;
  v15 = &v16;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  return v8;
}

- (ASCoreDataManager)coreDataManager
{
  return self->_coreDataManager;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_coreDataManager, 0);
}

@end

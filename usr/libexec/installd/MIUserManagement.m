@implementation MIUserManagement

- (MIUserManagement)init
{
  MIUserManagement *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIUserManagement;
  v2 = -[MIUserManagement init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.installd.umAccessQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001D70;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DEA8 != -1)
    dispatch_once(&qword_10009DEA8, block);
  return (id)qword_10009DEA0;
}

- (BOOL)_onQueue_refreshPersonaInformationWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  NSArray *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  NSDictionary *v33;
  NSDictionary *personaAttributesMap;
  id v35;
  id v36;
  uint64_t v38;
  id v39;
  unint64_t v40;
  MIUserManagement *v41;
  id *p_primaryPersonaUniqueString;
  id *p_enterprisePersonaUniqueString;
  id *location;
  NSMutableDictionary *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  _BYTE v52[128];

  v5 = objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v45 = objc_opt_new(NSMutableDictionary);
  v6 = objc_msgSend(sub_100002144(), "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v51 = 0;
  v8 = objc_msgSend(v7, "personaGenerationIdentifierWithError:", &v51);
  v9 = v51;

  if (!v8)
  {
    v35 = sub_100010E50((uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]", 67, MIInstallerErrorDomain, 4, v9, 0, CFSTR("Failed to read UM's persona generation identifier when resolving persona"), v10, v38);
    v15 = (id)objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_26;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[MIUserManagement personaAttributesMap](self, "personaAttributesMap"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[MIUserManagement personaGenerationIdentifier](self, "personaGenerationIdentifier");

    if (v8 == (id)v13)
    {
      v14 = 1;
      v15 = v9;
      goto LABEL_29;
    }
  }
  v16 = objc_msgSend(sub_100002144(), "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v50 = v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "listAllPersonaAttributesWithError:", &v50));
  v19 = v50;

  if (!v18)
  {
    v36 = sub_100010E50((uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]", 79, MIInstallerErrorDomain, 4, v19, 0, CFSTR("Failed to read persona attributes from UM"), v20, v38);
    v15 = (id)objc_claimAutoreleasedReturnValue(v36);
    v9 = v19;
LABEL_26:

    if (a3)
    {
      v15 = objc_retainAutorelease(v15);
      v14 = 0;
      *a3 = v15;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_29;
  }
  v39 = v19;
  v40 = (unint64_t)v8;
  v41 = self;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = v18;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v22)
  {
    v23 = v22;
    p_enterprisePersonaUniqueString = (id *)&self->_enterprisePersonaUniqueString;
    location = (id *)&self->_systemPersonaUniqueString;
    v24 = *(_QWORD *)v47;
    p_primaryPersonaUniqueString = (id *)&self->_primaryPersonaUniqueString;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userPersonaUniqueString"));
        if (v27)
        {
          if (objc_msgSend(v26, "isSystemPersona"))
            objc_storeStrong(location, v27);
          if (objc_msgSend(v26, "isEnterprisePersona"))
            objc_storeStrong(p_enterprisePersonaUniqueString, v27);
          if (objc_msgSend(v26, "isPersonalPersona"))
            objc_storeStrong(p_primaryPersonaUniqueString, v27);
          v28 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userPersonaBundleIDList"));
          if (!v28)
            v28 = objc_opt_new(NSArray);
          v29 = objc_alloc((Class)MIPersonaAttributes);
          v30 = objc_msgSend(v26, "userPersonaType");
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v28));
          v32 = objc_msgSend(v29, "initWithPersonaString:personaType:associatedBundleIDs:", v27, v30, v31);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v32, v27);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v23);
  }

  v33 = (NSDictionary *)-[NSMutableDictionary copy](v45, "copy");
  personaAttributesMap = v41->_personaAttributesMap;
  v41->_personaAttributesMap = v33;

  v41->_personaGenerationIdentifier = v40;
  v14 = 1;
  v15 = v39;
LABEL_29:

  return v14;
}

- (NSString)primaryPersonaUniqueString
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002270;
  block[3] = &unk_100084C30;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_primaryPersonaUniqueString;
}

- (NSString)enterprisePersonaUniqueString
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002364;
  block[3] = &unk_100084C30;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_enterprisePersonaUniqueString;
}

- (NSString)systemPersonaUniqueString
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002458;
  block[3] = &unk_100084C30;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_systemPersonaUniqueString;
}

- (BOOL)isKnownPersonaUniqueString:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  int v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10000266C;
  v19 = sub_10000267C;
  v20 = 0;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Invalid")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("PersonalPersonaPlaceholderString")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002684;
    v11[3] = &unk_100084C58;
    v11[4] = self;
    v13 = &v15;
    v12 = v6;
    v14 = &v21;
    dispatch_sync(v8, v11);

    v9 = *((unsigned __int8 *)v22 + 24);
    if (a4 && !*((_BYTE *)v22 + 24))
    {
      *a4 = objc_retainAutorelease((id)v16[5]);
      v9 = *((unsigned __int8 *)v22 + 24);
    }
    v7 = v9 != 0;

  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v7;
}

- (id)multiPersonaSADAppBundleIDsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10000266C;
  v20 = sub_10000267C;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10000266C;
  v14 = sub_10000267C;
  v15 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000028B4;
  block[3] = &unk_100084C80;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  v6 = (void *)v17[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v11[5]);
    v6 = (void *)v17[5];
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)personaForBundleID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10000266C;
  v35 = sub_10000267C;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10000266C;
  v29 = sub_10000267C;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v15 = v6;
    MOLogWrite(qword_10009E048, 7, "-[MIUserManagement personaForBundleID:error:]", CFSTR("Querying persona from UserManagement: %@"));
  }
  v7 = objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue", v15));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002BDC;
  block[3] = &unk_100084CD0;
  v18 = &v21;
  block[4] = self;
  v19 = &v25;
  v8 = v6;
  v17 = v8;
  v20 = &v31;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v22 + 24))
  {
    if (v32[5])
      goto LABEL_11;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryPersonaString"));
    v11 = (void *)v32[5];
    v32[5] = v10;

    v12 = *((_BYTE *)v22 + 24) == 0;
    if (!a4)
      goto LABEL_11;
  }
  else
  {
    v12 = 1;
    if (!a4)
      goto LABEL_11;
  }
  if (v12)
    *a4 = objc_retainAutorelease((id)v26[5]);
LABEL_11:
  v13 = (id)v32[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v13;
}

- (unint64_t)personaTypeForPersonaUniqueString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIUserManagement personaAttributesMap](self, "personaAttributesMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIUserManagement personaAttributesMap](self, "personaAttributesMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));
    v9 = (unint64_t)objc_msgSend(v8, "personaType");

  }
  else
  {
    v9 = 1000;
  }

  return v9;
}

- (void)setPrimaryPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setEnterprisePersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSystemPersonaUniqueString:(id)a3
{
  objc_storeStrong((id *)&self->_systemPersonaUniqueString, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (unint64_t)personaGenerationIdentifier
{
  return self->_personaGenerationIdentifier;
}

- (void)setPersonaGenerationIdentifier:(unint64_t)a3
{
  self->_personaGenerationIdentifier = a3;
}

- (NSDictionary)personaAttributesMap
{
  return self->_personaAttributesMap;
}

- (void)setPersonaAttributesMap:(id)a3
{
  objc_storeStrong((id *)&self->_personaAttributesMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaAttributesMap, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_systemPersonaUniqueString, 0);
  objc_storeStrong((id *)&self->_enterprisePersonaUniqueString, 0);
  objc_storeStrong((id *)&self->_primaryPersonaUniqueString, 0);
}

@end

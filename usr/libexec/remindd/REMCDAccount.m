@implementation REMCDAccount

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)predicateForCloudKitAccountsWithKeyPathPrefix:(id)a3
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = CFSTR("type IN %@");
  if (a3)
  {
    a1 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), a3, CFSTR("type IN %@")));
    v3 = (__CFString *)a1;
  }
  v4 = cloudKitAccountTypes(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v3, v5));

  return v6;
}

- (id)accountTypeHost
{
  REMAccountTypeHost *accountTypeHost;
  id v4;
  REMAccountTypeHost *v5;
  REMAccountTypeHost *v6;

  accountTypeHost = self->_accountTypeHost;
  if (!accountTypeHost
    || (v4 = -[REMAccountTypeHost _accountType](accountTypeHost, "_accountType"),
        v4 != (id)(int)-[REMCDAccount type](self, "type")))
  {
    v5 = (REMAccountTypeHost *)objc_msgSend(objc_alloc((Class)REMAccountTypeHost), "initWithType:", (int)-[REMCDAccount type](self, "type"));
    v6 = self->_accountTypeHost;
    self->_accountTypeHost = v5;

  }
  return self->_accountTypeHost;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v6 = objc_opt_class(REMCDAccount, v5);
  v7 = REMDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name")), v9, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount name](self, "name"));
    v12 = objc_msgSend(v11, "compare:", v10);

  }
  else
  {
    v12 = 0;
  }

  return (int64_t)v12;
}

+ (id)cdEntityName
{
  return +[REMAccount cdEntityName](REMAccount, "cdEntityName");
}

- (void)setPersonIDSalt:(id)a3
{
  id v4;

  v4 = a3;
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("personIDSalt"));
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("personIDSalt_v1"));
  -[REMCDAccount setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("personIDSalt_v1"));

  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("personIDSalt_v1"));
  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("personIDSalt"));
}

- (NSData)personIDSalt
{
  void *v3;

  -[REMCDAccount willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("personIDSalt"));
  -[REMCDAccount willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("personIDSalt_v1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("personIDSalt_v1")));
  -[REMCDAccount didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("personIDSalt_v1"));
  -[REMCDAccount didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("personIDSalt"));
  return (NSData *)v3;
}

- (NSData)listIDsMergeableOrdering
{
  void *v3;

  -[REMCDAccount willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("listIDsMergeableOrdering"));
  -[REMCDAccount willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("listIDsMergeableOrdering_v2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("listIDsMergeableOrdering_v2")));
  -[REMCDAccount didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("listIDsMergeableOrdering_v2"));
  -[REMCDAccount didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("listIDsMergeableOrdering"));
  return (NSData *)v3;
}

- (void)setListIDsMergeableOrdering:(id)a3
{
  id v4;

  v4 = a3;
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listIDsMergeableOrdering"));
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listIDsMergeableOrdering_v2"));
  -[REMCDAccount setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("listIDsMergeableOrdering_v2"));

  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listIDsMergeableOrdering_v2"));
  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listIDsMergeableOrdering"));
}

- (BOOL)postAccountPropertyChangeNotificationWithKey:(id)a3 changedValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
    if (v10
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount accountTypeHost](self, "accountTypeHost")),
          v12 = objc_msgSend(v11, "isValid"),
          v11,
          v12))
    {
      v13 = (int)-[REMCDAccount type](self, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[RDAccountPropertiesNotifier notificationUserInfoPropertyNameKey](RDAccountPropertiesNotifier, "notificationUserInfoPropertyNameKey"));
      objc_msgSend(v14, "setValue:forKey:", v6, v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[RDAccountPropertiesNotifier notificationUserInfoPropertyValueKey](RDAccountPropertiesNotifier, "notificationUserInfoPropertyValueKey"));
      objc_msgSend(v14, "setValue:forKey:", v8, v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[RDAccountPropertiesNotifier notificationUserInfoAccountObjectIDKey](RDAccountPropertiesNotifier, "notificationUserInfoAccountObjectIDKey"));
      objc_msgSend(v14, "setValue:forKey:", v10, v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[RDAccountPropertiesNotifier notificationUserInfoAccountTypeKey](RDAccountPropertiesNotifier, "notificationUserInfoAccountTypeKey"));
      objc_msgSend(v14, "setValue:forKey:", v18, v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("RDStoreControllerREMAccountPropertiesDidUpdateNotification"), 0, v14);

      v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountTypeHost, 0);
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  return 1;
}

- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("lists"));

  if (v9)
  {
    v11 = objc_opt_class(REMCDList, v10);
    v12 = REMCheckedDynamicCast(v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentList"));
    v15 = v14 == 0;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)REMCDAccount;
    v15 = -[REMCDObject shouldCascadeMarkAsDeleteInto:forRelationship:](&v17, "shouldCascadeMarkAsDeleteInto:forRelationship:", v6, v7);
  }

  return v15;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet set](NSSet, "set");
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  return kREMSupportedVersionUnset;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAccount"));
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class(REMCDAccount) == a1)
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v3 = (void *)qword_1008528D0;
    qword_1008528D0 = v2;

  }
}

+ (id)_fetchCloudKitAccountsInContext:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100097014;
  v13 = sub_100097024;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009702C;
  v6[3] = &unk_1007D7AF8;
  v8 = &v9;
  v3 = a3;
  v7 = v3;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (id)allCloudKitAccountsInContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100097014;
  v17 = sub_100097024;
  v18 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1008528D8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000973C0;
  v9[3] = &unk_1007D9C78;
  v5 = v4;
  v10 = v5;
  v11 = &v13;
  v12 = a1;
  sub_1000973C0((uint64_t)v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008528D8);

  v6 = (void *)v14[5];
  if (!v6)
    v6 = &__NSArray0__struct;
  v7 = v6;
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (unint64_t)countCloudBasedAccountsInContext:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100097704;
  v6[3] = &unk_1007D7AF8;
  v8 = &v9;
  v3 = a3;
  v7 = v3;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (id)_groundTruth_primaryActiveCloudKitAccountInContext:(id)a3
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allCloudKitAccountsInContext:", a3));
  v4 = objc_opt_new(NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountTypeHost", (_QWORD)v17));
        if (objc_msgSend(v11, "isPrimaryCloudKit"))
        {
          v12 = objc_msgSend(v10, "inactive");

          if ((v12 & 1) == 0)
            -[NSMutableArray addObject:](v4, "addObject:", v10);
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  if (!-[NSMutableArray count](v4, "count"))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100685320();

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v4, "firstObject", (_QWORD)v17));
  if ((unint64_t)-[NSMutableArray count](v4, "count") >= 2)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_100685274(v4, v14, v15);

  }
  return v14;
}

+ (id)unsafeUntilSystemReady_primaryCloudKitAccountInContext:(id)a3 appleAccountUtilities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allCloudKitAccountsInContext:", v6));
  if (!objc_msgSend(v8, "count"))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10068534C();
    goto LABEL_9;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unsafeUntilSystemReady_primaryICloudACAccount"));
  if (!v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100685378();

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100097014;
  v21 = sub_100097024;
  v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100097B98;
  v13[3] = &unk_1007D7FB0;
  v14 = v8;
  v9 = v9;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v6, "performBlockAndWait:", v13);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
LABEL_10:

  return v10;
}

+ (REMCDAccount)accountWithCKIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ckIdentifier == %@"), v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "accountsMatchingPredicate:context:", v8, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = v10;
  if (v10 && objc_msgSend(v10, "inactive"))
  {
    v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-accountWithCKIdentifier: fetched an inactive account {ckIdentifier: %{public}@}", buf, 0xCu);
    }

  }
  return (REMCDAccount *)v11;
}

+ (id)cloudKitAccountWithCKIdentifier:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100097014;
  v20 = sub_100097024;
  v21 = 0;
  if (!objc_msgSend(v6, "length"))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1006853A4();
    goto LABEL_8;
  }
  if (!v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1006853D0();
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1008528D8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000982B8;
  v11[3] = &unk_1007DA8C8;
  v12 = v7;
  v14 = &v16;
  v13 = v6;
  v15 = a1;
  sub_1000982B8((uint64_t)v11);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008528D8);

  v8 = (id)v17[5];
LABEL_9:
  _Block_object_dispose(&v16, 8);

  return v8;
}

+ (BOOL)clearAppleCloudKitTable
{
  BOOL v2;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1008528D8);
  v2 = objc_msgSend((id)qword_1008528D0, "count") != 0;
  objc_msgSend((id)qword_1008528D0, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1008528D8);
  return v2;
}

- (BOOL)generateAndSavePersonIDSaltIfNeededWithContext:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount accountTypeHost](self, "accountTypeHost"));
  v6 = objc_msgSend(v5, "isPrimaryCloudKit");

  if ((v6 & 1) == 0)
  {
    v24 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_1006855E4();

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount personIDSalt](self, "personIDSalt"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_100685520(self, v8);
LABEL_5:
    LOBYTE(v9) = 0;
    goto LABEL_17;
  }
  v10 = objc_claimAutoreleasedReturnValue(+[PersonIDSaltGenerator randomSalt](PersonIDSaltGenerator, "randomSalt"));
  if (!v10)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1006853FC(self, v8);
    goto LABEL_5;
  }
  v8 = v10;
  -[REMCDAccount setPersonIDSalt:](self, "setPersonIDSalt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject createResolutionTokenMapIfNecessary](self, "createResolutionTokenMapIfNecessary"));
  v12 = CFSTR("personIDSalt");
  objc_msgSend(v11, "updateForKey:", v12);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getTokenForKey:", v12));
  -[REMCDObject updateChangeCount](self, "updateChangeCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount identifier](self, "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount personIDSalt](self, "personIDSalt"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "base64EncodedStringWithOptions:", 0));
  v25 = (void *)v13;
  v9 = objc_msgSend(v4, "ic_saveWithLogDescription:", CFSTR("Setting account .personIDSalt {accountID: %@, salt: %@, resolutionToken: %@}"), v15, v17, v13);

  if (v9)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDAccount personIDSalt](self, "personIDSalt"));
    v19 = -[REMCDAccount postAccountPropertyChangeNotificationWithKey:changedValue:](self, "postAccountPropertyChangeNotificationWithKey:changedValue:", CFSTR("personIDSalt_v1"), v18);
    v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2112;
        v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "generateAndSavePersonIDSaltIfNeeded...: Posted RDStoreControllerREMAccountPropertiesDidUpdate {accountID: %{public}@, salt: %@}", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_100685484(self, (uint64_t)v18, v21);
    }

  }
LABEL_17:

  return v9;
}

+ (id)_unitTest_randomPersonIDSalt
{
  return +[PersonIDSaltGenerator randomSalt](PersonIDSaltGenerator, "randomSalt");
}

+ (id)accountByCKIdentifierFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[4];
  uint64_t v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckIdentifier", (_QWORD)v15));
        if (v11)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);
        }
        else
        {
          v12 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            sub_10068561C(v19, v10, &v20, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
}

+ (id)recordTypes
{
  return Array._bridgeToObjectiveC()().super.isa;
}

- (id)recordName
{
  REMCDAccount *v2;
  NSString v3;

  v2 = self;
  REMCDAccount.recordName()();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)recordZoneName
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("Reminders"));
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (id)recordType
{
  return String._bridgeToObjectiveC()();
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  swift_getObjCClassMetadata(a1);
  v11 = a3;
  v12 = a5;
  v13 = (void *)static REMCDAccount.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, (uint64_t)v12);

  swift_bridgeObjectRelease();
  return v13;
}

+ (id)allCloudObjectsInContext:(id)a3
{
  id v4;
  Class isa;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  static REMCDAccount.allCloudObjects(in:)((uint64_t)v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (id)allCloudObjectIDsInContext:(id)a3
{
  id v4;
  Class isa;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  static REMCDAccount.allCloudObjectIDs(in:)((uint64_t)v4);

  sub_1000151B0(0, &qword_100843EA0, NSManagedObjectID_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  swift_getObjCClassMetadata(a1);
  v11 = a3;
  v12 = a5;
  static REMCDAccount.newCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, (uint64_t)v12);
  v14 = v13;

  swift_bridgeObjectRelease();
  return v14;
}

- (void)sortChildrenObjects
{
  REMCDAccount *v2;

  v2 = self;
  REMCDAccount.sortChildrenObjects()();

}

- (BOOL)mergeMigrationStateFromRecord:(id)a3
{
  id v4;
  REMCDAccount *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = REMCDAccount.mergeMigrationState(fromRecord:)((CKRecord)v4);

  return self & 1;
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  REMCDAccount *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDAccount.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  REMCDAccount *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDAccount.newlyCreatedRecord()();

  return v3;
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

- (BOOL)needsToBePushedToCloud
{
  REMCDAccount *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = REMCDAccount.needsToBePushedToCloud()();

  return v3;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  return 0;
}

+ (void)clearUserRecord:(id)a3
{
  id v3;

  v3 = a3;
  sub_10059D700();

}

+ (void)writeMigrationStateTo:(id)a3 didChooseToMigrate:(BOOL)a4 didFinishMigration:(BOOL)a5
{
  uint64_t v7;
  id v8;
  _BYTE v9[24];
  void *v10;
  void *v11;

  v10 = &type metadata for Bool;
  v11 = &protocol witness table for Bool;
  v9[0] = a4;
  v7 = sub_1000151B0(0, (unint64_t *)&qword_100839CB0, CKRecord_ptr);
  v8 = a3;
  CKRecordKeyValueSetting.subscript.setter(v9, 0xD000000000000012, 0x80000001007043B0, v7);
  v10 = &type metadata for Bool;
  v11 = &protocol witness table for Bool;
  v9[0] = a5;
  CKRecordKeyValueSetting.subscript.setter(v9, 0xD000000000000012, 0x8000000100704390, v7);

}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 1;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  return 0;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  return 0;
}

- (void)cleanUpAfterLocalObjectMerge
{
  REMCDAccount *v2;

  v2 = self;
  REMCDAccount.cleanUpAfterLocalObjectMerge()();

}

@end

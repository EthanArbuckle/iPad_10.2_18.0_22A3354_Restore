@implementation STUEnrollmentRecordDeleter

- (STUEnrollmentRecordDeleter)initWithEnrollmentRecordsByIdentifier:(id)a3 identifiersToDelete:(id)a4
{
  id v6;
  id v7;
  STUEnrollmentRecordDeleter *v8;
  NSDictionary *v9;
  NSDictionary *originalTable;
  NSSet *v11;
  NSSet *identifiersToDelete;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUEnrollmentRecordDeleter;
  v8 = -[STUEnrollmentRecordDeleter init](&v14, "init");
  if (v8)
  {
    v9 = (NSDictionary *)objc_msgSend(v6, "copy");
    originalTable = v8->_originalTable;
    v8->_originalTable = v9;

    v11 = (NSSet *)objc_msgSend(v7, "copy");
    identifiersToDelete = v8->_identifiersToDelete;
    v8->_identifiersToDelete = v11;

  }
  return v8;
}

- (id)deleteEnrollmentRecords
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  STUEnrollmentRecordDeleterResult *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter identifiersToDelete](self, "identifiersToDelete", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter originalTable](self, "originalTable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          -[STUEnrollmentRecordDeleter deleteEnrollmentRecord:](self, "deleteEnrollmentRecord:", v11);
        }
        else
        {
          v12 = CRKErrorWithCodeAndUserInfo(202, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, v9);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter makeRemainingEnrollmentRecordsByIdentifier](self, "makeRemainingEnrollmentRecordsByIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter makeErrorWithErrorsByGroupIdentifier:](self, "makeErrorWithErrorsByGroupIdentifier:", v3));
  v16 = -[STUEnrollmentRecordDeleterResult initWithRemainingRecordsByIdentifier:error:]([STUEnrollmentRecordDeleterResult alloc], "initWithRemainingRecordsByIdentifier:error:", v14, v15);

  return v16;
}

- (void)deleteEnrollmentRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trustedAnchorCertificatePersistentIDs"));
  -[STUEnrollmentRecordDeleter deleteAnchorCertificatePersistentIDs:](self, "deleteAnchorCertificatePersistentIDs:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rollingCourseIdentitySet"));
  -[STUEnrollmentRecordDeleter deleteIdentitySet:](self, "deleteIdentitySet:", v6);

}

- (id)makeRemainingEnrollmentRecordsByIdentifier
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter remainingEnrollmentRecords](self, "remainingEnrollmentRecords", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "groupIdentifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = -[NSMutableDictionary copy](v3, "copy");
  return v11;
}

- (id)makeErrorWithErrorsByGroupIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v8;
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v8 = CFSTR("CRKPartialErrorsByItemIdentifier");
    v9 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v5 = CRKErrorWithCodeAndUserInfo(29, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deleteAnchorCertificatePersistentIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[STUEnrollmentRecordDeleter deleteAnchorCertificatePersistentIDIfUnclaimed:](self, "deleteAnchorCertificatePersistentIDIfUnclaimed:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)deleteAnchorCertificatePersistentIDIfUnclaimed:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter claimedAnchorCertificatePersistentIDs](self, "claimedAnchorCertificatePersistentIDs"));
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if ((v5 & 1) == 0)
    -[STUEnrollmentRecordDeleter deletePersistentID:](self, "deletePersistentID:", v6);

}

- (NSSet)claimedAnchorCertificatePersistentIDs
{
  NSSet *claimedAnchorCertificatePersistentIDs;
  NSSet *v4;
  NSSet *v5;

  claimedAnchorCertificatePersistentIDs = self->_claimedAnchorCertificatePersistentIDs;
  if (!claimedAnchorCertificatePersistentIDs)
  {
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter makeClaimedAnchorCertificatePersistentIDs](self, "makeClaimedAnchorCertificatePersistentIDs"));
    v5 = self->_claimedAnchorCertificatePersistentIDs;
    self->_claimedAnchorCertificatePersistentIDs = v4;

    claimedAnchorCertificatePersistentIDs = self->_claimedAnchorCertificatePersistentIDs;
  }
  return claimedAnchorCertificatePersistentIDs;
}

- (id)makeClaimedAnchorCertificatePersistentIDs
{
  NSMutableSet *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_new(NSMutableSet);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter remainingEnrollmentRecords](self, "remainingEnrollmentRecords", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "trustedAnchorCertificatePersistentIDs"));
        -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = -[NSMutableSet copy](v3, "copy");
  return v10;
}

- (void)deleteIdentitySet:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeIdentityPersistentID"));
  -[STUEnrollmentRecordDeleter deleteIdentityPersistentIDIfUnclaimed:](self, "deleteIdentityPersistentIDIfUnclaimed:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stagedIdentityPersistentID"));
  -[STUEnrollmentRecordDeleter deleteIdentityPersistentIDIfUnclaimed:](self, "deleteIdentityPersistentIDIfUnclaimed:", v6);

}

- (void)deleteIdentityPersistentIDIfUnclaimed:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter claimedIdentityPersistentIDs](self, "claimedIdentityPersistentIDs"));
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if ((v5 & 1) == 0)
    -[STUEnrollmentRecordDeleter deletePersistentID:](self, "deletePersistentID:", v6);

}

- (NSSet)claimedIdentityPersistentIDs
{
  NSSet *claimedIdentityPersistentIDs;
  STUClaimedIdentityPersistentIDs *v4;
  void *v5;
  STUClaimedIdentityPersistentIDs *v6;
  NSSet *v7;
  NSSet *v8;

  claimedIdentityPersistentIDs = self->_claimedIdentityPersistentIDs;
  if (!claimedIdentityPersistentIDs)
  {
    v4 = [STUClaimedIdentityPersistentIDs alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter remainingEnrollmentRecords](self, "remainingEnrollmentRecords"));
    v6 = -[STUClaimedIdentityPersistentIDs initWithEnrollmentRecords:](v4, "initWithEnrollmentRecords:", v5);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue(-[STUClaimedIdentityPersistentIDs persistentIDs](v6, "persistentIDs"));
    v8 = self->_claimedIdentityPersistentIDs;
    self->_claimedIdentityPersistentIDs = v7;

    claimedIdentityPersistentIDs = self->_claimedIdentityPersistentIDs;
  }
  return claimedIdentityPersistentIDs;
}

- (void)deletePersistentID:(id)a3
{
  id v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keychain"));
    objc_msgSend(v4, "removeItemWithPersistentID:", v3);

  }
}

- (NSArray)remainingEnrollmentRecords
{
  NSArray *remainingEnrollmentRecords;
  NSArray *v4;
  NSArray *v5;

  remainingEnrollmentRecords = self->_remainingEnrollmentRecords;
  if (!remainingEnrollmentRecords)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter makeRemainingEnrollmentRecords](self, "makeRemainingEnrollmentRecords"));
    v5 = self->_remainingEnrollmentRecords;
    self->_remainingEnrollmentRecords = v4;

    remainingEnrollmentRecords = self->_remainingEnrollmentRecords;
  }
  return remainingEnrollmentRecords;
}

- (id)makeRemainingEnrollmentRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter originalTable](self, "originalTable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnrollmentRecordDeleter identifiersToDelete](self, "identifiersToDelete"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crk_setBySubtractingSet:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001858C;
  v11[3] = &unk_1000C9E50;
  v11[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crk_mapUsingBlock:", v11));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  return v9;
}

- (NSDictionary)originalTable
{
  return self->_originalTable;
}

- (NSSet)identifiersToDelete
{
  return self->_identifiersToDelete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToDelete, 0);
  objc_storeStrong((id *)&self->_originalTable, 0);
  objc_storeStrong((id *)&self->_remainingEnrollmentRecords, 0);
  objc_storeStrong((id *)&self->_claimedIdentityPersistentIDs, 0);
  objc_storeStrong((id *)&self->_claimedAnchorCertificatePersistentIDs, 0);
}

@end

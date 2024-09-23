@implementation STUClaimedIdentityPersistentIDs

- (STUClaimedIdentityPersistentIDs)initWithEnrollmentRecords:(id)a3
{
  id v4;
  id v5;
  void *v6;
  STUClaimedIdentityPersistentIDs *v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "persistentIDsClaimedByEnrollmentRecords:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = -[STUClaimedIdentityPersistentIDs initWithPersistentIDs:](self, "initWithPersistentIDs:", v6);
  return v7;
}

- (STUClaimedIdentityPersistentIDs)init
{
  NSSet *v3;
  STUClaimedIdentityPersistentIDs *v4;

  v3 = objc_opt_new(NSSet);
  v4 = -[STUClaimedIdentityPersistentIDs initWithPersistentIDs:](self, "initWithPersistentIDs:", v3);

  return v4;
}

- (STUClaimedIdentityPersistentIDs)initWithPersistentIDs:(id)a3
{
  id v4;
  STUClaimedIdentityPersistentIDs *v5;
  NSSet *v6;
  NSSet *persistentIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUClaimedIdentityPersistentIDs;
  v5 = -[STUClaimedIdentityPersistentIDs init](&v9, "init");
  if (v5)
  {
    v6 = (NSSet *)objc_msgSend(v4, "copy");
    persistentIDs = v5->_persistentIDs;
    v5->_persistentIDs = v6;

  }
  return v5;
}

+ (id)persistentIDsClaimedByEnrollmentRecords:(id)a3
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9), "rollingCourseIdentitySet", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeIdentityPersistentID"));
        if (v11)
          -[NSMutableSet addObject:](v4, "addObject:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stagedIdentityPersistentID"));
        if (v12)
          -[NSMutableSet addObject:](v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = -[NSMutableSet copy](v4, "copy");
  return v13;
}

- (NSSet)persistentIDs
{
  return self->_persistentIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIDs, 0);
}

@end

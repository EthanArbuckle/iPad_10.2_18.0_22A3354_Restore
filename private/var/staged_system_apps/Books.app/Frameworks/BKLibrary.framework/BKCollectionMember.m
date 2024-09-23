@implementation BKCollectionMember

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *collectionID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKCollectionMember;
  -[BKCollectionMember awakeFromFetch](&v8, "awakeFromFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
    v6 = (NSString *)objc_msgSend(v5, "copy");
    collectionID = self->_collectionID;
    self->_collectionID = v6;

  }
}

+ (id)collectionMemberDictionaryWithLibraryAsset:(id)a3 sortKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetID"));
  if (objc_msgSend(v6, "length"))
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, CFSTR("assetID"), v5, CFSTR("sortKey"), 0));
  else
    v7 = 0;

  return v7;
}

+ (id)collectionMemberDictionariesWithAssetIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
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
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && objc_msgSend(v10, "length"))
        {
          v12 = objc_alloc((Class)NSDictionary);
          v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", v10, CFSTR("assetID"), 0, (_QWORD)v15);
          objc_msgSend(v4, "addObject:", v13);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)predicateForCollectionMembersWithAssetIDs:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("assetID IN %@"), v3));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
  v5 = (void *)v4;

  return v5;
}

+ (id)predicateForCollectionMembersWithCollection:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("collection"), a3);
}

- (id)collectionMemberRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[BKCollectionMember collectionID](self, "collectionID"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember assetID](self, "assetID")),
        v5,
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collectionID](self, "collectionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember assetID](self, "assetID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollectionMember collectionMemberIDWithCollectionID:assetID:](BCCollectionMember, "collectionMemberIDWithCollectionID:assetID:", v6, v7));

    v9 = objc_msgSend(objc_alloc((Class)BCMutableCollectionMember), "initWithCollectionMemberID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember sortKey](self, "sortKey"));
    objc_msgSend(v9, "setSortOrder:", objc_msgSend(v10, "intValue"));

    objc_msgSend(v9, "setDeletedFlag:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember localModDate](self, "localModDate"));
    objc_msgSend(v9, "setModificationDate:", v11);

  }
  else
  {
    v12 = BKLibraryCollectionLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_83344(self);

    v9 = 0;
  }
  return v9;
}

- (void)configureFromCollectionMember:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  id v40;
  NSObject *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  unsigned int v47;
  void *v48;
  unsigned int v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKCollectionMember localModDate](self, "localModDate"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modificationDate"));
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v20 = objc_msgSend(v19, "verboseLoggingEnabled");

    if (!v20)
      goto LABEL_17;
    v21 = BKLibraryCollectionDevelopmentLog();
    v11 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember asset](self, "asset"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
    *(_DWORD *)buf = 138412546;
    v59 = (uint64_t)v13;
    v60 = 2112;
    v61 = v15;
    v16 = "\"\\\"configureFromCollectionMember No local modDate, No collectionMember modDate for collectionMember %@ - %@\\\"\";
    v17 = v11;
    v18 = 22;
    goto LABEL_15;
  }
  if (!v5 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v9 = objc_msgSend(v8, "verboseLoggingEnabled");

    if (!v9)
      goto LABEL_17;
    v10 = BKLibraryCollectionDevelopmentLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember asset](self, "asset"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
    *(_DWORD *)buf = 138412802;
    v59 = (uint64_t)v7;
    v60 = 2112;
    v61 = v13;
    v62 = 2112;
    v63 = v15;
    v16 = "\"\\\"No local modDate, collectionMember has modDate:%@  for collectionMember %@ - %@\\\"\";
    v17 = v11;
    v18 = 32;
    goto LABEL_15;
  }
  if (v5)
  {
    if (v6)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
      v23 = objc_msgSend(v22, "verboseLoggingEnabled");

      if (v23)
      {
        v24 = BKLibraryCollectionDevelopmentLog();
        v11 = objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember asset](self, "asset"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        *(_DWORD *)buf = 138413058;
        v59 = v5;
        v60 = 2112;
        v61 = v7;
        v62 = 2112;
        v63 = v13;
        v64 = 2112;
        v65 = v15;
        v16 = "\"\\\"local has modDate:%@, collectionMember has modDate:%@ for collectionMember %@ - %@\\\"\";
        v17 = v11;
        v18 = 42;
LABEL_15:
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

        goto LABEL_16;
      }
    }
  }
LABEL_17:
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionMemberID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollectionMember collectionIDFromCollectionMemberID:](BCCollectionMember, "collectionIDFromCollectionMemberID:", v25));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionMemberID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollectionMember assetIDFromCollectionMemberID:](BCCollectionMember, "assetIDFromCollectionMemberID:", v27));

  if (objc_msgSend(v4, "deletedFlag"))
  {
    v29 = BKLibraryCollectionLog();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_835EC(self);

  }
  v31 = objc_claimAutoreleasedReturnValue(-[BKCollectionMember collectionID](self, "collectionID"));
  if (v31)
  {
    v32 = (void *)v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collectionID](self, "collectionID"));
    v34 = objc_msgSend(v26, "isEqualToString:", v33);

    if ((v34 & 1) == 0)
    {
      v35 = BKLibraryCollectionLog();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_8356C(self);

    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember assetID](self, "assetID"));

  if (!v37)
  {
    -[BKCollectionMember setAssetID:](self, "setAssetID:", v28);
    v42 = BKLibraryCollectionLog();
    v41 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_833E8(self, v41);
    goto LABEL_32;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember assetID](self, "assetID"));
  v39 = objc_msgSend(v28, "isEqualToString:", v38);

  if ((v39 & 1) == 0)
  {
    v40 = BKLibraryCollectionLog();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_834EC(self);
LABEL_32:

  }
  if (v7)
  {
    if (!v5
      || (objc_msgSend(v7, "timeIntervalSinceReferenceDate"),
          v44 = v43,
          objc_msgSend((id)v5, "timeIntervalSinceReferenceDate"),
          v44 > v45))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)objc_msgSend(v4, "sortOrder")));
      -[BKCollectionMember setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:", v46, CFSTR("sortKey"));
      v47 = -[BKCollectionMember hasChanges](self, "hasChanges");
      -[BKCollectionMember setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v7, CFSTR("localModDate"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
      v49 = objc_msgSend(v48, "verboseLoggingEnabled");

      if (v47)
      {
        if (v49)
        {
          v50 = BKLibraryCollectionDevelopmentLog();
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember shortDescription](self, "shortDescription"));
            *(_DWORD *)buf = 138412290;
            v59 = (uint64_t)v52;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "\"\\\"BKCollectionMember Configured with changes: %@\\\"\", buf, 0xCu);

          }
LABEL_43:

        }
      }
      else if (v49)
      {
        v53 = BKLibraryCollectionDevelopmentLog();
        v51 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "title"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember asset](self, "asset"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "title"));
          *(_DWORD *)buf = 138412546;
          v59 = (uint64_t)v54;
          v60 = 2112;
          v61 = v56;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "\"\\\"BKCollectionMember Configure - No changes besides date for collectionMember %@ - %@\\\"\", buf, 0x16u);

        }
        goto LABEL_43;
      }

    }
  }

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember assetID](self, "assetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember asset](self, "asset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember sortKey](self, "sortKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BKCollectionMember collectionID: %@ assetID: %@ title: %@ sortKey:%@"), v4, v5, v7, v8));

  return v9;
}

- (void)updateLastModification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BKCollectionMember setLocalModDate:](self, "setLocalModDate:", v3);

}

- (void)setAssetID:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember assetID](self, "assetID"));
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[BKCollectionMember willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assetID"));
    -[BKCollectionMember setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("assetID"));
    -[BKCollectionMember updateLastModification](self, "updateLastModification");
    -[BKCollectionMember didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assetID"));
  }

}

- (void)setTemporaryAssetID:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember temporaryAssetID](self, "temporaryAssetID"));
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[BKCollectionMember willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("temporaryAssetID"));
    -[BKCollectionMember setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("temporaryAssetID"));
    -[BKCollectionMember updateLastModification](self, "updateLastModification");
    -[BKCollectionMember didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("temporaryAssetID"));
  }

}

- (void)setAsset:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKCollectionMember asset](self, "asset"));

  if (v4 != v5)
  {
    -[BKCollectionMember willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("asset"));
    -[BKCollectionMember setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("asset"));
    -[BKCollectionMember updateLastModification](self, "updateLastModification");
    -[BKCollectionMember didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("asset"));
  }

}

- (void)setSortKey:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember sortKey](self, "sortKey"));
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[BKCollectionMember willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sortKey"));
    -[BKCollectionMember setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("sortKey"));
    -[BKCollectionMember updateLastModification](self, "updateLastModification");
    -[BKCollectionMember didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sortKey"));
  }

}

- (void)setCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *collectionID;
  id v10;

  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));

  if (v4 != v10)
  {
    -[BKCollectionMember willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("collection"));
    -[BKCollectionMember setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v10, CFSTR("collection"));
    -[BKCollectionMember updateLastModification](self, "updateLastModification");
    -[BKCollectionMember didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("collection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionID"));
      v8 = (NSString *)objc_msgSend(v7, "copy");
      collectionID = self->_collectionID;
      self->_collectionID = v8;

    }
  }

}

- (NSString)collectionID
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *collectionID;

  if (!self->_collectionID)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionMember collection](self, "collection"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
      v6 = (NSString *)objc_msgSend(v5, "copy");
      collectionID = self->_collectionID;
      self->_collectionID = v6;

    }
  }
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)localModDate
{
  return self->_localModDate;
}

- (void)setLocalModDate:(id)a3
{
  objc_storeStrong((id *)&self->_localModDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localModDate, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end

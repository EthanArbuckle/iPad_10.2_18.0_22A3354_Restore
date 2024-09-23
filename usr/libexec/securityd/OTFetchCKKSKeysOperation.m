@implementation OTFetchCKKSKeysOperation

- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 refetchNeeded:(BOOL)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OTFetchCKKSKeysOperation;
  v7 = -[CKKSGroupOperation init](&v17, "init");
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ckks"));
    v9 = *(void **)(v7 + 174);
    *(_QWORD *)(v7 + 174) = v8;

    v10 = *(void **)(v7 + 182);
    *(_QWORD *)(v7 + 182) = 0;

    v11 = *(void **)(v7 + 134);
    *(_QWORD *)(v7 + 134) = &__NSArray0__struct;

    v12 = *(void **)(v7 + 150);
    *(_QWORD *)(v7 + 150) = &__NSArray0__struct;

    v13 = *(void **)(v7 + 142);
    *(_QWORD *)(v7 + 142) = &__NSArray0__struct;

    *(_QWORD *)(v7 + 166) = 15000000000;
    v7[128] = a4;
    v14 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v15 = *(void **)(v7 + 158);
    *(_QWORD *)(v7 + 158) = v14;

  }
  return (OTFetchCKKSKeysOperation *)v7;
}

- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 viewsToFetch:(id)a4
{
  id v7;
  OTFetchCKKSKeysOperation *v8;
  OTFetchCKKSKeysOperation *v9;

  v7 = a4;
  v8 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](self, "initWithDependencies:refetchNeeded:", a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)((char *)&v8->_ckks + 6), a4);

  return v9;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t v24[128];
  _BYTE buf[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchCKKSKeysOperation ckks](self, "ckks"));

  if (v4)
  {
    v5 = sub_10000EF14("octagon-ckks");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchCKKSKeysOperation ckks](self, "ckks"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for %@", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchCKKSKeysOperation ckks](self, "ckks"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "findKeySets:", -[OTFetchCKKSKeysOperation fetchBeforeGettingKeyset](self, "fetchBeforeGettingKeyset")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeout:", -[OTFetchCKKSKeysOperation desiredTimeout](self, "desiredTimeout")));
    objc_msgSend(v3, "addObject:", v10);

  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100046480;
  v21[3] = &unk_1002EA8C8;
  objc_copyWeak(&v23, (id *)buf);
  v11 = v3;
  v22 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("proceed-with-ckks-keys"), v21));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "addDependency:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), (_QWORD)v17);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v14);
  }

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v12);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

- (NSArray)viewKeySets
{
  return (NSArray *)objc_getProperty(self, a2, 134, 1);
}

- (void)setViewKeySets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (NSArray)incompleteKeySets
{
  return (NSArray *)objc_getProperty(self, a2, 142, 1);
}

- (void)setIncompleteKeySets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (NSArray)pendingTLKShares
{
  return (NSArray *)objc_getProperty(self, a2, 150, 1);
}

- (void)setPendingTLKShares:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (NSSet)zonesTimedOutWithoutKeysets
{
  return (NSSet *)objc_getProperty(self, a2, 158, 1);
}

- (void)setZonesTimedOutWithoutKeysets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (unint64_t)desiredTimeout
{
  return *(unint64_t *)((char *)&self->_zonesTimedOutWithoutKeysets + 6);
}

- (void)setDesiredTimeout:(unint64_t)a3
{
  *(NSSet **)((char *)&self->_zonesTimedOutWithoutKeysets + 6) = (NSSet *)a3;
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_getProperty(self, a2, 174, 1);
}

- (void)setCkks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (NSSet)viewFilter
{
  return (NSSet *)objc_getProperty(self, a2, 182, 1);
}

- (void)setViewFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 182);
}

- (BOOL)fetchBeforeGettingKeyset
{
  return self->_fetchBeforeGettingKeyset;
}

- (void)setFetchBeforeGettingKeyset:(BOOL)a3
{
  self->_fetchBeforeGettingKeyset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckks + 6), 0);
  objc_storeStrong((id *)((char *)&self->_desiredTimeout + 6), 0);
  objc_storeStrong((id *)((char *)&self->_pendingTLKShares + 6), 0);
  objc_storeStrong((id *)((char *)&self->_incompleteKeySets + 6), 0);
  objc_storeStrong((id *)((char *)&self->_viewKeySets + 6), 0);
  objc_storeStrong((id *)(&self->_fetchBeforeGettingKeyset + 6), 0);
}

@end

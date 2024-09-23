@implementation STUIDSCacheClearer

- (STUIDSCacheClearer)initWithClock:(id)a3 IDSLocalPrimitives:(id)a4 IDSAddressTranslator:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUIDSCacheClearer *v12;
  STUIDSCacheClearer *v13;
  STUIDSCacheClearerStateTable *v14;
  STUIDSCacheClearerStateTable *stateTable;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STUIDSCacheClearer;
  v12 = -[STUIDSCacheClearer init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clock, a3);
    objc_storeStrong((id *)&v13->_IDSLocalPrimitives, a4);
    objc_storeStrong((id *)&v13->_IDSAddressTranslator, a5);
    v14 = objc_opt_new(STUIDSCacheClearerStateTable);
    stateTable = v13->_stateTable;
    v13->_stateTable = v14;

  }
  return v13;
}

- (BOOL)errorIndicatesCacheNeedsToBeCleared:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSCacheClearer IDSLocalPrimitives](self, "IDSLocalPrimitives"));
  v6 = objc_msgSend(v5, "isRemoteUserNotRegisteredError:", v4);

  return v6;
}

- (void)clearCacheForInstructorAppleID:(id)a3 courseIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  STUIDSCacheClearer *v24;
  id v25;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v20 = NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUIDSCacheClearer.m"), 53, CFSTR("%@ must be called from the main thread"), v21);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSCacheClearer stateTable](self, "stateTable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entryForInstructorAppleID:courseIdentifier:", v9, v11));

  if (objc_msgSend(v13, "cacheClearInProgress"))
  {
    v14 = 47;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastCacheClearFinishDate"));
    v16 = -[STUIDSCacheClearer isDateWithinLast24Hours:](self, "isDateWithinLast24Hours:", v15);

    if (!v16)
    {
      objc_msgSend(v13, "setCacheClearInProgress:", 1);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000071E8;
      v22[3] = &unk_1000C9838;
      v23 = v13;
      v24 = self;
      v25 = v10;
      -[STUIDSCacheClearer actuallyClearCacheForInstructorAppleID:completion:](self, "actuallyClearCacheForInstructorAppleID:completion:", v9, v22);

      goto LABEL_9;
    }
    v14 = 3;
  }
  v17 = CRKErrorWithCodeAndUserInfo(v14, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  (*((void (**)(id, void *))v10 + 2))(v10, v18);

LABEL_9:
}

- (BOOL)isDateWithinLast24Hours:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSCacheClearer clock](self, "clock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDate"));

  objc_msgSend(v6, "timeIntervalSinceDate:", v4);
  v8 = v7;

  v9 = v8 < 86400.0;
  return v9;
}

- (void)actuallyClearCacheForInstructorAppleID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  void *v19;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSCacheClearer IDSAddressTranslator](self, "IDSAddressTranslator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationAddressForAppleID:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSCacheClearer IDSLocalPrimitives](self, "IDSLocalPrimitives"));
  v19 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007440;
  v15[3] = &unk_1000C9860;
  v15[4] = self;
  v16 = v10;
  v17 = v7;
  v18 = a2;
  v13 = v7;
  v14 = v10;
  objc_msgSend(v11, "forceRefreshIDStatusForDestinations:completion:", v12, v15);

}

- (STUDateProviderProtocol)clock
{
  return self->_clock;
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (CRKIDSAddressTranslator)IDSAddressTranslator
{
  return self->_IDSAddressTranslator;
}

- (STUIDSCacheClearerStateTable)stateTable
{
  return self->_stateTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_IDSAddressTranslator, 0);
  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end

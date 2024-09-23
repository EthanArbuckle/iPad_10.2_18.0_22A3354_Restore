@implementation STUOldEventPruningStore

- (STUOldEventPruningStore)initWithUnderlyingStore:(id)a3 dateProvider:(id)a4 maximumEventAge:(double)a5
{
  id v10;
  id v11;
  void *v12;
  STUOldEventPruningStore *v13;
  STUOldEventPruningStore *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOldEventPruningStore.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("underlyingStore"));

    if (v12)
      goto LABEL_3;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOldEventPruningStore.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateProvider"));

LABEL_3:
  if (a5 <= 0.0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUOldEventPruningStore.m"), 24, CFSTR("Maximum event age is nonpositive: %@"), v19);

  }
  v20.receiver = self;
  v20.super_class = (Class)STUOldEventPruningStore;
  v13 = -[STUOldEventPruningStore init](&v20, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_underlyingStore, a3);
    objc_storeStrong((id *)&v14->_dateProvider, a4);
    v14->_maximumEventAge = a5;
  }

  return v14;
}

- (id)earliestAllowedDate
{
  void *v3;
  void *v4;
  double v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOldEventPruningStore dateProvider](self, "dateProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentDate"));
  -[STUOldEventPruningStore maximumEventAge](self, "maximumEventAge");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -v5));

  return v6;
}

- (void)pruneOldEvents
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUOldEventPruningStore earliestAllowedDate](self, "earliestAllowedDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUOldEventPruningStore underlyingStore](self, "underlyingStore"));
  v8 = 0;
  v5 = objc_msgSend(v4, "purgeEventsBeforeDate:error:", v3, &v8);
  v6 = v8;

  if ((v5 & 1) == 0)
  {
    if (qword_1000FC0F8 != -1)
      dispatch_once(&qword_1000FC0F8, &stru_1000C9CE0);
    v7 = (void *)qword_1000FC0F0;
    if (os_log_type_enabled((os_log_t)qword_1000FC0F0, OS_LOG_TYPE_ERROR))
      sub_10007AA60((uint64_t)v3, v7, v6);
  }

}

- (BOOL)storeEvent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUOldEventPruningStore underlyingStore](self, "underlyingStore"));
  v8 = objc_msgSend(v7, "storeEvent:error:", v6, a4);

  if (v8)
    -[STUOldEventPruningStore pruneOldEvents](self, "pruneOldEvents");
  return v8;
}

- (id)eventLogWithStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUOldEventPruningStore underlyingStore](self, "underlyingStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventLogWithStartDate:endDate:error:", v9, v8, a5));

  return v11;
}

- (BOOL)purgeEventsBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUOldEventPruningStore underlyingStore](self, "underlyingStore"));
  LOBYTE(a4) = objc_msgSend(v7, "purgeEventsBeforeDate:error:", v6, a4);

  return (char)a4;
}

- (STUEventStoreProtocol)underlyingStore
{
  return self->_underlyingStore;
}

- (STUDateProviderProtocol)dateProvider
{
  return self->_dateProvider;
}

- (double)maximumEventAge
{
  return self->_maximumEventAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_underlyingStore, 0);
}

@end

@implementation KCSharingIncomingRow

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_1000119B8((uint64_t)CFSTR("sharingIncomingQueue"), &qword_100341280, (uint64_t)&unk_100341278);
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_1003412B0 != -1)
    dispatch_once(&qword_1003412B0, &stru_1002E7820);
  return (NSSet *)(id)qword_1003412A8;
}

- (KCSharingIncomingRow)initWithIncomingDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingIncomingRow *v6;
  id v7;
  const __CFSet *v8;
  const __CFDictionary *v9;
  void *v10;
  KCSharingIncomingRow *v11;
  KCSharingIncomingRow *v12;

  v6 = self;
  v7 = objc_msgSend((id)objc_opt_class(self), "requiredAttributeKeys");
  v8 = (const __CFSet *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10000A15C(a3, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v6 = -[KCSharingIncomingRow initWithAttributes:error:](v6, "initWithAttributes:error:", v10, a4);
    v11 = v6;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (KCSharingIncomingRow)initWithAttributes:(id)a3 error:(id *)a4
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, 0, 0));
  objc_exception_throw(v5);
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, 0, 0));
  objc_exception_throw(v5);
}

@end

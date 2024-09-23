@implementation KCSharingOutgoingRow

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_1000119B8((uint64_t)CFSTR("sharingOutgoingQueue"), &qword_1003412A0, (uint64_t)&unk_100341298);
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_100341468 != -1)
    dispatch_once(&qword_100341468, &stru_1002E98E8);
  return (NSSet *)(id)qword_100341460;
}

- (KCSharingOutgoingRow)initWithOutgoingDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  KCSharingOutgoingRow *v6;
  id v7;
  const __CFSet *v8;
  const __CFDictionary *v9;
  void *v10;
  KCSharingOutgoingRow *v11;
  KCSharingOutgoingRow *v12;

  v6 = self;
  v7 = objc_msgSend((id)objc_opt_class(self), "requiredAttributeKeys");
  v8 = (const __CFSet *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10000A15C(a3, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v6 = -[KCSharingOutgoingRow initWithAttributes:error:](v6, "initWithAttributes:error:", v10, a4);
    v11 = v6;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (KCSharingOutgoingRow)initWithAttributes:(id)a3 error:(id *)a4
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

@implementation KTVerifierResult

- (unint64_t)optInTernaryState
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(self, CFSTR("optInKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return (unint64_t)v4;
}

- (void)setOptInTernaryState:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_setAssociatedObject(self, CFSTR("optInKey"), v4, (void *)1);

}

- (BOOL)sentToIDS
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, CFSTR("sentToIdsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setSentToIDS:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, CFSTR("sentToIdsKey"), v4, (void *)1);

}

+ (id)resultsForUris:(id)a3 application:(id)a4 failure:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v17 = objc_alloc((Class)KTVerifierResult);
        v18 = objc_msgSend(v17, "initWithUri:application:failure:", v16, v8, v9, (_QWORD)v20);
        objc_msgSend(v10, "addObject:", v18);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v10;
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 transparentData:(id)a5
{
  return -[KTVerifierResult initWithUri:application:ktResult:transparentData:loggableDatas:](self, "initWithUri:application:ktResult:transparentData:loggableDatas:", a3, a4, 2, a5, 0);
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 transparentData:(id)a6 loggableDatas:(id)a7
{
  id v12;
  id v13;
  KTVerifierResult *v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = a6;
  v13 = a7;
  v14 = -[KTVerifierResult initWithUri:application:ktResult:](self, "initWithUri:application:ktResult:", a3, a4, a5);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentPublicID"));
    -[KTVerifierResult setPublicID:](v14, "setPublicID:", v15);

    -[KTVerifierResult setStaticAccountKeyEnforced:](v14, "setStaticAccountKeyEnforced:", objc_msgSend(v12, "staticKeyEnforced"));
    -[KTVerifierResult setStaticAccountKeyStatus:](v14, "setStaticAccountKeyStatus:", objc_msgSend(v12, "staticKeyStatus"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentPublicID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "publicKeyInfo"));

    -[KTVerifierResult setEverOptedIn:](v14, "setEverOptedIn:", objc_msgSend(v12, "accountEverOptedIn:", v17) == (id)1);
    -[KTVerifierResult setRecentlyOptedIn:](v14, "setRecentlyOptedIn:", objc_msgSend(v12, "accountRecentlyOptedIn:", v17) == (id)1);
    -[KTVerifierResult setOptedIn:](v14, "setOptedIn:", objc_msgSend(v12, "currentAccountOptInState") == (id)1);
    -[KTVerifierResult setOptInTernaryState:](v14, "setOptInTernaryState:", objc_msgSend(v12, "currentAccountOptInState"));
    -[KTVerifierResult setLoggableDatas:](v14, "setLoggableDatas:", v13);

  }
  return v14;
}

@end

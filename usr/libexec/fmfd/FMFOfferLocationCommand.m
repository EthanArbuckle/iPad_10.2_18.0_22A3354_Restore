@implementation FMFOfferLocationCommand

- (FMFOfferLocationCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  FMFOfferLocationCommand *v13;
  FMFOfferLocationCommand *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMFOfferLocationCommand;
  v13 = -[FMFBaseCmd initWithClientSession:](&v16, "initWithClientSession:", a3);
  v14 = v13;
  if (v10 && v13)
  {
    -[FMFOfferLocationCommand setHandles:](v13, "setHandles:", v10);
    -[FMFOfferLocationCommand setExpiresDate:](v14, "setExpiresDate:", v12);
    -[FMFBaseCmd setGroupId:](v14, "setGroupId:", v11);
  }
  else
  {
    -[FMFBaseCmd initFailed](v13, "initFailed");

    v14 = 0;
  }

  return v14;
}

- (id)pathSuffix
{
  return CFSTR("offerLocation");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FMFOfferLocationCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v18, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand expiresDate](self, "expiresDate"));

  if (!v5)
  {
    v8 = &off_1000A0F60;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand expiresDate](self, "expiresDate"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 * 1000.0));

  if (v8)
  {
LABEL_5:
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("expires"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd groupId](self, "groupId"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd groupId](self, "groupId"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("groupId"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand serverIds](self, "serverIds"));
  v12 = objc_msgSend(v11, "count");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand handles](self, "handles"));
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("friendIds"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand idsValidatedHandlesStatus](self, "idsValidatedHandlesStatus"));
  if (v16)
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("idsValidatedHandles"));

  return v4;
}

- (id)idsValidatedHandlesStatus
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand handles](self, "handles", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "qualifiedIdentifier"));
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v9, "setIdsStatus:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "idsStatus")));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "qualifiedIdentifier"));
          objc_msgSend(v3, "setObject:forKey:", v12, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)handleIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("qualifiedIdentifier")));

  return v3;
}

- (id)serverIds
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("serverId")));

  return v3;
}

- (void)processCommandResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FMFOfferLocationCommand;
  -[FMFBaseCmd processCommandResponse:](&v11, "processCommandResponse:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFOfferLocationCommand error](self, "error"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd requestTokensStatusMap](self, "requestTokensStatusMap"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000386D8;
    v9[3] = &unk_100099DC0;
    v7 = v5;
    v10 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 204, v7));
      -[FMFOfferLocationCommand setError:](self, "setError:", v8);

    }
  }
}

- (BOOL)isUserAction
{
  return 1;
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)expiresDate
{
  return self->_expiresDate;
}

- (void)setExpiresDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiresDate, 0);
  objc_storeStrong((id *)&self->_handles, 0);
}

@end

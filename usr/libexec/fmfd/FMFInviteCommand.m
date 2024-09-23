@implementation FMFInviteCommand

- (FMFInviteCommand)initWithClientSession:(id)a3 handles:(id)a4 groupId:(id)a5 expiresDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  FMFInviteCommand *v13;
  FMFInviteCommand *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMFInviteCommand;
  v13 = -[FMFBaseCmd initWithClientSession:](&v16, "initWithClientSession:", a3);
  v14 = v13;
  if (v10 && v13)
  {
    -[FMFInviteCommand setHandles:](v13, "setHandles:", v10);
    -[FMFBaseCmd setGroupId:](v14, "setGroupId:", v11);
    -[FMFInviteCommand setExpiresDate:](v14, "setExpiresDate:", v12);
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
  return CFSTR("invite");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _UNKNOWN **v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FMFInviteCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v15, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFInviteCommand handleIdentifiers](self, "handleIdentifiers"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("emails"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFInviteCommand friendIds](self, "friendIds"));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("ids"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd groupId](self, "groupId"));
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("groupId"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFInviteCommand expiresDate](self, "expiresDate"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFInviteCommand expiresDate](self, "expiresDate"));
    objc_msgSend(v11, "timeIntervalSince1970");
    v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 * 1000.0));

  }
  else
  {
    v13 = &off_1000A0FA8;
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("expires"));

  return v4;
}

- (BOOL)isUserAction
{
  return 1;
}

- (id)handleIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFInviteCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("identifier")));

  return v3;
}

- (id)friendIds
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFInviteCommand handles](self, "handles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("serverId")));

  return v3;
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSDate)expiresDate
{
  return self->_expiresDate;
}

- (void)setExpiresDate:(id)a3
{
  objc_storeStrong((id *)&self->_expiresDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiresDate, 0);
  objc_storeStrong((id *)&self->_handles, 0);
}

@end

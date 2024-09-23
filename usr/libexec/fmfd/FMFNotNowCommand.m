@implementation FMFNotNowCommand

- (FMFNotNowCommand)initWithClientSession:(id)a3 handles:(id)a4
{
  id v6;
  FMFNotNowCommand *v7;
  FMFNotNowCommand *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFNotNowCommand;
  v7 = -[FMFBaseCmd initWithClientSession:](&v10, "initWithClientSession:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    -[FMFNotNowCommand setHandles:](v7, "setHandles:", v6);
  }
  else
  {
    -[FMFBaseCmd initFailed](v7, "initFailed");

    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return CFSTR("notNow");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFNotNowCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v9, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFNotNowCommand friendIds](self, "friendIds"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("id"));

  }
  return v4;
}

- (BOOL)isUserAction
{
  return 1;
}

- (id)friendIds
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFNotNowCommand handles](self, "handles"));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
}

@end

@implementation FMFInitCommand

- (void)sendRequest
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FMFInitCommand;
  -[FMFInitCommand sendRequest](&v2, "sendRequest");
}

- (id)pathSuffix
{
  return CFSTR("initClient");
}

- (id)jsonBodyDictionary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FMFInitCommand;
  v2 = -[FMFBaseCmd jsonBodyDictionary](&v11, "jsonBodyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dsid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLoggedInPrsId"));

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9 && (objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("lastLoggedInPrsid"));

  return v3;
}

- (void)processCommandResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFInitCommand;
  -[FMFBaseCmd processCommandResponse:](&v8, "processCommandResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fetchStatus")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v5 == v6)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fetchStatus")));

  -[FMFInitCommand setFetchStatus:](self, "setFetchStatus:", objc_msgSend(v7, "integerValue"));
}

- (BOOL)allowsEmptyResponse
{
  return 0;
}

- (BOOL)shouldIncludeDataContext
{
  return 0;
}

- (BOOL)shouldIncludeServerContext
{
  return 0;
}

- (id)tapContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cachedTapMessages"));

  return v3;
}

- (int64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(int64_t)a3
{
  self->_fetchStatus = a3;
}

@end

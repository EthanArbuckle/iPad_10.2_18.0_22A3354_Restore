@implementation STUPermanentTokenAuthenticator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000218E0;
  block[3] = &unk_1000C9FE0;
  block[4] = a1;
  if (qword_1000FC1A0 != -1)
    dispatch_once(&qword_1000FC1A0, block);
  return (id)qword_1000FC1A8;
}

- (STUPermanentTokenAuthenticator)init
{
  STUPermanentTokenAuthenticator *v2;
  NSMutableSet *v3;
  NSMutableSet *mAuthenticatedTokens;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUPermanentTokenAuthenticator;
  v2 = -[STUPermanentTokenAuthenticator init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    mAuthenticatedTokens = v2->mAuthenticatedTokens;
    v2->mAuthenticatedTokens = v3;

  }
  return v2;
}

- (BOOL)isTokenAuthenticated:(id)a3
{
  id v5;
  unsigned __int8 v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPermanentTokenAuthenticator.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

  }
  v6 = -[NSMutableSet containsObject:](self->mAuthenticatedTokens, "containsObject:", v5);

  return v6;
}

- (void)authenticateToken:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPermanentTokenAuthenticator.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->mAuthenticatedTokens, "addObject:", v5);

}

- (void)deauthenticateToken:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPermanentTokenAuthenticator.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token"));

    v5 = 0;
  }
  -[NSMutableSet removeObject:](self->mAuthenticatedTokens, "removeObject:", v5);

}

- (id)authenticatedTokens
{
  return -[NSMutableSet copy](self->mAuthenticatedTokens, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAuthenticatedTokens, 0);
}

@end

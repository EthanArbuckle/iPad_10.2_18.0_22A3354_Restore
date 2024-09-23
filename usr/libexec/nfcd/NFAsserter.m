@implementation NFAsserter

- (NFAsserter)initWithRemoteAssertion:(id)a3
{
  id v5;
  NFAsserter *v6;
  NFAsserter *v7;
  NFAsserter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFAsserter;
  v6 = -[NFAsserter init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteAssertion, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEntitled:(id)a3
{
  return 0;
}

- (BOOL)isSupported
{
  return 1;
}

- (void)onAssertWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSErrorUserInfoKey v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)NSError);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v10 = NSLocalizedDescriptionKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v9 = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 14, v8);
  (*((void (**)(id, id))a3 + 2))(v4, v9);

}

- (void)onDeassertWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSErrorUserInfoKey v10;
  void *v11;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc((Class)NSError);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v10 = NSLocalizedDescriptionKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v9 = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 14, v8);
    (*((void (**)(id, id))a3 + 2))(v4, v9);

  }
}

- (BOOL)isEqual:(id)a3
{
  NFAsserter *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;

  v4 = (NFAsserter *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](v4, "remoteAssertion"));
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v9 = objc_opt_class(NFAssertionInternal);
      if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
      v8 = objc_msgSend(v6, "isEqual:", v4);
    }

  }
LABEL_9:

  return v8;
}

- (BOOL)isEqualType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
  v6 = objc_msgSend(v5, "assertionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteAssertion"));

  LOBYTE(v4) = v6 == objc_msgSend(v7, "assertionType");
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NFAsserter remoteAssertion](self, "remoteAssertion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return (NSString *)v3;
}

- (NFAssertionInternal)remoteAssertion
{
  return self->_remoteAssertion;
}

- (void)setRemoteAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAssertion, 0);
}

@end

@implementation MapsToken

- (MapsToken)initWithDelegate:(id)a3 tokenGroupName:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsToken *v11;
  uint64_t v12;
  NSUUID *identifier;
  NSString *v14;
  NSString *tokenGroupName;
  NSDictionary *v16;
  NSDictionary *userInfo;
  double v18;
  id WeakRetained;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MapsToken;
  v11 = -[MapsToken init](&v21, "init");
  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    tokenGroupName = v11->_tokenGroupName;
    v11->_tokenGroupName = v14;

    v16 = (NSDictionary *)objc_msgSend(v10, "copy");
    userInfo = v11->_userInfo;
    v11->_userInfo = v16;

    objc_storeWeak((id *)&v11->_delegate, v8);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v11->_createdTimestamp = v18;
    WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
    objc_msgSend(WeakRetained, "incrementForToken:", v11);

  }
  return v11;
}

- (MapsToken)initWithDelegate:(id)a3 tokenGroupName:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MapsToken *v12;
  const __CFString *v14;
  id v15;

  v14 = CFSTR("reason");
  v15 = a5;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  v12 = -[MapsToken initWithDelegate:tokenGroupName:userInfo:](self, "initWithDelegate:tokenGroupName:userInfo:", v10, v9, v11);
  return v12;
}

- (id)tombstone
{
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v3 = objc_alloc_init((Class)objc_opt_class(self));
  v4 = -[NSUUID copy](self->_identifier, "copy");
  v5 = (void *)v3[1];
  v3[1] = v4;

  v6 = -[NSString copy](self->_tokenGroupName, "copy");
  v7 = (void *)v3[3];
  v3[3] = v6;

  v8 = -[NSDictionary copy](self->_userInfo, "copy");
  v9 = (void *)v3[4];
  v3[4] = v8;

  return v3;
}

- (void)dealloc
{
  MapsTokenDelegate **p_delegate;
  id WeakRetained;
  id v5;
  void *v6;
  objc_super v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsToken tombstone](self, "tombstone"));
    objc_msgSend(v5, "decrementForToken:", v6);

    objc_storeWeak((id *)p_delegate, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)MapsToken;
  -[MapsToken dealloc](&v7, "dealloc");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsToken;
  v3 = -[MapsToken description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsToken tokenGroupName](self, "tokenGroupName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsToken userInfo](self, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <tokenGroupName: %@, userInfo: %@>"), v4, v5, v6));

  return v7;
}

- (NSString)reason
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsToken userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("reason")));

  if (v3)
  {
    v4 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    {
      v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v3));

      v3 = (void *)v5;
    }
  }
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  unsigned __int8 v5;

  v4 = (id *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    v5 = objc_msgSend(v4[1], "isEqual:", self->_identifier);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_identifier, "hash");
}

- (MapsTokenDelegate)delegate
{
  return (MapsTokenDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)tokenGroupName
{
  return self->_tokenGroupName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (double)createdTimestamp
{
  return self->_createdTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_tokenGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

@implementation VSScriptSecurityOrigin

- (NSString)scheme
{
  __CFString *v2;

  v2 = self->_scheme;
  if (!v2)
    v2 = &stru_24FE1B848;
  return (NSString *)v2;
}

- (NSString)host
{
  __CFString *v2;

  v2 = self->_host;
  if (!v2)
    v2 = &stru_24FE1B848;
  return (NSString *)v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)VSScriptSecurityOrigin;
  -[VSScriptSecurityOrigin description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin scheme](self, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptSecurityOrigin host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[VSScriptSecurityOrigin port](self, "port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@://%@:%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[VSScriptSecurityOrigin scheme](self, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VSScriptSecurityOrigin host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6 ^ -[VSScriptSecurityOrigin port](self, "port");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  BOOL v18;
  int64_t v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x24BDBCE88];
        v8 = *MEMORY[0x24BDBCAB8];
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, object was %@, instead of VSScriptSecurityOrigin."), v10);

      }
      v11 = v6;
      -[VSScriptSecurityOrigin scheme](self, "scheme");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:options:", v13, 1);
      -[VSScriptSecurityOrigin host](self, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "host");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        LOBYTE(v17) = 0;
      else
        v17 = objc_msgSend(v15, "compare:options:", v16, 1) == 0;
      v19 = -[VSScriptSecurityOrigin port](self, "port");
      v18 = v19 == objc_msgSend(v11, "port") && v17;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)setScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
}

@end

@implementation TCDialRequest

- (TCDialRequest)initWithURL:(id)a3
{
  id v4;
  TCDialRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TCDialRequest;
  v5 = -[TUDialRequest initWithURL:](&v18, sel_initWithURL_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name=%@"), CFSTR("sessionState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TCDialRequest setState:](v5, "setState:", TCSessionStateFromString(v11));

    }
    else
    {
      -[TCDialRequest setState:](v5, "setState:", 0);
    }
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("name=%@"), CFSTR("remoteUplinkMuted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCDialRequest setRemoteUplinkMuted:](v5, "setRemoteUplinkMuted:", objc_msgSend(v16, "isEqualToString:", CFSTR("YES")));

  }
  return v5;
}

- (id)URL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TCDialRequest;
  -[TUDialRequest URL](&v16, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TCDialRequest state](self, "state"))
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "queryItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v8 = (void *)MEMORY[0x24BDD1838];
    NSStringFromTCSessionState(-[TCDialRequest state](self, "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryItemWithName:value:", CFSTR("sessionState"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v10);
    v11 = (void *)MEMORY[0x24BDD1838];
    if (-[TCDialRequest isRemoteUplinkMuted](self, "isRemoteUplinkMuted"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    objc_msgSend(v11, "queryItemWithName:value:", CFSTR("remoteUplinkMuted"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);
    objc_msgSend(v4, "setQueryItems:", v7);
    objc_msgSend(v4, "URL");
    v14 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v14;
  }
  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  self->_remoteUplinkMuted = a3;
}

@end

@implementation REElementOpenAction

- (REElementOpenAction)init
{
  return -[REElementOpenAction initWithURL:applicationID:](self, "initWithURL:applicationID:", 0, 0);
}

- (REElementOpenAction)initWithURL:(id)a3 applicationID:(id)a4
{
  id v7;
  id v8;
  REElementOpenAction *v9;
  REElementOpenAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REElementOpenAction;
  v9 = -[REElementOpenAction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_applicationID, a4);
  }

  return v10;
}

- (REElementOpenAction)initWithCoder:(id)a3
{
  id v4;
  REElementOpenAction *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *applicationID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REElementOpenAction;
  v5 = -[REElementAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("applicationID"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationID = v5->_applicationID;
    v5->_applicationID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REElementOpenAction;
  v4 = a3;
  -[REElementAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationID, CFSTR("applicationID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REElementOpenAction;
  v4 = (id *)-[REElementOpenAction copy](&v6, sel_copy, a3);
  objc_storeStrong(v4 + 3, self->_url);
  objc_storeStrong(v4 + 4, self->_applicationID);
  return v4;
}

- (void)_performWithContext:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[REElementOpenAction url](self, "url", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[REElementOpenAction applicationID](self, "applicationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[REElementOpenAction url](self, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REElementOpenAction applicationID](self, "applicationID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __43__REElementOpenAction__performWithContext___block_invoke;
      v9[3] = &unk_24CF8B160;
      v9[4] = self;
      RELaunchApp(v7, v8, v9);

    }
  }
}

uint64_t __43__REElementOpenAction__performWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinish:", a2 == 0);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REElementOpenAction;
  -[REElementOpenAction description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" url=%@, applicationId=%@"), self->_url, self->_applicationID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_url, "hash");
  return -[NSString hash](self->_applicationID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  NSURL *url;
  NSURL *v7;
  NSURL *v8;
  NSURL *v9;
  int v10;
  char v11;
  NSString *applicationID;
  NSString *v13;
  NSString *v14;
  NSString *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    url = self->_url;
    v7 = (NSURL *)v5[3];
    if (url == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = url;
      v10 = -[NSURL isEqual:](v9, "isEqual:", v8);

      if (!v10)
      {
        v11 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    applicationID = self->_applicationID;
    v13 = (NSString *)v5[4];
    v14 = applicationID;
    v15 = v14;
    if (v14 == v13)
      v11 = 1;
    else
      v11 = -[NSString isEqual:](v14, "isEqual:", v13);

    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end

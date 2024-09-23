@implementation SWDatastoreFactory

- (SWDatastoreFactory)initWithLogger:(id)a3
{
  id v5;
  SWDatastoreFactory *v6;
  SWDatastoreFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWDatastoreFactory;
  v6 = -[SWDatastoreFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logger, a3);

  return v7;
}

- (id)createDatastoreFromMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SWDatastore *v18;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("datastore"));

  if (v6)
  {
    objc_msgSend(v4, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("datastore");
  }
  else
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("localDatastore"));

    if (!v11)
    {
      v13 = CFSTR("{}");
      goto LABEL_11;
    }
    objc_msgSend(v4, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("localDatastore");
  }
  objc_msgSend(v7, "objectForKey:", v9);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[__CFString length](v12, "length"))
  {
    v12 = v12;
    v13 = v12;
  }
  else
  {
    v13 = CFSTR("{}");
  }

LABEL_11:
  -[SWDatastoreFactory logger](self, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Converted message %@ into datastore: %@"), v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "log:", v17);

  v18 = -[SWDatastore initWithJSONString:]([SWDatastore alloc], "initWithJSONString:", v13);
  return v18;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end

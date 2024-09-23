@implementation SWLocation

- (SWLocation)initWithContext:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  SWLocation *v8;
  uint64_t v9;
  NSString *context;
  uint64_t v11;
  NSURL *URL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SWLocation;
  v8 = -[SWLocation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    context = v8->_context;
    v8->_context = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    URL = v8->_URL;
    v8->_URL = (NSURL *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SWLocation initWithContext:URL:]([SWLocation alloc], "initWithContext:URL:", self->_context, self->_URL);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *context;
  void *v6;
  NSURL *URL;
  NSURL *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_255025C18))
  {
    context = self->_context;
    objc_msgSend(v4, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(context, "isEqualToString:", v6))
    {
      URL = self->_URL;
      v8 = URL;
      if (!URL)
      {
        objc_msgSend(v4, "URL");
        context = (void *)objc_claimAutoreleasedReturnValue();
        if (!context)
        {
          v10 = 1;
LABEL_11:

          goto LABEL_12;
        }
        v8 = self->_URL;
      }
      objc_msgSend(v4, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSURL isEqual:](v8, "isEqual:", v9);

      if (!URL)
        goto LABEL_11;
    }
    else
    {
      v10 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (NSString)context
{
  return self->_context;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

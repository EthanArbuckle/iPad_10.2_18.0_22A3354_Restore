@implementation UIOpenURLContext

- (UIOpenURLContext)initWithURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  UIOpenURLContext *v8;
  uint64_t v9;
  NSURL *URL;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIOpenURLContext;
  v8 = -[UIOpenURLContext init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    URL = v8->_URL;
    v8->_URL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  UIOpenURLContext *v4;
  UIOpenURLContext *v5;
  UIOpenURLContext *v6;
  void *v7;
  unint64_t v8;
  NSURL *URL;
  UISceneOpenURLOptions *options;
  char v11;

  v4 = (UIOpenURLContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
    goto LABEL_13;
  }
  v6 = v4;
  v7 = (void *)objc_opt_class();
  if (!objc_msgSend(v7, "isEqual:", objc_opt_class()))
    goto LABEL_10;
  v8 = -[UIOpenURLContext hash](self, "hash");
  if (v8 != -[UIOpenURLContext hash](v6, "hash"))
    goto LABEL_10;
  URL = self->_URL;
  if (URL != v6->_URL && (!URL || !-[NSURL isEqual:](URL, "isEqual:")))
    goto LABEL_10;
  options = self->_options;
  if (options == v6->_options)
  {
    v11 = 1;
    goto LABEL_11;
  }
  if (options)
    v11 = -[UISceneOpenURLOptions isEqual:](options, "isEqual:");
  else
LABEL_10:
    v11 = 0;
LABEL_11:

LABEL_13:
  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_URL, "hash");
  return -[UISceneOpenURLOptions hash](self->_options, "hash") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; URL: %@; options: %@>"),
               objc_opt_class(),
               self,
               self->_URL,
               self->_options);
}

- (NSDictionary)URLOptionsDictionary
{
  void *v2;
  void *v3;

  -[UIOpenURLContext options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryFromUISceneOpenURLOptions(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (UISceneOpenURLOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (NSDictionary)optionsDictionary
{
  void *v2;
  void *v3;

  -[UIOpenURLContext options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _dictionaryFromUISceneOpenURLOptions(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

@end

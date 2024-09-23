@implementation TUIBindings

- (TUIBindings)initWithData:(id)a3
{
  id v5;
  TUIBindings *v6;
  TUIBindings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIBindings;
  v6 = -[TUIBindings init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_data, "objectForKey:", v4));
  else
    v5 = 0;

  return v5;
}

- (TUIBindings)parent
{
  return self->_parent;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end

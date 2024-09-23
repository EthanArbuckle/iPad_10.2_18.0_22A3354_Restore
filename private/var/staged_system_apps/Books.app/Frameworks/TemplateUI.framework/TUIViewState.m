@implementation TUIViewState

- (TUIViewState)init
{
  return -[TUIViewState initWithDictionary:](self, "initWithDictionary:", 0);
}

- (TUIViewState)initWithDictionary:(id)a3
{
  id v5;
  TUIViewState *v6;
  TUIViewState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIViewState;
  v6 = -[TUIViewState init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewStatesByIdentifier, a3);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TUIMutableViewState *v4;
  void *v5;
  id v6;
  TUIMutableViewState *v7;

  v4 = [TUIMutableViewState alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIViewState viewStatesByIdentifier](self, "viewStatesByIdentifier"));
  v6 = objc_msgSend(v5, "mutableCopy");
  v7 = -[TUIViewState initWithDictionary:](v4, "initWithDictionary:", v6);

  return v7;
}

- (id)viewStateForIdentifier:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_viewStatesByIdentifier, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (NSDictionary)viewStatesByIdentifier
{
  return self->_viewStatesByIdentifier;
}

- (void)setViewStatesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_viewStatesByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewStatesByIdentifier, 0);
}

@end

@implementation TUIMutableViewState

- (TUIMutableViewState)init
{
  NSMutableDictionary *v3;
  TUIMutableViewState *v4;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = -[TUIViewState initWithDictionary:](self, "initWithDictionary:", v3);

  return v4;
}

- (void)setViewState:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIViewState viewStatesByIdentifier](self, "viewStatesByIdentifier"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUIViewState *v4;
  void *v5;
  id v6;
  TUIViewState *v7;

  v4 = [TUIViewState alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIViewState viewStatesByIdentifier](self, "viewStatesByIdentifier"));
  v6 = objc_msgSend(v5, "copy");
  v7 = -[TUIViewState initWithDictionary:](v4, "initWithDictionary:", v6);

  return v7;
}

@end

@implementation TUIDynamicRegistry

- (TUIDynamicRegistry)init
{
  TUIDynamicRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *stateProviders;
  NSMutableDictionary *v5;
  NSMutableDictionary *progressProviders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIDynamicRegistry;
  v2 = -[TUIDynamicRegistry init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    stateProviders = v2->_stateProviders;
    v2->_stateProviders = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    progressProviders = v2->_progressProviders;
    v2->_progressProviders = v5;

  }
  return v2;
}

- (void)registerStateProvider:(id)a3 forKind:(id)a4
{
  if (a4)
    -[NSMutableDictionary setObject:forKey:](self->_stateProviders, "setObject:forKey:", a3);
}

- (void)unregisterStateProviderForKind:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_stateProviders, "removeObjectForKey:");
}

- (id)stateProviderForKind:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_stateProviders, "objectForKey:"));
  else
    return 0;
}

- (void)registerProgressProvider:(id)a3 forKind:(id)a4
{
  if (a4)
    -[NSMutableDictionary setObject:forKey:](self->_progressProviders, "setObject:forKey:", a3);
}

- (id)progressProviderForKind:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_progressProviders, "objectForKey:"));
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProviders, 0);
  objc_storeStrong((id *)&self->_stateProviders, 0);
}

@end

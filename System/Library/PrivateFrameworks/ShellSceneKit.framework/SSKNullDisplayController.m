@implementation SSKNullDisplayController

- (SSKNullDisplayController)init
{
  SSKNullDisplayController *v2;
  uint64_t v3;
  NSMutableDictionary *connectedDisplays;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSKNullDisplayController;
  v2 = -[SSKNullDisplayController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    connectedDisplays = v2->_connectedDisplays;
    v2->_connectedDisplays = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7
{
  id v10;
  id v11;
  id v12;
  SSKDisplayAssertionPreferences *v13;

  v10 = a7;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(SSKDisplayAssertionPreferences);
  -[SSKDisplayAssertionPreferences setWantsControlOfDisplay:](v13, "setWantsControlOfDisplay:", 1);
  objc_msgSend(v10, "updateWithPreferences:", v13);

  -[NSMutableDictionary setObject:forKey:](self->_connectedDisplays, "setObject:forKey:", v11, v12);
}

- (void)displayIdentityDidDisconnect:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_connectedDisplays, "removeObjectForKey:", a3);
}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_connectedDisplays, "setObject:forKey:", a4, a3);
}

- (BOOL)isConnectedToDisplay:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_connectedDisplays, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)displayConfigurationForIdentity:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_connectedDisplays, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedDisplays, 0);
}

@end

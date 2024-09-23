@implementation _REEngineDefaults

+ (id)defaultsForEngine:(id)a3
{
  return (id)objc_msgSend(a3, "defaults");
}

+ (id)globalDefaults
{
  if (globalDefaults_onceToken != -1)
    dispatch_once(&globalDefaults_onceToken, &__block_literal_global_41);
  return (id)globalDefaults_GlobalDefaults;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_registeredPaths;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        -[NSUserDefaults removeObserver:forKeyPath:context:](self->_defaults, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), REPreferenceContext);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)_REEngineDefaults;
  -[_REEngineDefaults dealloc](&v7, sel_dealloc);
}

- (BOOL)_BOOLValueForKey:(id)a3 set:(BOOL *)a4
{
  uint64_t v5;
  void *v6;
  char v7;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4)
    *a4 = v5 != 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (int64_t)_NSIntegerValueForKey:(id)a3 set:(BOOL *)a4
{
  uint64_t v5;
  void *v6;
  int64_t v7;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4)
    *a4 = v5 != 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0;

  return v7;
}

- (id)_idValueForKey:(id)a3 set:(BOOL *)a4
{
  id result;

  result = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", a3);
  if (a4)
    *a4 = result != 0;
  return result;
}

- (id)_domainName
{
  return self->_domain;
}

- (void)_registerCallback:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *registrationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  registrationQueue = self->_registrationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46___REEngineDefaults__registerCallback_forKey___block_invoke;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(registrationQueue, block);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  NSObject *registrationQueue;
  objc_super v13;
  _QWORD block[5];
  id v15;

  v10 = a3;
  v11 = v10;
  if ((void *)REPreferenceContext == a6)
  {
    registrationQueue = self->_registrationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68___REEngineDefaults_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24CF8AB18;
    block[4] = self;
    v15 = v10;
    dispatch_async(registrationQueue, block);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_REEngineDefaults;
    -[_REEngineDefaults observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationQueue, 0);
  objc_storeStrong((id *)&self->_registeredBlocks, 0);
  objc_storeStrong((id *)&self->_registeredPaths, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (_REEngineDefaults)initWithDomain:(id)a3
{
  id v4;
  _REEngineDefaults *v5;
  uint64_t v6;
  NSString *domain;
  void *v8;
  void *v9;
  NSUserDefaults *v10;
  NSUserDefaults *defaults;
  uint64_t v12;
  NSMutableSet *registeredPaths;
  uint64_t v14;
  NSMutableDictionary *registeredBlocks;
  uint64_t v16;
  OS_dispatch_queue *registrationQueue;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_REEngineDefaults;
  v5 = -[_REEngineDefaults init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v4);
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (NSUserDefaults *)objc_alloc_init(MEMORY[0x24BDBCF50]);
    defaults = v5->_defaults;
    v5->_defaults = v10;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    registeredPaths = v5->_registeredPaths;
    v5->_registeredPaths = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    registeredBlocks = v5->_registeredBlocks;
    v5->_registeredBlocks = (NSMutableDictionary *)v14;

    RECreateSharedQueue(CFSTR("Domain"));
    v16 = objc_claimAutoreleasedReturnValue();
    registrationQueue = v5->_registrationQueue;
    v5->_registrationQueue = (OS_dispatch_queue *)v16;

  }
  return v5;
}

@end

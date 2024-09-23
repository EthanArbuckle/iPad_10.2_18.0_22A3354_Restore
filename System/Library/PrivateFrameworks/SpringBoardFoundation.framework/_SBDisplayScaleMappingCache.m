@implementation _SBDisplayScaleMappingCache

- (_SBDisplayScaleMappingCache)init
{
  _SBDisplayScaleMappingCache *v2;
  uint64_t v3;
  NSMutableDictionary *hardwareIdentifierToMappings;
  uint64_t v5;
  FBDisplayManager *displayManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SBDisplayScaleMappingCache;
  v2 = -[_SBDisplayScaleMappingCache init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    hardwareIdentifierToMappings = v2->_hardwareIdentifierToMappings;
    v2->_hardwareIdentifierToMappings = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    displayManager = v2->_displayManager;
    v2->_displayManager = (FBDisplayManager *)v5;

    -[FBDisplayManager addObserver:](v2->_displayManager, "addObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FBDisplayManager removeObserver:](self->_displayManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)_SBDisplayScaleMappingCache;
  -[_SBDisplayScaleMappingCache dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___SBDisplayScaleMappingCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, block);
  return (id)sharedInstance___result;
}

- (id)mappingForDisplayIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_hardwareIdentifierToMappings, "objectForKey:", a3);
}

- (void)cacheMapping:(id)a3
{
  id v5;
  void *v6;
  NSMutableDictionary *hardwareIdentifierToMappings;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(v5, "displayHardwareIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayScaleMapping.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[mapping displayHardwareIdentifier] != nil"));

  }
  hardwareIdentifierToMappings = self->_hardwareIdentifierToMappings;
  objc_msgSend(v5, "displayHardwareIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](hardwareIdentifierToMappings, "setObject:forKey:", v5, v9);

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  void *v5;
  NSMutableDictionary *hardwareIdentifierToMappings;
  void *v7;
  id v8;

  objc_msgSend(a3, "configurationForIdentity:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hardwareIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    hardwareIdentifierToMappings = self->_hardwareIdentifierToMappings;
    objc_msgSend(v8, "hardwareIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](hardwareIdentifierToMappings, "removeObjectForKey:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifierToMappings, 0);
}

@end

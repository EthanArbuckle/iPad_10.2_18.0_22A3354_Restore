@implementation PCFeatureFlags

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCFeatureFlags;
  -[PCFeatureFlags dealloc](&v3, sel_dealloc);
}

- (void)setAllFeatureFlags:(id)a3
{
  NSDictionary *v5;

  if (self->_features != a3)
  {
    objc_sync_enter(self);
    v5 = (NSDictionary *)objc_msgSend(a3, "copy");

    self->_features = v5;
    objc_sync_exit(self);
  }
}

- (void)overwriteFeatureFlags:(id)a3
{
  NSDictionary *features;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  features = self->_features;
  if (features)
    v6 = -[NSDictionary mutableCopy](features, "mutableCopy");
  else
    v6 = objc_opt_new();
  v7 = (void *)v6;
  objc_sync_exit(self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_msgSend(a3, "keyEnumerator", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11)), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[PCFeatureFlags setAllFeatureFlags:](self, "setAllFeatureFlags:", v7);

}

- (BOOL)checkFeature:(id)a3
{
  objc_sync_enter(self);
  LOBYTE(a3) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_features, "objectForKeyedSubscript:", a3), "BOOLValue");
  objc_sync_exit(self);
  return (char)a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_sPCFeatureFlagsOnce != -1)
    dispatch_once(&sharedInstance_sPCFeatureFlagsOnce, &__block_literal_global_56);
  return (id)sharedInstance_sPCFeatureFlagsSharedInstance;
}

uint64_t __32__PCFeatureFlags_sharedInstance__block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  sharedInstance_sPCFeatureFlagsSharedInstance = result;
  return result;
}

+ (BOOL)checkFeature:(id)a3
{
  return -[PCFeatureFlags checkFeature:](+[PCFeatureFlags sharedInstance](PCFeatureFlags, "sharedInstance"), "checkFeature:", a3);
}

+ (void)setAllFeatureFlags:(id)a3
{
  -[PCFeatureFlags setAllFeatureFlags:](+[PCFeatureFlags sharedInstance](PCFeatureFlags, "sharedInstance"), "setAllFeatureFlags:", a3);
}

+ (void)overwriteFeatureFlags:(id)a3
{
  -[PCFeatureFlags overwriteFeatureFlags:](+[PCFeatureFlags sharedInstance](PCFeatureFlags, "sharedInstance"), "overwriteFeatureFlags:", a3);
}

@end

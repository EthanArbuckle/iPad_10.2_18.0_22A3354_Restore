@implementation HKSPPersistentSyncAnchorContainer

- (id)lock_getSyncAnchorForKey:(id)a3
{
  void *v3;
  uint64_t v4;

  -[HKSPUserDefaults hksp_objectForKey:](self->_defaults, "hksp_objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSyncAnchorClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    HKSPSyncAnchorDefaultValue();
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (id)inMemoryCopy
{
  HKSPSyncAnchorContainer *v3;
  void *v4;
  HKSPSyncAnchorContainer *v5;

  v3 = [HKSPSyncAnchorContainer alloc];
  -[HKSPSyncAnchorContainer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKSPSyncAnchorContainer initWithIdentifier:](v3, "initWithIdentifier:", v4);

  -[HKSPSyncAnchorContainer updateWithContainer:](v5, "updateWithContainer:", self);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  HKSPUserDefaults *defaults;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSPPersistentSyncAnchorContainer;
  v4 = -[HKSPSyncAnchorContainer copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (self)
    defaults = self->_defaults;
  else
    defaults = 0;
  objc_storeStrong(v4 + 4, defaults);
  return v5;
}

- (HKSPPersistentSyncAnchorContainer)initWithIdentifier:(id)a3 defaults:(id)a4
{
  id v7;
  HKSPPersistentSyncAnchorContainer *v8;
  HKSPPersistentSyncAnchorContainer *v9;
  NSObject *v10;
  HKSPPersistentSyncAnchorContainer *v11;
  objc_super v13;
  uint8_t buf[4];
  HKSPPersistentSyncAnchorContainer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKSPPersistentSyncAnchorContainer;
  v8 = -[HKSPSyncAnchorContainer initWithIdentifier:](&v13, sel_initWithIdentifier_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaults, a4);
    HKSPLogForCategory(0xAuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "Initialized %{public}@", buf, 0xCu);
    }

    v11 = v9;
  }

  return v9;
}

- (void)lock_setSyncAnchor:(id)a3 forKey:(id)a4
{
  HKSPUserDefaults *defaults;
  id v6;
  id v7;

  defaults = self->_defaults;
  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", 0);
  -[HKSPUserDefaults hksp_setObject:forKey:](defaults, "hksp_setObject:forKey:", v7, v6);

}

- (void)lock_removeSyncAnchorForKey:(id)a3
{
  -[HKSPUserDefaults hksp_removeObjectForKey:](self->_defaults, "hksp_removeObjectForKey:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end

@implementation SBLockScreenActionManager

- (SBLockScreenActionManager)init
{
  SBLockScreenActionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *actionProviders;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBLockScreenActionManager;
  v2 = -[SBLockScreenActionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    actionProviders = v2->_actionProviders;
    v2->_actionProviders = v3;

  }
  return v2;
}

- (void)registerLockScreenActionProvider:(id)a3 forSource:(unint64_t)a4
{
  NSMutableDictionary *actionProviders;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  id v14;

  v14 = a3;
  actionProviders = self->_actionProviders;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](actionProviders, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v14)
  {
    if (v14)
    {
      if (v8)
      {
        SBLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

        if (v10)
          NSLog(CFSTR("There already is an existing provider for source %lu"), a4);
      }
      v11 = self->_actionProviders;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v14, v12);
    }
    else
    {
      v13 = self->_actionProviders;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v12);
    }

  }
}

- (id)currentLockScreenActionContext
{
  return -[SBLockScreenActionManager currentLockScreenActionContextActionSource:](self, "currentLockScreenActionContextActionSource:", 0);
}

- (id)currentLockScreenActionContextActionSource:(unint64_t *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  NSMutableDictionary *actionProviders;
  void *v9;
  void *v10;
  void *v11;

  v5 = 0;
  v6 = 1;
  while (1)
  {
    v7 = v5;
    actionProviders = self->_actionProviders;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](actionProviders, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "lockScreenActionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
    }

    if (++v6 == 12)
      return v5;
  }
  if (a3)
    *a3 = v6;

  return v5;
}

- (void)runUnlockAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v6 = 0;
  -[SBLockScreenActionManager currentLockScreenActionContextActionSource:](self, "currentLockScreenActionContextActionSource:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "action");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  -[SBLockScreenActionManager _clearActionOnAllProviders](self, "_clearActionOnAllProviders");

}

- (void)_clearActionOnAllProviders
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_actionProviders, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_122);
}

void __55__SBLockScreenActionManager__clearActionOnAllProviders__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "invalidateLockScreenActionContext");

}

- (NSMutableDictionary)actionProviders
{
  return self->_actionProviders;
}

- (void)setActionProviders:(id)a3
{
  objc_storeStrong((id *)&self->_actionProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionProviders, 0);
}

@end

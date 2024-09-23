@implementation STStorageTip

- (void)_reload:(id)a3
{
  os_unfair_lock_s *p_specLock;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  p_specLock = &self->_specLock;
  os_unfair_lock_lock(&self->_specLock);
  -[STStorageTip specifier](self, "specifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[STStorageTip infoSpecifier](self, "infoSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_uiDelegate);
    objc_msgSend(v8, "tipDidUpdate:", self);

  }
  v9 = *MEMORY[0x24BE75D18];
  objc_msgSend(v14, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "refreshCellContentsWithSpecifier:", v14);
  objc_msgSend(v5, "propertyForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "refreshCellContentsWithSpecifier:", v5);
  os_unfair_lock_unlock(p_specLock);

}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 40, 1);
}

- (PSSpecifier)infoSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  PSSpecifier *specifier;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_specLock);
  specifier = self->_specifier;
  if (v8)
  {
    -[PSSpecifier setProperty:forKey:](specifier, "setProperty:forKey:", v8, v6);
    -[PSSpecifier setProperty:forKey:](self->_infoSpecifier, "setProperty:forKey:", v8, v6);
  }
  else
  {
    -[PSSpecifier removePropertyForKey:](specifier, "removePropertyForKey:", v6);
    -[PSSpecifier removePropertyForKey:](self->_infoSpecifier, "removePropertyForKey:", v6);
  }

  os_unfair_lock_unlock(&self->_specLock);
  -[STStorageTip reload](self, "reload");

}

- (void)reload
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__STStorageTip_reload__block_invoke;
  block[3] = &unk_24C756950;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (id)propertyForKey:(id)a3
{
  os_unfair_lock_s *p_specLock;
  id v5;
  void *v6;

  p_specLock = &self->_specLock;
  v5 = a3;
  os_unfair_lock_lock(p_specLock);
  -[PSSpecifier propertyForKey:](self->_specifier, "propertyForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_specLock);
  return v6;
}

- (int64_t)size
{
  void *v2;
  int64_t v3;

  -[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (STStorageTip)init
{
  STStorageTip *v2;
  STStorageTip *v3;
  uint64_t v4;
  PSSpecifier *infoSpecifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStorageTip;
  v2 = -[STStorageTip init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_specLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C756F10, v2, 0, 0, 0, -1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    infoSpecifier = v3->_infoSpecifier;
    v3->_infoSpecifier = (PSSpecifier *)v4;

    -[PSSpecifier setProperty:forKey:](v3->_infoSpecifier, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("stTitle"));
}

- (NSString)title
{
  return (NSString *)-[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stTitle"));
}

- (void)setInfoText:(id)a3
{
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("stInfo"));
}

- (NSString)infoText
{
  return (NSString *)-[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stInfo"));
}

- (void)setSize:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", v4, CFSTR("stSize"));

}

- (void)setIcon:(id)a3
{
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("stIcon"));
}

- (UIImage)icon
{
  return (UIImage *)-[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stIcon"));
}

- (void)setRepresentedApp:(id)a3
{
  -[STStorageTip setProperty:forKey:](self, "setProperty:forKey:", a3, CFSTR("stRepresentedApp"));
}

- (NSString)representedApp
{
  return (NSString *)-[STStorageTip propertyForKey:](self, "propertyForKey:", CFSTR("stRepresentedApp"));
}

uint64_t __22__STStorageTip_reload__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__reload_, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__reload_, 0, 0.03);
}

- (STStorageTipUIDelegate)uiDelegate
{
  return (STStorageTipUIDelegate *)objc_loadWeakRetained((id *)&self->_uiDelegate);
}

- (void)setUiDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_uiDelegate, a3);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_uiDelegate);
  objc_storeStrong((id *)&self->_infoSpecifier, 0);
}

@end

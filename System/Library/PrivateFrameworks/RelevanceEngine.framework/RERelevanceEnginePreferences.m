@implementation RERelevanceEnginePreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledDataSourceIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_disabledDataSourceIdentifiers);
  *(_QWORD *)(v4 + 24) = self->_mode;
  return (id)v4;
}

- (RERelevanceEnginePreferences)init
{
  RERelevanceEnginePreferences *v2;
  uint64_t v3;
  NSSet *disabledDataSourceIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RERelevanceEnginePreferences;
  v2 = -[RERelevanceEnginePreferences init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    disabledDataSourceIdentifiers = v2->_disabledDataSourceIdentifiers;
    v2->_disabledDataSourceIdentifiers = (NSSet *)v3;

  }
  return v2;
}

- (NSSet)disabledDataSourceIdentifiers
{
  return self->_disabledDataSourceIdentifiers;
}

+ (id)defaultPreferences
{
  if (defaultPreferences_onceToken != -1)
    dispatch_once(&defaultPreferences_onceToken, &__block_literal_global_40);
  return (id)defaultPreferences_DefaultPreferences;
}

- (unint64_t)hash
{
  return self->_mode ^ -[NSSet hash](self->_disabledDataSourceIdentifiers, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RERelevanceEnginePreferences *v4;
  RERelevanceEnginePreferences *v5;
  RERelevanceEnginePreferences *v6;
  NSSet *disabledDataSourceIdentifiers;
  NSSet *v8;
  NSSet *v9;
  NSSet *v10;
  char v11;

  v4 = (RERelevanceEnginePreferences *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_mode == v5->_mode)
      {
        disabledDataSourceIdentifiers = self->_disabledDataSourceIdentifiers;
        v8 = v5->_disabledDataSourceIdentifiers;
        v9 = disabledDataSourceIdentifiers;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSSet isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)setMode:(unint64_t)a3
{
  id WeakRetained;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "relevanceEnginePreferencesDidUpdate:", self);

  }
}

- (void)setDisabledDataSourceIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *disabledDataSourceIdentifiers;
  id WeakRetained;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  disabledDataSourceIdentifiers = self->_disabledDataSourceIdentifiers;
  self->_disabledDataSourceIdentifiers = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "relevanceEnginePreferencesDidUpdate:", self);

}

void __72__RERelevanceEnginePreferences_REDefaultPreferences__defaultPreferences__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultPreferences_DefaultPreferences;
  defaultPreferences_DefaultPreferences = v0;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RERelevanceEnginePreferencesDelegate)delegate
{
  return (RERelevanceEnginePreferencesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end

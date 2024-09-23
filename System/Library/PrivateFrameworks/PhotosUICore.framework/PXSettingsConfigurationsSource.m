@implementation PXSettingsConfigurationsSource

- (PXSettingsConfigurationsSource)init
{
  void *v3;
  PXSettingsConfigurationsSource *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXSettingsConfigurationsSource initWithUserDefaults:](self, "initWithUserDefaults:", v3);

  return v4;
}

- (PXSettingsConfigurationsSource)initWithUserDefaults:(id)a3
{
  id v5;
  PXSettingsConfigurationsSource *v6;
  PXSettingsConfigurationsSource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSMutableArray *configurations;
  NSObject *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXSettingsConfigurationsSource;
  v6 = -[PXSettingsConfigurationsSource init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    -[NSUserDefaults objectForKey:](v7->_userDefaults, "objectForKey:", CFSTR("PXSettingsConfigurations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = (void *)MEMORY[0x1E0C99E60];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v20);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v20;
      configurations = v7->_configurations;
      v7->_configurations = (NSMutableArray *)v13;

      PLUIGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "couldn't unarchive configurations data: %@", buf, 0xCu);
      }

    }
    if (!v7->_configurations)
    {
      v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = v7->_configurations;
      v7->_configurations = v17;

    }
  }

  return v7;
}

- (int64_t)numberOfConfigurations
{
  void *v2;
  int64_t v3;

  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)configurationAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfConfiguration:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (void)performChanges:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v11;
  id v12;

  v4 = a3;
  -[PXSettingsConfigurationsSource observer](self, "observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXSettingsConfigurationsSource_performChanges___block_invoke;
  aBlock[3] = &unk_1E5145688;
  aBlock[4] = self;
  v12 = v4;
  v6 = v5;
  v11 = v6;
  v7 = v4;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (v6)
    objc_msgSend(v6, "settingsConfigurationSource:performChanges:", self, v8);
  else
    (*((void (**)(void *))v8 + 2))(v8);

}

- (void)_save
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB36F8];
  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsSource.m"), 79, CFSTR("couldn't archive configurations: %@"), v7);

  }
  -[PXSettingsConfigurationsSource userDefaults](self, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("PXSettingsConfigurations"));

}

- (void)insertConfiguration:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

}

- (void)insertConfigurations:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", a4, objc_msgSend(v6, "count"));
  objc_msgSend(v8, "insertObjects:atIndexes:", v6, v7);

}

- (void)deleteConfigurationAtIndex:(int64_t)a3
{
  id v4;

  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectAtIndex:", a3);

}

- (void)deleteAllConfigurations
{
  id v2;

  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)renameConfigurationAtIndex:(int64_t)a3 withName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[PXSettingsConfigurationsSource configurationAtIndex:](self, "configurationAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copyWithName:", v6);

  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, v8);
}

- (void)updateConfigurationAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[PXSettingsConfigurationsSource configurationAtIndex:](self, "configurationAtIndex:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSettingsConfigurationsSource configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copyWithUpdatedSettingsValues");
  objc_msgSend(v5, "replaceObjectAtIndex:withObject:", a3, v6);

}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (PXSettingsConfigurationsSourceObserver)observer
{
  return (PXSettingsConfigurationsSourceObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSMutableArray)configurations
{
  return self->_configurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

void __49__PXSettingsConfigurationsSource_performChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "configurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "copy");

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_save");
  objc_msgSend(*(id *)(a1 + 32), "configurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v6, v4, MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "settingsConfigurationSource:didChange:", *(_QWORD *)(a1 + 32), v5);

}

@end

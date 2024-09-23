@implementation WFAutomationTriggerDataSource

- (WFAutomationTriggerDataSource)initWithDatabase:(id)a3
{
  id v5;
  WFAutomationTriggerDataSource *v6;
  WFAutomationTriggerDataSource *v7;
  uint64_t v8;
  WFHomeManager *homeManager;
  WFAutomationTriggerDataSource *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFAutomationTriggerDataSource;
  v6 = -[WFAutomationTriggerDataSource init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    objc_msgSend(MEMORY[0x24BEC3DE0], "sharedManager");
    v8 = objc_claimAutoreleasedReturnValue();
    homeManager = v7->_homeManager;
    v7->_homeManager = (WFHomeManager *)v8;

    -[WFHomeManager addEventObserver:](v7->_homeManager, "addEventObserver:", v7);
    v10 = v7;
  }

  return v7;
}

- (id)allConfiguredTriggers
{
  void *v2;
  void *v3;

  -[WFAutomationTriggerDataSource personalAutomationsDatabaseResult](self, "personalAutomationsDatabaseResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allHomeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id obj;
  id v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint8_t v42[128];
  _BYTE buf[24];
  void *v44;
  uint64_t *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  -[WFAutomationTriggerDataSource homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_14822);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (id)objc_opt_new();
  HomeLibrary();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v27, "setDelegate:", self);
        v28 = (void *)objc_opt_new();
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v27, "triggers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v6)
        {
          v7 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v6; ++j)
            {
              if (*(_QWORD *)v30 != v7)
                objc_enumerationMutation(v5);
              v9 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * j);
              v10 = v9;
              if (v9 && (-[NSObject conformsToProtocol:](v9, "conformsToProtocol:", &unk_2556555C8) & 1) != 0)
              {
                if ((-[NSObject hf_shouldDisplayTrigger](v10, "hf_shouldDisplayTrigger") & 1) != 0)
                {
                  v11 = -[NSObject hf_triggerType](v10, "hf_triggerType");
                  if (v11 != 7 && v11 != 0)
                  {
                    v37 = 0;
                    v38 = &v37;
                    v39 = 0x2050000000;
                    v17 = (void *)getHFTriggerItemClass_softClass;
                    v40 = getHFTriggerItemClass_softClass;
                    if (!getHFTriggerItemClass_softClass)
                    {
                      *(_QWORD *)buf = MEMORY[0x24BDAC760];
                      *(_QWORD *)&buf[8] = 3221225472;
                      *(_QWORD *)&buf[16] = __getHFTriggerItemClass_block_invoke;
                      v44 = &unk_24E604F20;
                      v45 = &v37;
                      __getHFTriggerItemClass_block_invoke((uint64_t)buf);
                      v17 = (void *)v38[3];
                    }
                    v18 = objc_retainAutorelease(v17);
                    _Block_object_dispose(&v37, 8);
                    v19 = (void *)objc_msgSend([v18 alloc], "initWithHome:trigger:", v27, v10);
                    objc_msgSend(v28, "addObject:", v19);

                    goto LABEL_30;
                  }
                  getWFTriggersLogObject();
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = "-[WFAutomationTriggerDataSource allHomeTriggers]";
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v10;
                    _os_log_impl(&dword_22007E000, v13, OS_LOG_TYPE_DEFAULT, "%s Ignoring trigger of unknown or placeholder type: %@", buf, 0x16u);
                  }
                }
                else
                {
                  getWFTriggersLogObject();
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = "-[WFAutomationTriggerDataSource allHomeTriggers]";
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v10;
                    _os_log_impl(&dword_22007E000, v13, OS_LOG_TYPE_DEFAULT, "%s Ignoring non-visible trigger: %@", buf, 0x16u);
                  }
                }

LABEL_30:
                v14 = v10;
                goto LABEL_31;
              }

              getWFTriggersLogObject();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                v15 = (void *)objc_opt_class();
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "-[WFAutomationTriggerDataSource allHomeTriggers]";
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v15;
                v16 = v15;
                _os_log_impl(&dword_22007E000, v14, OS_LOG_TYPE_DEFAULT, "%s Ignoring Home trigger that isn't HFTriggerProtocol: %{public}@", buf, 0x16u);

              }
LABEL_31:

            }
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v6);
        }

        objc_msgSend(v28, "sortUsingComparator:", &__block_literal_global_161);
        if (objc_msgSend(v28, "count"))
          objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v25);
  }

  return v22;
}

- (WFDatabaseResult)personalAutomationsDatabaseResult
{
  WFDatabaseResult *personalAutomationsDatabaseResult;
  void *v4;
  WFDatabaseResult *v5;
  WFDatabaseResult *v6;

  personalAutomationsDatabaseResult = self->_personalAutomationsDatabaseResult;
  if (!personalAutomationsDatabaseResult)
  {
    -[WFAutomationTriggerDataSource database](self, "database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allConfiguredTriggers");
    v5 = (WFDatabaseResult *)objc_claimAutoreleasedReturnValue();
    v6 = self->_personalAutomationsDatabaseResult;
    self->_personalAutomationsDatabaseResult = v5;

    -[WFDatabaseResult registerObserver:](self->_personalAutomationsDatabaseResult, "registerObserver:", self);
    personalAutomationsDatabaseResult = self->_personalAutomationsDatabaseResult;
  }
  return personalAutomationsDatabaseResult;
}

- (void)homeDidUpdateName:(id)a3
{
  id v4;

  -[WFAutomationTriggerDataSource delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceDidUpdateTriggers:", self);

}

- (void)home:(id)a3 didAddTrigger:(id)a4
{
  id v5;

  -[WFAutomationTriggerDataSource delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceDidUpdateTriggers:", self);

}

- (void)home:(id)a3 didRemoveTrigger:(id)a4
{
  id v5;

  -[WFAutomationTriggerDataSource delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceDidUpdateTriggers:", self);

}

- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4
{
  id v5;

  -[WFAutomationTriggerDataSource delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceDidUpdateTriggers:", self);

}

- (void)home:(id)a3 didUpdateTrigger:(id)a4
{
  id v5;

  -[WFAutomationTriggerDataSource delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceDidUpdateTriggers:", self);

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;

  -[WFAutomationTriggerDataSource delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceDidUpdateTriggers:", self);

}

- (void)databaseResultDidChange:(id)a3
{
  id v4;

  -[WFAutomationTriggerDataSource delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceDidUpdateTriggers:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFAutomationTriggerDataSource homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeEventObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WFAutomationTriggerDataSource;
  -[WFAutomationTriggerDataSource dealloc](&v4, sel_dealloc);
}

- (WFAutomationTriggerDataSourceDelegate)delegate
{
  return (WFAutomationTriggerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFDatabase)database
{
  return self->_database;
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personalAutomationsDatabaseResult, 0);
}

uint64_t __48__WFAutomationTriggerDataSource_allHomeTriggers__block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  v5 = a2;
  v6 = objc_alloc((Class)getHFTriggerUISummaryClass_14828());
  objc_msgSend(v5, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithTrigger:inHome:forceDisabled:", v7, v8, 0);
  v10 = objc_alloc((Class)getHFTriggerUISummaryClass_14828());
  objc_msgSend(v4, "trigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v10, "initWithTrigger:inHome:forceDisabled:", v11, v12, 0);
  objc_msgSend(v9, "triggerDisplayTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "triggerDisplayTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "localizedStandardCompare:", v15);

  return v16;
}

uint64_t __48__WFAutomationTriggerDataSource_allHomeTriggers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

@end

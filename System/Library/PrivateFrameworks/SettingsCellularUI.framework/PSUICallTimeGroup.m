@implementation PSUICallTimeGroup

- (PSUICallTimeGroup)initWithListController:(id)a3
{
  id v4;
  PSUICallTimeGroup *v5;
  PSUICallTimeGroup *v6;
  CHManager *v7;
  CHManager *callHistoryManager;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PSSpecifier *groupSpecifier;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PSSpecifier *currentCallTimeSpecifier;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PSSpecifier *lifetimeCallTimeSpecifier;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PSUICallTimeGroup;
  v5 = -[PSUICallTimeGroup init](&v28, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hostController, v4);
    v7 = (CHManager *)objc_alloc_init(MEMORY[0x24BE14938]);
    callHistoryManager = v6->_callHistoryManager;
    v6->_callHistoryManager = v7;

    v9 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CALL_TIME"), &stru_24D5028C8, CFSTR("Cellular"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupSpecifierWithName:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    groupSpecifier = v6->_groupSpecifier;
    v6->_groupSpecifier = (PSSpecifier *)v12;

    v14 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CURRENT_CALL_PERIOD"), &stru_24D5028C8, CFSTR("Cellular"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, v6, 0, sel_callTime_, 0, 4, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    currentCallTimeSpecifier = v6->_currentCallTimeSpecifier;
    v6->_currentCallTimeSpecifier = (PSSpecifier *)v17;

    -[PSSpecifier setIdentifier:](v6->_currentCallTimeSpecifier, "setIdentifier:", CFSTR("CALL_TIME_IN_PERIOD"));
    v19 = *MEMORY[0x24BE75C18];
    v20 = MEMORY[0x24BDBD1C8];
    -[PSSpecifier setProperty:forKey:](v6->_currentCallTimeSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C18]);
    v21 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("TOTAL"), &stru_24D5028C8, CFSTR("Cellular"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v6, 0, sel_lifetimeCallTime_, 0, 4, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    lifetimeCallTimeSpecifier = v6->_lifetimeCallTimeSpecifier;
    v6->_lifetimeCallTimeSpecifier = (PSSpecifier *)v24;

    -[PSSpecifier setIdentifier:](v6->_lifetimeCallTimeSpecifier, "setIdentifier:", CFSTR("CALL_TIME_TOTAL"));
    -[PSSpecifier setProperty:forKey:](v6->_lifetimeCallTimeSpecifier, "setProperty:forKey:", v20, v19);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v6, sel_handleCallTimersChanged, *MEMORY[0x24BE149E8], 0);

  }
  return v6;
}

- (id)specifiers
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  PSSpecifier *lifetimeCallTimeSpecifier;
  const char *v7;
  __int128 v9;
  PSSpecifier *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[PSUICallTimeGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "not null";
    if (self->_groupSpecifier)
      v5 = "not null";
    else
      v5 = "null";
    lifetimeCallTimeSpecifier = self->_lifetimeCallTimeSpecifier;
    if (self->_currentCallTimeSpecifier)
      v7 = "not null";
    else
      v7 = "null";
    *(_DWORD *)buf = 136315650;
    if (!lifetimeCallTimeSpecifier)
      v4 = "null";
    v12 = v5;
    v13 = 2080;
    v14 = v7;
    v15 = 2080;
    v16 = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Call time group returning, group: %s, current: %s, lifetime: %s", buf, 0x20u);
  }

  v9 = *(_OWORD *)&self->_groupSpecifier;
  v10 = self->_lifetimeCallTimeSpecifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)handleCallTimersChanged
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _BYTE buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICallTimeGroup getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE149E8];
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Call time group received notification %@", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__PSUICallTimeGroup_handleCallTimersChanged__block_invoke;
  v5[3] = &unk_24D5016B0;
  v5[4] = self;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __44__PSUICallTimeGroup_handleCallTimersChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "hostController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentCallTimeSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifier:animated:", v4, 1);

  objc_msgSend(*(id *)(a1 + 32), "hostController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "lifetimeCallTimeSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadSpecifier:animated:", v6, 1);

}

- (id)callTimeDurationRestrictedToCurrentPeriod:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PSUICallTimeGroup callHistoryManager](self, "callHistoryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callTimersGetOutgoing");
  -[PSUICallTimeGroup callHistoryManager](self, "callHistoryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callTimersGetIncoming");

  -[PSUICallTimeGroup callHistoryManager](self, "callHistoryManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callTimersGetLifetime");

  if ((PSTimeStringIsShortened() & 1) != 0 || PSTimeStringIsShortened())
  {
    PSAbbreviatedFormattedTimeStringWithDays();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PSFormattedTimeStringWithDays();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)callTime:(id)a3
{
  return -[PSUICallTimeGroup callTimeDurationRestrictedToCurrentPeriod:](self, "callTimeDurationRestrictedToCurrentPeriod:", 1);
}

- (id)lifetimeCallTime:(id)a3
{
  return -[PSUICallTimeGroup callTimeDurationRestrictedToCurrentPeriod:](self, "callTimeDurationRestrictedToCurrentPeriod:", 0);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PSUICallTimeGroup"));
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_callHistoryManager, a3);
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (PSSpecifier)currentCallTimeSpecifier
{
  return self->_currentCallTimeSpecifier;
}

- (void)setCurrentCallTimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentCallTimeSpecifier, a3);
}

- (PSSpecifier)lifetimeCallTimeSpecifier
{
  return self->_lifetimeCallTimeSpecifier;
}

- (void)setLifetimeCallTimeSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_lifetimeCallTimeSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeCallTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_currentCallTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end

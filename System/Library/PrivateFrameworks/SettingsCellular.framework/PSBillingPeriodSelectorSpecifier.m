@implementation PSBillingPeriodSelectorSpecifier

- (PSBillingPeriodSelectorSpecifier)initWithStatisticsCache:(id)a3
{
  id v4;
  PSBillingPeriodSelectorSpecifier *v5;
  PSBillingPeriodSelectorSpecifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSBillingPeriodSelectorSpecifier;
  v5 = -[PSBillingPeriodSelectorSpecifier initWithName:target:set:get:detail:cell:edit:](&v8, sel_initWithName_target_set_get_detail_cell_edit_, &stru_24D96EF60, self, sel_setBillingPeriod_specifier_, sel_getBillingPeriod_, 0, 9, 0);
  v6 = v5;
  if (v5)
  {
    -[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:](v5, "refreshSelectorWithStatisticsCache:", v4);
    -[PSBillingPeriodSelectorSpecifier setProperty:forKey:](v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75D00]);
  }

  return v6;
}

- (void)refreshSelectorWithStatisticsCache:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "useCalendarMonthBillingCycle");
  -[PSBillingPeriodSelectorSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:]";
      _os_log_impl(&dword_2188BE000, v6, OS_LOG_TYPE_DEFAULT, "%s using calendar month billing cycle", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("THIS_MONTH"), &stru_24D96EF60, CFSTR("WirelessData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LAST_MONTH"), &stru_24D96EF60, CFSTR("WirelessData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v11;
    v12 = v23;
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:]";
      _os_log_impl(&dword_2188BE000, v6, OS_LOG_TYPE_DEFAULT, "%s using carrier-provided billing cycle", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("THIS_BILLING_PERIOD"), &stru_24D96EF60, CFSTR("WirelessData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LAST_BILLING_PERIOD"), &stru_24D96EF60, CFSTR("WirelessData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    v12 = v22;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "previousBillingCycleEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = &unk_24D971980;
  }
  else
  {
    -[PSBillingPeriodSelectorSpecifier getLogger](self, "getLogger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PSBillingPeriodSelectorSpecifier refreshSelectorWithStatisticsCache:]";
      _os_log_impl(&dword_2188BE000, v16, OS_LOG_TYPE_DEFAULT, "%s hiding previous period", buf, 0xCu);
    }

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_24D971980, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)v18;
  }
  -[PSBillingPeriodSelectorSpecifier setValues:titles:](self, "setValues:titles:", v15, v13);

}

- (void)setBillingPeriod:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSBillingPeriodSelectorSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PSBillingPeriodSelectorSpecifier selectedPeriod](self, "selectedPeriod"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "-[PSBillingPeriodSelectorSpecifier setBillingPeriod:specifier:]";
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_2188BE000, v6, OS_LOG_TYPE_DEFAULT, "%s setting from %@ to %@", (uint8_t *)&v9, 0x20u);

  }
  -[PSBillingPeriodSelectorSpecifier setSelectedPeriod:](self, "setSelectedPeriod:", objc_msgSend(v5, "unsignedIntegerValue"));
  -[PSBillingPeriodSelectorSpecifier delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedBillingPeriodChanged:", -[PSBillingPeriodSelectorSpecifier selectedPeriod](self, "selectedPeriod"));

}

- (id)getBillingPeriod:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PSBillingPeriodSelectorSpecifier selectedPeriod](self, "selectedPeriod", a3));
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:](Logger, "loggerWithCategory:", CFSTR("BillingPeriodSelector"));
}

- (PSBillingPeriodSelectorSpecifierDelegate)delegate
{
  return (PSBillingPeriodSelectorSpecifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)selectedPeriod
{
  return self->_selectedPeriod;
}

- (void)setSelectedPeriod:(unint64_t)a3
{
  self->_selectedPeriod = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation PSUICellularDiagnosticsSpecifier

- (PSUICellularDiagnosticsSpecifier)init
{
  void *v3;
  PSUICellularDiagnosticsSpecifier *v4;

  +[PSUICoreTelephonyRadioCache sharedInstance](PSUICoreTelephonyRadioCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSUICellularDiagnosticsSpecifier initWithRadioCache:](self, "initWithRadioCache:", v3);

  return v4;
}

- (PSUICellularDiagnosticsSpecifier)initWithRadioCache:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PSUICellularDiagnosticsSpecifier *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularDiagnosticsSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PSUICellularDiagnosticsSpecifier initWithRadioCache:]";
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DIAGNOSTICS_STATUS"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDiagnosticsSpecifier;
  v10 = -[PSUICellularDiagnosticsSpecifier initWithName:target:set:get:detail:cell:edit:](&v12, sel_initWithName_target_set_get_detail_cell_edit_, v8, self, 0, sel_getCellularDiagnosticsRunResult_, v9, 2, 0);

  if (v10)
  {
    -[PSUICellularDiagnosticsSpecifier setIdentifier:](v10, "setIdentifier:", CFSTR("CELLULAR_DIAGNOSTICS_ID"));
    objc_storeStrong((id *)&v10->_radioCache, a3);
    v10->_cellularIssueDetected = 0;
    v10->_cellularDiagCode = -255;
    -[PSUICellularDiagnosticsSpecifier getCellularDiagnosticsStatus](v10, "getCellularDiagnosticsStatus");
  }

  return v10;
}

- (BOOL)cellularIssueFound
{
  NSObject *v3;
  _BOOL4 cellularIssueDetected;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularDiagnosticsSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    cellularIssueDetected = self->_cellularIssueDetected;
    v6 = 136315394;
    v7 = "-[PSUICellularDiagnosticsSpecifier cellularIssueFound]";
    v8 = 1024;
    v9 = cellularIssueDetected;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  return self->_cellularIssueDetected;
}

- (void)getCellularDiagnosticsStatus
{
  NSObject *v3;
  int cellularStatus;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  self->_cellularStatus = -[PSUICoreTelephonyRadioCache checkCellularHealthStatus](self->_radioCache, "checkCellularHealthStatus");
  self->_cellularDiagCode = -[PSUICoreTelephonyRadioCache getCellularHealthDiagnosticsCode](self->_radioCache, "getCellularHealthDiagnosticsCode");
  self->_cellularIssueDetected = self->_cellularStatus == 1;
  -[PSUICellularDiagnosticsSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    cellularStatus = self->_cellularStatus;
    v5 = 136315394;
    v6 = "-[PSUICellularDiagnosticsSpecifier getCellularDiagnosticsStatus]";
    v7 = 1024;
    v8 = cellularStatus;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

}

- (BOOL)needToShowHelpLink
{
  return self->_cellularStatus == 1;
}

- (id)getDiagnosticsStatusText
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  -[PSUICellularDiagnosticsSpecifier getCellularDiagnosticsStatus](self, "getCellularDiagnosticsStatus");
  if (self->_cellularStatus == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CELLULAR_DIAGNOSTICS_ISSUE");
  }
  else
  {
    self->_cellularIssueDetected = 0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CELLULAR_DIAGNOSTICS_HEALTHY");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getDiagnosticsStatusRecommendation
{
  int cellularStatus;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  cellularStatus = self->_cellularStatus;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (cellularStatus == 1)
    v5 = CFSTR("CELLULAR_DIAGNOSTICS_RECOMMEND_ISSUE");
  else
    v5 = CFSTR("CELLULAR_DIAGNOSTICS_RECOMMEND_HEALTHY");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)getDiagnosticsDetailsCode
{
  return self->_cellularDiagCode;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDiagnostics"));
}

- (BOOL)cellularIssueDetected
{
  return self->_cellularIssueDetected;
}

- (int)cellularStatus
{
  return self->_cellularStatus;
}

- (int64_t)cellularDiagCode
{
  return self->_cellularDiagCode;
}

- (PSUICoreTelephonyRadioCache)radioCache
{
  return self->_radioCache;
}

- (void)setRadioCache:(id)a3
{
  objc_storeStrong((id *)&self->_radioCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioCache, 0);
}

@end

@implementation SFUITTRReporter

+ (id)reporterForPeopleSuggestions
{
  void *v3;
  void *v4;

  +[SFUITTRReport peopleSuggestionReport](SFUITTRReport, "peopleSuggestionReport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReport:", v3);

  return v4;
}

- (SFUITTRReporter)initWithReport:(id)a3
{
  id v5;
  SFUITTRReporter *v6;
  SFUITTRReporter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFUITTRReporter;
  v6 = -[SFUITTRReporter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalReport, a3);

  return v7;
}

- (void)report
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212728000, log, OS_LOG_TYPE_ERROR, "TTR: failed getting a scheme url to report.", v1, 2u);
}

void __25__SFUITTRReporter_report__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sharing_ui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __25__SFUITTRReporter_report__block_invoke_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_212728000, v6, OS_LOG_TYPE_DEFAULT, "TTR: succeeded opening shemeURL:%@", (uint8_t *)&v8, 0xCu);
  }

}

- (id)_createSchemeURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUITTRReporter internalReport](self, "internalReport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[SFUITTRReporter internalReport](self, "internalReport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "desc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)MEMORY[0x24BDD1838];
  -[SFUITTRReporter internalReport](self, "internalReport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "component");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItemWithName:value:", CFSTR("ComponentID"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD1838];
  -[SFUITTRReporter internalReport](self, "internalReport");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "component");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItemWithName:value:", CFSTR("ComponentName"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD1838];
  -[SFUITTRReporter internalReport](self, "internalReport");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "component");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "version");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "queryItemWithName:value:", CFSTR("ComponentVersion"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v14);
  objc_msgSend(v3, "addObject:", v19);
  objc_msgSend(v3, "addObject:", v24);
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setQueryItems:", v3);
  objc_msgSend(v25, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (SFUITTRReport)internalReport
{
  return self->_internalReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalReport, 0);
}

void __25__SFUITTRReporter_report__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_212728000, log, OS_LOG_TYPE_ERROR, "TTR: failed opening shemeURL:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

@end

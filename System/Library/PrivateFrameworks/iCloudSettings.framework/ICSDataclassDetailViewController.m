@implementation ICSDataclassDetailViewController

- (void)setAccountManager:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *dataclass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSDataclassDetailViewController;
  -[ICSDataclassViewController setAccountManager:](&v7, sel_setAccountManager_, a3);
  -[ICSDataclassDetailViewController specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  dataclass = self->_dataclass;
  self->_dataclass = v5;

  -[ICSDataclassDetailViewController _initSpecifiers](self, "_initSpecifiers");
}

- (void)viewDidLoad
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  objc_msgSend(a2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_24B4C1000, a3, OS_LOG_TYPE_DEBUG, "Dataclass (%@) - title (%@)", (uint8_t *)&v6, 0x16u);

}

- (void)_initSpecifiers
{
  ICSDataclassDetailSpecifierProvider *v3;
  void *v4;
  ICSDataclassDetailSpecifierProvider *v5;
  ICSDataclassDetailSpecifierProvider *specifierProvider;

  v3 = [ICSDataclassDetailSpecifierProvider alloc];
  -[ICSDataclassViewController accountManager](self, "accountManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICSDataclassDetailSpecifierProvider initWithAccountManager:presenter:](v3, "initWithAccountManager:presenter:", v4, self);
  specifierProvider = self->_specifierProvider;
  self->_specifierProvider = v5;

  -[ICSDataclassDetailSpecifierProvider setDelegate:](self->_specifierProvider, "setDelegate:", self);
  -[ICSDataclassDetailSpecifierProvider setDataclass:](self->_specifierProvider, "setDataclass:", self->_dataclass);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3))
  {
    -[ICSDataclassDetailSpecifierProvider specifiers](self->_specifierProvider, "specifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDBCE30];
      -[ICSDataclassDetailSpecifierProvider specifiers](self->_specifierProvider, "specifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayWithArray:", v7);
      v8 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v9 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v8;

    }
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + v3));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICSDataclassDetailViewController;
  -[ACUIDataclassConfigurationViewController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75998]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    LogSubsystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ICSDataclassDetailViewController tableView:cellForRowAtIndexPath:].cold.1(v5, v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v9, "startAnimating");
    objc_msgSend(v4, "setAccessoryView:", v9);

  }
  return v4;
}

- (void)cleanupDataclassSpecifiers
{
  uint64_t v3;
  void *v4;

  -[ICSDataclassDetailSpecifierProvider setSpecifiers:](self->_specifierProvider, "setSpecifiers:", 0);
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_specifierProvider, 0);
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_DEBUG, "Adding spinner to specifier: %@", (uint8_t *)&v4, 0xCu);

}

@end

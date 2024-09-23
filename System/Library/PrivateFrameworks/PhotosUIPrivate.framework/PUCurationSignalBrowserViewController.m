@implementation PUCurationSignalBrowserViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *availableScoreConfiguration;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PUCurationSignalBrowserViewController;
  -[PUCurationSignalBrowserViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PUCurationSignalBrowserViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("scoreConfigurationCellIdentifier"));

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77EE0]), "initWithScoreConfigurationDataType:scoreConfigurationThemeType:", 0, 0);
  v10[0] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77EE0]), "initWithScoreConfigurationDataType:scoreConfigurationThemeType:", 1, 0);
  v10[1] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77EE0]), "initWithScoreConfigurationDataType:scoreConfigurationThemeType:", 1, 1);
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableScoreConfiguration = self->_availableScoreConfiguration;
  self->_availableScoreConfiguration = v7;

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUCurationSignalBrowserViewController availableScoreConfiguration](self, "availableScoreConfiguration", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("scoreConfigurationCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationSignalBrowserViewController availableScoreConfiguration](self, "availableScoreConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __objc2_class **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  -[PUCurationSignalBrowserViewController availableScoreConfiguration](self, "availableScoreConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v13, "themeType");
  if (v8)
  {
    if (v8 != 1)
      goto LABEL_7;
    v9 = off_1E58858B0;
  }
  else
  {
    v9 = off_1E58858B8;
  }
  v10 = objc_msgSend(objc_alloc(*v9), "initWithScoreConfiguration:", v13);
  if (v10)
  {
    v11 = (void *)v10;
    -[PUCurationSignalBrowserViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v11, 1);

  }
LABEL_7:

}

- (NSArray)availableScoreConfiguration
{
  return self->_availableScoreConfiguration;
}

- (void)setAvailableScoreConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_availableScoreConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableScoreConfiguration, 0);
}

@end

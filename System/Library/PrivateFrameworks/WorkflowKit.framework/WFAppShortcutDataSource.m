@implementation WFAppShortcutDataSource

- (WFAppShortcutDataSource)initWithAppShortcutsDenyListEnvironment:(unint64_t)a3 environment:(int64_t)a4
{
  WFAppShortcutDataSource *v6;
  void *v7;
  WFSwiftAppShortcutDataSource *v8;
  WFSwiftAppShortcutDataSource *dataSource;
  WFAppShortcutDataSource *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFAppShortcutDataSource;
  v6 = -[WFAppShortcutDataSource init](&v12, sel_init);
  if (v6)
  {
    if (a4 != 2)
      a4 = a4 == 1;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44138]), "initWithOptions:", 2);
    v8 = -[WFSwiftAppShortcutDataSource initWithAppShortcutsProvider:denyListEnvironment:organizationStyle:]([WFSwiftAppShortcutDataSource alloc], "initWithAppShortcutsProvider:denyListEnvironment:organizationStyle:", v7, a3, a4);
    dataSource = v6->_dataSource;
    v6->_dataSource = v8;

    v10 = v6;
  }

  return v6;
}

- (id)fetchAppShortcutsForBundleIdentifiers:(id)a3 localeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[WFAppShortcutDataSource dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAppShortcutForBundleIdentifiers:localeIdentifier:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (WFSwiftAppShortcutDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end

@implementation WBTabGroupSyncAgent

- (WBCollectionConfiguration)configuration
{
  return self->_configuration;
}

- (WBTabGroupSyncAgent)initWithConfiguration:(id)a3
{
  id v5;
  WBTabGroupSyncAgent *v6;
  WBTabGroupSyncAgent *v7;
  WBTabGroupSyncAgent *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBTabGroupSyncAgent;
  v6 = -[WBTabGroupSyncAgent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (WBTabCollection)tabCollection
{
  return self->_tabCollection;
}

- (void)setTabCollection:(id)a3
{
  objc_storeStrong((id *)&self->_tabCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

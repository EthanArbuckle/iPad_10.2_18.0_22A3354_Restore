@implementation VSIKItemGroup

+ (void)registerFeature
{
  objc_msgSend(MEMORY[0x24BE51988], "registerClass:forFeatureName:", objc_opt_class(), CFSTR("ItemGroup"));
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  VSJSItemGroup *v4;
  void *v5;
  VSJSItemGroup *v6;

  v3 = a3;
  v4 = [VSJSItemGroup alloc];
  objc_msgSend(v3, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  -[VSJSItemGroup setBridge:](v6, "setBridge:", v3);
  return v6;
}

- (VSIKItemGroup)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  VSIKItemGroup *v8;
  void *v9;
  uint64_t v10;
  NSString *featureName;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VSIKItemGroup;
  v8 = -[VSIKItemGroup init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_appContext, v9);

    v10 = objc_msgSend(v7, "copy");
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

  }
  return v8;
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "ItemGroup updated from UI to index %lu.", (uint8_t *)&v6, 0xCu);
  }

  -[VSIKItemGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedItemIndex"));
  self->_selectedItemIndex = a3;
  -[VSIKItemGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedItemIndex"));
  -[VSIKItemGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("jsSelectedItem"));
  self->_jsSelectedItem = a3;
  -[VSIKItemGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("jsSelectedItem"));
}

- (void)setJSSelectedItem:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "ItemGroup updated from JS to index %lu.", (uint8_t *)&v7, 0xCu);
  }

  -[VSIKItemGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedItemIndex"));
  self->_selectedItemIndex = a3;
  -[VSIKItemGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedItemIndex"));
  -[VSIKItemGroup willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("jsSelectedItem"));
  self->_jsSelectedItem = a3;
  -[VSIKItemGroup didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("jsSelectedItem"));
  -[VSIKItemGroup delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "itemGroup:selectedItemIndexDidChange:", self, a3);

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (int64_t)jsSelectedItem
{
  return self->_jsSelectedItem;
}

- (VSIKItemGroupDelegate)delegate
{
  return (VSIKItemGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end

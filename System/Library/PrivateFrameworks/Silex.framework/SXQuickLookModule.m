@implementation SXQuickLookModule

- (SXQuickLookModule)initWithResolver:(id)a3
{
  id v5;
  SXQuickLookModule *v6;
  SXQuickLookModule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookModule;
  v6 = -[SXQuickLookModule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolver, a3);

  return v7;
}

- (id)createViewControllerWithFile:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SXQuickLookModule resolver](self, "resolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__SXQuickLookModule_createViewControllerWithFile___block_invoke;
  v10[3] = &unk_24D68AEF8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "resolveClass:contextBlock:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __50__SXQuickLookModule_createViewControllerWithFile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "useObject:forClass:", v2, objc_opt_class());

}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end

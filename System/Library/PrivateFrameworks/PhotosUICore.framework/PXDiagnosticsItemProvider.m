@implementation PXDiagnosticsItemProvider

- (PXDiagnosticsItemProvider)init
{
  PXDiagnosticsItemProvider *v2;
  uint64_t v3;
  NSMutableDictionary *loadHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDiagnosticsItemProvider;
  v2 = -[PXDiagnosticsItemProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    loadHandlers = v2->__loadHandlers;
    v2->__loadHandlers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerItemForIdentifier:(id)a3 loadHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = (id)objc_msgSend(a4, "copy");
  -[PXDiagnosticsItemProvider _loadHandlers](self, "_loadHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (BOOL)hasItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXDiagnosticsItemProvider _loadHandlers](self, "_loadHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)itemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;

  v4 = a3;
  -[PXDiagnosticsItemProvider _loadHandlers](self, "_loadHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSSet)registeredIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PXDiagnosticsItemProvider _loadHandlers](self, "_loadHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)registerItem:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXDiagnosticsItemProvider_registerItem_forIdentifier___block_invoke;
  v8[3] = &unk_1E5148158;
  v9 = v6;
  v7 = v6;
  -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](self, "registerItemForIdentifier:loadHandler:", a4, v8);

}

- (NSMutableDictionary)_loadHandlers
{
  return self->__loadHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loadHandlers, 0);
}

id __56__PXDiagnosticsItemProvider_registerItem_forIdentifier___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (PXDiagnosticsItemProvider)providerWithItem:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "registerItem:forIdentifier:", v7, v6);

  return (PXDiagnosticsItemProvider *)v8;
}

@end

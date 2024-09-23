@implementation PXHorizontalCollectionGadgetProvider

- (PXHorizontalCollectionGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadgetProvider.m"), 30, CFSTR("%s is not available as initializer"), "-[PXHorizontalCollectionGadgetProvider init]");

  abort();
}

- (PXHorizontalCollectionGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadgetProvider.m"), 34, CFSTR("%s is not available as initializer"), "-[PXHorizontalCollectionGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXHorizontalCollectionGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  PXHorizontalCollectionGadgetProvider *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PXHorizontalCollectionGadgetProvider initWithContentGadgetProvider:title:horizontalCollectionGadgetClass:](self, "initWithContentGadgetProvider:title:horizontalCollectionGadgetClass:", v7, v6, objc_opt_class());

  return v8;
}

- (PXHorizontalCollectionGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4 horizontalCollectionGadgetClass:(Class)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  PXHorizontalCollectionGadgetProvider *v13;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  v11 = objc_opt_class();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXHorizontalCollectionGadgetProvider initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:](self, "initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:", v12, v10, v9, a5);

  return v13;
}

- (PXHorizontalCollectionGadgetProvider)initWithIdentifier:(id)a3 contentGadgetProvider:(id)a4 title:(id)a5 horizontalCollectionGadgetClass:(Class)a6
{
  id v11;
  id v12;
  PXHorizontalCollectionGadgetProvider *v13;
  PXHorizontalCollectionGadgetProvider *v14;
  uint64_t v15;
  NSString *title;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXHorizontalCollectionGadgetProvider;
  v13 = -[PXGadgetProvider initWithIdentifier:](&v18, sel_initWithIdentifier_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentGadgetProvider, a4);
    -[PXGadgetProvider setDelegate:](v14->_contentGadgetProvider, "setDelegate:", v14);
    v15 = objc_msgSend(v12, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

    v14->_horizontalCollectionGadgetClass = a6;
    v14->_defaultColumnSpan = 1;
    v14->_prefersPagingEnabled = 1;
  }

  return v14;
}

- (void)loadDataForGadgets
{
  -[PXGadgetProvider loadDataForGadgets](self->_contentGadgetProvider, "loadDataForGadgets");
}

- (unint64_t)estimatedNumberOfGadgets
{
  return -[PXGadgetProvider estimatedNumberOfGadgets](self->_contentGadgetProvider, "estimatedNumberOfGadgets") != 0;
}

- (void)generateGadgets
{
  if (-[PXHorizontalCollectionGadgetProvider estimatedNumberOfGadgets](self, "estimatedNumberOfGadgets"))
  {
    -[PXHorizontalCollectionGadgetProvider _updateHorizontalGadget](self, "_updateHorizontalGadget");
    self->_hasLoaded = 1;
  }
}

- (void)setGadgetType:(unint64_t)a3
{
  if (self->_gadgetType != a3)
  {
    self->_gadgetType = a3;
    -[PXHorizontalCollectionGadget setGadgetType:](self->_horizontalGadget, "setGadgetType:");
  }
}

- (void)setDefaultColumnSpan:(int64_t)a3
{
  if (self->_defaultColumnSpan != a3)
  {
    self->_defaultColumnSpan = a3;
    -[PXHorizontalCollectionGadget setDefaultColumnSpan:](self->_horizontalGadget, "setDefaultColumnSpan:");
  }
}

- (void)setColumnSpanForTraitCollection:(id)a3
{
  NSDictionary *v4;
  NSDictionary *columnSpanForTraitCollection;
  id v6;

  v6 = a3;
  if (!-[NSDictionary isEqualToDictionary:](self->_columnSpanForTraitCollection, "isEqualToDictionary:"))
  {
    v4 = (NSDictionary *)objc_msgSend(v6, "copy");
    columnSpanForTraitCollection = self->_columnSpanForTraitCollection;
    self->_columnSpanForTraitCollection = v4;

    -[PXHorizontalCollectionGadget setColumnSpans:](self->_horizontalGadget, "setColumnSpans:", self->_columnSpanForTraitCollection);
  }

}

- (void)setPrefersPagingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_prefersPagingEnabled != a3)
  {
    v3 = a3;
    self->_prefersPagingEnabled = a3;
    -[PXGadgetUIViewController layout](self->_horizontalGadget, "layout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrefersPagingEnabled:", v3);

  }
}

- (void)horizontalCollectionGadgetDatasourceDidUpdate:(id)a3
{
  px_dispatch_on_main_queue();
}

- (void)_updateHorizontalGadget
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  PXHorizontalCollectionGadget *horizontalGadget;
  PXHorizontalCollectionGadget *v7;
  PXHorizontalCollectionGadget *v8;
  BOOL v9;
  _QWORD v10[5];

  v3 = -[PXHorizontalCollectionGadgetProvider estimatedNumberOfGadgets](self, "estimatedNumberOfGadgets");
  -[PXGadgetProvider gadgets](self, "gadgets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3)
  {
    horizontalGadget = self->_horizontalGadget;
    if (!horizontalGadget)
    {
      -[PXHorizontalCollectionGadgetProvider _createHorizontalGadget](self, "_createHorizontalGadget");
      v7 = (PXHorizontalCollectionGadget *)objc_claimAutoreleasedReturnValue();
      v8 = self->_horizontalGadget;
      self->_horizontalGadget = v7;

      horizontalGadget = self->_horizontalGadget;
    }
    if (horizontalGadget)
      v9 = v5 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __63__PXHorizontalCollectionGadgetProvider__updateHorizontalGadget__block_invoke;
      v10[3] = &unk_1E5145360;
      v10[4] = self;
      -[PXGadgetProvider performChanges:](self, "performChanges:", v10);
    }
  }
  else if (v5)
  {
    -[PXGadgetProvider performChanges:](self, "performChanges:", &__block_literal_global_116884);
  }
}

- (id)_createHorizontalGadget
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(self->_horizontalCollectionGadgetClass);
  v9[0] = self->_contentGadgetProvider;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithProviders:", v4);

  objc_msgSend(v5, "setDefaultColumnSpan:", -[PXHorizontalCollectionGadgetProvider defaultColumnSpan](self, "defaultColumnSpan"));
  -[PXHorizontalCollectionGadgetProvider columnSpanForTraitCollection](self, "columnSpanForTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColumnSpans:", v6);

  objc_msgSend(v5, "setGadgetType:", -[PXHorizontalCollectionGadgetProvider gadgetType](self, "gadgetType"));
  objc_msgSend(v5, "setHeaderStyle:", -[PXHorizontalCollectionGadgetProvider headerStyle](self, "headerStyle"));
  objc_msgSend(v5, "setHorizontalGadgetDelegate:", self);
  objc_msgSend(v5, "setPrefersPagingEnabled:", self->_prefersPagingEnabled);
  objc_msgSend(v5, "setIsFixedHeight:", -[PXHorizontalCollectionGadgetProvider isFixedHeight](self, "isFixedHeight"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PXHorizontalCollectionGadgetProvider__createHorizontalGadget__block_invoke;
  v8[3] = &unk_1E5136338;
  v8[4] = self;
  objc_msgSend(v5, "performChanges:", v8);
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (unint64_t)headerStyle
{
  return self->_headerStyle;
}

- (void)setHeaderStyle:(unint64_t)a3
{
  self->_headerStyle = a3;
}

- (int64_t)defaultColumnSpan
{
  return self->_defaultColumnSpan;
}

- (NSDictionary)columnSpanForTraitCollection
{
  return self->_columnSpanForTraitCollection;
}

- (BOOL)prefersPagingEnabled
{
  return self->_prefersPagingEnabled;
}

- (BOOL)isFixedHeight
{
  return self->_isFixedHeight;
}

- (void)setIsFixedHeight:(BOOL)a3
{
  self->_isFixedHeight = a3;
}

- (PXGadgetProvider)contentGadgetProvider
{
  return self->_contentGadgetProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentGadgetProvider, 0);
  objc_storeStrong((id *)&self->_columnSpanForTraitCollection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_horizontalGadget, 0);
}

void __63__PXHorizontalCollectionGadgetProvider__createHorizontalGadget__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionTitle:", v4);

}

void __63__PXHorizontalCollectionGadgetProvider__updateHorizontalGadget__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

uint64_t __63__PXHorizontalCollectionGadgetProvider__updateHorizontalGadget__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllGadgets");
}

uint64_t __86__PXHorizontalCollectionGadgetProvider_horizontalCollectionGadgetDatasourceDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHorizontalGadget");
}

@end

@implementation _UIOutlineItemRenderer

- (_UIOutlineItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _UIOutlineItemRenderer *v14;
  objc_super v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIOutlineItemRenderer_initWithIdentifier_cellClass_handler___block_invoke;
  aBlock[3] = &unk_1E16EDA88;
  objc_copyWeak(&v19, &location);
  v10 = v9;
  v18 = v10;
  v11 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)_UIOutlineItemRenderer;
  v14 = -[_UIDiffableDataSourceItemRenderer initWithIdentifier:cellClass:handler:cellReuseIdentifier:](&v16, sel_initWithIdentifier_cellClass_handler_cellReuseIdentifier_, v8, a4, v11, v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_UIDiffableDataSourceItemRenderer rendererIdentifier](self, "rendererIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIDiffableDataSourceItemRenderer cellClass](self, "cellClass");
  -[_UIDiffableDataSourceItemRenderer handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = (void *)objc_msgSend(v4, "initWithIdentifier:cellClass:handler:", v5, v6, v8);

  return v9;
}

- (id)willUpdateCellHandler
{
  return self->_willUpdateCellHandler;
}

- (void)setWillUpdateCellHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willUpdateCellHandler, 0);
}

@end

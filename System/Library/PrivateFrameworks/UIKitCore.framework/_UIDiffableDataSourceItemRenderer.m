@implementation _UIDiffableDataSourceItemRenderer

- (_UIDiffableDataSourceItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5 cellReuseIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  _UIDiffableDataSourceItemRenderer *v14;
  _UIDiffableDataSourceItemRenderer *v15;
  void *v16;
  id handler;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_UIDiffableDataSourceItemRenderer;
  v14 = -[_UIDiffableDataSourceItemRenderer init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_rendererIdentifier, a3);
    objc_storeStrong((id *)&v15->_cellClass, a4);
    v16 = _Block_copy(v12);
    handler = v15->_handler;
    v15->_handler = v16;

    objc_storeStrong((id *)&v15->_cellReuseIdentifier, a6);
  }

  return v15;
}

- (_UIDiffableDataSourceItemRenderer)initWithIdentifier:(id)a3 cellClass:(Class)a4 handler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _UIDiffableDataSourceItemRenderer *v13;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_UIDiffableDataSourceItemRenderer initWithIdentifier:cellClass:handler:cellReuseIdentifier:](self, "initWithIdentifier:cellClass:handler:cellReuseIdentifier:", v10, a4, v9, v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id rendererIdentifier;
  Class cellClass;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  rendererIdentifier = self->_rendererIdentifier;
  cellClass = self->_cellClass;
  v7 = (void *)objc_msgSend(self->_handler, "copy");
  v8 = (void *)objc_msgSend(v4, "initWithIdentifier:cellClass:handler:cellReuseIdentifier:", rendererIdentifier, cellClass, v7, self->_cellReuseIdentifier);

  return v8;
}

- (id)rendererIdentifier
{
  return self->_rendererIdentifier;
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (NSString)cellReuseIdentifier
{
  return self->_cellReuseIdentifier;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_cellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_cellClass, 0);
  objc_storeStrong(&self->_rendererIdentifier, 0);
}

@end

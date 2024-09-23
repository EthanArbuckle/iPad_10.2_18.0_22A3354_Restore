@implementation _UIOMenuPreparationResponse

- (_UIOMenuPreparationResponse)initWithPreparedMenu:(id)a3
{
  void *v5;
  void *v6;
  _UIOMenuPreparationResponse *v7;
  void *v9;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOMenuPreparationAction.m"), 27, CFSTR("Menu could not be archived."));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forSetting:", v5, 0);
  v10.receiver = self;
  v10.super_class = (Class)_UIOMenuPreparationResponse;
  v7 = -[BSActionResponse initWithInfo:error:](&v10, sel_initWithInfo_error_, v6, 0);

  return v7;
}

- (UIMenu)preparedMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = objc_opt_class();
  -[BSActionResponse info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v7;
}

- (void)setPreparedMenu:(id)a3
{
  objc_storeStrong((id *)&self->_preparedMenu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedMenu, 0);
}

@end

@implementation _TUIMenuItemContainer

- (unint64_t)modelKind
{
  return 2;
}

- (_TUIMenuItemContainer)initWithModel:(id)a3
{
  id v5;
  _TUIMenuItemContainer *v6;
  _TUIMenuItemContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIMenuItemContainer;
  v6 = -[_TUIMenuItemContainer init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  id v6;
  TUIMenuItemModel *model;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  __objc2_prot *v12;

  v12 = (__objc2_prot *)a3;
  v6 = a4;
  model = self->_model;
  if (model)
    v8 = &OBJC_PROTOCOL___TUIMenuItemModel == v12;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(v6, "addObject:");
    model = self->_model;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMenuItemModel imageModel](model, "imageModel"));

  if (v9)
    v10 = &OBJC_PROTOCOL___TUIImageModel == v12;
  else
    v10 = 0;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMenuItemModel imageModel](self->_model, "imageModel"));
    objc_msgSend(v6, "addObject:", v11);

  }
}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (TUIMenuItemModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_parentModel);
}

@end

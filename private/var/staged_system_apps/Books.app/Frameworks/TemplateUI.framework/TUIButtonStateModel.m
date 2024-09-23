@implementation TUIButtonStateModel

- (TUIButtonStateModel)initWithTitle:(id)a3 image:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  TUIButtonStateModel *v8;
  BOOL v9;
  TUIButtonAttributes *v10;
  TUIButtonAttributes *attributes;
  objc_super v13;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIButtonStateModel;
  v8 = -[TUIButtonStateModel init](&v13, "init");
  if (v8)
    v9 = (v6 | v7) == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = -[TUIButtonAttributes initWithTitle:image:]([TUIButtonAttributes alloc], "initWithTitle:image:", v6, v7);
    attributes = v8->_attributes;
    v8->_attributes = v10;

  }
  return v8;
}

- (TUIButtonStateModel)initWithButtonAttributes:(id)a3 contentModel:(id)a4
{
  id v7;
  id v8;
  TUIButtonStateModel *v9;
  TUIButtonStateModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIButtonStateModel;
  v9 = -[TUIButtonStateModel init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributes, a3);
    objc_storeStrong((id *)&v10->_contentModel, a4);
  }

  return v10;
}

- (id)modelForButtonType:(unint64_t)a3 context:(id)a4
{
  id v6;
  TUIButtonStateModel *v7;
  uint64_t v8;
  void *v9;
  TUIButtonStateModel *v10;

  v6 = a4;
  v7 = self;
  v8 = objc_claimAutoreleasedReturnValue(-[TUIButtonAttributes attributesForButtonType:](v7->_attributes, "attributesForButtonType:", a3));
  v9 = (void *)v8;
  if (a3 && v7->_contentModel)
  {
    if (v8)
      v10 = -[TUIButtonStateModel initWithButtonAttributes:contentModel:]([TUIButtonStateModel alloc], "initWithButtonAttributes:contentModel:", v8, 0);
    else
      v10 = 0;

    objc_msgSend(v6, "reportError:", 1019);
    goto LABEL_9;
  }
  if ((TUIButtonAttributes *)v8 != v7->_attributes)
  {
    v10 = -[TUIButtonStateModel initWithButtonAttributes:contentModel:]([TUIButtonStateModel alloc], "initWithButtonAttributes:contentModel:", v8, v7->_contentModel);

LABEL_9:
    v7 = v10;
  }

  return v7;
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  -[TUIModel appendLayoutChildrenToArray:](self->_contentModel, "appendLayoutChildrenToArray:", a3);
}

- (void)appendLayoutModelsToArray:(id)a3
{
  -[TUIModel appendLayoutModelsToArray:](self->_contentModel, "appendLayoutModelsToArray:", a3);
}

- (void)appendContainedChildrenToArray:(id)a3
{
  TUIModel *contentModel;

  contentModel = self->_contentModel;
  if (contentModel)
    objc_msgSend(a3, "addObject:", contentModel);
}

- (void)onContainedModelsChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  objc_msgSend(WeakRetained, "onContainedModelsChanged");

}

- (void)updateModelChildren:(id)a3
{
  TUIModel *contentModel;
  id v5;
  TUIModel *v6;
  TUIModel *v7;

  contentModel = self->_contentModel;
  v5 = a3;
  -[TUIModel setParentModel:](contentModel, "setParentModel:", 0);
  v6 = (TUIModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = self->_contentModel;
  self->_contentModel = v6;

  -[TUIModel setParentModel:](self->_contentModel, "setParentModel:", self);
  -[TUIButtonStateModel onContainedModelsChanged](self, "onContainedModelsChanged");
}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (TUIButtonAttributes)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_contentModel, 0);
}

@end

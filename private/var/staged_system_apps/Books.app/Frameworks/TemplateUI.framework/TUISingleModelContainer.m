@implementation TUISingleModelContainer

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  -[TUIModel appendLayoutChildrenToArray:](self->_submodel, "appendLayoutChildrenToArray:", a3);
}

- (void)appendLayoutModelsToArray:(id)a3
{
  -[TUIModel appendLayoutModelsToArray:](self->_submodel, "appendLayoutModelsToArray:", a3);
}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObject:", self->_submodel);
}

- (void)onContainedModelsChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUISingleModelContainer parentModel](self, "parentModel"));
  objc_msgSend(v2, "onContainedModelsChanged");

}

- (void)updateModelChildren:(id)a3
{
  uint64_t v4;
  TUIModel *submodel;
  id obj;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  submodel = self->_submodel;
  obj = (id)v4;
  if ((TUIModel *)v4 != submodel)
  {
    -[TUIModel setParentModel:](submodel, "setParentModel:", 0);
    objc_storeStrong((id *)&self->_submodel, obj);
    -[TUIModel setParentModel:](self->_submodel, "setParentModel:", self);
    -[TUISingleModelContainer onContainedModelsChanged](self, "onContainedModelsChanged");
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

- (TUIModel)submodel
{
  return self->_submodel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodel, 0);
  objc_destroyWeak((id *)&self->_parentModel);
}

@end

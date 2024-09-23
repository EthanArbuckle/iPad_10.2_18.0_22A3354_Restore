@implementation TUIAdornmentModel

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
  TUIModel *submodel;

  submodel = self->_submodel;
  if (submodel)
    objc_msgSend(a3, "addObject:", submodel);
}

- (void)onContainedModelsChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIAdornmentModel parentModel](self, "parentModel"));
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
    -[TUIAdornmentModel onContainedModelsChanged](self, "onContainedModelsChanged");
  }

}

+ (unint64_t)adornmentRoleFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB898 != -1)
  {
    dispatch_once(&qword_2CB898, &stru_2424A0);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB890, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)adornmentKindFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB8A8 != -1)
  {
    dispatch_once(&qword_2CB8A8, &stru_2424C0);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB8A0, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
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

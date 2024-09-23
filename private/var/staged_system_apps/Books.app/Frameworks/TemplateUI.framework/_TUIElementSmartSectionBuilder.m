@implementation _TUIElementSmartSectionBuilder

- (void)addModel:(id)a3
{
  id v4;
  NSMutableArray *models;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  models = self->_models;
  v8 = v4;
  if (!models)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_models;
    self->_models = v6;

    v4 = v8;
    models = self->_models;
  }
  -[NSMutableArray addObject:](models, "addObject:", v4);

}

- (BOOL)supportAdornmentWithRole:(unint64_t)a3 kind:(unint64_t)a4
{
  BOOL v4;

  if (a4)
    v4 = 1;
  else
    v4 = a3 - 3 >= 2;
  return !v4;
}

- (id)finalizeModels
{
  return self->_models;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_TUIElementSmartSectionBuilder finalizeModels](self, "finalizeModels"));
  objc_msgSend(v5, "updateModelChildren:", v6);

}

- (void)finalizeModelsWithParent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_TUIElementSmartSectionBuilder finalizeModels](self, "finalizeModels"));
  objc_msgSend(v4, "updateModelChildren:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
}

@end

@implementation TUIModelContainer

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4;
  NSArray *submodels;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  submodels = self->_submodels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_828D4;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](submodels, "enumerateObjectsUsingBlock:", v7);

}

- (void)appendLayoutModelsToArray:(id)a3
{
  id v4;
  NSArray *submodels;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  submodels = self->_submodels;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8295C;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](submodels, "enumerateObjectsUsingBlock:", v7);

}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_submodels);
}

- (void)onContainedModelsChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIModelContainer parentModel](self, "parentModel"));
  objc_msgSend(v2, "onContainedModelsChanged");

}

- (void)updateModelChildren:(id)a3
{
  NSArray *submodels;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[5];

  submodels = self->_submodels;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](submodels, "enumerateObjectsUsingBlock:", &stru_240198);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  v7 = self->_submodels;
  self->_submodels = v6;

  v8 = self->_submodels;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_82A58;
  v9[3] = &unk_23DA88;
  v9[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v9);
  -[TUIModelContainer onContainedModelsChanged](self, "onContainedModelsChanged");
}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (NSArray)submodels
{
  return self->_submodels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodels, 0);
  objc_destroyWeak((id *)&self->_parentModel);
}

@end

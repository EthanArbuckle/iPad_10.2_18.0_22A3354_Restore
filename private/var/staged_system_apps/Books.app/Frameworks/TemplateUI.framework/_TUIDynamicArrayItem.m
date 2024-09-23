@implementation _TUIDynamicArrayItem

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutModelsToArray:(id)a3
{
  objc_msgSend(a3, "addObject:", self);
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4;
  NSArray *children;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_12A048;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

}

- (Class)layoutClass
{
  id v2;
  void *v3;
  void *v4;

  v2 = TUIAncestorBoxFromModel(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicArrayLayoutIterationClass"));

  return (Class)v4;
}

- (unint64_t)role
{
  return 0;
}

- (void)updateModelChildren:(id)a3
{
  NSArray *v4;
  NSArray *children;
  NSArray *v6;
  NSArray *v7;
  _QWORD v8[5];

  v4 = (NSArray *)a3;
  -[NSArray enumerateObjectsUsingBlock:](self->_children, "enumerateObjectsUsingBlock:", &stru_242130);
  children = self->_children;
  self->_children = v4;
  v7 = v4;

  v6 = self->_children;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_12A140;
  v8[3] = &unk_23DA88;
  v8[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);
  -[_TUIDynamicArrayItem onContainedModelsChanged](self, "onContainedModelsChanged");

}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_children);
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  NSArray *children;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  children = self->_children;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12A200;
  v11[3] = &unk_23DAB0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v11);

}

- (void)onContainedModelsChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayItem parentModel](self, "parentModel"));
  objc_msgSend(v2, "onContainedModelsChanged");

}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (unint64_t)instantiateResult
{
  return self->_instantiateResult;
}

- (void)setInstantiateResult:(unint64_t)a3
{
  self->_instantiateResult = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_children, 0);
}

@end

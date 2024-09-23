@implementation _TUIDynamicValueItem

- (_TUIDynamicValueItem)initWithEnumerator:(id)a3 binding:(id)a4 value:(id)a5 context:(id)a6 transactionCoordinator:(id)a7 dynamicController:(id)a8 nodes:(id)a9 snapshot:(id)a10 flags:(unint64_t)a11 builderClass:(Class)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  _TUIDynamicValueItem *v22;
  _TUIDynamicValueItem *v23;
  uint64_t v24;
  TUIDynamicValueInstance *instance;
  id v27;
  objc_super v28;

  v27 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v28.receiver = self;
  v28.super_class = (Class)_TUIDynamicValueItem;
  v22 = -[_TUIDynamicValueItem init](&v28, "init");
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_transactionCoordinator, v19);
    objc_storeWeak((id *)&v23->_dynamicController, v20);
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "instanceForObserver:", v23));
    instance = v23->_instance;
    v23->_instance = (TUIDynamicValueInstance *)v24;

    objc_storeStrong((id *)&v23->_snapshot, a10);
    v23->_enumerator.index = a3.var0;
    v23->_nodes = ($92066C5B8ED375D06BBF3B95346A0A30)a9;
    v23->_binding = ($8F956C3B7BF5D682F604C81DDB625920)a4;
    v23->_flags = a11;
    v23->_builderClass = a12;
    -[_TUIDynamicValueItem instantiateWithContext:](v23, "instantiateWithContext:", v18);
  }

  return v23;
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)updateModelChildren:(id)a3
{
  NSArray *children;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[5];

  children = self->_children;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", &stru_23E660);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  v7 = self->_children;
  self->_children = v6;

  v8 = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_363E4;
  v9[3] = &unk_23DA88;
  v9[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v9);
  -[_TUIDynamicValueItem onContainedModelsChanged](self, "onContainedModelsChanged");
}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_children);
}

- (void)appendLayoutModelsToArray:(id)a3
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
  v7[2] = sub_3647C;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

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
  v7[2] = sub_36504;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

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
  v11[2] = sub_365B4;
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

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_TUIDynamicValueItem parentModel](self, "parentModel"));
  objc_msgSend(v2, "onContainedModelsChanged");

}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  TUITransactionCoordinating **p_transactionCoordinator;
  id v6;
  id WeakRetained;
  _QWORD v8[5];

  p_transactionCoordinator = &self->_transactionCoordinator;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_transactionCoordinator);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_366BC;
  v8[3] = &unk_23E688;
  v8[4] = self;
  objc_msgSend(WeakRetained, "scheduleLayoutUpdateWithTransaction:block:", v6, v8);

}

- (void)instantiateWithContext:(id)a3
{
  id v4;
  TUIDynamicValueInstance *instance;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instance = self->_instance;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_36778;
  v7[3] = &unk_23E6B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[TUIDynamicValueInstance valueWithBlock:](instance, "valueWithBlock:", v7);

}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  return -[TUIDynamicValueInstance optimizeUpdatesForTransactionGroup:](self->_instance, "optimizeUpdatesForTransactionGroup:", a3);
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  return -[TUIDynamicValueInstance hasUpdatesForTransactionGroup:](self->_instance, "hasUpdatesForTransactionGroup:", a3);
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v7;
  id v8;
  TUIInstantiateContextSnapshot *snapshot;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  snapshot = self->_snapshot;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_368EC;
  v13[3] = &unk_23E2C8;
  v13[4] = self;
  v14 = v8;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v10, "evaluateWithSnapshot:block:", snapshot, v13);

  return self;
}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_dynamicController);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_instance, 0);
}

@end

@implementation _TUIDynamicArrayContainer

- (_TUIDynamicArrayContainer)initWithEnumerator:(id)a3 binding:(id)a4 array:(id)a5 context:(id)a6 transactionCoordinator:(id)a7 dynamicController:(id)a8 nodes:(id)a9 snapshot:(id)a10 options:(id)a11 flags:(unint64_t)a12 builderClass:(Class)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  _TUIDynamicArrayContainer *v23;
  _TUIDynamicArrayContainer *v24;
  uint64_t v25;
  TUIDynamicArrayInstance *instance;
  id obj;
  id v29;
  objc_super v30;

  v29 = a5;
  v19 = a6;
  obj = a7;
  v20 = a8;
  v21 = a10;
  v22 = a11;
  v30.receiver = self;
  v30.super_class = (Class)_TUIDynamicArrayContainer;
  v23 = -[_TUIDynamicArrayContainer init](&v30, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_transactionCoordinator, obj);
    objc_storeWeak((id *)&v24->_dynamicController, v20);
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "instanceForObserver:", v24));
    instance = v24->_instance;
    v24->_instance = (TUIDynamicArrayInstance *)v25;

    objc_storeStrong((id *)&v24->_snapshot, a10);
    v24->_enumerator.index = a3.var0;
    v24->_nodes = ($92066C5B8ED375D06BBF3B95346A0A30)a9;
    v24->_binding = ($8F956C3B7BF5D682F604C81DDB625920)a4;
    objc_storeStrong((id *)&v24->_options, a11);
    v24->_flags = a12;
    v24->_builderClass = a13;
    -[_TUIDynamicArrayContainer instantiateWithContext:](v24, "instantiateWithContext:", v19);
  }

  return v24;
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutModelsToArray:(id)a3
{
  objc_msgSend(a3, "addObject:", self);
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
  v11[2] = sub_7DA10;
  v11[3] = &unk_23DAB0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v11);

}

- (Class)layoutClass
{
  id v2;
  void *v3;
  void *v4;

  v2 = TUIAncestorBoxFromModel(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicArrayLayoutContainerClass"));

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
  -[NSArray enumerateObjectsUsingBlock:](self->_children, "enumerateObjectsUsingBlock:", &stru_23FFB8);
  children = self->_children;
  self->_children = v4;
  v7 = v4;

  v6 = self->_children;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7DB48;
  v8[3] = &unk_23DA88;
  v8[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);
  -[_TUIDynamicArrayContainer onContainedModelsChanged](self, "onContainedModelsChanged");

}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_children);
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
  v7[2] = sub_7DBE0;
  v7[3] = &unk_23DA88;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

}

- (BOOL)allowDynamicWindowInstantiation
{
  return 0;
}

- (void)onContainedModelsChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayContainer parentModel](self, "parentModel"));
  objc_msgSend(v2, "onContainedModelsChanged");

}

- (Class)dynamicArrayLayoutIterationClass
{
  id v2;
  void *v3;
  void *v4;

  v2 = TUIAncestorBoxFromModel(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicArrayLayoutIterationClass"));

  return (Class)v4;
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
  v8[2] = sub_7DCE4;
  v8[3] = &unk_23E688;
  v8[4] = self;
  objc_msgSend(WeakRetained, "scheduleLayoutUpdateWithTransaction:block:", v6, v8);

}

- (void)instantiateWithContext:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  TUIDynamicInstantiateOptions *options;
  id v8;
  NSUInteger v9;
  TUIDynamicArrayInstance *instance;
  NSMutableArray *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  NSMutableArray *v15;
  id v16;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = -[TUIDynamicArrayInstance count](self->_instance, "count");
  if ((self->_flags & 2) != 0)
  {
    options = self->_options;
    if (options)
    {
      if (-[TUIDynamicInstantiateOptions fetchInitial](options, "fetchInitial") != 0x7FFFFFFFFFFFFFFFLL)
        v6 = -[TUIDynamicInstantiateOptions fetchInitial](self->_options, "fetchInitial");
    }
  }
  v8 = -[TUIDynamicArrayInstance count](self->_instance, "count");
  if (v6 >= v8)
    v9 = (NSUInteger)v8;
  else
    v9 = (NSUInteger)v6;
  self->_instantiateWindow.location = 0;
  self->_instantiateWindow.length = v9;
  instance = self->_instance;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7DE3C;
  v13[3] = &unk_240008;
  v13[4] = self;
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v11 = v5;
  v12 = v4;
  -[TUIDynamicArrayInstance objectsInRange:block:](instance, "objectsInRange:block:", 0, v9, v13);
  -[_TUIDynamicArrayContainer updateModelChildren:](self, "updateModelChildren:", v11);

}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  unsigned int v5;
  BOOL v6;
  _BOOL4 v7;

  if ((-[TUIDynamicArrayInstance optimizeUpdatesForTransactionGroup:](self->_instance, "optimizeUpdatesForTransactionGroup:", a3) & 1) != 0)return 1;
  v5 = *((unsigned __int8 *)self + 104);
  v6 = (v5 & 7) == 0;
  v7 = (v5 >> 3) & 1;
  return !v6 || v7;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  return -[TUIDynamicArrayInstance hasUpdatesForTransactionGroup:](self->_instance, "hasUpdatesForTransactionGroup:", a3);
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  id v13;
  unsigned __int8 v14;
  TUIInstantiateContextSnapshot *snapshot;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  unsigned __int8 v24;

  v8 = a3;
  v9 = a4;
  v10 = TUIProtocolCast(&OBJC_PROTOCOL___TUIDynamicArrayLayout, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  if ((objc_opt_respondsToSelector(WeakRetained, "allowDynamicWindowInstantiation") & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_parentModel);
    v14 = objc_msgSend(v13, "allowDynamicWindowInstantiation");

  }
  else
  {
    v14 = 0;
  }

  snapshot = self->_snapshot;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_7E184;
  v20[3] = &unk_2400F8;
  v24 = v14;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v11;
  v16 = v11;
  v17 = v9;
  v18 = v8;
  objc_msgSend(v18, "evaluateWithSnapshot:block:", snapshot, v20);

  return self;
}

- (id)windowLowerLoadTriggerChildBoxFlipped:(BOOL)a3
{
  NSUInteger v5;
  NSUInteger location;
  BOOL v7;
  void *v8;
  void *v10;
  void *v11;
  id v12;

  v5 = -[TUIDynamicInstantiateOptions fetchPadding](self->_options, "fetchPadding");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (location = self->_instantiateWindow.location) == 0
    || (location + v5 != 0x7FFFFFFFFFFFFFFFLL ? (v7 = v5 >= self->_instantiateWindow.length) : (v7 = 1), v7))
  {
    v8 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_children, "objectAtIndexedSubscript:", v5));
    v11 = v10;
    if (a3)
      v12 = sub_7F954(v10);
    else
      v12 = sub_7F9B0(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  return v8;
}

- (id)windowLowerUnloadTriggerChildBoxFlipped:(BOOL)a3
{
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  BOOL v11;
  NSUInteger length;
  void *v13;
  void *v15;
  void *v16;
  id v17;

  v5 = -[TUIDynamicInstantiateOptions fetchPadding](self->_options, "fetchPadding");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v8 = -[TUIDynamicInstantiateOptions fetchDelta](self->_options, "fetchDelta") == 0x7FFFFFFFFFFFFFFFLL
       ? 1
       : -[TUIDynamicInstantiateOptions fetchDelta](self->_options, "fetchDelta");
    v9 = v8 + v7;
    if (v8 + v7 != 0x7FFFFFFFFFFFFFFFLL && v9 <= self->_instantiateWindow.length)
      v6 = v9 + self->_instantiateWindow.location - 1;
  }
  if (-[TUIDynamicInstantiateOptions fetchWindow](self->_options, "fetchWindow") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  v10 = self->_instantiateWindow.length + self->_instantiateWindow.location;
  if (v10 >= (unint64_t)-[TUIDynamicArrayInstance count](self->_instance, "count"))
  {
    length = self->_instantiateWindow.length;
    v11 = length <= -[TUIDynamicInstantiateOptions fetchWindow](self->_options, "fetchWindow");
  }
  else
  {
    v11 = 0;
  }
  v13 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && !v11)
  {
    if (-[TUIDynamicInstantiateOptions fetchWindow](self->_options, "fetchWindow") == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_15:
      v13 = 0;
      return v13;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_children, "objectAtIndexedSubscript:", v6 - self->_instantiateWindow.location));
    v16 = v15;
    if (a3)
      v17 = sub_7F9B0(v15);
    else
      v17 = sub_7F954(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v17);

  }
  return v13;
}

- (id)windowUpperLoadTriggerChildBoxFlipped:(BOOL)a3
{
  unint64_t v5;
  unint64_t v6;
  NSUInteger length;
  unint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;

  v5 = -[TUIDynamicInstantiateOptions fetchPadding](self->_options, "fetchPadding");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (v6 = v5, length = self->_instantiateWindow.length, v5 >= length)
    || (v8 = self->_instantiateWindow.location + length,
        v8 >= (unint64_t)-[TUIDynamicArrayInstance count](self->_instance, "count"))
    || self->_instantiateWindow.location + self->_instantiateWindow.length + ~v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_children, "objectAtIndexedSubscript:", self->_instantiateWindow.length + ~v6));
    v12 = v11;
    if (a3)
      v13 = sub_7F9B0(v11);
    else
      v13 = sub_7F954(v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  return v9;
}

- (id)windowUpperUnloadTriggerChildBoxFlipped:(BOOL)a3
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger length;
  BOOL v11;
  NSUInteger v12;
  BOOL v13;
  NSUInteger v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;

  v5 = -[TUIDynamicInstantiateOptions fetchPadding](self->_options, "fetchPadding");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v8 = -[TUIDynamicInstantiateOptions fetchDelta](self->_options, "fetchDelta") == 0x7FFFFFFFFFFFFFFFLL
       ? 1
       : -[TUIDynamicInstantiateOptions fetchDelta](self->_options, "fetchDelta");
    v9 = v8 + v7;
    if (v8 + v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      length = self->_instantiateWindow.length;
      v11 = length >= v9;
      v12 = length - v9;
      if (v12 != 0 && v11)
        v6 = v12 + self->_instantiateWindow.location;
    }
  }
  if (-[TUIDynamicInstantiateOptions fetchWindow](self->_options, "fetchWindow") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_16;
  if (self->_instantiateWindow.location)
  {
    v13 = 0;
  }
  else
  {
    v14 = self->_instantiateWindow.length;
    v13 = v14 <= -[TUIDynamicInstantiateOptions fetchWindow](self->_options, "fetchWindow");
  }
  v15 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && !v13)
  {
    if (-[TUIDynamicInstantiateOptions fetchWindow](self->_options, "fetchWindow") == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_16:
      v15 = 0;
      return v15;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_children, "objectAtIndexedSubscript:", v6 - self->_instantiateWindow.location));
    v18 = v17;
    if (a3)
      v19 = sub_7F954(v17);
    else
      v19 = sub_7F9B0(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v19);

  }
  return v15;
}

- (_NSRange)windowRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_instantiateWindow.length;
  location = self->_instantiateWindow.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)windowLowerLoadTriggered
{
  _TUIDynamicArrayContainer *v2;
  id WeakRetained;

  if ((*((_BYTE *)self + 104) & 1) != 0)
    return 0;
  v2 = self;
  *((_BYTE *)self + 104) |= 1u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "invalidateInstantiation:", v2);

  return (char)v2;
}

- (BOOL)windowUpperLoadTriggered
{
  _TUIDynamicArrayContainer *v2;
  id WeakRetained;

  if ((*((_BYTE *)self + 104) & 2) != 0)
    return 0;
  v2 = self;
  *((_BYTE *)self + 104) |= 2u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "invalidateInstantiation:", v2);

  return (char)v2;
}

- (BOOL)windowLowerUnloadTriggered
{
  _TUIDynamicArrayContainer *v2;
  id WeakRetained;

  if ((*((_BYTE *)self + 104) & 4) != 0)
    return 0;
  v2 = self;
  *((_BYTE *)self + 104) |= 4u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "invalidateInstantiation:", v2);

  return (char)v2;
}

- (BOOL)windowUpperUnloadTriggered
{
  _TUIDynamicArrayContainer *v2;
  id WeakRetained;

  if ((*((_BYTE *)self + 104) & 8) != 0)
    return 0;
  v2 = self;
  *((_BYTE *)self + 104) |= 8u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "invalidateInstantiation:", v2);

  return (char)v2;
}

- (unint64_t)windowCount
{
  return (unint64_t)-[TUIDynamicArrayInstance count](self->_instance, "count");
}

- (double)estimatedWidth
{
  return self->_estimatedWidth;
}

- (void)setEstimatedWidth:(double)a3
{
  self->_estimatedWidth = a3;
}

- (double)estimatedHeight
{
  return self->_estimatedHeight;
}

- (void)setEstimatedHeight:(double)a3
{
  self->_estimatedHeight = a3;
}

- (double)estimatedHeightAbovePivot
{
  return self->_estimatedHeightAbovePivot;
}

- (void)setEstimatedHeightAbovePivot:(double)a3
{
  self->_estimatedHeightAbovePivot = a3;
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_dynamicController);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end

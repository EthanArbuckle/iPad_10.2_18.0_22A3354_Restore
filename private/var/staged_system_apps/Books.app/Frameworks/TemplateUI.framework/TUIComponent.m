@implementation TUIComponent

- (TUIComponent)initWithModel:(shared_ptr<const TUI:(id)a4 :Model::Component>)a3 identifier:
{
  __shared_weak_count *cntrl;
  uint64_t *ptr;
  __shared_weak_count *v7;
  TUIComponent *v8;
  TUIComponent *v9;
  objc_super v11;

  cntrl = a3.__cntrl_;
  ptr = (uint64_t *)a3.__ptr_;
  v7 = a3.__cntrl_;
  v11.receiver = self;
  v11.super_class = (Class)TUIComponent;
  v8 = -[TUIComponent init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    sub_26314(&v8->_model.__ptr_, ptr);
    objc_storeStrong((id *)&v9->_identifier, cntrl);
    v9->_flags = ($AA655BFBBE6AB2FAC50FEA720D47B75E)(*((unsigned __int8 *)&v9->_flags + 3) << 24);
  }

  return v9;
}

- (shared_ptr<const)model
{
  Component **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<const TUI::Model::Component> result;

  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (Component *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Component *)self;
  return result;
}

- (void)updateModel:(shared_ptr<const TUI::Model::Component>)a3
{
  sub_26314(&self->_model.__ptr_, (uint64_t *)a3.__ptr_);
}

- (id)describeWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "package"));
  LODWORD(self) = TUI::Package::Buffer::nameForComponent(objc_msgSend(v4, "packageBuffer"), *((_QWORD *)self->_model.__ptr_ + 5));
  v5 = TUI::Symbol::Tab::string((TUI::Symbol::Tab *)objc_msgSend(v4, "symtab"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  Component *ptr;
  id *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  id WeakRetained;
  unint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  TUIComponent *v19;

  v6 = a3;
  v7 = a4;
  ptr = self->_model.__ptr_;
  v9 = (id *)ptr[13];
  v10 = (std::__shared_weak_count *)ptr[14];
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    WeakRetained = objc_loadWeakRetained(v9);
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(v9);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "transactionCoordinator"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_C7248;
  v17[3] = &unk_241078;
  v16 = WeakRetained;
  v18 = v16;
  v19 = self;
  objc_msgSend(v15, "scheduleLayoutUpdateWithTransaction:block:", v7, v17);

}

- (unint64_t)modelKind
{
  return 0;
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
  v7[2] = sub_C7348;
  v7[3] = &unk_2410A0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

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
  v7[2] = sub_C73EC;
  v7[3] = &unk_2410A0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);

}

- (void)onContainedModelsChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  objc_msgSend(WeakRetained, "onContainedModelsChanged");

}

- (void)updateModelChildren:(id)a3
{
  NSArray *children;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  -[NSArray enumerateObjectsUsingBlock:](self->_children, "enumerateObjectsUsingBlock:", &stru_2410C0);
  objc_storeStrong((id *)&self->_children, a3);
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C7508;
  v7[3] = &unk_2410A0;
  v7[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v7);
  -[TUIComponent onContainedModelsChanged](self, "onContainedModelsChanged");

}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)self->_model.__ptr_ + 9);
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "optimizeUpdatesForTransactionGroup:", v4, (_QWORD)v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v6 & 1;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)self->_model.__ptr_ + 9);
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "hasUpdatesForTransactionGroup:", v4, (_QWORD)v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v6 & 1;
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = a3;
  v8 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = *((id *)self->_model.__ptr_ + 9);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12);
        while ((objc_msgSend(v13, "applyUpdatesForTransactionGroup:", v8, (_QWORD)v15) & 1) != 0)
          ;
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "updateComponentBody:", self);
  return self;
}

- (unint64_t)directEnvironmentUseMask
{
  return (unint64_t)self->_flags;
}

- (void)setDirectEnvironmentUseMask:(unint64_t)a3
{
  *(_BYTE *)&self->_flags = a3;
}

- (unint64_t)descendentEnvironmentUseMask
{
  return *((unsigned __int8 *)&self->_flags + 1);
}

- (void)setDescendentEnvironmentUseMask:(unint64_t)a3
{
  *((_BYTE *)&self->_flags + 1) = a3;
}

- (unint64_t)globalsEnvironmentUseMask
{
  return *((unsigned __int8 *)&self->_flags + 2);
}

- (void)setGlobalsEnvironmentUseMask:(unint64_t)a3
{
  *((_BYTE *)&self->_flags + 2) = a3;
}

- (BOOL)validateGlobalsWithContext:(id)a3
{
  return _objc_msgSend(a3, "updateComponentGlobals:", self);
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
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
  objc_storeStrong((id *)&self->_identifier, 0);
  sub_148E8((uint64_t)&self->_model);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_transactionCoordinator, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end

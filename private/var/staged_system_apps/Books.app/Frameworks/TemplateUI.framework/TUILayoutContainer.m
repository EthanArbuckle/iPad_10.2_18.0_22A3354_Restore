@implementation TUILayoutContainer

- (TUILayoutContainer)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUILayoutContainer *v12;
  TUILayoutContainer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUILayoutContainer;
  v12 = -[TUILayoutContainer init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    objc_storeWeak((id *)&v13->_parent, v10);
    objc_storeWeak((id *)&v13->_controller, v11);
  }

  return v13;
}

- (void)updateParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)isLayout
{
  return 0;
}

- (id)layout
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layout"));

  return v3;
}

- (void)onContainersUpdated
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_msgSend(WeakRetained, "onContainersUpdated");

}

- (void)onChildInvalidate:(id)a3
{
  TUILayoutContaining **p_parent;
  id v4;
  id WeakRetained;

  p_parent = &self->_parent;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "onChildInvalidate:", v4);

}

- (void)onChildRenderModelInvalidate:(id)a3
{
  TUILayoutContaining **p_parent;
  id v4;
  id WeakRetained;

  p_parent = &self->_parent;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "onChildRenderModelInvalidate:", v4);

}

- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate
{
  return 1;
}

- (void)onChildInvalidateIntrinsicSize:(id)a3
{
  TUILayoutContaining **p_parent;
  id v4;
  id WeakRetained;

  p_parent = &self->_parent;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "onChildInvalidateIntrinsicSize:", v4);

}

- (void)onChildTransformedSizeDidChange:(id)a3
{
  TUILayoutContaining **p_parent;
  id v4;
  id WeakRetained;

  p_parent = &self->_parent;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend(WeakRetained, "onChildTransformedSizeDidChange:", v4);

}

- (BOOL)isDescendentOfLayout:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer parent](self, "parent"));
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutContainer parent](self, "parent"));
    v7 = objc_msgSend(v6, "isDescendentOfLayout:", v4);

  }
  return v7;
}

- (void)notifyChildrenScaleDidChange
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_containers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), "onComputedScaleDidChange", (_QWORD)v6);
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)enumerateChildren:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_containers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "enumerateLayout:", v4, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (TUIModelLayoutable)model
{
  return self->_model;
}

- (TUILayoutContaining)parent
{
  return (TUILayoutContaining *)objc_loadWeakRetained((id *)&self->_parent);
}

- (TUILayoutController)controller
{
  return (TUILayoutController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (BOOL)invalidChildren
{
  return self->_invalidChildren;
}

- (void)setInvalidChildren:(BOOL)a3
{
  self->_invalidChildren = a3;
}

- (BOOL)layoutIsInvalid
{
  return self->_layoutIsInvalid;
}

- (NSArray)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_model, 0);
}

@end

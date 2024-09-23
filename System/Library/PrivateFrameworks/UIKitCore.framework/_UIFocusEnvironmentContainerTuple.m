@implementation _UIFocusEnvironmentContainerTuple

- (_UIFocusEnvironmentContainerTuple)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _UIFocusEnvironmentContainerTuple *v12;
  _UIFocusEnvironmentContainerTuple *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusItemContainer.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusItemContainer.m"), 400, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemContainer != nil"));

LABEL_3:
  objc_msgSend(v8, "focusItemContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusItemContainer.m"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment.focusItemContainer == itemContainer"));

  }
  v18.receiver = self;
  v18.super_class = (Class)_UIFocusEnvironmentContainerTuple;
  v12 = -[_UIFocusEnvironmentContainerTuple init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_itemContainer, a4);
    v13->_isScrollableContainer = _UIFocusItemContainerIsScrollableContainer(v10);
  }

  return v13;
}

+ (id)tupleWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOwningEnvironment:itemContainer:", v7, v6);

  return v8;
}

+ (id)tupleWithRequiredContainerFromEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "focusItemContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tupleWithOwningEnvironment:itemContainer:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqualToEnvironmentContainerTuple:(id)a3
{
  _QWORD *v4;
  UIFocusEnvironment *owningEnvironment;
  UIFocusItemContainer *itemContainer;
  UIFocusItemContainer *v7;
  UIFocusEnvironment *v8;
  _BYTE *v9;
  BOOL v11;
  unint64_t v14;
  NSObject *v15;
  _UIFocusEnvironmentContainerTuple *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  __CFString *v33;
  UIFocusEnvironment *v34;
  UIFocusItemContainer *v35;
  UIFocusItemContainer *v36;
  UIFocusEnvironment *v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  owningEnvironment = self->_owningEnvironment;
  itemContainer = self->_itemContainer;
  v8 = (UIFocusEnvironment *)v4[2];
  v7 = (UIFocusItemContainer *)v4[3];
  v9 = (_BYTE *)qword_1ECD7D978;
  if (!qword_1ECD7D978)
  {
    v9 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v9, (unint64_t *)&qword_1ECD7D978);
  }
  if ((*v9 & 1) != 0 && itemContainer == v7 && owningEnvironment != v8)
  {
    v14 = qword_1ECD7D980;
    if (!qword_1ECD7D980)
    {
      v14 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1ECD7D980);
    }
    v15 = *(id *)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v7;
      v37 = v8;
      v34 = owningEnvironment;
      v35 = itemContainer;
      v16 = self;
      -[_UIFocusEnvironmentContainerTuple itemContainer](self, "itemContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = CFSTR("(nil)");
      }
      v22 = v21;
      -[_UIFocusEnvironmentContainerTuple owningEnvironment](v16, "owningEnvironment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v23);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = CFSTR("(nil)");
      }
      v28 = v27;
      objc_msgSend(v4, "owningEnvironment");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p>"), v32, v29);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v33 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412802;
      v39 = v22;
      v40 = 2112;
      v41 = v28;
      v42 = 2112;
      v43 = v33;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "Warning: encountered a single UIFocusItemContainer: %@ yielded by two mismatched owning UIFocusEnvironments: %@ and %@. UIFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);

      owningEnvironment = v34;
      itemContainer = v35;
      v7 = v36;
      v8 = v37;
    }

  }
  v11 = owningEnvironment == v8 && itemContainer == v7;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v6 = v4
    && (v5 = objc_opt_class(), v5 == objc_opt_class())
    && -[_UIFocusEnvironmentContainerTuple isEqualToEnvironmentContainerTuple:](self, "isEqualToEnvironmentContainerTuple:", v4);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_UIFocusEnvironmentContainerTuple owningEnvironment](self, "owningEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_UIFocusEnvironmentContainerTuple itemContainer](self, "itemContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; owningEnvironment: %@; itemContainer: %@>"),
    v5,
    self,
    self->_owningEnvironment,
    self->_itemContainer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (UIFocusItemContainer)itemContainer
{
  return self->_itemContainer;
}

- (BOOL)isScrollableContainer
{
  return self->_isScrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end

@implementation _UIFocusEnvironmentScrollableContainerTuple

- (_UIFocusEnvironmentScrollableContainerTuple)initWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _UIFocusEnvironmentScrollableContainerTuple *v12;
  _UIFocusEnvironmentScrollableContainerTuple *v13;
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusItemContainer.m"), 463, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusItemContainer.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollableContainer != nil"));

LABEL_3:
  objc_msgSend(v8, "focusItemContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusItemContainer.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment.focusItemContainer == scrollableContainer"));

  }
  v18.receiver = self;
  v18.super_class = (Class)_UIFocusEnvironmentScrollableContainerTuple;
  v12 = -[_UIFocusEnvironmentScrollableContainerTuple init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_owningEnvironment, a3);
    objc_storeStrong((id *)&v13->_scrollableContainer, a4);
  }

  return v13;
}

+ (_UIFocusEnvironmentScrollableContainerTuple)tupleWithOwningEnvironment:(id)a3 scrollableContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOwningEnvironment:scrollableContainer:", v7, v6);

  return (_UIFocusEnvironmentScrollableContainerTuple *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  _BYTE *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 || (v5 = objc_opt_class(), v5 != objc_opt_class()))
  {
    v6 = 0;
    goto LABEL_11;
  }
  v7 = v4;
  v8 = (_BYTE *)qword_1ECD7D988;
  if (!qword_1ECD7D988)
  {
    v8 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v8, (unint64_t *)&qword_1ECD7D988);
  }
  if ((*v8 & 1) != 0)
  {
    -[_UIFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollableContainer");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      -[_UIFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "owningEnvironment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 == v17)
        goto LABEL_7;
      v18 = qword_1ECD7D990;
      if (!qword_1ECD7D990)
      {
        v18 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD7D990);
      }
      v14 = *(id *)(v18 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[_UIFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v35);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = CFSTR("(nil)");
        }
        v23 = v22;
        -[_UIFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p>"), v27, v24);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v28 = CFSTR("(nil)");
        }
        v29 = v28;
        objc_msgSend(v7, "owningEnvironment");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = (void *)MEMORY[0x1E0CB3940];
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@: %p>"), v33, v30);
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v34 = CFSTR("(nil)");
        }
        *(_DWORD *)buf = 138412802;
        v37 = v23;
        v38 = 2112;
        v39 = v29;
        v40 = 2112;
        v41 = v34;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Warning: encountered a single UIFocusItemContainer: %@ yielded by two mismatched owning UIFocusEnvironments: %@ and %@. UIFocusItemContainer should be 1:1 with its owning environment.", buf, 0x20u);

      }
    }
    else
    {

    }
  }
LABEL_7:
  -[_UIFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "owningEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {
    -[_UIFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollableContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 == v12;

  }
  else
  {
    v6 = 0;
  }

LABEL_11:
  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_UIFocusEnvironmentScrollableContainerTuple owningEnvironment](self, "owningEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_UIFocusEnvironmentScrollableContainerTuple scrollableContainer](self, "scrollableContainer");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; owningEnvironment: %@; scrollableContainer: %@>"),
    v5,
    self,
    self->_owningEnvironment,
    self->_scrollableContainer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (UIFocusItemScrollableContainer)scrollableContainer
{
  return self->_scrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
}

@end

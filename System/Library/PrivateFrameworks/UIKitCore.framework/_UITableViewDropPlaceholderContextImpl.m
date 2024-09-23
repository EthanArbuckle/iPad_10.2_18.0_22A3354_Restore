@implementation _UITableViewDropPlaceholderContextImpl

- (_UITableViewDropPlaceholderContextImpl)initWithDelegate:(id)a3 dragItem:(id)a4 reuseIdentifier:(id)a5 rowHeight:(double)a6 cellUpdateHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _UITableViewDropPlaceholderContextImpl *v16;
  _UITableViewDropPlaceholderContextImpl *v17;
  uint64_t v18;
  id cellUpdateHandler;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_UITableViewDropPlaceholderContextImpl;
  v16 = -[_UITableViewDropPlaceholderContextImpl init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v12);
    objc_storeStrong((id *)&v17->_dragItem, a4);
    objc_storeStrong((id *)&v17->_reuseIdentifier, a5);
    v17->_rowHeight = a6;
    v18 = objc_msgSend(v15, "copy");
    cellUpdateHandler = v17->_cellUpdateHandler;
    v17->_cellUpdateHandler = (id)v18;

  }
  return v17;
}

- (void)addAnimations:(id)a3
{
  id v5;
  int has_internal_diagnostics;
  UIDragAnimating *animator;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  animator = self->_animator;
  if (has_internal_diagnostics)
  {
    if (!animator)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_12:

        goto LABEL_3;
      }
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v9;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "The animator should always be non-nil when %@ is called", (uint8_t *)&v12, 0xCu);
LABEL_11:

      goto LABEL_12;
    }
  }
  else if (!animator)
  {
    v10 = addAnimations____s_category;
    if (!addAnimations____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&addAnimations____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v8 = v11;
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "The animator should always be non-nil when %@ is called", (uint8_t *)&v12, 0xCu);
      goto LABEL_11;
    }
  }
LABEL_3:
  -[UIDragAnimating addAnimations:](self->_animator, "addAnimations:", v5);

}

- (void)addCompletion:(id)a3
{
  id v5;
  int has_internal_diagnostics;
  UIDragAnimating *animator;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  animator = self->_animator;
  if (has_internal_diagnostics)
  {
    if (!animator)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_12:

        goto LABEL_3;
      }
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v9;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "The animator should always be non-nil when %@ is called", (uint8_t *)&v12, 0xCu);
LABEL_11:

      goto LABEL_12;
    }
  }
  else if (!animator)
  {
    v10 = addCompletion____s_category;
    if (!addCompletion____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&addCompletion____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v8 = v11;
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "The animator should always be non-nil when %@ is called", (uint8_t *)&v12, 0xCu);
      goto LABEL_11;
    }
  }
LABEL_3:
  -[UIDragAnimating addCompletion:](self->_animator, "addCompletion:", v5);

}

- (BOOL)commitInsertionWithDataSourceUpdates:(id)a3
{
  id v5;
  id WeakRetained;
  char v7;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 406, CFSTR("Must provide a block of data source updates to run when committing the insertion of a placeholder."));

  }
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 409, CFSTR("%@ must be called from the main queue!"), v11);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "commitPlaceholderInsertionWithContext:dataSourceUpdates:", self, v5);

  return v7;
}

- (BOOL)deletePlaceholder
{
  id WeakRetained;
  char v5;
  void *v7;
  void *v8;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropCoordinator.m"), 417, CFSTR("%@ must be called from the main queue!"), v8);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "deletePlaceholder:", self);

  return v5;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_reuseIdentifier, a3);
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (id)cellUpdateHandler
{
  return self->_cellUpdateHandler;
}

- (void)setCellUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIDragAnimating)_animator
{
  return self->_animator;
}

- (void)_setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (NSUUID)_shadowUpdateIdentifier
{
  return self->_shadowUpdateIdentifier;
}

- (void)_setShadowUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shadowUpdateIdentifier, a3);
}

- (_UITableViewPlaceholderContextDelegate)delegate
{
  return (_UITableViewPlaceholderContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
  objc_storeStrong((id *)&self->_dragItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shadowUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong(&self->_cellUpdateHandler, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
}

@end

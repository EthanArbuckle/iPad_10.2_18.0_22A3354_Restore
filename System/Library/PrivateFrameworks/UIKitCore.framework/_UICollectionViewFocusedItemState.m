@implementation _UICollectionViewFocusedItemState

- (_QWORD)copyWithReusableView:(_QWORD *)a1
{
  id v3;
  void *v4;
  _QWORD *v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((id)a1[1] == v3)
      v5 = a1;
    else
      v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReusableView:indexPath:elementKind:viewType:", v3, a1[2], a1[3], a1[4]);
    a1 = v5;
  }

  return a1;
}

+ (_UICollectionViewFocusedItemState)stateWithReusableView:(id)a3 indexPath:(id)a4 elementKind:(id)a5 viewType:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UICollectionViewFocusedItemState.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reusableView != nil"));

  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithReusableView:indexPath:elementKind:viewType:", v11, v12, v13, a6);

  return (_UICollectionViewFocusedItemState *)v14;
}

+ (id)stateWithIndexPath:(void *)a3 elementKind:(uint64_t)a4 viewType:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithReusableView:indexPath:elementKind:viewType:", 0, v7, v6, a4);

  return v8;
}

+ (id)stateWithLayoutAttributes:(uint64_t)a1
{
  id v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v2 = a2;
  v3 = (objc_class *)objc_opt_self();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_stateWithLayoutAttributes_, v3, CFSTR("_UICollectionViewFocusedItemState.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutAttributes"));

  }
  v4 = [v3 alloc];
  objc_msgSend(v2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items]((id *)v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "representedElementCategory");

  v8 = (void *)objc_msgSend(v4, "initWithReusableView:indexPath:elementKind:viewType:", 0, v5, v6, v7);
  return v8;
}

+ (id)stateWithReusableView:(uint64_t)a1
{
  id v2;
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v2 = a2;
  v3 = (objc_class *)objc_opt_self();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_stateWithReusableView_, v3, CFSTR("_UICollectionViewFocusedItemState.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reusableView != nil"));

  }
  objc_msgSend(v2, "_layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [v3 alloc];
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items]((id *)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithReusableView:indexPath:elementKind:viewType:", v2, v6, v7, objc_msgSend(v4, "representedElementCategory"));

  return v8;
}

+ (id)stateWithReusableView:(void *)a3 overrideIndexPath:
{
  id v4;
  id v5;
  objc_class *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = a2;
  v6 = (objc_class *)objc_opt_self();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_stateWithReusableView_overrideIndexPath_, v6, CFSTR("_UICollectionViewFocusedItemState.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reusableView != nil"));

    if (v4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_stateWithReusableView_overrideIndexPath_, v6, CFSTR("_UICollectionViewFocusedItemState.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("overrideIndexPath != nil"));

    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "_layoutAttributes");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  v8 = [v6 alloc];
  -[UIBarButtonItemGroup _items](v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithReusableView:indexPath:elementKind:viewType:", v5, v4, v9, objc_msgSend(v7, "representedElementCategory"));

  return v10;
}

- (_UICollectionViewFocusedItemState)initWithReusableView:(id)a3 indexPath:(id)a4 elementKind:(id)a5 viewType:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  _UICollectionViewFocusedItemState *v15;
  _UICollectionViewFocusedItemState *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewFocusedItemState.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reusableView == nil || [reusableView isKindOfClass:[UICollectionReusableView class]]"));

    if (v13)
    {
LABEL_4:
      if (v14)
        goto LABEL_5;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewFocusedItemState.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind != nil"));

      if (!v12)
        goto LABEL_9;
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewFocusedItemState.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

  if (!v14)
    goto LABEL_14;
LABEL_5:
  if (!v12)
    goto LABEL_9;
LABEL_6:
  if (!a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewFocusedItemState.m"), 52, CFSTR("Invalid view for view type cell: %@"), v23);

    }
  }
LABEL_9:
  v24.receiver = self;
  v24.super_class = (Class)_UICollectionViewFocusedItemState;
  v15 = -[_UICollectionViewFocusedItemState init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_reusableView, a3);
    objc_storeStrong((id *)&v16->_indexPath, a4);
    objc_storeStrong((id *)&v16->_elementKind, a5);
    v16->_viewType = a6;
  }

  return v16;
}

- (_QWORD)copyWithIndexPath:(int)a3 preservingReusableView:
{
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_copyWithIndexPath_preservingReusableView_, a1, CFSTR("_UICollectionViewFocusedItemState.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    }
    if (a1[1] || !objc_msgSend(v6, "isEqual:", a1[2]))
    {
      v8 = objc_alloc((Class)objc_opt_class());
      if (a3)
        v9 = a1[1];
      else
        v9 = 0;
      v7 = (_QWORD *)objc_msgSend(v8, "initWithReusableView:indexPath:elementKind:viewType:", v9, v6, a1[3], a1[4]);
    }
    else
    {
      v7 = a1;
    }
    a1 = v7;
  }

  return a1;
}

- (_QWORD)cell
{
  _QWORD *v1;
  void *v2;
  objc_class *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    if (a1[1])
    {
      if (a1[4] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", sel_cell, v1, CFSTR("_UICollectionViewFocusedItemState.m"), 97, CFSTR("Expected a kind of UICollectionViewCell but found %@."), v4);

      }
    }
    a1 = (id)v1[1];
  }
  return a1;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("indexPath"), self->_indexPath);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("elementKind"), self->_elementKind);
  _UIStringFromCollectionElementCategory(self->_viewType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("viewType"), v6);

  if (self->_reusableView)
    v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("reusableView"));
  objc_msgSend(v3, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementKind, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_reusableView, 0);
}

@end

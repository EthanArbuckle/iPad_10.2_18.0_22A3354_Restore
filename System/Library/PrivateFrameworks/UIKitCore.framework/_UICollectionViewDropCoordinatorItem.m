@implementation _UICollectionViewDropCoordinatorItem

- (_UICollectionViewDropCoordinatorItem)initWithDestinationIndexPath:(id)a3 dragItem:(id)a4
{
  id v7;
  id v8;
  _UICollectionViewDropCoordinatorItem *v9;
  _UICollectionViewDropCoordinatorItem *v10;
  _UICollectionViewDropCoordinatorItem *v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  _UIDropAnimationHandlers *v18;
  _UIDropAnimationHandlers *animationHandlers;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_UICollectionViewDropCoordinatorItem;
  v9 = -[_UICollectionViewDropCoordinatorItem init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_kind = 0;
    objc_storeStrong((id *)&v9->_destinationIndexPath, a3);
    objc_storeWeak((id *)&v10->_dragItem, v8);
    v11 = v10;
    WeakRetained = objc_loadWeakRetained((id *)&v10->_dragItem);
    objc_msgSend(WeakRetained, "_visibleDropItemSize");
    v14 = v13;
    v16 = v15;

    v17 = v14 != *MEMORY[0x1E0C9D820];
    if (v16 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v17 = 1;
    v11->_shouldRemainInHierarchy = v17;
    v18 = objc_alloc_init(_UIDropAnimationHandlers);
    animationHandlers = v11->_animationHandlers;
    v11->_animationHandlers = v18;

  }
  return v10;
}

- (_UICollectionViewDropCoordinatorItem)initWithDragItem:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  _UICollectionViewDropCoordinatorItem *v8;
  _UICollectionViewDropCoordinatorItem *v9;
  uint64_t v10;
  UIDragPreviewTarget *target;
  _UICollectionViewDropCoordinatorItem *v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  _UIDropAnimationHandlers *v19;
  _UIDropAnimationHandlers *animationHandlers;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_UICollectionViewDropCoordinatorItem;
  v8 = -[_UICollectionViewDropCoordinatorItem init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_kind = 1;
    v10 = objc_msgSend(v7, "copy");
    target = v9->_target;
    v9->_target = (UIDragPreviewTarget *)v10;

    objc_storeWeak((id *)&v9->_dragItem, v6);
    v12 = v9;
    WeakRetained = objc_loadWeakRetained((id *)&v9->_dragItem);
    objc_msgSend(WeakRetained, "_visibleDropItemSize");
    v15 = v14;
    v17 = v16;

    v18 = v15 != *MEMORY[0x1E0C9D820];
    if (v17 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v18 = 1;
    v12->_shouldRemainInHierarchy = v18;
    v19 = objc_alloc_init(_UIDropAnimationHandlers);
    animationHandlers = v12->_animationHandlers;
    v12->_animationHandlers = v19;

  }
  return v9;
}

- (_UICollectionViewDropCoordinatorItem)initWithDestinationIndexPath:(id)a3 dragItem:(id)a4 placeholderConfiguration:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UICollectionViewDropCoordinatorItem *v12;
  _UICollectionViewDropCoordinatorItem *v13;
  void *v14;
  uint64_t v15;
  id previewParametersProvider;
  _UICollectionViewDropCoordinatorItem *v17;
  id WeakRetained;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  _UIDropAnimationHandlers *v24;
  _UIDropAnimationHandlers *animationHandlers;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)_UICollectionViewDropCoordinatorItem;
  v12 = -[_UICollectionViewDropCoordinatorItem init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_kind = 2;
    objc_msgSend(v11, "previewParametersProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    previewParametersProvider = v13->_previewParametersProvider;
    v13->_previewParametersProvider = (id)v15;

    objc_storeWeak((id *)&v13->_dragItem, v10);
    objc_storeStrong((id *)&v13->_destinationIndexPath, a3);
    v17 = v13;
    WeakRetained = objc_loadWeakRetained((id *)&v13->_dragItem);
    objc_msgSend(WeakRetained, "_visibleDropItemSize");
    v20 = v19;
    v22 = v21;

    v23 = v20 != *MEMORY[0x1E0C9D820];
    if (v22 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v23 = 1;
    v17->_shouldRemainInHierarchy = v23;
    v24 = objc_alloc_init(_UIDropAnimationHandlers);
    animationHandlers = v17->_animationHandlers;
    v17->_animationHandlers = v24;

  }
  return v13;
}

- (NSString)description
{
  uint64_t kind;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGPoint v15;

  kind = self->_kind;
  if (kind > 2)
    v4 = &stru_1E16EDF20;
  else
    v4 = off_1E16BE460[kind];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragItem);
  __UICVIndexPathDescription(self->_destinationIndexPath);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewDropCoordinatorItem target](self, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "center");
  NSStringFromCGPoint(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldRemainInHierarchy);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: kind = %@; dragItem = %@; destinationIndexPath = %@ location = %@; shouldRemainInHierarchy = %@>"),
    v7,
    v4,
    WeakRetained,
    v9,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)addAnimations:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UICollectionViewDropCoordinatorItem animationHandlers](self, "animationHandlers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimations:", v4);

}

- (void)addCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UICollectionViewDropCoordinatorItem animationHandlers](self, "animationHandlers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCompletion:", v4);

}

- (NSIndexPath)destinationIndexPath
{
  return self->_destinationIndexPath;
}

- (void)setDestinationIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationIndexPath, a3);
}

- (BOOL)shouldRemainInHierarchy
{
  return self->_shouldRemainInHierarchy;
}

- (void)setShouldRemainInHierarchy:(BOOL)a3
{
  self->_shouldRemainInHierarchy = a3;
}

- (UIDragItem)dragItem
{
  return (UIDragItem *)objc_loadWeakRetained((id *)&self->_dragItem);
}

- (void)setDragItem:(id)a3
{
  objc_storeWeak((id *)&self->_dragItem, a3);
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (UIDragPreviewTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_UIDropAnimationHandlers)animationHandlers
{
  return self->_animationHandlers;
}

- (void)setAnimationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_animationHandlers, a3);
}

- (id)previewParametersProvider
{
  return self->_previewParametersProvider;
}

- (void)setPreviewParametersProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewParametersProvider, 0);
  objc_storeStrong((id *)&self->_animationHandlers, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_destroyWeak((id *)&self->_dragItem);
  objc_storeStrong((id *)&self->_destinationIndexPath, 0);
}

@end

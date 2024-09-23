@implementation UIDragItem

- (UIDragItem)initWithItemProvider:(NSItemProvider *)itemProvider
{
  NSItemProvider *v5;
  UIDragItem *v6;
  UIDragItem *v7;
  UIDragItem *v8;
  objc_super v10;

  v5 = itemProvider;
  v10.receiver = self;
  v10.super_class = (Class)UIDragItem;
  v6 = -[UIDragItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemProvider, itemProvider);
    v7->_preferredPreviewType = 1;
    v8 = v7;
  }

  return v7;
}

- (void)_updatePreferredPreview
{
  unint64_t updatedPreviewType;

  updatedPreviewType = self->_updatedPreviewType;
  if (updatedPreviewType)
  {
    self->_dirty = 1;
    self->_preferredPreviewType = updatedPreviewType;
    self->_updatedPreviewType = 0;
  }
}

- (void)_setDeferPreviewUpdates:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_deferPreviewUpdates != a3)
  {
    self->_deferPreviewUpdates = a3;
    if (!a3)
    {
      if (self->_updatedPreviewType)
      {
        -[UIDragItem _dragDropSession](self, "_dragDropSession");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v6[0] = self;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_itemsNeedUpdate:", v5);

      }
    }
  }
}

- (void)_loadOriginalImageComponentProvider
{
  id v2;

  -[UIDragItem _previewProviderForType:](self, "_previewProviderForType:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageComponent");

}

- (void)setPreviewProvider:(void *)previewProvider
{
  id v4;
  void *v5;
  id v6;
  _UIDragPreviewBlockProvider *v7;
  _UIDragPreviewBlockProvider *dragPreviewBlockProvider;
  id v9;

  v4 = previewProvider;
  if (self->_previewProvider != v4)
  {
    v9 = v4;
    v5 = _Block_copy(v4);
    v6 = self->_previewProvider;
    self->_previewProvider = v5;

    if (v9)
    {
      +[_UIDragPreviewBlockProvider previewProviderWithBlock:](_UIDragPreviewBlockProvider, "previewProviderWithBlock:");
      v7 = (_UIDragPreviewBlockProvider *)objc_claimAutoreleasedReturnValue();
      dragPreviewBlockProvider = self->_dragPreviewBlockProvider;
      self->_dragPreviewBlockProvider = v7;
    }
    else
    {
      dragPreviewBlockProvider = self->_dragPreviewBlockProvider;
      self->_dragPreviewBlockProvider = 0;
    }

    -[UIDragItem _previewNeedsUpdateForType:](self, "_previewNeedsUpdateForType:", 2);
    v4 = v9;
  }

}

- (void)_setDragDropSession:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id previewProvider;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragDropSession);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_dragDropSession);

    objc_storeWeak((id *)&self->_dragDropSession, obj);
    if (!v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_dragDropSession);
      if (v6)
      {
        previewProvider = self->_previewProvider;

        if (previewProvider)
          -[UIDragItem _previewNeedsUpdateForType:](self, "_previewNeedsUpdateForType:", 2);
      }
    }
  }

}

- (void)_previewNeedsUpdateForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  self->_updatedPreviewType = a3;
  if (!self->_deferPreviewUpdates)
  {
    -[UIDragItem _dragDropSession](self, "_dragDropSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_itemsNeedUpdate:", v5);

  }
}

- (id)_previewProviderForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3 == 1)
  {
    v5 = 72;
  }
  else
  {
    if (a3 != 2)
      return 0;
    v5 = 40;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "_dragPreviewProvider", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_currentPreviewProvider
{
  return -[UIDragItem _previewProviderForType:](self, "_previewProviderForType:", -[UIDragItem preferredPreviewType](self, "preferredPreviewType"));
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (id)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)localObject
{
  objc_storeStrong(&self->_localObject, localObject);
}

- (void)previewProvider
{
  return self->_previewProvider;
}

- (_UIDragPreviewBlockProvider)dragPreviewBlockProvider
{
  return self->_dragPreviewBlockProvider;
}

- (void)setDragPreviewBlockProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dragPreviewBlockProvider, a3);
}

- (unint64_t)preferredPreviewType
{
  return self->_preferredPreviewType;
}

- (void)setPreferredPreviewType:(unint64_t)a3
{
  self->_preferredPreviewType = a3;
}

- (unint64_t)updatedPreviewType
{
  return self->_updatedPreviewType;
}

- (void)setUpdatedPreviewType:(unint64_t)a3
{
  self->_updatedPreviewType = a3;
}

- (_UIDragDropSessionInternal)_dragDropSession
{
  return (_UIDragDropSessionInternal *)objc_loadWeakRetained((id *)&self->_dragDropSession);
}

- (UITargetedDragPreview)_targetedLiftPreview
{
  return self->_targetedLiftPreview;
}

- (void)setTargetedLiftPreview:(id)a3
{
  objc_storeStrong((id *)&self->_targetedLiftPreview, a3);
}

- (CGSize)_visibleDropItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_visibleDropItemSize.width;
  height = self->_visibleDropItemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setVisibleDropItemSize:(CGSize)a3
{
  self->_visibleDropItemSize = a3;
}

- (CGPoint)_visibleDropItemCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_visibleDropItemCenter.x;
  y = self->_visibleDropItemCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setVisibleDropItemCenter:(CGPoint)a3
{
  self->_visibleDropItemCenter = a3;
}

- (_UIDragSetDownAnimationTarget)_sourceVisualTarget
{
  return (_UIDragSetDownAnimationTarget *)objc_loadWeakRetained((id *)&self->_sourceVisualTarget);
}

- (void)_setSourceVisualTarget:(id)a3
{
  objc_storeWeak((id *)&self->_sourceVisualTarget, a3);
}

- (_UIDragSetDownAnimationTarget)_destinationVisualTarget
{
  return (_UIDragSetDownAnimationTarget *)objc_loadWeakRetained((id *)&self->_destinationVisualTarget);
}

- (void)_setDestinationVisualTarget:(id)a3
{
  objc_storeWeak((id *)&self->_destinationVisualTarget, a3);
}

- (BOOL)_isDirty
{
  return self->_dirty;
}

- (void)_setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)_deferPreviewUpdates
{
  return self->_deferPreviewUpdates;
}

- (id)_privateLocalContext
{
  return self->_privateLocalContext;
}

- (void)_setPrivateLocalContext:(id)a3
{
  objc_storeStrong(&self->_privateLocalContext, a3);
}

- (unint64_t)_managementState
{
  return self->__managementState;
}

- (void)set_managementState:(unint64_t)a3
{
  self->__managementState = a3;
}

- (CGAffineTransform)_suggestedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)set_suggestedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->__suggestedTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->__suggestedTransform.c = v4;
  *(_OWORD *)&self->__suggestedTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_privateLocalContext, 0);
  objc_destroyWeak((id *)&self->__currentSetDownAnimation);
  objc_destroyWeak((id *)&self->_destinationVisualTarget);
  objc_destroyWeak((id *)&self->_sourceVisualTarget);
  objc_storeStrong((id *)&self->_targetedLiftPreview, 0);
  objc_destroyWeak((id *)&self->_dragDropSession);
  objc_storeStrong((id *)&self->_dragPreviewBlockProvider, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong(&self->_localObject, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

- (UITextRange)_draggedTextRange
{
  return (UITextRange *)objc_getAssociatedObject(self, sel__draggedTextRange);
}

- (void)_setDraggedTextRange:(id)a3
{
  objc_setAssociatedObject(self, sel__draggedTextRange, a3, (void *)1);
}

- (void)_uicmi_setAssociatedMenuIdentifier:(id)a3
{
  objc_setAssociatedObject(self, &_UIDragItemAssociatedMenuIdentifierKey, a3, (void *)3);
}

- (id)_uicmi_getAssociatedMenuIdentifier
{
  return objc_getAssociatedObject(self, &_UIDragItemAssociatedMenuIdentifierKey);
}

@end

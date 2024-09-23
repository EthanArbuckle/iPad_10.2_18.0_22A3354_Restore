@implementation _UIDropItem

- (id)itemProvider
{
  NSItemProvider *dropItemProvider;
  objc_super v4;

  dropItemProvider = self->_dropItemProvider;
  if (dropItemProvider)
    return dropItemProvider;
  v4.receiver = self;
  v4.super_class = (Class)_UIDropItem;
  -[UIDragItem itemProvider](&v4, sel_itemProvider);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localObject
{
  void *v2;
  void *v3;

  -[_UIDropItem _localDragItem](self, "_localDragItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLocalObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDropItem _localDragItem](self, "_localDragItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalObject:", v4);

}

- (id)_privateLocalContext
{
  void *v2;
  void *v3;

  -[_UIDropItem _localDragItem](self, "_localDragItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_privateLocalContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setPrivateLocalContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDropItem _localDragItem](self, "_localDragItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPrivateLocalContext:", v4);

}

- (void)setNeedsDropPreviewUpdate
{
  _UIDropItem *v2;
  _UIDropItem *v3;

  v2 = self;
  if (self)
    self = (_UIDropItem *)objc_loadWeakRetained((id *)&self->super.__currentSetDownAnimation);
  v3 = self;
  -[_UIDropItem dirtyTargetedDragPreviewForDragItem:](self, "dirtyTargetedDragPreviewForDragItem:", v2);

}

- (UIDragItem)_localDragItem
{
  return self->_localDragItem;
}

- (void)_setLocalDragItem:(id)a3
{
  objc_storeStrong((id *)&self->_localDragItem, a3);
}

- (NSItemProvider)_dropItemProvider
{
  return self->_dropItemProvider;
}

- (void)_setDropItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dropItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropItemProvider, 0);
  objc_storeStrong((id *)&self->_localDragItem, 0);
}

@end

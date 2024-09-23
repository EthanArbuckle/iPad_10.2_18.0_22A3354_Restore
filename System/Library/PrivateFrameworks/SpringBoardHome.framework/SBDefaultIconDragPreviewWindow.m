@implementation SBDefaultIconDragPreviewWindow

- (id)_iconDragPreviewContainerView
{
  void *v2;
  void *v3;

  -[SBDefaultIconDragPreviewWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)beginTrackingPlatterView:(id)a3
{
  id v4;
  NSHashTable *platterViews;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  id v9;

  v4 = a3;
  platterViews = self->_platterViews;
  v9 = v4;
  if (!platterViews)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_platterViews;
    self->_platterViews = v6;

    v4 = v9;
    platterViews = self->_platterViews;
  }
  -[NSHashTable addObject:](platterViews, "addObject:", v4);
  -[SBDefaultIconDragPreviewWindow _iconDragPreviewContainerView](self, "_iconDragPreviewContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[SBDefaultIconDragPreviewWindow setHidden:](self, "setHidden:", 0);
}

- (void)stopTrackingPlatterView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeFromSuperview");
  -[NSHashTable removeObject:](self->_platterViews, "removeObject:", v4);

  -[SBDefaultIconDragPreviewWindow setHidden:](self, "setHidden:", -[NSHashTable count](self->_platterViews, "count") == 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterViews, 0);
}

@end

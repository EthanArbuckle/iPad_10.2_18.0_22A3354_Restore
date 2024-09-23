@implementation PXGItemsLayout

- (int64_t)_numberOfItems
{
  return self->__numberOfItems;
}

- (int64_t)itemForSpriteIndex:(unsigned int)a3
{
  return self->_loadedItems.location + a3;
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGItemsLayout;
  -[PXGLayout didUpdate](&v9, sel_didUpdate);
  if (self->_loadedItemsUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGItemsLayout.m"), 478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_loadedItemsUpdateFlags.willPerformUpdate"));

  }
  if (self->_accessoryItemsUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_accessoryItemsUpdateFlags.willPerformUpdate"));

  }
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout didUpdate]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGItemsLayout.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  int64_t v8;
  unsigned int v9;

  if (a3 == -1)
  {
    -[PXGItemsLayout itemsGeometry](self, "itemsGeometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_5;
  }
  v6 = *(_QWORD *)&a3;
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") > a3)
  {
    -[PXGItemsLayout itemsGeometry](self, "itemsGeometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", v6);
LABEL_5:
    v9 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", objc_msgSend(v7, "itemClosestToItem:inDirection:", v8, a4));

    return v9;
  }
  return -1;
}

- (unsigned)spriteIndexForItem:(int64_t)a3
{
  NSUInteger location;

  location = self->_loadedItems.location;
  if (a3 - location < self->_loadedItems.length && a3 >= location)
    return a3 - location;
  else
    return -1;
}

- (PXGItemsLayoutDelegate)delegate
{
  return (PXGItemsLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a5;
  if ((a4 & 2) != 0)
    -[PXGItemsLayout _handleFocusChangeWithUserInfo:](self, "_handleFocusChangeWithUserInfo:", v9);
  if ((a4 & 4) != 0)
    -[PXGItemsLayout _handleSelectionChangeWithUserInfo:](self, "_handleSelectionChangeWithUserInfo:", v9);
  v10.receiver = self;
  v10.super_class = (Class)PXGItemsLayout;
  -[PXGLayout axGroup:didChange:userInfo:](&v10, sel_axGroup_didChange_userInfo_, v8, a4, v9);

}

- (BOOL)delegateRespondsTo:(unint64_t)a3
{
  return (a3 & ~self->_delegateRespondsTo) == 0;
}

- (PXGItemsLayoutDelegate)insetDelegate
{
  void *v3;

  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 512))
  {
    -[PXGItemsLayout delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PXGItemsLayoutDelegate *)v3;
}

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4
{
  -[PXGItemsLayout setNumberOfItems:withChangeDetails:changeMediaVersionHandler:](self, "setNumberOfItems:withChangeDetails:changeMediaVersionHandler:", a3, a4, 0);
}

- (void)setNumberOfItems:(int64_t)a3
{
  -[PXGItemsLayout setNumberOfItems:withChangeDetails:](self, "setNumberOfItems:withChangeDetails:", a3, 0);
}

- (void)setDelegate:(id)a3
{
  PXGItemsLayoutDelegate **p_delegate;
  id v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_delegateRespondsTo = 0;
  self->_delegateRespondsTo |= objc_opt_respondsToSelector() & 1;
  v6 = objc_opt_respondsToSelector();
  v7 = 2;
  if ((v6 & 1) == 0)
    v7 = 0;
  self->_delegateRespondsTo |= v7;
  v8 = objc_opt_respondsToSelector();
  v9 = 4;
  if ((v8 & 1) == 0)
    v9 = 0;
  self->_delegateRespondsTo |= v9;
  v10 = objc_opt_respondsToSelector();
  v11 = 8;
  if ((v10 & 1) == 0)
    v11 = 0;
  self->_delegateRespondsTo |= v11;
  v12 = objc_opt_respondsToSelector();
  v13 = 16;
  if ((v12 & 1) == 0)
    v13 = 0;
  self->_delegateRespondsTo |= v13;
  v14 = objc_opt_respondsToSelector();
  v15 = 32;
  if ((v14 & 1) == 0)
    v15 = 0;
  self->_delegateRespondsTo |= v15;
  v16 = objc_opt_respondsToSelector();
  v17 = 64;
  if ((v16 & 1) == 0)
    v17 = 0;
  self->_delegateRespondsTo |= v17;
  v18 = objc_opt_respondsToSelector();
  v19 = 128;
  if ((v18 & 1) == 0)
    v19 = 0;
  self->_delegateRespondsTo |= v19;
  v20 = objc_opt_respondsToSelector();
  v21 = 256;
  if ((v20 & 1) == 0)
    v21 = 0;
  self->_delegateRespondsTo |= v21;
  v22 = objc_opt_respondsToSelector();
  v23 = 512;
  if ((v22 & 1) == 0)
    v23 = 0;
  self->_delegateRespondsTo |= v23;
  v24 = objc_opt_respondsToSelector();

  v25 = 1024;
  if ((v24 & 1) == 0)
    v25 = 0;
  self->_delegateRespondsTo |= v25;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGItemsLayout;
  -[PXGLayout willUpdate](&v9, sel_willUpdate);
  self->_loadedItemsUpdateFlags.willPerformUpdate = 1;
  if (self->_loadedItemsUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGItemsLayout.m"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_loadedItemsUpdateFlags.isPerformingUpdate"));

  }
  self->_accessoryItemsUpdateFlags.willPerformUpdate = 1;
  if (self->_accessoryItemsUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_accessoryItemsUpdateFlags.isPerformingUpdate"));

  }
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout willUpdate]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGItemsLayout.m"), 458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (BOOL)spriteIndexIsItem:(unsigned int)a3
{
  return -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") > a3;
}

- (id)axVisibleSpriteIndexes
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  -[PXGLayout visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGItemsLayout itemsGeometry](self, "itemsGeometry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "itemsInRect:inLayout:", self, v4, v6, v8, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "A subclass of PXGItemsLayout must provide an itemsGeometry to properly support accessibility", v19, 2u);
    }

    v13 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  }
  v15 = v13;
  -[PXGItemsLayout loadedItemsForItems:](self, "loadedItemsForItems:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXGItemsLayout spriteIndexesForItems:](self, "spriteIndexesForItems:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)loadedItemsForItems:(id)a3
{
  void *v3;
  NSUInteger location;
  NSUInteger length;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB36B8];
  location = self->_loadedItems.location;
  length = self->_loadedItems.length;
  v6 = a3;
  objc_msgSend(v3, "indexSetWithIndexesInRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_intersectionWithIndexSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)axSpriteIndexes
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v3, v4);
  -[PXGItemsLayout spriteIndexesForItems:](self, "spriteIndexesForItems:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)spriteIndexesForItems:(id)a3
{
  id v4;
  _NSRange *p_loadedItems;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  p_loadedItems = &self->_loadedItems;
  if (self->_loadedItems.length)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", p_loadedItems->location);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_intersectionWithIndexSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "shiftIndexesStartingAtIndex:by:", p_loadedItems->location, -p_loadedItems->location);
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (_NSRange)loadedItems
{
  _NSRange *p_loadedItems;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_loadedItems = &self->_loadedItems;
  location = self->_loadedItems.location;
  length = p_loadedItems->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setDropTargetObjectReference:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v5 = self->_dropTargetObjectReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong(&self->_dropTargetObjectReference, a3);
      -[PXGItemsLayout dropTargetObjectReferenceDidChange](self, "dropTargetObjectReferenceDidChange");
    }
  }

}

- (void)setItem:(int64_t)a3 forStylableType:(int64_t)a4 animated:(BOOL)a5
{
  self->_pendingStylableItems[a4] = a3;
  self->_pendingAnimations[a4] = a5;
  -[PXGItemsLayout invalidateStylableType:](self, "invalidateStylableType:", a4);
}

- (void)invalidateStylableType:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t v4;
  unint64_t needsUpdate;
  unint64_t v6;
  uint64_t v7;
  _BOOL4 willPerformUpdate;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3 == 2)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_18;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v9 = 16;
      goto LABEL_27;
    }
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout invalidateStylableType:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGItemsLayout.m"), 607, CFSTR("invalidating %lu after it already has been updated"), 16);
      goto LABEL_32;
    }
LABEL_18:
    v7 = needsUpdate | 0x10;
    goto LABEL_22;
  }
  if (a3 == 1)
  {
    p_updateFlags = &self->_updateFlags;
    v6 = self->_updateFlags.needsUpdate;
    if (v6)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_21;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v9 = 4;
      goto LABEL_27;
    }
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout invalidateStylableType:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGItemsLayout.m"), 604, CFSTR("invalidating %lu after it already has been updated"), 4);
      goto LABEL_32;
    }
LABEL_21:
    v7 = v6 | 4;
    goto LABEL_22;
  }
  if (a3)
    return;
  p_updateFlags = &self->_updateFlags;
  v4 = self->_updateFlags.needsUpdate;
  if (v4)
  {
    if (!self->_updateFlags.isPerformingUpdate)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_14:
    if ((self->_updateFlags.updated & 8) == 0)
    {
LABEL_15:
      v7 = v4 | 8;
LABEL_22:
      p_updateFlags->needsUpdate = v7;
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout invalidateStylableType:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGItemsLayout.m"), 601, CFSTR("invalidating %lu after it already has been updated"), 8);
LABEL_32:

    abort();
  }
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  v9 = 8;
LABEL_27:
  p_updateFlags->needsUpdate = v9;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  -[PXGItemsLayout updateLoadedItemsIfNeeded](self, "updateLoadedItemsIfNeeded");
  -[PXGItemsLayout updateAccessoryItemsIfNeeded](self, "updateAccessoryItemsIfNeeded");
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    }
    self->_updateFlags.isPerformingUpdate = 1;
    v4 = MEMORY[0x1E0C809B0];
    self->_updateFlags.updated = 0;
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __24__PXGItemsLayout_update__block_invoke;
    v10[3] = &unk_1E5149198;
    v10[4] = self;
    -[PXGLayout performSpriteStylingUpdate:](self, "performSpriteStylingUpdate:", v10);
    self->_updateFlags.isPerformingUpdate = 0;
    if (p_updateFlags->needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGItemsLayout.m"), 471, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGItemsLayout;
  -[PXGLayout update](&v9, sel_update);
}

- (void)updateLoadedItemsIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_loadedItemsUpdateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  p_loadedItemsUpdateFlags = &self->_loadedItemsUpdateFlags;
  self->_loadedItemsUpdateFlags.willPerformUpdate = 0;
  needsUpdate = self->_loadedItemsUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_loadedItemsUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout updateLoadedItemsIfNeeded]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_loadedItemsUpdateFlags.isPerformingUpdate"));

      needsUpdate = p_loadedItemsUpdateFlags->needsUpdate;
    }
    p_loadedItemsUpdateFlags->isPerformingUpdate = 1;
    p_loadedItemsUpdateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_loadedItemsUpdateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGItemsLayout _updateLoadedItems](self, "_updateLoadedItems");
      needsUpdate = p_loadedItemsUpdateFlags->needsUpdate;
    }
    p_loadedItemsUpdateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout updateLoadedItemsIfNeeded]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGItemsLayout.m"), 494, CFSTR("still needing to update %lu after update pass"), p_loadedItemsUpdateFlags->needsUpdate);

    }
  }
}

- (void)updateAccessoryItemsIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_accessoryItemsUpdateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  p_accessoryItemsUpdateFlags = &self->_accessoryItemsUpdateFlags;
  self->_accessoryItemsUpdateFlags.willPerformUpdate = 0;
  needsUpdate = self->_accessoryItemsUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_accessoryItemsUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout updateAccessoryItemsIfNeeded]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_accessoryItemsUpdateFlags.isPerformingUpdate"));

      needsUpdate = p_accessoryItemsUpdateFlags->needsUpdate;
    }
    p_accessoryItemsUpdateFlags->isPerformingUpdate = 1;
    p_accessoryItemsUpdateFlags->updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_accessoryItemsUpdateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      -[PXGItemsLayout _updateAccessoryItems](self, "_updateAccessoryItems");
      needsUpdate = p_accessoryItemsUpdateFlags->needsUpdate;
    }
    p_accessoryItemsUpdateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout updateAccessoryItemsIfNeeded]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGItemsLayout.m"), 732, CFSTR("still needing to update %lu after update pass"), p_accessoryItemsUpdateFlags->needsUpdate);

    }
  }
}

uint64_t __24__PXGItemsLayout_update__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateFocusedItemIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_updateHoveredItemIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_updatePressedItemIfNeeded");
}

- (void)_updateStylableType:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  int64_t v8;
  int64_t v9;
  BOOL v10;
  BOOL *pendingAnimations;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[7];

  v5 = self->_styleableAnimations[a3];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PXGItemsLayout__updateStylableType___block_invoke;
  aBlock[3] = &unk_1E511E648;
  aBlock[4] = self;
  aBlock[5] = v5;
  aBlock[6] = a3;
  v6 = _Block_copy(aBlock);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  v8 = self->_currentStylableItems[a3];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    (*((void (**)(void *, int64_t, _QWORD))v6 + 2))(v6, self->_currentStylableItems[a3], 0);
  v9 = self->_pendingStylableItems[a3];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7[2](v7, self->_pendingStylableItems[a3], 1);
    v10 = 0;
  }
  pendingAnimations = self->_pendingAnimations;
  if (!v10 && pendingAnimations[a3] && v5 != 0)
  {
    -[PXGLayout createAnimation](self, "createAnimation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __38__PXGItemsLayout__updateStylableType___block_invoke_3(v14);
    -[PXGLayout superlayout](self, "superlayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "createAnimation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __38__PXGItemsLayout__updateStylableType___block_invoke_3(v16);

    }
    pendingAnimations = self->_pendingAnimations;
  }
  pendingAnimations[a3] = 0;
  self->_currentStylableItems[a3] = v9;

}

- (void)_updatePressedItemIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout _updatePressedItemIfNeeded]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 629, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x10uLL;
  if ((needsUpdate & 0x10) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFEFLL;
    -[PXGItemsLayout _updateStylableType:](self, "_updateStylableType:", 2);
  }
}

- (void)_updateHoveredItemIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout _updateHoveredItemIfNeeded]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 621, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 8uLL;
  if ((needsUpdate & 8) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    -[PXGItemsLayout _updateStylableType:](self, "_updateStylableType:", 0);
  }
}

- (void)_updateFocusedItemIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout _updateFocusedItemIfNeeded]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 4uLL;
  if ((needsUpdate & 4) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
    -[PXGItemsLayout _updateStylableType:](self, "_updateStylableType:", 1);
  }
}

- (void)setAnimationParameters:(id)a3 forStylableType:(int64_t)a4
{
  self->_styleableAnimations[a4] = a3.var0;
  self->_stylablePaddings[a4] = a3.var1;
  -[PXGItemsLayout invalidateStylableType:](self, "invalidateStylableType:", a4);
}

- (PXGItemsLayout)init
{
  char *v2;
  PXGItemsLayout *v3;
  int64_t *v4;
  int64_t *v5;
  BOOL *v6;
  int64_t *v7;
  double *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGItemsLayout;
  v2 = -[PXGLayout init](&v10, sel_init);
  v3 = (PXGItemsLayout *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 1048) = xmmword_1A7C0C330;
    v4 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_currentStylableItems = v4;
    memset_pattern16(v4, &unk_1A7C0CA20, 0x18uLL);
    v5 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_pendingStylableItems = v5;
    memset_pattern16(v5, &unk_1A7C0CA20, 0x18uLL);
    v6 = (BOOL *)malloc_type_calloc(3uLL, 1uLL, 0x100004077774924uLL);
    v3->_pendingAnimations = v6;
    v6[2] = 0;
    *(_WORD *)v6 = 0;
    v7 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_styleableAnimations = v7;
    v7[1] = 0;
    v7[2] = 0;
    *v7 = 0;
    v8 = (double *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_stylablePaddings = v8;
    v8[1] = 0.0;
    v8[2] = 0.0;
    *v8 = 0.0;
  }
  return v3;
}

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5
{
  id v9;
  id v10;
  int64_t v11;
  BOOL v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  SEL v55;
  void *v56;
  void *v57;
  unint64_t v58;
  _QWORD v59[2];
  uint64_t (*v60)(uint64_t, uint64_t);
  void *v61;
  PXGItemsLayout *v62;
  id v63;
  objc_super v64;
  _QWORD v65[4];
  id v66;
  PXGItemsLayout *v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  SEL v72;
  int64_t v73;
  int64_t v74;
  objc_super v75;
  objc_super v76;
  _QWORD aBlock[4];
  id v78;
  id v79;
  char v80[9];

  v9 = a4;
  v10 = a5;
  -[PXGItemsLayout beginApplyingItemChanges](self, "beginApplyingItemChanges");
  v11 = -[PXGItemsLayout _numberOfItems](self, "_numberOfItems");
  -[PXGItemsLayout set_numberOfItems:](self, "set_numberOfItems:", a3);
  v12 = -[PXGItemsLayout isLazy](self, "isLazy");
  v13 = MEMORY[0x1E0C809B0];
  v14 = "uttonFactory";
  if (!v12)
  {
    -[PXGItemsLayout setLoadedItems:](self, "setLoadedItems:", 0, a3);
    if (v10)
    {
      aBlock[0] = v13;
      aBlock[1] = 3221225472;
      aBlock[2] = __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke;
      aBlock[3] = &unk_1E511E5D8;
      v78 = v9;
      v79 = v10;
      v19 = _Block_copy(aBlock);

    }
    else
    {
      v19 = 0;
    }
    v76.receiver = self;
    v76.super_class = (Class)PXGItemsLayout;
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](&v76, sel_applySpriteChangeDetails_countAfterChanges_initialState_modifyState_, v9, a3, 0, v19);

    goto LABEL_11;
  }
  v15 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  v17 = v16;
  if (objc_msgSend(v9, "hasIncrementalChanges") && !objc_msgSend(v9, "hasMoves"))
  {
    if (!v17)
      goto LABEL_6;
    v50 = v11;
    v55 = a2;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v15, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removedIndexes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "px_intersectionWithIndexSet:", v23);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removedIndexes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v23;
    objc_msgSend(v23, "px_indexSetAdjustedForDeletions:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend(v26, "px_coveringRange");
    if (v27 != objc_msgSend(v26, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemsLayout.m"), 221, CFSTR("Should only have a single range of loaded items after removals"));

    }
    objc_msgSend(v9, "insertedIndexes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v26;
    objc_msgSend(v26, "px_indexSetAdjustedForInsertions:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v29;
    v30 = objc_msgSend(v29, "px_coveringRange");
    v32 = v31;
    v58 = v31;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v30, v31);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertedIndexes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "px_intersectionWithIndexSet:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXGItemsLayout setLoadedItems:](self, "setLoadedItems:", v30, v32);
    objc_msgSend(v9, "changedIndexes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v33;
    objc_msgSend(v36, "px_intersectionWithIndexSet:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = (void *)objc_msgSend(v57, "mutableCopy");
    objc_msgSend(v56, "shiftIndexesStartingAtIndex:by:", v15, -v15);
    v51 = v35;
    v38 = (void *)objc_msgSend(v35, "mutableCopy");
    objc_msgSend(v38, "shiftIndexesStartingAtIndex:by:", v48, -v30);
    v49 = v37;
    v39 = (void *)objc_msgSend(v37, "mutableCopy");
    objc_msgSend(v39, "shiftIndexesStartingAtIndex:by:", v30, -v30);
    if (objc_msgSend(v39, "count") && objc_msgSend(v39, "lastIndex") >= v58)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v55, self, CFSTR("PXGItemsLayout.m"), 250, CFSTR("An unloaded sprite was marked as modified."));

    }
    v18 = v47;
    v40 = objc_msgSend(v47, "count");
    v41 = objc_msgSend(v38, "count") + v40;
    if (v58 != v41 - objc_msgSend(v56, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", v55, self, CFSTR("PXGItemsLayout.m"), 254, CFSTR("Change handling count mismatch"));

    }
    v13 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_2;
      v65[3] = &unk_1E511E600;
      v69 = v30;
      v70 = v58;
      v71 = v58;
      v72 = v55;
      v66 = v9;
      v67 = self;
      v73 = v50;
      v74 = a3;
      v68 = v10;
      v42 = _Block_copy(v65);

    }
    else
    {
      v42 = 0;
    }
    v43 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v56, v38, 0, 0, v39);
    v64.receiver = self;
    v64.super_class = (Class)PXGItemsLayout;
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](&v64, sel_applySpriteChangeDetails_countAfterChanges_initialState_modifyState_, v43, v58, 0, v42);

    v14 = "LemonadeProfileButtonFactory" + 16;
  }
  else
  {
    -[PXGItemsLayout setLoadedItems:](self, "setLoadedItems:", 0x7FFFFFFFFFFFFFFFLL, 0);
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v75.receiver = self;
    v75.super_class = (Class)PXGItemsLayout;
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](&v75, sel_applySpriteChangeDetails_countAfterChanges_initialState_modifyState_, v18, 0, 0, 0);
  }

LABEL_6:
  -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
LABEL_11:
  v59[0] = v13;
  v59[1] = *((_QWORD *)v14 + 7);
  v60 = __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_3;
  v61 = &unk_1E51460E8;
  v62 = self;
  v20 = v9;
  v21 = 0;
  v63 = v20;
  v80[0] = 0;
  do
  {
    ((void (*)(_QWORD *, uint64_t, char *))v60)(v59, v21, v80);
    if (v80[0])
      v22 = 1;
    else
      v22 = v21 == 2;
    ++v21;
  }
  while (!v22);
  -[PXGItemsLayout endApplyingItemChanges](self, "endApplyingItemChanges");

}

uint64_t __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = result;
  v4 = *(_QWORD *)(result + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(v4 + 920) + 8 * a2);
  if (*(_QWORD *)(*(_QWORD *)(v4 + 912) + 8 * a2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 912) + 8 * a2) = objc_msgSend(*(id *)(result + 40), "indexAfterApplyingChangesToIndex:");
    result = objc_msgSend(*(id *)(v3 + 32), "invalidateStylableType:", a2);
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    result = objc_msgSend(*(id *)(v3 + 40), "indexAfterApplyingChangesToIndex:", v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 920) + 8 * a2) = result;
  }
  return result;
}

- (void)set_numberOfItems:(int64_t)a3
{
  self->__numberOfItems = a3;
}

- (void)setLoadedItems:(_NSRange)a3
{
  if (self->_loadedItems.location != a3.location || self->_loadedItems.length != a3.length)
  {
    self->_loadedItems = a3;
    -[PXGItemsLayout loadedItemsDidChange](self, "loadedItemsDidChange");
  }
}

- (BOOL)isLazy
{
  return self->_lazy;
}

- (void)endApplyingItemChanges
{
  int64_t applyingItemChangesCount;
  id v5;

  applyingItemChangesCount = self->_applyingItemChangesCount;
  self->_applyingItemChangesCount = applyingItemChangesCount - 1;
  if (applyingItemChangesCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemsLayout.m"), 765, CFSTR("Unbalanced call to endApplyingItemChanges"));

  }
}

- (void)beginApplyingItemChanges
{
  ++self->_applyingItemChangesCount;
}

- (BOOL)isApplyingItemChanges
{
  return self->_applyingItemChangesCount > 0;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_currentStylableItems);
  free(self->_pendingStylableItems);
  free(self->_pendingAnimations);
  free(self->_styleableAnimations);
  free(self->_stylablePaddings);
  v3.receiver = self;
  v3.super_class = (Class)PXGItemsLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;
  NSRange v9;

  v8.receiver = self;
  v8.super_class = (Class)PXGItemsLayout;
  -[PXGItemsLayout description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v9.location = -[PXGItemsLayout loadedItems](self, "loadedItems");
  NSStringFromRange(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", CFSTR(", numberOfItems=%li, loadedItems=%@, numberOfAccessoryItems=%li, loadedAccessorySprites=%u"), v4, v5, -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems"), -[PXGLayout numberOfSprites](self->_accessoryItemsContainerLayout, "numberOfSprites"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXGItemsLayoutDelegate)marginDelegate
{
  void *v3;

  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 256))
  {
    -[PXGItemsLayout delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PXGItemsLayoutDelegate *)v3;
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  int64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (!-[PXGItemsLayout spriteIndexIsItem:](self, "spriteIndexIsItem:"))
  {
    if (-[PXGItemsLayout spriteIndexIsAccessoryItem:](self, "spriteIndexIsAccessoryItem:", v3)
      && -[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 64))
    {
      v8 = -[PXGItemsLayout accessoryItemForSpriteIndex:](self, "accessoryItemForSpriteIndex:", v3);
      -[PXGItemsLayout delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "itemsLayout:objectReferenceForAccessoryItem:", self, v8);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    return v9;
  }
  if (!-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 2))
    goto LABEL_8;
  v5 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", v3);
  -[PXGItemsLayout delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemsLayout:objectReferenceForItem:", self, v5);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  PXGHitTestResult *v6;
  void *v7;
  const __CFString *v8;
  PXGHitTestResult *v9;

  v3 = *(_QWORD *)&a3;
  -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGItemsLayout spriteIndexIsItem:](self, "spriteIndexIsItem:", v3))
  {
    v6 = [PXGHitTestResult alloc];
    -[PXGItemsLayout objectReferenceForSpriteIndex:](self, "objectReferenceForSpriteIndex:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("PXGHitTestUserDataIdentifierItem");
  }
  else
  {
    if (!-[PXGItemsLayout spriteIndexIsAccessoryItem:](self, "spriteIndexIsAccessoryItem:", v3))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v6 = [PXGHitTestResult alloc];
    -[PXGItemsLayout objectReferenceForSpriteIndex:](self, "objectReferenceForSpriteIndex:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("PXGHitTestUserDataIdentifierAccessoryItem");
  }
  v9 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:](v6, "initWithSpriteReference:layout:identifier:userData:", v5, self, v8, v7);

LABEL_7:
  return v9;
}

- (void)setNumberOfAccessoryItems:(int64_t)a3
{
  void *v6;

  if (self->_numberOfAccessoryItems != a3)
  {
    if (a3 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemsLayout.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfAccessoryItems >= 0"));

    }
    self->_numberOfAccessoryItems = a3;
    -[PXGItemsLayout numberOfAccessoryItemsDidChange](self, "numberOfAccessoryItemsDidChange");
    -[PXGItemsLayout _invalidateAccessoryItems](self, "_invalidateAccessoryItems");
  }
}

- (void)setAccessoryItemContentSource:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryItemContentSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_accessoryItemContentSource, obj);
    -[PXGLayout setContentSource:](self->_accessoryItemsContainerLayout, "setContentSource:", obj);
  }

}

- (_NSRange)itemRangeForSpriteIndexRange:(_PXGSpriteIndexRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  _NSRange result;

  length = a3.length;
  v4 = self->_loadedItems.location + a3.location;
  result.length = length;
  result.location = v4;
  return result;
}

- (id)itemsForSpriteIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (self->_loadedItems.location)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "shiftIndexesStartingAtIndex:by:", 0, self->_loadedItems.location);
    v7 = (id)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = v4;
  }
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (BOOL)spriteIndexIsAccessoryItem:(unsigned int)a3
{
  return -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", *(_QWORD *)&a3, self->_accessoryItemsContainerLayout) != -1;
}

- (int64_t)accessoryItemForSpriteIndex:(unsigned int)a3
{
  return -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", *(_QWORD *)&a3, self->_accessoryItemsContainerLayout);
}

- (unsigned)spriteIndexForAccessoryItem:(int64_t)a3
{
  return -[PXGLayout convertSpriteIndex:fromDescendantLayout:](self, "convertSpriteIndex:fromDescendantLayout:", a3, self->_accessoryItemsContainerLayout);
}

- (void)setDropTargetStyle:(unint64_t)a3
{
  if (self->_dropTargetStyle != a3)
  {
    self->_dropTargetStyle = a3;
    -[PXGItemsLayout dropTargetObjectReferenceDidChange](self, "dropTargetObjectReferenceDidChange");
  }
}

- (void)invalidateLoadedItems
{
  $F40CD077B40800501ED060B808F886F7 *p_loadedItemsUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (-[PXGItemsLayout isLazy](self, "isLazy"))
  {
    p_loadedItemsUpdateFlags = &self->_loadedItemsUpdateFlags;
    needsUpdate = self->_loadedItemsUpdateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_loadedItemsUpdateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_loadedItemsUpdateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_loadedItemsUpdateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout invalidateLoadedItems]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGItemsLayout.m"), 485, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_loadedItemsUpdateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_loadedItemsUpdateFlags.willPerformUpdate;
    p_loadedItemsUpdateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)_updateLoadedItems
{
  _NSRange *p_loadedItems;
  NSUInteger location;
  NSUInteger length;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;

  p_loadedItems = &self->_loadedItems;
  location = self->_loadedItems.location;
  length = self->_loadedItems.length;
  v6 = -[PXGItemsLayout itemsToLoad](self, "itemsToLoad");
  if (location != v6 || length != v7)
  {
    v9 = v6;
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", location, length);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeIndexesInRange:", v9, v10);
    v11 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v11, "shiftIndexesStartingAtIndex:by:", location, -(uint64_t)location);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", location, length);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeIndexes:", v18);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeIndexesInRange:", location, length);
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = objc_msgSend(v13, "firstIndex");
    v16 = objc_msgSend(v12, "firstIndex");
    if (v15 >= v16)
      v15 = v16;
    objc_msgSend(v14, "shiftIndexesStartingAtIndex:by:", objc_msgSend(v13, "firstIndex"), -(uint64_t)v15);
    v17 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v11, v14, 0, 0, 0);
    p_loadedItems->location = v9;
    p_loadedItems->length = v10;
    -[PXGItemsLayout loadedItemsDidChange](self, "loadedItemsDidChange");
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v17, v10, 0, 0);

  }
}

- (void)_invalidateAccessoryItems
{
  $F40CD077B40800501ED060B808F886F7 *p_accessoryItemsUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_accessoryItemsUpdateFlags = &self->_accessoryItemsUpdateFlags;
  needsUpdate = self->_accessoryItemsUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_accessoryItemsUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_accessoryItemsUpdateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_accessoryItemsUpdateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGItemsLayout _invalidateAccessoryItems]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGItemsLayout.m"), 724, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_accessoryItemsUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_accessoryItemsUpdateFlags.willPerformUpdate;
  p_accessoryItemsUpdateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateAccessoryItems
{
  uint64_t v3;
  uint64_t v4;
  PXGLayout *v5;
  PXGLayout *v6;
  void *v7;
  void *accessoryItemsContainerLayout;
  void *v9;

  v3 = -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems");
  v4 = v3;
  if (v3 < 1)
  {
    if (!v3 && self->_accessoryItemsContainerLayout)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGLayout removeSublayoutsAtIndexes:](self, "removeSublayoutsAtIndexes:", v9);

      accessoryItemsContainerLayout = self->_accessoryItemsContainerLayout;
      self->_accessoryItemsContainerLayout = 0;
      goto LABEL_7;
    }
  }
  else if (!self->_accessoryItemsContainerLayout)
  {
    v5 = objc_alloc_init(PXGLayout);
    v6 = self->_accessoryItemsContainerLayout;
    self->_accessoryItemsContainerLayout = v5;

    -[PXGItemsLayout accessoryItemContentSource](self, "accessoryItemContentSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout setContentSource:](self->_accessoryItemsContainerLayout, "setContentSource:", v7);

    -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", self->_accessoryItemsContainerLayout, 0);
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    accessoryItemsContainerLayout = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(accessoryItemsContainerLayout, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, 1, 0, &__block_literal_global_83);
LABEL_7:

  }
  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self->_accessoryItemsContainerLayout, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, v4, 0, 0);
  -[PXGItemsLayout accessoryItemsDidChange](self, "accessoryItemsDidChange");
}

- (int64_t)itemForObjectReference:(id)a3
{
  return -[PXGItemsLayout itemForObjectReference:options:](self, "itemForObjectReference:options:", a3, 0);
}

- (int64_t)itemForObjectReference:(id)a3 options:(unint64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a3;
  if (v6 && (self->_delegateRespondsTo & 1) != 0)
  {
    -[PXGItemsLayout delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "itemsLayout:itemForObjectReference:options:", self, v6, a4);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)objectReferenceForItem:(int64_t)a3
{
  void *v4;
  void *v6;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL && (self->_delegateRespondsTo & 2) != 0)
  {
    -[PXGItemsLayout delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemsLayout:objectReferenceForItem:", self, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setLazy:(BOOL)a3
{
  if (self->_lazy != a3)
  {
    self->_lazy = a3;
    -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  }
}

- (_NSRange)itemsToLoad
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v3 = 0;
  result.length = v2;
  result.location = v3;
  return result;
}

- (CGSize)sizeForItem:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *(double *)off_1E50B8810;
  v4 = *((double *)off_1E50B8810 + 1);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)modifyAccessoryItemSpritesInRange:(_PXGSpriteIndexRange)a3 state:(id)a4
{
  -[PXGLayout modifySpritesInRange:state:](self->_accessoryItemsContainerLayout, "modifySpritesInRange:state:", a3, a4);
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, PXGItemsLayout *, char *))a3 + 2))(a3, self, &v3);
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXGItemsLayout itemsGeometry](self, "itemsGeometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemsInRect:inLayout:", self, x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGItemsLayout spriteIndexesForItems:](self, "spriteIndexesForItems:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_handleFocusChangeWithUserInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  id v12;

  v4 = a3;
  v12 = 0;
  PXGAXGetFocusFromAndToInfosForUserInfo(v4, 0, &v12);
  v5 = v12;
  v6 = v5;
  if (v5)
  {
    v7 = self->_currentStylableItems[1];
    objc_msgSend(v5, "axContainingGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout axGroup](self, "axGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      v11 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", objc_msgSend(v6, "spriteIndex"));
      PXGAXAddSimpleIndexPathGroupChangeUserInfo(v4, 0, 0, &v11);
      v10 = v11;
    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v7 != v10)
      -[PXGItemsLayout setItem:forStylableType:animated:](self, "setItem:forStylableType:animated:");
  }

}

- (void)_handleSelectionChangeWithUserInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;

  v4 = a3;
  v10 = 0;
  PXGAXGetSelectionFromAndToInfosForUserInfo(v4, &v10);
  v5 = v10;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "axContainingGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout axGroup](self, "axGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      v9 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", objc_msgSend(v6, "spriteIndex"));
      PXGAXAddSimpleIndexPathGroupChangeUserInfo(v4, 0, 0, &v9);
    }
  }

}

- (int64_t)numberOfAccessoryItems
{
  return self->_numberOfAccessoryItems;
}

- (PXGLayoutContentSource)accessoryItemContentSource
{
  return (PXGLayoutContentSource *)objc_loadWeakRetained((id *)&self->_accessoryItemContentSource);
}

- (id)dropTargetObjectReference
{
  return self->_dropTargetObjectReference;
}

- (unint64_t)dropTargetStyle
{
  return self->_dropTargetStyle;
}

- (PXGItemsGeometry)itemsGeometry
{
  return self->_itemsGeometry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsGeometry, 0);
  objc_storeStrong(&self->_dropTargetObjectReference, 0);
  objc_destroyWeak((id *)&self->_accessoryItemContentSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryItemsContainerLayout, 0);
}

__n128 __39__PXGItemsLayout__updateAccessoryItems__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;

  result = *(__n128 *)off_1E50B8308;
  *(_OWORD *)(a3 + 48) = *(_OWORD *)off_1E50B8308;
  *(_QWORD *)(a3 + 64) = *((_QWORD *)off_1E50B8308 + 2);
  return result;
}

uint64_t __38__PXGItemsLayout__updateStylableType___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  double v11;
  float32x2_t v12;
  uint64_t v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  float64x2_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double v35;
  float32x2_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "spriteIndexForItem:", a2);
  if ((_DWORD)result != -1)
  {
    v7 = result;
    v8 = 0uLL;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = *(void **)(a1 + 32);
    if (v9 && (objc_msgSend(v9, "styleForSpriteAtIndex:", v7), v10 = *(void **)(a1 + 32), v8 = 0uLL, v22 = 0u, v10))
    {
      objc_msgSend(v10, "geometryForSpriteAtIndex:", v7);
      v12 = 0;
      v11 = 0.0;
    }
    else
    {
      v22 = v8;
      v11 = 0.0;
      v12 = 0;
    }
    if (a3)
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = 0.0;
      if (v13 == 1)
        v14 = 1.0;
      if (v13 == 2)
        v14 = -1.0;
      v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 944) + 8 * *(_QWORD *)(a1 + 48));
      LODWORD(v42) = -1093874483;
      v11 = 0.0 + -0.4;
      v12 = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(0), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v14, 0), v15));
    }
    else if (*(_QWORD *)(a1 + 48) != 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "sizeForItem:", a2);
      v20 = v17;
      v21 = v16;
      if ((PXSizeIsNull() & 1) == 0)
      {
        LODWORD(v42) = 0;
        *(_QWORD *)&v18.f64[0] = v21;
        *(_QWORD *)&v18.f64[1] = v20;
        v12 = vcvt_f32_f64(v18);
        v11 = 0.0;
      }
    }
    v19 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __38__PXGItemsLayout__updateStylableType___block_invoke_2;
    v23[3] = &__block_descriptor_224_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    v30 = v43;
    v31 = v44;
    v32 = v45;
    v33 = v46;
    v26 = v39;
    v27 = v40;
    v28 = v41;
    v29 = v42;
    v24 = v37;
    v25 = v38;
    v34 = v22;
    v35 = v11;
    v36 = v12;
    return objc_msgSend(v19, "modifySpritesInRange:state:", v7 | 0x100000000, v23, v20, v21);
  }
  return result;
}

void __38__PXGItemsLayout__updateStylableType___block_invoke_3(void *a1)
{
  id v1;
  double v2;
  id v3;

  v1 = a1;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardAnimationDuration");
  objc_msgSend(v1, "setDuration:");
  objc_msgSend(v3, "keyboardDampingRatio");
  *(float *)&v2 = v2;
  objc_msgSend(v1, "setDampingRatio:", v2);
  objc_msgSend(v1, "setScope:", 1);

}

__n128 __38__PXGItemsLayout__updateStylableType___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __n128 result;
  __int128 v12;

  v4 = *(_OWORD *)(a1 + 48);
  *a4 = *(_OWORD *)(a1 + 32);
  a4[1] = v4;
  v5 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 80);
  v7 = *(_OWORD *)(a1 + 112);
  a4[4] = *(_OWORD *)(a1 + 96);
  a4[5] = v7;
  a4[2] = v5;
  a4[3] = v6;
  v8 = *(_OWORD *)(a1 + 128);
  v9 = *(_OWORD *)(a1 + 144);
  v10 = *(_OWORD *)(a1 + 176);
  a4[8] = *(_OWORD *)(a1 + 160);
  a4[9] = v10;
  a4[6] = v8;
  a4[7] = v9;
  result = *(__n128 *)(a1 + 192);
  v12 = *(_OWORD *)(a1 + 208);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v12;
  return result;
}

uint64_t __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _WORD *v8;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v6 = result;
    v7 = a2;
    v8 = (_WORD *)(a5 + 32);
    do
    {
      objc_msgSend(*(id *)(v6 + 32), "indexAfterRevertingChangesFromIndex:", v7);
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
      if ((_DWORD)result)
        ++*v8;
      v8 += 20;
      ++v7;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  _WORD *v8;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v6 = a2;
    v7 = result;
    v8 = (_WORD *)(a5 + 32);
    do
    {
      objc_msgSend(*(id *)(v7 + 32), "indexAfterRevertingChangesFromIndex:", *(_QWORD *)(v7 + 56) + v6);
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v7 + 48) + 16))();
      if ((_DWORD)result)
        ++*v8;
      ++v6;
      v8 += 20;
      --v5;
    }
    while (v5);
  }
  return result;
}

@end

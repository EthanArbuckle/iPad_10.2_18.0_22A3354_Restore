@implementation PUViewControllerSpec

- (PUViewControllerSpec)init
{
  PUViewControllerSpec *v2;
  uint64_t v3;
  NSHashTable *changeObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUViewControllerSpec;
  v2 = -[PUViewControllerSpec init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    changeObservers = v2->__changeObservers;
    v2->__changeObservers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)performChanges:(id)a3
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewControllerSpec.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changes != NULL"));

  }
  -[PUViewControllerSpec _willChange](self, "_willChange");
  v6[2]();
  -[PUViewControllerSpec _didChange](self, "_didChange");

}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUViewControllerSpec _changeObservers](self, "_changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUViewControllerSpec _changeObservers](self, "_changeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)assertInsideChangesBlock
{
  void *v4;
  id v5;

  -[PUViewControllerSpec currentChange](self, "currentChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewControllerSpec.m"), 47, CFSTR("not within a change block"));

  }
}

- (BOOL)isValid
{
  return -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") != 0;
}

- (void)setTraitCollection:(id)a3
{
  void *v5;
  UITraitCollection *v6;

  v6 = (UITraitCollection *)a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_traitCollection != v6)
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    -[PUViewControllerSpec currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTraitCollectionChanged:", 1);

    -[PUViewControllerSpec _invalidateLayoutStyle](self, "_invalidateLayoutStyle");
  }

}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;

  height = a3.height;
  width = a3.width;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (width != self->_layoutReferenceSize.width || height != self->_layoutReferenceSize.height)
  {
    self->_layoutReferenceSize.width = width;
    self->_layoutReferenceSize.height = height;
    -[PUViewControllerSpec currentChange](self, "currentChange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLayoutReferenceSizeChanged:", 1);

    -[PUViewControllerSpec _invalidateLayoutStyle](self, "_invalidateLayoutStyle");
  }
}

- (void)setPresentedForSecondScreen:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_presentedForSecondScreen != v3)
  {
    self->_presentedForSecondScreen = v3;
    -[PUViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentedForSecondScreenChanged:", 1);

  }
}

- (void)setSecondScreenSize:(CGSize)a3
{
  double height;
  double width;
  id v7;

  height = a3.height;
  width = a3.width;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (width != self->_secondScreenSize.width || height != self->_secondScreenSize.height)
  {
    self->_secondScreenSize.width = width;
    self->_secondScreenSize.height = height;
    -[PUViewControllerSpec currentChange](self, "currentChange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSecondScreenSizeChanged:", 1);

  }
}

- (void)setPrefersCompactLayoutForSplitScreen:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_prefersCompactLayoutForSplitScreen != v3)
  {
    self->_prefersCompactLayoutForSplitScreen = v3;
    -[PUViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersCompactLayoutForSplitScreenChanged:", 1);

  }
}

- (id)newSpecChange
{
  return objc_alloc_init(PUViewControllerSpecChange);
}

- (void)_willChange
{
  int64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = -[PUViewControllerSpec _changeCount](self, "_changeCount");
  -[PUViewControllerSpec _setChangeCount:](self, "_setChangeCount:", v4 + 1);
  if (!v4)
  {
    v5 = -[PUViewControllerSpec newSpecChange](self, "newSpecChange");
    v7 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewControllerSpec.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentChange != nil"));

      v5 = 0;
    }
    -[PUViewControllerSpec _setCurrentChange:](self, "_setCurrentChange:", v5);

  }
}

- (void)_didChange
{
  int64_t v3;
  id v4;

  v3 = -[PUViewControllerSpec _changeCount](self, "_changeCount") - 1;
  -[PUViewControllerSpec _setChangeCount:](self, "_setChangeCount:", v3);
  if (!v3)
  {
    -[PUViewControllerSpec updateIfNeeded](self, "updateIfNeeded");
    -[PUViewControllerSpec currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PUViewControllerSpec _setCurrentChange:](self, "_setCurrentChange:", 0);
    -[PUViewControllerSpec _publishChange:](self, "_publishChange:", v4);

  }
}

- (void)_publishChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "changed"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PUViewControllerSpec _changeObservers](self, "_changeObservers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "viewControllerSpec:didChange:", self, v4);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)_invalidateLayoutStyle
{
  -[PUViewControllerSpec _setNeedsUpdateLayoutStyle:](self, "_setNeedsUpdateLayoutStyle:", 1);
}

- (CGSize)_portraitOrientedSizeForSize:(CGSize)result
{
  double height;
  double v4;

  if (result.width <= result.height)
    height = result.height;
  else
    height = result.width;
  if (result.width > result.height)
    result.width = result.height;
  v4 = height;
  result.height = v4;
  return result;
}

- (void)_updateCurrentLayoutStyleIfNeeded
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;
  uint64_t v20;
  double v21;
  void *v22;

  if (-[PUViewControllerSpec _needsUpdateLayoutStyle](self, "_needsUpdateLayoutStyle"))
  {
    -[PUViewControllerSpec traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUViewControllerSpec layoutReferenceSize](self, "layoutReferenceSize");
    v5 = v22;
    if (v22)
    {
      v6 = v3;
      v7 = v4;
      v8 = objc_msgSend(v22, "horizontalSizeClass");
      v5 = v22;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_referenceBounds");
        v11 = v10;
        v13 = v12;

        -[PUViewControllerSpec _portraitOrientedSizeForSize:](self, "_portraitOrientedSizeForSize:", v6, v7);
        v15 = v14;
        v17 = v16;
        v18 = -[PUViewControllerSpec prefersCompactLayoutForSplitScreen](self, "prefersCompactLayoutForSplitScreen");
        -[PUViewControllerSpec _setNeedsUpdateLayoutStyle:](self, "_setNeedsUpdateLayoutStyle:", 0);
        if (objc_msgSend(v22, "horizontalSizeClass") == 2
          && (v17 < v13 ? (v19 = 1) : (v19 = v15 < v11), objc_msgSend(v22, "verticalSizeClass") == 2 && (!v18 || !v19)))
        {
          v20 = 4;
        }
        else
        {
          v21 = fmin(v7, v6);
          if (v21 <= 400.0)
          {
            if (v21 <= 350.0)
              v20 = 1;
            else
              v20 = 2;
          }
          else
          {
            v20 = 3;
          }
        }
        -[PUViewControllerSpec _setCurrentLayoutStyle:](self, "_setCurrentLayoutStyle:", v20);
        v5 = v22;
      }
    }

  }
}

- (void)_setCurrentChange:(id)a3
{
  objc_storeStrong((id *)&self->_currentChange, a3);
}

- (void)_setCurrentLayoutStyle:(int64_t)a3
{
  id v5;

  -[PUViewControllerSpec assertInsideChangesBlock](self, "assertInsideChangesBlock");
  if (self->_currentLayoutStyle != a3)
  {
    self->_currentLayoutStyle = a3;
    -[PUViewControllerSpec currentChange](self, "currentChange");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutStyleChanged:", 1);

  }
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isPresentedForSecondScreen
{
  return self->_presentedForSecondScreen;
}

- (CGSize)secondScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_secondScreenSize.width;
  height = self->_secondScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)prefersCompactLayoutForSplitScreen
{
  return self->_prefersCompactLayoutForSplitScreen;
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (int64_t)_changeCount
{
  return self->__changeCount;
}

- (void)_setChangeCount:(int64_t)a3
{
  self->__changeCount = a3;
}

- (BOOL)_needsUpdateLayoutStyle
{
  return self->__needsUpdateLayoutStyle;
}

- (void)_setNeedsUpdateLayoutStyle:(BOOL)a3
{
  self->__needsUpdateLayoutStyle = a3;
}

- (int64_t)currentLayoutStyle
{
  return self->_currentLayoutStyle;
}

- (PUViewControllerSpecChange)currentChange
{
  return self->_currentChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChange, 0);
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end

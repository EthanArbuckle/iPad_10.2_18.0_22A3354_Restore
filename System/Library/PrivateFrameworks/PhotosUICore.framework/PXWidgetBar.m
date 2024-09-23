@implementation PXWidgetBar

- (PXWidgetBar)init
{
  return -[PXWidgetBar initWithScrollViewController:](self, "initWithScrollViewController:", 0);
}

- (PXWidgetBar)initWithScrollViewController:(id)a3
{
  id v4;
  PXWidgetBar *v5;
  PXWidgetBar *v6;
  uint64_t v7;
  PXBasicTileAnimator *tileAnimator;
  uint64_t v9;
  NSMutableSet *tilesInUse;
  PXWidgetBarLayout *v11;
  PXWidgetBarLayout *layout;
  PXWidgetBarLayout *v13;
  PXTilingController *v14;
  PXTilingController *tilingController;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXWidgetBar;
  v5 = -[PXWidgetBar init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollViewController, v4);
    -[PXWidgetBar createTileAnimator](v6, "createTileAnimator");
    v7 = objc_claimAutoreleasedReturnValue();
    tileAnimator = v6->__tileAnimator;
    v6->__tileAnimator = (PXBasicTileAnimator *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    tilesInUse = v6->__tilesInUse;
    v6->__tilesInUse = (NSMutableSet *)v9;

    v11 = objc_alloc_init(PXWidgetBarLayout);
    layout = v6->__layout;
    v6->__layout = v11;
    v13 = v11;

    v14 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", v13);
    tilingController = v6->_tilingController;
    v6->_tilingController = v14;

    -[PXTilingController setScrollController:](v6->_tilingController, "setScrollController:", v4);
    -[PXTilingController setTileAnimator:](v6->_tilingController, "setTileAnimator:", v6->__tileAnimator);
    -[PXTilingController setTileSource:](v6->_tilingController, "setTileSource:", v6);
    -[PXTilingController setTransitionDelegate:](v6->_tilingController, "setTransitionDelegate:", v6);

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didSelectSubtitle = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.didSelectDisclosureAffordance = objc_opt_respondsToSelector() & 1;
  }

}

- (void)didSelectSubtitle
{
  id v3;

  if (self->_delegateRespondsTo.didSelectSubtitle)
  {
    -[PXWidgetBar delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "widgetBarDidSelectSubtitle:", self);

  }
}

- (void)didSelectDisclosureAffordance
{
  id v3;

  if (self->_delegateRespondsTo.didSelectDisclosureAffordance)
  {
    -[PXWidgetBar delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "widgetBarDidSelectDisclosureAffordance:", self);

  }
}

- (id)createTileAnimator
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetBar.m"), 94, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXWidgetBar createTileAnimator]", v6);

  abort();
}

- (id)checkOutTileWithKind:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetBar.m"), 98, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXWidgetBar checkOutTileWithKind:]", v7);

  abort();
}

- (void)checkInTile:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetBar.m"), 102, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXWidgetBar checkInTile:]", v8);

  abort();
}

- (id)createView
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetBar.m"), 106, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXWidgetBar createView]", v6);

  abort();
}

- (double)viewHeight
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetBar.m"), 114, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXWidgetBar viewHeight]", v6);

  abort();
}

- (void)_setViewHeight:(double)a3
{
  if (self->__viewHeight != a3)
  {
    self->__viewHeight = a3;
    -[PXWidgetBar _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)setAllowUserInteractionWithSubtitle:(BOOL)a3
{
  if (self->_allowUserInteractionWithSubtitle != a3)
  {
    self->_allowUserInteractionWithSubtitle = a3;
    -[PXWidgetBar invalidateView](self, "invalidateView");
  }
}

- (void)performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
    -[PXWidgetBar _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.view || self->_needsUpdateFlags.viewHeight || self->_needsUpdateFlags.layout;
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetBar.m"), 157, CFSTR("not inside -performChanges: or -update"));

  }
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PXWidgetBar _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXWidgetBar _updateViewIfNeeded](self, "_updateViewIfNeeded");
    -[PXWidgetBar _updateViewHeightIfNeeded](self, "_updateViewHeightIfNeeded");
    -[PXWidgetBar _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)invalidateView
{
  self->_needsUpdateFlags.view = 1;
  -[PXWidgetBar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateViewIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.view)
  {
    self->_needsUpdateFlags.view = 0;
    -[PXWidgetBar view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[PXWidgetBar createView](self, "createView");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_view, v3);
      -[PXWidgetBar invalidateViewHeight](self, "invalidateViewHeight");
    }
    -[PXWidgetBar updateView](self, "updateView");

  }
}

- (void)invalidateViewHeight
{
  self->_needsUpdateFlags.viewHeight = 1;
  -[PXWidgetBar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateViewHeightIfNeeded
{
  if (self->_needsUpdateFlags.viewHeight)
  {
    self->_needsUpdateFlags.viewHeight = 0;
    -[PXWidgetBar viewHeight](self, "viewHeight");
    -[PXWidgetBar _setViewHeight:](self, "_setViewHeight:");
  }
}

- (void)_invalidateLayout
{
  self->_needsUpdateFlags.layout = 1;
  -[PXWidgetBar _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLayoutIfNeeded
{
  double v3;
  double v4;
  id v5;

  if (self->_needsUpdateFlags.layout)
  {
    self->_needsUpdateFlags.layout = 0;
    -[PXWidgetBar _viewHeight](self, "_viewHeight");
    v4 = v3;
    -[PXWidgetBar _layout](self, "_layout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHeight:", v4);

  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7;
  __int128 v8;
  __int128 v9;
  _BOOL4 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  _OWORD v18[5];
  unint64_t v19;
  _QWORD v20[11];

  v7 = a4;
  +[PXWidgetBarLayout tileIdentifier](PXWidgetBarLayout, "tileIdentifier");
  v8 = *(_OWORD *)&a3->index[5];
  v18[2] = *(_OWORD *)&a3->index[3];
  v18[3] = v8;
  v18[4] = *(_OWORD *)&a3->index[7];
  v19 = a3->index[9];
  v9 = *(_OWORD *)&a3->index[1];
  v18[0] = *(_OWORD *)&a3->length;
  v18[1] = v9;
  v10 = *(_QWORD *)&v18[0] == v20[0];
  if (*(_QWORD *)&v18[0] && *(_QWORD *)&v18[0] == v20[0])
  {
    v11 = 1;
    do
    {
      v12 = *((_QWORD *)v18 + v11);
      v13 = v20[v11];
      v10 = v12 == v13;
      if (v11 >= *(_QWORD *)&v18[0])
        break;
      ++v11;
    }
    while (v12 == v13);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetBar.m"), 235, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXWidgetBar checkOutTileWithKind:](self, "checkOutTileWithKind:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetBar _tilesInUse](self, "_tilesInUse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v14);

  return v14;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v5;
  id v6;

  v5 = a3;
  -[PXWidgetBar checkInTile:](self, "checkInTile:", v5);
  -[PXWidgetBar _tilesInUse](self, "_tilesInUse");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  return objc_alloc_init(PXTileIdentifierIdentityConverter);
}

- (PXScrollViewController)scrollViewController
{
  return (PXScrollViewController *)objc_loadWeakRetained((id *)&self->_scrollViewController);
}

- (PXWidgetBarDelegate)delegate
{
  return (PXWidgetBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXTilingController)tilingController
{
  return self->_tilingController;
}

- (PXWidgetBarSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (void)setDisclosureTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return self->_allowUserInteractionWithSubtitle;
}

- (PXBasicTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (double)_viewHeight
{
  return self->__viewHeight;
}

- (PXWidgetBarLayout)_layout
{
  return self->__layout;
}

- (PXAnonymousView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->__layout, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollViewController);
}

@end

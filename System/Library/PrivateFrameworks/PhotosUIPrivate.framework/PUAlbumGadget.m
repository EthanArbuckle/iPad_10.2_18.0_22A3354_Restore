@implementation PUAlbumGadget

- (PUAlbumGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumGadget.m"), 46, CFSTR("%s is not available as initializer"), "-[PUAlbumGadget init]");

  abort();
}

- (PUAlbumGadget)initWithCollection:(id)a3 albumGadgetDelegate:(id)a4
{
  id v7;
  id v8;
  PUAlbumGadget *v9;
  PUAlbumGadget *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUAlbumGadget;
  v9 = -[PUAlbumGadget init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeWeak((id *)&v10->_albumGadgetDelegate, v8);
  }

  return v10;
}

- (void)reconfigure
{
  -[PUAlbumGadget setNeedsUpdate:](self, "setNeedsUpdate:", 1);
  if (-[PUAlbumGadget isContentViewVisible](self, "isContentViewVisible"))
    -[PUAlbumGadget _updateContent](self, "_updateContent");
}

- (void)_updateContent
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  if (-[PUAlbumGadget needsUpdate](self, "needsUpdate"))
  {
    v3 = -[PUAlbumGadget isContentViewVisible](self, "isContentViewVisible");
    -[PUAlbumGadget albumListCellContentViewHelper](self, "albumListCellContentViewHelper");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PUAlbumGadget albumListCellContentView](self, "albumListCellContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumGadget collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumGadget title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configureAlbumListCellContentView:forCollection:title:animated:enabled:editing:", v4, v5, v6, v3, 1, 0);

    -[PUAlbumGadget setNeedsUpdate:](self, "setNeedsUpdate:", 0);
    objc_msgSend(v11, "albumCellSize");
    v8 = v7;
    -[PUAlbumGadget lastPreferredHeight](self, "lastPreferredHeight");
    if (v9 != v8)
    {
      -[PUAlbumGadget setLastPreferredHeight:](self, "setLastPreferredHeight:", v8);
      -[PUAlbumGadget delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "gadget:didChange:", self, 64);

    }
  }
}

- (void)setCollection:(id)a3
{
  PHCollection *v5;
  PXAssetCollectionActionManager *actionManager;
  PHCollection *v7;

  v5 = (PHCollection *)a3;
  if (self->_collection != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_collection, a3);
    actionManager = self->_actionManager;
    self->_actionManager = 0;

    -[PUAlbumGadget setNeedsUpdate:](self, "setNeedsUpdate:", 1);
    v5 = v7;
  }

}

- (void)setAlbumGadgetDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_albumGadgetDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_albumGadgetDelegate, obj);
    -[PUAlbumGadget setNeedsUpdate:](self, "setNeedsUpdate:", 1);
    v5 = obj;
  }

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[PUAlbumGadget collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PXAssetCollectionActionManager)actionManager
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXAssetCollectionActionManager *actionManager;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  if (!self->_actionManager)
  {
    -[PUAlbumGadget collection](self, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canContainAssets");

    if (v5)
    {
      -[PUAlbumGadget albumGadgetDelegate](self, "albumGadgetDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actionPerformerDelegateForAlbum:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAlbumGadget collection](self, "collection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_5:
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6C8]), "initWithAssetCollection:displayTitleInfo:", v8, 0);
          objc_msgSend(v9, "setPerformerDelegate:", v7);
          actionManager = self->_actionManager;
          self->_actionManager = (PXAssetCollectionActionManager *)v9;

          return self->_actionManager;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "px_descriptionForAssertionMessage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumGadget.m"), 110, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.collection"), v14, v16);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumGadget.m"), 110, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.collection"), v14);
      }

      goto LABEL_5;
    }
  }
  return self->_actionManager;
}

- (PUAlbumListCellContentView)albumListCellContentView
{
  PUAlbumListCellContentView *albumListCellContentView;
  PUAlbumListCellContentView *v4;
  PUAlbumListCellContentView *v5;

  albumListCellContentView = self->_albumListCellContentView;
  if (!albumListCellContentView)
  {
    v4 = objc_alloc_init(PUAlbumListCellContentView);
    -[PUAlbumListCellContentView setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    -[PUAlbumGadget setNeedsUpdate:](self, "setNeedsUpdate:", 1);
    v5 = self->_albumListCellContentView;
    self->_albumListCellContentView = v4;

    albumListCellContentView = self->_albumListCellContentView;
  }
  return albumListCellContentView;
}

- (void)setIndexesOfHiddenStackItems:(id)a3
{
  NSIndexSet *v4;
  void *v5;
  char v6;
  NSIndexSet *v7;
  NSIndexSet *v8;
  NSIndexSet *indexesOfHiddenStackItems;
  void *v10;
  uint64_t v11;
  NSIndexSet *v12;

  v12 = (NSIndexSet *)a3;
  v4 = self->_indexesOfHiddenStackItems;
  v5 = v12;
  if (v4 == v12)
  {
LABEL_6:

    v7 = v12;
    goto LABEL_7;
  }
  v6 = -[NSIndexSet isEqual:](v12, "isEqual:", v4);

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    v8 = (NSIndexSet *)-[NSIndexSet copy](v12, "copy");
    indexesOfHiddenStackItems = self->_indexesOfHiddenStackItems;
    self->_indexesOfHiddenStackItems = v8;

    -[PUAlbumGadget albumListCellContentView](self, "albumListCellContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "numberOfVisibleItems") >= 1)
    {
      v11 = 0;
      do
      {
        objc_msgSend(v5, "setImageHidden:forItemAtIndex:", -[NSIndexSet containsIndex:](v12, "containsIndex:", v11), v11);
        ++v11;
      }
      while (v11 < objc_msgSend(v5, "numberOfVisibleItems"));
    }
    goto LABEL_6;
  }
LABEL_7:

}

- (CGRect)rectForStackItemAtIndex:(int64_t)a3 inCoordinateSpace:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v6 = a4;
  -[PUAlbumGadget albumListCellContentView](self, "albumListCellContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rectOfStackItemAtIndex:inCoordinateSpace:", a3, v6);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int64_t)estimatedIndexInCollection:(id)a3 ofAssetForStackItemAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  -[PUAlbumGadget albumListCellContentViewHelper](self, "albumListCellContentViewHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumGadget albumListCellContentView](self, "albumListCellContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "estimatedIndexOfAssetForStackItemAtIndex:inCollection:albumListCellContentView:", a4, v6, v8);

  return v9;
}

- (unint64_t)gadgetType
{
  return 12;
}

- (unint64_t)gadgetCapabilities
{
  void *v2;
  unint64_t v3;

  -[PUAlbumGadget collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "px_assetsDropMode") != 0) | 2;

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PUAlbumGadget albumListCellContentViewHelper](self, "albumListCellContentViewHelper", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "albumCellSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (PUAlbumListCellContentViewHelper)albumListCellContentViewHelper
{
  void *v3;
  void *v4;

  -[PUAlbumGadget albumGadgetDelegate](self, "albumGadgetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "albumListCellContentViewHelperForAlbum:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PUAlbumListCellContentViewHelper *)v4;
}

- (void)contentViewWillAppear
{
  -[PUAlbumGadget setContentViewVisible:](self, "setContentViewVisible:", 1);
  -[PUAlbumGadget _updateContent](self, "_updateContent");
}

- (void)contentViewDidDisappear
{
  -[PUAlbumGadget setContentViewVisible:](self, "setContentViewVisible:", 0);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PUAlbumGadget title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  -[PUAlbumGadget albumListCellContentViewHelper](self, "albumListCellContentViewHelper", a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumCellSize");
  v7 = v6 * 1.10000002;
  objc_msgSend(v5, "albumCellSize");
  v9 = v8 * 1.10000002;
  objc_msgSend(v5, "previewInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14 + v7 + v12;
  v17 = v16 + v9 + v10;
  v18 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v18, "setPreferredContentSize:", v15, v17);
  -[PUAlbumGadget albumListCellContentView](self, "albumListCellContentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "snapshotViewAfterScreenUpdates:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v20);

  objc_msgSend(v20, "setFrame:", v13, v11, v7, v9);
  return v18;
}

- (id)contextMenuWithSuggestedActions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PUAlbumGadget actionManager](self, "actionManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D7B180];
    -[PUAlbumGadget actionManager](self, "actionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextMenuWithActionManager:overrideActions:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B138]), "initWithActionType:", CFSTR("Dummy"));
    -[PUAlbumGadget albumGadgetDelegate](self, "albumGadgetDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionPerformerDelegateForAlbum:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "presentationEnvironmentForActionPerformer:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "undoManagerForActionPerformer:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumGadget collection](self, "collection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXCollectionActionMenuForCollection();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PUAlbumGadget collection](self, "collection", a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D7B2E8]);
  v6 = *MEMORY[0x1E0D7C338];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PUAlbumGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
  v10[3] = &unk_1E58A7F10;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "registerItemForIdentifier:loadHandler:", v6, v10);
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHCollection)collection
{
  return self->_collection;
}

- (PUAlbumGadgetDelegate)albumGadgetDelegate
{
  return (PUAlbumGadgetDelegate *)objc_loadWeakRetained((id *)&self->_albumGadgetDelegate);
}

- (NSIndexSet)indexesOfHiddenStackItems
{
  return self->_indexesOfHiddenStackItems;
}

- (BOOL)isContentViewVisible
{
  return self->_contentViewVisible;
}

- (void)setContentViewVisible:(BOOL)a3
{
  self->_contentViewVisible = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (double)lastPreferredHeight
{
  return self->_lastPreferredHeight;
}

- (void)setLastPreferredHeight:(double)a3
{
  self->_lastPreferredHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfHiddenStackItems, 0);
  objc_destroyWeak((id *)&self->_albumGadgetDelegate);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_albumListCellContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

id __71__PUAlbumGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = *MEMORY[0x1E0D7C2E8];
  v5[1] = CFSTR("Debug Description");
  v6[0] = CFSTR("Album Diagnostics");
  objc_msgSend(*(id *)(a1 + 32), "px_debugDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

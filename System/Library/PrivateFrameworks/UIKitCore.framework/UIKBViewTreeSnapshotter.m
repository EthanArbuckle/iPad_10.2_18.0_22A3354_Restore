@implementation UIKBViewTreeSnapshotter

+ (id)snapshotterForKeyboardView:(id)a3 afterScreenUpdates:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  UIKBViewTreeSnapshotter *v6;
  _UIViewBlockVisitor *v7;
  UIKBViewTreeSnapshotter *v8;
  _UIViewBlockVisitor *v9;
  uint64_t v10;
  UIView *snapshotView;
  UIKBViewTreeSnapshotter *v12;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t, void *);
  void *v17;
  UIKBViewTreeSnapshotter *v18;
  BOOL v19;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(UIKBViewTreeSnapshotter);
  v7 = [_UIViewBlockVisitor alloc];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __73__UIKBViewTreeSnapshotter_snapshotterForKeyboardView_afterScreenUpdates___block_invoke;
  v17 = &unk_1E16BF610;
  v19 = v4;
  v8 = v6;
  v18 = v8;
  v9 = -[_UIViewBlockVisitor initWithTraversalDirection:visitorBlock:](v7, "initWithTraversalDirection:visitorBlock:", 2, &v14);
  -[_UIViewVisitor setVisitMaskViews:](v9, "setVisitMaskViews:", 0, v14, v15, v16, v17);
  objc_msgSend(v5, "_receiveVisitor:", v9);
  objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", v4);
  v10 = objc_claimAutoreleasedReturnValue();

  snapshotView = v8->_snapshotView;
  v8->_snapshotView = (UIView *)v10;

  if (v8->_snapshotView)
    v12 = v8;
  else
    v12 = 0;

  return v12;
}

BOOL __73__UIKBViewTreeSnapshotter_snapshotterForKeyboardView_afterScreenUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v3, "prepareForSnapshotting");
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (!v5)
    {
      v6 = objc_opt_new();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 8);
      *(_QWORD *)(v7 + 8) = v6;

      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    }
    objc_msgSend(v5, "addObject:", v3);
  }

  return (isKindOfClass & 1) == 0;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_inputViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "restoreFromSnapshotting");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)UIKBViewTreeSnapshotter;
  -[UIKBViewTreeSnapshotter dealloc](&v8, sel_dealloc);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_inputViews, 0);
}

@end

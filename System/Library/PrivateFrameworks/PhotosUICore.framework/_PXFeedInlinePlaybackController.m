@implementation _PXFeedInlinePlaybackController

- (_PXFeedInlinePlaybackController)initWithContainerLayout:(id)a3 viewModel:(id)a4 itemLayoutDesiredPlayStateSetter:(id)a5
{
  id v8;
  id v9;
  _PXFeedInlinePlaybackController *v10;
  _PXFeedInlinePlaybackController *v11;
  uint64_t v12;
  id itemLayoutDesiredPlayStateSetter;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_PXFeedInlinePlaybackController;
  v10 = -[PXGridInlinePlaybackController init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_containerLayout, a3);
    v12 = objc_msgSend(v9, "copy");
    itemLayoutDesiredPlayStateSetter = v11->_itemLayoutDesiredPlayStateSetter;
    v11->_itemLayoutDesiredPlayStateSetter = (id)v12;

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inlinePlaybackCriticalInsets");

    PXEdgeInsetsMake();
    v11->_criticallyVisibleEdgeInsets.top = v15;
    v11->_criticallyVisibleEdgeInsets.left = v16;
    v11->_criticallyVisibleEdgeInsets.bottom = v17;
    v11->_criticallyVisibleEdgeInsets.right = v18;
  }

  return v11;
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PXFeedInlinePlaybackRecord *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PXGridInlinePlaybackRecord initWithDisplayAsset:mediaProvider:geometryReference:]([_PXFeedInlinePlaybackRecord alloc], "initWithDisplayAsset:mediaProvider:geometryReference:", v10, v9, v8);

  -[_PXFeedInlinePlaybackRecord setInlinePlaybackController:](v11, "setInlinePlaybackController:", self);
  return v11;
}

- (CGRect)currentVisibleRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[_PXFeedInlinePlaybackController containerLayout](self, "containerLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)currentHoveredDisplayAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  -[_PXFeedInlinePlaybackController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pendingIndexPath");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }

  if ((_QWORD)v14 == *(_QWORD *)off_1E50B7E98)
  {
    v6 = 0;
  }
  else
  {
    -[_PXFeedInlinePlaybackController viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v14;
    v13[1] = v15;
    objc_msgSend(v8, "objectReferenceAtIndexPath:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v6, "keyAssetReference");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
LABEL_13:
  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  void *v5;
  void *v6;
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
  double v18;
  CGRect result;

  -[_PXFeedInlinePlaybackController _itemLayoutForPlaybackRecord:](self, "_itemLayoutForPlaybackRecord:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXFeedInlinePlaybackController containerLayout](self, "containerLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  PXRectWithOriginAndSize();
  objc_msgSend(v6, "convertRect:fromDescendantLayout:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)canPlayAsset:(id)a3
{
  void *v3;
  char v4;

  if ((unint64_t)(objc_msgSend(a3, "playbackStyle") - 3) > 2)
    return 0;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsInlinePlayback");

  return v4;
}

- (id)_itemLayoutForPlaybackRecord:(id)a3
{
  return (id)objc_msgSend(a3, "geometryReference");
}

- (void)_playbackRecord:(id)a3 setDesiredPlayState:(int64_t)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  _OWORD v9[3];

  v6 = a3;
  -[_PXFeedInlinePlaybackController _itemLayoutForPlaybackRecord:](self, "_itemLayoutForPlaybackRecord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXFeedInlinePlaybackController itemLayoutDesiredPlayStateSetter](self, "itemLayoutDesiredPlayStateSetter");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "bestVideoTimeRange");
  else
    memset(v9, 0, sizeof(v9));
  ((void (**)(_QWORD, void *, BOOL, _OWORD *))v8)[2](v8, v7, a4 == 1, v9);

}

- (UIEdgeInsets)criticallyVisibleEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_criticallyVisibleEdgeInsets.top;
  left = self->_criticallyVisibleEdgeInsets.left;
  bottom = self->_criticallyVisibleEdgeInsets.bottom;
  right = self->_criticallyVisibleEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXGLayout)containerLayout
{
  return self->_containerLayout;
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (id)itemLayoutDesiredPlayStateSetter
{
  return self->_itemLayoutDesiredPlayStateSetter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemLayoutDesiredPlayStateSetter, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_containerLayout, 0);
}

@end

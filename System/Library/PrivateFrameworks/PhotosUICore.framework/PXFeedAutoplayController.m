@implementation PXFeedAutoplayController

- (PXFeedAutoplayController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedAutoplayController.m"), 35, CFSTR("%s is not available as initializer"), "-[PXFeedAutoplayController init]");

  abort();
}

- (PXFeedAutoplayController)initWithContainerLayout:(id)a3 viewModel:(id)a4 itemLayoutDesiredPlayStateSetter:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXFeedAutoplayController *v11;
  _PXFeedInlinePlaybackController *v12;
  _PXFeedInlinePlaybackController *inlinePlaybackController;
  uint64_t v14;
  NSMapTable *playbackRecordsByItemLayout;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXFeedAutoplayController;
  v11 = -[PXFeedAutoplayController init](&v17, sel_init);
  if (v11)
  {
    v12 = -[_PXFeedInlinePlaybackController initWithContainerLayout:viewModel:itemLayoutDesiredPlayStateSetter:]([_PXFeedInlinePlaybackController alloc], "initWithContainerLayout:viewModel:itemLayoutDesiredPlayStateSetter:", v8, v9, v10);
    inlinePlaybackController = v11->_inlinePlaybackController;
    v11->_inlinePlaybackController = v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    playbackRecordsByItemLayout = v11->_playbackRecordsByItemLayout;
    v11->_playbackRecordsByItemLayout = (NSMapTable *)v14;

    objc_msgSend(v9, "registerChangeObserver:context:", v11, ViewModelObservationContext_262812);
  }

  return v11;
}

- (void)containerLayoutVisibleRectDidChange
{
  id v2;

  -[PXFeedAutoplayController inlinePlaybackController](self, "inlinePlaybackController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleRectDidChange");

}

- (BOOL)isContainerLayoutVisible
{
  void *v2;
  char v3;

  -[PXFeedAutoplayController inlinePlaybackController](self, "inlinePlaybackController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentViewVisible");

  return v3;
}

- (void)setIsContainerLayoutVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXFeedAutoplayController inlinePlaybackController](self, "inlinePlaybackController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContentViewVisible:", v3);

}

- (void)addItemLayout:(id)a3 withDisplayAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PXFeedAutoplayController inlinePlaybackController](self, "inlinePlaybackController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "checkOutPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:", v6, 0, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PXFeedAutoplayController playbackRecordsByItemLayout](self, "playbackRecordsByItemLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, v7);

}

- (void)removeItemLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXFeedAutoplayController playbackRecordsByItemLayout](self, "playbackRecordsByItemLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXFeedAutoplayController playbackRecordsByItemLayout](self, "playbackRecordsByItemLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

  objc_msgSend(v9, "displayAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXFeedAutoplayController inlinePlaybackController](self, "inlinePlaybackController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "checkInPlaybackRecordForDisplayAsset:", v7);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v9 = a3;
  if ((void *)ViewModelObservationContext_262812 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedAutoplayController.m"), 85, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 4) != 0)
  {
    v14 = v9;
    -[PXFeedAutoplayController inlinePlaybackController](self, "inlinePlaybackController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldPlayOnHover");

    v9 = v14;
    if (v11)
    {
      -[PXFeedAutoplayController inlinePlaybackController](self, "inlinePlaybackController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidatePlayingRecords");

      v9 = v14;
    }
  }

}

- (_PXFeedInlinePlaybackController)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (NSMapTable)playbackRecordsByItemLayout
{
  return self->_playbackRecordsByItemLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackRecordsByItemLayout, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
}

@end

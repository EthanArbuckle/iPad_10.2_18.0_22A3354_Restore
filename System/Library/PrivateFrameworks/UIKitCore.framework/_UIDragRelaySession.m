@implementation _UIDragRelaySession

- (_UIDragRelaySession)initWithDragItems:(id)a3
{
  id v5;
  _UIDragRelaySession *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIDragRelaySession;
  v6 = -[_UIDragRelaySession init](&v17, sel_init);
  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "_updatePreferredPreview", (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&v6->_dragItems, a3);
  }

  return v6;
}

- (void)beginDragFromView:(id)a3 point:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
  v10 = v9;
  v12 = v11;

  -[_UIDragRelaySession dragItems](self, "dragItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDraggingBeginningSessionConfiguration configurationWithItems:initialCentroidInSourceWindow:sourceView:](UIDraggingBeginningSessionConfiguration, "configurationWithItems:initialCentroidInSourceWindow:sourceView:", v13, v7, v10, v12, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_dragManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "beginDragWithSessionConfiguration:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDragRelaySession setDraggingSessionSource:](self, "setDraggingSessionSource:", v18);
  objc_msgSend(v18, "setDelegate:", self);
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47___UIDragRelaySession_beginDragFromView_point___block_invoke;
  v19[3] = &unk_1E16B3F40;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v17, "performAfterCompletingPendingSessionRequests:", v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)dragSessionCompletedInitialCheckIn
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  char v13;
  id v14;

  -[_UIDragRelaySession draggingSessionSource](self, "draggingSessionSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 2)
  {
    -[_UIDragRelaySession draggingSessionSource](self, "draggingSessionSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragDidExitApp");

    -[_UIDragRelaySession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    -[_UIDragRelaySession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "dragRelaySessionDidBegin:", self);
    }
    else
    {
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0)
        return;
      -[_UIDragRelaySession delegate](self, "delegate");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dragDidBeginForRelaySession:", self);
    }
  }
  else
  {
    -[_UIDragRelaySession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    -[_UIDragRelaySession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "dragRelaySessionDidFail:", self);
    }
    else
    {
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
        return;
      -[_UIDragRelaySession delegate](self, "delegate");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dragFailedForRelaySession:", self);
    }
  }

}

- (void)draggingSessionDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  char v9;
  id v10;

  -[_UIDragRelaySession delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  -[_UIDragRelaySession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "dragRelaySession:didEndDragWithDrop:", self, a4 != 0);
  }
  else
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      return;
    -[_UIDragRelaySession delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dragDidEndForRelaySession:", self);
  }

}

- (void)draggingSessionDidTransferItems:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[_UIDragRelaySession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UIDragRelaySession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dragRelaySessionDidEndDataTransfer:", self);

  }
}

- (unint64_t)draggingSession:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4
{
  return 1;
}

- (void)_draggingSession:(id)a3 updatedPresentation:(id)a4
{
  id v5;
  void *v6;
  _UIDragMonitorSessionPresentationUpdate *v7;

  v5 = a4;
  v7 = -[_UIDragMonitorSessionPresentationUpdate initWithDragPresentationUpdate:]([_UIDragMonitorSessionPresentationUpdate alloc], "initWithDragPresentationUpdate:", v5);

  -[_UIDragRelaySession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragRelaySession:didUpdateDragPresentation:", self, v7);

}

- (BOOL)draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  return 1;
}

- (void)updateDragPreviewForItemsAtIndexes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _UIDragRelaySession *v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58___UIDragRelaySession_updateDragPreviewForItemsAtIndexes___block_invoke;
  v9[3] = &unk_1E16B2978;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v9);

  -[_UIDragRelaySession draggingSessionSource](self, "draggingSessionSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemsBecameDirty:", v8);

}

- (void)cancelDrag
{
  id v2;

  -[_UIDragRelaySession draggingSessionSource](self, "draggingSessionSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelDrag");

}

- (_UIDragRelaySessionDelegate)delegate
{
  return (_UIDragRelaySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_sessionIdentifier = a3;
}

- (_UIInternalDraggingSessionSource)draggingSessionSource
{
  return self->_draggingSessionSource;
}

- (void)setDraggingSessionSource:(id)a3
{
  objc_storeStrong((id *)&self->_draggingSessionSource, a3);
}

- (NSArray)dragItems
{
  return self->_dragItems;
}

- (void)setDragItems:(id)a3
{
  objc_storeStrong((id *)&self->_dragItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItems, 0);
  objc_storeStrong((id *)&self->_draggingSessionSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation _UIDragMonitorSessionPresentationUpdate

- (_UIDragMonitorSessionPresentationUpdate)initWithPreviewUpdates:(id)a3 badgeUpdate:(id)a4
{
  id v7;
  id v8;
  _UIDragMonitorSessionPresentationUpdate *v9;
  _UIDragMonitorSessionPresentationUpdate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDragMonitorSessionPresentationUpdate;
  v9 = -[_UIDragMonitorSessionPresentationUpdate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previewUpdates, a3);
    objc_storeStrong((id *)&v10->_badgeUpdate, a4);
  }

  return v10;
}

- (_UIDragMonitorSessionPresentationUpdate)initWithDragPreviewUpdates:(id)a3 badgeUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _UIDragMonitorSessionPreviewUpdate *v15;
  _UIDragMonitorSessionPreviewUpdate *v16;
  _UIDragMonitorSessionPresentationUpdate *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          v15 = [_UIDragMonitorSessionPreviewUpdate alloc];
          v16 = -[_UIDragMonitorSessionPreviewUpdate initWithPreviewAndImageComponentUpdate:](v15, "initWithPreviewAndImageComponentUpdate:", v14, (_QWORD)v19);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  v17 = -[_UIDragMonitorSessionPresentationUpdate initWithPreviewUpdates:badgeUpdate:](self, "initWithPreviewUpdates:badgeUpdate:", v8, v7, (_QWORD)v19);

  return v17;
}

- (_UIDragMonitorSessionPresentationUpdate)initWithDragPresentationUpdate:(id)a3
{
  id v4;
  _UIDragMonitorSessionBadgeUpdate *v5;
  void *v6;
  _UIDragMonitorSessionPresentationUpdate *v7;

  v4 = a3;
  v5 = -[_UIDragMonitorSessionBadgeUpdate initWithDragBadgeStyle:]([_UIDragMonitorSessionBadgeUpdate alloc], "initWithDragBadgeStyle:", objc_msgSend(v4, "badgeStyle"));
  objc_msgSend(v4, "modifiedPreviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_UIDragMonitorSessionPresentationUpdate initWithDragPreviewUpdates:badgeUpdate:](self, "initWithDragPreviewUpdates:badgeUpdate:", v6, v5);
  return v7;
}

- (NSArray)previewUpdates
{
  return self->_previewUpdates;
}

- (void)setPreviewUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_previewUpdates, a3);
}

- (_UIDragMonitorSessionBadgeUpdate)badgeUpdate
{
  return self->_badgeUpdate;
}

- (void)setBadgeUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_badgeUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeUpdate, 0);
  objc_storeStrong((id *)&self->_previewUpdates, 0);
}

@end

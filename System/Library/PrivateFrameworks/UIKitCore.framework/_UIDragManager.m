@implementation _UIDragManager

+ (void)initializeDraggingSystem
{
  if (qword_1ECD7F058 != -1)
    dispatch_once(&qword_1ECD7F058, &__block_literal_global_358);
  objc_msgSend((id)_MergedGlobals_1139, "warmUp");
}

- (_UIDragManager)initWithScreen:(id)a3
{
  id v4;
  _UIDragManager *v5;
  _UIDragManager *v6;
  NSArray *dragSessionSources;
  NSArray *v8;
  NSArray *dragSessionDestinations;
  uint64_t v10;
  NSMutableArray *pendingSessionRequestsCompletionBlocks;
  void *v12;
  objc_super v14;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("screen must be non-nil"));
  v14.receiver = self;
  v14.super_class = (Class)_UIDragManager;
  v5 = -[_UIDragManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_screen, v4);
    dragSessionSources = v6->_dragSessionSources;
    v8 = (NSArray *)MEMORY[0x1E0C9AA60];
    v6->_dragSessionSources = (NSArray *)MEMORY[0x1E0C9AA60];

    dragSessionDestinations = v6->_dragSessionDestinations;
    v6->_dragSessionDestinations = v8;

    v10 = objc_opt_new();
    pendingSessionRequestsCompletionBlocks = v6->_pendingSessionRequestsCompletionBlocks;
    v6->_pendingSessionRequestsCompletionBlocks = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__willAddDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);

  }
  return v6;
}

- (void)_willAddDeactivationReason:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
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
  v3 = (void *)-[NSArray copy](self->_dragSessionSources, "copy", a3, 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "shouldCancelOnAppDeactivation"))
          objc_msgSend(v8, "cancelDrag");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (CAContext)dragImageContext
{
  CAContext *dragImageContext;
  void *v4;
  CAContext *v5;
  CAContext *v6;

  dragImageContext = self->_dragImageContext;
  if (!dragImageContext)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", CFSTR("DragAndDropContext"), *MEMORY[0x1E0CD2A20]);
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD2A40]);
    objc_msgSend(MEMORY[0x1E0CD2720], "remoteContextWithOptions:", v4);
    v5 = (CAContext *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dragImageContext;
    self->_dragImageContext = v5;

    dragImageContext = self->_dragImageContext;
  }
  return dragImageContext;
}

- (unsigned)uploadImage:(CGImage *)a3
{
  void *v4;
  uint64_t v5;

  -[_UIDragManager dragImageContext](self, "dragImageContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v5 = objc_msgSend(v4, "createSlot");
    objc_msgSend(v4, "setObject:forSlot:", a3, v5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (void)deleteSlots:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIDragManager dragImageContext](self, "dragImageContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "deleteSlot:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "unsignedIntegerValue", (_QWORD)v11));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)beginDragWithSessionConfiguration:(id)a3
{
  id v5;
  _UIInternalDraggingSessionSource *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v5 = a3;
  v6 = -[_UIInternalDraggingSessionSource initWithDragManager:configuration:]([_UIInternalDraggingSessionSource alloc], "initWithDragManager:configuration:", self, v5);

  if (v6)
  {
    -[_UIDragManager dragSessionSources](self, "dragSessionSources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "addObject:", v6);
    -[_UIDragManager setDragSessionSources:](self, "setDragSessionSources:", v8);
    ++self->_pendingSessionRequests;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke;
    v10[3] = &unk_1E16B7A60;
    v10[4] = self;
    v10[5] = a2;
    -[_UIInternalDraggingSessionSource beginDrag:](v6, "beginDrag:", v10);

  }
  return v6;
}

- (BOOL)hasPendingSessionRequests
{
  return self->_pendingSessionRequests > 0;
}

- (void)performAfterCompletingPendingSessionRequests:(id)a3
{
  NSMutableArray *pendingSessionRequestsCompletionBlocks;
  void (**v5)(void);
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  if (-[_UIDragManager hasPendingSessionRequests](self, "hasPendingSessionRequests"))
  {
    pendingSessionRequestsCompletionBlocks = self->_pendingSessionRequestsCompletionBlocks;
    v5 = (void (**)(void))_Block_copy(aBlock);

    -[NSMutableArray addObject:](pendingSessionRequestsCompletionBlocks, "addObject:", v5);
    aBlock = v5;
  }
  else
  {
    aBlock[2]();
  }

}

- (void)performPendingSessionCompletionBlocksIfPossible
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingSessionRequestsCompletionBlocks, "count")
    && !-[_UIDragManager hasPendingSessionRequests](self, "hasPendingSessionRequests"))
  {
    v3 = (void *)-[NSMutableArray copy](self->_pendingSessionRequestsCompletionBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingSessionRequestsCompletionBlocks, "removeAllObjects");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)sessionSourceDidEnd:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("sessionSource must be non-nil"));
  -[_UIDragManager dragSessionSources](self, "dragSessionSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectIdenticalTo:", v6);
  -[_UIDragManager setDragSessionSources:](self, "setDragSessionSources:", v5);

}

- (id)sessionSourceWithIdentifier:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_UIDragManager dragSessionSources](self, "dragSessionSources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "sessionIdentifier") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)dragDestinationWithEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _UIInternalDraggingSessionDestination *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("dragEvent must be non-nil"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_UIDragManager dragSessionDestinations](self, "dragSessionDestinations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "canBeDrivenByDragEvent:", v4) & 1) != 0)
        {
          objc_msgSend(v10, "addDragEvent:", v4);
          v11 = v10;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = -[_UIInternalDraggingSessionDestination initWithDragManager:dragEvent:]([_UIInternalDraggingSessionDestination alloc], "initWithDragManager:dragEvent:", self, v4);
  if (v11)
  {
    -[_UIDragManager dragSessionDestinations](self, "dragSessionDestinations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v5, "addObject:", v11);
    -[_UIDragManager setDragSessionDestinations:](self, "setDragSessionDestinations:", v5);
    -[_UIInternalDraggingSessionDestination connect](v11, "connect");
LABEL_14:

  }
  return v11;
}

- (void)sessionDestinationDidEnd:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("sessionDestination must be non-nil"));
  if (_UIApplicationIsExtension())
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dropOnExtension"));
  -[_UIDragManager dragSessionDestinations](self, "dragSessionDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectIdenticalTo:", v6);
  -[_UIDragManager setDragSessionDestinations:](self, "setDragSessionDestinations:", v5);

}

- (NSArray)dragSessionSources
{
  return self->_dragSessionSources;
}

- (void)setDragSessionSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)dragSessionDestinations
{
  return self->_dragSessionDestinations;
}

- (void)setDragSessionDestinations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_dragSessionDestinations, 0);
  objc_storeStrong((id *)&self->_dragSessionSources, 0);
  objc_storeStrong((id *)&self->_pendingSessionRequestsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_dragImageContext, 0);
}

@end

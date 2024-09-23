@implementation CLKUIQuadView

+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  CLKUIMetalQuadView *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = -[CLKUIMetalQuadView initWithFrame:identifier:options:colorSpace:]([CLKUIMetalQuadView alloc], "initWithFrame:identifier:options:colorSpace:", v12, a5, a6, x, y, width, height);

  return v13;
}

+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "quadViewWithFrame:identifier:options:colorSpace:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4
{
  return (id)objc_msgSend(a1, "quadViewWithFrame:identifier:options:colorSpace:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_runOnRenderQueueIfNeeded:(id)a3
{
  NSObject *asyncRenderQueue;
  id v5;

  asyncRenderQueue = self->_asyncRenderQueue;
  if (asyncRenderQueue)
  {
    v5 = a3;
    dispatch_assert_queue_not_V2(asyncRenderQueue);
    dispatch_sync((dispatch_queue_t)self->_asyncRenderQueue, v5);
  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }

}

- (BOOL)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  return -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:completion:](self, "renderSynchronouslyWithImageQueueDiscard:inGroup:completion:", a3, a4, 0);
}

- (BOOL)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  NSString *debugIdentifier;
  NSCountedSet *disabledRenderingReasons;
  BOOL v13;
  double v14;
  NSObject *asyncRenderQueue;
  _QWORD v17[5];
  id v18;
  void (**v19)(_QWORD);
  _BYTE *v20;
  double v21;
  BOOL v22;
  _BYTE buf[24];
  char v24;
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (-[NSCountedSet count](self->_disabledRenderingReasons, "count"))
  {
    CLKLoggingObjectForDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      debugIdentifier = self->_debugIdentifier;
      disabledRenderingReasons = self->_disabledRenderingReasons;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = debugIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = disabledRenderingReasons;
      _os_log_impl(&dword_1AFABF000, v10, OS_LOG_TYPE_DEFAULT, "CLKUIQuadView (%@): Rendering disabled for reasons: %@", buf, 0x16u);
    }

    if (v9)
      v9[2](v9);
    v13 = 0;
  }
  else
  {
    if (v6)
      -[CLKUIQuadView discardContents](self, "discardContents");
    v14 = CACurrentMediaTime();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v24 = 0;
    asyncRenderQueue = self->_asyncRenderQueue;
    if (asyncRenderQueue)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __77__CLKUIQuadView_renderSynchronouslyWithImageQueueDiscard_inGroup_completion___block_invoke;
      v17[3] = &unk_1E6075CE8;
      v20 = buf;
      v17[4] = self;
      v21 = v14;
      v18 = v8;
      v22 = v6;
      v19 = v9;
      dispatch_sync(asyncRenderQueue, v17);

      v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    }
    else
    {
      v13 = -[CLKUIQuadView _sync_prepareAndRenderForTime:inGroup:checkForDrawable:completion:](self, "_sync_prepareAndRenderForTime:inGroup:checkForDrawable:completion:", v8, !v6, v9, v14);
      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = v13;
    }
    _Block_object_dispose(buf, 8);
  }

  return v13;
}

uint64_t __77__CLKUIQuadView_renderSynchronouslyWithImageQueueDiscard_inGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_sync_prepareAndRenderForTime:inGroup:checkForDrawable:completion:", *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 72) == 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (CLKUIQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 asyncRenderQueue:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  CLKUIQuadView *v16;
  dispatch_semaphore_t v17;
  OS_dispatch_semaphore *asyncSemaphore;
  CLKUIQuadViewRenderCoordinator *v19;
  CLKUIQuadViewRenderCoordinator *renderCoordinator;
  uint64_t v21;
  NSMutableArray *mutableQuads;
  uint64_t v23;
  NSCountedSet *disabledRenderingReasons;
  objc_super v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CLKUIQuadView;
  v16 = -[CLKUIQuadView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = dispatch_semaphore_create(3);
    asyncSemaphore = v16->_asyncSemaphore;
    v16->_asyncSemaphore = (OS_dispatch_semaphore *)v17;

    v19 = -[CLKUIQuadViewRenderCoordinator initWithQuadView:synchronizeWithClockTimer:]([CLKUIQuadViewRenderCoordinator alloc], "initWithQuadView:synchronizeWithClockTimer:", v16, (a5 >> 2) & 1);
    renderCoordinator = v16->_renderCoordinator;
    v16->_renderCoordinator = v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    mutableQuads = v16->_mutableQuads;
    v16->_mutableQuads = (NSMutableArray *)v21;

    v23 = objc_opt_new();
    disabledRenderingReasons = v16->_disabledRenderingReasons;
    v16->_disabledRenderingReasons = (NSCountedSet *)v23;

    objc_storeStrong((id *)&v16->_asyncRenderQueue, a6);
    objc_storeStrong((id *)&v16->_debugIdentifier, a4);
  }

  return v16;
}

- (void)dealloc
{
  CLKUIQuadViewRenderCoordinator *renderCoordinator;
  objc_super v4;

  -[CLKUIQuadViewRenderCoordinator invalidate](self->_renderCoordinator, "invalidate");
  renderCoordinator = self->_renderCoordinator;
  self->_renderCoordinator = 0;

  -[CLKUIQuadView removeAllQuads](self, "removeAllQuads");
  v4.receiver = self;
  v4.super_class = (Class)CLKUIQuadView;
  -[CLKUIQuadView dealloc](&v4, sel_dealloc);
}

- (void)addDisabledRenderingReason:(id)a3
{
  -[NSCountedSet addObject:](self->_disabledRenderingReasons, "addObject:", a3);
}

- (void)removeDisabledRenderingReason:(id)a3
{
  -[NSCountedSet removeObject:](self->_disabledRenderingReasons, "removeObject:", a3);
}

- (void)_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 completion:(id)a6
{
  if (self->_asyncRenderQueue)
    -[CLKUIQuadView _async_prepareAndRenderForTime:inGroup:checkForDrawable:completion:](self, "_async_prepareAndRenderForTime:inGroup:checkForDrawable:completion:", a4, a5, a6, a3);
  else
    -[CLKUIQuadView _sync_prepareAndRenderForTime:inGroup:checkForDrawable:completion:](self, "_sync_prepareAndRenderForTime:inGroup:checkForDrawable:completion:", a4, a5, a6, a3);
}

- (void)_async_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *asyncRenderQueue;
  _QWORD block[5];
  id v14;
  id v15;
  double v16;
  BOOL v17;

  v10 = a4;
  v11 = a6;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_asyncSemaphore, 0))
  {
    asyncRenderQueue = self->_asyncRenderQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__CLKUIQuadView__async_prepareAndRenderForTime_inGroup_checkForDrawable_completion___block_invoke;
    block[3] = &unk_1E6075D10;
    block[4] = self;
    v16 = a3;
    v14 = v10;
    v17 = a5;
    v15 = v11;
    dispatch_async(asyncRenderQueue, block);

  }
}

intptr_t __84__CLKUIQuadView__async_prepareAndRenderForTime_inGroup_checkForDrawable_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sync_prepareAndRenderForTime:inGroup:checkForDrawable:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 472));
}

- (BOOL)_sync_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  NSObject *v10;
  id v11;
  NSObject *asyncRenderQueue;
  NSObject *v13;
  id v14;
  BOOL v15;
  _QWORD v17[4];
  NSObject *v18;
  id v19;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  asyncRenderQueue = self->_asyncRenderQueue;
  if (asyncRenderQueue)
    dispatch_assert_queue_V2(asyncRenderQueue);
  if (v10)
    dispatch_group_enter(v10);
  -[CLKUIQuadView _prerenderForTime:](self, "_prerenderForTime:", a3);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__CLKUIQuadView__sync_prepareAndRenderForTime_inGroup_checkForDrawable_completion___block_invoke;
  v17[3] = &unk_1E6075D38;
  v18 = v10;
  v19 = v11;
  v13 = v10;
  v14 = v11;
  v15 = -[CLKUIQuadView _displayAndCheckForDrawable:withCompletion:](self, "_displayAndCheckForDrawable:withCompletion:", v7, v17);
  ++self->_frameNum;

  return v15;
}

void __83__CLKUIQuadView__sync_prepareAndRenderForTime_inGroup_checkForDrawable_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(NSObject **)(a1 + 32);
  if (v3)
    dispatch_group_leave(v3);
}

- (void)enumerateHierarchyObserversFromView:(id)a3 withBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v9 = v5;
  v7 = v9;
  do
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6[2](v6, v7);
    objc_msgSend(v7, "superview");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  while (v8);

}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKUIQuadView;
  -[CLKUIQuadView willMoveToWindow:](&v7, sel_willMoveToWindow_, a3);
  -[CLKUIQuadView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLKUIQuadView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__CLKUIQuadView_willMoveToWindow___block_invoke;
    v6[3] = &unk_1E6075D60;
    v6[4] = self;
    -[CLKUIQuadView enumerateHierarchyObserversFromView:withBlock:](self, "enumerateHierarchyObserversFromView:withBlock:", v5, v6);

  }
}

uint64_t __34__CLKUIQuadView_willMoveToWindow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quadViewWillLeaveSubtree:", *(_QWORD *)(a1 + 32));
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUIQuadView;
  -[CLKUIQuadView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[CLKUIQuadView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CLKUIQuadView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__CLKUIQuadView_didMoveToWindow__block_invoke;
    v5[3] = &unk_1E6075D60;
    v5[4] = self;
    -[CLKUIQuadView enumerateHierarchyObserversFromView:withBlock:](self, "enumerateHierarchyObserversFromView:withBlock:", v4, v5);

  }
}

uint64_t __32__CLKUIQuadView_didMoveToWindow__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quadViewWillEnterSubtree:", *(_QWORD *)(a1 + 32));
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  -[CLKUIQuadViewRenderCoordinator setPreferredFramesPerSecond:](self->_renderCoordinator, "setPreferredFramesPerSecond:", a3);
}

- (int64_t)preferredFramesPerSecond
{
  return -[CLKUIQuadViewRenderCoordinator preferredFramesPerSecond](self->_renderCoordinator, "preferredFramesPerSecond");
}

- (void)setPaused:(BOOL)a3
{
  -[CLKUIQuadViewRenderCoordinator setPaused:](self->_renderCoordinator, "setPaused:", a3);
}

- (BOOL)isPaused
{
  return -[CLKUIQuadViewRenderCoordinator isPaused](self->_renderCoordinator, "isPaused");
}

- (unint64_t)frameNum
{
  return self->_frameNum;
}

- (CGSize)drawableSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)quads
{
  return (NSArray *)self->_mutableQuads;
}

- (void)addQuad:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setQuadView:", self);
  objc_msgSend(v4, "setupForQuadView:", self);
  -[NSMutableArray addObject:](self->_mutableQuads, "addObject:", v4);

  -[CLKUIQuadView _handleQuadArrayChange:](self, "_handleQuadArrayChange:", self->_mutableQuads);
}

- (void)addQuadsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "setQuadView:", self);
        objc_msgSend(v9, "setupForQuadView:", self);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[NSMutableArray addObjectsFromArray:](self->_mutableQuads, "addObjectsFromArray:", v4);
  -[CLKUIQuadView _handleQuadArrayChange:](self, "_handleQuadArrayChange:", self->_mutableQuads);

}

- (void)removeQuad:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "purge");
  objc_msgSend(v4, "setQuadView:", 0);
  -[NSMutableArray removeObject:](self->_mutableQuads, "removeObject:", v4);

  -[CLKUIQuadView _handleQuadArrayChange:](self, "_handleQuadArrayChange:", self->_mutableQuads);
}

- (void)removeAllQuads
{
  NSMutableArray *v3;
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
  v3 = self->_mutableQuads;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(v8, "purge", (_QWORD)v9);
        objc_msgSend(v8, "setQuadView:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_mutableQuads, "removeAllObjects");
  -[CLKUIQuadView _handleQuadArrayChange:](self, "_handleQuadArrayChange:", self->_mutableQuads);
}

- (void)_prerenderForTime:(double)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "quadViewWillDisplay:forTime:", self, a3);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  }
}

- (id)snapshotInRect:(CGRect)a3 scale:(double)a4 time:(double)a5
{
  return 0;
}

- (void)setDebugIdentifier:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  NSString *debugIdentifier;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 4)
    v6 = 4;
  else
    v6 = v5;
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v9 |= objc_msgSend(v4, "characterAtIndex:", v8++) << v7;
      v7 += 8;
    }
    while (v6 != v8);
  }
  else
  {
    v9 = 0;
  }
  self->_debugId = v9;
  debugIdentifier = self->_debugIdentifier;
  self->_debugIdentifier = (NSString *)v4;

}

- (BOOL)_displayAndCheckForDrawable:(BOOL)a3 withCompletion:(id)a4
{
  return 1;
}

- (CLKUIQuadViewDelegate)delegate
{
  return (CLKUIQuadViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)singleBufferMode
{
  return self->_singleBufferMode;
}

- (void)setSingleBufferMode:(BOOL)a3
{
  self->_singleBufferMode = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asyncSemaphore, 0);
  objc_storeStrong((id *)&self->_asyncRenderQueue, 0);
  objc_storeStrong((id *)&self->_disabledRenderingReasons, 0);
  objc_storeStrong((id *)&self->_renderCoordinator, 0);
  objc_storeStrong((id *)&self->_mutableQuads, 0);
}

@end

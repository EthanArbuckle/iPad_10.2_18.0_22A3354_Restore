@implementation UIKBTouchOrderedTaskList

+ (id)taskListForTouchUUID:(id)a3 withPathIndex:(unint64_t)a4
{
  id v5;
  UIKBTouchOrderedTaskList *v6;

  v5 = a3;
  v6 = -[UIKBTouchOrderedTaskList initWithTouchUUID:withPathIndex:]([UIKBTouchOrderedTaskList alloc], "initWithTouchUUID:withPathIndex:", v5, a4);

  return v6;
}

- (UIKBTouchOrderedTaskList)initWithTouchUUID:(id)a3 withPathIndex:(unint64_t)a4
{
  id v7;
  UIKBTouchOrderedTaskList *v8;
  UIKBTouchOrderedTaskList *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *touchStateTasksQueue;
  NSMutableArray *v12;
  NSMutableArray *touchStateTasks;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIKBTouchOrderedTaskList;
  v8 = -[UIKBTouchOrderedTaskList init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_touchUUID, a3);
    v9->_pathIndex = a4;
    v10 = dispatch_queue_create(0, 0);
    touchStateTasksQueue = v9->_touchStateTasksQueue;
    v9->_touchStateTasksQueue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    touchStateTasks = v9->_touchStateTasks;
    v9->_touchStateTasks = v12;

  }
  return v9;
}

- (void)dealloc
{
  NSObject *touchStateTasksQueue;
  OS_dispatch_queue *v4;
  objc_super v5;
  _QWORD block[5];

  touchStateTasksQueue = self->_touchStateTasksQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__UIKBTouchOrderedTaskList_dealloc__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(touchStateTasksQueue, block);
  v4 = self->_touchStateTasksQueue;
  self->_touchStateTasksQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIKBTouchOrderedTaskList;
  -[UIKBTouchOrderedTaskList dealloc](&v5, sel_dealloc);
}

void __35__UIKBTouchOrderedTaskList_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (BOOL)hasTasks
{
  return -[NSMutableArray count](self->_touchStateTasks, "count") != 0;
}

- (void)addTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  NSObject *touchStateTasksQueue;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "touchState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "phase");

  if (!v6)
  {
    objc_msgSend(v4, "touchState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    self->_originalStartTime = v8;

  }
  touchStateTasksQueue = self->_touchStateTasksQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__UIKBTouchOrderedTaskList_addTask___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_sync(touchStateTasksQueue, block);

}

uint64_t __36__UIKBTouchOrderedTaskList_addTask___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "compare:", *(_QWORD *)(a1 + 40));

  if (v3 == -1)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "indexOfObject:inSortedRange:options:usingComparator:", *(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"), 1024, &__block_literal_global_352));
}

uint64_t __36__UIKBTouchOrderedTaskList_addTask___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isExecutingFirstTask
{
  void *v2;
  char v3;

  -[NSMutableArray firstObject](self->_touchStateTasks, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBusy");

  return v3;
}

- (void)removeTasksMatchingFilter:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  NSObject *touchStateTasksQueue;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__132;
  v23 = __Block_byref_object_dispose__132;
  v24 = 0;
  touchStateTasksQueue = self->_touchStateTasksQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke;
  block[3] = &unk_1E16BACE0;
  block[4] = self;
  block[5] = &v19;
  dispatch_sync(touchStateTasksQueue, block);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)v20[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          v12 = self->_touchStateTasksQueue;
          v13[0] = v6;
          v13[1] = 3221225472;
          v13[2] = __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke_2;
          v13[3] = &unk_1E16B1B50;
          v13[4] = self;
          v13[5] = v11;
          dispatch_sync(v12, v13);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v19, 8);
}

void __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __54__UIKBTouchOrderedTaskList_removeTasksMatchingFilter___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)executeTasksInView:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, _BYTE *);
  NSObject *touchStateTasksQueue;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSValue *v15;
  NSValue *currentTouchPoint;
  NSObject *v17;
  BOOL v18;
  _QWORD v20[5];
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  BOOL v28;

  v6 = a3;
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  v28 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__132;
  v26 = __Block_byref_object_dispose__132;
  v27 = 0;
  touchStateTasksQueue = self->_touchStateTasksQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke;
  block[3] = &unk_1E16BACE0;
  block[4] = self;
  block[5] = &v22;
  dispatch_sync(touchStateTasksQueue, block);
  v10 = (void *)v23[5];
  if (v10)
  {
    objc_msgSend(v10, "setIsBusy:", 1);
    if (v7
      && (objc_msgSend((id)v23[5], "touchState"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend((id)v23[5], "task"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v7[2](v7, v11, v12, &v28),
          v12,
          v11,
          v28))
    {
      objc_msgSend((id)v23[5], "setIsBusy:", 0);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend((id)v23[5], "touchState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationInWindow");
      objc_msgSend(v6, "convertPoint:fromView:", 0);
      objc_msgSend(v13, "valueWithCGPoint:");
      v15 = (NSValue *)objc_claimAutoreleasedReturnValue();
      currentTouchPoint = self->_currentTouchPoint;
      self->_currentTouchPoint = v15;

      v17 = self->_touchStateTasksQueue;
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke_2;
      v20[3] = &unk_1E16B1B28;
      v20[4] = self;
      dispatch_sync(v17, v20);
    }
  }
  v18 = v28;
  _Block_object_dispose(&v22, 8);

  return v18;
}

void __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __57__UIKBTouchOrderedTaskList_executeTasksInView_withBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", 0);
}

- (id)firstTouchStateForUITouchPhase:(int64_t)a3
{
  NSObject *touchStateTasksQueue;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__132;
  v16 = __Block_byref_object_dispose__132;
  v17 = 0;
  touchStateTasksQueue = self->_touchStateTasksQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__UIKBTouchOrderedTaskList_firstTouchStateForUITouchPhase___block_invoke;
  v11[3] = &unk_1E16BACE0;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(touchStateTasksQueue, v11);
  v5 = v13;
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = objc_msgSend(v6, "phase");
    v5 = v13;
    if (v7 != a3)
    {
      v8 = (void *)v13[5];
      v13[5] = 0;

      v5 = v13;
    }
  }
  v9 = (id)v5[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __59__UIKBTouchOrderedTaskList_firstTouchStateForUITouchPhase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSUUID)touchUUID
{
  return self->_touchUUID;
}

- (NSValue)currentTouchPoint
{
  return self->_currentTouchPoint;
}

- (unint64_t)pathIndex
{
  return self->_pathIndex;
}

- (double)originalStartTime
{
  return self->_originalStartTime;
}

- (BOOL)ignoredOnBegin
{
  return self->_ignoredOnBegin;
}

- (void)setIgnoredOnBegin:(BOOL)a3
{
  self->_ignoredOnBegin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouchPoint, 0);
  objc_storeStrong((id *)&self->_touchStateTasks, 0);
  objc_storeStrong((id *)&self->_touchStateTasksQueue, 0);
  objc_storeStrong((id *)&self->_touchUUID, 0);
}

@end

@implementation _BackgroundViewRenderManager

+ (id)sharedManager
{
  if (qword_1001F6158 != -1)
    dispatch_once(&qword_1001F6158, &stru_1001B3050);
  return (id)qword_1001F6150;
}

- (_BackgroundViewRenderManager)init
{
  _BackgroundViewRenderManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *queue;
  NSMutableSet *v5;
  NSMutableSet *viewsInQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_BackgroundViewRenderManager;
  v2 = -[_BackgroundViewRenderManager init](&v8, "init");
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    viewsInQueue = v2->_viewsInQueue;
    v2->_viewsInQueue = v5;

  }
  return v2;
}

- (void)addViewToQueue:(id)a3
{
  id v4;
  NSMutableSet *v5;
  _BackgroundViewRenderOperation *v6;
  NSMutableSet *viewsInQueue;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _BackgroundViewRenderOperation *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  _BackgroundViewRenderManager *v22;
  id v23;

  v4 = a3;
  v5 = self->_viewsInQueue;
  objc_sync_enter(v5);
  if ((-[NSMutableSet containsObject:](self->_viewsInQueue, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_viewsInQueue, "addObject:", v4);
    v6 = [_BackgroundViewRenderOperation alloc];
    viewsInQueue = self->_viewsInQueue;
    objc_msgSend(v4, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
    v17 = -[_BackgroundViewRenderOperation initWithView:views:bounds:traitCollection:](v6, "initWithView:views:bounds:traitCollection:", v4, viewsInQueue, v16, v9, v11, v13, v15);

    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_1000574CC;
    v21 = &unk_1001B26A0;
    v22 = self;
    v23 = v4;
    -[_BackgroundViewRenderOperation setCompletionBlock:](v17, "setCompletionBlock:", &v18);
    -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v17, v18, v19, v20, v21, v22);

  }
  objc_sync_exit(v5);

}

- (void)removeViewFromQueue:(id)a3
{
  id v4;
  NSMutableSet *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = self->_viewsInQueue;
  objc_sync_enter(v5);
  if (-[NSMutableSet containsObject:](self->_viewsInQueue, "containsObject:", v4))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_queue, "operations", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
          v12 = v11 == v4;

          if (v12)
          {
            v13 = v10;

            if (v13)
            {
              objc_msgSend(v13, "cancel");
              -[NSMutableSet removeObject:](self->_viewsInQueue, "removeObject:", v4);
            }
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

    v13 = 0;
LABEL_13:

  }
  objc_sync_exit(v5);

}

- (void)cancelAllRendering
{
  NSMutableSet *obj;

  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
  obj = self->_viewsInQueue;
  objc_sync_enter(obj);
  -[NSMutableSet removeAllObjects](self->_viewsInQueue, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsInQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

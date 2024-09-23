@implementation TUIVisibilityTracker

- (TUIVisibilityTracker)initWithThreshold:(double)a3 block:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  TUIVisibilityTracker *v10;
  TUIVisibilityTracker *v11;
  id v12;
  id block;
  uint64_t v14;
  NSHashTable *q_observers;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIVisibilityTracker;
  v10 = -[TUIVisibilityTracker init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    v10->_threshold = a3;
    v12 = objc_msgSend(v8, "copy");
    block = v11->_block;
    v11->_block = v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    q_observers = v11->_q_observers;
    v11->_q_observers = (NSHashTable *)v14;

  }
  return v11;
}

- (void)addVisibilityObserver:(id)a3
{
  id v4;
  double v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v5 = sub_1C2AC();
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C2F0;
  v7[3] = &unk_23DB90;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = *(id *)&v5;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

- (void)removeVisibilityObserver:(id)a3
{
  id v4;
  double v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v5 = sub_1C2AC();
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C480;
  v7[3] = &unk_23DB90;
  objc_copyWeak(v8, &location);
  v7[4] = self;
  v8[1] = *(id *)&v5;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

- (void)q_notifyObserversWithRootNode:(id)a3 time:(double)a4
{
  id v6;
  TUIVisibilityChangeRecord *v7;
  TUIVisibilityChangeNode *v8;
  TUIVisibilityChangeNode *q_lastVisible;
  NSHashTable *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = -[TUIVisibilityChangeRecord initWithLastTimestamp:timestamp:rootNode:]([TUIVisibilityChangeRecord alloc], "initWithLastTimestamp:timestamp:rootNode:", v6, self->_q_lastTimestamp, a4);
  self->_q_lastTimestamp = a4;
  v8 = (TUIVisibilityChangeNode *)objc_claimAutoreleasedReturnValue(-[TUIVisibilityChangeRecord rootNode](v7, "rootNode"));
  q_lastVisible = self->_q_lastVisible;
  self->_q_lastVisible = v8;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_q_observers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "visibleContentsChanged:", v7, (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)enumerateAttributesInSection:(id)a3 block:(id)a4
{
  (*((void (**)(id, id, id, double))self->_block + 2))(self->_block, a3, a4, self->_threshold);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q_lastVisible, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_q_observers, 0);
  objc_storeStrong(&self->_block, 0);
}

@end

@implementation PKAsyncTaskProgressTracker

- (PKAsyncTaskProgressTracker)init
{
  PKAsyncTaskProgressTracker *v2;
  PKAsyncTaskProgressTracker *v3;
  NSMutableSet *v4;
  NSMutableSet *completionHandlers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAsyncTaskProgressTracker;
  v2 = -[PKAsyncTaskProgressTracker init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_status = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    completionHandlers = v3->_completionHandlers;
    v3->_completionHandlers = v4;

  }
  return v3;
}

- (void)notifyOnCompletion:(id)a3
{
  NSMutableSet *completionHandlers;
  id v4;

  if (self->_status == 2)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    completionHandlers = self->_completionHandlers;
    v4 = _Block_copy(a3);
    -[NSMutableSet addObject:](completionHandlers, "addObject:", v4);

  }
}

- (void)taskDidStart
{
  self->_status = 1;
}

- (void)taskDidComplete
{
  self->_status = 2;
  -[PKAsyncTaskProgressTracker _executeCompletionHandlers](self, "_executeCompletionHandlers");
}

- (void)_executeCompletionHandlers
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
  v3 = (void *)-[NSMutableSet copy](self->_completionHandlers, "copy");
  -[NSMutableSet removeAllObjects](self->_completionHandlers, "removeAllObjects");
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

- (unint64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end

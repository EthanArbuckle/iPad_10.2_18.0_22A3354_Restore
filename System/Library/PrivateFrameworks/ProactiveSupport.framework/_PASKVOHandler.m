@implementation _PASKVOHandler

- (_PASKVOHandler)init
{
  _PASKVOHandler *v2;
  uint64_t v3;
  NSMutableArray *tasks;
  objc_super v6;
  pthread_mutexattr_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_PASKVOHandler;
  v2 = -[_PASKVOHandler init](&v6, sel_init);
  if (v2)
  {
    v7.__sig = 0;
    *(_QWORD *)v7.__opaque = 0;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2);
    pthread_mutex_init(&v2->_lock, &v7);
    pthread_mutexattr_destroy(&v7);
    v3 = objc_opt_new();
    tasks = v2->_tasks;
    v2->_tasks = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)dealloc
{
  _opaque_pthread_mutex_t *p_lock;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_tasks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "object");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "keyPath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, v10, v8);

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  pthread_mutex_unlock(p_lock);
  pthread_mutex_destroy(p_lock);
  v11.receiver = self;
  v11.super_class = (Class)_PASKVOHandler;
  -[_PASKVOHandler dealloc](&v11, sel_dealloc);
}

- (void)reactAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setKeyPath:", v10);
  objc_msgSend(v11, "setObject:", v9);
  objc_msgSend(v11, "setAfterBlock:", v8);

  -[_PASKVOHandler _watchKeyPath:ofObject:options:usingTask:](self, "_watchKeyPath:ofObject:options:usingTask:", v10, v9, 3, v11);
}

- (void)reactAsynchronouslyAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5 onQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87___PASKVOHandler_reactAsynchronouslyAfterChangesToKeyPath_ofObject_usingBlock_onQueue___block_invoke;
  v14[3] = &unk_1E442FF88;
  v15 = v11;
  v16 = v10;
  v12 = v10;
  v13 = v11;
  -[_PASKVOHandler reactAfterChangesToKeyPath:ofObject:usingBlock:](self, "reactAfterChangesToKeyPath:ofObject:usingBlock:", a3, a4, v14);

}

- (void)reactBeforeAndAfterChangesToKeyPath:(id)a3 ofObject:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setKeyPath:", v10);
  objc_msgSend(v11, "setObject:", v9);
  objc_msgSend(v11, "setBeforeAndAfterBlock:", v8);

  -[_PASKVOHandler _watchKeyPath:ofObject:options:usingTask:](self, "_watchKeyPath:ofObject:options:usingTask:", v10, v9, 11, v11);
}

- (void)_watchKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingTask:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a4;
  v11 = a6;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_tasks, "addObject:", v11);
  objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, v12, a5, v11);
  pthread_mutex_unlock(&self->_lock);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v11 = a4;
  v12 = a5;
  if (pthread_mutex_lock(&self->_lock) != 22)
  {
    v13 = a6;
    pthread_mutex_unlock(&self->_lock);
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
    {

      v14 = 0;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
    {

      v16 = 0;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v13, "beforeAndAfterBlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v13, "beforeAndAfterBlock");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, void *, void *, uint64_t))v21)[2](v21, v24, v11, v14, v16, v19);
    }
    else
    {
      objc_msgSend(v13, "afterBlock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASKVOHandler.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task.afterBlock"));

      }
      objc_msgSend(v13, "afterBlock");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), id, id, void *, void *))v21[2])(v21, v24, v11, v14, v16);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end

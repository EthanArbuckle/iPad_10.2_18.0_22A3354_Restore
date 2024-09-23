@implementation BCFutureValue

+ (void)initialize
{
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  dispatch_queue_global_t global_queue;
  void *v8;
  _QWORD v9[5];

  if ((id)objc_opt_class(BCFutureValue) == a1)
  {
    v3 = dispatch_queue_create("BCFutureValue.outstandingSync", 0);
    v4 = (void *)qword_311400;
    qword_311400 = (uint64_t)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    v6 = (void *)qword_311408;
    qword_311408 = v5;

    global_queue = dispatch_get_global_queue(2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_145210;
    v9[3] = &unk_292568;
    v9[4] = a1;
    os_state_add_handler(v8, v9);

  }
}

+ (id)reportState
{
  NSMutableDictionary *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  const __CFString *v21;
  NSMutableDictionary *v22;
  _BYTE v23[128];

  v2 = objc_opt_new(NSMutableDictionary);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_144D08;
  v19 = sub_144D18;
  v20 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1454CC;
  block[3] = &unk_28F748;
  block[4] = &v15;
  dispatch_sync((dispatch_queue_t)qword_311400, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)v16[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6);
        objc_msgSend(v7, "_addToState:", v2, (_QWORD)v10);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    }
    while (v4);
  }

  v21 = CFSTR("BCFutureValueThreadingState");
  v22 = v2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (void)_addToState:(id)a3
{
  id v4;
  NSObject *sync;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14559C;
  block[3] = &unk_28B808;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sync, block);

}

- (BCFutureValue)init
{
  BCFutureValue *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *sync;
  NSMutableArray *v5;
  NSMutableArray *waitingBlocks;
  NSObject *v7;
  _QWORD block[4];
  BCFutureValue *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BCFutureValue;
  v2 = -[BCFutureValue init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("BCFutureValue", 0);
    sync = v2->_sync;
    v2->_sync = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    waitingBlocks = v2->_waitingBlocks;
    v2->_waitingBlocks = v5;

    v7 = qword_311400;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1457F0;
    block[3] = &unk_28B960;
    v10 = v2;
    dispatch_sync(v7, block);

  }
  return v2;
}

- (BCFutureValue)initWithValue:(id)a3
{
  id v5;
  BCFutureValue *v6;
  BCFutureValue *v7;

  v5 = a3;
  v6 = -[BCFutureValue init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_hasValue = 1;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD block[5];

  if (!-[BCFutureValue hasValue](self, "hasValue") && !-[BCFutureValue cancelled](self, "cancelled"))
  {
    -[BCFutureValue setCancelled:](self, "setCancelled:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCFutureValue waitingBlocks](self, "waitingBlocks"));
    v4 = objc_msgSend(v3, "copy");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCFutureValue waitingBlocks](self, "waitingBlocks"));
    objc_msgSend(v5, "removeAllObjects");

    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BCFutureErrorDomain"), 1, 0));
      -[BCFutureValue _notifyBlocks:withValue:error:](self, "_notifyBlocks:withValue:error:", v4, 0, v6);

    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_145980;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_311400, block);
  v7.receiver = self;
  v7.super_class = (Class)BCFutureValue;
  -[BCFutureValue dealloc](&v7, "dealloc");
}

- (void)cancel
{
  NSObject *sync;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_144D08;
  v11 = sub_144D18;
  v12 = 0;
  sync = self->_sync;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_145A9C;
  v6[3] = &unk_28E468;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sync, v6);
  v4 = v8[5];
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BCFutureErrorDomain"), 1, 0));
    -[BCFutureValue _notifyBlocks:withValue:error:](self, "_notifyBlocks:withValue:error:", v4, 0, v5);

  }
  _Block_object_dispose(&v7, 8);

}

+ (void)futures:(id)a3 notify:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = dispatch_group_create();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12);
          dispatch_group_enter(v7);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_145CDC;
          v17[3] = &unk_292590;
          v18 = v7;
          objc_msgSend(v13, "get:", v17);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    global_queue = dispatch_get_global_queue(0, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_group_notify(v7, v15, v6);

    v5 = v16;
  }

}

- (id)getNonBlockingError:(id *)a3
{
  NSObject *sync;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_144D08;
  v11 = sub_144D18;
  v12 = 0;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_145D9C;
  block[3] = &unk_28E3D0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(sync, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)get
{
  NSObject *v3;
  id v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  void *v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  backtrace(&v15, 2);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_144D08;
  v13 = sub_144D18;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_145F2C;
  v6[3] = &unk_2925B8;
  v3 = dispatch_semaphore_create(0);
  v7 = v3;
  v8 = &v9;
  -[BCFutureValue _get:caller:](self, "_get:caller:", v6, v16);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)sq_get:(id)a3 caller:(void *)a4 value:(id *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  BCFutureBlockPair *v12;
  void *v13;

  v10 = a3;
  if (!-[BCFutureValue hasValue](self, "hasValue"))
  {
    if (!-[BCFutureValue cancelled](self, "cancelled"))
    {
      v12 = objc_opt_new(BCFutureBlockPair);
      -[BCFutureBlockPair setBlock:](v12, "setBlock:", v10);
      -[BCFutureBlockPair setCaller:](v12, "setCaller:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCFutureValue waitingBlocks](self, "waitingBlocks"));
      objc_msgSend(v13, "addObject:", v12);

      goto LABEL_14;
    }
    if (a5)
      *a5 = 0;
    if (a6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BCFutureErrorDomain"), 1, 0));
      goto LABEL_11;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_14;
  }
  if (a5)
    *a5 = (id)objc_claimAutoreleasedReturnValue(-[BCFutureValue value](self, "value"));
  if (!a6)
    goto LABEL_12;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCFutureValue error](self, "error"));
LABEL_11:
  v12 = 0;
  *a6 = v11;
LABEL_14:

  return v12;
}

- (void)get:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    v5 = 0;
    v6 = 0;
    v4 = a3;
    backtrace(&v5, 2);
    -[BCFutureValue _get:caller:](self, "_get:caller:", v4, v6);

  }
}

- (void)_get:(id)a3 caller:(void *)a4
{
  id v6;
  void *v7;
  NSObject *sync;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = sub_144D08;
    v30 = sub_144D18;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_144D08;
    v24 = sub_144D18;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    sync = self->_sync;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_14628C;
    v10[3] = &unk_2925E0;
    v12 = &v16;
    v10[4] = self;
    v9 = v6;
    v11 = v9;
    v13 = &v20;
    v14 = &v26;
    v15 = a4;
    dispatch_sync(sync, v10);
    if (*((_BYTE *)v17 + 24))
      (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, v21[5], v27[5]);

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

}

- (void)getBefore:(unint64_t)a3 block:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *sync;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  void *v33;
  uint64_t v34;

  v6 = a4;
  if (v6)
  {
    v33 = 0;
    v34 = 0;
    backtrace(&v33, 2);
    v7 = v34;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_144D08;
    v31 = sub_144D18;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_144D08;
    v25 = sub_144D18;
    v26 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    sync = self->_sync;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1464F4;
    v10[3] = &unk_292608;
    v10[4] = self;
    v12 = &v27;
    v13 = &v21;
    v14 = &v17;
    v15 = a3;
    v9 = v6;
    v11 = v9;
    v16 = v7;
    dispatch_sync(sync, v10);
    if (*((_BYTE *)v18 + 24))
      (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, v28[5], v22[5]);

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }

}

- (void)_notifyBlocks:(id)a3 withValue:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v7);
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), "block"));
        ((void (**)(_QWORD, id, id))v14)[2](v14, v8, v9);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
  objc_storeStrong((id *)&self->_sync, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (NSMutableArray)waitingBlocks
{
  return self->_waitingBlocks;
}

- (void)setWaitingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_waitingBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_sync, 0);
}

@end

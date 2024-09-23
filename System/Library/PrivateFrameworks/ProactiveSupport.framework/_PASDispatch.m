@implementation _PASDispatch

+ (unint64_t)dispatchTimeWithSecondsFromNow:(double)a3
{
  if (a3 <= 0.0)
    return 0;
  if (a3 <= 9223372040.0)
    return dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return -1;
}

+ (id)autoreleasingSerialQueueWithLabel:(const char *)a3
{
  NSObject *v4;
  dispatch_queue_t v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(a3, v4);

  return v5;
}

+ (unsigned)waitForSemaphore:(id)a3 timeoutSeconds:(double)a4
{
  NSObject *v5;
  dispatch_time_t v6;
  unsigned __int8 v7;

  v5 = a3;
  if (a4 <= 0.0)
  {
    v6 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    v6 = -1;
  }
  v7 = dispatch_semaphore_wait(v5, v6) != 0;

  return v7;
}

+ (void)runAsyncOnQueue:(id)a3 afterDelaySeconds:(double)a4 block:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = v7;
  v10 = (void *)MEMORY[0x1A1AFDE78](v8);
  v11 = v9;
  v12 = MEMORY[0x1A1AFDE78](v10);
  v13 = (void *)v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASRunAsyncOnQueueWithArgs(struct _PASRunAsyncOnQueueArgs)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_PASDispatchInline.h"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("args.queue"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASRunAsyncOnQueueWithArgs(struct _PASRunAsyncOnQueueArgs)");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_PASDispatchInline.h"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("args.block"));

LABEL_3:
  if (a4 <= 0.0)
  {
    v14 = 0;
LABEL_9:
    dispatch_after(v14, v11, v13);
    goto LABEL_10;
  }
  if (a4 <= 9223372040.0)
  {
    v14 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    if (v14 != -1)
      goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Warning: _PASDispatch:runAsyncOnQueue:afterDelaySeconds:block: suppressing call-after-DISPATCH_TIME_FOREVER.", buf, 2u);
  }
LABEL_10:

}

+ (id)autoreleasingSerialQueueWithLabel:(const char *)a3 qosClass:(unsigned int)a4
{
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)v4, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dispatch_queue_t  _Nonnull _PASAutoreleasingSerialQueueWithQOS(const char * _Nullable, qos_class_t)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_PASDispatchInline.h"), 191, CFSTR("Unsupported QOS class: %u"), v4);

  }
  v8 = dispatch_queue_create(a3, v7);

  return v8;
}

+ (void)waitForSemaphore:(id)a3
{
  void *v3;
  id v4;

  if (dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASWaitForeverForSemaphore(dispatch_semaphore_t  _Nonnull __strong)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_PASDispatchInline.h"), 39, CFSTR("Unexpected failure on unlimited dispatch_semaphore_wait()"));

  }
}

+ (void)waitForSemaphore:(id)a3 timeoutSeconds:(double)a4 onAcquire:(id)a5 onTimeout:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(void);
  void (**v16)(void);
  dispatch_time_t v17;
  intptr_t v18;
  void (**v19)(void);
  void *v20;
  void *v21;
  NSObject *dsema;
  id v23;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v23 = v9;
  v12 = (void *)MEMORY[0x1A1AFDE78](v10);
  v13 = (void *)MEMORY[0x1A1AFDE78](v11);
  v14 = v23;
  v15 = (void (**)(void))MEMORY[0x1A1AFDE78](v12);
  v16 = (void (**)(void))MEMORY[0x1A1AFDE78](v13);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASWaitForSemaphoreWithArgs(struct _PASWaitForSemaphoreArgs)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_PASDispatchInline.h"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("args.semaphore"));

  }
  dsema = v14;
  if (a4 <= 0.0)
  {
    v17 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    v17 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    v17 = -1;
  }
  v18 = dispatch_semaphore_wait(dsema, v17);

  if (v18)
  {
    v19 = v16;
    if (!v16)
      goto LABEL_13;
    goto LABEL_12;
  }
  v19 = v15;
  if (v15)
LABEL_12:
    v19[2]();
LABEL_13:

}

+ (void)waitForGroup:(id)a3
{
  void *v3;
  id v4;

  if (dispatch_group_wait((dispatch_group_t)a3, 0xFFFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASWaitForeverForGroup(dispatch_group_t  _Nonnull __strong)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_PASDispatchInline.h"), 76, CFSTR("Unexpected failure on unlimited dispatch_group_wait()"));

  }
}

+ (unsigned)waitForGroup:(id)a3 timeoutSeconds:(double)a4
{
  NSObject *v5;
  dispatch_time_t v6;
  unsigned __int8 v7;

  v5 = a3;
  if (a4 <= 0.0)
  {
    v6 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    v6 = -1;
  }
  v7 = dispatch_group_wait(v5, v6) != 0;

  return v7;
}

+ (void)waitForGroup:(id)a3 timeoutSeconds:(double)a4 onGroupComplete:(id)a5 onTimeout:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(void);
  void (**v16)(void);
  dispatch_time_t v17;
  intptr_t v18;
  void (**v19)(void);
  void *v20;
  void *v21;
  NSObject *group;
  id v23;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v23 = v9;
  v12 = (void *)MEMORY[0x1A1AFDE78](v10);
  v13 = (void *)MEMORY[0x1A1AFDE78](v11);
  v14 = v23;
  v15 = (void (**)(void))MEMORY[0x1A1AFDE78](v12);
  v16 = (void (**)(void))MEMORY[0x1A1AFDE78](v13);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASWaitForGroupWithArgs(struct _PASWaitForGroupArgs)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_PASDispatchInline.h"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("args.group"));

  }
  group = v14;
  if (a4 <= 0.0)
  {
    v17 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    v17 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    v17 = -1;
  }
  v18 = dispatch_group_wait(group, v17);

  if (v18)
  {
    v19 = v16;
    if (!v16)
      goto LABEL_13;
    goto LABEL_12;
  }
  v19 = v15;
  if (v15)
LABEL_12:
    v19[2]();
LABEL_13:

}

+ (void)waitForBlock:(id)a3
{
  void *v3;
  id v4;

  if (dispatch_block_wait(a3, 0xFFFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASWaitForeverForBlock(dispatch_block_t  _Nonnull __strong)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_PASDispatchInline.h"), 112, CFSTR("Unexpected failure on unlimited dispatch_block_wait()"));

  }
}

+ (unsigned)waitForBlock:(id)a3 timeoutSeconds:(double)a4
{
  id v5;
  dispatch_time_t v6;
  unsigned __int8 v7;

  v5 = a3;
  if (a4 <= 0.0)
  {
    v6 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    v6 = -1;
  }
  v7 = dispatch_block_wait(v5, v6) != 0;

  return v7;
}

+ (void)waitForBlock:(id)a3 timeoutSeconds:(double)a4 onBlockComplete:(id)a5 onTimeout:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  void (**v16)(void);
  id v17;
  dispatch_time_t v18;
  intptr_t v19;
  void (**v20)(void);
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x1A1AFDE78](v23);
  v12 = (void *)MEMORY[0x1A1AFDE78](v9);
  v13 = (void *)MEMORY[0x1A1AFDE78](v10);
  v14 = (void *)MEMORY[0x1A1AFDE78](v11);
  v15 = (void (**)(void))MEMORY[0x1A1AFDE78](v12);
  v16 = (void (**)(void))MEMORY[0x1A1AFDE78](v13);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASWaitForBlockWithArgs(struct _PASWaitForBlockArgs)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("_PASDispatchInline.h"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("args.block"));

  }
  v17 = v14;
  if (a4 <= 0.0)
  {
    v18 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    v18 = -1;
  }
  v19 = dispatch_block_wait(v17, v18);

  if (v19)
  {
    v20 = v16;
    if (!v16)
      goto LABEL_13;
    goto LABEL_12;
  }
  v20 = v15;
  if (v15)
LABEL_12:
    v20[2]();
LABEL_13:

}

+ (void)runSyncOnMainThreadWithBlock:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x1E0C80D38], block);

}

+ (void)notifyGroup:(id)a3 onQueue:(id)a4 withTimeout:(double)a5 block:(id)a6
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  dispatch_block_t v14;
  id v15;
  dispatch_block_t v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD block[7];
  uint64_t v24;
  id *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[5];
  id v38;

  v9 = a6;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__3087;
  v37[4] = __Block_byref_object_dispose__3088;
  v10 = a4;
  v11 = a3;
  v38 = (id)objc_opt_new();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__1;
  v33[4] = __Block_byref_object_dispose__2;
  v12 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke;
  v30[3] = &unk_1E44305B8;
  v31 = v9;
  v32 = v35;
  v13 = v9;
  v34 = (id)MEMORY[0x1A1AFDE78](v30);
  v24 = 0;
  v25 = (id *)&v24;
  v26 = 0x3042000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke_5;
  block[3] = &unk_1E44305E0;
  block[4] = v37;
  block[5] = v33;
  block[6] = &v24;
  v14 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  dispatch_group_notify(v11, v10, v14);

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __54___PASDispatch_notifyGroup_onQueue_withTimeout_block___block_invoke_2;
  v18[3] = &unk_1E4430608;
  v21 = v35;
  v22 = v33;
  v19 = v14;
  v20 = v37;
  v15 = v14;
  v16 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v18);
  objc_storeWeak(v25 + 5, v16);
  v17 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  dispatch_after(v17, v10, v16);

  _Block_object_dispose(&v24, 8);
  objc_destroyWeak(&v29);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

}

@end

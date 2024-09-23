@implementation NSMutableArray(_UIKBRTObjectArray)

- (uint64_t)_listContainsOrderedItems
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, &_listContainsOrderedItemsKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)_set_listContainsOrderedItems:()_UIKBRTObjectArray
{
  void *v3;

  if (a3)
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v3 = 0;
  objc_setAssociatedObject(a1, &_listContainsOrderedItemsKey, v3, (void *)3);
}

- (id)_syncQueue
{
  void *v2;

  objc_getAssociatedObject(a1, &_syncQueueKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = dispatch_queue_create("_UIKBRTObjectArrayQueue", 0);
    objc_setAssociatedObject(a1, &_syncQueueKey, v2, (void *)1);
  }
  return v2;
}

- (void)_set_syncQueue:()_UIKBRTObjectArray
{
  objc_setAssociatedObject(a1, &_syncQueueKey, a3, (void *)1);
}

- (void)_uikbrtInsert:()_UIKBRTObjectArray before:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  void *v20;
  id v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

  }
  objc_msgSend(v7, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry.owner == nil"));

    if (!v8)
      goto LABEL_7;
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  objc_msgSend(v8, "owner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextEntry == nil || nextEntry.owner == self"));

  }
LABEL_7:
  if (objc_msgSend(a1, "count") && objc_msgSend(a1, "_listContainsOrderedItems"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self._listContainsOrderedItems"));

  }
  objc_msgSend(a1, "_syncQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_before___block_invoke;
  block[3] = &unk_1E16C5CA0;
  v19 = v7;
  v20 = a1;
  v21 = v8;
  v22 = a2;
  v13 = v8;
  v17 = v7;
  dispatch_sync(v12, block);

}

- (void)_uikbrtInsert:()_UIKBRTObjectArray after:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v19;
  void *v20;
  id v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

  }
  objc_msgSend(v7, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry.owner == nil"));

    if (!v8)
      goto LABEL_7;
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  objc_msgSend(v8, "owner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousEntry == nil || previousEntry.owner == self"));

  }
LABEL_7:
  if (objc_msgSend(a1, "count") && objc_msgSend(a1, "_listContainsOrderedItems"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self._listContainsOrderedItems"));

  }
  objc_msgSend(a1, "_syncQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_after___block_invoke;
  block[3] = &unk_1E16C5CA0;
  v19 = v7;
  v20 = a1;
  v21 = v8;
  v22 = a2;
  v13 = v8;
  v17 = v7;
  dispatch_sync(v12, block);

}

- (void)_uikbrtInsert:()_UIKBRTObjectArray beforeItemPassingTest:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

  }
  objc_msgSend(v7, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry.owner == nil"));

    if (v8)
      goto LABEL_5;
  }
  else if (v8)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

LABEL_5:
  if (objc_msgSend(a1, "count"))
  {
    if ((objc_msgSend(a1, "_listContainsOrderedItems") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self._listContainsOrderedItems"));

    }
  }
  else
  {
    objc_msgSend(a1, "_set_listContainsOrderedItems:", 1);
  }
  objc_msgSend(a1, "_syncQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke;
  block[3] = &unk_1E16BAD68;
  v18 = v7;
  v19 = a1;
  v20 = v8;
  v12 = v8;
  v16 = v7;
  dispatch_sync(v11, block);

}

- (void)_uikbrtRemove:()_UIKBRTObjectArray
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

  }
  objc_msgSend(v5, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIKBRTObjectArray.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry.owner == self"));

  }
  objc_msgSend(a1, "_syncQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NSMutableArray__UIKBRTObjectArray___uikbrtRemove___block_invoke;
  block[3] = &unk_1E16B1B50;
  block[4] = a1;
  v12 = v5;
  v10 = v5;
  dispatch_sync(v7, block);

}

@end

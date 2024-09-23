@implementation _UIArrayController

- (_UIArrayController)initWithDelegate:(id)a3
{
  id v4;
  _UIArrayController *v5;
  _UIArrayController *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIArrayController;
  v5 = -[_UIArrayController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIArrayController setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[_UIArrayController setOperationQueue:](v6, "setOperationQueue:", v7);

    -[_UIArrayController operationQueue](v6, "operationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaxConcurrentOperationCount:", 1);

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIArrayController setLastSnapshot:](v6, "setLastSnapshot:", v9);

  }
  return v6;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIArrayController.m"), 56, CFSTR("_UIArrayController deallocated without being invalidated first"));

  }
  v5.receiver = self;
  v5.super_class = (Class)_UIArrayController;
  -[_UIArrayController dealloc](&v5, sel_dealloc);
}

- (void)setSortDescriptors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_UIArrayController operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41___UIArrayController_setSortDescriptors___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (NSArray)sortDescriptors
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__99;
  v12 = __Block_byref_object_dispose__99;
  v13 = 0;
  -[_UIArrayController operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37___UIArrayController_sortDescriptors__block_invoke;
  v7[3] = &unk_1E16BACE0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)setPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_UIArrayController operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35___UIArrayController_setPredicate___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (NSPredicate)predicate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__99;
  v12 = __Block_byref_object_dispose__99;
  v13 = 0;
  -[_UIArrayController operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "underlyingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31___UIArrayController_predicate__block_invoke;
  v7[3] = &unk_1E16BACE0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSPredicate *)v5;
}

- (void)invalidate
{
  void *v3;
  _QWORD v4[5];

  -[_UIArrayController operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32___UIArrayController_invalidate__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "addOperationWithBlock:", v4);

}

- (void)setOperationQueue:(id)a3
{
  NSOperationQueue *v6;
  NSOperationQueue **p_operationQueue;
  NSOperationQueue *operationQueue;
  void *v9;
  NSOperationQueue *v10;
  NSOperationQueue *v11;

  v6 = (NSOperationQueue *)a3;
  if (self->_firstUpdateSent)
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIArrayController.m"), 108, CFSTR("Operation queue changed after first update sent"));

    v6 = v11;
  }
  operationQueue = self->_operationQueue;
  p_operationQueue = &self->_operationQueue;
  if (operationQueue != v6)
  {
    v10 = v6;
    objc_storeStrong((id *)p_operationQueue, a3);
    v6 = v10;
  }

}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  return 0;
}

- (id)_computeUpdatesFromOld:(id)a3 toNew:(id)a4 changedItems:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (!objc_msgSend(v7, "count"))
  {
LABEL_16:
    v21 = objc_msgSend(v8, "count");
    v20 = v29;
    if ((v21 != objc_msgSend(v7, "count") || objc_msgSend(v9, "count")) && objc_msgSend(v8, "count"))
    {
      v22 = 0;
      while (1)
      {
        objc_msgSend(v8, "objectAtIndex:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsObject:", v23) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v22, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v24);

          if ((unint64_t)++v10 > 0x80)
            break;
        }

        if (++v22 >= (unint64_t)objc_msgSend(v8, "count"))
          goto LABEL_23;
      }

    }
    else
    {
LABEL_23:
      if (!objc_msgSend(v29, "count")
        && !objc_msgSend(v9, "count")
        && !objc_msgSend(v33, "count")
        && !objc_msgSend(v31, "count"))
      {
        v19 = 0;
        goto LABEL_31;
      }
      v25 = objc_msgSend(v7, "count");
      v26 = objc_msgSend(v29, "count") + v25;
      v27 = v26 - objc_msgSend(v9, "count");
      if (v27 == objc_msgSend(v8, "count"))
      {
        v34[0] = CFSTR("ins");
        v34[1] = CFSTR("del");
        v35[0] = v29;
        v35[1] = v9;
        v34[2] = CFSTR("mov");
        v34[3] = CFSTR("mod");
        v35[2] = v33;
        v35[3] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
    }
    v19 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_31;
  }
  v11 = 0;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "indexOfObject:", v12);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);
      goto LABEL_10;
    }
    if (v11 != v13)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v14, v15);

LABEL_10:
      if ((unint64_t)++v10 > 0x80)
        goto LABEL_15;
      goto LABEL_11;
    }
    if (!v32)
      break;
    if (objc_msgSend(v32, "containsObject:", v12))
      goto LABEL_14;
LABEL_11:

    if (++v11 >= (unint64_t)objc_msgSend(v7, "count"))
      goto LABEL_16;
  }
  objc_msgSend(v8, "objectAtIndex:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_UIArrayController objectAttributeModified:newObject:](self, "objectAttributeModified:newObject:", v12, v16);

  if (!v17)
    goto LABEL_11;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v18);

  if ((unint64_t)++v10 < 0x81)
    goto LABEL_11;
LABEL_15:

  v19 = (void *)MEMORY[0x1E0C9AA70];
  v20 = v29;
LABEL_31:

  return v19;
}

- (void)processUpdate:(id)a3 changedObjects:(id)a4
{
  unint64_t v7;
  void *v8;
  BOOL firstUpdateSent;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v7 = (unint64_t)a4;
  v8 = (void *)objc_msgSend(a3, "copy");
  firstUpdateSent = self->_firstUpdateSent;
  self->_firstUpdateSent = 1;
  if (!((unint64_t)a3 | v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIArrayController.m"), 198, CFSTR("Either updated set or changed set must be non-nil"));

  }
  -[_UIArrayController operationQueue](self, "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51___UIArrayController_processUpdate_changedObjects___block_invoke;
  v14[3] = &unk_1E16B4030;
  v14[4] = self;
  v15 = v8;
  v16 = (id)v7;
  v17 = !firstUpdateSent;
  v11 = (id)v7;
  v12 = v8;
  objc_msgSend(v10, "addOperationWithBlock:", v14);

}

- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIArrayController setLastSnapshot:](self, "setLastSnapshot:", v7);
  -[_UIArrayController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayController:modelChanged:differences:", self, v7, v6);

}

- (_UIArrayControllerDelegate)delegate
{
  return (_UIArrayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSOrderedSet)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end

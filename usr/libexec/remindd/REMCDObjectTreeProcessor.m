@implementation REMCDObjectTreeProcessor

- (REMCDObjectTreeProcessor)initWithTraversalOrder:(unint64_t)a3 batchSize:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  REMCDObjectTreeProcessor *v9;
  REMCDObjectTreeProcessor *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)REMCDObjectTreeProcessor;
  v9 = -[REMCDObjectTreeProcessor init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_traversalOrder = a3;
    v9->_batchSize = a4;
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v10;
}

- (id)traverse:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[REMCDObjectTreeProcessor traversalOrder](self, "traversalOrder"))
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("REMCDObjectTreeProcessor: Unsupported traversal order {%ld}"), -[REMCDObjectTreeProcessor traversalOrder](self, "traversalOrder"));
    v5 = &__NSArray0__struct;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectTreeProcessor traverseByPostOrder:](self, "traverseByPostOrder:", v4));
  }

  return v5;
}

- (id)traverseByPostOrder:(id)a3
{
  id v4;
  void *v5;
  NSString *(__cdecl **v6)(SEL);
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  unint64_t v35;
  void *v36;
  void *v37;
  int *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint8_t v52[4];
  int v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = &NSStringFromSelector_ptr;
  v7 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    *(_DWORD *)buf = 138543618;
    v45 = v8;
    v46 = 2048;
    v47 = -[REMCDObjectTreeProcessor batchSize](self, "batchSize");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "REMCDObjectTreeProcessor: START traversing post-order from {rootNode: %{public}@, batchSize: %ld}", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = objc_alloc_init((Class)NSMutableOrderedSet);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v4));
  v12 = v4;
  v43 = v12;
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    v39 = &v53;
    v40 = v5;
    v14 = v12;
    v41 = v9;
    do
    {
      v15 = objc_autoreleasePoolPush();
      if (objc_msgSend(v14, "expanded"))
      {

        v13 = 0;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectTreeProcessor delegate](self, "delegate"));
        v17 = objc_msgSend(v16, "preprocessTreeNode:", v14);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childrenNodes"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reverseObjectEnumerator"));
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));

          v6 = &NSStringFromSelector_ptr;
          v13 = v18;
        }
        else
        {
          v20 = 0;
        }

        objc_msgSend(v14, "setExpanded:", 1);
        v13 = (void *)v20;
      }
      if (objc_msgSend(v13, "count", v39))
      {
        objc_msgSend(v11, "addObjectsFromArray:", v13);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        v22 = objc_msgSend(v10, "containsObject:", v21);

        if (v22)
        {
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[282], "write"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_100684EF0(v52, v14, v39, v23);
        }
        else
        {
          objc_msgSend(v9, "addObject:", v14);
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
          objc_msgSend(v10, "addObject:", v23);
        }

        objc_msgSend(v11, "removeLastObject");
      }
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));

      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[282], "write"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v42 = objc_msgSend(v11, "count");
        v26 = objc_msgSend(v9, "count");
        v27 = objc_msgSend(v10, "count");
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        *(_DWORD *)buf = 134218754;
        v45 = v42;
        v46 = 2048;
        v47 = (unint64_t)v26;
        v6 = &NSStringFromSelector_ptr;
        v48 = 2048;
        v49 = v27;
        v50 = 2114;
        v51 = v28;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "REMCDObjectTreeProcessor: \tSTATUS {traversalStack.count: %ld, flushQueue.count: %ld, flushed.count: %ld, tailNode: %{public}@}", buf, 0x2Au);

        v9 = v41;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectTreeProcessor _flushIfNeeded:](self, "_flushIfNeeded:", v9));
      objc_msgSend(v10, "addObjectsFromArray:", v25);

      objc_autoreleasePoolPop(v15);
      v14 = v12;
    }
    while (objc_msgSend(v11, "count"));

    v5 = v40;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectTreeProcessor _flushRemaining:](self, "_flushRemaining:", v9));
  objc_msgSend(v10, "addObjectsFromArray:", v29);

  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6[282], "write"));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = objc_msgSend(v10, "count");
    v32 = v9;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v33, "timeIntervalSinceDate:", v5);
    *(double *)&v35 = v34 * 1000.0;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "identifier"));
    *(_DWORD *)buf = 134218498;
    v45 = v31;
    v46 = 2048;
    v47 = v35;
    v48 = 2114;
    v49 = v36;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "REMCDObjectTreeProcessor: END traversal for {processed.count: %ld, elapsed: %.4f ms, rootNode: %{public}@}", buf, 0x20u);

    v9 = v32;
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "array"));
  return v37;
}

- (id)_flushIfNeeded:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 >= (id)-[REMCDObjectTreeProcessor batchSize](self, "batchSize"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectTreeProcessor _flushRemaining:](self, "_flushRemaining:", v4));
  else
    v6 = &__NSArray0__struct;

  return v6;
}

- (id)_flushRemaining:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_100684F64(v4, v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectTreeProcessor delegate](self, "delegate"));
    objc_msgSend(v6, "processBatchOfTreeNodes:", v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("identifier")));
    objc_msgSend(v4, "removeAllObjects");
  }
  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (unint64_t)traversalOrder
{
  return self->_traversalOrder;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (REMCDObjectTreeProcessorDelegate)delegate
{
  return (REMCDObjectTreeProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

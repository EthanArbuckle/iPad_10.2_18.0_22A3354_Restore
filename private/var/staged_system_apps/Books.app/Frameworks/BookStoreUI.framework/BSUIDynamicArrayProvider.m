@implementation BSUIDynamicArrayProvider

- (BSUIDynamicArrayProvider)initWithArray:(id)a3 options:(id)a4 dynamicArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  BSUIDynamicArrayProvider *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  NSString *uniqueId;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)BSUIDynamicArrayProvider;
  v11 = -[BSUIDynamicArrayProvider init](&v26, "init");
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("BSUIDynamicArrayProvider.queue", v13);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("updateType")));
    v17 = (void *)v16;
    if (v16)
      v18 = (__CFString *)v16;
    else
      v18 = CFSTR("replace");
    objc_storeStrong((id *)&v11->_updateType, v18);

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uniqueId")));
    uniqueId = v11->_uniqueId;
    v11->_uniqueId = (NSString *)v19;

    v21 = objc_opt_class(NSNumber);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("loadsContent")));
    v23 = BUDynamicCast(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v11->_loadsContent = objc_msgSend(v24, "BOOLValue");

    -[BSUIDynamicArrayProvider _checkForDuplicates:](v11, "_checkForDuplicates:", v8);
    -[BSUIDynamicArrayProvider _q_registerNewGenerationWithArray:](v11, "_q_registerNewGenerationWithArray:", v8);
    objc_storeWeak((id *)&v11->_dynamicArray, v10);
  }

  return v11;
}

- (id)objectAtIndex:(int64_t)a3 generation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "data"));
  v6 = v5;
  if (a3 < 0 || (unint64_t)objc_msgSend(v5, "count") <= a3)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  return v7;
}

- (id)currentArray
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider currentGeneration](self, "currentGeneration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return v3;
}

- (int64_t)countForGeneration:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "data"));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (void)_checkForDuplicates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v10 = objc_msgSend(v8, "count");
    if (v10 != objc_msgSend(v7, "count"))
    {
      v19 = v7;
      v20 = v4;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v18 = v8;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            if ((unint64_t)objc_msgSend(v11, "countForObject:", v16) >= 2)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
                *(_DWORD *)buf = 138412546;
                v26 = v17;
                v27 = 2112;
                v28 = v16;
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BSUIDynamicArrayProvider: entries with duplicate uniqueID (%@): %@", buf, 0x16u);

              }
              objc_msgSend(v9, "addObject:", v16);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v13);
      }

      v7 = v19;
      v4 = v20;
      v8 = v18;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_238858(v9);
    }

  }
}

- (void)updateArray:(id)a3 batchUpdatesBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[BSUIDynamicArrayProvider _checkForDuplicates:](self, "_checkForDuplicates:", v6);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1FF64;
  block[3] = &unk_2E4B20;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)_q_registerNewGenerationWithArray:(id)a3
{
  id v4;
  _BSUIDynamicArrayGeneration *v5;
  _BSUIDynamicArrayGeneration *currentGeneration;

  v4 = a3;
  v5 = -[_BSUIDynamicArrayGeneration initWithData:]([_BSUIDynamicArrayGeneration alloc], "initWithData:", v4);

  currentGeneration = self->_currentGeneration;
  self->_currentGeneration = v5;

}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  void (**v7)(id, id);
  id v8;
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NSMutableArray *v16;
  id v17;

  v13 = a4;
  v7 = (void (**)(id, id))a5;
  v8 = a3;
  v9 = objc_opt_new(NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_20260;
  v14[3] = &unk_2E4B48;
  v17 = objc_msgSend(v10, "count");
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v12 = v10;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v14);

  if (v7)
    v7[2](v7, v11);

}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  length = a3.length;
  location = a3.location;
  v10 = (void (**)(id, void *))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "data"));
  if (location + length <= (unint64_t)objc_msgSend(v8, "count"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", location, length));
  else
    v9 = 0;
  if (v10)
    v10[2](v10, v9);

}

- (void)_moveUpdateForDynamicArray:(id)a3 newArray:(id)a4 updater:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;

  v57 = a3;
  v8 = a4;
  v53 = a5;
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v56 = objc_msgSend(v57, "mutableCopy");
  v11 = objc_alloc_init((Class)NSMutableSet);
  if (objc_msgSend(v57, "count"))
  {
    v12 = 0;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v12, v53));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
      objc_msgSend(v11, "addObject:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v12));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v18);

      ++v12;
    }
    while (v12 < (unint64_t)objc_msgSend(v57, "count"));
  }
  v55 = v11;
  if (objc_msgSend(v8, "count", v53))
  {
    v19 = 0;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v21));
      v23 = objc_msgSend(v11, "containsObject:", v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v19));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v26));
      if (v23)
        v28 = v9;
      else
        v28 = v10;
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, v27);

      v11 = v55;
      ++v19;
    }
    while (v19 < (unint64_t)objc_msgSend(v8, "count"));
  }
  v29 = (char *)objc_msgSend(v57, "count");
  if (v29)
  {
    v30 = v29 - 1;
    do
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v30));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v33));

      if (!v34)
      {
        objc_msgSend(v54, "deleteItemAtIndex:", v30);
        objc_msgSend(v56, "removeObjectAtIndex:", v30);
      }
      --v30;
    }
    while (v30 != (char *)-1);
  }
  if (objc_msgSend(v8, "count"))
  {
    v35 = 0;
    do
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v35));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v37));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v38));

      if (v39)
      {
        objc_msgSend(v54, "insertItemAtIndex:", v35);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v35));
        objc_msgSend(v56, "insertObject:atIndex:", v40, v35);

      }
      ++v35;
    }
    while (v35 < (unint64_t)objc_msgSend(v8, "count"));
  }
  if (objc_msgSend(v57, "count"))
  {
    v41 = 0;
    do
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v41));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDynamicArrayProvider uniqueId](self, "uniqueId"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v43));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v44));

      v46 = v57;
      if (v45)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", v41));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", self->_uniqueId));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v48));
        v50 = objc_msgSend(v49, "unsignedIntegerValue");

        if ((id)v41 == v50
          || (v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v50)),
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v50)),
              v52,
              v51,
              v51 == v52))
        {
          objc_msgSend(v54, "updateItemAtIndex:", v41);
        }
        else
        {
          objc_msgSend(v54, "moveItemFromIndex:toIndex:", v41, v50);
        }
        v46 = v57;
      }
      ++v41;
    }
    while (v41 < (unint64_t)objc_msgSend(v46, "count"));
  }

}

- (void)_replaceUpdateForDynamicArray:(id)a3 newArray:(id)a4 updater:(id)a5
{
  id v7;
  char *v8;
  char *v9;
  unint64_t v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = (char *)objc_msgSend(a3, "count");
  if (v8)
  {
    v9 = v8 - 1;
    do
      objc_msgSend(v7, "deleteItemAtIndex:", v9--);
    while (v9 != (char *)-1);
  }
  if (objc_msgSend(v11, "count"))
  {
    v10 = 0;
    do
      objc_msgSend(v7, "insertItemAtIndex:", v10++);
    while (v10 < (unint64_t)objc_msgSend(v11, "count"));
  }

}

- (_BSUIDynamicArrayGeneration)currentGeneration
{
  return self->_currentGeneration;
}

- (void)setCurrentGeneration:(id)a3
{
  objc_storeStrong((id *)&self->_currentGeneration, a3);
}

- (BOOL)loadsContent
{
  return self->_loadsContent;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (TUIMutableDynamicArray)dynamicArray
{
  return (TUIMutableDynamicArray *)objc_loadWeakRetained((id *)&self->_dynamicArray);
}

- (void)setDynamicArray:(id)a3
{
  objc_storeWeak((id *)&self->_dynamicArray, a3);
}

- (NSString)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(id)a3
{
  objc_storeStrong((id *)&self->_updateType, a3);
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_updateType, 0);
  objc_destroyWeak((id *)&self->_dynamicArray);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentGeneration, 0);
}

@end

@implementation BannerItemQueue

- (BannerItemQueue)init
{
  BannerItemQueue *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *dequeuedOrder;
  NSMutableDictionary *v5;
  NSMutableDictionary *queueByClass;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BannerItemQueue;
  v2 = -[BannerItemQueue init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableOrderedSet);
    dequeuedOrder = v2->_dequeuedOrder;
    v2->_dequeuedOrder = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    queueByClass = v2->_queueByClass;
    v2->_queueByClass = v5;

  }
  return v2;
}

- (void)addItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_queueByClass, "objectForKeyedSubscript:", objc_opt_class(v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_opt_new(NSMutableArray);
  v9 = v8;

  if (!-[NSMutableArray count](v9, "count"))
    goto LABEL_10;
  v10 = 0;
  while (1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
      break;
    if (++v10 >= (unint64_t)-[NSMutableArray count](v9, "count"))
      goto LABEL_10;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = sub_100431C7C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v10));
      v20 = 138412546;
      v21 = v19;
      v22 = 2112;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Replacing item %@ with %@", (uint8_t *)&v20, 0x16u);

    }
    -[NSMutableArray replaceObjectAtIndex:withObject:](v9, "replaceObjectAtIndex:withObject:", v10, v4);
  }
  else
  {
LABEL_10:
    v15 = sub_100431C7C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v20 = 138412290;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Adding item %@", (uint8_t *)&v20, 0xCu);
    }

    -[NSMutableArray addObject:](v9, "addObject:", v4);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queueByClass, "setObject:forKeyedSubscript:", v9, objc_opt_class(v4));

}

- (void)removeItemsOfType:(Class)a3
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  Class v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_queueByClass, "objectForKeyedSubscript:"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = sub_100431C7C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 134218242;
      v11 = v6;
      v12 = 2112;
      v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removing %lu instance(s) of %@", (uint8_t *)&v10, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_queueByClass, "objectForKeyedSubscript:", a3));
    objc_msgSend(v9, "removeAllObjects");

  }
}

- (void)removeAllItems
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];

  v3 = sub_100431C7C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_queueByClass, "allValues", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v6);
          v9 += (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "count");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v12 = sub_100431C7C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Removing all (%lu) instance(s)", buf, 0xCu);
    }

  }
  -[NSMutableDictionary removeAllObjects](self->_queueByClass, "removeAllObjects");
}

- (id)popItem
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];

  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = self->_queueByClass;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_queueByClass, "objectForKeyedSubscript:", v8));
      if (objc_msgSend(v9, "count"))
      {
        if ((-[NSMutableOrderedSet containsObject:](self->_dequeuedOrder, "containsObject:", v8) & 1) == 0)
          break;
      }

      if (v5 == (id)++v7)
      {
        v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v10 = sub_100431C7C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Dequeuing from new queue: %@", buf, 0xCu);
    }

    if (v9)
      goto LABEL_27;
  }
  else
  {
LABEL_10:

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet reverseObjectEnumerator](self->_dequeuedOrder, "reverseObjectEnumerator", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_queueByClass, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i)));
        if (objc_msgSend(v9, "count"))
        {
          v17 = sub_100431C7C();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v9;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Dequeuing from oldest queue: %@", buf, 0xCu);
          }

          goto LABEL_26;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v14)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_26:

LABEL_27:
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v20 = (void *)v19;
  if (v19)
  {
    v21 = objc_opt_class(v19);
    -[NSMutableOrderedSet removeObject:](self->_dequeuedOrder, "removeObject:", v21);
    -[NSMutableOrderedSet insertObject:atIndex:](self->_dequeuedOrder, "insertObject:atIndex:", v21, 0);
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    v22 = sub_100431C7C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v20;
      v24 = "Dequeued item: %@";
      v25 = v23;
      v26 = 12;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
    }
  }
  else
  {
    v27 = sub_100431C7C();
    v23 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v24 = "No items to dequeue";
      v25 = v23;
      v26 = 2;
      goto LABEL_32;
    }
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueByClass, 0);
  objc_storeStrong((id *)&self->_dequeuedOrder, 0);
}

@end

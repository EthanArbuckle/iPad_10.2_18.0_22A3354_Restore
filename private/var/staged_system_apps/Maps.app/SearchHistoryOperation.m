@implementation SearchHistoryOperation

- (SearchHistoryOperation)initWithSearchQuery:(id)a3 searchMode:(unsigned int)a4 history:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  SearchHistoryOperation *v14;
  SearchHistoryOperation *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SearchHistoryOperation;
  v14 = -[SearchHistoryOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchQuery, a3);
    v15->_searchMode = a4;
    v15->_stateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_history, a5);
    objc_storeStrong((id *)&v15->_context, a6);
  }

  return v15;
}

- (void)main
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  SearchHistoryOperation *v11;
  id v12;
  id v13;
  int v14;
  SearchHistoryOperation *v15;

  if (-[SearchHistoryOperation isCancelled](self, "isCancelled"))
  {
    v3 = sub_10043222C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SearchHistoryOperation: %@ - is cancelled before starting", (uint8_t *)&v14, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "historyOperation:didFindMatches:", self, &__NSArray0__struct);

    -[SearchHistoryOperation setFinished:](self, "setFinished:", 1);
  }
  else
  {
    -[SearchHistoryOperation setExecuting:](self, "setExecuting:", 1);
    v6 = sub_10043222C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SearchHistoryOperation - collecting results", (uint8_t *)&v14, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHistoryOperation _historyResultsForSearchQuery:searchMode:](self, "_historyResultsForSearchQuery:searchMode:", self->_searchQuery, self->_searchMode));
    -[SearchHistoryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    -[SearchHistoryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    os_unfair_lock_lock(&self->_stateLock);
    if ((-[SearchHistoryOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      self->_isFinished = 1;
      self->_isExecuting = 0;
    }
    os_unfair_lock_unlock(&self->_stateLock);
    -[SearchHistoryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
    -[SearchHistoryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    v9 = sub_10043222C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (SearchHistoryOperation *)objc_msgSend(v8, "count");
      v14 = 134217984;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SearchHistoryOperation - collected %lu results", (uint8_t *)&v14, 0xCu);
    }

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "historyOperation:didFindMatches:", self, v8);

    }
  }
}

- (BOOL)_removeCompletionItemForStringKey:(id)a3 query:(id)a4 fromCompletions:(id)a5
{
  id v7;
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "_web_hasCaseInsensitivePrefix:", a4);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lowercaseString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByRemovingPunctuation"));

    objc_msgSend(v8, "removeObjectForKey:", v11);
  }

  return v9;
}

- (id)shortAddressForMapItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_addressFormattedAsName"));
  if (!objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_addressFormattedAsShortenedAddress"));

    v4 = (void *)v5;
  }

  return v4;
}

- (id)_historyResultsForSearchQuery:(id)a3 searchMode:(unsigned int)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSArray *obj;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  SearchHistoryOperation *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a3;
  if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {
    v23 = v5;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = self->_history;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v5 = v23;
          if ((-[SearchHistoryOperation isCancelled](self, "isCancelled") & 1) != 0)
          {

            v6 = 0;
            v19 = v22;
            goto LABEL_14;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry"));
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1008C1878;
          v29[3] = &unk_1011DAAF0;
          v29[4] = v12;
          v14 = v7;
          v15 = v23;
          v30 = v15;
          v31 = self;
          v16 = v22;
          v32 = v16;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1008C1AA4;
          v24[3] = &unk_1011DAB18;
          v24[4] = self;
          v17 = v15;
          v7 = v14;
          v25 = v17;
          v26 = v14;
          v27 = v12;
          v28 = v16;
          objc_msgSend(v13, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v29, 0, v24, &stru_1011DAB38);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v9)
          continue;
        break;
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
    v19 = v22;
    objc_msgSend(v22, "addObjectsFromArray:", v18);

    objc_msgSend(v22, "sortUsingFunction:context:", sub_1008C1EF0, 0);
    v6 = objc_msgSend(v22, "copy");
    v5 = v23;
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFinished
{
  SearchHistoryOperation *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  SearchHistoryOperation *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isExecuting;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  -[SearchHistoryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  os_unfair_lock_lock(&self->_stateLock);
  self->_isFinished = a3;
  os_unfair_lock_unlock(&self->_stateLock);
  -[SearchHistoryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)setExecuting:(BOOL)a3
{
  -[SearchHistoryOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  os_unfair_lock_lock(&self->_stateLock);
  self->_isExecuting = a3;
  os_unfair_lock_unlock(&self->_stateLock);
  -[SearchHistoryOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (SearchHistoryOperationDelegate)delegate
{
  return (SearchHistoryOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end

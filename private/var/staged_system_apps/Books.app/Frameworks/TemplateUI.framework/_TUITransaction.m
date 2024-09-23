@implementation _TUITransaction

- (NSString)description
{
  return (NSString *)-[_TUITransaction redactedDescription](self, "redactedDescription");
}

- (id)redactedDescription
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  unint64_t identifier;
  TUITransactionOptions *options;
  unint64_t flags;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  options = self->_options;
  identifier = self->_identifier;
  flags = self->_flags;
  if (self->_name)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" name=%@"), self->_name));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p id=%lu flags=%lu options=%@ %@>"), v6, self, identifier, flags, options, v10));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p id=%lu flags=%lu options=%@ %@>"), v5, self, identifier, flags, self->_options, &stru_243BF0));
  }

  return v11;
}

- (int64_t)compareIdentifier:(id)a3
{
  id v4;
  unint64_t identifier;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  identifier = self->_identifier;
  if (identifier >= (unint64_t)objc_msgSend(v4, "identifier"))
  {
    v7 = self->_identifier;
    v6 = v7 > (unint64_t)objc_msgSend(v4, "identifier");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (_TUITransaction)initWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  _TUITransaction *v8;
  _TUITransaction *v9;
  unint64_t v10;
  NSString *v11;
  NSString *name;
  TUITransactionOptions *v13;
  TUITransactionOptions *options;
  dispatch_group_t v15;
  OS_dispatch_group *completionGroup;
  dispatch_group_t v17;
  OS_dispatch_group *subTransactionCompletionGroup;
  dispatch_group_t v19;
  OS_dispatch_group *notifyAppliedGroup;
  uint64_t v21;
  NSDate *creationDate;
  uint64_t v23;
  NSArray *callstack;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_TUITransaction;
  v8 = -[_TUITransaction init](&v26, "init");
  v9 = v8;
  if (v8)
  {
    v8->_stateLock._os_unfair_lock_opaque = 0;
    do
      v10 = __ldaxr(&qword_2CB1A8);
    while (__stlxr(v10 + 1, &qword_2CB1A8));
    v8->_identifier = v10;
    v11 = (NSString *)objc_msgSend(v6, "copy");
    name = v9->_name;
    v9->_name = v11;

    v13 = (TUITransactionOptions *)objc_msgSend(v7, "copy");
    options = v9->_options;
    v9->_options = v13;

    v15 = dispatch_group_create();
    completionGroup = v9->_completionGroup;
    v9->_completionGroup = (OS_dispatch_group *)v15;

    v17 = dispatch_group_create();
    subTransactionCompletionGroup = v9->_subTransactionCompletionGroup;
    v9->_subTransactionCompletionGroup = (OS_dispatch_group *)v17;

    v19 = dispatch_group_create();
    notifyAppliedGroup = v9->_notifyAppliedGroup;
    v9->_notifyAppliedGroup = (OS_dispatch_group *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v21;

    if (qword_2CB1B8 != -1)
      dispatch_once(&qword_2CB1B8, &stru_23D9F8);
    if (byte_2CB1B0)
    {
      v23 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      callstack = v9->_callstack;
      v9->_callstack = (NSArray *)v23;

    }
    *(_BYTE *)&v9->_state = 0;
    dispatch_group_enter((dispatch_group_t)v9->_notifyAppliedGroup);
  }

  return v9;
}

- (void)addCompletion:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v10;
  v8 = v6;
  if (v10)
  {
    if (!v6)
    {
      v8 = &_dispatch_main_q;
      v9 = &_dispatch_main_q;
      v7 = v10;
    }
    TUIDispatchGroupNotifyViaRunloopIfMain(self->_completionGroup, v8, v7);
  }

}

- (void)addCompletionDeferral
{
  dispatch_group_enter((dispatch_group_t)self->_completionGroup);
}

- (void)removeCompletionDeferral
{
  dispatch_group_leave((dispatch_group_t)self->_completionGroup);
}

- (id)_isDependentOn:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  _TUITransactionPathComponent *v7;
  id v8;
  void *v9;
  _TUITransactionPathComponent *v10;
  void *v11;
  void *v12;
  void *v13;
  _TUITransactionPathComponent *v14;
  void *v15;
  _TUITransactionPathComponent *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_opt_new(NSMutableArray);
  v7 = [_TUITransactionPathComponent alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectEnumerator"));
  v10 = -[_TUITransactionPathComponent initWithTransaction:enumerator:](v7, "initWithTransaction:enumerator:", 0, v9);
  -[NSMutableArray addObject:](v6, "addObject:", v10);

  while (1)
  {
    while (1)
    {

      if (!-[NSMutableArray count](v6, "count"))
      {
        v17 = 0;
        goto LABEL_20;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v6, "lastObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enumerator"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextObject"));

      if (v8)
        break;
      -[NSMutableArray removeLastObject](v6, "removeLastObject");
    }
    if (v8 == v4)
      break;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predecessors"));
    if (objc_msgSend(v13, "count"))
    {
      v14 = [_TUITransactionPathComponent alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectEnumerator"));
      v16 = -[_TUITransactionPathComponent initWithTransaction:enumerator:](v14, "initWithTransaction:enumerator:", v8, v15);
      -[NSMutableArray addObject:](v6, "addObject:", v16);

    }
  }
  v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](v6, "count"));
  objc_msgSend(v18, "addObject:", v4);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](v6, "reverseObjectEnumerator", 0));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "transaction"));

        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "transaction"));
          objc_msgSend(v18, "addObject:", v26);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v21);
  }

  objc_msgSend(v18, "addObject:", v4);
  v17 = objc_msgSend(v18, "copy");

LABEL_20:
  objc_autoreleasePoolPop(v5);

  return v17;
}

- (void)_addDependentOn:(id)a3
{
  _TUITransaction *v4;
  _TUITransaction *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSHashTable *dependees;
  NSHashTable *v11;
  NSHashTable *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  _TUITransaction *v16;
  __int16 v17;
  _TUITransaction *v18;

  v4 = (_TUITransaction *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUITransaction _isDependentOn:](v4, "_isDependentOn:", self));
    v7 = TUITransactionLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_17D0DC((uint64_t)self, (uint64_t)v5, v9);

      objc_msgSend(v6, "enumerateObjectsUsingBlock:", &stru_23D910);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <--> %@"), self, v5));
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("TemplateUI.CyclicTransactionDependency"), v13, 0));

      objc_exception_throw(v14);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "adding dependency: %{public}@ <-- %{public}@", buf, 0x16u);
    }

    os_unfair_lock_lock(&self->_stateLock);
    dependees = self->_dependees;
    if (!dependees)
    {
      v11 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
      v12 = self->_dependees;
      self->_dependees = v11;

      dependees = self->_dependees;
    }
    -[NSHashTable addObject:](dependees, "addObject:", v5);
    os_unfair_lock_unlock(&self->_stateLock);
  }

}

- (void)dependentOn:(id)a3
{
  if (a3)
    -[_TUITransaction _addDependentOn:](self, "_addDependentOn:");
}

- (id)predecessors
{
  return -[NSHashTable setRepresentation](self->_dependees, "setRepresentation");
}

- (void)addSubTransactionCompletionDeferral
{
  dispatch_group_enter((dispatch_group_t)self->_subTransactionCompletionGroup);
}

- (void)removeSubTransactionCompletionDeferral
{
  dispatch_group_leave((dispatch_group_t)self->_subTransactionCompletionGroup);
}

- (void)addSubTransaction:(id)a3 completionQueue:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if ((self->_flags & 1) != 0)
      objc_msgSend(v6, "setFlags:", (unint64_t)objc_msgSend(v6, "flags") | 1);
    objc_msgSend(v6, "setFlags:", (unint64_t)objc_msgSend(v6, "flags") | 2);
    dispatch_group_enter((dispatch_group_t)self->_subTransactionCompletionGroup);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_17170;
    v9[3] = &unk_23D938;
    v9[4] = self;
    objc_msgSend(v6, "addSubTransactionCompletion:queue:", v9, v7);
    dispatch_group_enter((dispatch_group_t)self->_notifyAppliedGroup);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1717C;
    v8[3] = &unk_23D938;
    v8[4] = self;
    objc_msgSend(v6, "notifyWhenAppliedWithBlock:", v8);
  }

}

- (void)addSubTransactionCompletion:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  OS_dispatch_group *subTransactionCompletionGroup;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = v6;
  if (v6 && a4)
  {
    subTransactionCompletionGroup = self->_subTransactionCompletionGroup;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1721C;
    v9[3] = &unk_23D960;
    v10 = v6;
    TUIDispatchGroupNotifyViaRunloopIfMain(subTransactionCompletionGroup, a4, v9);

  }
}

- (void)addCategory:(id)a3
{
  id v4;
  NSMutableSet *categories;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock_with_options(&self->_stateLock, 0x10000);
    categories = self->_categories;
    if (!categories)
    {
      v6 = objc_opt_new(NSMutableSet);
      v7 = self->_categories;
      self->_categories = v6;

      categories = self->_categories;
    }
    -[NSMutableSet addObject:](categories, "addObject:", v8);
    os_unfair_lock_unlock(&self->_stateLock);
    v4 = v8;
  }

}

- (NSArray)allCategories
{
  return (NSArray *)-[NSMutableSet allObjects](self->_categories, "allObjects");
}

- (void)addNotifyWhenAppliedDeferral
{
  dispatch_group_enter((dispatch_group_t)self->_notifyAppliedGroup);
}

- (void)removeNotifyWhenAppliedDeferral
{
  dispatch_group_leave((dispatch_group_t)self->_notifyAppliedGroup);
}

- (void)notifyWhenAppliedWithBlock:(id)a3
{
  TUIDispatchGroupNotifyViaRunloopIfMain(self->_notifyAppliedGroup, &_dispatch_main_q, a3);
}

- (void)commit
{
  os_unfair_lock_s *p_stateLock;
  char state;
  NSMutableArray *v5;
  NSMutableArray *commitBlocks;
  OS_dispatch_group *subTransactionCompletionGroup;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options(&self->_stateLock, 0x10000);
  state = (char)self->_state;
  *(_BYTE *)&self->_state = state | 1;
  v5 = self->_commitBlocks;
  commitBlocks = self->_commitBlocks;
  self->_commitBlocks = 0;

  os_unfair_lock_unlock(p_stateLock);
  if ((state & 1) == 0)
  {
    subTransactionCompletionGroup = self->_subTransactionCompletionGroup;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_17440;
    v17[3] = &unk_23D938;
    v17[4] = self;
    TUIDispatchGroupNotifyViaRunloopIfMain(subTransactionCompletionGroup, &_dispatch_main_q, v17);
    if (v5)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = v5;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v10);
      }

    }
  }

}

- (BOOL)isCommitted
{
  _TUITransaction *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options(&self->_stateLock, 0x10000);
  LOBYTE(v2) = *(_BYTE *)&v2->_state & 1;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isCommittedAndIfNotNotifyWithBlock:(id)a3
{
  id v4;
  os_unfair_lock_s *p_stateLock;
  char state;
  NSMutableArray *commitBlocks;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;
  id v11;

  v4 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options(&self->_stateLock, 0x10000);
  state = (char)self->_state;
  if ((state & 1) == 0)
  {
    commitBlocks = self->_commitBlocks;
    if (!commitBlocks)
    {
      v8 = objc_opt_new(NSMutableArray);
      v9 = self->_commitBlocks;
      self->_commitBlocks = v8;

      commitBlocks = self->_commitBlocks;
    }
    v10 = objc_msgSend(v4, "copy");
    v11 = objc_retainBlock(v10);
    -[NSMutableArray addObject:](commitBlocks, "addObject:", v11);

  }
  os_unfair_lock_unlock(p_stateLock);

  return state & 1;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (TUITransactionOptions)options
{
  return self->_options;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSHashTable)dependees
{
  return self->_dependees;
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (OS_dispatch_group)subTransactionCompletionGroup
{
  return self->_subTransactionCompletionGroup;
}

- (OS_dispatch_group)notifyAppliedGroup
{
  return self->_notifyAppliedGroup;
}

- (NSMutableArray)commitBlocks
{
  return self->_commitBlocks;
}

- (NSMutableSet)categories
{
  return self->_categories;
}

- (NSArray)callstack
{
  return self->_callstack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callstack, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_commitBlocks, 0);
  objc_storeStrong((id *)&self->_notifyAppliedGroup, 0);
  objc_storeStrong((id *)&self->_subTransactionCompletionGroup, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_dependees, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end

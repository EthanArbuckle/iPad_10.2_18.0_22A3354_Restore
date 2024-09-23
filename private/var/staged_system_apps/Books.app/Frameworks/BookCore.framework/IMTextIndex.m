@implementation IMTextIndex

+ (void)initialize
{
  id v3;

  if ((id)objc_opt_class(IMTextIndex) == a1)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, "_lowMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
}

+ (void)_lowMemoryWarning:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend((id)qword_311220, "removeAllObjects");
  objc_sync_exit(v4);

}

+ (id)textIndexWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_311220, "objectForKey:", v4));
  objc_sync_exit(v5);

  return v6;
}

+ (void)addTextIndex:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    v7 = a1;
    objc_sync_enter(v7);
    v8 = (void *)qword_311220;
    if (!qword_311220)
    {
      v9 = objc_alloc_init((Class)NSMutableDictionary);
      v10 = (void *)qword_311220;
      qword_311220 = (uint64_t)v9;

      v8 = (void *)qword_311220;
    }
    objc_msgSend(v8, "setObject:forKey:", v11, v6);
    objc_sync_exit(v7);

  }
  else
  {
    NSLog(CFSTR("Warning : Missing parameters in %s (%@, %@)"), "+[IMTextIndex addTextIndex:withName:]", v11, v6);
  }

}

+ (void)removeTextIndexWithName:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = a1;
    objc_sync_enter(v5);
    objc_msgSend((id)qword_311220, "removeObjectForKey:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (IMTextIndex)initWithCaseRule:(int)a3
{
  IMTextIndex *v4;
  IMTextIndex *v5;
  IMLibraryFragmentFilter *v6;
  IMLibraryFragmentFilter *library;
  NSRecursiveLock *v8;
  NSRecursiveLock *indexingDispatchGroupLock;
  __int128 v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMTextIndex;
  v4 = -[IMTextIndex init](&v13, "init");
  v5 = v4;
  if (v4)
  {
    v4->_caseRule = a3;
    v11 = xmmword_26A740;
    v12 = 4;
    v6 = -[IMLibraryFragmentFilter initWithFilterSpecification:]([IMLibraryFragmentFilter alloc], "initWithFilterSpecification:", &v11);
    library = v5->_library;
    v5->_library = v6;

    v8 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    indexingDispatchGroupLock = v5->_indexingDispatchGroupLock;
    v5->_indexingDispatchGroupLock = v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  IMTextIndex *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeInt:forKey:", v4->_caseRule, CFSTR("caseRule"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_library, CFSTR("library"));
  objc_sync_exit(v4);

}

- (IMTextIndex)initWithCoder:(id)a3
{
  id v4;
  IMTextIndex *v5;
  id v6;
  uint64_t v7;
  IMLibraryFragmentFilter *library;
  NSRecursiveLock *v9;
  NSRecursiveLock *indexingDispatchGroupLock;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMTextIndex;
  v5 = -[IMTextIndex init](&v12, "init");
  if (v5)
  {
    v5->_caseRule = objc_msgSend(v4, "decodeIntForKey:", CFSTR("caseRule"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(IMLibraryFragmentFilter), CFSTR("library"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    library = v5->_library;
    v5->_library = (IMLibraryFragmentFilter *)v7;

    v9 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    indexingDispatchGroupLock = v5->_indexingDispatchGroupLock;
    v5->_indexingDispatchGroupLock = v9;

  }
  return v5;
}

- (void)_waitAndCleanupDispatchGroup
{
  NSObject *indexingDispatchGroup;
  OS_dispatch_group *v4;

  -[NSRecursiveLock lock](self->_indexingDispatchGroupLock, "lock");
  indexingDispatchGroup = self->_indexingDispatchGroup;
  if (indexingDispatchGroup)
  {
    dispatch_group_wait(indexingDispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
    v4 = self->_indexingDispatchGroup;
    self->_indexingDispatchGroup = 0;

  }
  -[NSRecursiveLock unlock](self->_indexingDispatchGroupLock, "unlock");
}

- (id)_indexingDispatchGroup
{
  OS_dispatch_group *indexingDispatchGroup;
  OS_dispatch_group *v4;
  OS_dispatch_group *v5;
  OS_dispatch_group *v6;

  -[NSRecursiveLock lock](self->_indexingDispatchGroupLock, "lock");
  indexingDispatchGroup = self->_indexingDispatchGroup;
  if (!indexingDispatchGroup)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    v5 = self->_indexingDispatchGroup;
    self->_indexingDispatchGroup = v4;

    indexingDispatchGroup = self->_indexingDispatchGroup;
  }
  v6 = indexingDispatchGroup;
  -[NSRecursiveLock unlock](self->_indexingDispatchGroupLock, "unlock");
  return v6;
}

- (void)_indexDispatchGroupDispatchToQueue:(id)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;

  queue = a3;
  v6 = a4;
  -[NSRecursiveLock lock](self->_indexingDispatchGroupLock, "lock");
  v7 = objc_claimAutoreleasedReturnValue(-[IMTextIndex _indexingDispatchGroup](self, "_indexingDispatchGroup"));
  dispatch_group_async(v7, queue, v6);

  -[NSRecursiveLock unlock](self->_indexingDispatchGroupLock, "unlock");
}

- (void)indexTextUnit:(id)a3 withIdentifier:(id)a4 indexSynchronously:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  IMTextIndex *v10;
  id v11;
  void *v12;
  uint64_t v13;
  dispatch_queue_global_t global_queue;
  _QWORD v15[5];
  id v16;
  id v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  if (v5)
  {
    v11 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByConvertingNewlineCharacterSetToSpace"));

    if (v10->_caseRule == 1)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));

      v12 = (void *)v13;
    }
    -[IMLibraryFragmentFilter addDocument:withIdentifier:](v10->_library, "addDocument:withIdentifier:", v12, v9);
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10403C;
    v15[3] = &unk_28C5F0;
    v15[4] = v10;
    v16 = v8;
    v17 = v9;
    -[IMTextIndex _indexDispatchGroupDispatchToQueue:block:](v10, "_indexDispatchGroupDispatchToQueue:block:", v12, v15);

  }
  objc_sync_exit(v10);

}

- (void)indexTextUnit:(id)a3 withIdentifier:(id)a4
{
  -[IMTextIndex indexTextUnit:withIdentifier:indexSynchronously:](self, "indexTextUnit:withIdentifier:indexSynchronously:", a3, a4, 0);
}

- (BOOL)containsTextUnitWithIdentifier:(id)a3
{
  id v4;
  IMTextIndex *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[IMLibraryFragmentFilter containsDocumentWithIdentifier:](v5->_library, "containsDocumentWithIdentifier:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (unint64_t)textUnitCount
{
  IMTextIndex *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[IMLibraryFragmentFilter documentCount](v2->_library, "documentCount");
  objc_sync_exit(v2);

  return v3;
}

- (id)allIdentifiers
{
  IMTextIndex *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMLibraryFragmentFilter allIdentifiers](v2->_library, "allIdentifiers"));
  objc_sync_exit(v2);

  return v3;
}

- (id)_candidateIdentifiersForStringQueries:(id)a3
{
  id v4;
  IMTextIndex *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_alloc_init((Class)NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMLibraryFragmentFilter candidateIdentifiersForQuery:](v5->_library, "candidateIdentifiersForQuery:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        objc_msgSend(v6, "unionSet:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_sync_exit(v5);
  return v6;
}

- (id)candidateIdentifiersForStringQuery:(id)a3
{
  id v4;
  IMTextIndex *v5;
  int caseRule;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  caseRule = v5->_caseRule;
  if (caseRule)
  {
    if (caseRule == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTextIndex _candidateIdentifiersForStringQueries:](v5, "_candidateIdentifiersForStringQueries:", v8));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "capitalizedString"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v10, v4, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTextIndex _candidateIdentifiersForStringQueries:](v5, "_candidateIdentifiersForStringQueries:", v11));

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTextIndex _candidateIdentifiersForStringQueries:](v5, "_candidateIdentifiersForStringQueries:", v7));
  }

  objc_sync_exit(v5);
  return v9;
}

- (BOOL)isEmpty
{
  IMTextIndex *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMLibraryFragmentFilter allIdentifiers](v2->_library, "allIdentifiers"));
  v4 = objc_msgSend(v3, "count") == 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)dealloc
{
  NSRecursiveLock *indexingDispatchGroupLock;
  IMLibraryFragmentFilter *library;
  objc_super v5;

  -[IMTextIndex _waitAndCleanupDispatchGroup](self, "_waitAndCleanupDispatchGroup");
  indexingDispatchGroupLock = self->_indexingDispatchGroupLock;
  self->_indexingDispatchGroupLock = 0;

  library = self->_library;
  self->_library = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMTextIndex;
  -[IMTextIndex dealloc](&v5, "dealloc");
}

- (int)caseRule
{
  return self->_caseRule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingDispatchGroupLock, 0);
  objc_storeStrong((id *)&self->_indexingDispatchGroup, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end

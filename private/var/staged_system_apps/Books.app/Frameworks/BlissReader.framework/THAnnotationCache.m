@implementation THAnnotationCache

- (THAnnotationCache)initWithAnnotationsByStorage:(id)a3 bookmarkAnnotations:(id)a4 orphanedAnnotations:(id)a5 needsMigration:(BOOL)a6 temporaryAnnotation:(id)a7 contentNode:(id)a8
{
  THAnnotationCache *v14;
  THAnnotationCache *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v26.receiver = self;
  v26.super_class = (Class)THAnnotationCache;
  v14 = -[THAnnotationCache init](&v26, "init");
  v15 = v14;
  if (v14)
  {
    v14->_contentNode = (THModelContentNode *)a8;
    v14->_annotationsByStorage = (NSDictionary *)objc_msgSend(a3, "copy");
    v15->_bookmarkAnnotations = (NSArray *)objc_msgSend(a4, "copy");
    v15->_orphanedAnnotations = (NSArray *)objc_msgSend(a5, "copy");
    v15->_temporaryAnnotation = (THAnnotation *)a7;
    v15->_bookmarkAbsolutePhysicalPageIndexSet = (NSIndexSet *)-[THAnnotationCache p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:](v15, "p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:", v15->_bookmarkAnnotations);
    v15->_needsMigration = a6;
    v15->_numberOfHighlightAnnotations = 0;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = objc_msgSend(a3, "objectEnumerator", 0);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v15->_numberOfHighlightAnnotations += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "count");
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v18);
    }
    v15->_numberOfBookmarkAnnotations = -[NSArray count](v15->_bookmarkAnnotations, "count");
    v15->_numberOfOrphanedAnnotations = -[NSArray count](v15->_orphanedAnnotations, "count");
  }
  __dmb(0xBu);
  return v15;
}

- (THAnnotationCache)initWithAnnotations:(id)a3 contentNode:(id)a4
{
  return -[THAnnotationCache initWithAnnotations:contentNode:needsMigration:](self, "initWithAnnotations:contentNode:needsMigration:", a3, a4, 0);
}

- (THAnnotationCache)initWithAnnotations:(id)a3 contentNode:(id)a4 needsMigration:(BOOL)a5
{
  THAnnotationCache *v8;
  THAnnotationCache *v9;
  id v10;
  unint64_t *p_numberOfBookmarkAnnotations;
  unint64_t *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  unint64_t *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  id v26;
  THAnnotationCache *v28;
  unint64_t *v29;
  unint64_t *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v41.receiver = self;
  v41.super_class = (Class)THAnnotationCache;
  v8 = -[THAnnotationCache init](&v41, "init");
  v9 = v8;
  if (!v8)
    return v9;
  v8->_contentNode = (THModelContentNode *)a4;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(a3, "count"));
  v31 = objc_alloc_init((Class)NSMutableArray);
  v32 = objc_alloc_init((Class)NSMutableArray);
  v28 = v9;
  v9->_numberOfBookmarkAnnotations = 0;
  p_numberOfBookmarkAnnotations = &v9->_numberOfBookmarkAnnotations;
  *(p_numberOfBookmarkAnnotations - 1) = 0;
  v29 = p_numberOfBookmarkAnnotations - 1;
  v30 = p_numberOfBookmarkAnnotations;
  p_numberOfBookmarkAnnotations[1] = 0;
  v12 = p_numberOfBookmarkAnnotations + 1;
  *((_BYTE *)p_numberOfBookmarkAnnotations - 16) = a5;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (!v13)
    goto LABEL_15;
  v14 = v13;
  v15 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v38 != v15)
        objc_enumerationMutation(a3);
      v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
      v18 = v32;
      v19 = v12;
      if ((objc_msgSend(v17, "annotationIsOrphan") & 1) == 0)
      {
        v19 = v30;
        v18 = v31;
        if ((objc_msgSend(v17, "annotationIsBookmark") & 1) == 0)
        {
          if (objc_msgSend(v17, "annotationType") != 2)
            continue;
          v20 = objc_msgSend(v17, "annotationStorageUID");
          v18 = objc_msgSend(v10, "objectForKey:", v20);
          v19 = v29;
          if (!v18)
          {
            v18 = +[NSMutableArray array](NSMutableArray, "array");
            objc_msgSend(v10, "setObject:forKey:", v18, v20);
            v19 = v29;
          }
        }
      }
      objc_msgSend(v18, "addObject:", v17);
      ++*v19;
    }
    v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  }
  while (v14);
LABEL_15:
  v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v10, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v10);
        objc_msgSend(v21, "setObject:forKey:", objc_msgSend(objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j)), "sortedArrayWithOptions:usingComparator:", 1, &stru_42ABE0), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j));
      }
      v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v23);
  }
  v26 = objc_msgSend(v31, "sortedArrayWithOptions:usingComparator:", 1, &stru_42AC00);
  v9 = v28;
  v28->_annotationsByStorage = (NSDictionary *)objc_msgSend(v21, "copy");
  v28->_bookmarkAnnotations = (NSArray *)objc_msgSend(v26, "copy");
  v28->_orphanedAnnotations = (NSArray *)objc_msgSend(v32, "copy");
  v28->_bookmarkAbsolutePhysicalPageIndexSet = (NSIndexSet *)-[THAnnotationCache p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:](v28, "p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:", v28->_bookmarkAnnotations);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAnnotationCache;
  -[THAnnotationCache dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p annotationsByStorage=%@>"), NSStringFromClass(v3), self, self->_annotationsByStorage);
}

- (id)p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:(id)a3
{
  id result;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  result = objc_msgSend(a3, "count");
  if (result)
  {
    v5 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "annotationAbsolutePhysicalPageIndex");
          if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addIndex:", v10);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    return objc_msgSend(v5, "copy");
  }
  return result;
}

- (id)bookmarkForAbsolutePhysicalPageIndex:(unint64_t)a3
{
  NSArray *bookmarkAnnotations;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  bookmarkAnnotations = self->_bookmarkAnnotations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](bookmarkAnnotations, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(bookmarkAnnotations);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "annotationAbsolutePhysicalPageIndex") == (id)a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](bookmarkAnnotations, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)hasAnnotationWithNoteInAbsolutePhysicalPageIndex:(unint64_t)a3
{
  NSEnumerator *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = -[NSDictionary objectEnumerator](self->_annotationsByStorage, "objectEnumerator");
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v14, "annotationAbsolutePhysicalPageIndex") == (id)a3
                && objc_msgSend(objc_msgSend(v14, "annotationNote"), "length"))
              {
                LOBYTE(v5) = 1;
                return (char)v5;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v11)
              continue;
            break;
          }
        }
      }
      v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return (char)v5;
}

- (BOOL)hasAnnotationWithNoteOnPageInfo:(id)a3
{
  id v4;
  id v5;
  NSUInteger v7;
  NSUInteger v8;
  NSEnumerator *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  NSUInteger v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  NSRange v33;
  NSRange v34;

  v4 = objc_msgSend(a3, "bodyStorageRange");
  if (NSInvalidRange[0] == v4 && NSInvalidRange[1] == v5)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache hasAnnotationWithNoteOnPageInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 356, CFSTR("Invalid range."));
    LOBYTE(v10) = 0;
  }
  else
  {
    v7 = (NSUInteger)v4;
    v8 = (NSUInteger)v5;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = -[NSDictionary objectEnumerator](self->_annotationsByStorage, "objectEnumerator");
    v10 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(_QWORD *)v24 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
                v34.location = (NSUInteger)objc_msgSend(v19, "annotationStorageRange");
                v34.length = v20;
                v33.location = v7;
                v33.length = v8;
                if (NSIntersectionRange(v33, v34).length && objc_msgSend(objc_msgSend(v19, "annotationNote"), "length"))
                {
                  LOBYTE(v10) = 1;
                  return (char)v10;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v16)
                continue;
              break;
            }
          }
          v12 = v22;
        }
        v11 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        LOBYTE(v10) = 0;
      }
      while (v11);
    }
  }
  return (char)v10;
}

- (id)annotationsForStorageUID:(id)a3
{
  if (a3)
    return -[NSDictionary objectForKey:](self->_annotationsByStorage, "objectForKey:");
  else
    return 0;
}

- (id)annotationsForStorage:(id)a3
{
  id result;

  result = -[THModelContentNode annotationIDForInfo:](self->_contentNode, "annotationIDForInfo:", a3);
  if (result)
    return -[NSDictionary objectForKey:](self->_annotationsByStorage, "objectForKey:", result);
  return result;
}

- (id)annotationsForStorage:(id)a3 range:(_NSRange)a4
{
  _QWORD v5[4];
  _NSRange v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1A2654;
  v5[3] = &unk_429C38;
  v6 = a4;
  return objc_msgSend(-[THAnnotationCache annotationsForStorage:](self, "annotationsForStorage:", a3), "tsu_arrayOfObjectsPassingTest:", v5);
}

- (id)annotationWithUUID:(id)a3
{
  int64_t *p_annotationsByUUIDOnceToken;
  int64_t annotationsByUUIDOnceToken;
  _QWORD block[5];

  annotationsByUUIDOnceToken = self->_annotationsByUUIDOnceToken;
  p_annotationsByUUIDOnceToken = &self->_annotationsByUUIDOnceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1A2720;
  block[3] = &unk_426DD0;
  block[4] = self;
  if (annotationsByUUIDOnceToken == -1)
  {
    if (a3)
      return -[NSDictionary objectForKey:](self->_annotationsByUUID, "objectForKey:", a3);
  }
  else
  {
    dispatch_once(p_annotationsByUUIDOnceToken, block);
    if (a3)
      return -[NSDictionary objectForKey:](self->_annotationsByUUID, "objectForKey:", a3);
  }
  return 0;
}

- (id)newAnnotationCacheWithUpdatedAnnotation:(id)a3
{
  id v5;
  NSArray *orphanedAnnotations;
  THAnnotationCache *v7;
  NSDictionary *annotationsByStorage;
  NSArray *bookmarkAnnotations;
  id v10;
  id v11;
  THAnnotationCache *v12;

  v5 = objc_msgSend(a3, "annotationStorageUID");
  if (objc_msgSend(a3, "annotationIsOrphan"))
  {
    orphanedAnnotations = (NSArray *)-[NSArray mutableCopy](self->_orphanedAnnotations, "mutableCopy");
    -[NSArray addObject:](orphanedAnnotations, "addObject:", a3);
    v7 = [THAnnotationCache alloc];
    annotationsByStorage = self->_annotationsByStorage;
    bookmarkAnnotations = self->_bookmarkAnnotations;
    v10 = orphanedAnnotations;
    goto LABEL_12;
  }
  if (!objc_msgSend(a3, "annotationIsBookmark"))
  {
    if (objc_msgSend(a3, "annotationIsPlaceholder"))
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithUpdatedAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 485, CFSTR("annotation cache doesn't support placeholder annotations"));
    }
    else if (v5)
    {
      annotationsByStorage = (NSDictionary *)-[NSDictionary mutableCopy](self->_annotationsByStorage, "mutableCopy");
      -[THAnnotationCache p_updateAnnotationsByStorage:byAddingAnnotation:storageUUID:](self, "p_updateAnnotationsByStorage:byAddingAnnotation:storageUUID:", annotationsByStorage, a3, v5);
      v7 = [THAnnotationCache alloc];
      bookmarkAnnotations = self->_bookmarkAnnotations;
      orphanedAnnotations = self->_orphanedAnnotations;
      v10 = annotationsByStorage;
      goto LABEL_12;
    }
LABEL_13:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithUpdatedAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 503, CFSTR("failed to update annotation cache"));
    return 0;
  }
  v10 = -[NSArray mutableCopy](self->_bookmarkAnnotations, "mutableCopy");
  v11 = objc_msgSend(v10, "indexOfObject:", a3);
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "addObject:", a3);
  else
    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v11, a3);
  bookmarkAnnotations = (NSArray *)objc_msgSend(v10, "sortedArrayWithOptions:usingComparator:", 1, &stru_42AC20);
  v7 = [THAnnotationCache alloc];
  annotationsByStorage = self->_annotationsByStorage;
  orphanedAnnotations = self->_orphanedAnnotations;
LABEL_12:
  v12 = -[THAnnotationCache initWithAnnotationsByStorage:bookmarkAnnotations:orphanedAnnotations:needsMigration:temporaryAnnotation:contentNode:](v7, "initWithAnnotationsByStorage:bookmarkAnnotations:orphanedAnnotations:needsMigration:temporaryAnnotation:contentNode:", annotationsByStorage, bookmarkAnnotations, orphanedAnnotations, self->_needsMigration, self->_temporaryAnnotation, self->_contentNode);

  if (!v12)
    goto LABEL_13;
  return v12;
}

- (id)newAnnotationCacheWithRemovedAnnotation:(id)a3
{
  id v5;
  NSArray *orphanedAnnotations;
  id v7;
  id v8;
  id v9;
  THAnnotationCache *v10;
  NSDictionary *annotationsByStorage;
  NSArray *bookmarkAnnotations;
  THAnnotationCache *v13;

  v5 = objc_msgSend(a3, "annotationStorageUID");
  if (objc_msgSend(a3, "annotationIsOrphan"))
  {
    orphanedAnnotations = (NSArray *)-[NSArray mutableCopy](self->_orphanedAnnotations, "mutableCopy");
    v7 = -[NSArray indexOfObject:](orphanedAnnotations, "indexOfObject:", a3);
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 523, CFSTR("orphan annotation not found"));
    else
      -[NSArray removeObjectAtIndex:](orphanedAnnotations, "removeObjectAtIndex:", v7);
    v10 = [THAnnotationCache alloc];
    annotationsByStorage = self->_annotationsByStorage;
    bookmarkAnnotations = self->_bookmarkAnnotations;
    v8 = orphanedAnnotations;
  }
  else
  {
    if (!objc_msgSend(a3, "annotationIsBookmark"))
    {
      if (objc_msgSend(a3, "annotationIsPlaceholder"))
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 563, CFSTR("annotation cache doesn't support placeholder annotations"));
      }
      else if (v5)
      {
        annotationsByStorage = (NSDictionary *)-[NSDictionary mutableCopy](self->_annotationsByStorage, "mutableCopy");
        -[THAnnotationCache p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:](self, "p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:", annotationsByStorage, a3, v5);
        v10 = [THAnnotationCache alloc];
        bookmarkAnnotations = self->_bookmarkAnnotations;
        orphanedAnnotations = self->_orphanedAnnotations;
        v8 = annotationsByStorage;
        goto LABEL_15;
      }
LABEL_16:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 581, CFSTR("failed to update annotation cache"));
      return 0;
    }
    v8 = -[NSArray mutableCopy](self->_bookmarkAnnotations, "mutableCopy");
    v9 = objc_msgSend(v8, "indexOfObject:", a3);
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 545, CFSTR("annotation not found"));
    else
      objc_msgSend(v8, "removeObjectAtIndex:", v9);
    bookmarkAnnotations = (NSArray *)objc_msgSend(v8, "sortedArrayWithOptions:usingComparator:", 1, &stru_42AC40);
    v10 = [THAnnotationCache alloc];
    annotationsByStorage = self->_annotationsByStorage;
    orphanedAnnotations = self->_orphanedAnnotations;
  }
LABEL_15:
  v13 = -[THAnnotationCache initWithAnnotationsByStorage:bookmarkAnnotations:orphanedAnnotations:needsMigration:temporaryAnnotation:contentNode:](v10, "initWithAnnotationsByStorage:bookmarkAnnotations:orphanedAnnotations:needsMigration:temporaryAnnotation:contentNode:", annotationsByStorage, bookmarkAnnotations, orphanedAnnotations, self->_needsMigration, self->_temporaryAnnotation, self->_contentNode);

  if (!v13)
    goto LABEL_16;
  return v13;
}

- (void)p_updateAnnotationsByStorage:(id)a3 byAddingAnnotation:(id)a4 storageUUID:(id)a5
{
  NSArray *v8;
  id v9;
  id v10;

  v8 = (NSArray *)objc_msgSend(a3, "objectForKey:", a5);
  if (!v8)
    v8 = +[NSArray array](NSArray, "array");
  v10 = -[NSArray mutableCopy](v8, "mutableCopy");
  v9 = objc_msgSend(v10, "indexOfObject:", a4);
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "addObject:", a4);
  else
    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, a4);
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v10, "sortedArrayWithOptions:usingComparator:", 1, &stru_42AC60), a5);

}

- (void)p_updateAnnotationsByStorage:(id)a3 byRemovingAnnotation:(id)a4 storageUUID:(id)a5
{
  NSArray *v8;
  id v9;
  id v10;

  v8 = (NSArray *)objc_msgSend(a3, "objectForKey:", a5);
  if (!v8)
    v8 = +[NSArray array](NSArray, "array");
  v10 = -[NSArray mutableCopy](v8, "mutableCopy");
  v9 = objc_msgSend(v10, "indexOfObject:", a4);
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 626, CFSTR("could not find annotation for removal: %@"), a4);
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"), 633, CFSTR("annotation not found"));
  }
  else
  {
    objc_msgSend(v10, "removeObjectAtIndex:", v9);
  }
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v10, "sortedArrayWithOptions:usingComparator:", 1, &stru_42AC80), a5);

}

- (id)newAnnotationCacheWithTemporaryAnnotation:(id)a3
{
  id v4;
  THAnnotation *temporaryAnnotation;
  THAnnotationCache *v6;

  if (-[THAnnotationCache temporaryAnnotation](self, "temporaryAnnotation") == a3)
    return self;
  v4 = -[NSDictionary mutableCopy](self->_annotationsByStorage, "mutableCopy");
  temporaryAnnotation = self->_temporaryAnnotation;
  if (temporaryAnnotation)
    -[THAnnotationCache p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:](self, "p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:", v4, temporaryAnnotation, -[THAnnotation annotationStorageUID](self->_temporaryAnnotation, "annotationStorageUID"));
  if (a3)
    -[THAnnotationCache p_updateAnnotationsByStorage:byAddingAnnotation:storageUUID:](self, "p_updateAnnotationsByStorage:byAddingAnnotation:storageUUID:", v4, a3, objc_msgSend(a3, "annotationStorageUID"));
  v6 = -[THAnnotationCache initWithAnnotationsByStorage:bookmarkAnnotations:orphanedAnnotations:needsMigration:temporaryAnnotation:contentNode:]([THAnnotationCache alloc], "initWithAnnotationsByStorage:bookmarkAnnotations:orphanedAnnotations:needsMigration:temporaryAnnotation:contentNode:", v4, self->_bookmarkAnnotations, self->_orphanedAnnotations, self->_needsMigration, a3, self->_contentNode);

  return v6;
}

- (_NSRange)differenceRangeWithCache:(id)a3 storageUID:(id)a4
{
  id v6;
  id v7;
  char *v8;
  char *v9;
  NSRange v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  NSUInteger length;
  uint64_t v28;
  NSUInteger location;
  int v30;
  NSUInteger v31;
  id v32;
  NSUInteger v33;
  NSRange v34;
  NSUInteger v35;
  NSRange v36;
  id v37;
  NSUInteger v38;
  NSRange v39;
  NSUInteger v40;
  NSUInteger v41;
  NSRange v42;
  uint64_t v43;
  char *v44;
  unsigned int v45;
  BOOL v46;
  int v47;
  char v48;
  BOOL v50;
  void *v51;
  NSRange v52;
  NSRange v53;
  NSRange v54;
  _NSRange result;
  NSRange v56;

  v6 = -[THAnnotationCache annotationsForStorageUID:](self, "annotationsForStorageUID:", a4);
  v7 = objc_msgSend(a3, "annotationsForStorageUID:", a4);
  v8 = (char *)objc_msgSend(v6, "count");
  v51 = v7;
  v9 = (char *)objc_msgSend(v7, "count");
  v11 = v9;
  if (!v8)
  {
    v12 = 0;
    if (v9)
      goto LABEL_3;
LABEL_29:
    v14 = 0;
    v18 = 0;
    v15 = 1;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_31;
  }
  v12 = objc_msgSend(v6, "objectAtIndex:", 0);
  if (!v11)
    goto LABEL_29;
LABEL_3:
  v13 = objc_msgSend(v7, "objectAtIndex:", 0);
  v14 = 0;
  v15 = 1;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
  {
    v17 = v13;
    v18 = 0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v20 = 1;
    v21 = 1;
    if (v13)
    {
      v18 = 0;
      v14 = 0;
      do
      {
        if (sub_1A36E0(v12, v17))
        {
          if (++v14 >= (unint64_t)v8)
            v12 = 0;
          else
            v12 = objc_msgSend(v6, "objectAtIndex:", v14);
          if (++v18 >= (unint64_t)v11)
            v17 = 0;
          else
            v17 = objc_msgSend(v7, "objectAtIndex:", v18);
          v16 = 0x7FFFFFFFFFFFFFFFLL;
          v19 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v16 = v18;
          v19 = v14;
        }
        v15 = v19 == 0x7FFFFFFFFFFFFFFFLL;
        v20 = v16 == 0x7FFFFFFFFFFFFFFFLL;
        v21 = v16 == 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL;
      }
      while (v21 && v12 != 0 && v17 != 0);
    }
    if (!v21)
      goto LABEL_34;
    goto LABEL_32;
  }
  v18 = 0;
LABEL_31:
  v19 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = 1;
LABEL_32:
  if (v8 == v11)
  {
    v24 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_62;
  }
LABEL_34:
  if (v8 <= v11)
    v15 = 0;
  if (v15)
  {
    v26 = (uint64_t)(v8 - 1);
    v19 = v14;
  }
  else
  {
    if (!v20)
    {
      location = 0x7FFFFFFFFFFFFFFFLL;
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        length = 0;
        v28 = 0x7FFFFFFFFFFFFFFFLL;
        v18 = v16;
        goto LABEL_55;
      }
      v30 = 1;
      v28 = 0x7FFFFFFFFFFFFFFFLL;
      if (v8 && v11)
      {
        v43 = (uint64_t)(v11 - 1);
        v44 = v8 - 1;
        do
        {
          v45 = sub_1A36E0(objc_msgSend(v6, "objectAtIndex:", v44), objc_msgSend(v51, "objectAtIndex:", v43));
          if (v45)
            v26 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v26 = (uint64_t)v44;
          if (v45)
            v28 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v28 = v43;
          v46 = v44-- != 0;
          v47 = v46;
          v46 = v43-- != 0;
          v48 = v46;
          v50 = v26 != 0x7FFFFFFFFFFFFFFFLL || v28 != 0x7FFFFFFFFFFFFFFFLL || v47 == 0;
        }
        while (!v50 && (v48 & 1) != 0);
      }
      else
      {
        v26 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_45;
    }
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 > v8)
    {
      length = 0;
      v24 = 0;
      v28 = (uint64_t)(v11 - 1);
      location = 0x7FFFFFFFFFFFFFFFLL;
      v25 = 0x7FFFFFFFFFFFFFFFLL;
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_58;
      goto LABEL_55;
    }
  }
  v30 = 0;
  v28 = 0x7FFFFFFFFFFFFFFFLL;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    length = 0;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
  v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_45:
  location = (NSUInteger)objc_msgSend(objc_msgSend(v6, "objectAtIndex:", v19), "annotationStorageRange");
  length = v31;
  v18 = v16;
LABEL_46:
  if (v26 != 0x7FFFFFFFFFFFFFFFLL && v19 != v26)
  {
    v32 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", v26), "annotationStorageRange");
    v10.location = (NSUInteger)v32;
    v10.length = v33;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v52.location = location;
      v52.length = length;
      v34 = NSUnionRange(v52, v10);
      location = v34.location;
      length = v34.length;
      v26 = v18;
      v25 = v34.location;
      v24 = v34.length;
      if ((v30 & 1) == 0)
        goto LABEL_58;
      goto LABEL_55;
    }
    location = (NSUInteger)v32;
    length = v33;
  }
  v26 = v18;
  v25 = location;
  v24 = length;
  if (!v30)
    goto LABEL_58;
LABEL_55:
  v25 = (NSUInteger)objc_msgSend(objc_msgSend(v51, "objectAtIndex:", v18, v10.length), "annotationStorageRange");
  v24 = v35;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v53.location = location;
    v53.length = length;
    v56.location = v25;
    v56.length = v24;
    v36 = NSUnionRange(v53, v56);
    v25 = v36.location;
    v24 = v36.length;
  }
  v26 = v18;
LABEL_58:
  if (v28 != 0x7FFFFFFFFFFFFFFFLL && v26 != v28)
  {
    v37 = objc_msgSend(objc_msgSend(v51, "objectAtIndex:", v28), "annotationStorageRange");
    v39.location = (NSUInteger)v37;
    v39.length = v38;
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v54.location = v25;
      v54.length = v24;
      v42 = NSUnionRange(v54, v39);
      v41 = v42.length;
      v40 = v42.location;
      goto LABEL_89;
    }
    v25 = (NSUInteger)v37;
    v24 = v38;
  }
LABEL_62:
  v40 = v25;
  v41 = v24;
LABEL_89:
  result.length = v41;
  result.location = v40;
  return result;
}

- (void)enumerateAnnotationsForStorage:(id)a3 range:(_NSRange)a4 withBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSUInteger v15;
  NSRange v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  NSRange v22;
  NSRange v23;

  length = a4.length;
  location = a4.location;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = -[THAnnotationCache annotationsForStorage:](self, "annotationsForStorage:", a3, 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "annotationStorageRange");
      if (location + length <= (unint64_t)v14)
        break;
      v23.location = (NSUInteger)v14;
      v23.length = v15;
      v22.location = location;
      v22.length = length;
      v16 = NSIntersectionRange(v22, v23);
      if (a5)
      {
        if (v16.length)
          (*((void (**)(id, void *))a5 + 2))(a5, v13);
      }
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (BOOL)checkIfOneOrMoreAnnotationsForStorage:(id)a3 range:(_NSRange)a4 passesTest:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSUInteger v16;
  BOOL v17;
  NSRange v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  NSRange v25;
  NSRange v26;

  length = a4.length;
  location = a4.location;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = -[THAnnotationCache annotationsForStorage:](self, "annotationsForStorage:", a3, 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = *(_QWORD *)v21;
  v12 = location + length;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v21 != v11)
      objc_enumerationMutation(v8);
    v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
    v15 = objc_msgSend(v14, "annotationStorageRange");
    v17 = v12 > (unint64_t)v15;
    if (v12 <= (unint64_t)v15)
      return v17;
    v26.location = (NSUInteger)v15;
    v26.length = v16;
    v25.location = location;
    v25.length = length;
    v18 = NSIntersectionRange(v25, v26);
    if (a5)
    {
      if (v18.length && ((*((uint64_t (**)(id, void *))a5 + 2))(a5, v14) & 1) != 0)
        return v17;
    }
    if (v10 == (id)++v13)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)enumerateAnnotationsWithBlock:(id)a3
{
  NSDictionary *annotationsByStorage;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  if (a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    annotationsByStorage = self->_annotationsByStorage;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](annotationsByStorage, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(annotationsByStorage);
          v10 = -[NSDictionary objectForKey:](self->_annotationsByStorage, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i));
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }
        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](annotationsByStorage, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }
  }
}

- (id)highlightAnnotations
{
  NSMutableArray *v3;
  NSEnumerator *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", self->_numberOfHighlightAnnotations);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSDictionary objectEnumerator](self->_annotationsByStorage, "objectEnumerator", 0);
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (BOOL)storage:(id)a3 hasAnnotationWithNoteInRange:(_NSRange)a4
{
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, &stru_42ACC0);
}

- (BOOL)storage:(id)a3 hasAnnotationInRange:(_NSRange)a4
{
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, &stru_42ACE0);
}

- (BOOL)storage:(id)a3 hasAnnotationStrictlyContainingRange:(_NSRange)a4
{
  _QWORD v5[4];
  _NSRange v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1A3D48;
  v5[3] = &unk_42AD00;
  v6 = a4;
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, v5);
}

- (BOOL)storage:(id)a3 hasAnnotationWithExactRange:(_NSRange)a4
{
  _QWORD v5[4];
  _NSRange v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1A3DF0;
  v5[3] = &unk_42AD00;
  v6 = a4;
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, v5);
}

- (BOOL)storage:(id)a3 hasAnnotationThatMatchesStyle:(int)a4 inRange:(_NSRange)a5
{
  _QWORD v6[4];
  _NSRange v7;
  int v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1A3E84;
  v6[3] = &unk_42AD20;
  v7 = a5;
  v8 = a4;
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a5.location, a5.length, v6);
}

- (BOOL)storage:(id)a3 containsSomeUnhighlightedTextInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v6;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  NSRange *v12;
  uint64_t v13;
  const char *v14;
  __int128 v15;
  NSRange v16;

  length = a4.length;
  location = a4.location;
  v11 = 0;
  v12 = (NSRange *)&v11;
  v13 = 0x3010000000;
  v14 = "";
  v15 = xmmword_3146B0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1A3FB8;
  v10[3] = &unk_42AD48;
  v10[4] = &v11;
  -[THAnnotationCache enumerateAnnotationsForStorage:range:withBlock:](self, "enumerateAnnotationsForStorage:range:withBlock:", a3, a4.location, a4.length, v10);
  v16.location = location;
  v16.length = length;
  v6 = NSIntersectionRange(v16, v12[2]);
  v8 = location != v6.location || length != v6.length;
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (id)highlightAnnotationsSortedByRange
{
  id v3;
  NSEnumerator *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", self->_numberOfHighlightAnnotations);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSDictionary objectEnumerator](self->_annotationsByStorage, "objectEnumerator", 0);
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v9 = objc_msgSend(v3, "sortedArrayWithOptions:usingComparator:", 1, &stru_42AD68);

  return v9;
}

+ (id)annotationsOrderedForVisualStacking:(id)a3
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &stru_42AD88);
}

+ (id)sortAnnotationsByPageStorageRange:(id)a3
{
  return objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 1, &stru_42ADA8);
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (unint64_t)numberOfHighlightAnnotations
{
  return self->_numberOfHighlightAnnotations;
}

- (unint64_t)numberOfBookmarkAnnotations
{
  return self->_numberOfBookmarkAnnotations;
}

- (unint64_t)numberOfOrphanedAnnotations
{
  return self->_numberOfOrphanedAnnotations;
}

- (THAnnotation)temporaryAnnotation
{
  return self->_temporaryAnnotation;
}

- (NSArray)bookmarkAnnotations
{
  return self->_bookmarkAnnotations;
}

- (NSArray)orphanedAnnotations
{
  return self->_orphanedAnnotations;
}

- (NSIndexSet)bookmarkAbsolutePhysicalPageIndexSet
{
  return self->_bookmarkAbsolutePhysicalPageIndexSet;
}

@end

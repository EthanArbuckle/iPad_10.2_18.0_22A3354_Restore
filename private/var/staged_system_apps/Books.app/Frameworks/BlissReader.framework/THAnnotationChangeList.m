@implementation THAnnotationChangeList

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAnnotationChangeList;
  -[THAnnotationChangeList dealloc](&v3, "dealloc");
}

- (void)registerAnnotationAddedWithUUID:(id)a3 toContentNodeWithID:(id)a4
{
  TSUPair *v6;
  NSMutableSet *addedAnnotations;

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 36, CFSTR("invalid nil value for '%s'"), "annotationUUID");
    if (a4)
      return;
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 37, CFSTR("invalid nil value for '%s'"), "contentNodeID");
    return;
  }
  v6 = +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:");
  if (-[NSMutableSet containsObject:](self->_addedAnnotations, "containsObject:", v6))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 43, CFSTR("annotation shouldn't be added more than once"));
  addedAnnotations = self->_addedAnnotations;
  if (!addedAnnotations)
  {
    addedAnnotations = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_addedAnnotations = addedAnnotations;
  }
  -[NSMutableSet addObject:](addedAnnotations, "addObject:", v6);
  -[NSMutableSet removeObject:](self->_deletedAnnotations, "removeObject:", v6);
  if ((-[NSMutableSet containsObject:](self->_addedAnnotations, "containsObject:", v6) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 55, CFSTR("added annotation should be added"));
  if (-[NSMutableSet containsObject:](self->_deletedAnnotations, "containsObject:", v6))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 56, CFSTR("added annotation should not be deleted"));
  if (-[NSMutableSet containsObject:](self->_changedAnnotations, "containsObject:", v6))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 57, CFSTR("added annotation should not be changed"));
}

- (void)registerAnnotationDeletedWithUUID:(id)a3 fromContentNodeWithID:(id)a4
{
  TSUPair *v6;
  NSMutableSet *deletedAnnotations;

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 63, CFSTR("invalid nil value for '%s'"), "annotationUUID");
    if (a4)
      return;
    goto LABEL_14;
  }
  if (!a4)
  {
LABEL_14:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 64, CFSTR("invalid nil value for '%s'"), "contentNodeID");
    return;
  }
  v6 = +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:");
  if (-[NSMutableSet containsObject:](self->_deletedAnnotations, "containsObject:", v6))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 70, CFSTR("annotation shouldn't be deleted more than once"));
  deletedAnnotations = self->_deletedAnnotations;
  if (!deletedAnnotations)
  {
    deletedAnnotations = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_deletedAnnotations = deletedAnnotations;
  }
  -[NSMutableSet addObject:](deletedAnnotations, "addObject:", v6);
  -[NSMutableSet removeObject:](self->_addedAnnotations, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_changedAnnotations, "removeObject:", v6);
  if (-[NSMutableSet containsObject:](self->_addedAnnotations, "containsObject:", v6))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 83, CFSTR("deleted annotation should not be added"));
  if ((-[NSMutableSet containsObject:](self->_deletedAnnotations, "containsObject:", v6) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 84, CFSTR("deleted annotation should be deleted"));
  if (-[NSMutableSet containsObject:](self->_changedAnnotations, "containsObject:", v6))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 85, CFSTR("deleted annotation should not be changed"));
}

- (void)registerAnnotationChangedWithUUID:(id)a3 inContentNodeWithID:(id)a4
{
  TSUPair *v6;
  NSMutableSet *changedAnnotations;

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 91, CFSTR("invalid nil value for '%s'"), "annotationUUID");
    if (a4)
      return;
    goto LABEL_13;
  }
  if (!a4)
  {
LABEL_13:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 92, CFSTR("invalid nil value for '%s'"), "contentNodeID");
    return;
  }
  v6 = +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:");
  if ((-[NSMutableSet containsObject:](self->_addedAnnotations, "containsObject:", v6) & 1) == 0)
  {
    changedAnnotations = self->_changedAnnotations;
    if (!changedAnnotations)
    {
      changedAnnotations = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      self->_changedAnnotations = changedAnnotations;
    }
    -[NSMutableSet addObject:](changedAnnotations, "addObject:", v6);
    if (-[NSMutableSet containsObject:](self->_addedAnnotations, "containsObject:", v6))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 108, CFSTR("changed annotation should not be added"));
    if (-[NSMutableSet containsObject:](self->_deletedAnnotations, "containsObject:", v6))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 109, CFSTR("changed annotation should not be deleted"));
    if ((-[NSMutableSet containsObject:](self->_changedAnnotations, "containsObject:", v6) & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 110, CFSTR("changed annotation should be changed"));
  }
}

- (BOOL)isEmpty
{
  return !-[NSMutableSet count](self->_addedAnnotations, "count")
      && !-[NSMutableSet count](self->_deletedAnnotations, "count")
      && -[NSMutableSet count](self->_changedAnnotations, "count") == 0;
}

- (NSArray)changedContentNodeIDs
{
  id v3;
  NSMutableSet *addedAnnotations;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  NSMutableSet *deletedAnnotations;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  NSMutableSet *changedAnnotations;
  id v15;
  id v16;
  uint64_t v17;
  void *k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];

  v3 = +[NSMutableSet set](NSMutableSet, "set");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  addedAnnotations = self->_addedAnnotations;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](addedAnnotations, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(addedAnnotations);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "second"));
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](addedAnnotations, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  deletedAnnotations = self->_deletedAnnotations;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deletedAnnotations, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(deletedAnnotations);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "second"));
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deletedAnnotations, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v11);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  changedAnnotations = self->_changedAnnotations;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](changedAnnotations, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v16; k = (char *)k + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(changedAnnotations);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)k), "second"));
      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](changedAnnotations, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }
  return (NSArray *)objc_msgSend(v3, "allObjects");
}

- (id)addedAnnotationUUIDsForContentNodeID:(id)a3
{
  id v5;
  NSMutableSet *addedAnnotations;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (a3)
  {
    v5 = +[NSMutableSet set](NSMutableSet, "set");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    addedAnnotations = self->_addedAnnotations;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](addedAnnotations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(addedAnnotations);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(objc_msgSend(v11, "second"), "isEqualToString:", a3))
            objc_msgSend(v5, "addObject:", objc_msgSend(v11, "first"));
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](addedAnnotations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList addedAnnotationUUIDsForContentNodeID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 145, CFSTR("invalid nil value for '%s'"), "contentNodeID");
    v5 = +[NSMutableSet set](NSMutableSet, "set");
  }
  return objc_msgSend(v5, "allObjects");
}

- (id)deletedAnnotationUUIDsForContentNodeID:(id)a3
{
  id v5;
  NSMutableSet *deletedAnnotations;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (a3)
  {
    v5 = +[NSMutableSet set](NSMutableSet, "set");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    deletedAnnotations = self->_deletedAnnotations;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deletedAnnotations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(deletedAnnotations);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(objc_msgSend(v11, "second"), "isEqualToString:", a3))
            objc_msgSend(v5, "addObject:", objc_msgSend(v11, "first"));
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deletedAnnotations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList deletedAnnotationUUIDsForContentNodeID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 165, CFSTR("invalid nil value for '%s'"), "contentNodeID");
    v5 = +[NSMutableSet set](NSMutableSet, "set");
  }
  return objc_msgSend(v5, "allObjects");
}

- (id)changedAnnotationUUIDsForContentNodeID:(id)a3
{
  id v5;
  NSMutableSet *changedAnnotations;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (a3)
  {
    v5 = +[NSMutableSet set](NSMutableSet, "set");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    changedAnnotations = self->_changedAnnotations;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](changedAnnotations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(changedAnnotations);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(objc_msgSend(v11, "second"), "isEqualToString:", a3))
            objc_msgSend(v5, "addObject:", objc_msgSend(v11, "first"));
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](changedAnnotations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList changedAnnotationUUIDsForContentNodeID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"), 185, CFSTR("invalid nil value for '%s'"), "contentNodeID");
    v5 = +[NSMutableSet set](NSMutableSet, "set");
  }
  return objc_msgSend(v5, "allObjects");
}

@end
